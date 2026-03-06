package com.helpshift.db.conversation.migration;

import android.database.sqlite.SQLiteDatabase;
import com.helpshift.db.base.IMigrator;
import com.helpshift.db.conversation.ConversationDatabaseContract;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationDbMigration_10_to_11 implements IMigrator {
    private final String TAG = "Helpshft_dbMgrte10_11";

    @Override // com.helpshift.db.base.IMigrator
    public void migrate(SQLiteDatabase sQLiteDatabase) throws Exception {
        sQLiteDatabase.execSQL(ConversationDatabaseContract.CREATE_ACTION_CARD_TABLE);
        sQLiteDatabase.execSQL(ConversationDatabaseContract.CREATE_ACTION_TABLE);
    }
}
