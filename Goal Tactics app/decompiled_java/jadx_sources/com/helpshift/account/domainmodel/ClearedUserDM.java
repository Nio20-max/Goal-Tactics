package com.helpshift.account.domainmodel;

import com.helpshift.account.dao.ClearedUserSyncState;

/* JADX INFO: loaded from: classes.dex */
public class ClearedUserDM {
    public final String authToken;
    public final String deviceId;
    public final String email;
    public final String identifier;
    public final Long localId;
    public final ClearedUserSyncState syncState;

    public ClearedUserDM(Long l, String str, String str2, String str3, String str4, ClearedUserSyncState clearedUserSyncState) {
        this.localId = l;
        this.identifier = str;
        this.email = str2;
        this.authToken = str3;
        this.deviceId = str4;
        this.syncState = clearedUserSyncState;
    }
}
