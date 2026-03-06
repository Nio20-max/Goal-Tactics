package com.helpshift.db.user.migration;

import android.database.sqlite.SQLiteDatabase;
import com.helpshift.db.base.IMigrator;
import com.helpshift.db.user.UserDatabaseContract;

/* JADX INFO: loaded from: classes2.dex */
public class UserDbMigration_1_to_2 implements IMigrator {
    private UserDatabaseContract contract;

    public UserDbMigration_1_to_2(UserDatabaseContract userDatabaseContract) {
        this.contract = userDatabaseContract;
    }

    @Override // com.helpshift.db.base.IMigrator
    public void migrate(SQLiteDatabase sQLiteDatabase) throws Exception {
        this.contract.getClass();
        sQLiteDatabase.execSQL("CREATE TABLE redaction_info_table ( user_local_id INTEGER PRIMARY KEY, redaction_state INTEGER , redaction_type INTEGER );");
    }
}
