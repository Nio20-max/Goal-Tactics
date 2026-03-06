package com.helpshift.logger.database;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

/* JADX INFO: loaded from: classes2.dex */
public class LogStorageSQLiteHelper extends SQLiteOpenHelper {
    private static final int DB_VERSION = 2;
    private static final String TAG = "LogSQLiteHelper";

    public LogStorageSQLiteHelper(Context context, String str) {
        super(context, str, (SQLiteDatabase.CursorFactory) null, 2);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        try {
            try {
                sQLiteDatabase.beginTransaction();
                sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS LOG_MESSAGES( TIMESTAMP TEXT, MESSAGE TEXT, LEVEL TEXT, STACKTRACE TEXT, EXTRAS TEXT, SDK_VERSION TEXT  );");
                sQLiteDatabase.setTransactionSuccessful();
            } catch (Exception e) {
                Log.e(TAG, "Error creating log storage: ", e);
            }
        } finally {
            sQLiteDatabase.endTransaction();
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        if (i < 2) {
            sQLiteDatabase.execSQL("ALTER TABLE LOG_MESSAGES ADD COLUMN SDK_VERSION TEXT ;");
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onDowngrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS LOG_MESSAGES;");
    }
}
