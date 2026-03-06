package com.helpshift.controllers;

import com.helpshift.campaigns.storage.CampaignsStorageFactory;
import com.helpshift.specifications.SyncSpecification;
import com.helpshift.storage.KeyValueStorage;
import com.helpshift.util.TimeUtil;

/* JADX INFO: loaded from: classes2.dex */
public class ControllerFactory {
    public final DataSyncCoordinator dataSyncCoordinator;
    public final SyncController syncController;

    ControllerFactory() {
        KeyValueStorage keyValueStorage = CampaignsStorageFactory.getInstance().keyValueStorage;
        SyncController syncController = new SyncController(keyValueStorage, new TimeUtil(), new SyncSpecification[0]);
        this.syncController = syncController;
        this.dataSyncCoordinator = new DataSyncCoordinatorImpl(keyValueStorage, syncController);
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
