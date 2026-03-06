package com.helpshift.campaigns.storage;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.helpshift.util.HSLogger;

/* JADX INFO: loaded from: classes.dex */
class CampaignDbStorageHelper extends SQLiteOpenHelper {
    private static final String ALTER_TABLE_ADD_EXPIRY_TIME_STAMP = "ALTER TABLE campaigns ADD expiry_time_stamp INT DEFAULT 9223372036854775807";
    private static final String DATABASE_NAME = CampaignsDBNameRepo.getCampaignsDbName();
    private static final int DATABASE_VERSION = 2;
    private static final String TAG = "Helpshift_CampDBHelper";

    CampaignDbStorageHelper(Context context) {
        super(context, DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, 2);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS campaigns(identifier text primary key, user_identifier text not null, title text not null, body text not null, cover_image_url text, cover_image_file_path text, icon_image_url text not null, icon_image_file_path text, background_color text, title_color text, text_color text, actions blob, messages blob, read_status int, seen_status int, created_at int, extra_data text, expiry_time_stamp int default 9223372036854775807);");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        if (sQLiteDatabase == null || !sQLiteDatabase.isOpen() || i >= 2) {
            return;
        }
        try {
            sQLiteDatabase.execSQL(ALTER_TABLE_ADD_EXPIRY_TIME_STAMP);
        } catch (Exception e) {
            HSLogger.e(TAG, "Exception while upgrading campaigns database", e);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onDowngrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        if (sQLiteDatabase == null || !sQLiteDatabase.isOpen()) {
            return;
        }
        try {
            dropTable(sQLiteDatabase);
            onCreate(sQLiteDatabase);
        } catch (Exception e) {
            HSLogger.e(TAG, "Exception while downgrading campaigns database", e);
        }
    }

    void dropTable(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS campaigns;");
    }
}
