package com.helpshift.db.base;

import android.database.sqlite.SQLiteDatabase;
import java.util.Iterator;

/* JADX INFO: loaded from: classes2.dex */
public class DropAndCreateDatabaseMigrator implements IMigrator {
    private DatabaseContract contract;

    public DropAndCreateDatabaseMigrator(DatabaseContract databaseContract) {
        this.contract = databaseContract;
    }

    @Override // com.helpshift.db.base.IMigrator
    public void migrate(SQLiteDatabase sQLiteDatabase) {
        dropAllTables(sQLiteDatabase);
        createAllTables(sQLiteDatabase);
    }

    private void dropAllTables(SQLiteDatabase sQLiteDatabase) {
        Iterator<String> it = this.contract.getTableNames().iterator();
        while (it.hasNext()) {
            sQLiteDatabase.execSQL("DROP TABLE IF EXISTS " + it.next());
        }
    }

    private void createAllTables(SQLiteDatabase sQLiteDatabase) {
        Iterator<String> it = this.contract.getCreateTableQueries().iterator();
        while (it.hasNext()) {
            sQLiteDatabase.execSQL(it.next());
        }
    }
}
