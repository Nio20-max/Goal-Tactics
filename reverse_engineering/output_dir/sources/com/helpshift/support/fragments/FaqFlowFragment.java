package com.helpshift.support.fragments;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.helpshift.R;
import com.helpshift.support.compositions.FaqFragment;
import com.helpshift.support.contracts.FaqFlowView;
import com.helpshift.support.contracts.FaqFragmentListener;
import com.helpshift.support.controllers.FaqFlowController;
import com.helpshift.support.flows.CustomContactUsFlowListHolder;
import com.helpshift.support.flows.Flow;
import com.helpshift.support.util.FragmentUtil;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class FaqFlowFragment extends MainFragment implements FaqFlowView {
    public static final String FRAGMENT_TAG = "Helpshift_FaqFlowFrag";
    private List<Flow> customContactUsFlows;
    private FaqFlowController faqFlowController;
    private View selectQuestionView;
    private View verticalDivider;

    @Override // com.helpshift.support.fragments.MainFragment
    public boolean shouldRefreshMenu() {
        return false;
    }

    public static FaqFlowFragment newInstance(Bundle bundle, List<Flow> list) {
        FaqFlowFragment faqFlowFragment = new FaqFlowFragment();
        faqFlowFragment.setArguments(bundle);
        faqFlowFragment.customContactUsFlows = list;
        return faqFlowFragment;
    }

    public FaqFlowController getFaqFlowController() {
        return this.faqFlowController;
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        try {
            super.onAttach(context);
            FaqFlowController faqFlowController = this.faqFlowController;
            if (faqFlowController == null) {
                this.faqFlowController = new FaqFlowController(this, context, getRetainedChildFragmentManager(), getArguments());
            } else {
                faqFlowController.onFragmentManagerUpdate(getRetainedChildFragmentManager());
            }
        } catch (Exception e) {
            Log.e(FRAGMENT_TAG, "Caught exception in FaqFlowFragment.onAttach()", e);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.hs__faq_flow_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.verticalDivider = view.findViewById(R.id.vertical_divider);
        this.selectQuestionView = view.findViewById(R.id.select_question_view);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewStateRestored(Bundle bundle) {
        FaqFlowController faqFlowController;
        super.onViewStateRestored(bundle);
        if (bundle == null || (faqFlowController = this.faqFlowController) == null) {
            return;
        }
        faqFlowController.onViewStateRestored(bundle);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        CustomContactUsFlowListHolder.setFlowList(this.customContactUsFlows);
        getSupportFragment().setSearchListeners(this.faqFlowController);
        this.faqFlowController.start();
        updateSelectQuestionUI();
    }

    @Override // androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        FaqFlowController faqFlowController = this.faqFlowController;
        if (faqFlowController != null) {
            faqFlowController.onSaveInstanceState(bundle);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        this.faqFlowController = null;
        this.verticalDivider = null;
        this.selectQuestionView = null;
        getSupportFragment().unRegisterSearchListener();
    }

    public void updateSelectQuestionUI() {
        if (!isScreenLarge() || this.selectQuestionView == null) {
            return;
        }
        if (getRetainedChildFragmentManager().findFragmentById(R.id.details_fragment_container) == null) {
            updateSelectQuestionUI(true);
        } else {
            updateSelectQuestionUI(false);
        }
    }

    public void updateSelectQuestionUI(boolean z) {
        View view = this.selectQuestionView;
        if (view != null) {
            if (z) {
                view.setVisibility(0);
            } else {
                view.setVisibility(8);
            }
        }
    }

    @Override // com.helpshift.support.contracts.FaqFlowView
    public SupportFragment getSupportFragment() {
        return (SupportFragment) getParentFragment();
    }

    @Override // com.helpshift.support.contracts.FaqFlowViewParent
    public FaqFragmentListener getFaqFlowListener() {
        return getFaqFlowController();
    }

    public void showVerticalDivider(boolean z) {
        View view = this.verticalDivider;
        if (view != null) {
            if (z) {
                view.setVisibility(0);
            } else {
                view.setVisibility(8);
            }
        }
    }

    public void retryGetSections() {
        FaqFragment faqFragment = FragmentUtil.getFaqFragment(getRetainedChildFragmentManager());
        if (faqFragment != null) {
            faqFragment.retryGetSections();
        }
    }

    public List<Flow> getCustomContactUsFlows() {
        return this.customContactUsFlows;
    }
}
