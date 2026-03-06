package com.helpshift.db.network;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import com.helpshift.common.domain.network.HSUrlMetadata;
import com.helpshift.db.network.tables.UrlMetadataTable;
import com.helpshift.util.DatabaseUtils;
import com.helpshift.util.HSLogger;

/* JADX INFO: loaded from: classes2.dex */
public class HSNetworkMetadataDB {
    private static final String TAG = "Helpshift_NetworkDB";
    private static HSNetworkMetadataDB mInstance;
    private final HSNetworkDBHelper hsNetworkDbHelper;

    private HSNetworkMetadataDB(Context context) {
        this.hsNetworkDbHelper = new HSNetworkDBHelper(context, new HSNetworkDatabaseContract());
    }

    public static synchronized HSNetworkMetadataDB getInstance(Context context) {
        if (mInstance == null) {
            mInstance = new HSNetworkMetadataDB(context);
        }
        return mInstance;
    }

    public synchronized boolean insertMetadataForUrl(String str, HSUrlMetadata hSUrlMetadata) {
        long jInsert;
        ContentValues contentValuesMetadataToContentValues = metadataToContentValues(hSUrlMetadata);
        contentValuesMetadataToContentValues.put("url", str);
        try {
            jInsert = this.hsNetworkDbHelper.getWritableDatabase().insert(UrlMetadataTable.TABLE_NAME, null, contentValuesMetadataToContentValues);
        } catch (Exception unused) {
            HSLogger.e(TAG, "Error in inserting metadata of url");
            jInsert = -1;
        }
        return jInsert != -1;
    }

    public synchronized boolean updateMetadataForUrl(String str, HSUrlMetadata hSUrlMetadata) {
        return updateUrlMetadataWithValues(str, metadataToContentValues(hSUrlMetadata));
    }

    public synchronized boolean updateLastFetchTimestampForUrl(String str, long j, boolean z) {
        ContentValues contentValues;
        contentValues = new ContentValues();
        contentValues.put(UrlMetadataTable.Columns.LAST_FETCH_TS, Long.valueOf(j));
        contentValues.put(UrlMetadataTable.Columns.IS_LAST_FETCH_SUCCESS, Integer.valueOf(z ? 1 : 0));
        return updateUrlMetadataWithValues(str, contentValues);
    }

    private synchronized boolean updateUrlMetadataWithValues(String str, ContentValues contentValues) {
        int iUpdate;
        try {
            iUpdate = this.hsNetworkDbHelper.getWritableDatabase().update(UrlMetadataTable.TABLE_NAME, contentValues, "url = ?", new String[]{str});
        } catch (Exception unused) {
            HSLogger.e(TAG, "Error in updating the metadata of url");
            iUpdate = 0;
        }
        return iUpdate > 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x003f A[Catch: all -> 0x0043, TRY_ENTER, TryCatch #2 {, blocks: (B:3:0x0001, B:10:0x0026, B:22:0x003f, B:23:0x0042), top: B:30:0x0001 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized com.helpshift.common.domain.network.HSUrlMetadata readMetadataForUrl(java.lang.String r10) {
        /*
            r9 = this;
            monitor-enter(r9)
            java.lang.String r3 = "url = ? "
            r0 = 1
            java.lang.String[] r4 = new java.lang.String[r0]     // Catch: java.lang.Throwable -> L43
            r0 = 0
            r4[r0] = r10     // Catch: java.lang.Throwable -> L43
            r10 = 0
            com.helpshift.db.network.HSNetworkDBHelper r0 = r9.hsNetworkDbHelper     // Catch: java.lang.Throwable -> L2a java.lang.Exception -> L2f
            android.database.sqlite.SQLiteDatabase r0 = r0.getReadableDatabase()     // Catch: java.lang.Throwable -> L2a java.lang.Exception -> L2f
            java.lang.String r1 = "hs_url_metadata_table"
            r2 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r0 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L2a java.lang.Exception -> L2f
            boolean r1 = r0.moveToFirst()     // Catch: java.lang.Exception -> L30 java.lang.Throwable -> L3c
            if (r1 == 0) goto L24
            com.helpshift.common.domain.network.HSUrlMetadata r10 = r9.cursorToUrlMetadata(r0)     // Catch: java.lang.Exception -> L30 java.lang.Throwable -> L3c
        L24:
            if (r0 == 0) goto L3a
        L26:
            r0.close()     // Catch: java.lang.Throwable -> L43
            goto L3a
        L2a:
            r0 = move-exception
            r8 = r0
            r0 = r10
            r10 = r8
            goto L3d
        L2f:
            r0 = r10
        L30:
            java.lang.String r1 = "Helpshift_NetworkDB"
            java.lang.String r2 = "error in reading the metadata of url"
            com.helpshift.util.HSLogger.e(r1, r2)     // Catch: java.lang.Throwable -> L3c
            if (r0 == 0) goto L3a
            goto L26
        L3a:
            monitor-exit(r9)
            return r10
        L3c:
            r10 = move-exception
        L3d:
            if (r0 == 0) goto L42
            r0.close()     // Catch: java.lang.Throwable -> L43
        L42:
            throw r10     // Catch: java.lang.Throwable -> L43
        L43:
            r10 = move-exception
            monitor-exit(r9)
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.db.network.HSNetworkMetadataDB.readMetadataForUrl(java.lang.String):com.helpshift.common.domain.network.HSUrlMetadata");
    }

    public synchronized boolean deleteMetadataForUrl(String str) {
        try {
            this.hsNetworkDbHelper.getWritableDatabase().delete(UrlMetadataTable.TABLE_NAME, "url = ? ", new String[]{str});
        } catch (Exception unused) {
            HSLogger.e(TAG, "Error in deleting metadata for url");
            return false;
        }
        return true;
    }

    public synchronized boolean deleteAllUrlsMetadata() {
        try {
            this.hsNetworkDbHelper.getWritableDatabase().delete(UrlMetadataTable.TABLE_NAME, null, null);
        } catch (Exception unused) {
            HSLogger.e(TAG, "Error in deleting urls metadata");
            return false;
        }
        return true;
    }

    private ContentValues metadataToContentValues(HSUrlMetadata hSUrlMetadata) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(UrlMetadataTable.Columns.LAST_FETCH_TS, Long.valueOf(hSUrlMetadata.lastFetchTimestamp));
        contentValues.put(UrlMetadataTable.Columns.ETAG, hSUrlMetadata.etag);
        contentValues.put(UrlMetadataTable.Columns.IS_LAST_FETCH_SUCCESS, Integer.valueOf(hSUrlMetadata.isLastFetchSuccessful ? 1 : 0));
        return contentValues;
    }

    private HSUrlMetadata cursorToUrlMetadata(Cursor cursor) {
        String string = cursor.getString(cursor.getColumnIndex("url"));
        String string2 = cursor.getString(cursor.getColumnIndex(UrlMetadataTable.Columns.ETAG));
        int columnIndex = cursor.getColumnIndex(UrlMetadataTable.Columns.LAST_FETCH_TS);
        return new HSUrlMetadata(string, string2, cursor.isNull(columnIndex) ? 0L : cursor.getLong(columnIndex), DatabaseUtils.parseBooleanColumnSafe(cursor, UrlMetadataTable.Columns.IS_LAST_FETCH_SUCCESS, false));
    }
}
