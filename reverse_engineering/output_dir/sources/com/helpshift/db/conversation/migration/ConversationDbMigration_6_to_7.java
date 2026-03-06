package com.helpshift.db.conversation.migration;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.db.base.IMigrator;
import com.helpshift.db.conversation.tables.ConversationTable;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationDbMigration_6_to_7 implements IMigrator {
    private String ADD_HAS_OLDER_MESSAGES_COLUMN_INTO_INBOX_TABLE = "ALTER TABLE conversation_inbox ADD COLUMN has_older_messages INT ;";
    private String ADD_LAST_CONVERSATIONS_REDACTED_TIME_COLUMN_INTO_INBOX_TABLE = "ALTER TABLE conversation_inbox ADD COLUMN last_conv_redaction_time INT ;";
    private String ADD_FULL_PRIVACY_ENABLED_COLUMN_INTO_CONVERSATIONS_TABLE = "ALTER TABLE issues ADD COLUMN full_privacy_enabled INTEGER ;";
    private String ADD_IS_REDACTED_COLUMN_INTO_CONVERSATIONS_TABLE = "ALTER TABLE issues ADD COLUMN is_redacted INTEGER ;";
    private String ADD_EPOCH_TIME_CREATE_AT_COLUMN_INTO_CONVERSATIONS_TABLE = "ALTER TABLE issues ADD COLUMN epoch_time_created_at INTEGER NOT NULL DEFAULT 0 ;";
    private String ADD_IS_REDACTED_COLUMN_INTO_MESSAGES_TABLE = "ALTER TABLE messages ADD COLUMN is_redacted INTEGER ;";
    private String ADD_EPOCH_TIME_CREATE_AT_COLUMN_INTO_MESSAGES_TABLE = "ALTER TABLE messages ADD COLUMN epoch_time_created_at INTEGER NOT NULL DEFAULT 0 ;";

    @Override // com.helpshift.db.base.IMigrator
    public void migrate(SQLiteDatabase sQLiteDatabase) {
        migrateTable(sQLiteDatabase);
        migrateData(sQLiteDatabase);
    }

    private void migrateTable(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL(this.ADD_HAS_OLDER_MESSAGES_COLUMN_INTO_INBOX_TABLE);
        sQLiteDatabase.execSQL(this.ADD_LAST_CONVERSATIONS_REDACTED_TIME_COLUMN_INTO_INBOX_TABLE);
        sQLiteDatabase.execSQL(this.ADD_FULL_PRIVACY_ENABLED_COLUMN_INTO_CONVERSATIONS_TABLE);
        sQLiteDatabase.execSQL(this.ADD_IS_REDACTED_COLUMN_INTO_CONVERSATIONS_TABLE);
        sQLiteDatabase.execSQL(this.ADD_EPOCH_TIME_CREATE_AT_COLUMN_INTO_MESSAGES_TABLE);
        sQLiteDatabase.execSQL(this.ADD_IS_REDACTED_COLUMN_INTO_MESSAGES_TABLE);
        sQLiteDatabase.execSQL(this.ADD_EPOCH_TIME_CREATE_AT_COLUMN_INTO_CONVERSATIONS_TABLE);
    }

    private void migrateData(SQLiteDatabase sQLiteDatabase) {
        HashMap map = new HashMap();
        String[] strArr = {"_id", "created_at"};
        Cursor cursorQuery = sQLiteDatabase.query(ConversationTable.TABLE_NAME, strArr, null, null, null, null, null);
        if (cursorQuery.moveToFirst()) {
            do {
                map.put(Long.valueOf(cursorQuery.getLong(cursorQuery.getColumnIndex("_id"))), cursorQuery.getString(cursorQuery.getColumnIndex("created_at")));
            } while (cursorQuery.moveToNext());
        }
        cursorQuery.close();
        HashMap map2 = new HashMap();
        Cursor cursorQuery2 = sQLiteDatabase.query("messages", strArr, null, null, null, null, null);
        if (cursorQuery2.moveToFirst()) {
            do {
                map2.put(Long.valueOf(cursorQuery2.getLong(cursorQuery2.getColumnIndex("_id"))), cursorQuery2.getString(cursorQuery2.getColumnIndex("created_at")));
            } while (cursorQuery2.moveToNext());
        }
        cursorQuery2.close();
        HashMap map3 = new HashMap();
        for (Map.Entry entry : map.entrySet()) {
            map3.put(entry.getKey(), Long.valueOf(HSDateFormatSpec.convertToEpochTime((String) entry.getValue())));
        }
        HashMap map4 = new HashMap();
        for (Map.Entry entry2 : map2.entrySet()) {
            map4.put(entry2.getKey(), Long.valueOf(HSDateFormatSpec.convertToEpochTime((String) entry2.getValue())));
        }
        for (Map.Entry entry3 : map3.entrySet()) {
            Long l = (Long) entry3.getKey();
            Long l2 = (Long) entry3.getValue();
            ContentValues contentValues = new ContentValues();
            contentValues.put("epoch_time_created_at", l2);
            sQLiteDatabase.update(ConversationTable.TABLE_NAME, contentValues, "_id = ?", new String[]{String.valueOf(l)});
        }
        for (Map.Entry entry4 : map4.entrySet()) {
            Long l3 = (Long) entry4.getKey();
            Long l4 = (Long) entry4.getValue();
            ContentValues contentValues2 = new ContentValues();
            contentValues2.put("epoch_time_created_at", l4);
            sQLiteDatabase.update("messages", contentValues2, "_id = ?", new String[]{String.valueOf(l3)});
        }
    }
}
