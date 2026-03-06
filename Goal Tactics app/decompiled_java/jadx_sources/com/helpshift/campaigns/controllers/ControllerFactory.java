package com.helpshift.campaigns.controllers;

import com.helpshift.campaigns.Inbox;
import com.helpshift.campaigns.models.AndroidDevice;
import com.helpshift.campaigns.models.DeviceModel;
import com.helpshift.campaigns.storage.CampaignsStorageFactory;
import com.helpshift.campaigns.storage.PropertyStorage;
import com.helpshift.common.domain.network.NetworkConstants;
import com.helpshift.controllers.DataSyncCoordinator;
import com.helpshift.controllers.SyncController;
import com.helpshift.model.AppInfoModel;
import com.helpshift.model.InfoModelFactory;
import com.helpshift.model.SdkInfoModel;
import com.helpshift.specifications.DailyFrequencyBasedSyncSpecification;
import com.helpshift.specifications.DecayingIntervalSyncSpecification;
import com.helpshift.specifications.GenericSyncSpecification;
import com.helpshift.specifications.SyncSpecification;
import com.helpshift.storage.KeyValueStorage;
import com.helpshift.util.concurrent.DispatchQueue;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class ControllerFactory {
    public final AnalyticsEventController analyticsEventController;
    public final DeviceController deviceController;
    public Inbox inboxApi;
    public final InboxSyncController inboxSyncController;
    public final SessionController sessionController;
    public final SwitchUserController switchUserController;
    public final UserController userController;

    ControllerFactory() {
        SyncSpecification decayingIntervalSyncSpecification;
        KeyValueStorage keyValueStorage = CampaignsStorageFactory.getInstance().keyValueStorage;
        DataSyncCoordinator dataSyncCoordinator = com.helpshift.controllers.ControllerFactory.getInstance().dataSyncCoordinator;
        SyncController syncController = com.helpshift.controllers.ControllerFactory.getInstance().syncController;
        SdkInfoModel sdkInfoModel = InfoModelFactory.getInstance().sdkInfoModel;
        AppInfoModel appInfoModel = InfoModelFactory.getInstance().appInfoModel;
        PropertyStorage propertyStorage = CampaignsStorageFactory.getInstance().propertyStorage;
        syncController.addSpecification(new DecayingIntervalSyncSpecification(5, TimeUnit.SECONDS, SyncController.DataTypes.SWITCH_USER));
        SwitchUserController switchUserController = new SwitchUserController(dataSyncCoordinator, syncController, keyValueStorage, sdkInfoModel);
        this.switchUserController = switchUserController;
        if (dataSyncCoordinator.isFirstDeviceSyncComplete()) {
            decayingIntervalSyncSpecification = new DailyFrequencyBasedSyncSpecification(4, SyncController.DataTypes.DEVICE);
        } else {
            decayingIntervalSyncSpecification = new DecayingIntervalSyncSpecification(5, TimeUnit.SECONDS, SyncController.DataTypes.DEVICE);
        }
        SyncSpecification syncSpecification = decayingIntervalSyncSpecification;
        syncController.addSpecification(syncSpecification);
        DeviceModel deviceModel = new DeviceModel(new AndroidDevice(), CampaignsStorageFactory.getInstance().propertyStorage, new DispatchQueue(false));
        deviceModel.init();
        this.deviceController = new DeviceController(dataSyncCoordinator, syncController, switchUserController, deviceModel, syncSpecification, sdkInfoModel, appInfoModel);
        syncController.addSpecification(new DecayingIntervalSyncSpecification(5, TimeUnit.SECONDS, SyncController.DataTypes.ANALYTICS_EVENT));
        this.analyticsEventController = new AnalyticsEventController(keyValueStorage, new DispatchQueue(false), syncController);
        syncController.addSpecification(new GenericSyncSpecification(1, 24L, TimeUnit.HOURS, SyncController.DataTypes.SESSION));
        SessionController sessionController = new SessionController(syncController, new DispatchQueue(false), CampaignsStorageFactory.getInstance().sessionStorage, Integer.valueOf(NetworkConstants.DEFAULT_REQUEST_MAX_SIZE));
        this.sessionController = sessionController;
        syncController.addSpecification(new GenericSyncSpecification(1, 24L, TimeUnit.HOURS, SyncController.DataTypes.USER));
        UserController userController = new UserController(syncController, sessionController, switchUserController, new DispatchQueue(false), propertyStorage, Integer.valueOf(NetworkConstants.DEFAULT_REQUEST_MAX_SIZE), sdkInfoModel);
        this.userController = userController;
        this.inboxSyncController = new InboxSyncController(CampaignsStorageFactory.getInstance().campaignStorage, CampaignsStorageFactory.getInstance().campaignSyncModelStorage, userController, keyValueStorage);
    }

    public static ControllerFactory getInstance() {
        return LazyHolder.INSTANCE;
    }

    private static class LazyHolder {
        static final ControllerFactory INSTANCE = new ControllerFactory();

        private LazyHolder() {
        }
    }
}
