package com.helpshift.db.conversation.migration;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.helpshift.db.base.IMigrator;
import com.helpshift.db.conversation.tables.ConversationTable;
import com.helpshift.util.HSLogger;
import com.helpshift.util.StringUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationDbMigration_8_to_9 implements IMigrator {
    private final String TAG = "Helpshift_dbMigrate8_9";
    private String ADD_ACID_COLUMN_TO_CONVERSATION_TABLE = "ALTER TABLE issues ADD COLUMN acid TEXT ;";
    private String GET_ALL_CONVERSATION_QUERY = "SELECT _id , server_id , pre_conv_server_id FROM issues ;";

    @Override // com.helpshift.db.base.IMigrator
    public void migrate(SQLiteDatabase sQLiteDatabase) throws Exception {
        migrateTable(sQLiteDatabase);
        migrateData(sQLiteDatabase);
    }

    private void migrateTable(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL(this.ADD_ACID_COLUMN_TO_CONVERSATION_TABLE);
    }

    private void migrateData(SQLiteDatabase sQLiteDatabase) {
        ArrayList arrayList = new ArrayList();
        Cursor cursorRawQuery = sQLiteDatabase.rawQuery(this.GET_ALL_CONVERSATION_QUERY, null);
        try {
            try {
                if (cursorRawQuery.moveToFirst()) {
                    do {
                        Long lValueOf = Long.valueOf(cursorRawQuery.getLong(cursorRawQuery.getColumnIndex("_id")));
                        String string = cursorRawQuery.getString(cursorRawQuery.getColumnIndex("server_id"));
                        String string2 = cursorRawQuery.getString(cursorRawQuery.getColumnIndex(ConversationTable.Columns.PRE_CONVERSATION_SERVER_ID));
                        if (StringUtils.isEmpty(string) && StringUtils.isEmpty(string2)) {
                            arrayList.add(lValueOf);
                        }
                    } while (cursorRawQuery.moveToNext());
                }
            } catch (Exception e) {
                HSLogger.e("Helpshift_dbMigrate8_9", "Failed to read db conversations", e);
                if (cursorRawQuery != null) {
                }
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                updateAcidValueForConversation((Long) it.next(), sQLiteDatabase);
            }
        } finally {
            if (cursorRawQuery != null) {
                cursorRawQuery.close();
            }
        }
    }

    private void updateAcidValueForConversation(Long l, SQLiteDatabase sQLiteDatabase) {
        String string = UUID.randomUUID().toString();
        ContentValues contentValues = new ContentValues();
        contentValues.put("acid", string);
        sQLiteDatabase.update(ConversationTable.TABLE_NAME, contentValues, "_id = ?", new String[]{String.valueOf(l)});
    }
}
