package com.helpshift.campaigns.network;

import com.helpshift.campaigns.controllers.UserController;
import com.helpshift.controllers.DataSyncCoordinator;
import com.helpshift.controllers.SyncController;
import com.helpshift.listeners.SyncListener;
import com.helpshift.network.NetworkDataProvider;
import com.helpshift.network.request.Request;
import com.helpshift.network.request.RequestQueue;
import com.helpshift.util.ConnectivityUtil;
import com.helpshift.util.HSLogger;

/* JADX INFO: loaded from: classes.dex */
public class UserPropertiesNetworkManager extends SyncListener {
    private static final String TAG = "Helpshift_UPNetwork";
    private ConnectivityUtil connectivityUtil;
    private NetworkDataProvider dataProvider;
    private DataSyncCoordinator dataSyncCoordinator;
    private RequestQueue requestQueue;

    @Override // com.helpshift.listeners.SyncListener
    public boolean isFullSyncEnabled() {
        return true;
    }

    protected UserPropertiesNetworkManager(UserController userController, DataSyncCoordinator dataSyncCoordinator, RequestQueue requestQueue, ConnectivityUtil connectivityUtil) {
        super(SyncController.DataTypes.USER);
        userController.syncController.addSyncListeners(this);
        this.dataProvider = userController;
        this.dataSyncCoordinator = dataSyncCoordinator;
        this.requestQueue = requestQueue;
        this.connectivityUtil = connectivityUtil;
    }

    @Override // com.helpshift.listeners.SyncListener
    public void sync() {
        if (shouldSync()) {
            this.dataProvider.setBatchSize(Integer.valueOf(this.connectivityUtil.getBatchSize()));
            Request request = this.dataProvider.getRequest();
            if (request != null) {
                HSLogger.d(TAG, "Syncing user properties");
                this.requestQueue.add(request);
            }
        }
    }

    @Override // com.helpshift.listeners.SyncListener
    public void fullSync() {
        if (shouldSync()) {
            this.dataProvider.setBatchSize(Integer.valueOf(this.connectivityUtil.getBatchSize()));
            Request requestWithFullData = this.dataProvider.getRequestWithFullData();
            if (requestWithFullData != null) {
                HSLogger.d(TAG, "Full sync user properties");
                this.requestQueue.add(requestWithFullData);
            }
        }
    }

    private boolean shouldSync() {
        return this.dataSyncCoordinator.canSyncUserProperties(((UserController) this.dataProvider).getCurrentUser().identifier);
    }
}
