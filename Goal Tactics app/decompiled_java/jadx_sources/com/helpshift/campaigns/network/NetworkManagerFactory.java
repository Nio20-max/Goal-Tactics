package com.helpshift.campaigns.network;

import android.content.Context;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.common.domain.HSThreadFactory;
import com.helpshift.network.BasicNetwork;
import com.helpshift.network.HurlStack;
import com.helpshift.network.request.RequestManager;
import com.helpshift.network.request.RequestQueue;
import com.helpshift.util.ConnectivityUtil;
import com.helpshift.util.HelpshiftContext;
import java.util.concurrent.Executors;

/* JADX INFO: loaded from: classes.dex */
public class NetworkManagerFactory {
    private AnalyticsEventNetworkManager analyticsEventNetworkManager;
    public DevicePropertiesNetworkManager devicePropertiesNetworkManager;
    public InboxNetworkManager inboxNetworkManager;
    private SessionNetworkManager sessionNetworkManager;
    private SwitchUserNetworkManager switchUserNetworkManager;
    private UserPropertiesNetworkManager userPropertiesNetworkManager;

    NetworkManagerFactory() {
        Context applicationContext = HelpshiftContext.getApplicationContext();
        RequestQueue requestQueueNewRequestQueue = RequestManager.newRequestQueue(new BasicNetwork(new HurlStack()), RequestQueue.DeliveryType.ON_NEW_THREAD, Executors.newCachedThreadPool(new HSThreadFactory("cmdat-sy")));
        ControllerFactory controllerFactory = ControllerFactory.getInstance();
        ConnectivityUtil connectivityUtil = new ConnectivityUtil(applicationContext, 4, 8);
        this.sessionNetworkManager = new SessionNetworkManager(controllerFactory.sessionController, controllerFactory.userController, com.helpshift.controllers.ControllerFactory.getInstance().dataSyncCoordinator, requestQueueNewRequestQueue, connectivityUtil);
        this.devicePropertiesNetworkManager = new DevicePropertiesNetworkManager(controllerFactory.deviceController, requestQueueNewRequestQueue);
        this.userPropertiesNetworkManager = new UserPropertiesNetworkManager(controllerFactory.userController, com.helpshift.controllers.ControllerFactory.getInstance().dataSyncCoordinator, requestQueueNewRequestQueue, connectivityUtil);
        this.switchUserNetworkManager = new SwitchUserNetworkManager(controllerFactory.switchUserController, com.helpshift.controllers.ControllerFactory.getInstance().dataSyncCoordinator, requestQueueNewRequestQueue, connectivityUtil);
        this.analyticsEventNetworkManager = new AnalyticsEventNetworkManager(controllerFactory.analyticsEventController, com.helpshift.controllers.ControllerFactory.getInstance().dataSyncCoordinator, controllerFactory.userController, requestQueueNewRequestQueue, connectivityUtil);
        this.inboxNetworkManager = new InboxNetworkManager(controllerFactory.inboxSyncController, requestQueueNewRequestQueue);
    }

    public static NetworkManagerFactory getInstance() {
        return LazyHolder.INSTANCE;
    }

    private static class LazyHolder {
        static final NetworkManagerFactory INSTANCE = new NetworkManagerFactory();

        private LazyHolder() {
        }
    }
}
