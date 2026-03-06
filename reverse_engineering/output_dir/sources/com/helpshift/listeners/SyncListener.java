package com.helpshift.listeners;

import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public abstract class SyncListener {
    private String dataType;

    public void fullSync() {
    }

    public Set<String> getDependentChildDataTypes() {
        return null;
    }

    public abstract boolean isFullSyncEnabled();

    public abstract void sync();

    public SyncListener(String str) {
        this.dataType = str;
    }

    public String getDataType() {
        return this.dataType;
    }
}
