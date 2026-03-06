package com.helpshift.db.legacy_profile.migration;

import android.database.sqlite.SQLiteDatabase;
import com.helpshift.db.base.IMigrator;

/* JADX INFO: loaded from: classes2.dex */
public class LegacyProfileDbMigration_1_to_2 implements IMigrator {
    private final String ALTER_PROFILES_TABLE_ADD_USER_ID = "ALTER TABLE profiles ADD uid TEXT";
    private final String ALTER_PROFILES_TABLE_ADD_DEVICE_ID = "ALTER TABLE profiles ADD did TEXT";

    @Override // com.helpshift.db.base.IMigrator
    public void migrate(SQLiteDatabase sQLiteDatabase) throws Exception {
        sQLiteDatabase.execSQL("ALTER TABLE profiles ADD uid TEXT");
        sQLiteDatabase.execSQL("ALTER TABLE profiles ADD did TEXT");
    }
}
