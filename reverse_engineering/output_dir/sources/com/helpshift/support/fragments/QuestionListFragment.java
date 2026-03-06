package com.helpshift.support.fragments;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.common.exception.ExceptionType;
import com.helpshift.support.Faq;
import com.helpshift.support.FaqTagFilter;
import com.helpshift.support.HSApiData;
import com.helpshift.support.Section;
import com.helpshift.support.adapters.QuestionListAdapter;
import com.helpshift.support.constants.GetSectionsCallBackStatus;
import com.helpshift.support.contracts.FaqFlowViewParent;
import com.helpshift.support.contracts.FaqFragmentListener;
import com.helpshift.support.util.FragmentUtil;
import com.helpshift.support.util.SnackbarUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class QuestionListFragment extends MainFragment {
    private static final String TAG = "Helpshift_QstnListFrag";
    private HSApiData data;
    private FaqTagFilter faqTagFilter;
    private View.OnClickListener onQuestionClickedListener;
    private RecyclerView questionList;
    private String sectionId;
    private String sectionTitle;
    private boolean eventSent = false;
    private boolean isConfigurationChanged = false;

    public static QuestionListFragment newInstance(Bundle bundle) {
        QuestionListFragment questionListFragment = new QuestionListFragment();
        questionListFragment.setArguments(bundle);
        return questionListFragment;
    }

    public FaqFragmentListener getFaqFlowListener() {
        return ((FaqFlowViewParent) getParentFragment()).getFaqFlowListener();
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        try {
            super.onAttach(context);
            this.data = new HSApiData(context);
            this.sectionTitle = getString(R.string.hs__help_header);
        } catch (Exception e) {
            Log.e(TAG, "Caught exception in QuestionListFragment.onAttach()", e);
        }
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
        this.isConfigurationChanged = isChangingConfigurations();
        this.eventSent = false;
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStop() {
        if (isScreenLarge()) {
            setToolbarTitle(getString(R.string.hs__help_header));
        }
        super.onStop();
    }

    @Override // com.helpshift.support.fragments.MainFragment
    public boolean shouldRefreshMenu() {
        return getParentFragment() instanceof FaqFlowFragment;
    }

    void updateSectionData(Section section) {
        if (this.questionList == null) {
            return;
        }
        ArrayList<Faq> faqsForSection = this.data.getFaqsForSection(section.getPublishId(), this.faqTagFilter);
        if (faqsForSection == null || faqsForSection.isEmpty()) {
            if (isDetached()) {
                return;
            }
            SnackbarUtil.showErrorSnackbar(103, getView());
            return;
        }
        this.questionList.setAdapter(new QuestionListAdapter(faqsForSection, this.onQuestionClickedListener));
        SupportFragment supportFragment = FragmentUtil.getSupportFragment(this);
        if (supportFragment != null) {
            supportFragment.onFaqsLoaded();
        }
        if (TextUtils.isEmpty(this.sectionId)) {
            getSectionId(getArguments().getString("sectionPublishId"));
        }
        pushAnalyticEvent();
    }

    private String getSectionTitle(String str) {
        Section section = this.data.getSection(str);
        if (section != null) {
            return section.getTitle();
        }
        return null;
    }

    private void getSectionId(String str) {
        Section section = this.data.getSection(str);
        if (section != null) {
            this.sectionId = section.getSectionId();
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void setUserVisibleHint(boolean z) {
        super.setUserVisibleHint(z);
        pushAnalyticEvent();
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Bundle arguments = getArguments();
        if (arguments != null) {
            this.faqTagFilter = (FaqTagFilter) arguments.getSerializable("withTagsMatching");
        }
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.hs__question_list_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        RecyclerView recyclerView = (RecyclerView) view.findViewById(R.id.question_list);
        this.questionList = recyclerView;
        recyclerView.setLayoutManager(new LinearLayoutManager(view.getContext()));
        this.onQuestionClickedListener = new View.OnClickListener() { // from class: com.helpshift.support.fragments.QuestionListFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                QuestionListFragment.this.getFaqFlowListener().onQuestionSelected((String) view2.getTag(), null);
            }
        };
        String string = getArguments().getString("sectionPublishId");
        if (isScreenLarge()) {
            String sectionTitle = getSectionTitle(string);
            if (!TextUtils.isEmpty(sectionTitle)) {
                this.sectionTitle = sectionTitle;
            }
        }
        SectionSuccessHandler sectionSuccessHandler = new SectionSuccessHandler(this);
        SectionFailureHandler sectionFailureHandler = new SectionFailureHandler(this);
        if (getArguments().getInt(SupportFragment.SUPPORT_MODE, 0) == 2) {
            this.data.getSection(string, sectionSuccessHandler, sectionFailureHandler, this.faqTagFilter);
        } else {
            this.data.getSectionSync(string, sectionSuccessHandler, sectionFailureHandler);
        }
        HSLogger.d(TAG, "FAQ section loaded : Name : " + this.sectionTitle);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        setToolbarTitle(getString(R.string.hs__help_header));
        if (isScreenLarge()) {
            setToolbarTitle(this.sectionTitle);
            Fragment parentFragment = getParentFragment();
            if (parentFragment instanceof FaqFlowFragment) {
                ((FaqFlowFragment) parentFragment).showVerticalDivider(true);
            }
        }
        pushAnalyticEvent();
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        SnackbarUtil.hideSnackbar(getView());
        this.questionList.setAdapter(null);
        this.questionList = null;
        super.onDestroyView();
    }

    private void pushAnalyticEvent() {
        if (!getUserVisibleHint() || this.eventSent || this.isConfigurationChanged || TextUtils.isEmpty(this.sectionId)) {
            return;
        }
        HelpshiftContext.getCoreApi().getAnalyticsEventDM().pushEvent(AnalyticsEventType.BROWSED_FAQ_LIST, this.sectionId);
        this.eventSent = true;
    }

    private static class SectionSuccessHandler extends Handler {
        private final WeakReference<QuestionListFragment> questionListFragmentWeakReference;

        public SectionSuccessHandler(QuestionListFragment questionListFragment) {
            this.questionListFragmentWeakReference = new WeakReference<>(questionListFragment);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            QuestionListFragment questionListFragment = this.questionListFragmentWeakReference.get();
            if (questionListFragment == null || questionListFragment.isDetached()) {
                return;
            }
            if (message.obj == null) {
                RecyclerView recyclerView = questionListFragment.questionList;
                if (recyclerView == null || recyclerView.getAdapter() == null || recyclerView.getAdapter().getItemCount() == 0) {
                    SnackbarUtil.showErrorSnackbar(103, questionListFragment.getView());
                    return;
                }
                return;
            }
            Section section = (Section) message.obj;
            questionListFragment.updateSectionData(section);
            HSLogger.d(QuestionListFragment.TAG, "FAQ section loaded : SectionSuccessHandler : " + section.getTitle());
        }
    }

    private static class SectionFailureHandler extends Handler {
        private final WeakReference<QuestionListFragment> questionListFragmentWeakReference;

        public SectionFailureHandler(QuestionListFragment questionListFragment) {
            this.questionListFragmentWeakReference = new WeakReference<>(questionListFragment);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            QuestionListFragment questionListFragment = this.questionListFragmentWeakReference.get();
            if (questionListFragment == null || questionListFragment.isDetached()) {
                return;
            }
            RecyclerView recyclerView = questionListFragment.questionList;
            if (recyclerView == null || recyclerView.getAdapter() == null || recyclerView.getAdapter().getItemCount() == 0) {
                ExceptionType exceptionType = message.obj instanceof ExceptionType ? (ExceptionType) message.obj : null;
                if (exceptionType == null || message.what == GetSectionsCallBackStatus.API_FAILURE_CONTENT_UNCHANGED) {
                    SnackbarUtil.showErrorSnackbar(103, questionListFragment.getView());
                } else {
                    SnackbarUtil.showSnackbar(exceptionType, questionListFragment.getView());
                }
            }
        }
    }
}
