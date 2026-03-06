package com.helpshift.controllers;

import com.helpshift.storage.KeyValueStorage;

/* JADX INFO: loaded from: classes2.dex */
public class DataSyncCoordinatorImpl implements DataSyncCoordinator {
    public static final String FIRST_DEVICE_SYNC_COMPLETE_KEY = "firstDeviceSyncComplete";
    private DataSyncCompletionListener dataSyncCompletionListener;
    private KeyValueStorage storage;

    protected DataSyncCoordinatorImpl(KeyValueStorage keyValueStorage) {
        this.storage = keyValueStorage;
    }

    protected DataSyncCoordinatorImpl(KeyValueStorage keyValueStorage, DataSyncCompletionListener dataSyncCompletionListener) {
        this(keyValueStorage);
        this.dataSyncCompletionListener = dataSyncCompletionListener;
    }

    private static boolean isBoolean(Boolean bool) {
        return bool != null && bool.booleanValue();
    }

    private boolean canSyncProperties(String str) {
        boolean zIsBoolean = isBoolean((Boolean) this.storage.get(FIRST_DEVICE_SYNC_COMPLETE_KEY));
        KeyValueStorage keyValueStorage = this.storage;
        StringBuilder sb = new StringBuilder();
        sb.append("switchUserCompleteFor");
        sb.append(str);
        return zIsBoolean && isBoolean((Boolean) keyValueStorage.get(sb.toString()));
    }

    @Override // com.helpshift.controllers.DataSyncCoordinator
    public boolean canSyncUserProperties(String str) {
        return canSyncProperties(str);
    }

    @Override // com.helpshift.controllers.DataSyncCoordinator
    public boolean canSyncSessionProperties(String str) {
        return canSyncProperties(str);
    }

    @Override // com.helpshift.controllers.DataSyncCoordinator
    public void firstDeviceSyncComplete() {
        this.storage.set(FIRST_DEVICE_SYNC_COMPLETE_KEY, true);
        DataSyncCompletionListener dataSyncCompletionListener = this.dataSyncCompletionListener;
        if (dataSyncCompletionListener != null) {
            dataSyncCompletionListener.firstDeviceSyncComplete();
        }
    }

    @Override // com.helpshift.controllers.DataSyncCoordinator
    public boolean isFirstDeviceSyncComplete() {
        return isBoolean((Boolean) this.storage.get(FIRST_DEVICE_SYNC_COMPLETE_KEY));
    }

    @Override // com.helpshift.controllers.DataSyncCoordinator
    public void switchUserPending(String str) {
        this.storage.set("switchUserCompleteFor" + str, false);
    }

    @Override // com.helpshift.controllers.DataSyncCoordinator
    public void switchUserComplete(String str) {
        this.storage.set("switchUserCompleteFor" + str, true);
        DataSyncCompletionListener dataSyncCompletionListener = this.dataSyncCompletionListener;
        if (dataSyncCompletionListener != null) {
            dataSyncCompletionListener.switchUserComplete(str);
        }
    }
}
