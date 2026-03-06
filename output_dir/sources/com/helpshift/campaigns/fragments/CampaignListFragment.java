package com.helpshift.campaigns.fragments;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.appcompat.widget.SearchView;
import androidx.recyclerview.widget.ItemTouchHelper;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.google.android.material.snackbar.Snackbar;
import com.helpshift.R;
import com.helpshift.campaigns.adapters.CampaignListAdapter;
import com.helpshift.campaigns.callbacks.CampaignListItemTouchHelperCallback;
import com.helpshift.campaigns.interactors.CampaignsListInteractor;
import com.helpshift.campaigns.listeners.CampaignListFragmentListener;
import com.helpshift.campaigns.observers.CampaignListPresenterObserver;
import com.helpshift.campaigns.presenters.CampaignListPresenter;
import com.helpshift.campaigns.storage.CampaignsStorageFactory;
import com.helpshift.campaigns.util.FragmentUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.Styles;
import com.helpshift.views.HSMenuItemCompat;
import com.helpshift.views.HSSnackbar;

/* JADX INFO: loaded from: classes.dex */
public class CampaignListFragment extends MainFragment implements CampaignListPresenterObserver {
    private static final String TAG = "Helpshift_CampaignList";
    CampaignListAdapter adapter;
    private TextView noCampaignsView;
    private View.OnClickListener onCampaignClickListener;
    CampaignListPresenter presenter;
    private boolean presenterSetup = false;
    MenuItem searchMenuItem;
    private SearchView searchView;
    private Snackbar undoSnackbar;

    public static CampaignListFragment newInstance() {
        return new CampaignListFragment();
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.presenter = new CampaignListPresenter(new CampaignsListInteractor(getContext(), CampaignsStorageFactory.getInstance().campaignStorage));
        InboxFragment inboxFragment = FragmentUtil.getInboxFragment(this);
        if (isDualPane() || (inboxFragment != null && !inboxFragment.getShowDetailFragment())) {
            this.presenter.setUp();
            this.presenter.addObserver(this);
        }
        this.presenterSetup = true;
        this.onCampaignClickListener = new View.OnClickListener() { // from class: com.helpshift.campaigns.fragments.CampaignListFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                String str = (String) view.getTag();
                if (HSMenuItemCompat.isActionViewExpanded(CampaignListFragment.this.searchMenuItem)) {
                    CampaignListFragment.this.presenter.setCampaignClickedFromSearchResult(true);
                    CampaignListFragment.this.presenter.setRetainSearchState(true);
                }
                CampaignListFragment.this.getCampaignListFragmentListener().onCampaignClicked(str);
            }
        };
        return layoutInflater.inflate(R.layout.hs__campaign_list_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        setToolbarTitle(getString(R.string.hs__cam_inbox));
        if (!this.presenterSetup) {
            this.presenter.setUp();
            this.presenter.addObserver(this);
        }
        this.presenter.cleanUpExpiredCampaigns();
        dataChanged();
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        dismissSnackbar();
        this.presenter.cleanUp();
        this.presenter.removeObserver(this);
        this.presenterSetup = false;
    }

    @Override // androidx.fragment.app.Fragment
    public boolean onContextItemSelected(MenuItem menuItem) {
        try {
            int menuItemPosition = this.adapter.getMenuItemPosition();
            int itemId = menuItem.getItemId();
            if (itemId == R.id.delete_campaign) {
                removeItem(menuItemPosition, false);
            } else if (itemId == R.id.mark_campaign_as_read) {
                this.adapter.markCampaignAsRead(menuItemPosition);
            }
            this.adapter.setMenuItemPosition(-1);
            return super.onContextItemSelected(menuItem);
        } catch (Exception unused) {
            return super.onContextItemSelected(menuItem);
        }
    }

    @Override // com.helpshift.campaigns.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        RecyclerView recyclerView = (RecyclerView) view.findViewById(R.id.inbox_list);
        recyclerView.setLayoutManager(new LinearLayoutManager(view.getContext()));
        CampaignListAdapter campaignListAdapter = new CampaignListAdapter(this.presenter, this.onCampaignClickListener);
        this.adapter = campaignListAdapter;
        recyclerView.setAdapter(campaignListAdapter);
        new ItemTouchHelper(new CampaignListItemTouchHelperCallback(getContext(), this)).attachToRecyclerView(recyclerView);
        this.noCampaignsView = (TextView) view.findViewById(R.id.view_no_campaigns);
        updateEmptyView();
        HSLogger.d(TAG, "Showing Campaigns list fragment");
    }

    @Override // com.helpshift.campaigns.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onStop() {
        MenuItem menuItem;
        super.onStop();
        if (isChangingConfigurations() && (menuItem = this.searchMenuItem) != null && HSMenuItemCompat.isActionViewExpanded(menuItem)) {
            this.presenter.setRetainSearchState(true);
        } else {
            if (!isDualPane() || isChangingConfigurations()) {
                return;
            }
            this.presenter.setRetainSearchState(false);
        }
    }

    @Override // com.helpshift.campaigns.fragments.MainFragment
    protected int getMenuResourceId() {
        return R.menu.hs__campaign_list_menu;
    }

    @Override // com.helpshift.campaigns.fragments.MainFragment
    protected void attachMenuListeners(Menu menu) {
        MenuItem menuItemFindItem = menu.findItem(R.id.hs__search);
        this.searchMenuItem = menuItemFindItem;
        SearchView searchView = (SearchView) HSMenuItemCompat.getActionView(menuItemFindItem);
        this.searchView = searchView;
        searchView.setOnQueryTextListener(this.presenter);
        HSMenuItemCompat.setOnActionExpandListener(this.searchMenuItem, this.presenter);
        Styles.setActionButtonIconColor(getContext(), this.searchMenuItem.getIcon());
        restoreSearchMenuItem();
    }

    void updateEmptyView() {
        if (this.presenter.getCountOfCampaigns() == 0) {
            this.noCampaignsView.setVisibility(0);
        } else {
            this.noCampaignsView.setVisibility(8);
        }
    }

    public void removeItem(final int i, boolean z) {
        getCampaignListFragmentListener().onCampaignDelete(this.presenter.getCampaignId(i));
        if (z) {
            Snackbar callback = HSSnackbar.make(getView(), R.string.hs__cam_message_deleted, 0).setAction(R.string.hs__cam_undo, new View.OnClickListener() { // from class: com.helpshift.campaigns.fragments.CampaignListFragment.3
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    CampaignListFragment.this.presenter.undoDeletedCampaign();
                    CampaignListFragment.this.adapter.notifyItemInserted(i);
                    CampaignListFragment.this.updateEmptyView();
                }
            }).setCallback(new Snackbar.Callback() { // from class: com.helpshift.campaigns.fragments.CampaignListFragment.2
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.google.android.material.snackbar.Snackbar.Callback, com.google.android.material.snackbar.BaseTransientBottomBar.BaseCallback
                public void onDismissed(Snackbar snackbar, int i2) {
                    super.onDismissed(snackbar, i2);
                    if (i2 == 1 || i2 == 4) {
                        return;
                    }
                    CampaignListFragment.this.presenter.undoTimedOut();
                }
            });
            this.undoSnackbar = callback;
            callback.show();
        }
        this.adapter.removeItem(i, z);
        updateEmptyView();
    }

    private void restoreSearchMenuItem() {
        if (this.presenter.getRetainSearchState()) {
            setSearchMenuQuery(this.presenter.getCurrentQuery());
            this.presenter.setRetainSearchState(false);
        }
    }

    public void setSearchMenuQuery(String str) {
        if (!HSMenuItemCompat.isActionViewExpanded(this.searchMenuItem)) {
            HSMenuItemCompat.expandActionView(this.searchMenuItem);
        }
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.searchView.setQuery(str, false);
    }

    public void onContextMenuClosed(Menu menu) {
        this.adapter.setMenuItemPosition(-1);
    }

    public int getMenuItemPosition() {
        return this.adapter.getMenuItemPosition();
    }

    @Override // com.helpshift.campaigns.observers.CampaignListPresenterObserver
    public void dataChanged() {
        new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.helpshift.campaigns.fragments.CampaignListFragment.4
            @Override // java.lang.Runnable
            public void run() {
                CampaignListFragment.this.adapter.notifyDataSetChanged();
                CampaignListFragment.this.updateEmptyView();
            }
        });
    }

    @Override // com.helpshift.campaigns.observers.CampaignListPresenterObserver
    public void searchActionStarted() {
        dismissSnackbar();
    }

    @Override // com.helpshift.campaigns.observers.CampaignListPresenterObserver
    public void performedSearch() {
        dismissSnackbar();
    }

    @Override // com.helpshift.campaigns.observers.CampaignListPresenterObserver
    public void searchActionStopped() {
        dismissSnackbar();
    }

    private void dismissSnackbar() {
        Snackbar snackbar = this.undoSnackbar;
        if (snackbar == null || !snackbar.isShown()) {
            return;
        }
        this.undoSnackbar.dismiss();
    }

    CampaignListFragmentListener getCampaignListFragmentListener() {
        return (CampaignListFragmentListener) getParentFragment();
    }
}
