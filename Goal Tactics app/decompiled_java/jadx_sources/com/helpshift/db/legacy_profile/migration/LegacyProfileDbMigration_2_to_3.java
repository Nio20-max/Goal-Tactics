package com.helpshift.db.legacy_profile.migration;

import android.database.sqlite.SQLiteDatabase;
import com.helpshift.db.base.IMigrator;

/* JADX INFO: loaded from: classes2.dex */
public class LegacyProfileDbMigration_2_to_3 implements IMigrator {
    private static final String ALTER_PROFILES_TABLE_ADD_PUSH_TOKEN_SYNC_STATUS = "ALTER TABLE profiles ADD push_token_sync INTEGER";

    @Override // com.helpshift.db.base.IMigrator
    public void migrate(SQLiteDatabase sQLiteDatabase) throws Exception {
        sQLiteDatabase.execSQL(ALTER_PROFILES_TABLE_ADD_PUSH_TOKEN_SYNC_STATUS);
    }
}
