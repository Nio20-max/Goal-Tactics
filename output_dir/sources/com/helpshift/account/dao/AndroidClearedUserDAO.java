package com.helpshift.account.dao;

import com.helpshift.account.domainmodel.ClearedUserDM;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AndroidClearedUserDAO implements ClearedUserDAO {
    private final UserDB userDB;

    public AndroidClearedUserDAO(UserDB userDB) {
        this.userDB = userDB;
    }

    @Override // com.helpshift.account.dao.ClearedUserDAO
    public ClearedUserDM insertClearedUser(ClearedUserDM clearedUserDM) {
        if (clearedUserDM == null) {
            return null;
        }
        return this.userDB.insertClearedUser(clearedUserDM);
    }

    @Override // com.helpshift.account.dao.ClearedUserDAO
    public List<ClearedUserDM> fetchClearedUsers() {
        return this.userDB.fetchClearedUsers();
    }

    @Override // com.helpshift.account.dao.ClearedUserDAO
    public boolean updateSyncState(Long l, ClearedUserSyncState clearedUserSyncState) {
        if (l == null || clearedUserSyncState == null) {
            return false;
        }
        return this.userDB.updateClearedUserSyncState(l, clearedUserSyncState);
    }

    @Override // com.helpshift.account.dao.ClearedUserDAO
    public boolean deleteClearedUser(Long l) {
        if (l == null) {
            return false;
        }
        return this.userDB.deleteClearedUser(l);
    }
}
