package com.helpshift.support.search.storage;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.helpshift.support.db.search.SearchDBHelper;
import com.helpshift.support.db.search.SearchDatabaseContract;
import com.helpshift.support.db.search.tables.SearchTable;
import com.helpshift.support.search.SearchTokenDao;
import com.helpshift.support.search.SearchTokenDto;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.text.Typography;

/* JADX INFO: loaded from: classes2.dex */
public class SearchTokenDaoImpl implements SearchTokenDao {
    private static final String TAG = "Helpshift_SearchToknDao";
    private final char scoreMapStringSeparator = Typography.dollar;
    private final char scoreMapKeyValueStringSeparator = ':';
    private final SQLiteOpenHelper dbHelper = new SearchDBHelper(HelpshiftContext.getApplicationContext(), new SearchDatabaseContract());

    SearchTokenDaoImpl() {
    }

    public static SearchTokenDao getInstance() {
        return LazyHolder.INSTANCE;
    }

    @Override // com.helpshift.support.search.SearchTokenDao
    public void save(List<SearchTokenDto> list) {
        String str;
        String str2;
        SQLiteDatabase writableDatabase;
        if (list == null) {
            return;
        }
        ArrayList arrayList = new ArrayList();
        for (SearchTokenDto searchTokenDto : list) {
            String strConvertScoreMapToScoreString = convertScoreMapToScoreString(searchTokenDto.scoreMap);
            ContentValues contentValues = new ContentValues();
            contentValues.put("token", searchTokenDto.wordValue);
            contentValues.put("type", Integer.valueOf(searchTokenDto.wordType));
            contentValues.put("score", strConvertScoreMapToScoreString);
            arrayList.add(contentValues);
        }
        synchronized (this.dbHelper) {
            SQLiteDatabase sQLiteDatabase = null;
            try {
                try {
                    writableDatabase = this.dbHelper.getWritableDatabase();
                } catch (Exception e) {
                    e = e;
                }
            } catch (Throwable th) {
                th = th;
            }
            try {
                writableDatabase.beginTransaction();
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    writableDatabase.insert(SearchTable.TABLE_NAME, null, (ContentValues) it.next());
                }
                writableDatabase.setTransactionSuccessful();
                if (writableDatabase != null) {
                    try {
                        if (writableDatabase.inTransaction()) {
                            writableDatabase.endTransaction();
                        }
                    } catch (Exception e2) {
                        e = e2;
                        str = TAG;
                        str2 = "Error occurred when calling save method inside finally block";
                        HSLogger.e(str, str2, e);
                    }
                }
            } catch (Exception e3) {
                e = e3;
                sQLiteDatabase = writableDatabase;
                HSLogger.e(TAG, "Error occurred when calling save method", e);
                if (sQLiteDatabase != null) {
                    try {
                        if (sQLiteDatabase.inTransaction()) {
                            sQLiteDatabase.endTransaction();
                        }
                    } catch (Exception e4) {
                        e = e4;
                        str = TAG;
                        str2 = "Error occurred when calling save method inside finally block";
                        HSLogger.e(str, str2, e);
                    }
                }
            } catch (Throwable th2) {
                th = th2;
                sQLiteDatabase = writableDatabase;
                if (sQLiteDatabase != null) {
                    try {
                        if (sQLiteDatabase.inTransaction()) {
                            sQLiteDatabase.endTransaction();
                        }
                    } catch (Exception e5) {
                        HSLogger.e(TAG, "Error occurred when calling save method inside finally block", e5);
                    }
                }
                throw th;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0074 A[Catch: all -> 0x0078, TryCatch #2 {, blocks: (B:11:0x0058, B:22:0x006f, B:26:0x0074, B:27:0x0077), top: B:34:0x0004 }] */
    /* JADX WARN: Type inference failed for: r13v3 */
    /* JADX WARN: Type inference failed for: r13v5, types: [android.database.Cursor] */
    @Override // com.helpshift.support.search.SearchTokenDao
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.helpshift.support.search.SearchTokenDto get(java.lang.String r13) {
        /*
            r12 = this;
            android.database.sqlite.SQLiteOpenHelper r0 = r12.dbHelper
            monitor-enter(r0)
            r1 = 0
            android.database.sqlite.SQLiteOpenHelper r2 = r12.dbHelper     // Catch: java.lang.Throwable -> L5e java.lang.Exception -> L63
            android.database.sqlite.SQLiteDatabase r3 = r2.getWritableDatabase()     // Catch: java.lang.Throwable -> L5e java.lang.Exception -> L63
            java.lang.String r2 = "token"
            java.lang.String r4 = "type"
            java.lang.String r5 = "score"
            java.lang.String[] r5 = new java.lang.String[]{r2, r4, r5}     // Catch: java.lang.Throwable -> L5e java.lang.Exception -> L63
            java.lang.String r4 = "search_token_table"
            java.lang.String r6 = "token=?"
            r2 = 1
            java.lang.String[] r7 = new java.lang.String[r2]     // Catch: java.lang.Throwable -> L5e java.lang.Exception -> L63
            r2 = 0
            r7[r2] = r13     // Catch: java.lang.Throwable -> L5e java.lang.Exception -> L63
            r8 = 0
            r9 = 0
            r10 = 0
            android.database.Cursor r13 = r3.query(r4, r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L5e java.lang.Exception -> L63
            int r2 = r13.getCount()     // Catch: java.lang.Exception -> L5c java.lang.Throwable -> L71
            if (r2 <= 0) goto L56
            r13.moveToFirst()     // Catch: java.lang.Exception -> L5c java.lang.Throwable -> L71
            java.lang.String r2 = "token"
            int r2 = r13.getColumnIndexOrThrow(r2)     // Catch: java.lang.Exception -> L5c java.lang.Throwable -> L71
            java.lang.String r2 = r13.getString(r2)     // Catch: java.lang.Exception -> L5c java.lang.Throwable -> L71
            java.lang.String r3 = "type"
            int r3 = r13.getColumnIndexOrThrow(r3)     // Catch: java.lang.Exception -> L5c java.lang.Throwable -> L71
            int r3 = r13.getInt(r3)     // Catch: java.lang.Exception -> L5c java.lang.Throwable -> L71
            java.lang.String r4 = "score"
            int r4 = r13.getColumnIndexOrThrow(r4)     // Catch: java.lang.Exception -> L5c java.lang.Throwable -> L71
            java.lang.String r4 = r13.getString(r4)     // Catch: java.lang.Exception -> L5c java.lang.Throwable -> L71
            java.util.Map r4 = r12.convertScoreStringToScoreMap(r4)     // Catch: java.lang.Exception -> L5c java.lang.Throwable -> L71
            com.helpshift.support.search.SearchTokenDto r5 = new com.helpshift.support.search.SearchTokenDto     // Catch: java.lang.Exception -> L5c java.lang.Throwable -> L71
            r5.<init>(r2, r3, r4)     // Catch: java.lang.Exception -> L5c java.lang.Throwable -> L71
            r1 = r5
        L56:
            if (r13 == 0) goto L6f
        L58:
            r13.close()     // Catch: java.lang.Throwable -> L78
            goto L6f
        L5c:
            r2 = move-exception
            goto L65
        L5e:
            r13 = move-exception
            r11 = r1
            r1 = r13
            r13 = r11
            goto L72
        L63:
            r2 = move-exception
            r13 = r1
        L65:
            java.lang.String r3 = "Helpshift_SearchToknDao"
            java.lang.String r4 = "Error occurred when calling get method"
            com.helpshift.util.HSLogger.e(r3, r4, r2)     // Catch: java.lang.Throwable -> L71
            if (r13 == 0) goto L6f
            goto L58
        L6f:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L78
            return r1
        L71:
            r1 = move-exception
        L72:
            if (r13 == 0) goto L77
            r13.close()     // Catch: java.lang.Throwable -> L78
        L77:
            throw r1     // Catch: java.lang.Throwable -> L78
        L78:
            r13 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L78
            throw r13
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.search.storage.SearchTokenDaoImpl.get(java.lang.String):com.helpshift.support.search.SearchTokenDto");
    }

    @Override // com.helpshift.support.search.SearchTokenDao
    public void clear() {
        synchronized (this.dbHelper) {
            try {
                this.dbHelper.getWritableDatabase().delete(SearchTable.TABLE_NAME, null, null);
            } catch (Exception e) {
                HSLogger.e(TAG, "Error occurred when calling clear method", e);
            }
        }
    }

    private String convertScoreMapToScoreString(Map<Integer, Double> map) {
        StringBuilder sb = new StringBuilder();
        boolean z = true;
        for (Map.Entry<Integer, Double> entry : map.entrySet()) {
            if (z) {
                z = false;
            } else {
                sb.append(Typography.dollar);
            }
            sb.append(entry.getKey());
            sb.append(':');
            sb.append(entry.getValue());
        }
        return sb.toString();
    }

    private Map<Integer, Double> convertScoreStringToScoreMap(String str) {
        String[] strArrSplit;
        HashMap map = new HashMap();
        if (str == null) {
            return map;
        }
        for (String str2 : str.split("[$]")) {
            if (str2 != null && str2.length() > 0 && (strArrSplit = str2.split("[:]")) != null && strArrSplit.length == 2) {
                map.put(Integer.valueOf(Integer.valueOf(strArrSplit[0]).intValue()), Double.valueOf(Double.valueOf(strArrSplit[1]).doubleValue()));
            }
        }
        return map;
    }

    private static class LazyHolder {
        static final SearchTokenDao INSTANCE = new SearchTokenDaoImpl();

        private LazyHolder() {
        }
    }
}
