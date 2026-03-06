package com.helpshift.controllers;

/* JADX INFO: loaded from: classes2.dex */
public interface DataSyncCoordinator {
    boolean canSyncSessionProperties(String str);

    boolean canSyncUserProperties(String str);

    void firstDeviceSyncComplete();

    boolean isFirstDeviceSyncComplete();

    void switchUserComplete(String str);

    void switchUserPending(String str);
}
