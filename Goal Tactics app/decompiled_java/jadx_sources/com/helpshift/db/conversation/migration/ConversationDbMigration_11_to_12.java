package com.helpshift.db.conversation.migration;

import android.database.sqlite.SQLiteDatabase;
import com.helpshift.db.base.IMigrator;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationDbMigration_11_to_12 implements IMigrator {
    private final String TAG = "Helpshft_dbMgrte11_12";
    private final String ADD_FEEDBACK_BOT_ENABLED_COLUMN = "ALTER TABLE issues ADD COLUMN feedback_bots_enabled INTEGER ;";
    private final String ADD_CAN_START_NEW_CONVERSATION_COLUMN = "ALTER TABLE issues ADD COLUMN can_start_new_conversation INTEGER ;";

    @Override // com.helpshift.db.base.IMigrator
    public void migrate(SQLiteDatabase sQLiteDatabase) throws Exception {
        sQLiteDatabase.execSQL("ALTER TABLE issues ADD COLUMN feedback_bots_enabled INTEGER ;");
        sQLiteDatabase.execSQL("ALTER TABLE issues ADD COLUMN can_start_new_conversation INTEGER ;");
    }
}
