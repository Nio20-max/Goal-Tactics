package com.helpshift.campaigns.storage;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.helpshift.campaigns.util.constants.Tables;
import com.helpshift.util.StringUtil;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
public class PropertyDbHelper extends SQLiteOpenHelper {
    private static final String DATABASE_NAME = CampaignsDBNameRepo.getPropertyDbName();
    private static final Integer DATABASE_VERSION = 1;
    private HashSet<String> identifiers;

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
    }

    PropertyDbHelper(Context context) {
        super(context, DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, DATABASE_VERSION.intValue());
        this.identifiers = new HashSet<>();
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        dropTables(sQLiteDatabase);
        onCreate(sQLiteDatabase);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onDowngrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        dropTables(sQLiteDatabase);
        onCreate(sQLiteDatabase);
    }

    public synchronized void createIdentifierTable(SQLiteDatabase sQLiteDatabase, String str) {
        this.identifiers.add(str);
        sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS " + getTableName(str) + " (key text primary key, value blob, type text, sync_status int, extras blob);");
    }

    public void dropIdentifierTable(SQLiteDatabase sQLiteDatabase, String str) {
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS " + getTableName(str) + ";");
    }

    public void dropTables(SQLiteDatabase sQLiteDatabase) {
        Iterator<String> it = this.identifiers.iterator();
        while (it.hasNext()) {
            dropIdentifierTable(sQLiteDatabase, it.next());
        }
    }

    String getTableName(String str) {
        return StringUtil.escapeForSql(Tables.PROPERTY + str);
    }
}
