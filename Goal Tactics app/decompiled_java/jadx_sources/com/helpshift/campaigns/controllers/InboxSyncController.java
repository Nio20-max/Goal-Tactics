package com.helpshift.campaigns.controllers;

import android.text.TextUtils;
import com.helpshift.app.CampaignAppLifeCycleListener;
import com.helpshift.app.LifecycleListener;
import com.helpshift.campaigns.downloader.CampaignDownloader;
import com.helpshift.campaigns.models.AnalyticsEvent;
import com.helpshift.campaigns.models.CampaignDetailModel;
import com.helpshift.campaigns.models.CampaignSyncModel;
import com.helpshift.campaigns.observers.CampaignDownloadObserver;
import com.helpshift.campaigns.storage.CampaignStorage;
import com.helpshift.campaigns.storage.CampaignSyncModelStorage;
import com.helpshift.campaigns.util.InAppCampaignsUtil;
import com.helpshift.campaigns.util.constants.NetworkRoutes;
import com.helpshift.db.legacy_profile.tables.ProfileTable;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.network.NetworkDataProvider;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.request.Request;
import com.helpshift.network.response.JsonObjectResponseParser;
import com.helpshift.network.response.Response;
import com.helpshift.storage.KeyValueStorage;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class InboxSyncController implements CampaignDownloadObserver, LifecycleListener, NetworkDataProvider {
    private static final String CURSOR_KEY_PREFIX = "hs__campaigns_inbox_cursor";
    private static final String TAG = "Helpshift_ISControl";
    private CampaignDownloader campaignDownloader;
    private CampaignStorage campaignStorage;
    KeyValueStorage keyValueStorage;
    CampaignSyncModelStorage syncModelStorage;
    private UserController userController;

    @Override // com.helpshift.network.NetworkDataProvider
    public Request getRequestWithFullData() {
        return null;
    }

    @Override // com.helpshift.app.LifecycleListener
    public void onBackground() {
    }

    @Override // com.helpshift.network.NetworkDataProvider
    public void setBatchSize(Integer num) {
    }

    public InboxSyncController(CampaignStorage campaignStorage, CampaignSyncModelStorage campaignSyncModelStorage, UserController userController, KeyValueStorage keyValueStorage) {
        this.campaignStorage = campaignStorage;
        this.syncModelStorage = campaignSyncModelStorage;
        this.userController = userController;
        this.keyValueStorage = keyValueStorage;
        CampaignDownloader campaignDownloader = new CampaignDownloader(this);
        this.campaignDownloader = campaignDownloader;
        this.syncModelStorage.addObserver(campaignDownloader);
        this.campaignStorage.addObserver(this.campaignDownloader);
        this.syncModelStorage.cleanUpSyncingModels(userController.getCurrentUser().identifier);
        CampaignAppLifeCycleListener campaignAppLifeCycleListener = HelpshiftContext.getCampaignAppLifeCycleListener();
        if (campaignAppLifeCycleListener != null) {
            campaignAppLifeCycleListener.addLifecycleListener(this);
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignDownloadObserver
    public void campaignDownloadStarted(String str) {
        this.syncModelStorage.markCampaignAsSyncing(str, this.userController.getCurrentUser().identifier);
    }

    @Override // com.helpshift.campaigns.observers.CampaignDownloadObserver
    public void campaignDownloadCompleted(CampaignSyncModel campaignSyncModel, String str) {
        try {
            CampaignDetailModel campaignDetailModel = new CampaignDetailModel(campaignSyncModel.campaignId, new JSONObject(str), campaignSyncModel.timeStamp, campaignSyncModel.expiryTimeStamp);
            this.syncModelStorage.markCampaignAsSynced(campaignSyncModel.campaignId, this.userController.getCurrentUser().identifier);
            this.campaignStorage.addCampaign(campaignDetailModel);
            ControllerFactory.getInstance().analyticsEventController.recordAnalyticsEvent(AnalyticsEvent.AnalyticsEventType.DELIVERY, campaignSyncModel.campaignId, false);
        } catch (JSONException e) {
            HSLogger.d(TAG, "Exception while parsing json string of campaign detail object", e);
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignDownloadObserver
    public void campaignDownloadFailed(String str) {
        HSLogger.d(TAG, "Campaign download failed : " + str);
        this.syncModelStorage.markCampaignAsUnSynced(str, this.userController.getCurrentUser().identifier);
    }

    @Override // com.helpshift.campaigns.observers.CampaignDownloadObserver
    public void iconImageDownloadCompleted(String str, String str2) {
        HSLogger.d(TAG, "Campaign icon image download complete : " + str);
        this.campaignStorage.updateCampaignWithIconImageFilePath(str, str2);
    }

    @Override // com.helpshift.campaigns.observers.CampaignDownloadObserver
    public void iconImageDownloadFailed(String str) {
        HSLogger.d(TAG, "Campaign icon download failed : " + str);
    }

    @Override // com.helpshift.campaigns.observers.CampaignDownloadObserver
    public void coverImageDownloadCompleted(String str, String str2) {
        HSLogger.d(TAG, "Campaign cover image download complete : " + str + ", File path : " + str2);
        this.campaignStorage.updateCampaignWIthCoverImageFilePath(str, str2);
    }

    @Override // com.helpshift.campaigns.observers.CampaignDownloadObserver
    public void coverImageDownloadFailed(String str) {
        HSLogger.d(TAG, "Campaign cover image download failed : " + str);
    }

    public void resetCorruptImageDownloadRetryCount(String str) {
        this.campaignDownloader.enableCorruptImageRetry(str);
    }

    @Override // com.helpshift.app.LifecycleListener
    public void onForeground() {
        for (CampaignSyncModel campaignSyncModel : this.syncModelStorage.getAllUnsyncedCampaigns(this.userController.getCurrentUser().identifier)) {
            HSLogger.d(TAG, "Starting unsynced campaign download");
            this.campaignDownloader.startCampaignDownload(campaignSyncModel);
        }
    }

    public void startIconImageDownload(String str, String str2) {
        HSLogger.d(TAG, "Campaign icon image download start : " + str2 + ", URL : " + str);
        this.campaignDownloader.startIconImageDownload(str, str2);
    }

    public void startCoverImageDownload(String str, String str2) {
        HSLogger.d(TAG, "Campaign cover image download start : " + str2 + ", URL : " + str);
        this.campaignDownloader.startCoverImageDownload(str, str2);
    }

    @Override // com.helpshift.network.NetworkDataProvider
    public Request getRequest() {
        HashMap map = new HashMap();
        map.put(ProfileTable.Columns.COLUMN_DID, ControllerFactory.getInstance().deviceController.deviceModel.getIdentifier());
        final String str = ControllerFactory.getInstance().userController.getCurrentUser().identifier;
        map.put(ProfileTable.Columns.COLUMN_UID, str);
        String str2 = (String) this.keyValueStorage.get(CURSOR_KEY_PREFIX + str);
        if (!TextUtils.isEmpty(str2)) {
            map.put("cursor", str2);
        }
        return new Request(0, NetworkRoutes.INBOX_ROUTE, map, new Response.Listener<JSONObject>() { // from class: com.helpshift.campaigns.controllers.InboxSyncController.1
            @Override // com.helpshift.network.response.Response.Listener
            public void onResponse(JSONObject jSONObject, Integer num) {
                InfoModelFactory.getInstance().sdkInfoModel.setOneCampaignFetchSuccessful(true);
                String strOptString = jSONObject.optString("cursor", "");
                if (!TextUtils.isEmpty(strOptString)) {
                    InboxSyncController.this.keyValueStorage.set(InboxSyncController.CURSOR_KEY_PREFIX + str, strOptString);
                }
                JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("campaigns");
                if (jSONArrayOptJSONArray == null) {
                    return;
                }
                for (int i = 0; i < jSONArrayOptJSONArray.length(); i++) {
                    JSONObject jSONObjectOptJSONObject = jSONArrayOptJSONArray.optJSONObject(i);
                    if (jSONObjectOptJSONObject != null) {
                        try {
                            String strOptString2 = jSONObjectOptJSONObject.optString("cid", "");
                            String campaignIdForLoggedInUser = InAppCampaignsUtil.getCampaignIdForLoggedInUser(strOptString2);
                            InfoModelFactory.getInstance().sdkInfoModel.setChangeSetId(strOptString2, campaignIdForLoggedInUser);
                            jSONObjectOptJSONObject.put("cid", campaignIdForLoggedInUser);
                            InboxSyncController.this.syncModelStorage.addCampaign(new CampaignSyncModel(jSONObjectOptJSONObject), str);
                        } catch (JSONException unused) {
                            HSLogger.d(InboxSyncController.TAG, "Error while parsing creative");
                        }
                    }
                }
            }
        }, new Response.ErrorListener() { // from class: com.helpshift.campaigns.controllers.InboxSyncController.2
            @Override // com.helpshift.network.response.Response.ErrorListener
            public void onErrorResponse(NetworkError networkError, Integer num) {
            }
        }, new JsonObjectResponseParser());
    }
}
