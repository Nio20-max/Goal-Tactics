package com.helpshift.campaigns.storage;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.helpshift.campaigns.models.SessionModel;
import com.helpshift.campaigns.models.SessionModelBuilder;
import com.helpshift.campaigns.util.constants.SessionColumns;
import com.helpshift.campaigns.util.constants.Tables;
import com.helpshift.util.ByteArrayUtil;
import com.helpshift.util.DatabaseUtils;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class SessionDbStorage implements SessionStorage {
    private static final String TAG = "Helpshift_SessionDB";
    private final SessionDbStorageHelper helper = new SessionDbStorageHelper(HelpshiftContext.getApplicationContext());

    @Override // com.helpshift.campaigns.storage.SessionStorage
    public void storeSession(SessionModel sessionModel) {
        if (sessionModel == null) {
            return;
        }
        synchronized (this.helper) {
            try {
                String[] strArr = {sessionModel.identifier};
                SQLiteDatabase writableDatabase = this.helper.getWritableDatabase();
                if (DatabaseUtils.exists(writableDatabase, Tables.SESSIONS, "identifier=?", strArr)) {
                    writableDatabase.update(Tables.SESSIONS, sessionToContentValues(sessionModel), "identifier=?", strArr);
                } else {
                    writableDatabase.insert(Tables.SESSIONS, null, sessionToContentValues(sessionModel));
                }
            } catch (Exception e) {
                HSLogger.e(TAG, "Error storing sessions", e);
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.SessionStorage
    public void updateSession(SessionModel sessionModel) {
        String[] strArr;
        SQLiteDatabase writableDatabase;
        if (sessionModel == null) {
            return;
        }
        synchronized (this.helper) {
            try {
                strArr = new String[]{sessionModel.identifier};
                writableDatabase = this.helper.getWritableDatabase();
            } catch (Exception e) {
                HSLogger.e(TAG, "Error updating session", e);
            }
            if (DatabaseUtils.exists(writableDatabase, Tables.SESSIONS, "identifier=?", strArr)) {
                ContentValues contentValues = new ContentValues();
                contentValues.put(SessionColumns.START_TIME, Long.valueOf(sessionModel.startTime));
                contentValues.put(SessionColumns.END_TIME, Long.valueOf(sessionModel.endTime > 0 ? sessionModel.endTime : 0L));
                try {
                    contentValues.put(SessionColumns.DURATIONS, ByteArrayUtil.toByteArray(sessionModel.durations));
                } catch (IOException unused) {
                    contentValues.put(SessionColumns.DURATIONS, "");
                }
                writableDatabase.update(Tables.SESSIONS, contentValues, "identifier=?", strArr);
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.SessionStorage
    public void setSyncStatus(Integer num, String[] strArr) {
        String str;
        String str2;
        if (strArr == null) {
            return;
        }
        synchronized (this.helper) {
            SQLiteDatabase writableDatabase = null;
            try {
                try {
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("sync_status", num);
                    List<List> listCreateBatches = DatabaseUtils.createBatches(900, Arrays.asList(strArr));
                    writableDatabase = this.helper.getWritableDatabase();
                    writableDatabase.beginTransaction();
                    for (List list : listCreateBatches) {
                        String[] strArr2 = (String[]) list.toArray(new String[list.size()]);
                        writableDatabase.update(Tables.SESSIONS, contentValues, "identifier in (" + DatabaseUtils.makePlaceholders(strArr2.length) + ")", strArr2);
                    }
                    writableDatabase.setTransactionSuccessful();
                    if (writableDatabase != null) {
                        try {
                            if (writableDatabase.inTransaction()) {
                                writableDatabase.endTransaction();
                            }
                        } catch (Exception e) {
                            e = e;
                            str = TAG;
                            str2 = "Error in setting sync status inside finally block, ";
                            HSLogger.e(str, str2, e);
                        }
                    }
                } catch (Exception e2) {
                    HSLogger.e(TAG, "Error in setting sync status", e2);
                    if (writableDatabase != null) {
                        try {
                            if (writableDatabase.inTransaction()) {
                                writableDatabase.endTransaction();
                            }
                        } catch (Exception e3) {
                            e = e3;
                            str = TAG;
                            str2 = "Error in setting sync status inside finally block, ";
                            HSLogger.e(str, str2, e);
                        }
                    }
                }
            } finally {
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.SessionStorage
    public void removeSessions(String[] strArr) {
        String str;
        String str2;
        if (strArr == null) {
            return;
        }
        synchronized (this.helper) {
            SQLiteDatabase writableDatabase = null;
            try {
                try {
                    List<List> listCreateBatches = DatabaseUtils.createBatches(900, Arrays.asList(strArr));
                    writableDatabase = this.helper.getWritableDatabase();
                    writableDatabase.beginTransaction();
                    for (List list : listCreateBatches) {
                        String[] strArr2 = (String[]) list.toArray(new String[list.size()]);
                        writableDatabase.delete(Tables.SESSIONS, "identifier in (" + DatabaseUtils.makePlaceholders(strArr2.length) + ")", strArr2);
                    }
                    writableDatabase.setTransactionSuccessful();
                    if (writableDatabase != null) {
                        try {
                            if (writableDatabase.inTransaction()) {
                                writableDatabase.endTransaction();
                            }
                        } catch (Exception e) {
                            e = e;
                            str = TAG;
                            str2 = "Error removing sessions inside finally block, ";
                            HSLogger.e(str, str2, e);
                        }
                    }
                } catch (Exception e2) {
                    HSLogger.e(TAG, "Error removing sessions", e2);
                    if (writableDatabase != null) {
                        try {
                            if (writableDatabase.inTransaction()) {
                                writableDatabase.endTransaction();
                            }
                        } catch (Exception e3) {
                            e = e3;
                            str = TAG;
                            str2 = "Error removing sessions inside finally block, ";
                            HSLogger.e(str, str2, e);
                        }
                    }
                }
            } finally {
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.SessionStorage
    public ArrayList<SessionModel> getAllSessions(Integer num) {
        ArrayList<SessionModel> arrayList = new ArrayList<>();
        synchronized (this.helper) {
            Cursor cursorQuery = null;
            try {
                try {
                    cursorQuery = this.helper.getReadableDatabase().query(Tables.SESSIONS, null, "sync_status=? AND end_time>?", new String[]{String.valueOf(num), String.valueOf(0)}, null, null, null);
                    if (cursorQuery.moveToFirst()) {
                        while (!cursorQuery.isAfterLast()) {
                            arrayList.add(cursorToSessionModel(cursorQuery));
                            cursorQuery.moveToNext();
                        }
                    }
                } catch (Exception e) {
                    HSLogger.e(TAG, "Error getting all sessions", e);
                    if (cursorQuery != null) {
                    }
                }
            } finally {
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
            }
        }
        return arrayList;
    }

    @Override // com.helpshift.campaigns.storage.SessionStorage
    public int cleanUpInvalidSessions() {
        int iDelete;
        synchronized (this.helper) {
            try {
                iDelete = this.helper.getWritableDatabase().delete(Tables.SESSIONS, "end_time=0", null);
            } catch (Exception e) {
                HSLogger.e(TAG, "Error cleaning up invalid sessions", e);
                iDelete = 0;
            }
        }
        return iDelete;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0047 A[Catch: all -> 0x004b, TryCatch #4 {, blocks: (B:12:0x002b, B:23:0x0042, B:27:0x0047, B:28:0x004a), top: B:35:0x0007 }] */
    @Override // com.helpshift.campaigns.storage.SessionStorage
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.helpshift.campaigns.models.SessionModel getSession(java.lang.String r12) {
        /*
            r11 = this;
            r0 = 0
            if (r12 != 0) goto L4
            return r0
        L4:
            com.helpshift.campaigns.storage.SessionDbStorageHelper r1 = r11.helper
            monitor-enter(r1)
            java.lang.String r5 = "identifier=?"
            r2 = 1
            java.lang.String[] r6 = new java.lang.String[r2]     // Catch: java.lang.Throwable -> L31 java.lang.Exception -> L36
            r2 = 0
            r6[r2] = r12     // Catch: java.lang.Throwable -> L31 java.lang.Exception -> L36
            com.helpshift.campaigns.storage.SessionDbStorageHelper r12 = r11.helper     // Catch: java.lang.Throwable -> L31 java.lang.Exception -> L36
            android.database.sqlite.SQLiteDatabase r2 = r12.getReadableDatabase()     // Catch: java.lang.Throwable -> L31 java.lang.Exception -> L36
            java.lang.String r3 = "sessions"
            r4 = 0
            r7 = 0
            r8 = 0
            r9 = 0
            android.database.Cursor r12 = r2.query(r3, r4, r5, r6, r7, r8, r9)     // Catch: java.lang.Throwable -> L31 java.lang.Exception -> L36
            boolean r2 = r12.moveToFirst()     // Catch: java.lang.Exception -> L2f java.lang.Throwable -> L44
            if (r2 == 0) goto L29
            com.helpshift.campaigns.models.SessionModel r0 = r11.cursorToSessionModel(r12)     // Catch: java.lang.Exception -> L2f java.lang.Throwable -> L44
        L29:
            if (r12 == 0) goto L42
        L2b:
            r12.close()     // Catch: java.lang.Throwable -> L4b
            goto L42
        L2f:
            r2 = move-exception
            goto L38
        L31:
            r12 = move-exception
            r10 = r0
            r0 = r12
            r12 = r10
            goto L45
        L36:
            r2 = move-exception
            r12 = r0
        L38:
            java.lang.String r3 = "Helpshift_SessionDB"
            java.lang.String r4 = "Error getting session"
            com.helpshift.util.HSLogger.e(r3, r4, r2)     // Catch: java.lang.Throwable -> L44
            if (r12 == 0) goto L42
            goto L2b
        L42:
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L4b
            return r0
        L44:
            r0 = move-exception
        L45:
            if (r12 == 0) goto L4a
            r12.close()     // Catch: java.lang.Throwable -> L4b
        L4a:
            throw r0     // Catch: java.lang.Throwable -> L4b
        L4b:
            r12 = move-exception
            monitor-exit(r1)     // Catch: java.lang.Throwable -> L4b
            throw r12
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.campaigns.storage.SessionDbStorage.getSession(java.lang.String):com.helpshift.campaigns.models.SessionModel");
    }

    protected void reinitStorage() {
        synchronized (this.helper) {
            try {
                this.helper.getWritableDatabase().delete(Tables.SESSIONS, null, null);
            } catch (Exception e) {
                HSLogger.e(TAG, "Error reiniting session storage", e);
            }
        }
    }

    private ContentValues sessionToContentValues(SessionModel sessionModel) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("identifier", sessionModel.identifier);
        contentValues.put(SessionColumns.DEVICE_IDENTIFIER, sessionModel.deviceIdentifier);
        contentValues.put("user_identifier", sessionModel.userIdentifier);
        contentValues.put(SessionColumns.START_TIME, Long.valueOf(sessionModel.startTime));
        contentValues.put(SessionColumns.END_TIME, Long.valueOf(sessionModel.endTime > 0 ? sessionModel.endTime : 0L));
        try {
            contentValues.put(SessionColumns.DURATIONS, ByteArrayUtil.toByteArray(sessionModel.durations));
        } catch (IOException unused) {
            contentValues.put(SessionColumns.DURATIONS, "");
        }
        contentValues.put("sync_status", sessionModel.syncStatus);
        contentValues.put("extras", "");
        return contentValues;
    }

    private SessionModel cursorToSessionModel(Cursor cursor) {
        SessionModelBuilder durations;
        SessionModelBuilder durations2;
        SessionModelBuilder syncStatus = new SessionModelBuilder(cursor.getString(0), cursor.getString(1), cursor.getString(2), cursor.getLong(3)).setEndTime(cursor.getLong(4)).setSyncStatus(Integer.valueOf(cursor.getInt(6)));
        try {
            durations2 = syncStatus.setDurations((ArrayList) ByteArrayUtil.toObject(cursor.getBlob(5)));
        } catch (IOException e) {
            durations = syncStatus.setDurations(null);
            HSLogger.e(TAG, "IO Exception in retrieving session duration :", e);
            durations2 = durations;
        } catch (ClassCastException e2) {
            durations = syncStatus.setDurations(null);
            HSLogger.e(TAG, "Class cast Exception in retrieving session duration :", e2);
            durations2 = durations;
        } catch (ClassNotFoundException e3) {
            durations = syncStatus.setDurations(null);
            HSLogger.e(TAG, "Class not found Exception in retrieving session duration :", e3);
            durations2 = durations;
        }
        return durations2.build();
    }
}
