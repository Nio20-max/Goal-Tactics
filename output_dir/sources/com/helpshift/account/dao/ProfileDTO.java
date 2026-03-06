package com.helpshift.account.dao;

import java.io.Serializable;

/* JADX INFO: loaded from: classes.dex */
public class ProfileDTO implements Serializable {
    public final String did;
    public final String email;
    public final String identifier;
    public final boolean isPushTokenSynced;
    public final Long localId;
    public final String name;
    public final String saltedIdentifier;
    public final String serverId;
    public final String uid;

    public ProfileDTO(Long l, String str, String str2, String str3, String str4, String str5, String str6, String str7, boolean z) {
        this.localId = l;
        this.serverId = str2;
        this.identifier = str;
        this.name = str3;
        this.email = str4;
        this.saltedIdentifier = str5;
        this.uid = str6;
        this.did = str7;
        this.isPushTokenSynced = z;
    }
}
