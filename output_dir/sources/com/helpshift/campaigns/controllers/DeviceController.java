package com.helpshift.campaigns.controllers;

import android.text.TextUtils;
import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.app.CampaignAppLifeCycleListener;
import com.helpshift.app.LifecycleListener;
import com.helpshift.campaigns.models.DeviceModel;
import com.helpshift.campaigns.network.NetworkManagerFactory;
import com.helpshift.campaigns.poller.CampaignsPoller;
import com.helpshift.campaigns.util.constants.DeviceProperties;
import com.helpshift.campaigns.util.constants.NetworkRoutes;
import com.helpshift.campaigns.util.constants.SyncStatus;
import com.helpshift.controllers.DataSyncCoordinator;
import com.helpshift.controllers.SyncController;
import com.helpshift.db.legacy_profile.tables.ProfileTable;
import com.helpshift.model.AppInfoModel;
import com.helpshift.model.SdkInfoModel;
import com.helpshift.network.NetworkDataProvider;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.request.Request;
import com.helpshift.network.response.JsonArrayResponseParser;
import com.helpshift.network.response.Response;
import com.helpshift.specifications.DailyFrequencyBasedSyncSpecification;
import com.helpshift.specifications.DecayingIntervalSyncSpecification;
import com.helpshift.specifications.SyncSpecification;
import com.helpshift.util.HSJSONUtils;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class DeviceController implements NetworkDataProvider, LifecycleListener {
    private static final String TAG = "HelpshiftDebug";
    private AppInfoModel appInfoModel;
    private CampaignsPoller campaignsPoller;
    private DataSyncCoordinator dataSyncCoordinator;
    public final DeviceModel deviceModel;
    private SdkInfoModel sdkInfoModel;
    private SwitchUserController switchUserController;
    public final SyncController syncController;
    private SyncSpecification syncSpecification;

    @Override // com.helpshift.network.NetworkDataProvider
    public void setBatchSize(Integer num) {
    }

    protected DeviceController(DataSyncCoordinator dataSyncCoordinator, SyncController syncController, SwitchUserController switchUserController, DeviceModel deviceModel, SyncSpecification syncSpecification, SdkInfoModel sdkInfoModel, AppInfoModel appInfoModel) {
        this.dataSyncCoordinator = dataSyncCoordinator;
        this.deviceModel = deviceModel;
        this.syncController = syncController;
        this.syncSpecification = syncSpecification;
        this.switchUserController = switchUserController;
        this.sdkInfoModel = sdkInfoModel;
        this.appInfoModel = appInfoModel;
        CampaignAppLifeCycleListener campaignAppLifeCycleListener = HelpshiftContext.getCampaignAppLifeCycleListener();
        if (campaignAppLifeCycleListener != null) {
            campaignAppLifeCycleListener.addLifecycleListener(this);
        }
        deviceModel.setSyncStatus(SyncStatus.UNSYNCED, new ArrayList<>(deviceModel.getSyncingPropertiesUnsafe().keySet()));
    }

    @Override // com.helpshift.network.NetworkDataProvider
    public Request getRequest() {
        HashMap<String, ArrayList> unsyncedProperties = this.deviceModel.getUnsyncedProperties();
        final String str = ControllerFactory.getInstance().userController.getCurrentUser().identifier;
        final ArrayList arrayList = new ArrayList(unsyncedProperties.keySet());
        return makeRequestForProperties(unsyncedProperties, new Response.Listener<JSONArray>() { // from class: com.helpshift.campaigns.controllers.DeviceController.1
            @Override // com.helpshift.network.response.Response.Listener
            public void onResponse(JSONArray jSONArray, Integer num) {
                DeviceController.this.handlePropertySyncSuccess(this, arrayList, str, false);
            }
        }, new Response.ErrorListener() { // from class: com.helpshift.campaigns.controllers.DeviceController.2
            @Override // com.helpshift.network.response.Response.ErrorListener
            public void onErrorResponse(NetworkError networkError, Integer num) {
                DeviceController.this.handlePropertySyncFailure(this, arrayList, networkError);
            }
        }, str);
    }

    @Override // com.helpshift.network.NetworkDataProvider
    public Request getRequestWithFullData() {
        HashMap<String, ArrayList> syncedAndUnSyncedProperties = this.deviceModel.getSyncedAndUnSyncedProperties();
        if (syncedAndUnSyncedProperties.size() == 0) {
            return null;
        }
        final ArrayList arrayList = new ArrayList(this.deviceModel.getUnsyncedProperties().keySet());
        final ArrayList arrayList2 = new ArrayList(syncedAndUnSyncedProperties.keySet());
        final String str = ControllerFactory.getInstance().userController.getCurrentUser().identifier;
        return makeRequestForProperties(syncedAndUnSyncedProperties, new Response.Listener<JSONArray>() { // from class: com.helpshift.campaigns.controllers.DeviceController.3
            @Override // com.helpshift.network.response.Response.Listener
            public void onResponse(JSONArray jSONArray, Integer num) {
                DeviceController.this.handlePropertySyncSuccess(this, arrayList2, str, true);
            }
        }, new Response.ErrorListener() { // from class: com.helpshift.campaigns.controllers.DeviceController.4
            @Override // com.helpshift.network.response.Response.ErrorListener
            public void onErrorResponse(NetworkError networkError, Integer num) {
                arrayList2.removeAll(arrayList);
                this.deviceModel.checkAndMarkPropertiesAsSynced(arrayList2);
                DeviceController.this.handlePropertySyncFailure(this, arrayList, networkError);
            }
        }, str);
    }

    private Request makeRequestForProperties(Map<String, ArrayList> map, Response.Listener<JSONArray> listener, Response.ErrorListener errorListener, String str) {
        if (map.size() == 0) {
            return null;
        }
        JSONObject jSONObjectFromNestedMap = HSJSONUtils.fromNestedMap(map);
        HashMap map2 = new HashMap();
        map2.put(ProfileTable.Columns.COLUMN_DID, this.deviceModel.getIdentifier());
        map2.put(ProfileTable.Columns.COLUMN_UID, str);
        map2.put(AnalyticsEventKey.PROTOCOL, jSONObjectFromNestedMap.toString());
        this.deviceModel.setSyncStatus(SyncStatus.SYNCING, new ArrayList<>(map.keySet()));
        return new Request(1, NetworkRoutes.DEVICE_PROPERTIES_ROUTE, map2, listener, errorListener, new JsonArrayResponseParser());
    }

    void handlePropertySyncSuccess(DeviceController deviceController, ArrayList<String> arrayList, String str, boolean z) {
        deviceController.sdkInfoModel.setDevicePropertiesSyncImmediately(false);
        deviceController.syncController.dataSynced(SyncController.DataTypes.DEVICE, z);
        deviceController.deviceModel.checkAndMarkPropertiesAsSynced(arrayList);
        deviceController.syncController.setDataChangeCount(SyncController.DataTypes.DEVICE, this.deviceModel.getUnsyncedProperties().size());
        if (deviceController.dataSyncCoordinator.isFirstDeviceSyncComplete()) {
            return;
        }
        deviceController.dataSyncCoordinator.firstDeviceSyncComplete();
        deviceController.switchUserController.doneSwitch(str);
        String userIdSyncedWithBackend = deviceController.sdkInfoModel.getUserIdSyncedWithBackend();
        if (!TextUtils.isEmpty(userIdSyncedWithBackend) && !userIdSyncedWithBackend.equals(str)) {
            deviceController.switchUserController.requestSwitch(str, userIdSyncedWithBackend);
        }
        deviceController.syncSpecification = new DailyFrequencyBasedSyncSpecification(4, SyncController.DataTypes.DEVICE);
        deviceController.syncController.addSpecification(this.syncSpecification);
        deviceController.syncController.addSyncListeners(NetworkManagerFactory.getInstance().devicePropertiesNetworkManager);
    }

    void handlePropertySyncFailure(DeviceController deviceController, ArrayList<String> arrayList, NetworkError networkError) {
        deviceController.deviceModel.setSyncStatus(SyncStatus.UNSYNCED, arrayList);
        if (!deviceController.dataSyncCoordinator.isFirstDeviceSyncComplete()) {
            SyncSpecification syncSpecification = deviceController.syncSpecification;
            if (syncSpecification instanceof DecayingIntervalSyncSpecification) {
                ((DecayingIntervalSyncSpecification) syncSpecification).decayElapsedTimeThreshold();
            }
        }
        deviceController.syncController.dataSyncFailed(SyncController.DataTypes.DEVICE, networkError);
    }

    public HashMap<String, Object> getDeviceInfoForPushAnalytics() {
        HashMap<String, Object> map = new HashMap<>();
        Object propertyValue = this.deviceModel.getPropertyValue(DeviceProperties.DeviceKeys.PLATFORM);
        if (propertyValue != null) {
            map.put(AnalyticsEventKey.PROTOCOL, propertyValue);
        }
        Object propertyValue2 = this.deviceModel.getPropertyValue(DeviceProperties.DeviceKeys.COUNTRY);
        if (propertyValue2 != null) {
            map.put(DeviceProperties.DeviceKeys.COUNTRY, propertyValue2);
        }
        Object propertyValue3 = this.deviceModel.getPropertyValue("ln");
        if (propertyValue3 != null) {
            map.put("ln", propertyValue3);
        }
        String identifier = this.deviceModel.getIdentifier();
        if (identifier != null) {
            map.put(ProfileTable.Columns.COLUMN_DID, identifier);
        }
        Object propertyValue4 = this.deviceModel.getPropertyValue(DeviceProperties.DeviceKeys.OS);
        if (propertyValue4 != null) {
            map.put("osv", propertyValue4);
        }
        Object propertyValue5 = this.deviceModel.getPropertyValue(DeviceProperties.DeviceKeys.MODEL);
        if (propertyValue5 != null) {
            map.put(DeviceProperties.DeviceKeys.MODEL, propertyValue5);
        }
        Object propertyValue6 = this.deviceModel.getPropertyValue(DeviceProperties.DeviceKeys.APP_VERSION);
        if (propertyValue6 != null) {
            map.put(DeviceProperties.DeviceKeys.APP_VERSION, propertyValue6);
        }
        return map;
    }

    public void setPushToken(String str) {
        this.deviceModel.setPushToken(str);
        this.syncController.incrementDataChangeCount(SyncController.DataTypes.DEVICE, 1);
    }

    public void setDevelopmentPlatform(String str) {
        this.deviceModel.setDevelopmentPlatform(str);
    }

    @Override // com.helpshift.app.LifecycleListener
    public void onForeground() {
        this.deviceModel.rescanDevice();
        HashMap<String, ArrayList> unsyncedProperties = this.deviceModel.getUnsyncedProperties();
        if (unsyncedProperties.size() > 0) {
            this.syncController.setDataChangeCount(SyncController.DataTypes.DEVICE, unsyncedProperties.size());
        }
        Boolean bool = this.appInfoModel.enableInboxPolling;
        boolean z = false;
        if (bool != null && bool.booleanValue()) {
            if (this.campaignsPoller == null) {
                CampaignsPoller campaignsPoller = new CampaignsPoller(NetworkManagerFactory.getInstance().inboxNetworkManager);
                this.campaignsPoller = campaignsPoller;
                campaignsPoller.start();
            } else {
                resetPoller();
            }
            z = true;
        }
        Boolean firstLaunch = this.sdkInfoModel.getFirstLaunch();
        Boolean oneCampaignFetchSuccessful = this.sdkInfoModel.getOneCampaignFetchSuccessful();
        if (z) {
            return;
        }
        if ((firstLaunch == null || !firstLaunch.booleanValue()) && (oneCampaignFetchSuccessful == null || oneCampaignFetchSuccessful.booleanValue())) {
            return;
        }
        try {
            NetworkManagerFactory.getInstance().inboxNetworkManager.fetchCampaigns();
        } catch (Exception e) {
            HSLogger.d(TAG, "Exception while fetching campaigns", e);
        }
    }

    @Override // com.helpshift.app.LifecycleListener
    public void onBackground() {
        this.sdkInfoModel.setFirstLaunch(false);
        CampaignsPoller campaignsPoller = this.campaignsPoller;
        if (campaignsPoller != null) {
            campaignsPoller.shutdown();
        }
    }

    public void resetPoller() {
        CampaignsPoller campaignsPoller = this.campaignsPoller;
        if (campaignsPoller != null) {
            campaignsPoller.shutdown();
            CampaignsPoller campaignsPoller2 = new CampaignsPoller(NetworkManagerFactory.getInstance().inboxNetworkManager);
            this.campaignsPoller = campaignsPoller2;
            campaignsPoller2.start();
        }
    }
}
