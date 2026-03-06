package com.helpshift.account.dao;

import com.helpshift.migration.LegacyProfileMigrationDAO;
import com.helpshift.migration.MigrationState;
import com.helpshift.migration.legacyUser.LegacyProfile;
import com.helpshift.util.ListUtils;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class AndroidLegacyProfileMigrationDAO implements LegacyProfileMigrationDAO {
    private final UserDB userDB;

    public AndroidLegacyProfileMigrationDAO(UserDB userDB) {
        this.userDB = userDB;
    }

    @Override // com.helpshift.migration.LegacyProfileMigrationDAO
    public void storeLegacyProfiles(List<LegacyProfile> list) {
        if (ListUtils.isEmpty(list)) {
            return;
        }
        this.userDB.storeLegacyProfiles(list);
    }

    @Override // com.helpshift.migration.LegacyProfileMigrationDAO
    public void deleteLegacyProfile(String str) {
        if (str == null) {
            return;
        }
        this.userDB.deleteLegacyProfile(str);
    }

    @Override // com.helpshift.migration.LegacyProfileMigrationDAO
    public LegacyProfile fetchLegacyProfile(String str) {
        if (str == null) {
            return null;
        }
        return this.userDB.fetchLegacyProfile(str);
    }

    @Override // com.helpshift.migration.LegacyProfileMigrationDAO
    public boolean updateMigrationState(String str, MigrationState migrationState) {
        if (str == null || migrationState == null) {
            return false;
        }
        return this.userDB.updateUserMigrationState(str, migrationState);
    }
}
