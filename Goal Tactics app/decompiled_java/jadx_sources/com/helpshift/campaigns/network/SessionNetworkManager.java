package com.helpshift.campaigns.network;

import com.helpshift.campaigns.controllers.SessionController;
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
public class SessionNetworkManager extends SyncListener {
    private static final String TAG = "Helpshift_SessionNtwrk";
    private ConnectivityUtil connectivityUtil;
    private NetworkDataProvider dataProvider;
    private DataSyncCoordinator dataSyncCoordinator;
    private RequestQueue requestQueue;
    private UserController userController;

    @Override // com.helpshift.listeners.SyncListener
    public boolean isFullSyncEnabled() {
        return false;
    }

    protected SessionNetworkManager(SessionController sessionController, UserController userController, DataSyncCoordinator dataSyncCoordinator, RequestQueue requestQueue, ConnectivityUtil connectivityUtil) {
        super(SyncController.DataTypes.SESSION);
        this.dataProvider = sessionController;
        sessionController.syncController.addSyncListeners(this);
        this.dataSyncCoordinator = dataSyncCoordinator;
        this.userController = userController;
        this.requestQueue = requestQueue;
        this.connectivityUtil = connectivityUtil;
    }

    @Override // com.helpshift.listeners.SyncListener
    public void sync() {
        if (this.dataSyncCoordinator.canSyncSessionProperties(this.userController.getCurrentUser().identifier)) {
            this.dataProvider.setBatchSize(Integer.valueOf(this.connectivityUtil.getBatchSize()));
            Request request = this.dataProvider.getRequest();
            if (request != null) {
                HSLogger.d(TAG, "Syncing sessions");
                this.requestQueue.add(request);
            }
        }
    }
}
