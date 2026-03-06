package com.helpshift.support.controllers;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.MenuItem;
import androidx.appcompat.widget.SearchView;
import androidx.core.view.MenuItemCompat;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import com.helpshift.R;
import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.support.compositions.FaqFragment;
import com.helpshift.support.compositions.SectionPagerFragment;
import com.helpshift.support.contracts.FaqFlowView;
import com.helpshift.support.contracts.FaqFragmentListener;
import com.helpshift.support.conversations.NewConversationFragment;
import com.helpshift.support.fragments.QuestionListFragment;
import com.helpshift.support.fragments.SearchFragment;
import com.helpshift.support.fragments.SingleQuestionFragment;
import com.helpshift.support.fragments.SupportFragment;
import com.helpshift.support.util.FragmentUtil;
import com.helpshift.support.util.Styles;
import com.helpshift.util.HelpshiftConnectionUtil;
import com.helpshift.util.HelpshiftContext;
import java.util.ArrayList;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public class FaqFlowController implements FaqFragmentListener, MenuItemCompat.OnActionExpandListener, MenuItem.OnActionExpandListener, SearchView.OnQueryTextListener {
    private final Bundle bundle;
    private final FaqFlowView faqFlowView;
    private FragmentManager fragmentManager;
    private boolean isControllerStarted;
    private final boolean isScreenLarge;
    private boolean retainSearchFragmentState;
    private final String KEY_FAQ_CONTROLLER_STARTED_STATE = "key_faq_controller_state";
    private String currentQuery = "";
    private String lastQuery = "";

    @Override // androidx.appcompat.widget.SearchView.OnQueryTextListener
    public boolean onQueryTextSubmit(String str) {
        return false;
    }

    public FaqFlowController(FaqFlowView faqFlowView, Context context, FragmentManager fragmentManager, Bundle bundle) {
        this.faqFlowView = faqFlowView;
        this.isScreenLarge = Styles.isTablet(context);
        this.fragmentManager = fragmentManager;
        this.bundle = bundle;
    }

    public void onFragmentManagerUpdate(FragmentManager fragmentManager) {
        this.fragmentManager = fragmentManager;
    }

    public void start() {
        if (!this.isControllerStarted) {
            int i = this.bundle.getInt(SupportFragment.SUPPORT_MODE, 0);
            if (i == 2) {
                startQuestionListFragment();
            } else if (i == 3) {
                startSingleQuestionFragment();
            } else {
                startFaqFragment();
            }
        }
        this.isControllerStarted = true;
    }

    private void startFaqFragment() {
        FragmentUtil.startFragmentWithoutBackStack(this.fragmentManager, R.id.list_fragment_container, FaqFragment.newInstance(this.bundle), null, true);
    }

    private void startQuestionListFragment() {
        FragmentUtil.startFragmentWithoutBackStack(this.fragmentManager, R.id.list_fragment_container, QuestionListFragment.newInstance(this.bundle), null, false);
    }

    private void startSingleQuestionFragment() {
        int i = R.id.list_fragment_container;
        if (this.isScreenLarge) {
            i = R.id.single_question_container;
        }
        this.faqFlowView.getSupportFragment().getSupportController().setSearchPerformed(true);
        FragmentUtil.startFragmentWithoutBackStack(this.fragmentManager, i, SingleQuestionFragment.newInstance(this.bundle, 1, this.isScreenLarge, null), null, false);
    }

    public void setRetainSearchFragmentState(boolean z) {
        this.retainSearchFragmentState = z;
    }

    @Override // com.helpshift.support.contracts.FaqFragmentListener
    public void onSectionSelected(Bundle bundle) {
        if (this.isScreenLarge) {
            FragmentUtil.startFragmentWithBackStack(this.fragmentManager, R.id.list_fragment_container, QuestionListFragment.newInstance(bundle), null, false);
        } else {
            FragmentUtil.startFragmentWithBackStack(this.fragmentManager, R.id.list_fragment_container, SectionPagerFragment.newInstance(bundle), null, false);
        }
    }

    @Override // com.helpshift.support.contracts.FaqFragmentListener
    public void onQuestionSelected(String str, ArrayList<String> arrayList) {
        performedSearch();
        this.faqFlowView.getSupportFragment().getSupportController().setSearchPerformed(true);
        Bundle bundle = new Bundle();
        bundle.putString(SingleQuestionFragment.BUNDLE_ARG_QUESTION_PUBLISH_ID, str);
        bundle.putStringArrayList("searchTerms", arrayList);
        if (this.isScreenLarge) {
            FragmentUtil.startFragmentWithoutBackStack(this.fragmentManager, R.id.details_fragment_container, SingleQuestionFragment.newInstance(bundle, 1, false, null), null, false);
        } else {
            FragmentUtil.startFragmentWithBackStack(this.fragmentManager, R.id.list_fragment_container, SingleQuestionFragment.newInstance(bundle, 1, false, null), null, false);
        }
    }

    @Override // com.helpshift.support.contracts.FaqFragmentListener
    public void onContactUsClicked(String str) {
        setRetainSearchFragmentState(true);
        performedSearch();
        this.faqFlowView.getSupportFragment().getSupportController().onContactUsClicked(str);
    }

    @Override // androidx.core.view.MenuItemCompat.OnActionExpandListener, android.view.MenuItem.OnActionExpandListener
    public boolean onMenuItemActionExpand(MenuItem menuItem) {
        if (((SearchFragment) this.fragmentManager.findFragmentByTag(SearchFragment.TAG)) != null) {
            return true;
        }
        FragmentUtil.startFragmentWithBackStack(this.fragmentManager, R.id.list_fragment_container, SearchFragment.newInstance(this.bundle), SearchFragment.TAG, false);
        return true;
    }

    @Override // androidx.core.view.MenuItemCompat.OnActionExpandListener, android.view.MenuItem.OnActionExpandListener
    public boolean onMenuItemActionCollapse(MenuItem menuItem) {
        performedSearch();
        if (this.retainSearchFragmentState) {
            return true;
        }
        this.lastQuery = "";
        this.currentQuery = "";
        FragmentUtil.popBackStack(this.fragmentManager, SearchFragment.class.getName());
        return true;
    }

    @Override // androidx.appcompat.widget.SearchView.OnQueryTextListener
    public boolean onQueryTextChange(String str) {
        if (TextUtils.isEmpty(str) && this.currentQuery.length() > 2) {
            performedSearch();
        }
        this.currentQuery = str;
        return onQuery(str);
    }

    private boolean onQuery(String str) {
        SearchFragment searchFragment;
        if (this.retainSearchFragmentState || (searchFragment = (SearchFragment) this.fragmentManager.findFragmentByTag(SearchFragment.TAG)) == null) {
            return false;
        }
        searchFragment.onQuery(str, this.bundle.getString("sectionPublishId"));
        return true;
    }

    public void performedSearch() {
        int numberOfSearchResults;
        if (TextUtils.isEmpty(this.currentQuery.trim()) || this.lastQuery.equals(this.currentQuery)) {
            return;
        }
        this.faqFlowView.getSupportFragment().getSupportController().setSearchPerformed(true);
        this.bundle.putBoolean(NewConversationFragment.SEARCH_PERFORMED, true);
        SearchFragment searchFragment = (SearchFragment) this.fragmentManager.findFragmentByTag(SearchFragment.TAG);
        if (searchFragment == null || (numberOfSearchResults = searchFragment.getNumberOfSearchResults()) < 0) {
            return;
        }
        HashMap map = new HashMap();
        map.put("s", this.currentQuery);
        map.put("n", Integer.valueOf(numberOfSearchResults));
        map.put("nt", Boolean.valueOf(HelpshiftConnectionUtil.isOnline(HelpshiftContext.getApplicationContext())));
        HelpshiftContext.getCoreApi().getAnalyticsEventDM().pushEvent(AnalyticsEventType.PERFORMED_SEARCH, map);
        this.lastQuery = this.currentQuery;
    }

    public void onSaveInstanceState(Bundle bundle) {
        bundle.putBoolean("key_faq_controller_state", this.isControllerStarted);
    }

    public void onViewStateRestored(Bundle bundle) {
        if (this.isControllerStarted || !bundle.containsKey("key_faq_controller_state")) {
            return;
        }
        this.isControllerStarted = bundle.getBoolean("key_faq_controller_state");
    }

    Fragment getTopMostFaqFragment() {
        return FragmentUtil.getTopMostFragment(this.fragmentManager);
    }
}
