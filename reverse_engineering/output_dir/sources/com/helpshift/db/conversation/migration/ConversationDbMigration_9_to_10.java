package com.helpshift.db.conversation.migration;

import android.database.sqlite.SQLiteDatabase;
import com.helpshift.db.base.IMigrator;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationDbMigration_9_to_10 implements IMigrator {
    private final String TAG = "Helpshft_dbMigrate9_10";
    private String ADD_AUTHOR_ID_COLUMN_TO_MESSAGE_TABLE = "ALTER TABLE messages ADD COLUMN author_id TEXT; ";
    private String ADD_AUTHOR_ROLE_COLUMN_TO_MESSAGE_TABLE = "ALTER TABLE messages ADD COLUMN author_role TEXT; ";
    private String ADD_AVATAR_IMAGE_PATH_COLUMN_TO_MESSAGE_TABLE = "ALTER TABLE messages ADD COLUMN local_avatar_image_path TEXT; ";
    private String ADD_RESOLUTION_EXPIRY_AT_COLUMN_TO_CONVERSATION_TABLE = "ALTER TABLE issues ADD COLUMN resolution_expiry_at INTEGER ;";
    private String ADD_CSAT_EXPIRY_AT_COLUMN_TO_CONVERSATION_TABLE = "ALTER TABLE issues ADD COLUMN csat_expiry_at INTEGER ;";

    @Override // com.helpshift.db.base.IMigrator
    public void migrate(SQLiteDatabase sQLiteDatabase) throws Exception {
        migrateTable(sQLiteDatabase);
    }

    private void migrateTable(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL(this.ADD_AUTHOR_ID_COLUMN_TO_MESSAGE_TABLE);
        sQLiteDatabase.execSQL(this.ADD_AUTHOR_ROLE_COLUMN_TO_MESSAGE_TABLE);
        sQLiteDatabase.execSQL(this.ADD_AVATAR_IMAGE_PATH_COLUMN_TO_MESSAGE_TABLE);
        sQLiteDatabase.execSQL(this.ADD_RESOLUTION_EXPIRY_AT_COLUMN_TO_CONVERSATION_TABLE);
        sQLiteDatabase.execSQL(this.ADD_CSAT_EXPIRY_AT_COLUMN_TO_CONVERSATION_TABLE);
    }
}
