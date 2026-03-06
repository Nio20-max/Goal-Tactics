package com.helpshift.campaigns.interactors;

import android.content.Context;
import android.text.TextUtils;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.models.AnalyticsEvent;
import com.helpshift.campaigns.models.CampaignDetailModel;
import com.helpshift.campaigns.observers.CampaignListObserver;
import com.helpshift.campaigns.observers.CampaignStorageObserver;
import com.helpshift.campaigns.storage.CampaignStorage;
import com.helpshift.campaigns.util.InAppCampaignsUtil;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.HSLogger;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class CampaignsListInteractor implements CampaignStorageObserver {
    private static final String TAG = "Helpshift_CampListInt";
    private List<CampaignDetailModel> allCampaigns;
    private CampaignStorage campaignStorage;
    private CampaignDetailModel campaignToUndoDelete;
    private List<CampaignDetailModel> campaignsToShow;
    private final Context context;
    private CampaignListObserver observer;
    private boolean searchStarted = false;
    private int undoPosition;

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignCoverImageFilePathUpdated(String str) {
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignDeleted(String str) {
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignRead(String str) {
    }

    public CampaignsListInteractor(Context context, CampaignStorage campaignStorage) {
        this.context = context;
        this.campaignStorage = campaignStorage;
        List<CampaignDetailModel> allActiveCampaigns = getAllActiveCampaigns();
        this.allCampaigns = allActiveCampaigns;
        this.campaignsToShow = allActiveCampaigns;
        StringBuilder sb = new StringBuilder();
        sb.append("Campaigns to show : ");
        List<CampaignDetailModel> list = this.campaignsToShow;
        sb.append(list != null ? list.size() : 0);
        HSLogger.d(TAG, sb.toString());
    }

    public CampaignDetailModel getCampaign(int i) {
        List<CampaignDetailModel> list = this.campaignsToShow;
        if (list == null || i >= list.size() || i < 0) {
            return null;
        }
        return this.campaignsToShow.get(i);
    }

    public int getCountOfCampaigns() {
        List<CampaignDetailModel> list = this.campaignsToShow;
        if (list != null) {
            return list.size();
        }
        return 0;
    }

    private List<CampaignDetailModel> getAllActiveCampaigns() {
        return InAppCampaignsUtil.cleanAndGetActiveCampaigns(this.context, this.campaignStorage, ControllerFactory.getInstance().userController.getCurrentUser().identifier);
    }

    private boolean removeCampaignFromUi(String str) {
        List<CampaignDetailModel> list;
        if (!TextUtils.isEmpty(str) && (list = this.campaignsToShow) != null) {
            CampaignDetailModel campaignDetailModel = null;
            Iterator<CampaignDetailModel> it = list.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                CampaignDetailModel next = it.next();
                if (next.getIdentifier().equals(str)) {
                    campaignDetailModel = next;
                    break;
                }
            }
            if (campaignDetailModel != null) {
                this.undoPosition = this.campaignsToShow.indexOf(campaignDetailModel);
                this.campaignToUndoDelete = campaignDetailModel;
                this.campaignsToShow.remove(campaignDetailModel);
                ApplicationUtil.cancelNotification(this.context, str);
                return true;
            }
        }
        return false;
    }

    private void deleteCampaignFromStorage() {
        CampaignDetailModel campaignDetailModel = this.campaignToUndoDelete;
        if (campaignDetailModel != null) {
            String identifier = campaignDetailModel.getIdentifier();
            this.campaignStorage.deleteCampaign(identifier);
            ControllerFactory.getInstance().analyticsEventController.recordAnalyticsEvent(AnalyticsEvent.AnalyticsEventType.MARK_AS_DELETE, identifier, false);
            if (this.searchStarted) {
                this.allCampaigns.remove(this.campaignToUndoDelete);
            }
            this.campaignToUndoDelete = null;
        }
    }

    public void deleteCampaign(String str, boolean z) {
        if (this.campaignToUndoDelete != null) {
            deleteCampaignFromStorage();
        }
        removeCampaignFromUi(str);
        if (z) {
            return;
        }
        deleteCampaignFromStorage();
    }

    public void undoTimedOut() {
        deleteCampaignFromStorage();
    }

    public void undoDeletedCampaign() {
        CampaignDetailModel campaignDetailModel = this.campaignToUndoDelete;
        if (campaignDetailModel != null) {
            this.campaignsToShow.add(this.undoPosition, campaignDetailModel);
            this.campaignToUndoDelete = null;
        }
    }

    public void markCampaignAsRead(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.campaignStorage.markCampaignAsRead(str);
        List<CampaignDetailModel> list = this.campaignsToShow;
        if (list != null) {
            for (CampaignDetailModel campaignDetailModel : list) {
                if (campaignDetailModel.getIdentifier().equals(str)) {
                    campaignDetailModel.setReadStatus(true);
                    ControllerFactory.getInstance().analyticsEventController.recordAnalyticsEvent(AnalyticsEvent.AnalyticsEventType.MARK_AS_READ, campaignDetailModel.getIdentifier(), false);
                    return;
                }
            }
        }
    }

    public void performSearch(String str) {
        if (this.campaignToUndoDelete != null) {
            undoTimedOut();
        }
        if (!TextUtils.isEmpty(str) && str.length() > 2 && this.allCampaigns != null) {
            ArrayList arrayList = new ArrayList();
            for (CampaignDetailModel campaignDetailModel : this.allCampaigns) {
                String[] strArrSplit = str.toLowerCase().trim().split("\\s+");
                String title = campaignDetailModel.getTitle();
                String body = campaignDetailModel.getBody();
                for (String str2 : strArrSplit) {
                    if ((body != null && body.toLowerCase().contains(str2)) || (title != null && title.toLowerCase().contains(str2))) {
                        arrayList.add(campaignDetailModel);
                        break;
                    }
                }
            }
            this.campaignsToShow = arrayList;
        } else {
            this.campaignsToShow = this.allCampaigns;
        }
        CampaignListObserver campaignListObserver = this.observer;
        if (campaignListObserver != null) {
            campaignListObserver.searchResultsUpdated();
        }
    }

    public void searchActionStarted() {
        if (this.campaignToUndoDelete != null) {
            undoTimedOut();
        }
        this.searchStarted = true;
    }

    public void searchActionStopped() {
        this.searchStarted = false;
        if (this.campaignToUndoDelete != null) {
            undoTimedOut();
        }
        List<CampaignDetailModel> allActiveCampaigns = getAllActiveCampaigns();
        this.allCampaigns = allActiveCampaigns;
        this.campaignsToShow = allActiveCampaigns;
    }

    public void cleanUpExpiredCampaigns() {
        List<CampaignDetailModel> allActiveCampaigns = getAllActiveCampaigns();
        this.allCampaigns = allActiveCampaigns;
        if (this.searchStarted) {
            return;
        }
        this.campaignsToShow = allActiveCampaigns;
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignDetailModelAdded(CampaignDetailModel campaignDetailModel) {
        List<CampaignDetailModel> allActiveCampaigns = getAllActiveCampaigns();
        this.allCampaigns = allActiveCampaigns;
        if (!this.searchStarted) {
            this.campaignsToShow = allActiveCampaigns;
        }
        CampaignListObserver campaignListObserver = this.observer;
        if (campaignListObserver != null) {
            campaignListObserver.campaignAdded();
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignIconImageFilePathUpdated(String str) {
        List<CampaignDetailModel> list = this.allCampaigns;
        if (list != null) {
            int i = -1;
            boolean z = false;
            Iterator<CampaignDetailModel> it = list.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                i++;
                if (it.next().getIdentifier().equals(str)) {
                    z = true;
                    break;
                }
            }
            if (i >= 0 && i < this.allCampaigns.size() && z) {
                this.allCampaigns.set(i, this.campaignStorage.getCampaign(str));
            }
            CampaignListObserver campaignListObserver = this.observer;
            if (campaignListObserver != null) {
                campaignListObserver.campaignIconImageDownloaded();
            }
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignSeen(String str) {
        List<CampaignDetailModel> list;
        if (TextUtils.isEmpty(str) || (list = this.campaignsToShow) == null) {
            return;
        }
        for (CampaignDetailModel campaignDetailModel : list) {
            if (campaignDetailModel.getIdentifier().equals(str)) {
                campaignDetailModel.setSeenStatus(true);
                CampaignListObserver campaignListObserver = this.observer;
                if (campaignListObserver != null) {
                    campaignListObserver.campaignMarkedAsSeen();
                    return;
                }
                return;
            }
        }
    }

    public void setObserver(CampaignListObserver campaignListObserver) {
        this.observer = campaignListObserver;
    }

    public void setUp() {
        this.campaignStorage.addObserver(this);
    }

    public void cleanUp() {
        this.campaignStorage.removeObserver(this);
    }
}
