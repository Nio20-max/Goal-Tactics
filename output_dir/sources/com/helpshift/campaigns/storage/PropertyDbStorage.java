package com.helpshift.campaigns.storage;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import com.helpshift.campaigns.models.PropertyValue;
import com.helpshift.util.DatabaseUtils;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public class PropertyDbStorage implements PropertyStorage {
    private static final String TAG = "Helpshift_PropertyDB";
    private final PropertyDbHelper helper = new PropertyDbHelper(HelpshiftContext.getApplicationContext());

    @Override // com.helpshift.campaigns.storage.PropertyStorage
    public void initStorage(String str) {
        String strSanitizeForSQL = sanitizeForSQL(str);
        synchronized (this.helper) {
            try {
                this.helper.createIdentifierTable(this.helper.getWritableDatabase(), strSanitizeForSQL);
            } catch (Exception e) {
                HSLogger.e(TAG, "Error initStorage", e);
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.PropertyStorage
    public void initSecondaryStorage(String str) {
        initStorage(getSecondaryName(sanitizeForSQL(str)));
    }

    @Override // com.helpshift.campaigns.storage.PropertyStorage
    public void reinitStorage(String str) {
        String str2;
        String str3;
        String strSanitizeForSQL = sanitizeForSQL(str);
        synchronized (this.helper) {
            SQLiteDatabase writableDatabase = null;
            try {
                try {
                    writableDatabase = this.helper.getWritableDatabase();
                    writableDatabase.beginTransaction();
                    this.helper.dropIdentifierTable(writableDatabase, strSanitizeForSQL);
                    this.helper.createIdentifierTable(writableDatabase, strSanitizeForSQL);
                    writableDatabase.setTransactionSuccessful();
                    if (writableDatabase != null) {
                        try {
                            if (writableDatabase.inTransaction()) {
                                writableDatabase.endTransaction();
                            }
                        } catch (Exception e) {
                            e = e;
                            str2 = TAG;
                            str3 = "Error reinitStorage inside finally block";
                            HSLogger.e(str2, str3, e);
                        }
                    }
                } finally {
                }
            } catch (Exception e2) {
                HSLogger.e(TAG, "Error reinitStorage", e2);
                if (writableDatabase != null) {
                    try {
                        if (writableDatabase.inTransaction()) {
                            writableDatabase.endTransaction();
                        }
                    } catch (Exception e3) {
                        e = e3;
                        str2 = TAG;
                        str3 = "Error reinitStorage inside finally block";
                        HSLogger.e(str2, str3, e);
                    }
                }
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.PropertyStorage
    public void reinitSecondaryStorage(String str) {
        reinitStorage(getSecondaryName(sanitizeForSQL(str)));
    }

    @Override // com.helpshift.campaigns.storage.PropertyStorage
    public void setProperty(String str, PropertyValue propertyValue, String str2) {
        if (TextUtils.isEmpty(str) || propertyValue == null || TextUtils.isEmpty(str2)) {
            return;
        }
        String strSanitizeForSQL = sanitizeForSQL(str2);
        synchronized (this.helper) {
            try {
                SQLiteDatabase writableDatabase = this.helper.getWritableDatabase();
                String tableName = this.helper.getTableName(strSanitizeForSQL);
                String[] strArr = {str};
                if (DatabaseUtils.exists(writableDatabase, tableName, "key=?", strArr)) {
                    writableDatabase.update(tableName, propertyToContentValues(str, propertyValue), "key=?", strArr);
                } else {
                    writableDatabase.insert(tableName, null, propertyToContentValues(str, propertyValue));
                }
            } catch (Exception e) {
                HSLogger.e(TAG, "Error setProperty key: " + str + ", value : " + propertyValue, e);
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.PropertyStorage
    public void setSecondaryProperty(String str, PropertyValue propertyValue, String str2) {
        setProperty(str, propertyValue, getSecondaryName(sanitizeForSQL(str2)));
    }

    @Override // com.helpshift.campaigns.storage.PropertyStorage
    public void removeProperty(String str, String str2) {
        SQLiteDatabase writableDatabase;
        String tableName;
        String[] strArr;
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return;
        }
        String strSanitizeForSQL = sanitizeForSQL(str2);
        synchronized (this.helper) {
            try {
                writableDatabase = this.helper.getWritableDatabase();
                tableName = this.helper.getTableName(strSanitizeForSQL);
                strArr = new String[]{str};
            } catch (Exception e) {
                HSLogger.e(TAG, "Error removeProperty key: " + str, e);
            }
            if (DatabaseUtils.exists(writableDatabase, tableName, "key=?", strArr)) {
                writableDatabase.delete(tableName, "key=?", strArr);
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.PropertyStorage
    public void removePropertySecondaryStorage(String str, String str2) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return;
        }
        removeProperty(str, getSecondaryName(sanitizeForSQL(str2)));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0066 A[Catch: all -> 0x006a, TryCatch #2 {, blocks: (B:14:0x003d, B:25:0x0060, B:30:0x0066, B:31:0x0069), top: B:37:0x0015 }] */
    /* JADX WARN: Type inference failed for: r1v0 */
    /* JADX WARN: Type inference failed for: r1v1, types: [android.database.Cursor] */
    /* JADX WARN: Type inference failed for: r1v2 */
    @Override // com.helpshift.campaigns.storage.PropertyStorage
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.helpshift.campaigns.models.PropertyValue getProperty(java.lang.String r12, java.lang.String r13) {
        /*
            r11 = this;
            boolean r0 = android.text.TextUtils.isEmpty(r12)
            r1 = 0
            if (r0 != 0) goto L6d
            boolean r0 = android.text.TextUtils.isEmpty(r13)
            if (r0 == 0) goto Le
            goto L6d
        Le:
            java.lang.String r13 = r11.sanitizeForSQL(r13)
            com.helpshift.campaigns.storage.PropertyDbHelper r0 = r11.helper
            monitor-enter(r0)
            com.helpshift.campaigns.storage.PropertyDbHelper r2 = r11.helper     // Catch: java.lang.Throwable -> L43 java.lang.Exception -> L45
            android.database.sqlite.SQLiteDatabase r3 = r2.getReadableDatabase()     // Catch: java.lang.Throwable -> L43 java.lang.Exception -> L45
            java.lang.String r6 = "key=?"
            r2 = 1
            java.lang.String[] r7 = new java.lang.String[r2]     // Catch: java.lang.Throwable -> L43 java.lang.Exception -> L45
            r2 = 0
            r7[r2] = r12     // Catch: java.lang.Throwable -> L43 java.lang.Exception -> L45
            com.helpshift.campaigns.storage.PropertyDbHelper r2 = r11.helper     // Catch: java.lang.Throwable -> L43 java.lang.Exception -> L45
            java.lang.String r4 = r2.getTableName(r13)     // Catch: java.lang.Throwable -> L43 java.lang.Exception -> L45
            r5 = 0
            r8 = 0
            r9 = 0
            r10 = 0
            android.database.Cursor r13 = r3.query(r4, r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L43 java.lang.Exception -> L45
            boolean r2 = r13.moveToFirst()     // Catch: java.lang.Exception -> L41 java.lang.Throwable -> L62
            if (r2 == 0) goto L3b
            com.helpshift.campaigns.models.PropertyValue r1 = r11.cursorToPropertyValue(r13)     // Catch: java.lang.Exception -> L41 java.lang.Throwable -> L62
        L3b:
            if (r13 == 0) goto L60
        L3d:
            r13.close()     // Catch: java.lang.Throwable -> L6a
            goto L60
        L41:
            r2 = move-exception
            goto L47
        L43:
            r12 = move-exception
            goto L64
        L45:
            r2 = move-exception
            r13 = r1
        L47:
            java.lang.String r3 = "Helpshift_PropertyDB"
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L62
            r4.<init>()     // Catch: java.lang.Throwable -> L62
            java.lang.String r5 = "Error getProperty key: "
            r4.append(r5)     // Catch: java.lang.Throwable -> L62
            r4.append(r12)     // Catch: java.lang.Throwable -> L62
            java.lang.String r12 = r4.toString()     // Catch: java.lang.Throwable -> L62
            com.helpshift.util.HSLogger.e(r3, r12, r2)     // Catch: java.lang.Throwable -> L62
            if (r13 == 0) goto L60
            goto L3d
        L60:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L6a
            return r1
        L62:
            r12 = move-exception
            r1 = r13
        L64:
            if (r1 == 0) goto L69
            r1.close()     // Catch: java.lang.Throwable -> L6a
        L69:
            throw r12     // Catch: java.lang.Throwable -> L6a
        L6a:
            r12 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L6a
            throw r12
        L6d:
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.campaigns.storage.PropertyDbStorage.getProperty(java.lang.String, java.lang.String):com.helpshift.campaigns.models.PropertyValue");
    }

    @Override // com.helpshift.campaigns.storage.PropertyStorage
    public PropertyValue getSecondaryProperty(String str, String str2) {
        return getProperty(str, getSecondaryName(sanitizeForSQL(str2)));
    }

    @Override // com.helpshift.campaigns.storage.PropertyStorage
    public void setSyncStatus(Integer num, String str, String str2) {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return;
        }
        String strSanitizeForSQL = sanitizeForSQL(str2);
        synchronized (this.helper) {
            try {
                ContentValues contentValues = new ContentValues();
                contentValues.put("sync_status", num);
                this.helper.getWritableDatabase().update(this.helper.getTableName(strSanitizeForSQL), contentValues, "key=?", new String[]{str});
            } catch (Exception e) {
                HSLogger.e(TAG, "Error setSyncStatus key: " + str, e);
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.PropertyStorage
    public void setSyncStatus(Integer num, String[] strArr, String str) {
        String str2;
        String str3;
        if (strArr == null || strArr.length == 0 || TextUtils.isEmpty(str)) {
            return;
        }
        String strSanitizeForSQL = sanitizeForSQL(str);
        synchronized (this.helper) {
            SQLiteDatabase writableDatabase = null;
            try {
                try {
                    writableDatabase = this.helper.getWritableDatabase();
                    writableDatabase.beginTransaction();
                    String str4 = "key in (" + DatabaseUtils.makePlaceholders(strArr.length) + ")";
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("sync_status", num);
                    writableDatabase.update(this.helper.getTableName(strSanitizeForSQL), contentValues, str4, strArr);
                    writableDatabase.setTransactionSuccessful();
                    if (writableDatabase != null) {
                        try {
                            if (writableDatabase.inTransaction()) {
                                writableDatabase.endTransaction();
                            }
                        } catch (Exception e) {
                            e = e;
                            str2 = TAG;
                            str3 = "Error setSyncStatus for multiple keys inside finally block";
                            HSLogger.e(str2, str3, e);
                        }
                    }
                } catch (Exception e2) {
                    HSLogger.e(TAG, "Error setSyncStatus for multiple keys", e2);
                    if (writableDatabase != null) {
                        try {
                            if (writableDatabase.inTransaction()) {
                                writableDatabase.endTransaction();
                            }
                        } catch (Exception e3) {
                            e = e3;
                            str2 = TAG;
                            str3 = "Error setSyncStatus for multiple keys inside finally block";
                            HSLogger.e(str2, str3, e);
                        }
                    }
                }
            } finally {
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.PropertyStorage
    public void setSecondaryPropertySyncStatus(Integer num, String[] strArr, String str) {
        setSyncStatus(num, strArr, getSecondaryName(sanitizeForSQL(str)));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0096 A[Catch: all -> 0x009a, TryCatch #3 {, blocks: (B:29:0x008c, B:31:0x0090, B:19:0x0065, B:36:0x0096, B:37:0x0099), top: B:44:0x000f }] */
    /* JADX WARN: Type inference failed for: r1v0 */
    /* JADX WARN: Type inference failed for: r1v2, types: [android.database.Cursor] */
    /* JADX WARN: Type inference failed for: r1v3 */
    @Override // com.helpshift.campaigns.storage.PropertyStorage
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.HashMap<java.lang.String, com.helpshift.campaigns.models.PropertyValue> getUnsyncedProperties(java.lang.String r15) {
        /*
            r14 = this;
            boolean r0 = android.text.TextUtils.isEmpty(r15)
            r1 = 0
            if (r0 == 0) goto L8
            return r1
        L8:
            java.lang.String r0 = r14.sanitizeForSQL(r15)
            com.helpshift.campaigns.storage.PropertyDbHelper r2 = r14.helper
            monitor-enter(r2)
            com.helpshift.campaigns.storage.PropertyDbHelper r3 = r14.helper     // Catch: java.lang.Throwable -> L6e java.lang.Exception -> L70
            android.database.sqlite.SQLiteDatabase r4 = r3.getReadableDatabase()     // Catch: java.lang.Throwable -> L6e java.lang.Exception -> L70
            java.lang.String r7 = "sync_status=?"
            r3 = 1
            java.lang.String[] r8 = new java.lang.String[r3]     // Catch: java.lang.Throwable -> L6e java.lang.Exception -> L70
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L6e java.lang.Exception -> L70
            r3.<init>()     // Catch: java.lang.Throwable -> L6e java.lang.Exception -> L70
            java.lang.String r5 = ""
            r3.append(r5)     // Catch: java.lang.Throwable -> L6e java.lang.Exception -> L70
            java.lang.Integer r5 = com.helpshift.campaigns.util.constants.SyncStatus.UNSYNCED     // Catch: java.lang.Throwable -> L6e java.lang.Exception -> L70
            r3.append(r5)     // Catch: java.lang.Throwable -> L6e java.lang.Exception -> L70
            java.lang.String r3 = r3.toString()     // Catch: java.lang.Throwable -> L6e java.lang.Exception -> L70
            r12 = 0
            r8[r12] = r3     // Catch: java.lang.Throwable -> L6e java.lang.Exception -> L70
            com.helpshift.campaigns.storage.PropertyDbHelper r3 = r14.helper     // Catch: java.lang.Throwable -> L6e java.lang.Exception -> L70
            java.lang.String r5 = r3.getTableName(r0)     // Catch: java.lang.Throwable -> L6e java.lang.Exception -> L70
            r6 = 0
            r9 = 0
            r10 = 0
            r11 = 0
            android.database.Cursor r0 = r4.query(r5, r6, r7, r8, r9, r10, r11)     // Catch: java.lang.Throwable -> L6e java.lang.Exception -> L70
            boolean r3 = r0.moveToFirst()     // Catch: java.lang.Exception -> L69 java.lang.Throwable -> L92
            if (r3 == 0) goto L63
            java.util.HashMap r3 = new java.util.HashMap     // Catch: java.lang.Exception -> L69 java.lang.Throwable -> L92
            r3.<init>()     // Catch: java.lang.Exception -> L69 java.lang.Throwable -> L92
        L4a:
            boolean r1 = r0.isAfterLast()     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L92
            if (r1 != 0) goto L5f
            com.helpshift.campaigns.models.PropertyValue r1 = r14.cursorToPropertyValue(r0)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L92
            java.lang.String r4 = r0.getString(r12)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L92
            r3.put(r4, r1)     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L92
            r0.moveToNext()     // Catch: java.lang.Exception -> L61 java.lang.Throwable -> L92
            goto L4a
        L5f:
            r1 = r3
            goto L63
        L61:
            r1 = move-exception
            goto L74
        L63:
            if (r0 == 0) goto L90
            r0.close()     // Catch: java.lang.Throwable -> L9a
            goto L90
        L69:
            r3 = move-exception
            r13 = r3
            r3 = r1
            r1 = r13
            goto L74
        L6e:
            r15 = move-exception
            goto L94
        L70:
            r0 = move-exception
            r3 = r1
            r1 = r0
            r0 = r3
        L74:
            java.lang.String r4 = "Helpshift_PropertyDB"
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L92
            r5.<init>()     // Catch: java.lang.Throwable -> L92
            java.lang.String r6 = "Error getUnsyncedProperties for identifier : "
            r5.append(r6)     // Catch: java.lang.Throwable -> L92
            r5.append(r15)     // Catch: java.lang.Throwable -> L92
            java.lang.String r15 = r5.toString()     // Catch: java.lang.Throwable -> L92
            com.helpshift.util.HSLogger.e(r4, r15, r1)     // Catch: java.lang.Throwable -> L92
            if (r0 == 0) goto L8f
            r0.close()     // Catch: java.lang.Throwable -> L9a
        L8f:
            r1 = r3
        L90:
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L9a
            return r1
        L92:
            r15 = move-exception
            r1 = r0
        L94:
            if (r1 == 0) goto L99
            r1.close()     // Catch: java.lang.Throwable -> L9a
        L99:
            throw r15     // Catch: java.lang.Throwable -> L9a
        L9a:
            r15 = move-exception
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L9a
            throw r15
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.campaigns.storage.PropertyDbStorage.getUnsyncedProperties(java.lang.String):java.util.HashMap");
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x007d A[Catch: all -> 0x0081, TryCatch #1 {, blocks: (B:29:0x0073, B:31:0x0077, B:19:0x004c, B:36:0x007d, B:37:0x0080), top: B:43:0x000f }] */
    @Override // com.helpshift.campaigns.storage.PropertyStorage
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.HashMap<java.lang.String, com.helpshift.campaigns.models.PropertyValue> getAllProperties(java.lang.String r14) {
        /*
            r13 = this;
            boolean r0 = android.text.TextUtils.isEmpty(r14)
            r1 = 0
            if (r0 == 0) goto L8
            return r1
        L8:
            java.lang.String r0 = r13.sanitizeForSQL(r14)
            com.helpshift.campaigns.storage.PropertyDbHelper r2 = r13.helper
            monitor-enter(r2)
            com.helpshift.campaigns.storage.PropertyDbHelper r3 = r13.helper     // Catch: java.lang.Throwable -> L55 java.lang.Exception -> L57
            android.database.sqlite.SQLiteDatabase r4 = r3.getReadableDatabase()     // Catch: java.lang.Throwable -> L55 java.lang.Exception -> L57
            com.helpshift.campaigns.storage.PropertyDbHelper r3 = r13.helper     // Catch: java.lang.Throwable -> L55 java.lang.Exception -> L57
            java.lang.String r5 = r3.getTableName(r0)     // Catch: java.lang.Throwable -> L55 java.lang.Exception -> L57
            r6 = 0
            r7 = 0
            r8 = 0
            r9 = 0
            r10 = 0
            r11 = 0
            android.database.Cursor r0 = r4.query(r5, r6, r7, r8, r9, r10, r11)     // Catch: java.lang.Throwable -> L55 java.lang.Exception -> L57
            boolean r3 = r0.moveToFirst()     // Catch: java.lang.Exception -> L50 java.lang.Throwable -> L79
            if (r3 == 0) goto L4a
            java.util.HashMap r3 = new java.util.HashMap     // Catch: java.lang.Exception -> L50 java.lang.Throwable -> L79
            r3.<init>()     // Catch: java.lang.Exception -> L50 java.lang.Throwable -> L79
        L30:
            boolean r1 = r0.isAfterLast()     // Catch: java.lang.Exception -> L48 java.lang.Throwable -> L79
            if (r1 != 0) goto L46
            com.helpshift.campaigns.models.PropertyValue r1 = r13.cursorToPropertyValue(r0)     // Catch: java.lang.Exception -> L48 java.lang.Throwable -> L79
            r4 = 0
            java.lang.String r4 = r0.getString(r4)     // Catch: java.lang.Exception -> L48 java.lang.Throwable -> L79
            r3.put(r4, r1)     // Catch: java.lang.Exception -> L48 java.lang.Throwable -> L79
            r0.moveToNext()     // Catch: java.lang.Exception -> L48 java.lang.Throwable -> L79
            goto L30
        L46:
            r1 = r3
            goto L4a
        L48:
            r1 = move-exception
            goto L5b
        L4a:
            if (r0 == 0) goto L77
            r0.close()     // Catch: java.lang.Throwable -> L81
            goto L77
        L50:
            r3 = move-exception
            r12 = r3
            r3 = r1
            r1 = r12
            goto L5b
        L55:
            r14 = move-exception
            goto L7b
        L57:
            r0 = move-exception
            r3 = r1
            r1 = r0
            r0 = r3
        L5b:
            java.lang.String r4 = "Helpshift_PropertyDB"
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L79
            r5.<init>()     // Catch: java.lang.Throwable -> L79
            java.lang.String r6 = "Error getAllProperties for identifier : "
            r5.append(r6)     // Catch: java.lang.Throwable -> L79
            r5.append(r14)     // Catch: java.lang.Throwable -> L79
            java.lang.String r14 = r5.toString()     // Catch: java.lang.Throwable -> L79
            com.helpshift.util.HSLogger.e(r4, r14, r1)     // Catch: java.lang.Throwable -> L79
            if (r0 == 0) goto L76
            r0.close()     // Catch: java.lang.Throwable -> L81
        L76:
            r1 = r3
        L77:
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L81
            return r1
        L79:
            r14 = move-exception
            r1 = r0
        L7b:
            if (r1 == 0) goto L80
            r1.close()     // Catch: java.lang.Throwable -> L81
        L80:
            throw r14     // Catch: java.lang.Throwable -> L81
        L81:
            r14 = move-exception
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L81
            throw r14
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.campaigns.storage.PropertyDbStorage.getAllProperties(java.lang.String):java.util.HashMap");
    }

    @Override // com.helpshift.campaigns.storage.PropertyStorage
    public HashMap<String, PropertyValue> getAllSecondaryProperties(String str) {
        return getAllProperties(getSecondaryName(sanitizeForSQL(str)));
    }

    private ContentValues propertyToContentValues(String str, PropertyValue propertyValue) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("key", str);
        contentValues.put("value", propertyValue.toString());
        contentValues.put("type", propertyValue.getType());
        contentValues.put("sync_status", propertyValue.getIsSynced());
        contentValues.put("extras", "");
        return contentValues;
    }

    private PropertyValue cursorToPropertyValue(Cursor cursor) {
        PropertyValue propertyValue = new PropertyValue(cursor.getString(2), cursor.getString(1));
        propertyValue.setIsSynced(Integer.valueOf(cursor.getInt(3)));
        return propertyValue;
    }

    private String getSecondaryName(String str) {
        return sanitizeForSQL(str) + "__hs_secondary_data";
    }

    private String sanitizeForSQL(String str) {
        return str.replaceAll("'", "$");
    }
}
