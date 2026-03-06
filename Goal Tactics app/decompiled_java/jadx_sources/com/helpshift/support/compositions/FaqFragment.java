package com.helpshift.support.compositions;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.helpshift.R;
import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.common.exception.ExceptionType;
import com.helpshift.support.Faq;
import com.helpshift.support.FaqTagFilter;
import com.helpshift.support.HSApiData;
import com.helpshift.support.Section;
import com.helpshift.support.constants.GetSectionsCallBackStatus;
import com.helpshift.support.contracts.FaqFlowViewParent;
import com.helpshift.support.contracts.FaqFragmentListener;
import com.helpshift.support.fragments.FaqFlowFragment;
import com.helpshift.support.fragments.MainFragment;
import com.helpshift.support.fragments.QuestionListFragment;
import com.helpshift.support.fragments.SectionListFragment;
import com.helpshift.support.fragments.SupportFragment;
import com.helpshift.support.util.FragmentUtil;
import com.helpshift.support.util.SnackbarUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class FaqFragment extends MainFragment implements FaqFlowViewParent {
    private static final String TAG = "Helpshift_FaqFragment";
    private HSApiData data;
    private FaqTagFilter faqTagFilter;
    boolean isDataUpdatePending;
    int sectionsSize = 0;

    public static class FaqLoadingStatus {
        public static final int ERROR = 3;
        public static final int HIDE = 1;
        public static final int IN_PROGRESS = 0;
        public static final int NO_FAQS = 2;
    }

    @Override // com.helpshift.support.fragments.MainFragment
    public boolean shouldRefreshMenu() {
        return true;
    }

    public static FaqFragment newInstance(Bundle bundle) {
        FaqFragment faqFragment = new FaqFragment();
        faqFragment.setArguments(bundle);
        return faqFragment;
    }

    @Override // com.helpshift.support.contracts.FaqFlowViewParent
    public FaqFragmentListener getFaqFlowListener() {
        return ((FaqFlowViewParent) getParentFragment()).getFaqFlowListener();
    }

    void updateFragment(FaqFragment faqFragment, ArrayList<Section> arrayList) {
        sendFaqLoadedEvent();
        if (faqFragment.getRetainedChildFragmentManager().findFragmentById(R.id.faq_fragment_container) == null || this.isDataUpdatePending) {
            ArrayList<Section> populatedSections = faqFragment.data.getPopulatedSections(arrayList, faqFragment.faqTagFilter);
            try {
                if (populatedSections.size() == 1) {
                    Bundle bundle = new Bundle();
                    bundle.putString("sectionPublishId", populatedSections.get(0).getPublishId());
                    bundle.putSerializable("withTagsMatching", getArguments().getSerializable("withTagsMatching"));
                    FragmentUtil.startFragment(faqFragment.getRetainedChildFragmentManager(), R.id.faq_fragment_container, QuestionListFragment.newInstance(bundle), null, null, false, this.isDataUpdatePending);
                    this.isDataUpdatePending = false;
                } else {
                    Bundle bundle2 = new Bundle();
                    bundle2.putParcelableArrayList("sections", populatedSections);
                    bundle2.putSerializable("withTagsMatching", getArguments().getSerializable("withTagsMatching"));
                    FragmentUtil.startFragment(faqFragment.getRetainedChildFragmentManager(), R.id.faq_fragment_container, SectionListFragment.newInstance(bundle2), null, null, false, this.isDataUpdatePending);
                    this.isDataUpdatePending = false;
                }
            } catch (IllegalStateException unused) {
            }
        }
    }

    private void sendFaqLoadedEvent() {
        SupportFragment supportFragment = FragmentUtil.getSupportFragment(this);
        if (supportFragment != null) {
            supportFragment.onFaqsLoaded();
        }
    }

    public void updateFaqLoadingUI(int i) {
        FaqFlowFragment faqFlowFragment = (FaqFlowFragment) getParentFragment();
        SupportFragment supportFragment = faqFlowFragment != null ? (SupportFragment) faqFlowFragment.getParentFragment() : null;
        if (supportFragment != null) {
            if (i == 1) {
                faqFlowFragment.showVerticalDivider(true);
                faqFlowFragment.updateSelectQuestionUI();
            } else {
                faqFlowFragment.showVerticalDivider(false);
                faqFlowFragment.updateSelectQuestionUI(false);
            }
            supportFragment.updateFaqLoadingUI(i);
        }
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
        return layoutInflater.inflate(R.layout.hs__faq_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        setToolbarTitle(getString(R.string.hs__help_header));
        if (this.sectionsSize == 0) {
            updateFaqLoadingUI(0);
        }
        this.data.getSections(new Success(this), new Failure(this), this.faqTagFilter);
        if (isChangingConfigurations()) {
            return;
        }
        HelpshiftContext.getCoreApi().getAnalyticsEventDM().pushEvent(AnalyticsEventType.SUPPORT_LAUNCH);
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroyView() {
        SnackbarUtil.hideSnackbar(getView());
        super.onDestroyView();
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        try {
            super.onAttach(context);
            this.data = new HSApiData(context);
        } catch (Exception e) {
            Log.e(TAG, "Caught exception in FaqFragment.onAttach()", e);
        }
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStop() {
        super.onStop();
        updateFaqLoadingUI(1);
    }

    public void retryGetSections() {
        if (this.sectionsSize == 0) {
            updateFaqLoadingUI(0);
        }
        this.data.getSections(new Success(this), new Failure(this), this.faqTagFilter);
    }

    ArrayList<Section> removeEmptySections(ArrayList<Section> arrayList) {
        ArrayList<Section> arrayList2 = new ArrayList<>();
        for (Section section : arrayList) {
            ArrayList<Faq> faqsForSection = this.data.getFaqsForSection(section.getPublishId(), this.faqTagFilter);
            if (faqsForSection != null && !faqsForSection.isEmpty()) {
                arrayList2.add(section);
            }
        }
        return arrayList2;
    }

    private static class Success extends Handler {
        private final WeakReference<FaqFragment> faqFragmentWeakReference;

        public Success(FaqFragment faqFragment) {
            this.faqFragmentWeakReference = new WeakReference<>(faqFragment);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            FaqFragment faqFragment = this.faqFragmentWeakReference.get();
            if (faqFragment == null || faqFragment.getHost() == null || faqFragment.isDetached()) {
                return;
            }
            ArrayList<Section> arrayListRemoveEmptySections = (ArrayList) message.obj;
            int i = message.what;
            if (arrayListRemoveEmptySections != null) {
                arrayListRemoveEmptySections = faqFragment.removeEmptySections(arrayListRemoveEmptySections);
                faqFragment.sectionsSize = arrayListRemoveEmptySections.size();
            }
            if (i == GetSectionsCallBackStatus.DATABASE_SUCCESS) {
                if (faqFragment.sectionsSize != 0) {
                    faqFragment.updateFaqLoadingUI(1);
                    faqFragment.updateFragment(faqFragment, arrayListRemoveEmptySections);
                }
            } else if (i == GetSectionsCallBackStatus.API_SUCCESS_NEW_DATA) {
                if (faqFragment.sectionsSize == 0) {
                    faqFragment.updateFaqLoadingUI(2);
                } else {
                    faqFragment.isDataUpdatePending = true;
                    faqFragment.updateFaqLoadingUI(1);
                    faqFragment.updateFragment(faqFragment, arrayListRemoveEmptySections);
                }
            } else if (i == GetSectionsCallBackStatus.API_SUCCESS_NO_NEW_DATA && faqFragment.sectionsSize == 0) {
                faqFragment.updateFaqLoadingUI(2);
            }
            HSLogger.d(FaqFragment.TAG, "Faq loaded with " + faqFragment.sectionsSize + " sections");
        }
    }

    private static class Failure extends Handler {
        private final WeakReference<FaqFragment> faqFragmentWeakReference;

        public Failure(FaqFragment faqFragment) {
            this.faqFragmentWeakReference = new WeakReference<>(faqFragment);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            FaqFragment faqFragment = this.faqFragmentWeakReference.get();
            if (faqFragment == null || faqFragment.getHost() == null || faqFragment.isDetached()) {
                return;
            }
            int i = message.what;
            ExceptionType exceptionType = message.obj instanceof ExceptionType ? (ExceptionType) message.obj : null;
            if (faqFragment.sectionsSize == 0) {
                if (i == GetSectionsCallBackStatus.API_FAILURE_CONTENT_UNCHANGED) {
                    faqFragment.updateFaqLoadingUI(2);
                    return;
                } else {
                    faqFragment.updateFaqLoadingUI(3);
                    SnackbarUtil.showSnackbar(exceptionType, faqFragment.getView());
                    return;
                }
            }
            faqFragment.updateFaqLoadingUI(1);
        }
    }
}
