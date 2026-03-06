package com.helpshift.campaigns.fragments;

import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import com.helpshift.R;
import com.helpshift.campaigns.delegates.CampaignsDelegateRouter;
import com.helpshift.campaigns.listeners.CampaignListFragmentListener;
import com.helpshift.campaigns.util.FragmentUtil;
import com.helpshift.model.InfoModelFactory;
import com.ironsource.sdk.constants.Constants;

/* JADX INFO: loaded from: classes.dex */
public class InboxFragment extends MainFragment implements CampaignListFragmentListener {
    public static final String LAUNCH_SOURCE = "launch_source";
    private String detailFragmentCampaignId;
    private boolean showDetailFragment;
    private Toolbar toolbar;

    public static class LaunchSource {
        public static final int APP_INBOX = 2;
        public static final int APP_SINGLE_MESSAGE = 3;
        public static final int PUSH = 1;
    }

    public static InboxFragment newInstance(Bundle bundle) {
        InboxFragment inboxFragment = new InboxFragment();
        inboxFragment.setArguments(bundle);
        return inboxFragment;
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.hs__campaign_inbox_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        showToolbarElevation(true);
    }

    @Override // com.helpshift.campaigns.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        this.toolbar = (Toolbar) getActivity(this).findViewById(R.id.toolbar);
        Bundle arguments = getArguments();
        int i = arguments != null ? arguments.getInt(LAUNCH_SOURCE, 0) : 0;
        if (arguments != null && (i == 1 || i == 3)) {
            if (isDualPane()) {
                loadListFragment();
            }
            this.detailFragmentCampaignId = arguments.getString(Constants.RequestParameters.CAMPAIGN_ID);
            loadDetailFragment(false);
        } else {
            loadListFragment();
            if (this.showDetailFragment) {
                loadDetailFragment(true);
            }
        }
        updateSelectCampaignView();
        Boolean bool = InfoModelFactory.getInstance().appInfoModel.disableHelpshiftBranding;
        if (bool == null || !bool.booleanValue()) {
            return;
        }
        ((ImageView) view.findViewById(R.id.hs_logo)).setVisibility(8);
    }

    @Override // androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
        if (isChangingConfigurations()) {
            return;
        }
        CampaignsDelegateRouter.sessionBegan();
    }

    @Override // com.helpshift.campaigns.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStop() {
        super.onStop();
        if (isChangingConfigurations()) {
            return;
        }
        CampaignsDelegateRouter.sessionEnded();
    }

    private void loadListFragment() {
        Fragment fragmentFindFragmentById = getRetainedChildFragmentManager().findFragmentById(R.id.inbox_fragment_container);
        if (fragmentFindFragmentById == null) {
            showCampaignListFragment();
        } else {
            if (!isTablet() || (fragmentFindFragmentById instanceof CampaignListFragment)) {
                return;
            }
            onBackPressed();
            showCampaignListFragment();
        }
    }

    private void showCampaignListFragment() {
        String name = CampaignListFragment.class.getName();
        FragmentUtil.startFragment(getRetainedChildFragmentManager(), R.id.inbox_fragment_container, CampaignListFragment.newInstance(), name, null, false);
    }

    private void loadDetailFragment(boolean z) {
        Bundle bundle = new Bundle();
        bundle.putString(Constants.RequestParameters.CAMPAIGN_ID, this.detailFragmentCampaignId);
        String name = CampaignDetailFragment.class.getName();
        if (getRetainedChildFragmentManager().findFragmentByTag(name) == null || isTablet()) {
            CampaignDetailFragment campaignDetailFragmentNewInstance = CampaignDetailFragment.newInstance(bundle);
            if (isDualPane()) {
                FragmentUtil.startFragment(getRetainedChildFragmentManager(), R.id.detail_fragment_container, campaignDetailFragmentNewInstance, name, null, false);
            } else {
                FragmentUtil.startFragment(getRetainedChildFragmentManager(), R.id.inbox_fragment_container, campaignDetailFragmentNewInstance, name, z ? InboxFragment.class.getName() : null, false);
            }
        }
    }

    public void updateSelectCampaignView() {
        View view = getView();
        View viewFindViewById = view != null ? view.findViewById(R.id.select_campaign_view) : null;
        if (!isDualPane() || viewFindViewById == null) {
            return;
        }
        if (this.showDetailFragment) {
            updateSelectCampaignView(false, viewFindViewById);
        } else {
            updateSelectCampaignView(true, viewFindViewById);
        }
    }

    public void updateSelectCampaignView(boolean z, View view) {
        if (view != null) {
            if (z) {
                view.setVisibility(0);
            } else {
                view.setVisibility(8);
            }
        }
    }

    public void setTitle(String str) {
        Toolbar toolbar = this.toolbar;
        if (toolbar != null) {
            toolbar.setTitle(str);
            return;
        }
        ActionBar supportActionBar = ((AppCompatActivity) getActivity(this)).getSupportActionBar();
        if (supportActionBar != null) {
            supportActionBar.setTitle(str);
        }
    }

    public boolean onBackPressed() {
        FragmentManager retainedChildFragmentManager = getRetainedChildFragmentManager();
        if (retainedChildFragmentManager.getBackStackEntryCount() <= 0) {
            return true;
        }
        retainedChildFragmentManager.popBackStack();
        return false;
    }

    @Override // com.helpshift.campaigns.listeners.CampaignListFragmentListener
    public void onCampaignClicked(String str) {
        this.showDetailFragment = true;
        this.detailFragmentCampaignId = str;
        loadDetailFragment(true);
        updateSelectCampaignView();
    }

    @Override // com.helpshift.campaigns.listeners.CampaignListFragmentListener
    public void onCampaignDelete(String str) {
        CampaignDetailFragment campaignDetailFragment;
        if (!isDualPane() || TextUtils.isEmpty(str) || !str.equals(this.detailFragmentCampaignId) || (campaignDetailFragment = (CampaignDetailFragment) getRetainedChildFragmentManager().findFragmentById(R.id.detail_fragment_container)) == null) {
            return;
        }
        FragmentUtil.removeFragment(getRetainedChildFragmentManager(), campaignDetailFragment);
        this.showDetailFragment = false;
        updateSelectCampaignView();
    }

    public boolean getShowDetailFragment() {
        return this.showDetailFragment;
    }

    public void setShowDetailFragment(boolean z) {
        this.showDetailFragment = z;
    }

    public void onContextMenuClosed(Menu menu) {
        CampaignListFragment campaignListFragment = (CampaignListFragment) getRetainedChildFragmentManager().findFragmentById(R.id.inbox_fragment_container);
        if (campaignListFragment != null) {
            campaignListFragment.onContextMenuClosed(menu);
        }
    }
}
