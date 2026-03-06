package com.helpshift.campaigns.controllers;

import android.text.TextUtils;
import com.helpshift.app.CampaignAppLifeCycleListener;
import com.helpshift.app.LifecycleListener;
import com.helpshift.campaigns.util.constants.NetworkRoutes;
import com.helpshift.constants.SwitchUserKeys;
import com.helpshift.controllers.DataSyncCoordinator;
import com.helpshift.controllers.SyncController;
import com.helpshift.db.legacy_profile.tables.ProfileTable;
import com.helpshift.model.SdkInfoModel;
import com.helpshift.network.NetworkDataProvider;
import com.helpshift.network.errors.NetworkError;
import com.helpshift.network.request.Request;
import com.helpshift.network.response.JsonArrayResponseParser;
import com.helpshift.network.response.Response;
import com.helpshift.storage.KeyValueStorage;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import java.util.HashMap;
import org.json.JSONArray;

/* JADX INFO: loaded from: classes.dex */
public class SwitchUserController implements NetworkDataProvider, LifecycleListener {
    private static final String TAG = "Helpshift_SUControl";
    String currentUser;
    private DataSyncCoordinator dataSyncCoordinator;
    private String prevUser;
    SdkInfoModel sdkInfoModel;
    private KeyValueStorage storage;
    public final SyncController syncController;

    @Override // com.helpshift.network.NetworkDataProvider
    public Request getRequestWithFullData() {
        return null;
    }

    @Override // com.helpshift.app.LifecycleListener
    public void onForeground() {
    }

    @Override // com.helpshift.network.NetworkDataProvider
    public void setBatchSize(Integer num) {
    }

    protected SwitchUserController(DataSyncCoordinator dataSyncCoordinator, SyncController syncController, KeyValueStorage keyValueStorage, SdkInfoModel sdkInfoModel) {
        this.currentUser = "";
        this.prevUser = "";
        this.syncController = syncController;
        this.sdkInfoModel = sdkInfoModel;
        CampaignAppLifeCycleListener campaignAppLifeCycleListener = HelpshiftContext.getCampaignAppLifeCycleListener();
        if (campaignAppLifeCycleListener != null) {
            campaignAppLifeCycleListener.addLifecycleListener(this);
        }
        this.dataSyncCoordinator = dataSyncCoordinator;
        this.storage = keyValueStorage;
        Object obj = keyValueStorage.get(SwitchUserKeys.PREV_USER);
        Object obj2 = this.storage.get(SwitchUserKeys.CURRENT_USER);
        if (obj instanceof String) {
            this.prevUser = (String) obj;
        }
        if (obj2 instanceof String) {
            this.currentUser = (String) obj2;
        }
    }

    public void doneSwitch(String str) {
        HSLogger.d(TAG, "Switch user done : Id : " + str);
        this.prevUser = "";
        this.currentUser = "";
        HashMap map = new HashMap();
        map.put(SwitchUserKeys.PREV_USER, this.prevUser);
        map.put(SwitchUserKeys.CURRENT_USER, this.currentUser);
        this.storage.setKeyValues(map);
        this.dataSyncCoordinator.switchUserComplete(str);
    }

    public void requestSwitch(String str, String str2) {
        synchronized (this) {
            HSLogger.d(TAG, "Requesting switch user : New Id : " + str + ", Old Id : " + str2);
            if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
                if (!TextUtils.isEmpty(this.prevUser) && !TextUtils.isEmpty(this.currentUser)) {
                    if (!this.prevUser.equals(str)) {
                        this.currentUser = str;
                    } else {
                        doneSwitch(str2);
                        return;
                    }
                } else {
                    this.currentUser = str;
                    this.prevUser = str2;
                }
                HashMap map = new HashMap();
                map.put(SwitchUserKeys.PREV_USER, this.prevUser);
                map.put(SwitchUserKeys.CURRENT_USER, this.currentUser);
                this.storage.setKeyValues(map);
                this.syncController.incrementDataChangeCount(SyncController.DataTypes.SWITCH_USER, 1);
                this.dataSyncCoordinator.switchUserPending(this.currentUser);
            }
        }
    }

    @Override // com.helpshift.network.NetworkDataProvider
    public Request getRequest() {
        if (TextUtils.isEmpty(this.prevUser) || TextUtils.isEmpty(this.currentUser) || this.currentUser.equals(this.prevUser)) {
            return null;
        }
        String identifier = ControllerFactory.getInstance().deviceController.deviceModel.getIdentifier();
        HashMap map = new HashMap();
        map.put(ProfileTable.Columns.COLUMN_DID, identifier);
        map.put(ProfileTable.Columns.COLUMN_UID, this.currentUser);
        map.put("prev-uid", this.prevUser);
        return new Request(1, NetworkRoutes.SWITCH_USER_ROUTE, map, new Response.Listener<JSONArray>() { // from class: com.helpshift.campaigns.controllers.SwitchUserController.1
            @Override // com.helpshift.network.response.Response.Listener
            public void onResponse(JSONArray jSONArray, Integer num) {
                this.syncController.dataSynced(SyncController.DataTypes.SWITCH_USER, false);
                this.sdkInfoModel.setUserIdSyncedWithBackend(SwitchUserController.this.currentUser);
                this.doneSwitch(SwitchUserController.this.currentUser);
            }
        }, new Response.ErrorListener() { // from class: com.helpshift.campaigns.controllers.SwitchUserController.2
            @Override // com.helpshift.network.response.Response.ErrorListener
            public void onErrorResponse(NetworkError networkError, Integer num) {
                this.syncController.dataSyncFailed(SyncController.DataTypes.SWITCH_USER, networkError);
            }
        }, new JsonArrayResponseParser());
    }

    @Override // com.helpshift.app.LifecycleListener
    public void onBackground() {
        if (TextUtils.isEmpty(this.currentUser) || TextUtils.isEmpty(this.prevUser)) {
            return;
        }
        this.syncController.setDataChangeCount(SyncController.DataTypes.SWITCH_USER, 1);
    }
}
