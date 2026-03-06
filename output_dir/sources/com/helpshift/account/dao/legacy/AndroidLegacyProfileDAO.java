package com.helpshift.account.dao.legacy;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.helpshift.account.dao.ProfileDTO;
import com.helpshift.db.legacy_profile.LegacyProfileDBHelper;
import com.helpshift.db.legacy_profile.LegacyProfileDatabaseContract;
import com.helpshift.db.legacy_profile.tables.ProfileTable;
import com.helpshift.migration.legacyUser.LegacyProfileDAO;

/* JADX INFO: loaded from: classes.dex */
public class AndroidLegacyProfileDAO implements LegacyProfileDAO {
    private static final String TAG = "Helpshift_ALProfileDAO";
    private static AndroidLegacyProfileDAO instance;
    private LegacyProfileDBHelper dbHelper;

    private AndroidLegacyProfileDAO(Context context) {
        this.dbHelper = new LegacyProfileDBHelper(context, new LegacyProfileDatabaseContract());
    }

    public static synchronized AndroidLegacyProfileDAO getInstance(Context context) {
        if (instance == null) {
            instance = new AndroidLegacyProfileDAO(context);
        }
        return instance;
    }

    private static int getColumnIndexForIdentifier(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex(ProfileTable.Columns.COLUMN_IDENTIFIER);
        return columnIndex == -1 ? cursor.getColumnIndex(ProfileTable.Columns.COLUMN_IDENTIFIER.toLowerCase()) : columnIndex;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0054  */
    @Override // com.helpshift.migration.legacyUser.LegacyProfileDAO
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<com.helpshift.account.dao.ProfileDTO> fetchProfiles() throws java.lang.Throwable {
        /*
            r11 = this;
            r0 = 0
            com.helpshift.db.legacy_profile.LegacyProfileDBHelper r1 = r11.dbHelper     // Catch: java.lang.Throwable -> L3a java.lang.Exception -> L3f
            android.database.sqlite.SQLiteDatabase r2 = r1.getReadableDatabase()     // Catch: java.lang.Throwable -> L3a java.lang.Exception -> L3f
            java.lang.String r3 = "profiles"
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            r8 = 0
            r9 = 0
            android.database.Cursor r1 = r2.query(r3, r4, r5, r6, r7, r8, r9)     // Catch: java.lang.Throwable -> L3a java.lang.Exception -> L3f
            boolean r2 = r1.moveToFirst()     // Catch: java.lang.Exception -> L35 java.lang.Throwable -> L51
            if (r2 == 0) goto L2f
            java.util.ArrayList r2 = new java.util.ArrayList     // Catch: java.lang.Exception -> L35 java.lang.Throwable -> L51
            r2.<init>()     // Catch: java.lang.Exception -> L35 java.lang.Throwable -> L51
        L1e:
            com.helpshift.account.dao.ProfileDTO r0 = r11.cursorToProfile(r1)     // Catch: java.lang.Exception -> L2d java.lang.Throwable -> L51
            r2.add(r0)     // Catch: java.lang.Exception -> L2d java.lang.Throwable -> L51
            boolean r0 = r1.moveToNext()     // Catch: java.lang.Exception -> L2d java.lang.Throwable -> L51
            if (r0 != 0) goto L1e
            r0 = r2
            goto L2f
        L2d:
            r0 = move-exception
            goto L43
        L2f:
            if (r1 == 0) goto L50
            r1.close()
            goto L50
        L35:
            r2 = move-exception
            r10 = r2
            r2 = r0
            r0 = r10
            goto L43
        L3a:
            r1 = move-exception
            r10 = r1
            r1 = r0
            r0 = r10
            goto L52
        L3f:
            r1 = move-exception
            r2 = r0
            r0 = r1
            r1 = r2
        L43:
            java.lang.String r3 = "Helpshift_ALProfileDAO"
            java.lang.String r4 = "Error in fetchProfiles"
            com.helpshift.util.HSLogger.e(r3, r4, r0)     // Catch: java.lang.Throwable -> L51
            if (r1 == 0) goto L4f
            r1.close()
        L4f:
            r0 = r2
        L50:
            return r0
        L51:
            r0 = move-exception
        L52:
            if (r1 == 0) goto L57
            r1.close()
        L57:
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.account.dao.legacy.AndroidLegacyProfileDAO.fetchProfiles():java.util.List");
    }

    @Override // com.helpshift.migration.legacyUser.LegacyProfileDAO
    public void deleteProfiles() {
        SQLiteDatabase writableDatabase = this.dbHelper.getWritableDatabase();
        if (writableDatabase != null) {
            writableDatabase.execSQL("DROP TABLE IF EXISTS profiles");
        }
    }

    private ProfileDTO cursorToProfile(Cursor cursor) {
        return new ProfileDTO(Long.valueOf(cursor.getLong(cursor.getColumnIndex("_id"))), cursor.getString(getColumnIndexForIdentifier(cursor)), cursor.getString(cursor.getColumnIndex(ProfileTable.Columns.COLUMN_PROFILE_ID)), cursor.getString(cursor.getColumnIndex("name")), cursor.getString(cursor.getColumnIndex("email")), cursor.getString(cursor.getColumnIndex(ProfileTable.Columns.COLUMN_SALT)), cursor.getString(cursor.getColumnIndex(ProfileTable.Columns.COLUMN_UID)), cursor.getString(cursor.getColumnIndex(ProfileTable.Columns.COLUMN_DID)), cursor.getInt(cursor.getColumnIndex(ProfileTable.Columns.COLUMN_PUSH_TOKEN_SYNC_STATUS)) == 1);
    }
}
