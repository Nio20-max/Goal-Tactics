package com.helpshift.logger.database;

import android.content.Context;
import android.util.Log;

/* JADX INFO: loaded from: classes2.dex */
public class LogSQLiteStorage implements LogStorage {
    private static final int MAX_ROWS = 100;
    private static final String TAG = "LogSqliteStorage";
    private static final Object syncLock = new Object();
    private LogStorageSQLiteHelper logStorageSQLiteHelper;

    public LogSQLiteStorage(Context context, String str) {
        this.logStorageSQLiteHelper = new LogStorageSQLiteHelper(context, str);
    }

    /* JADX WARN: Removed duplicated region for block: B:60:0x00b7 A[Catch: all -> 0x00ab, TryCatch #7 {, blocks: (B:20:0x0067, B:25:0x0075, B:49:0x00a2, B:23:0x006c, B:43:0x0093, B:46:0x0098, B:53:0x00a7, B:60:0x00b7, B:61:0x00ba, B:58:0x00ae), top: B:76:0x0004, inners: #0, #2, #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00a7 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:82:? A[Catch: all -> 0x00ab, SYNTHETIC, TryCatch #7 {, blocks: (B:20:0x0067, B:25:0x0075, B:49:0x00a2, B:23:0x006c, B:43:0x0093, B:46:0x0098, B:53:0x00a7, B:60:0x00b7, B:61:0x00ba, B:58:0x00ae), top: B:76:0x0004, inners: #0, #2, #5 }] */
    @Override // com.helpshift.logger.database.LogStorage
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void insert(com.helpshift.logger.model.LogModel r10) {
        /*
            r9 = this;
            java.lang.Object r0 = com.helpshift.logger.database.LogSQLiteStorage.syncLock
            monitor-enter(r0)
            r1 = 0
            com.helpshift.logger.database.LogStorageSQLiteHelper r2 = r9.logStorageSQLiteHelper     // Catch: java.lang.Throwable -> L85 java.lang.Exception -> L88
            android.database.sqlite.SQLiteDatabase r2 = r2.getWritableDatabase()     // Catch: java.lang.Throwable -> L85 java.lang.Exception -> L88
            r2.beginTransaction()     // Catch: java.lang.Throwable -> L7d java.lang.Exception -> L81
            java.lang.String r3 = "SELECT rowid FROM LOG_MESSAGES"
            android.database.Cursor r3 = r2.rawQuery(r3, r1)     // Catch: java.lang.Exception -> L38 java.lang.Throwable -> L7d
            if (r3 == 0) goto L59
            int r4 = r3.getCount()     // Catch: java.lang.Exception -> L36 java.lang.Throwable -> L79
            r5 = 100
            if (r4 < r5) goto L59
            r3.moveToFirst()     // Catch: java.lang.Exception -> L36 java.lang.Throwable -> L79
            r4 = 0
            int r5 = r3.getInt(r4)     // Catch: java.lang.Exception -> L36 java.lang.Throwable -> L79
            java.lang.String r6 = "LOG_MESSAGES"
            java.lang.String r7 = "rowid = ?"
            r8 = 1
            java.lang.String[] r8 = new java.lang.String[r8]     // Catch: java.lang.Exception -> L36 java.lang.Throwable -> L79
            java.lang.String r5 = java.lang.String.valueOf(r5)     // Catch: java.lang.Exception -> L36 java.lang.Throwable -> L79
            r8[r4] = r5     // Catch: java.lang.Exception -> L36 java.lang.Throwable -> L79
            r2.delete(r6, r7, r8)     // Catch: java.lang.Exception -> L36 java.lang.Throwable -> L79
            goto L59
        L36:
            r4 = move-exception
            goto L3a
        L38:
            r4 = move-exception
            r3 = r1
        L3a:
            java.lang.String r5 = "LogSqliteStorage"
            java.lang.StringBuilder r6 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L79 java.lang.Exception -> L7b
            r6.<init>()     // Catch: java.lang.Throwable -> L79 java.lang.Exception -> L7b
            java.lang.String r7 = "Error in rotation of logs + "
            r6.append(r7)     // Catch: java.lang.Throwable -> L79 java.lang.Exception -> L7b
            java.lang.String r4 = r4.getMessage()     // Catch: java.lang.Throwable -> L79 java.lang.Exception -> L7b
            r6.append(r4)     // Catch: java.lang.Throwable -> L79 java.lang.Exception -> L7b
            java.lang.String r4 = r6.toString()     // Catch: java.lang.Throwable -> L79 java.lang.Exception -> L7b
            android.util.Log.w(r5, r4)     // Catch: java.lang.Throwable -> L79 java.lang.Exception -> L7b
            java.lang.String r4 = "LOG_MESSAGES"
            r2.delete(r4, r1, r1)     // Catch: java.lang.Throwable -> L79 java.lang.Exception -> L7b
        L59:
            java.lang.String r4 = "LOG_MESSAGES"
            android.content.ContentValues r10 = com.helpshift.logger.adapters.LogStorageModelAdapter.toContentValues(r10)     // Catch: java.lang.Throwable -> L79 java.lang.Exception -> L7b
            r2.insert(r4, r1, r10)     // Catch: java.lang.Throwable -> L79 java.lang.Exception -> L7b
            r2.setTransactionSuccessful()     // Catch: java.lang.Throwable -> L79 java.lang.Exception -> L7b
            if (r2 == 0) goto L73
            r2.endTransaction()     // Catch: java.lang.Exception -> L6b java.lang.Throwable -> Lab
            goto L73
        L6b:
            r10 = move-exception
            java.lang.String r1 = "LogSqliteStorage"
            java.lang.String r2 = "Error inserting log inside finally block: "
            android.util.Log.e(r1, r2, r10)     // Catch: java.lang.Throwable -> Lab
        L73:
            if (r3 == 0) goto La2
        L75:
            r3.close()     // Catch: java.lang.Throwable -> Lab
            goto La2
        L79:
            r10 = move-exception
            goto L7f
        L7b:
            r10 = move-exception
            goto L83
        L7d:
            r10 = move-exception
            r3 = r1
        L7f:
            r1 = r2
            goto La5
        L81:
            r10 = move-exception
            r3 = r1
        L83:
            r1 = r2
            goto L8a
        L85:
            r10 = move-exception
            r3 = r1
            goto La5
        L88:
            r10 = move-exception
            r3 = r1
        L8a:
            java.lang.String r2 = "LogSqliteStorage"
            java.lang.String r4 = "Error inserting log : "
            android.util.Log.e(r2, r4, r10)     // Catch: java.lang.Throwable -> La4
            if (r1 == 0) goto L9f
            r1.endTransaction()     // Catch: java.lang.Exception -> L97 java.lang.Throwable -> Lab
            goto L9f
        L97:
            r10 = move-exception
            java.lang.String r1 = "LogSqliteStorage"
            java.lang.String r2 = "Error inserting log inside finally block: "
            android.util.Log.e(r1, r2, r10)     // Catch: java.lang.Throwable -> Lab
        L9f:
            if (r3 == 0) goto La2
            goto L75
        La2:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lab
            return
        La4:
            r10 = move-exception
        La5:
            if (r1 == 0) goto Lb5
            r1.endTransaction()     // Catch: java.lang.Throwable -> Lab java.lang.Exception -> Lad
            goto Lb5
        Lab:
            r10 = move-exception
            goto Lbb
        Lad:
            r1 = move-exception
            java.lang.String r2 = "LogSqliteStorage"
            java.lang.String r4 = "Error inserting log inside finally block: "
            android.util.Log.e(r2, r4, r1)     // Catch: java.lang.Throwable -> Lab
        Lb5:
            if (r3 == 0) goto Lba
            r3.close()     // Catch: java.lang.Throwable -> Lab
        Lba:
            throw r10     // Catch: java.lang.Throwable -> Lab
        Lbb:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lab
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.logger.database.LogSQLiteStorage.insert(com.helpshift.logger.model.LogModel):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0032 A[Catch: all -> 0x0036, TryCatch #0 {, blocks: (B:8:0x0016, B:19:0x002d, B:23:0x0032, B:24:0x0035), top: B:28:0x0004 }] */
    @Override // com.helpshift.logger.database.LogStorage
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<com.helpshift.logger.model.LogModel> getAll() {
        /*
            r7 = this;
            java.lang.Object r0 = com.helpshift.logger.database.LogSQLiteStorage.syncLock
            monitor-enter(r0)
            r1 = 0
            com.helpshift.logger.database.LogStorageSQLiteHelper r2 = r7.logStorageSQLiteHelper     // Catch: java.lang.Throwable -> L1c java.lang.Exception -> L21
            android.database.sqlite.SQLiteDatabase r2 = r2.getReadableDatabase()     // Catch: java.lang.Throwable -> L1c java.lang.Exception -> L21
            java.lang.String r3 = "SELECT * FROM LOG_MESSAGES"
            android.database.Cursor r2 = r2.rawQuery(r3, r1)     // Catch: java.lang.Throwable -> L1c java.lang.Exception -> L21
            java.util.List r1 = com.helpshift.logger.adapters.LogStorageModelAdapter.fromCursor(r2)     // Catch: java.lang.Exception -> L1a java.lang.Throwable -> L2f
            if (r2 == 0) goto L2d
        L16:
            r2.close()     // Catch: java.lang.Throwable -> L36
            goto L2d
        L1a:
            r3 = move-exception
            goto L23
        L1c:
            r2 = move-exception
            r6 = r2
            r2 = r1
            r1 = r6
            goto L30
        L21:
            r3 = move-exception
            r2 = r1
        L23:
            java.lang.String r4 = "LogSqliteStorage"
            java.lang.String r5 = "Error getting all log messages : "
            android.util.Log.e(r4, r5, r3)     // Catch: java.lang.Throwable -> L2f
            if (r2 == 0) goto L2d
            goto L16
        L2d:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L36
            return r1
        L2f:
            r1 = move-exception
        L30:
            if (r2 == 0) goto L35
            r2.close()     // Catch: java.lang.Throwable -> L36
        L35:
            throw r1     // Catch: java.lang.Throwable -> L36
        L36:
            r1 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L36
            throw r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.logger.database.LogSQLiteStorage.getAll():java.util.List");
    }

    @Override // com.helpshift.logger.database.LogStorage
    public void deleteAll() {
        synchronized (syncLock) {
            try {
                this.logStorageSQLiteHelper.getWritableDatabase().execSQL("DELETE FROM LOG_MESSAGES");
            } catch (Exception e) {
                Log.e(TAG, "Error deleting all logs from db", e);
            }
        }
    }
}
