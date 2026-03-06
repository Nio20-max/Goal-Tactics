package com.helpshift.campaigns.network;

import com.helpshift.campaigns.controllers.SwitchUserController;
import com.helpshift.controllers.DataSyncCoordinator;
import com.helpshift.controllers.SyncController;
import com.helpshift.listeners.SyncListener;
import com.helpshift.network.NetworkDataProvider;
import com.helpshift.network.request.Request;
import com.helpshift.network.request.RequestQueue;
import com.helpshift.util.ConnectivityUtil;
import com.helpshift.util.HSLogger;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class SwitchUserNetworkManager extends SyncListener {
    private static final String TAG = "Helpshift_SUNetwork";
    private ConnectivityUtil connectivityUtil;
    private NetworkDataProvider dataProvider;
    private DataSyncCoordinator dataSyncCoordinator;
    private Set<String> dependentChildDataTypes;
    private RequestQueue requestQueue;

    @Override // com.helpshift.listeners.SyncListener
    public boolean isFullSyncEnabled() {
        return false;
    }

    protected SwitchUserNetworkManager(SwitchUserController switchUserController, DataSyncCoordinator dataSyncCoordinator, RequestQueue requestQueue, ConnectivityUtil connectivityUtil) {
        super(SyncController.DataTypes.SWITCH_USER);
        switchUserController.syncController.addSyncListeners(this);
        this.dataProvider = switchUserController;
        this.dataSyncCoordinator = dataSyncCoordinator;
        this.requestQueue = requestQueue;
        this.connectivityUtil = connectivityUtil;
        initDependentChildDataTypesSet();
    }

    private void initDependentChildDataTypesSet() {
        HashSet hashSet = new HashSet();
        this.dependentChildDataTypes = hashSet;
        hashSet.add(SyncController.DataTypes.ANALYTICS_EVENT);
        this.dependentChildDataTypes.add(SyncController.DataTypes.USER);
    }

    @Override // com.helpshift.listeners.SyncListener
    public Set<String> getDependentChildDataTypes() {
        return this.dependentChildDataTypes;
    }

    @Override // com.helpshift.listeners.SyncListener
    public void sync() {
        if (this.dataSyncCoordinator.isFirstDeviceSyncComplete()) {
            this.dataProvider.setBatchSize(Integer.valueOf(this.connectivityUtil.getBatchSize()));
            Request request = this.dataProvider.getRequest();
            if (request != null) {
                HSLogger.d(TAG, "Syncing switch user");
                this.requestQueue.add(request);
            }
        }
    }
}
