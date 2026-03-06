package com.helpshift.account.dao;

import com.helpshift.account.domainmodel.UserDM;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AndroidUserDAO implements UserDAO {
    private final UserDB userDB;

    public AndroidUserDAO(UserDB userDB) {
        this.userDB = userDB;
    }

    @Override // com.helpshift.account.dao.UserDAO
    public UserDM createUser(UserDM userDM) {
        if (userDM == null) {
            return null;
        }
        return this.userDB.createUser(userDM);
    }

    @Override // com.helpshift.account.dao.UserDAO
    public boolean updateUser(UserDM userDM) {
        if (userDM == null) {
            return false;
        }
        return this.userDB.updateUser(userDM);
    }

    @Override // com.helpshift.account.dao.UserDAO
    public UserDM fetchUser(Long l) {
        if (l == null) {
            return null;
        }
        return this.userDB.fetchUser(l);
    }

    @Override // com.helpshift.account.dao.UserDAO
    public UserDM fetchUser(String str, String str2) {
        if (str == null && str2 == null) {
            return null;
        }
        return this.userDB.fetchUser(str, str2);
    }

    @Override // com.helpshift.account.dao.UserDAO
    public UserDM getActiveUser() {
        return this.userDB.getActiveUser();
    }

    @Override // com.helpshift.account.dao.UserDAO
    public UserDM getAnonymousUser() {
        return this.userDB.getAnonymousUser();
    }

    @Override // com.helpshift.account.dao.UserDAO
    public List<UserDM> fetchUsers() {
        return this.userDB.fetchUsers();
    }

    @Override // com.helpshift.account.dao.UserDAO
    public boolean activateUser(Long l) {
        if (l == null || this.userDB.fetchUser(l) == null) {
            return false;
        }
        return this.userDB.activateUser(l);
    }

    @Override // com.helpshift.account.dao.UserDAO
    public boolean deleteUser(Long l) {
        if (l == null) {
            return false;
        }
        return this.userDB.deleteUser(l);
    }

    @Override // com.helpshift.account.dao.UserDAO
    public void dropAndCreateDatabase() {
        this.userDB.dropAndCreateDatabase();
    }
}
