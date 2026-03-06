package com.helpshift.account.dao;

import com.helpshift.common.platform.KVStore;

/* JADX INFO: loaded from: classes.dex */
public class AndroidUserManagerDAO implements UserManagerDAO {
    private static final String USER_META_IDENTIFIER = "userMetaIdentifier";
    private final KVStore kvStore;

    public AndroidUserManagerDAO(KVStore kVStore) {
        this.kvStore = kVStore;
    }

    @Override // com.helpshift.account.dao.UserManagerDAO
    public String getUserMetaIdentifier() {
        return this.kvStore.getString(USER_META_IDENTIFIER, "");
    }

    @Override // com.helpshift.account.dao.UserManagerDAO
    public void setUserMetaIdentifier(String str) {
        this.kvStore.setString(USER_META_IDENTIFIER, str);
    }
}
