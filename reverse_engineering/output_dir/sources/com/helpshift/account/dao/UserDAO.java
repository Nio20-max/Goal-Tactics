package com.helpshift.account.dao;

import com.helpshift.account.domainmodel.UserDM;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public interface UserDAO {
    boolean activateUser(Long l);

    UserDM createUser(UserDM userDM);

    boolean deleteUser(Long l);

    void dropAndCreateDatabase();

    UserDM fetchUser(Long l);

    UserDM fetchUser(String str, String str2);

    List<UserDM> fetchUsers();

    UserDM getActiveUser();

    UserDM getAnonymousUser();

    boolean updateUser(UserDM userDM);
}
