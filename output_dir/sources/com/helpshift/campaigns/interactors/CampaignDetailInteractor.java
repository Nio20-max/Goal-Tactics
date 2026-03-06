package com.helpshift.campaigns.interactors;

import android.app.Activity;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.models.AnalyticsEvent;
import com.helpshift.campaigns.models.CampaignDetailModel;
import com.helpshift.campaigns.observers.CampaignDetailObserver;
import com.helpshift.campaigns.observers.CampaignStorageObserver;
import com.helpshift.campaigns.storage.CampaignStorage;
import com.helpshift.campaigns.storage.CampaignSyncModelStorage;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class CampaignDetailInteractor implements CampaignStorageObserver {
    private CampaignDetailModel campaignDetailModel;
    private String campaignId;
    private List<CampaignDetailObserver> observers = new ArrayList();
    private CampaignStorage storage;

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignDeleted(String str) {
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignRead(String str) {
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignSeen(String str) {
    }

    private CampaignDetailInteractor(String str, CampaignStorage campaignStorage) {
        this.storage = campaignStorage;
        this.campaignId = str;
        this.campaignDetailModel = campaignStorage.getCampaign(str);
    }

    public static CampaignDetailInteractor newInstance(String str, CampaignStorage campaignStorage, CampaignSyncModelStorage campaignSyncModelStorage) {
        if ((campaignStorage.getCampaign(str) == null && campaignSyncModelStorage.getCampaign(str, ControllerFactory.getInstance().userController.getCurrentUser().identifier) == null) ? false : true) {
            return new CampaignDetailInteractor(str, campaignStorage);
        }
        return null;
    }

    public void markCampaignAsSeen() {
        this.storage.markCampaignAsSeen(this.campaignId);
        ControllerFactory.getInstance().analyticsEventController.recordAnalyticsEvent(AnalyticsEvent.AnalyticsEventType.VIEW, this.campaignId, false);
    }

    public void executeAction(int i, Activity activity) {
        this.campaignDetailModel.executeAction(i, activity);
    }

    public CampaignDetailModel getCampaignDetailModel() {
        return this.campaignDetailModel;
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignDetailModelAdded(CampaignDetailModel campaignDetailModel) {
        if (campaignDetailModel.getIdentifier().equals(this.campaignId)) {
            this.campaignDetailModel = this.storage.getCampaign(this.campaignId);
            Iterator<CampaignDetailObserver> it = this.observers.iterator();
            while (it.hasNext()) {
                it.next().campaignDetailAdded();
            }
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignIconImageFilePathUpdated(String str) {
        if (str.equals(this.campaignId)) {
            this.campaignDetailModel = this.storage.getCampaign(str);
            Iterator<CampaignDetailObserver> it = this.observers.iterator();
            while (it.hasNext()) {
                it.next().campaignIconImageDownloaded();
            }
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignCoverImageFilePathUpdated(String str) {
        if (str.equals(this.campaignId)) {
            this.campaignDetailModel = this.storage.getCampaign(str);
            Iterator<CampaignDetailObserver> it = this.observers.iterator();
            while (it.hasNext()) {
                it.next().campaignCoverImageDownloaded();
            }
        }
    }

    public void addObserver(CampaignDetailObserver campaignDetailObserver) {
        this.observers.add(campaignDetailObserver);
    }

    public void removeObserver(CampaignDetailObserver campaignDetailObserver) {
        this.observers.remove(campaignDetailObserver);
    }

    public void setUp() {
        this.storage.addObserver(this);
    }

    public void cleanUp() {
        this.storage.removeObserver(this);
    }
}
