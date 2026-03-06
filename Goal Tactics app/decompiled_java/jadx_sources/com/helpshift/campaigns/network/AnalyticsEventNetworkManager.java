package com.helpshift.campaigns.network;

import com.helpshift.campaigns.controllers.AnalyticsEventController;
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
public class AnalyticsEventNetworkManager extends SyncListener {
    private static final String TAG = "Helpshift_AENewtork";
    private ConnectivityUtil connectivityUtil;
    private NetworkDataProvider dataProvider;
    private DataSyncCoordinator dataSyncCoordinator;
    private RequestQueue requestQueue;
    private UserController userController;

    @Override // com.helpshift.listeners.SyncListener
    public boolean isFullSyncEnabled() {
        return false;
    }

    public AnalyticsEventNetworkManager(AnalyticsEventController analyticsEventController, DataSyncCoordinator dataSyncCoordinator, UserController userController, RequestQueue requestQueue, ConnectivityUtil connectivityUtil) {
        super(SyncController.DataTypes.ANALYTICS_EVENT);
        this.dataProvider = analyticsEventController;
        analyticsEventController.syncController.addSyncListeners(this);
        this.dataSyncCoordinator = dataSyncCoordinator;
        this.userController = userController;
        this.requestQueue = requestQueue;
        this.connectivityUtil = connectivityUtil;
    }

    @Override // com.helpshift.listeners.SyncListener
    public void sync() {
        if (this.dataSyncCoordinator.canSyncUserProperties(this.userController.getCurrentUser().identifier)) {
            this.dataProvider.setBatchSize(Integer.valueOf(this.connectivityUtil.getBatchSize()));
            Request request = this.dataProvider.getRequest();
            if (request != null) {
                HSLogger.d(TAG, "Syncing analytics events properties");
                this.requestQueue.add(request);
            }
        }
    }
}
