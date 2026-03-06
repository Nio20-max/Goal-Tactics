package com.helpshift.campaigns.util.constants;

import java.util.HashSet;

/* JADX INFO: loaded from: classes.dex */
public class SyncStatus {
    public static final Integer UNSYNCED = 0;
    public static final Integer SYNCED = 1;
    public static final Integer SYNCING = 2;
    public static final HashSet valueSet = initializeValueSet();

    private SyncStatus() {
    }

    private static HashSet<Integer> initializeValueSet() {
        HashSet<Integer> hashSet = new HashSet<>();
        hashSet.add(0);
        hashSet.add(1);
        hashSet.add(2);
        return hashSet;
    }
}
