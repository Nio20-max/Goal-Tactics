package com.helpshift.campaigns.storage;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.helpshift.campaigns.models.CampaignDetailModel;
import com.helpshift.campaigns.observers.CampaignStorageObserver;
import com.helpshift.campaigns.util.constants.CampaignColumns;
import com.helpshift.util.ByteArrayUtil;
import com.helpshift.util.DatabaseUtils;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;

/* JADX INFO: loaded from: classes.dex */
public class CampaignDbStorage implements CampaignStorage {
    private static final String TAG = "Helpshift_CampDBStore";
    private final CampaignDbStorageHelper helper = new CampaignDbStorageHelper(HelpshiftContext.getApplicationContext());
    private ConcurrentLinkedQueue<CampaignStorageObserver> observers = new ConcurrentLinkedQueue<>();

    /* JADX WARN: Removed duplicated region for block: B:26:0x0079 A[Catch: all -> 0x0059, TryCatch #1 {, blocks: (B:17:0x0036, B:19:0x004e, B:26:0x0079, B:27:0x007f, B:29:0x0085, B:30:0x008f, B:24:0x005c), top: B:35:0x0036, inners: #0 }] */
    @Override // com.helpshift.campaigns.storage.CampaignStorage
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void addCampaign(com.helpshift.campaigns.models.CampaignDetailModel r8) {
        /*
            r7 = this;
            if (r8 == 0) goto L93
            java.lang.String r0 = r8.getIdentifier()
            boolean r0 = android.text.TextUtils.isEmpty(r0)
            if (r0 != 0) goto L93
            java.lang.String r0 = r8.userIdentifier
            boolean r0 = android.text.TextUtils.isEmpty(r0)
            if (r0 != 0) goto L93
            java.lang.String r0 = r8.getTitle()
            boolean r0 = android.text.TextUtils.isEmpty(r0)
            if (r0 != 0) goto L93
            java.lang.String r0 = r8.getBody()
            boolean r0 = android.text.TextUtils.isEmpty(r0)
            if (r0 != 0) goto L93
            java.lang.String r0 = r8.iconImageUrl
            boolean r0 = android.text.TextUtils.isEmpty(r0)
            if (r0 == 0) goto L31
            goto L93
        L31:
            com.helpshift.campaigns.storage.CampaignDbStorageHelper r0 = r7.helper
            monitor-enter(r0)
            r1 = 1
            r2 = 0
            com.helpshift.campaigns.storage.CampaignDbStorageHelper r3 = r7.helper     // Catch: java.lang.Throwable -> L59 java.lang.Exception -> L5b
            android.database.sqlite.SQLiteDatabase r3 = r3.getWritableDatabase()     // Catch: java.lang.Throwable -> L59 java.lang.Exception -> L5b
            java.lang.String r4 = "identifier=?"
            java.lang.String[] r5 = new java.lang.String[r1]     // Catch: java.lang.Throwable -> L59 java.lang.Exception -> L5b
            java.lang.String r6 = r8.getIdentifier()     // Catch: java.lang.Throwable -> L59 java.lang.Exception -> L5b
            r5[r2] = r6     // Catch: java.lang.Throwable -> L59 java.lang.Exception -> L5b
            java.lang.String r6 = "campaigns"
            boolean r4 = com.helpshift.util.DatabaseUtils.exists(r3, r6, r4, r5)     // Catch: java.lang.Throwable -> L59 java.lang.Exception -> L5b
            if (r4 != 0) goto L77
            java.lang.String r4 = "campaigns"
            r5 = 0
            android.content.ContentValues r6 = r7.campaignToContentValues(r8)     // Catch: java.lang.Throwable -> L59 java.lang.Exception -> L5b
            r3.insert(r4, r5, r6)     // Catch: java.lang.Throwable -> L59 java.lang.Exception -> L5b
            goto L77
        L59:
            r8 = move-exception
            goto L91
        L5b:
            r1 = move-exception
            java.lang.String r3 = "Helpshift_CampDBStore"
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L59
            r4.<init>()     // Catch: java.lang.Throwable -> L59
            java.lang.String r5 = "Exception in adding campaign with id "
            r4.append(r5)     // Catch: java.lang.Throwable -> L59
            java.lang.String r5 = r8.getIdentifier()     // Catch: java.lang.Throwable -> L59
            r4.append(r5)     // Catch: java.lang.Throwable -> L59
            java.lang.String r4 = r4.toString()     // Catch: java.lang.Throwable -> L59
            com.helpshift.util.HSLogger.e(r3, r4, r1)     // Catch: java.lang.Throwable -> L59
            r1 = 0
        L77:
            if (r1 == 0) goto L8f
            java.util.concurrent.ConcurrentLinkedQueue<com.helpshift.campaigns.observers.CampaignStorageObserver> r1 = r7.observers     // Catch: java.lang.Throwable -> L59
            java.util.Iterator r1 = r1.iterator()     // Catch: java.lang.Throwable -> L59
        L7f:
            boolean r2 = r1.hasNext()     // Catch: java.lang.Throwable -> L59
            if (r2 == 0) goto L8f
            java.lang.Object r2 = r1.next()     // Catch: java.lang.Throwable -> L59
            com.helpshift.campaigns.observers.CampaignStorageObserver r2 = (com.helpshift.campaigns.observers.CampaignStorageObserver) r2     // Catch: java.lang.Throwable -> L59
            r2.campaignDetailModelAdded(r8)     // Catch: java.lang.Throwable -> L59
            goto L7f
        L8f:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L59
            return
        L91:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L59
            throw r8
        L93:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.campaigns.storage.CampaignDbStorage.addCampaign(com.helpshift.campaigns.models.CampaignDetailModel):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x004c A[Catch: all -> 0x0030, TryCatch #0 {, blocks: (B:8:0x000c, B:10:0x0020, B:17:0x004c, B:18:0x0052, B:20:0x0058, B:21:0x0062, B:15:0x0033), top: B:25:0x000c, inners: #1 }] */
    @Override // com.helpshift.campaigns.storage.CampaignStorage
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void updateCampaignWithIconImageFilePath(java.lang.String r9, java.lang.String r10) {
        /*
            r8 = this;
            boolean r0 = android.text.TextUtils.isEmpty(r9)
            if (r0 == 0) goto L7
            return
        L7:
            com.helpshift.campaigns.storage.CampaignDbStorageHelper r0 = r8.helper
            monitor-enter(r0)
            r1 = 1
            r2 = 0
            com.helpshift.campaigns.storage.CampaignDbStorageHelper r3 = r8.helper     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            android.database.sqlite.SQLiteDatabase r3 = r3.getWritableDatabase()     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            java.lang.String r4 = "identifier=?"
            java.lang.String[] r5 = new java.lang.String[r1]     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            r5[r2] = r9     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            java.lang.String r6 = "campaigns"
            boolean r6 = com.helpshift.util.DatabaseUtils.exists(r3, r6, r4, r5)     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            if (r6 == 0) goto L4a
            android.content.ContentValues r6 = new android.content.ContentValues     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            r6.<init>()     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            java.lang.String r7 = "icon_image_file_path"
            r6.put(r7, r10)     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            java.lang.String r10 = "campaigns"
            r3.update(r10, r6, r4, r5)     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            goto L4a
        L30:
            r9 = move-exception
            goto L64
        L32:
            r10 = move-exception
            java.lang.String r1 = "Helpshift_CampDBStore"
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L30
            r3.<init>()     // Catch: java.lang.Throwable -> L30
            java.lang.String r4 = "Exception in updating icon image path for "
            r3.append(r4)     // Catch: java.lang.Throwable -> L30
            r3.append(r9)     // Catch: java.lang.Throwable -> L30
            java.lang.String r3 = r3.toString()     // Catch: java.lang.Throwable -> L30
            com.helpshift.util.HSLogger.e(r1, r3, r10)     // Catch: java.lang.Throwable -> L30
            r1 = 0
        L4a:
            if (r1 == 0) goto L62
            java.util.concurrent.ConcurrentLinkedQueue<com.helpshift.campaigns.observers.CampaignStorageObserver> r10 = r8.observers     // Catch: java.lang.Throwable -> L30
            java.util.Iterator r10 = r10.iterator()     // Catch: java.lang.Throwable -> L30
        L52:
            boolean r1 = r10.hasNext()     // Catch: java.lang.Throwable -> L30
            if (r1 == 0) goto L62
            java.lang.Object r1 = r10.next()     // Catch: java.lang.Throwable -> L30
            com.helpshift.campaigns.observers.CampaignStorageObserver r1 = (com.helpshift.campaigns.observers.CampaignStorageObserver) r1     // Catch: java.lang.Throwable -> L30
            r1.campaignIconImageFilePathUpdated(r9)     // Catch: java.lang.Throwable -> L30
            goto L52
        L62:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L30
            return
        L64:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L30
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.campaigns.storage.CampaignDbStorage.updateCampaignWithIconImageFilePath(java.lang.String, java.lang.String):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x004c A[Catch: all -> 0x0030, TryCatch #0 {, blocks: (B:8:0x000c, B:10:0x0020, B:17:0x004c, B:18:0x0052, B:20:0x0058, B:21:0x0062, B:15:0x0033), top: B:25:0x000c, inners: #1 }] */
    @Override // com.helpshift.campaigns.storage.CampaignStorage
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void updateCampaignWIthCoverImageFilePath(java.lang.String r9, java.lang.String r10) {
        /*
            r8 = this;
            boolean r0 = android.text.TextUtils.isEmpty(r9)
            if (r0 == 0) goto L7
            return
        L7:
            com.helpshift.campaigns.storage.CampaignDbStorageHelper r0 = r8.helper
            monitor-enter(r0)
            r1 = 1
            r2 = 0
            com.helpshift.campaigns.storage.CampaignDbStorageHelper r3 = r8.helper     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            android.database.sqlite.SQLiteDatabase r3 = r3.getWritableDatabase()     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            java.lang.String r4 = "identifier=?"
            java.lang.String[] r5 = new java.lang.String[r1]     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            r5[r2] = r9     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            java.lang.String r6 = "campaigns"
            boolean r6 = com.helpshift.util.DatabaseUtils.exists(r3, r6, r4, r5)     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            if (r6 == 0) goto L4a
            android.content.ContentValues r6 = new android.content.ContentValues     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            r6.<init>()     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            java.lang.String r7 = "cover_image_file_path"
            r6.put(r7, r10)     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            java.lang.String r10 = "campaigns"
            r3.update(r10, r6, r4, r5)     // Catch: java.lang.Throwable -> L30 java.lang.Exception -> L32
            goto L4a
        L30:
            r9 = move-exception
            goto L64
        L32:
            r10 = move-exception
            java.lang.String r1 = "Helpshift_CampDBStore"
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L30
            r3.<init>()     // Catch: java.lang.Throwable -> L30
            java.lang.String r4 = "Exception in updating cover image path for "
            r3.append(r4)     // Catch: java.lang.Throwable -> L30
            r3.append(r9)     // Catch: java.lang.Throwable -> L30
            java.lang.String r3 = r3.toString()     // Catch: java.lang.Throwable -> L30
            com.helpshift.util.HSLogger.e(r1, r3, r10)     // Catch: java.lang.Throwable -> L30
            r1 = 0
        L4a:
            if (r1 == 0) goto L62
            java.util.concurrent.ConcurrentLinkedQueue<com.helpshift.campaigns.observers.CampaignStorageObserver> r10 = r8.observers     // Catch: java.lang.Throwable -> L30
            java.util.Iterator r10 = r10.iterator()     // Catch: java.lang.Throwable -> L30
        L52:
            boolean r1 = r10.hasNext()     // Catch: java.lang.Throwable -> L30
            if (r1 == 0) goto L62
            java.lang.Object r1 = r10.next()     // Catch: java.lang.Throwable -> L30
            com.helpshift.campaigns.observers.CampaignStorageObserver r1 = (com.helpshift.campaigns.observers.CampaignStorageObserver) r1     // Catch: java.lang.Throwable -> L30
            r1.campaignCoverImageFilePathUpdated(r9)     // Catch: java.lang.Throwable -> L30
            goto L52
        L62:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L30
            return
        L64:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L30
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.campaigns.storage.CampaignDbStorage.updateCampaignWIthCoverImageFilePath(java.lang.String, java.lang.String):void");
    }

    @Override // com.helpshift.campaigns.storage.CampaignStorage
    public void markCampaignAsRead(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        synchronized (this.helper) {
            boolean z = false;
            try {
                SQLiteDatabase writableDatabase = this.helper.getWritableDatabase();
                String[] strArr = {str};
                if (DatabaseUtils.exists(writableDatabase, "campaigns", "identifier=?", strArr)) {
                    ContentValues contentValues = new ContentValues();
                    contentValues.put(CampaignColumns.READ_STATUS, (Integer) 1);
                    writableDatabase.update("campaigns", contentValues, "identifier=?", strArr);
                }
                z = true;
            } catch (Exception e) {
                HSLogger.e(TAG, "Exception in marking campaign as read for id : " + str, e);
            }
            if (z) {
                Iterator<CampaignStorageObserver> it = this.observers.iterator();
                while (it.hasNext()) {
                    it.next().campaignRead(str);
                }
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.CampaignStorage
    public void markCampaignAsSeen(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        synchronized (this.helper) {
            boolean z = false;
            try {
                SQLiteDatabase writableDatabase = this.helper.getWritableDatabase();
                String[] strArr = {str};
                if (DatabaseUtils.exists(writableDatabase, "campaigns", "identifier=?", strArr)) {
                    ContentValues contentValues = new ContentValues();
                    contentValues.put(CampaignColumns.SEEN_STATUS, (Integer) 1);
                    contentValues.put(CampaignColumns.READ_STATUS, (Integer) 1);
                    writableDatabase.update("campaigns", contentValues, "identifier=?", strArr);
                }
                z = true;
            } catch (Exception e) {
                HSLogger.e(TAG, "Exception in marking campaign as read for id : " + str, e);
            }
            if (z) {
                Iterator<CampaignStorageObserver> it = this.observers.iterator();
                while (it.hasNext()) {
                    it.next().campaignSeen(str);
                }
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.CampaignStorage
    public List<CampaignDetailModel> getAllCampaigns(String str) {
        Throwable th;
        Cursor cursorQuery;
        ArrayList arrayList;
        Exception e;
        ArrayList arrayList2 = null;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        synchronized (this.helper) {
            try {
                cursorQuery = this.helper.getReadableDatabase().query("campaigns", null, "user_identifier=?", new String[]{str}, null, null, "created_at DESC");
                try {
                    try {
                        if (cursorQuery.moveToFirst()) {
                            arrayList = new ArrayList();
                            while (!cursorQuery.isAfterLast()) {
                                try {
                                    arrayList.add(cursorToCampaignDetailModel(cursorQuery));
                                    cursorQuery.moveToNext();
                                } catch (Exception e2) {
                                    e = e2;
                                    HSLogger.e(TAG, "Exception in retrieving all the campaigns ", e);
                                    if (cursorQuery != null) {
                                        cursorQuery.close();
                                    }
                                    arrayList2 = arrayList;
                                }
                            }
                            arrayList2 = arrayList;
                        }
                        if (cursorQuery != null) {
                            cursorQuery.close();
                        }
                    } catch (Exception e3) {
                        arrayList = null;
                        e = e3;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (cursorQuery != null) {
                        cursorQuery.close();
                    }
                    throw th;
                }
            } catch (Exception e4) {
                arrayList = null;
                e = e4;
                cursorQuery = null;
            } catch (Throwable th3) {
                th = th3;
                cursorQuery = null;
            }
        }
        return arrayList2;
    }

    @Override // com.helpshift.campaigns.storage.CampaignStorage
    public List<CampaignDetailModel> getAllCampaigns(boolean z, String str) {
        ArrayList arrayList;
        Cursor cursor = null;
        ArrayList arrayList2 = null;
        cursor = null;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        synchronized (this.helper) {
            try {
                try {
                    Cursor cursorQuery = this.helper.getReadableDatabase().query("campaigns", null, "read_status=" + (z ? "1" : AppEventsConstants.EVENT_PARAM_VALUE_NO) + " and user_identifier=?", new String[]{str}, null, null, "created_at DESC");
                    try {
                        try {
                            if (cursorQuery.moveToFirst()) {
                                arrayList = new ArrayList();
                                while (!cursorQuery.isAfterLast()) {
                                    try {
                                        arrayList.add(cursorToCampaignDetailModel(cursorQuery));
                                        cursorQuery.moveToNext();
                                    } catch (Exception e) {
                                        cursor = cursorQuery;
                                        e = e;
                                        HSLogger.e(TAG, "Exception in fetching all the campaigns with read status : " + z, e);
                                        if (cursor != null) {
                                            cursor.close();
                                        }
                                        arrayList2 = arrayList;
                                    }
                                }
                                arrayList2 = arrayList;
                            }
                            if (cursorQuery != null) {
                                cursorQuery.close();
                            }
                        } catch (Throwable th) {
                            th = th;
                            cursor = cursorQuery;
                            if (cursor != null) {
                                cursor.close();
                            }
                            throw th;
                        }
                    } catch (Exception e2) {
                        cursor = cursorQuery;
                        e = e2;
                        arrayList = null;
                    }
                } catch (Exception e3) {
                    e = e3;
                    arrayList = null;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
        return arrayList2;
    }

    /* JADX WARN: Not initialized variable reg: 2, insn: 0x0055: MOVE (r1 I:??[OBJECT, ARRAY]) = (r2 I:??[OBJECT, ARRAY]), block:B:26:0x0055 */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0058 A[Catch: all -> 0x005c, TryCatch #3 {, blocks: (B:12:0x002f, B:23:0x0052, B:28:0x0058, B:29:0x005b), top: B:34:0x000b }] */
    @Override // com.helpshift.campaigns.storage.CampaignStorage
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.helpshift.campaigns.models.CampaignDetailModel getCampaign(java.lang.String r12) {
        /*
            r11 = this;
            boolean r0 = android.text.TextUtils.isEmpty(r12)
            r1 = 0
            if (r0 == 0) goto L8
            return r1
        L8:
            com.helpshift.campaigns.storage.CampaignDbStorageHelper r0 = r11.helper
            monitor-enter(r0)
            com.helpshift.campaigns.storage.CampaignDbStorageHelper r2 = r11.helper     // Catch: java.lang.Throwable -> L35 java.lang.Exception -> L37
            android.database.sqlite.SQLiteDatabase r3 = r2.getReadableDatabase()     // Catch: java.lang.Throwable -> L35 java.lang.Exception -> L37
            java.lang.String r6 = "identifier=?"
            r2 = 1
            java.lang.String[] r7 = new java.lang.String[r2]     // Catch: java.lang.Throwable -> L35 java.lang.Exception -> L37
            r2 = 0
            r7[r2] = r12     // Catch: java.lang.Throwable -> L35 java.lang.Exception -> L37
            java.lang.String r4 = "campaigns"
            r5 = 0
            r8 = 0
            r9 = 0
            r10 = 0
            android.database.Cursor r2 = r3.query(r4, r5, r6, r7, r8, r9, r10)     // Catch: java.lang.Throwable -> L35 java.lang.Exception -> L37
            boolean r3 = r2.moveToFirst()     // Catch: java.lang.Exception -> L33 java.lang.Throwable -> L54
            if (r3 == 0) goto L2d
            com.helpshift.campaigns.models.CampaignDetailModel r1 = r11.cursorToCampaignDetailModel(r2)     // Catch: java.lang.Exception -> L33 java.lang.Throwable -> L54
        L2d:
            if (r2 == 0) goto L52
        L2f:
            r2.close()     // Catch: java.lang.Throwable -> L5c
            goto L52
        L33:
            r3 = move-exception
            goto L39
        L35:
            r12 = move-exception
            goto L56
        L37:
            r3 = move-exception
            r2 = r1
        L39:
            java.lang.String r4 = "Helpshift_CampDBStore"
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L54
            r5.<init>()     // Catch: java.lang.Throwable -> L54
            java.lang.String r6 = "Exception while fetching campaign for id : "
            r5.append(r6)     // Catch: java.lang.Throwable -> L54
            r5.append(r12)     // Catch: java.lang.Throwable -> L54
            java.lang.String r12 = r5.toString()     // Catch: java.lang.Throwable -> L54
            com.helpshift.util.HSLogger.e(r4, r12, r3)     // Catch: java.lang.Throwable -> L54
            if (r2 == 0) goto L52
            goto L2f
        L52:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L5c
            return r1
        L54:
            r12 = move-exception
            r1 = r2
        L56:
            if (r1 == 0) goto L5b
            r1.close()     // Catch: java.lang.Throwable -> L5c
        L5b:
            throw r12     // Catch: java.lang.Throwable -> L5c
        L5c:
            r12 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> L5c
            throw r12
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.campaigns.storage.CampaignDbStorage.getCampaign(java.lang.String):com.helpshift.campaigns.models.CampaignDetailModel");
    }

    @Override // com.helpshift.campaigns.storage.CampaignStorage
    public void deleteCampaign(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        synchronized (this.helper) {
            boolean z = true;
            try {
                this.helper.getWritableDatabase().delete("campaigns", "identifier=?", new String[]{str});
            } catch (Exception e) {
                HSLogger.e(TAG, "Exception in deleting campaign for id " + str, e);
                z = false;
            }
            if (z) {
                Iterator<CampaignStorageObserver> it = this.observers.iterator();
                while (it.hasNext()) {
                    it.next().campaignDeleted(str);
                }
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.CampaignStorage
    public void deleteCampaigns(String[] strArr) {
        boolean z;
        if (strArr == null || strArr.length == 0) {
            return;
        }
        synchronized (this.helper) {
            try {
                this.helper.getWritableDatabase().delete("campaigns", "identifier in (" + DatabaseUtils.makePlaceholders(strArr.length) + ")", strArr);
                z = true;
            } catch (Exception e) {
                HSLogger.e(TAG, "Exception in deleting campaigns ", e);
                z = false;
            }
            if (z) {
                for (CampaignStorageObserver campaignStorageObserver : this.observers) {
                    for (String str : strArr) {
                        campaignStorageObserver.campaignDeleted(str);
                    }
                }
            }
        }
    }

    @Override // com.helpshift.campaigns.storage.CampaignStorage
    public void addObserver(CampaignStorageObserver campaignStorageObserver) {
        if (campaignStorageObserver != null) {
            this.observers.add(campaignStorageObserver);
        }
    }

    @Override // com.helpshift.campaigns.storage.CampaignStorage
    public void removeObserver(CampaignStorageObserver campaignStorageObserver) {
        this.observers.remove(campaignStorageObserver);
    }

    private ContentValues campaignToContentValues(CampaignDetailModel campaignDetailModel) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("identifier", campaignDetailModel.getIdentifier());
        contentValues.put("user_identifier", campaignDetailModel.userIdentifier);
        contentValues.put("title", campaignDetailModel.getTitle());
        contentValues.put("body", campaignDetailModel.getBody());
        contentValues.put(CampaignColumns.COVER_IMAGE_URL, campaignDetailModel.coverImageUrl);
        contentValues.put(CampaignColumns.COVER_IMAGE_FILE_PATH, campaignDetailModel.coverImageFilePath);
        contentValues.put(CampaignColumns.ICON_IMAGE_URL, campaignDetailModel.iconImageUrl);
        contentValues.put(CampaignColumns.ICON_IMAGE_FILE_PATH, campaignDetailModel.iconImageFilePath);
        contentValues.put(CampaignColumns.BACKGROUND_COLOR, campaignDetailModel.getBackgroundColor());
        contentValues.put(CampaignColumns.TITLE_COLOR, campaignDetailModel.getTitleColor());
        contentValues.put(CampaignColumns.TEXT_COLOR, campaignDetailModel.getBodyColor());
        try {
            contentValues.put("actions", ByteArrayUtil.toByteArray(campaignDetailModel.actions));
        } catch (IOException unused) {
            contentValues.put("actions", "");
        }
        try {
            contentValues.put("messages", ByteArrayUtil.toByteArray(campaignDetailModel.messages));
        } catch (IOException unused2) {
            contentValues.put("messages", "");
        }
        contentValues.put(CampaignColumns.READ_STATUS, Integer.valueOf(campaignDetailModel.getReadStatus() ? 1 : 0));
        contentValues.put(CampaignColumns.SEEN_STATUS, Integer.valueOf(campaignDetailModel.getSeenStatus() ? 1 : 0));
        contentValues.put("created_at", Long.valueOf(campaignDetailModel.getCreatedAt()));
        contentValues.put(CampaignColumns.EXPIRY_TIME_STAMP, Long.valueOf(campaignDetailModel.getExpiryTimeStamp()));
        contentValues.put(CampaignColumns.EXTRA_DATA, "");
        return contentValues;
    }

    private CampaignDetailModel cursorToCampaignDetailModel(Cursor cursor) {
        ArrayList arrayList;
        ArrayList arrayList2;
        try {
            arrayList = (ArrayList) ByteArrayUtil.toObject(cursor.getBlob(cursor.getColumnIndex("actions")));
        } catch (IOException e) {
            HSLogger.e(TAG, "IO exception in retrieving campaign actions :", e);
            arrayList = null;
        } catch (ClassCastException e2) {
            HSLogger.e(TAG, "Class cast Exception in retrieving campaign actions :", e2);
            arrayList = null;
        } catch (ClassNotFoundException e3) {
            HSLogger.e(TAG, "Class not found exception in retrieving campaign actions :", e3);
            arrayList = null;
        }
        try {
            arrayList2 = (ArrayList) ByteArrayUtil.toObject(cursor.getBlob(cursor.getColumnIndex("messages")));
        } catch (IOException e4) {
            HSLogger.e(TAG, "IO exception in retrieving campaign messages :", e4);
            arrayList2 = null;
        } catch (ClassCastException e5) {
            HSLogger.e(TAG, "Class cast Exception in retrieving campaign messages :", e5);
            arrayList2 = null;
        } catch (ClassNotFoundException e6) {
            HSLogger.e(TAG, "Class not found exception in retrieving campaign messages :", e6);
            arrayList2 = null;
        }
        return new CampaignDetailModel(cursor.getString(cursor.getColumnIndex("identifier")), cursor.getString(cursor.getColumnIndex("user_identifier")), cursor.getString(cursor.getColumnIndex("title")), cursor.getString(cursor.getColumnIndex("body")), cursor.getString(cursor.getColumnIndex(CampaignColumns.COVER_IMAGE_URL)), cursor.getString(cursor.getColumnIndex(CampaignColumns.COVER_IMAGE_FILE_PATH)), cursor.getString(cursor.getColumnIndex(CampaignColumns.ICON_IMAGE_URL)), cursor.getString(cursor.getColumnIndex(CampaignColumns.ICON_IMAGE_FILE_PATH)), cursor.getString(cursor.getColumnIndex(CampaignColumns.BACKGROUND_COLOR)), cursor.getString(cursor.getColumnIndex(CampaignColumns.TITLE_COLOR)), cursor.getString(cursor.getColumnIndex(CampaignColumns.TEXT_COLOR)), cursor.getInt(cursor.getColumnIndex(CampaignColumns.READ_STATUS)) == 1, cursor.getInt(cursor.getColumnIndex(CampaignColumns.SEEN_STATUS)) == 1, cursor.getLong(cursor.getColumnIndex("created_at")), cursor.getLong(cursor.getColumnIndex(CampaignColumns.EXPIRY_TIME_STAMP)), arrayList, arrayList2);
    }

    public void reinitStorage() {
        synchronized (this.helper) {
            try {
                this.helper.getWritableDatabase().delete("campaigns", null, null);
            } catch (Exception unused) {
                HSLogger.e(TAG, "Exception while reinitializing the storage");
            }
        }
    }
}
