package com.helpshift.db.conversation.migration;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.helpshift.db.base.IMigrator;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationDbMigration_7_to_8 implements IMigrator {
    private String TEMP_TABLE_CONVERSATIONS = "issues_old";
    private String RENAME_CONVERSATION_TABLE = "ALTER TABLE issues RENAME TO " + this.TEMP_TABLE_CONVERSATIONS;
    private final String CREATE_CONVERSATION_TABLE_DB_VERSION_8 = "CREATE TABLE issues ( _id INTEGER PRIMARY KEY AUTOINCREMENT,server_id TEXT UNIQUE, pre_conv_server_id TEXT UNIQUE, publish_id TEXT, uuid TEXT NOT NULL, user_local_id TEXT NOT NULL, title TEXT NOT NULL,issue_type TEXT NOT NULL, state INTEGER NOT NULL, show_agent_name INTEGER,message_cursor TEXT,start_new_conversation_action INTEGER, is_redacted INTEGER, meta TEXT,last_user_activity_time INTEGER, full_privacy_enabled INTEGER, epoch_time_created_at INTEGER NOT NULL, created_at TEXT NOT NULL,updated_at TEXT NOT NULL  );";

    @Override // com.helpshift.db.base.IMigrator
    public void migrate(SQLiteDatabase sQLiteDatabase) throws Exception {
        if (getDuplicacyRecord(sQLiteDatabase) == 0) {
            migrateTable(sQLiteDatabase);
            migrateData(sQLiteDatabase);
            dropTemporaryTables(sQLiteDatabase);
            return;
        }
        throw new Exception("Migration not possible as duplicate issue exists");
    }

    private void migrateTable(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL(this.RENAME_CONVERSATION_TABLE);
        sQLiteDatabase.execSQL("CREATE TABLE issues ( _id INTEGER PRIMARY KEY AUTOINCREMENT,server_id TEXT UNIQUE, pre_conv_server_id TEXT UNIQUE, publish_id TEXT, uuid TEXT NOT NULL, user_local_id TEXT NOT NULL, title TEXT NOT NULL,issue_type TEXT NOT NULL, state INTEGER NOT NULL, show_agent_name INTEGER,message_cursor TEXT,start_new_conversation_action INTEGER, is_redacted INTEGER, meta TEXT,last_user_activity_time INTEGER, full_privacy_enabled INTEGER, epoch_time_created_at INTEGER NOT NULL, created_at TEXT NOT NULL,updated_at TEXT NOT NULL  );");
    }

    private void migrateData(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("INSERT INTO issues (_id, server_id, pre_conv_server_id, publish_id, uuid, user_local_id, title,issue_type, state, show_agent_name,message_cursor,start_new_conversation_action, is_redacted, meta,last_user_activity_time, full_privacy_enabled, epoch_time_created_at, created_at, updated_at ) SELECT _id, server_id, pre_conv_server_id, publish_id, uuid, user_local_id, title,issue_type, state, show_agent_name,message_cursor,start_new_conversation_action, is_redacted, meta,last_user_activity_time, full_privacy_enabled, epoch_time_created_at, created_at, updated_at FROM " + this.TEMP_TABLE_CONVERSATIONS);
    }

    private int getDuplicacyRecord(SQLiteDatabase sQLiteDatabase) {
        return getDuplicateRecord("SELECT Count(server_id) , Count(DISTINCT server_id) FROM issues", sQLiteDatabase) + getDuplicateRecord("SELECT Count(pre_conv_server_id) , Count(DISTINCT pre_conv_server_id) FROM issues", sQLiteDatabase);
    }

    private int getDuplicateRecord(String str, SQLiteDatabase sQLiteDatabase) {
        Cursor cursorRawQuery = sQLiteDatabase.rawQuery(str, null);
        try {
            return cursorRawQuery.moveToFirst() ? cursorRawQuery.getInt(0) - cursorRawQuery.getInt(1) : 0;
        } finally {
            if (cursorRawQuery != null) {
                cursorRawQuery.close();
            }
        }
    }

    private void dropTemporaryTables(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS " + this.TEMP_TABLE_CONVERSATIONS);
    }
}
