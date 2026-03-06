package com.helpshift.campaigns.network;

import com.helpshift.campaigns.controllers.DeviceController;
import com.helpshift.controllers.SyncController;
import com.helpshift.listeners.SyncListener;
import com.helpshift.network.NetworkDataProvider;
import com.helpshift.network.request.Request;
import com.helpshift.network.request.RequestQueue;
import com.helpshift.util.HSLogger;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class DevicePropertiesNetworkManager extends SyncListener {
    private static final String TAG = "Helpshift_DPNetwork";
    private NetworkDataProvider dataProvider;
    private Set<String> dependentChildDataTypes;
    private RequestQueue requestQueue;

    @Override // com.helpshift.listeners.SyncListener
    public boolean isFullSyncEnabled() {
        return true;
    }

    protected DevicePropertiesNetworkManager(DeviceController deviceController, RequestQueue requestQueue) {
        super(SyncController.DataTypes.DEVICE);
        deviceController.syncController.addSyncListeners(this);
        this.dataProvider = deviceController;
        this.requestQueue = requestQueue;
        initDependentChildDataTypesSet();
    }

    private void initDependentChildDataTypesSet() {
        HashSet hashSet = new HashSet();
        this.dependentChildDataTypes = hashSet;
        hashSet.add(SyncController.DataTypes.SWITCH_USER);
        this.dependentChildDataTypes.add(SyncController.DataTypes.ANALYTICS_EVENT);
        this.dependentChildDataTypes.add(SyncController.DataTypes.USER);
    }

    @Override // com.helpshift.listeners.SyncListener
    public Set<String> getDependentChildDataTypes() {
        return this.dependentChildDataTypes;
    }

    @Override // com.helpshift.listeners.SyncListener
    public void sync() {
        Request request = this.dataProvider.getRequest();
        if (request != null) {
            HSLogger.d(TAG, "Syncing device properties");
            this.requestQueue.add(request);
        }
    }

    @Override // com.helpshift.listeners.SyncListener
    public void fullSync() {
        Request requestWithFullData = this.dataProvider.getRequestWithFullData();
        if (requestWithFullData != null) {
            HSLogger.d(TAG, "Full sync device properties");
            this.requestQueue.add(requestWithFullData);
        }
    }
}
