package com.helpshift.account.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.helpshift.account.domainmodel.ClearedUserDM;
import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.account.domainmodel.UserSyncStatus;
import com.helpshift.common.platform.network.KeyValuePair;
import com.helpshift.db.user.UserDBHelper;
import com.helpshift.db.user.UserDatabaseContract;
import com.helpshift.db.user.tables.ClearedUserTable;
import com.helpshift.db.user.tables.LegacyAnalyticsEventIDTable;
import com.helpshift.db.user.tables.LegacyProfileTable;
import com.helpshift.db.user.tables.RedactionInfoTable;
import com.helpshift.db.user.tables.UserTable;
import com.helpshift.migration.MigrationState;
import com.helpshift.migration.legacyUser.LegacyProfile;
import com.helpshift.redaction.RedactionDetail;
import com.helpshift.redaction.RedactionState;
import com.helpshift.redaction.RedactionType;
import com.helpshift.util.HSLogger;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class UserDB {
    private static final Integer INT_TRUE = 1;
    private static final String TAG = "Helpshift_UserDB";
    private static final String WHERE_LOCAL_ID_IS = "_id = ?";
    private static UserDB instance;
    private final UserDBHelper userDBHelper;

    private UserDB(Context context) {
        this.userDBHelper = new UserDBHelper(context, new UserDatabaseContract());
    }

    public static synchronized UserDB getInstance(Context context) {
        if (instance == null) {
            instance = new UserDB(context);
        }
        return instance;
    }

    UserDM createUser(UserDM userDM) {
        return createUser(userDM, true);
    }

    private synchronized UserDM createUser(UserDM userDM, boolean z) {
        Long lValueOf;
        try {
            lValueOf = Long.valueOf(this.userDBHelper.getWritableDatabase().insert(UserTable.TABLE_NAME, null, userDMToContentValues(userDM)));
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in creating user", e);
            if (z) {
                this.userDBHelper.close();
                return createUser(userDM, false);
            }
            lValueOf = null;
        }
        if (lValueOf == null) {
            return null;
        }
        return getUserDMWithLocalId(userDM, lValueOf.longValue());
    }

    synchronized boolean updateUser(UserDM userDM) {
        return updateUser(userDM, true);
    }

    private synchronized boolean updateUser(UserDM userDM, boolean z) {
        boolean z2 = false;
        if (userDM.getLocalId() == null) {
            return false;
        }
        try {
            this.userDBHelper.getWritableDatabase().update(UserTable.TABLE_NAME, userDMToContentValues(userDM), WHERE_LOCAL_ID_IS, new String[]{String.valueOf(userDM.getLocalId())});
            z2 = true;
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in updating user", e);
            if (z) {
                this.userDBHelper.close();
                return updateUser(userDM, false);
            }
        }
        return z2;
    }

    /* JADX WARN: Not initialized variable reg: 1, insn: 0x004b: MOVE (r0 I:??[OBJECT, ARRAY]) = (r1 I:??[OBJECT, ARRAY]), block:B:29:0x004b */
    private synchronized UserDM getUser(String str, String[] strArr, boolean z) {
        Cursor cursor;
        Cursor cursorQuery;
        Cursor cursor2 = null;
        userDMCursorToUserDM = null;
        UserDM userDMCursorToUserDM = null;
        try {
        } catch (Throwable th) {
            th = th;
            cursor2 = cursor;
        }
        try {
            cursorQuery = this.userDBHelper.getReadableDatabase().query(UserTable.TABLE_NAME, null, str, strArr, null, null, null);
            try {
                userDMCursorToUserDM = cursorQuery.moveToFirst() ? cursorToUserDM(cursorQuery) : null;
            } catch (Exception e) {
                e = e;
                HSLogger.e(TAG, "Error in reading user", e);
                if (!z) {
                    if (cursorQuery != null) {
                    }
                    return userDMCursorToUserDM;
                }
                this.userDBHelper.close();
                UserDM user = getUser(str, strArr, false);
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
                return user;
            }
        } catch (Exception e2) {
            e = e2;
            cursorQuery = null;
        } catch (Throwable th2) {
            th = th2;
            if (cursor2 != null) {
                cursor2.close();
            }
            throw th;
        }
        if (cursorQuery != null) {
            cursorQuery.close();
        }
        return userDMCursorToUserDM;
    }

    synchronized UserDM fetchUser(Long l) {
        if (l == null) {
            return null;
        }
        return getUser(WHERE_LOCAL_ID_IS, new String[]{l.toString()}, true);
    }

    synchronized UserDM fetchUser(String str, String str2) {
        if (str == null && str2 == null) {
            return null;
        }
        if (str == null) {
            str = "";
        }
        if (str2 == null) {
            str2 = "";
        }
        try {
            return getUser("identifier = ? AND email = ?", new String[]{str, str2}, true);
        } catch (Throwable th) {
            throw th;
        }
    }

    synchronized UserDM getActiveUser() {
        return getUser("active = ?", new String[]{INT_TRUE.toString()}, true);
    }

    synchronized UserDM getAnonymousUser() {
        return getUser("anonymous = ?", new String[]{INT_TRUE.toString()}, true);
    }

    synchronized List<UserDM> fetchUsers() {
        ArrayList arrayList;
        arrayList = new ArrayList();
        Cursor cursorQuery = null;
        try {
            try {
                cursorQuery = this.userDBHelper.getReadableDatabase().query(UserTable.TABLE_NAME, null, null, null, null, null, null);
                if (cursorQuery.moveToFirst()) {
                    do {
                        arrayList.add(cursorToUserDM(cursorQuery));
                    } while (cursorQuery.moveToNext());
                }
            } catch (Exception e) {
                HSLogger.e(TAG, "Error in reading all users", e);
                if (cursorQuery != null) {
                }
            }
        } finally {
            if (cursorQuery != null) {
                cursorQuery.close();
            }
        }
        return arrayList;
    }

    synchronized boolean activateUser(Long l) {
        boolean z = false;
        if (l == null) {
            return false;
        }
        SQLiteDatabase writableDatabase = null;
        try {
            try {
                writableDatabase = this.userDBHelper.getWritableDatabase();
                ContentValues contentValues = new ContentValues();
                contentValues.put("active", (Boolean) true);
                ContentValues contentValues2 = new ContentValues();
                contentValues2.put("active", (Boolean) false);
                writableDatabase.beginTransaction();
                if (writableDatabase.update(UserTable.TABLE_NAME, contentValues, WHERE_LOCAL_ID_IS, new String[]{l.toString()}) > 0) {
                    writableDatabase.update(UserTable.TABLE_NAME, contentValues2, "_id != ?", new String[]{l.toString()});
                }
                writableDatabase.setTransactionSuccessful();
                if (writableDatabase != null) {
                    try {
                        writableDatabase.endTransaction();
                    } catch (Exception e) {
                        HSLogger.e(TAG, "Error in activating user in finally block", e);
                    }
                }
                z = true;
            } catch (Exception e2) {
                HSLogger.e(TAG, "Error in activating user", e2);
            }
            return z;
        } finally {
            if (0 != 0) {
                try {
                    writableDatabase.endTransaction();
                } catch (Exception e3) {
                    HSLogger.e(TAG, "Error in activating user in finally block", e3);
                }
            }
        }
    }

    synchronized boolean deleteUser(Long l) {
        long jDelete;
        if (l == null) {
            return false;
        }
        try {
            jDelete = this.userDBHelper.getWritableDatabase().delete(UserTable.TABLE_NAME, WHERE_LOCAL_ID_IS, new String[]{String.valueOf(l)});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in deleting user", e);
            jDelete = 0;
        }
        return jDelete > 0;
    }

    private UserDM cursorToUserDM(Cursor cursor) {
        Long lValueOf = Long.valueOf(cursor.getLong(cursor.getColumnIndex("_id")));
        String string = cursor.getString(cursor.getColumnIndex("identifier"));
        String string2 = cursor.getString(cursor.getColumnIndex("name"));
        String string3 = cursor.getString(cursor.getColumnIndex("email"));
        String string4 = cursor.getString(cursor.getColumnIndex("deviceid"));
        String string5 = cursor.getString(cursor.getColumnIndex("auth_token"));
        int i = cursor.getInt(cursor.getColumnIndex("active"));
        Integer num = INT_TRUE;
        return new UserDM(lValueOf, string, string3, string2, string4, i == num.intValue(), cursor.getInt(cursor.getColumnIndex(UserTable.Columns.ANONOYMOUS)) == num.intValue(), cursor.getInt(cursor.getColumnIndex(UserTable.Columns.PUSH_TOKEN_SYNCED)) == num.intValue(), string5, cursor.getInt(cursor.getColumnIndex(UserTable.Columns.ISSUE_EXISTS)) == num.intValue(), intToUserSyncStatus(cursor.getInt(cursor.getColumnIndex(UserTable.Columns.INITIAL_STATE_SYNCED))));
    }

    private ClearedUserDM cursorToClearedUserDM(Cursor cursor) {
        return new ClearedUserDM(Long.valueOf(cursor.getLong(cursor.getColumnIndex("_id"))), cursor.getString(cursor.getColumnIndex("identifier")), cursor.getString(cursor.getColumnIndex("email")), cursor.getString(cursor.getColumnIndex("auth_token")), cursor.getString(cursor.getColumnIndex("deviceid")), intToClearedUserSyncState(cursor.getInt(cursor.getColumnIndex(ClearedUserTable.Columns.SYNC_STATE))));
    }

    private LegacyProfile cursorToLegacyProfile(Cursor cursor) {
        return new LegacyProfile(cursor.getString(cursor.getColumnIndex("identifier")), cursor.getString(cursor.getColumnIndex("email")), cursor.getString(cursor.getColumnIndex("name")), cursor.getString(cursor.getColumnIndex(LegacyProfileTable.Columns.SERVER_ID)), intToMigrationState(cursor.getInt(cursor.getColumnIndex(LegacyProfileTable.Columns.MIGRATION_STATE))));
    }

    private ContentValues clearedUserDMtoContentValues(ClearedUserDM clearedUserDM) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("_id", clearedUserDM.localId);
        contentValues.put("identifier", clearedUserDM.identifier);
        contentValues.put("email", clearedUserDM.email);
        contentValues.put("auth_token", clearedUserDM.authToken);
        contentValues.put("deviceid", clearedUserDM.deviceId);
        contentValues.put(ClearedUserTable.Columns.SYNC_STATE, Integer.valueOf(clearedUserDM.syncState.ordinal()));
        return contentValues;
    }

    private ContentValues userDMToContentValues(UserDM userDM) {
        ContentValues contentValues = new ContentValues();
        if (userDM.getLocalId() != null) {
            contentValues.put("_id", userDM.getLocalId());
        }
        if (userDM.getIdentifier() != null) {
            contentValues.put("identifier", userDM.getIdentifier());
        } else {
            contentValues.put("identifier", "");
        }
        if (userDM.getName() != null) {
            contentValues.put("name", userDM.getName());
        } else {
            contentValues.put("name", "");
        }
        if (userDM.getEmail() != null) {
            contentValues.put("email", userDM.getEmail());
        } else {
            contentValues.put("email", "");
        }
        if (userDM.getDeviceId() != null) {
            contentValues.put("deviceid", userDM.getDeviceId());
        } else {
            contentValues.put("deviceid", "");
        }
        if (userDM.getAuthToken() != null) {
            contentValues.put("auth_token", userDM.getAuthToken());
        } else {
            contentValues.put("auth_token", "");
        }
        contentValues.put("active", Boolean.valueOf(userDM.isActiveUser()));
        contentValues.put(UserTable.Columns.ANONOYMOUS, Boolean.valueOf(userDM.isAnonymousUser()));
        contentValues.put(UserTable.Columns.ISSUE_EXISTS, Boolean.valueOf(userDM.issueExists()));
        contentValues.put(UserTable.Columns.PUSH_TOKEN_SYNCED, Boolean.valueOf(userDM.isPushTokenSynced()));
        contentValues.put(UserTable.Columns.INITIAL_STATE_SYNCED, Integer.valueOf(userDM.getSyncState().ordinal()));
        return contentValues;
    }

    private ContentValues legacyProfileToContentValues(LegacyProfile legacyProfile) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("identifier", legacyProfile.identifier);
        contentValues.put("name", legacyProfile.name);
        contentValues.put("email", legacyProfile.email);
        contentValues.put(LegacyProfileTable.Columns.SERVER_ID, legacyProfile.serverId);
        contentValues.put(LegacyProfileTable.Columns.MIGRATION_STATE, Integer.valueOf(legacyProfile.migrationState.ordinal()));
        return contentValues;
    }

    private ContentValues legacyAnalyticsIDPairToContentValues(KeyValuePair keyValuePair) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("identifier", keyValuePair.key);
        contentValues.put(LegacyAnalyticsEventIDTable.Columns.ANALYTICS_EVENT_ID, keyValuePair.value);
        return contentValues;
    }

    private UserDM getUserDMWithLocalId(UserDM userDM, long j) {
        return new UserDM(Long.valueOf(j), userDM.getIdentifier(), userDM.getEmail(), userDM.getName(), userDM.getDeviceId(), userDM.isActiveUser(), userDM.isAnonymousUser(), userDM.isPushTokenSynced(), userDM.getAuthToken(), userDM.issueExists(), userDM.getSyncState());
    }

    private ClearedUserDM getClearUserDMWithLocalId(ClearedUserDM clearedUserDM, long j) {
        return new ClearedUserDM(Long.valueOf(j), clearedUserDM.identifier, clearedUserDM.email, clearedUserDM.authToken, clearedUserDM.deviceId, clearedUserDM.syncState);
    }

    synchronized ClearedUserDM insertClearedUser(ClearedUserDM clearedUserDM) {
        Long lValueOf;
        try {
            lValueOf = Long.valueOf(this.userDBHelper.getWritableDatabase().insert(ClearedUserTable.TABLE_NAME, null, clearedUserDMtoContentValues(clearedUserDM)));
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in creating cleared user", e);
            lValueOf = null;
        }
        if (lValueOf == null) {
            return null;
        }
        return getClearUserDMWithLocalId(clearedUserDM, lValueOf.longValue());
    }

    synchronized List<ClearedUserDM> fetchClearedUsers() {
        ArrayList arrayList;
        arrayList = new ArrayList();
        Cursor cursorQuery = null;
        try {
            try {
                cursorQuery = this.userDBHelper.getReadableDatabase().query(ClearedUserTable.TABLE_NAME, null, null, null, null, null, null);
                if (cursorQuery.moveToFirst()) {
                    do {
                        arrayList.add(cursorToClearedUserDM(cursorQuery));
                    } while (cursorQuery.moveToNext());
                }
            } catch (Exception e) {
                HSLogger.e(TAG, "Error in reading all cleared users", e);
                if (cursorQuery != null) {
                }
            }
        } finally {
            if (cursorQuery != null) {
                cursorQuery.close();
            }
        }
        return arrayList;
    }

    synchronized boolean updateClearedUserSyncState(Long l, ClearedUserSyncState clearedUserSyncState) {
        boolean z;
        z = true;
        try {
            SQLiteDatabase writableDatabase = this.userDBHelper.getWritableDatabase();
            ContentValues contentValues = new ContentValues();
            contentValues.put(ClearedUserTable.Columns.SYNC_STATE, Integer.valueOf(clearedUserSyncState.ordinal()));
            writableDatabase.update(ClearedUserTable.TABLE_NAME, contentValues, WHERE_LOCAL_ID_IS, new String[]{l.toString()});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in updating cleared user sync status", e);
            z = false;
        }
        return z;
    }

    synchronized boolean deleteClearedUser(Long l) {
        long jDelete;
        try {
            jDelete = this.userDBHelper.getWritableDatabase().delete(UserTable.TABLE_NAME, WHERE_LOCAL_ID_IS, new String[]{String.valueOf(l)});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in deleting cleared user", e);
            jDelete = 0;
        }
        return jDelete > 0;
    }

    synchronized void storeLegacyProfiles(List<LegacyProfile> list) {
        String str;
        String str2;
        SQLiteDatabase writableDatabase;
        SQLiteDatabase sQLiteDatabase = null;
        try {
            try {
                writableDatabase = this.userDBHelper.getWritableDatabase();
            } catch (Exception e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            writableDatabase.beginTransaction();
            Iterator<LegacyProfile> it = list.iterator();
            while (it.hasNext()) {
                writableDatabase.insert(LegacyProfileTable.TABLE_NAME, null, legacyProfileToContentValues(it.next()));
            }
            writableDatabase.setTransactionSuccessful();
            if (writableDatabase != null) {
                try {
                    writableDatabase.endTransaction();
                } catch (Exception e2) {
                    e = e2;
                    str = TAG;
                    str2 = "Error in storing legacy profiles in finally block";
                    HSLogger.e(str, str2, e);
                }
            }
        } catch (Exception e3) {
            e = e3;
            sQLiteDatabase = writableDatabase;
            HSLogger.e(TAG, "Error in storing legacy profiles", e);
            if (sQLiteDatabase != null) {
                try {
                    sQLiteDatabase.endTransaction();
                } catch (Exception e4) {
                    e = e4;
                    str = TAG;
                    str2 = "Error in storing legacy profiles in finally block";
                    HSLogger.e(str, str2, e);
                }
            }
        } catch (Throwable th2) {
            th = th2;
            sQLiteDatabase = writableDatabase;
            if (sQLiteDatabase != null) {
                try {
                    sQLiteDatabase.endTransaction();
                } catch (Exception e5) {
                    HSLogger.e(TAG, "Error in storing legacy profiles in finally block", e5);
                }
            }
            throw th;
        }
    }

    synchronized void deleteLegacyProfile(String str) {
        try {
            this.userDBHelper.getWritableDatabase().delete(LegacyProfileTable.TABLE_NAME, "identifier = ?", new String[]{str});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in deleting legacy profile", e);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0042 A[Catch: all -> 0x0046, TRY_ENTER, TryCatch #1 {, blocks: (B:4:0x0002, B:11:0x0026, B:26:0x0042, B:27:0x0045), top: B:33:0x0002 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    synchronized com.helpshift.migration.legacyUser.LegacyProfile fetchLegacyProfile(java.lang.String r11) {
        /*
            r10 = this;
            monitor-enter(r10)
            r0 = 1
            java.lang.String[] r5 = new java.lang.String[r0]     // Catch: java.lang.Throwable -> L46
            r0 = 0
            r5[r0] = r11     // Catch: java.lang.Throwable -> L46
            r11 = 0
            com.helpshift.db.user.UserDBHelper r0 = r10.userDBHelper     // Catch: java.lang.Throwable -> L2c java.lang.Exception -> L31
            android.database.sqlite.SQLiteDatabase r1 = r0.getReadableDatabase()     // Catch: java.lang.Throwable -> L2c java.lang.Exception -> L31
            java.lang.String r2 = "legacy_profile_table"
            r3 = 0
            java.lang.String r4 = "identifier = ?"
            r6 = 0
            r7 = 0
            r8 = 0
            android.database.Cursor r0 = r1.query(r2, r3, r4, r5, r6, r7, r8)     // Catch: java.lang.Throwable -> L2c java.lang.Exception -> L31
            boolean r1 = r0.moveToFirst()     // Catch: java.lang.Exception -> L2a java.lang.Throwable -> L3f
            if (r1 == 0) goto L24
            com.helpshift.migration.legacyUser.LegacyProfile r11 = r10.cursorToLegacyProfile(r0)     // Catch: java.lang.Exception -> L2a java.lang.Throwable -> L3f
        L24:
            if (r0 == 0) goto L3d
        L26:
            r0.close()     // Catch: java.lang.Throwable -> L46
            goto L3d
        L2a:
            r1 = move-exception
            goto L33
        L2c:
            r0 = move-exception
            r9 = r0
            r0 = r11
            r11 = r9
            goto L40
        L31:
            r1 = move-exception
            r0 = r11
        L33:
            java.lang.String r2 = "Helpshift_UserDB"
            java.lang.String r3 = "Error in reading legacy profile with identifier"
            com.helpshift.util.HSLogger.e(r2, r3, r1)     // Catch: java.lang.Throwable -> L3f
            if (r0 == 0) goto L3d
            goto L26
        L3d:
            monitor-exit(r10)
            return r11
        L3f:
            r11 = move-exception
        L40:
            if (r0 == 0) goto L45
            r0.close()     // Catch: java.lang.Throwable -> L46
        L45:
            throw r11     // Catch: java.lang.Throwable -> L46
        L46:
            r11 = move-exception
            monitor-exit(r10)
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.account.dao.UserDB.fetchLegacyProfile(java.lang.String):com.helpshift.migration.legacyUser.LegacyProfile");
    }

    synchronized boolean updateUserMigrationState(String str, MigrationState migrationState) {
        boolean z;
        z = true;
        try {
            SQLiteDatabase writableDatabase = this.userDBHelper.getWritableDatabase();
            ContentValues contentValues = new ContentValues();
            contentValues.put(LegacyProfileTable.Columns.MIGRATION_STATE, Integer.valueOf(migrationState.ordinal()));
            writableDatabase.update(LegacyProfileTable.TABLE_NAME, contentValues, "identifier = ?", new String[]{str});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in updating user migration sync status", e);
            z = false;
        }
        return z;
    }

    synchronized void storeLegacyAnalyticsEventIds(List<KeyValuePair> list) {
        String str;
        String str2;
        SQLiteDatabase writableDatabase;
        SQLiteDatabase sQLiteDatabase = null;
        try {
            try {
                writableDatabase = this.userDBHelper.getWritableDatabase();
            } catch (Exception e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            writableDatabase.beginTransaction();
            Iterator<KeyValuePair> it = list.iterator();
            while (it.hasNext()) {
                writableDatabase.insert(LegacyAnalyticsEventIDTable.TABLE_NAME, null, legacyAnalyticsIDPairToContentValues(it.next()));
            }
            writableDatabase.setTransactionSuccessful();
            if (writableDatabase != null) {
                try {
                    writableDatabase.endTransaction();
                } catch (Exception e2) {
                    e = e2;
                    str = TAG;
                    str2 = "Error in storing legacy analytics events in finally block";
                    HSLogger.e(str, str2, e);
                }
            }
        } catch (Exception e3) {
            e = e3;
            sQLiteDatabase = writableDatabase;
            HSLogger.e(TAG, "Error in storing legacy analytics events", e);
            if (sQLiteDatabase != null) {
                try {
                    sQLiteDatabase.endTransaction();
                } catch (Exception e4) {
                    e = e4;
                    str = TAG;
                    str2 = "Error in storing legacy analytics events in finally block";
                    HSLogger.e(str, str2, e);
                }
            }
        } catch (Throwable th2) {
            th = th2;
            sQLiteDatabase = writableDatabase;
            if (sQLiteDatabase != null) {
                try {
                    sQLiteDatabase.endTransaction();
                } catch (Exception e5) {
                    HSLogger.e(TAG, "Error in storing legacy analytics events in finally block", e5);
                }
            }
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0048 A[Catch: all -> 0x004c, TRY_ENTER, TryCatch #4 {, blocks: (B:4:0x0002, B:11:0x002c, B:26:0x0048, B:27:0x004b), top: B:34:0x0002 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    synchronized java.lang.String fetchLegacyAnalyticsEventId(java.lang.String r11) {
        /*
            r10 = this;
            monitor-enter(r10)
            r0 = 1
            java.lang.String[] r5 = new java.lang.String[r0]     // Catch: java.lang.Throwable -> L4c
            r0 = 0
            r5[r0] = r11     // Catch: java.lang.Throwable -> L4c
            r11 = 0
            com.helpshift.db.user.UserDBHelper r0 = r10.userDBHelper     // Catch: java.lang.Throwable -> L32 java.lang.Exception -> L37
            android.database.sqlite.SQLiteDatabase r1 = r0.getReadableDatabase()     // Catch: java.lang.Throwable -> L32 java.lang.Exception -> L37
            java.lang.String r2 = "legacy_analytics_event_id_table"
            r3 = 0
            java.lang.String r4 = "identifier = ?"
            r6 = 0
            r7 = 0
            r8 = 0
            android.database.Cursor r0 = r1.query(r2, r3, r4, r5, r6, r7, r8)     // Catch: java.lang.Throwable -> L32 java.lang.Exception -> L37
            boolean r1 = r0.moveToFirst()     // Catch: java.lang.Exception -> L30 java.lang.Throwable -> L45
            if (r1 == 0) goto L2a
            java.lang.String r1 = "analytics_event_id"
            int r1 = r0.getColumnIndex(r1)     // Catch: java.lang.Exception -> L30 java.lang.Throwable -> L45
            java.lang.String r11 = r0.getString(r1)     // Catch: java.lang.Exception -> L30 java.lang.Throwable -> L45
        L2a:
            if (r0 == 0) goto L43
        L2c:
            r0.close()     // Catch: java.lang.Throwable -> L4c
            goto L43
        L30:
            r1 = move-exception
            goto L39
        L32:
            r0 = move-exception
            r9 = r0
            r0 = r11
            r11 = r9
            goto L46
        L37:
            r1 = move-exception
            r0 = r11
        L39:
            java.lang.String r2 = "Helpshift_UserDB"
            java.lang.String r3 = "Error in reading legacy analytics eventID with identifier"
            com.helpshift.util.HSLogger.e(r2, r3, r1)     // Catch: java.lang.Throwable -> L45
            if (r0 == 0) goto L43
            goto L2c
        L43:
            monitor-exit(r10)
            return r11
        L45:
            r11 = move-exception
        L46:
            if (r0 == 0) goto L4b
            r0.close()     // Catch: java.lang.Throwable -> L4c
        L4b:
            throw r11     // Catch: java.lang.Throwable -> L4c
        L4c:
            r11 = move-exception
            monitor-exit(r10)
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.account.dao.UserDB.fetchLegacyAnalyticsEventId(java.lang.String):java.lang.String");
    }

    private UserSyncStatus intToUserSyncStatus(int i) {
        if (i < 0 || i > 3) {
            i = 0;
        }
        return UserSyncStatus.values()[i];
    }

    private MigrationState intToMigrationState(int i) {
        if (i < 0 || i > 3) {
            i = 0;
        }
        return MigrationState.values()[i];
    }

    private ClearedUserSyncState intToClearedUserSyncState(int i) {
        if (i < 0 || i > 3) {
            i = 0;
        }
        return ClearedUserSyncState.values()[i];
    }

    private RedactionState intToRedactionState(int i) {
        RedactionState[] redactionStateArrValues = RedactionState.values();
        if (i < 0 || i > redactionStateArrValues.length) {
            i = 0;
        }
        return redactionStateArrValues[i];
    }

    private RedactionType intToRedactionType(int i) {
        RedactionType[] redactionTypeArrValues = RedactionType.values();
        if (i < 0 || i > redactionTypeArrValues.length) {
            i = 0;
        }
        return redactionTypeArrValues[i];
    }

    private ContentValues redactionDetailToContentValues(RedactionDetail redactionDetail) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("user_local_id", Long.valueOf(redactionDetail.userLocalId));
        contentValues.put(RedactionInfoTable.Columns.REDACTION_STATE, Integer.valueOf(redactionDetail.redactionState.ordinal()));
        contentValues.put(RedactionInfoTable.Columns.REDACTION_TYPE, Integer.valueOf(redactionDetail.redactionType.ordinal()));
        return contentValues;
    }

    private RedactionDetail cursorToRedactionDetail(Cursor cursor) {
        return new RedactionDetail(cursor.getLong(cursor.getColumnIndex("user_local_id")), intToRedactionState(cursor.getInt(cursor.getColumnIndex(RedactionInfoTable.Columns.REDACTION_STATE))), intToRedactionType(cursor.getInt(cursor.getColumnIndex(RedactionInfoTable.Columns.REDACTION_TYPE))));
    }

    synchronized void insertRedactionDetail(RedactionDetail redactionDetail) {
        try {
            this.userDBHelper.getWritableDatabase().insert(RedactionInfoTable.TABLE_NAME, null, redactionDetailToContentValues(redactionDetail));
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in inserting redaction info of the user", e);
        }
    }

    synchronized void updateRedactionDetail(RedactionDetail redactionDetail) {
        try {
            this.userDBHelper.getWritableDatabase().update(RedactionInfoTable.TABLE_NAME, redactionDetailToContentValues(redactionDetail), "user_local_id = ?", new String[]{String.valueOf(redactionDetail.userLocalId)});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in updating redaction detail", e);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0047 A[Catch: all -> 0x004b, TRY_ENTER, TryCatch #4 {, blocks: (B:4:0x0002, B:11:0x002b, B:26:0x0047, B:27:0x004a), top: B:34:0x0002 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    synchronized com.helpshift.redaction.RedactionDetail fetchRedactionDetail(long r11) {
        /*
            r10 = this;
            monitor-enter(r10)
            r0 = 1
            java.lang.String[] r5 = new java.lang.String[r0]     // Catch: java.lang.Throwable -> L4b
            r0 = 0
            java.lang.String r11 = java.lang.String.valueOf(r11)     // Catch: java.lang.Throwable -> L4b
            r5[r0] = r11     // Catch: java.lang.Throwable -> L4b
            r11 = 0
            com.helpshift.db.user.UserDBHelper r12 = r10.userDBHelper     // Catch: java.lang.Throwable -> L31 java.lang.Exception -> L36
            android.database.sqlite.SQLiteDatabase r1 = r12.getReadableDatabase()     // Catch: java.lang.Throwable -> L31 java.lang.Exception -> L36
            java.lang.String r2 = "redaction_info_table"
            r3 = 0
            java.lang.String r4 = "user_local_id = ?"
            r6 = 0
            r7 = 0
            r8 = 0
            android.database.Cursor r12 = r1.query(r2, r3, r4, r5, r6, r7, r8)     // Catch: java.lang.Throwable -> L31 java.lang.Exception -> L36
            boolean r0 = r12.moveToFirst()     // Catch: java.lang.Exception -> L2f java.lang.Throwable -> L44
            if (r0 == 0) goto L29
            com.helpshift.redaction.RedactionDetail r11 = r10.cursorToRedactionDetail(r12)     // Catch: java.lang.Exception -> L2f java.lang.Throwable -> L44
        L29:
            if (r12 == 0) goto L42
        L2b:
            r12.close()     // Catch: java.lang.Throwable -> L4b
            goto L42
        L2f:
            r0 = move-exception
            goto L38
        L31:
            r12 = move-exception
            r9 = r12
            r12 = r11
            r11 = r9
            goto L45
        L36:
            r0 = move-exception
            r12 = r11
        L38:
            java.lang.String r1 = "Helpshift_UserDB"
            java.lang.String r2 = "Error in reading redaction detail of the user"
            com.helpshift.util.HSLogger.e(r1, r2, r0)     // Catch: java.lang.Throwable -> L44
            if (r12 == 0) goto L42
            goto L2b
        L42:
            monitor-exit(r10)
            return r11
        L44:
            r11 = move-exception
        L45:
            if (r12 == 0) goto L4a
            r12.close()     // Catch: java.lang.Throwable -> L4b
        L4a:
            throw r11     // Catch: java.lang.Throwable -> L4b
        L4b:
            r11 = move-exception
            monitor-exit(r10)
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.account.dao.UserDB.fetchRedactionDetail(long):com.helpshift.redaction.RedactionDetail");
    }

    synchronized void updateRedactionState(long j, RedactionState redactionState) {
        try {
            SQLiteDatabase writableDatabase = this.userDBHelper.getWritableDatabase();
            ContentValues contentValues = new ContentValues();
            contentValues.put(RedactionInfoTable.Columns.REDACTION_STATE, Integer.valueOf(redactionState.ordinal()));
            writableDatabase.update(RedactionInfoTable.TABLE_NAME, contentValues, "user_local_id = ?", new String[]{String.valueOf(j)});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in updating redaction status", e);
        }
    }

    synchronized void deleteRedactionDetail(long j) {
        try {
            this.userDBHelper.getWritableDatabase().delete(RedactionInfoTable.TABLE_NAME, "user_local_id = ?", new String[]{String.valueOf(j)});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in deleting redaction detail", e);
        }
    }

    void dropAndCreateDatabase() {
        UserDBHelper userDBHelper = this.userDBHelper;
        userDBHelper.dropAndCreateAllTables(userDBHelper.getWritableDatabase());
    }
}
