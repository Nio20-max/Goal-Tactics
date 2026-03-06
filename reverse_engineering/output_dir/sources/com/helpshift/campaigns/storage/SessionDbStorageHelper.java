package com.helpshift.campaigns.storage;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/* JADX INFO: loaded from: classes.dex */
public class SessionDbStorageHelper extends SQLiteOpenHelper {
    private static final String DATABASE_NAME = CampaignsDBNameRepo.getSessionsDbName();
    private static final Integer DATABASE_VERSION = 1;

    SessionDbStorageHelper(Context context) {
        super(context, DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, DATABASE_VERSION.intValue());
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("CREATE TABLE sessions(identifier text primary key, device_identifier text not null, user_identifier text not null, start_time int, end_time int, durations blob, sync_status int, extras blob );");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        dropTable(sQLiteDatabase);
        onCreate(sQLiteDatabase);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onDowngrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        dropTable(sQLiteDatabase);
        onCreate(sQLiteDatabase);
    }

    private void dropTable(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS sessions;");
    }
}
