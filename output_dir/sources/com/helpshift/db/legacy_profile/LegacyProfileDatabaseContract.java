package com.helpshift.db.legacy_profile;

import com.helpshift.db.base.DatabaseContract;
import com.helpshift.db.base.IMigrator;
import com.helpshift.db.legacy_profile.migration.LegacyProfileDbMigration_1_to_2;
import com.helpshift.db.legacy_profile.migration.LegacyProfileDbMigration_2_to_3;
import com.helpshift.db.user.tables.LegacyProfileTable;
import com.helpshift.support.db.SupportDBNameRepo;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class LegacyProfileDatabaseContract implements DatabaseContract {
    private static final String TAG = "Helpshift_LProfileDB";
    private final String CREATE_PROFILE_TABLE = "CREATE TABLE profiles(_id INTEGER PRIMARY KEY AUTOINCREMENT, IDENTIFIER TEXT NOT NULL UNIQUE, profile_id TEXT UNIQUE, name TEXT, email TEXT, salt TEXT, uid TEXT, did TEXT, push_token_sync INTEGER );";

    @Override // com.helpshift.db.base.DatabaseContract
    public int getDatabaseVersion() {
        return 3;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public String getTag() {
        return TAG;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public String getDatabaseName() {
        return SupportDBNameRepo.getLegacyProfileDbName();
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getCreateTableQueries() {
        return Collections.singletonList("CREATE TABLE profiles(_id INTEGER PRIMARY KEY AUTOINCREMENT, IDENTIFIER TEXT NOT NULL UNIQUE, profile_id TEXT UNIQUE, name TEXT, email TEXT, salt TEXT, uid TEXT, did TEXT, push_token_sync INTEGER );");
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<IMigrator> getMigratorsForUpgrade(int i) {
        ArrayList arrayList = new ArrayList();
        if (i < 2) {
            arrayList.add(new LegacyProfileDbMigration_1_to_2());
        }
        if (i < 3) {
            arrayList.add(new LegacyProfileDbMigration_2_to_3());
        }
        return arrayList;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getTableNames() {
        return Collections.singletonList(LegacyProfileTable.TABLE_NAME);
    }
}
