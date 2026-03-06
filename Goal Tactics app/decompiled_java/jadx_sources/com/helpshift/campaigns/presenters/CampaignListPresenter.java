package com.helpshift.campaigns.presenters;

import android.graphics.Bitmap;
import android.text.TextUtils;
import android.view.MenuItem;
import androidx.appcompat.widget.SearchView;
import androidx.core.view.MenuItemCompat;
import com.helpshift.R;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.interactors.CampaignsListInteractor;
import com.helpshift.campaigns.models.CampaignDetailModel;
import com.helpshift.campaigns.observers.CampaignListObserver;
import com.helpshift.campaigns.observers.CampaignListPresenterObserver;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.ImageUtil;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class CampaignListPresenter implements CampaignListObserver, SearchView.OnQueryTextListener, MenuItemCompat.OnActionExpandListener, MenuItem.OnActionExpandListener {
    private static boolean campaignClickedFromSearchResult;
    private static String currentQuery;
    private static boolean retainSearchState;
    private final CampaignsListInteractor campaignListInteractor;
    private List<CampaignListPresenterObserver> observers = new ArrayList();

    @Override // androidx.appcompat.widget.SearchView.OnQueryTextListener
    public boolean onQueryTextSubmit(String str) {
        return false;
    }

    public CampaignListPresenter(CampaignsListInteractor campaignsListInteractor) {
        this.campaignListInteractor = campaignsListInteractor;
    }

    public int getCountOfCampaigns() {
        return this.campaignListInteractor.getCountOfCampaigns();
    }

    public String getTitle(int i) {
        CampaignDetailModel campaign = this.campaignListInteractor.getCampaign(i);
        return campaign != null ? campaign.getTitle() : "";
    }

    public String getCampaignId(int i) {
        CampaignDetailModel campaign = this.campaignListInteractor.getCampaign(i);
        return campaign != null ? campaign.getIdentifier() : "";
    }

    public HashMap<String, Object> getIconImage(int i) {
        Bitmap bitmap;
        String str;
        HashMap<String, Object> map = new HashMap<>();
        CampaignDetailModel campaign = this.campaignListInteractor.getCampaign(i);
        if (campaign != null) {
            bitmap = ImageUtil.getBitmap(campaign.iconImageFilePath, -1);
            str = campaign.iconImageUrl;
        } else {
            bitmap = null;
            str = "";
        }
        if (bitmap == null) {
            map.put("default", true);
            bitmap = ImageUtil.getBitmap(HelpshiftContext.getApplicationContext().getResources(), R.drawable.hs__cam_inbox_default_icon, -1);
            if (campaign != null && !TextUtils.isEmpty(str)) {
                String str2 = campaign.iconImageFilePath;
                if (!TextUtils.isEmpty(str2)) {
                    File file = new File(str2);
                    if (file.exists()) {
                        file.delete();
                    }
                }
                ControllerFactory.getInstance().inboxSyncController.startIconImageDownload(str, campaign.getIdentifier());
            }
        } else {
            ControllerFactory.getInstance().inboxSyncController.resetCorruptImageDownloadRetryCount(str);
        }
        map.put("bitmap", bitmap);
        return map;
    }

    public String getBody(int i) {
        CampaignDetailModel campaign = this.campaignListInteractor.getCampaign(i);
        return campaign != null ? campaign.getBody() : "";
    }

    public boolean getReadStatus(int i) {
        CampaignDetailModel campaign = this.campaignListInteractor.getCampaign(i);
        if (campaign != null) {
            return campaign.getReadStatus();
        }
        return false;
    }

    public boolean getSeenStatus(int i) {
        CampaignDetailModel campaign = this.campaignListInteractor.getCampaign(i);
        if (campaign != null) {
            return campaign.getSeenStatus();
        }
        return false;
    }

    public long getTimestamp(int i) {
        CampaignDetailModel campaign = this.campaignListInteractor.getCampaign(i);
        if (campaign != null) {
            return campaign.getCreatedAt();
        }
        return 0L;
    }

    public void deleteRow(int i, boolean z) {
        CampaignDetailModel campaign = this.campaignListInteractor.getCampaign(i);
        if (campaign != null) {
            this.campaignListInteractor.deleteCampaign(campaign.getIdentifier(), z);
        }
    }

    public void undoTimedOut() {
        this.campaignListInteractor.undoTimedOut();
    }

    public void undoDeletedCampaign() {
        this.campaignListInteractor.undoDeletedCampaign();
    }

    public void markCampaignAsRead(int i) {
        CampaignDetailModel campaign = this.campaignListInteractor.getCampaign(i);
        if (campaign != null) {
            this.campaignListInteractor.markCampaignAsRead(campaign.getIdentifier());
        }
    }

    public void addObserver(CampaignListPresenterObserver campaignListPresenterObserver) {
        this.observers.add(campaignListPresenterObserver);
    }

    public void removeObserver(CampaignListPresenterObserver campaignListPresenterObserver) {
        this.observers.remove(campaignListPresenterObserver);
    }

    @Override // com.helpshift.campaigns.observers.CampaignListObserver
    public void campaignAdded() {
        Iterator<CampaignListPresenterObserver> it = this.observers.iterator();
        while (it.hasNext()) {
            it.next().dataChanged();
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignListObserver
    public void campaignIconImageDownloaded() {
        Iterator<CampaignListPresenterObserver> it = this.observers.iterator();
        while (it.hasNext()) {
            it.next().dataChanged();
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignListObserver
    public void campaignMarkedAsSeen() {
        Iterator<CampaignListPresenterObserver> it = this.observers.iterator();
        while (it.hasNext()) {
            it.next().dataChanged();
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignListObserver
    public void searchResultsUpdated() {
        Iterator<CampaignListPresenterObserver> it = this.observers.iterator();
        while (it.hasNext()) {
            it.next().dataChanged();
        }
    }

    @Override // androidx.appcompat.widget.SearchView.OnQueryTextListener
    public boolean onQueryTextChange(String str) {
        Iterator<CampaignListPresenterObserver> it = this.observers.iterator();
        while (it.hasNext()) {
            it.next().performedSearch();
        }
        if (campaignClickedFromSearchResult) {
            campaignClickedFromSearchResult = false;
            return true;
        }
        currentQuery = str;
        performSearch(str);
        return true;
    }

    public void performSearch(String str) {
        this.campaignListInteractor.performSearch(str);
    }

    public boolean getRetainSearchState() {
        return retainSearchState;
    }

    public void setRetainSearchState(boolean z) {
        retainSearchState = z;
    }

    public void setCampaignClickedFromSearchResult(boolean z) {
        campaignClickedFromSearchResult = z;
    }

    @Override // androidx.core.view.MenuItemCompat.OnActionExpandListener, android.view.MenuItem.OnActionExpandListener
    public boolean onMenuItemActionExpand(MenuItem menuItem) {
        Iterator<CampaignListPresenterObserver> it = this.observers.iterator();
        while (it.hasNext()) {
            it.next().searchActionStarted();
        }
        this.campaignListInteractor.searchActionStarted();
        return true;
    }

    @Override // androidx.core.view.MenuItemCompat.OnActionExpandListener, android.view.MenuItem.OnActionExpandListener
    public boolean onMenuItemActionCollapse(MenuItem menuItem) {
        Iterator<CampaignListPresenterObserver> it = this.observers.iterator();
        while (it.hasNext()) {
            it.next().searchActionStopped();
        }
        this.campaignListInteractor.searchActionStopped();
        return true;
    }

    public String getCurrentQuery() {
        return currentQuery;
    }

    public void setUp() {
        this.campaignListInteractor.setUp();
        this.campaignListInteractor.setObserver(this);
    }

    public void cleanUp() {
        this.campaignListInteractor.cleanUp();
        this.campaignListInteractor.setObserver(null);
    }

    public void cleanUpExpiredCampaigns() {
        this.campaignListInteractor.cleanUpExpiredCampaigns();
    }
}
