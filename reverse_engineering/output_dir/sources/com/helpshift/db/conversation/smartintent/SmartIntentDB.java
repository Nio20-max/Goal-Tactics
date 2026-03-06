package com.helpshift.db.conversation.smartintent;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.conversation.smartintent.dto.SISearchModelDTO;
import com.helpshift.conversation.smartintent.dto.SITreeDTO;
import com.helpshift.conversation.smartintent.dto.SmartIntentDTO;
import com.helpshift.db.smartintents.SmartIntentDatabaseContract;
import com.helpshift.db.smartintents.SmartIntentsDBHelper;
import com.helpshift.db.smartintents.tables.SmartIntentModelsTable;
import com.helpshift.db.smartintents.tables.SmartIntentTreeTable;
import com.helpshift.db.smartintents.tables.SmartIntentWordProbabilitiesTable;
import com.helpshift.db.smartintents.tables.SmartIntentsTable;
import com.helpshift.util.DatabaseUtils;
import com.helpshift.util.HSJSONUtils;
import com.helpshift.util.HSLogger;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class SmartIntentDB {
    private static final String TAG = "Helpshift_SiDB";
    private static SmartIntentDB mInstance;
    private final SmartIntentsDBHelper siDbHelper;

    private SmartIntentDB(Context context) {
        this.siDbHelper = new SmartIntentsDBHelper(context, new SmartIntentDatabaseContract());
    }

    public static synchronized SmartIntentDB getInstance(Context context) {
        if (mInstance == null) {
            mInstance = new SmartIntentDB(context);
        }
        return mInstance;
    }

    public synchronized boolean insertTree(UserDM userDM, SITreeDTO sITreeDTO) {
        long jInsert = insert(smartIntentTreeToContentValues(sITreeDTO, userDM), SmartIntentTreeTable.TABLE_NAME);
        if (jInsert == -1) {
            return false;
        }
        if (!ListUtils.isEmpty(insertSmartIntents(jInsert, getIntentsFlatList(sITreeDTO.rootIntents)))) {
            return true;
        }
        deleteTreeAndSmartIntents(jInsert);
        return false;
    }

    public synchronized boolean updateTreeRefreshedAt(UserDM userDM, long j) {
        boolean z;
        ContentValues contentValues = new ContentValues();
        contentValues.put("last_refreshed_at", Long.valueOf(j));
        z = true;
        try {
            this.siDbHelper.getWritableDatabase().update(SmartIntentTreeTable.TABLE_NAME, contentValues, "user_local_id = ? ", new String[]{String.valueOf(userDM.getLocalId())});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in updating tree refreshedAt", e);
            z = false;
        }
        return z;
    }

    private ContentValues smartIntentTreeToContentValues(SITreeDTO sITreeDTO, UserDM userDM) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("user_local_id", userDM.getLocalId());
        contentValues.put("server_id", sITreeDTO.serverId);
        contentValues.put(SmartIntentTreeTable.Columns.TREE_VERSION, Integer.valueOf(sITreeDTO.version));
        contentValues.put(SmartIntentTreeTable.Columns.SI_TREE_ENFORCE_INTENT_SELECTION, Integer.valueOf(sITreeDTO.enforceIntentSelection ? 1 : 0));
        contentValues.put("last_refreshed_at", Long.valueOf(sITreeDTO.lastRefreshedAt));
        contentValues.put(SmartIntentTreeTable.Columns.SI_TREE_PROMPT_TITLE, sITreeDTO.promptTitle);
        contentValues.put(SmartIntentTreeTable.Columns.SI_TREE_TEXT_INPUT_HINT, sITreeDTO.textInputHint);
        contentValues.put(SmartIntentTreeTable.Columns.SI_TREE_SEARCH_TITLE, sITreeDTO.searchTitle);
        contentValues.put(SmartIntentTreeTable.Columns.SI_TREE_EMPTY_SEARCH_TITLE, sITreeDTO.emptySearchTitle);
        contentValues.put(SmartIntentTreeTable.Columns.SI_TREE_EMPTY_SEARCH_DESCRIPTION, sITreeDTO.emptySearchDescription);
        contentValues.put(SmartIntentTreeTable.Columns.SI_TREE_TOKEN_DELIMITER, HSJSONUtils.listToJsonArray(sITreeDTO.tokenDelimiter).toString());
        return contentValues;
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x0084 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.util.List<java.lang.Long> insertSmartIntents(long r7, java.util.List<com.helpshift.conversation.smartintent.dto.SmartIntentDTO> r9) throws java.lang.Throwable {
        /*
            r6 = this;
            java.lang.String r0 = "Error in ending the insert txn in smart intents table: "
            java.lang.String r1 = "Helpshift_SiDB"
            java.util.ArrayList r2 = new java.util.ArrayList
            r2.<init>()
            java.util.ArrayList r3 = new java.util.ArrayList
            r3.<init>()
            java.util.Iterator r9 = r9.iterator()
        L12:
            boolean r4 = r9.hasNext()
            if (r4 == 0) goto L26
            java.lang.Object r4 = r9.next()
            com.helpshift.conversation.smartintent.dto.SmartIntentDTO r4 = (com.helpshift.conversation.smartintent.dto.SmartIntentDTO) r4
            android.content.ContentValues r4 = r6.smartIntentToContentValues(r4, r7)
            r3.add(r4)
            goto L12
        L26:
            r7 = 0
            com.helpshift.db.smartintents.SmartIntentsDBHelper r8 = r6.siDbHelper     // Catch: java.lang.Throwable -> L5f java.lang.Exception -> L64
            android.database.sqlite.SQLiteDatabase r8 = r8.getWritableDatabase()     // Catch: java.lang.Throwable -> L5f java.lang.Exception -> L64
            r8.beginTransaction()     // Catch: java.lang.Exception -> L5d java.lang.Throwable -> L81
            java.util.Iterator r9 = r3.iterator()     // Catch: java.lang.Exception -> L5d java.lang.Throwable -> L81
        L34:
            boolean r3 = r9.hasNext()     // Catch: java.lang.Exception -> L5d java.lang.Throwable -> L81
            if (r3 == 0) goto L4e
            java.lang.Object r3 = r9.next()     // Catch: java.lang.Exception -> L5d java.lang.Throwable -> L81
            android.content.ContentValues r3 = (android.content.ContentValues) r3     // Catch: java.lang.Exception -> L5d java.lang.Throwable -> L81
            java.lang.String r4 = "si_intents_table"
            long r3 = r8.insert(r4, r7, r3)     // Catch: java.lang.Exception -> L5d java.lang.Throwable -> L81
            java.lang.Long r3 = java.lang.Long.valueOf(r3)     // Catch: java.lang.Exception -> L5d java.lang.Throwable -> L81
            r2.add(r3)     // Catch: java.lang.Exception -> L5d java.lang.Throwable -> L81
            goto L34
        L4e:
            r8.setTransactionSuccessful()     // Catch: java.lang.Exception -> L5d java.lang.Throwable -> L81
            if (r8 == 0) goto L80
            boolean r7 = r8.inTransaction()     // Catch: java.lang.Exception -> L7c
            if (r7 == 0) goto L80
            r8.endTransaction()     // Catch: java.lang.Exception -> L7c
            goto L80
        L5d:
            r7 = move-exception
            goto L68
        L5f:
            r8 = move-exception
            r5 = r8
            r8 = r7
            r7 = r5
            goto L82
        L64:
            r8 = move-exception
            r5 = r8
            r8 = r7
            r7 = r5
        L68:
            r2.clear()     // Catch: java.lang.Throwable -> L81
            java.lang.String r9 = "Error in inserting in smart intents table: "
            com.helpshift.util.HSLogger.e(r1, r9, r7)     // Catch: java.lang.Throwable -> L81
            if (r8 == 0) goto L80
            boolean r7 = r8.inTransaction()     // Catch: java.lang.Exception -> L7c
            if (r7 == 0) goto L80
            r8.endTransaction()     // Catch: java.lang.Exception -> L7c
            goto L80
        L7c:
            r7 = move-exception
            com.helpshift.util.HSLogger.e(r1, r0, r7)
        L80:
            return r2
        L81:
            r7 = move-exception
        L82:
            if (r8 == 0) goto L92
            boolean r9 = r8.inTransaction()     // Catch: java.lang.Exception -> L8e
            if (r9 == 0) goto L92
            r8.endTransaction()     // Catch: java.lang.Exception -> L8e
            goto L92
        L8e:
            r8 = move-exception
            com.helpshift.util.HSLogger.e(r1, r0, r8)
        L92:
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.db.conversation.smartintent.SmartIntentDB.insertSmartIntents(long, java.util.List):java.util.List");
    }

    private List<SmartIntentDTO> getIntentsFlatList(List<SmartIntentDTO> list) {
        ArrayList arrayList = new ArrayList();
        LinkedList linkedList = new LinkedList(list);
        if (ListUtils.isEmpty(list)) {
            return arrayList;
        }
        while (!linkedList.isEmpty()) {
            SmartIntentDTO smartIntentDTO = (SmartIntentDTO) linkedList.poll();
            arrayList.add(smartIntentDTO);
            if (ListUtils.isNotEmpty(smartIntentDTO.children)) {
                linkedList.addAll(smartIntentDTO.children);
                smartIntentDTO.children.clear();
            }
        }
        return arrayList;
    }

    private ContentValues smartIntentToContentValues(SmartIntentDTO smartIntentDTO, long j) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("tree_local_id", Long.valueOf(j));
        contentValues.put("label", smartIntentDTO.label);
        contentValues.put("server_id", smartIntentDTO.serverId);
        contentValues.put(SmartIntentsTable.Columns.SI_INTENT_PARENT_SERVER_ID, smartIntentDTO.parentServerId);
        return contentValues;
    }

    public synchronized boolean insertModel(long j, SISearchModelDTO sISearchModelDTO) {
        long jInsert = insert(smartIntentModelToContentValues(j, sISearchModelDTO), SmartIntentModelsTable.TABLE_NAME);
        if (jInsert == -1) {
            return false;
        }
        if (!ListUtils.isEmpty(insertWordProbabilities(jInsert, sISearchModelDTO.wordToLeafIntentProbabilitiesMapping))) {
            return true;
        }
        deleteModelAndWordProbabilities(jInsert);
        return false;
    }

    private ContentValues smartIntentModelToContentValues(long j, SISearchModelDTO sISearchModelDTO) {
        String string = HSJSONUtils.listToJsonArray(sISearchModelDTO.leafIntentServerIds).toString();
        String string2 = HSJSONUtils.doubleListToJsonArray(sISearchModelDTO.leafIntentBaseProbabilities).toString();
        ContentValues contentValues = new ContentValues();
        contentValues.put("local_id", sISearchModelDTO.localId);
        contentValues.put("tree_local_id", Long.valueOf(j));
        contentValues.put("version", sISearchModelDTO.version);
        contentValues.put("last_refreshed_at", Long.valueOf(sISearchModelDTO.lastRefreshedAt));
        contentValues.put(SmartIntentModelsTable.Columns.CONFIDENCE_THRESHOLD, sISearchModelDTO.confidenceThreshold);
        contentValues.put(SmartIntentModelsTable.Columns.MAX_COMBINED_CONFIDENCE, sISearchModelDTO.maxCombinedConfidence);
        contentValues.put(SmartIntentModelsTable.Columns.LEAF_INTENT_SERVER_IDS, string);
        contentValues.put(SmartIntentModelsTable.Columns.LEAF_INTENT_BASE_PROBABILITIES, string2);
        return contentValues;
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x0094 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.util.List<java.lang.Long> insertWordProbabilities(long r8, java.util.Map<java.lang.String, java.util.List<java.lang.Double>> r10) throws java.lang.Throwable {
        /*
            r7 = this;
            java.lang.String r0 = "Error in ending the insert txn in word probabilities table: "
            java.lang.String r1 = "Helpshift_SiDB"
            java.util.ArrayList r2 = new java.util.ArrayList
            r2.<init>()
            java.util.ArrayList r3 = new java.util.ArrayList
            r3.<init>()
            java.util.Set r10 = r10.entrySet()
            java.util.Iterator r10 = r10.iterator()
        L16:
            boolean r4 = r10.hasNext()
            if (r4 == 0) goto L36
            java.lang.Object r4 = r10.next()
            java.util.Map$Entry r4 = (java.util.Map.Entry) r4
            java.lang.Object r5 = r4.getKey()
            java.lang.String r5 = (java.lang.String) r5
            java.lang.Object r4 = r4.getValue()
            java.util.List r4 = (java.util.List) r4
            android.content.ContentValues r4 = r7.wordProbabilitiesToContentValues(r8, r5, r4)
            r3.add(r4)
            goto L16
        L36:
            r8 = 0
            com.helpshift.db.smartintents.SmartIntentsDBHelper r9 = r7.siDbHelper     // Catch: java.lang.Throwable -> L6f java.lang.Exception -> L74
            android.database.sqlite.SQLiteDatabase r9 = r9.getWritableDatabase()     // Catch: java.lang.Throwable -> L6f java.lang.Exception -> L74
            r9.beginTransaction()     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L91
            java.util.Iterator r10 = r3.iterator()     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L91
        L44:
            boolean r3 = r10.hasNext()     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L91
            if (r3 == 0) goto L5e
            java.lang.Object r3 = r10.next()     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L91
            android.content.ContentValues r3 = (android.content.ContentValues) r3     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L91
            java.lang.String r4 = "si_word_probabilities_table"
            long r3 = r9.insert(r4, r8, r3)     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L91
            java.lang.Long r3 = java.lang.Long.valueOf(r3)     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L91
            r2.add(r3)     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L91
            goto L44
        L5e:
            r9.setTransactionSuccessful()     // Catch: java.lang.Exception -> L6d java.lang.Throwable -> L91
            if (r9 == 0) goto L90
            boolean r8 = r9.inTransaction()     // Catch: java.lang.Exception -> L8c
            if (r8 == 0) goto L90
            r9.endTransaction()     // Catch: java.lang.Exception -> L8c
            goto L90
        L6d:
            r8 = move-exception
            goto L78
        L6f:
            r9 = move-exception
            r6 = r9
            r9 = r8
            r8 = r6
            goto L92
        L74:
            r9 = move-exception
            r6 = r9
            r9 = r8
            r8 = r6
        L78:
            r2.clear()     // Catch: java.lang.Throwable -> L91
            java.lang.String r10 = "Error in inserting in word probabilities table: "
            com.helpshift.util.HSLogger.e(r1, r10, r8)     // Catch: java.lang.Throwable -> L91
            if (r9 == 0) goto L90
            boolean r8 = r9.inTransaction()     // Catch: java.lang.Exception -> L8c
            if (r8 == 0) goto L90
            r9.endTransaction()     // Catch: java.lang.Exception -> L8c
            goto L90
        L8c:
            r8 = move-exception
            com.helpshift.util.HSLogger.e(r1, r0, r8)
        L90:
            return r2
        L91:
            r8 = move-exception
        L92:
            if (r9 == 0) goto La2
            boolean r10 = r9.inTransaction()     // Catch: java.lang.Exception -> L9e
            if (r10 == 0) goto La2
            r9.endTransaction()     // Catch: java.lang.Exception -> L9e
            goto La2
        L9e:
            r9 = move-exception
            com.helpshift.util.HSLogger.e(r1, r0, r9)
        La2:
            throw r8
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.db.conversation.smartintent.SmartIntentDB.insertWordProbabilities(long, java.util.Map):java.util.List");
    }

    private ContentValues wordProbabilitiesToContentValues(long j, String str, List<Double> list) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(SmartIntentWordProbabilitiesTable.Columns.SI_WORD_PROBABILITIES_MODEL_LOCAL_ID, Long.valueOf(j));
        contentValues.put(SmartIntentWordProbabilitiesTable.Columns.SI_WORD_PROBABILITIES_WORD, str);
        contentValues.put(SmartIntentWordProbabilitiesTable.Columns.SI_WORD_PROBABILITIES_PROBABILITIES, HSJSONUtils.doubleListToJsonArray(list).toString());
        return contentValues;
    }

    private synchronized long insert(ContentValues contentValues, String str) {
        long jInsert;
        try {
            jInsert = this.siDbHelper.getWritableDatabase().insert(str, null, contentValues);
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in inserting in table: " + str, e);
            jInsert = -1;
        }
        return jInsert;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0046 A[Catch: all -> 0x005f, DONT_GENERATE, PHI: r9 r11
      0x0046: PHI (r9v1 boolean) = (r9v3 boolean), (r9v4 boolean) binds: [B:23:0x0054, B:16:0x0044] A[DONT_GENERATE, DONT_INLINE]
      0x0046: PHI (r11v7 android.database.Cursor) = (r11v8 android.database.Cursor), (r11v9 android.database.Cursor) binds: [B:23:0x0054, B:16:0x0044] A[DONT_GENERATE, DONT_INLINE], TRY_ENTER, TRY_LEAVE, TryCatch #3 {, blocks: (B:3:0x0001, B:17:0x0046, B:28:0x005b, B:29:0x005e, B:5:0x0012, B:7:0x0028, B:9:0x0038, B:22:0x004d), top: B:38:0x0001, inners: #2 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public synchronized boolean deleteTreeAndModel(com.helpshift.account.domainmodel.UserDM r11) {
        /*
            r10 = this;
            monitor-enter(r10)
            java.lang.String r3 = "user_local_id = ? "
            r8 = 1
            java.lang.String[] r4 = new java.lang.String[r8]     // Catch: java.lang.Throwable -> L5f
            java.lang.Long r11 = r11.getLocalId()     // Catch: java.lang.Throwable -> L5f
            java.lang.String r11 = java.lang.String.valueOf(r11)     // Catch: java.lang.Throwable -> L5f
            r9 = 0
            r4[r9] = r11     // Catch: java.lang.Throwable -> L5f
            r11 = 0
            com.helpshift.db.smartintents.SmartIntentsDBHelper r0 = r10.siDbHelper     // Catch: java.lang.Throwable -> L4a java.lang.Exception -> L4c
            android.database.sqlite.SQLiteDatabase r0 = r0.getReadableDatabase()     // Catch: java.lang.Throwable -> L4a java.lang.Exception -> L4c
            java.lang.String r1 = "si_tree_table"
            r2 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r11 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L4a java.lang.Exception -> L4c
            boolean r0 = r11.moveToFirst()     // Catch: java.lang.Throwable -> L4a java.lang.Exception -> L4c
            if (r0 == 0) goto L44
            java.lang.String r0 = "local_id"
            int r0 = r11.getColumnIndex(r0)     // Catch: java.lang.Throwable -> L4a java.lang.Exception -> L4c
            long r0 = r11.getLong(r0)     // Catch: java.lang.Throwable -> L4a java.lang.Exception -> L4c
            boolean r2 = r10.deleteTreeAndSmartIntents(r0)     // Catch: java.lang.Throwable -> L4a java.lang.Exception -> L4c
            if (r2 == 0) goto L42
            boolean r0 = r10.deleteModel(r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L4a
            if (r0 == 0) goto L42
            goto L43
        L3f:
            r0 = move-exception
            r9 = r2
            goto L4d
        L42:
            r8 = 0
        L43:
            r9 = r8
        L44:
            if (r11 == 0) goto L57
        L46:
            r11.close()     // Catch: java.lang.Throwable -> L5f
            goto L57
        L4a:
            r0 = move-exception
            goto L59
        L4c:
            r0 = move-exception
        L4d:
            java.lang.String r1 = "Helpshift_SiDB"
            java.lang.String r2 = "Error in deleting the tree and model"
            com.helpshift.util.HSLogger.e(r1, r2, r0)     // Catch: java.lang.Throwable -> L4a
            if (r11 == 0) goto L57
            goto L46
        L57:
            monitor-exit(r10)
            return r9
        L59:
            if (r11 == 0) goto L5e
            r11.close()     // Catch: java.lang.Throwable -> L5f
        L5e:
            throw r0     // Catch: java.lang.Throwable -> L5f
        L5f:
            r11 = move-exception
            monitor-exit(r10)
            throw r11
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.db.conversation.smartintent.SmartIntentDB.deleteTreeAndModel(com.helpshift.account.domainmodel.UserDM):boolean");
    }

    private synchronized boolean deleteTreeAndSmartIntents(long j) {
        boolean z;
        z = true;
        String[] strArr = {String.valueOf(j)};
        SQLiteDatabase writableDatabase = null;
        try {
            try {
                writableDatabase = this.siDbHelper.getWritableDatabase();
                writableDatabase.beginTransaction();
                writableDatabase.delete(SmartIntentsTable.TABLE_NAME, "tree_local_id = ? ", strArr);
                writableDatabase.delete(SmartIntentTreeTable.TABLE_NAME, "local_id = ?", strArr);
                writableDatabase.setTransactionSuccessful();
            } catch (Exception e) {
                HSLogger.e(TAG, "Error in delete smart intents table or tree table for selection :tree_local_id = ?   local_id = ?and selectionArgs" + Arrays.toString(strArr), e);
                if (writableDatabase != null) {
                    try {
                        if (writableDatabase.inTransaction()) {
                            writableDatabase.endTransaction();
                        }
                    } catch (Exception e2) {
                        HSLogger.e(TAG, "Exception in ending transaction : smartintents table or tree table with " + Arrays.toString(strArr), e2);
                    }
                }
                z = false;
            }
        } finally {
            if (writableDatabase != null) {
                try {
                    if (writableDatabase.inTransaction()) {
                        writableDatabase.endTransaction();
                    }
                } catch (Exception e3) {
                    HSLogger.e(TAG, "Exception in ending transaction : smartintents table or tree table with " + Arrays.toString(strArr), e3);
                }
            }
        }
        return z;
    }

    public synchronized boolean deleteModel(long j) {
        boolean zDeleteModelAndWordProbabilities;
        String[] strArr = {String.valueOf(j)};
        Cursor cursorQuery = null;
        try {
            try {
                cursorQuery = this.siDbHelper.getReadableDatabase().query(SmartIntentModelsTable.TABLE_NAME, null, "tree_local_id = ? ", strArr, null, null, null);
                zDeleteModelAndWordProbabilities = cursorQuery.moveToFirst() ? deleteModelAndWordProbabilities(cursorQuery.getLong(cursorQuery.getColumnIndex("local_id"))) : false;
            } catch (Exception e) {
                HSLogger.e(TAG, "Error in deleting the model table", e);
                if (cursorQuery != null) {
                }
            }
        } finally {
            if (cursorQuery != null) {
                cursorQuery.close();
            }
        }
        return zDeleteModelAndWordProbabilities;
    }

    private synchronized boolean deleteModelAndWordProbabilities(long j) {
        boolean z;
        z = true;
        String[] strArr = {String.valueOf(j)};
        SQLiteDatabase writableDatabase = null;
        try {
            try {
                writableDatabase = this.siDbHelper.getWritableDatabase();
                writableDatabase.beginTransaction();
                writableDatabase.delete(SmartIntentWordProbabilitiesTable.TABLE_NAME, "model_local_id = ?", strArr);
                writableDatabase.delete(SmartIntentModelsTable.TABLE_NAME, "local_id = ?", strArr);
                writableDatabase.setTransactionSuccessful();
            } catch (Exception e) {
                HSLogger.e(TAG, "Error in delete word probabilities table or models table for selection :model_local_id = ?  local_id = ?and selectionArgs" + Arrays.toString(strArr), e);
                if (writableDatabase != null) {
                    try {
                        if (writableDatabase.inTransaction()) {
                            writableDatabase.endTransaction();
                        }
                    } catch (Exception e2) {
                        HSLogger.e(TAG, "Exception in ending transaction : word probabilites table or models table with " + Arrays.toString(strArr), e2);
                    }
                }
                z = false;
            }
        } finally {
            if (writableDatabase != null) {
                try {
                    if (writableDatabase.inTransaction()) {
                        writableDatabase.endTransaction();
                    }
                } catch (Exception e3) {
                    HSLogger.e(TAG, "Exception in ending transaction : word probabilites table or models table with " + Arrays.toString(strArr), e3);
                }
            }
        }
        return z;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0056  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.helpshift.conversation.smartintent.dto.SITreeDTO getSmartIntentTree(long r10) throws java.lang.Throwable {
        /*
            r9 = this;
            java.lang.String r3 = "user_local_id = ? "
            r0 = 1
            java.lang.String[] r4 = new java.lang.String[r0]
            java.lang.String r10 = java.lang.String.valueOf(r10)
            r11 = 0
            r4[r11] = r10
            r10 = 0
            com.helpshift.db.smartintents.SmartIntentsDBHelper r11 = r9.siDbHelper     // Catch: java.lang.Throwable -> L41 java.lang.Exception -> L46
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch: java.lang.Throwable -> L41 java.lang.Exception -> L46
            java.lang.String r1 = "si_tree_table"
            r2 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r11 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L41 java.lang.Exception -> L46
            boolean r0 = r11.moveToFirst()     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L53
            if (r0 == 0) goto L39
            java.lang.String r0 = "local_id"
            int r0 = r11.getColumnIndex(r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L53
            long r0 = r11.getLong(r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L53
            java.util.List r0 = r9.getSmartIntents(r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L53
            java.util.List r0 = r9.buildIntentTree(r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L53
            com.helpshift.conversation.smartintent.dto.SITreeDTO r10 = r9.cursorToSmartIntentTree(r11, r0)     // Catch: java.lang.Exception -> L3f java.lang.Throwable -> L53
        L39:
            if (r11 == 0) goto L52
        L3b:
            r11.close()
            goto L52
        L3f:
            r0 = move-exception
            goto L48
        L41:
            r11 = move-exception
            r8 = r11
            r11 = r10
            r10 = r8
            goto L54
        L46:
            r0 = move-exception
            r11 = r10
        L48:
            java.lang.String r1 = "Helpshift_SiDB"
            java.lang.String r2 = "Error in reading smart intent tree"
            com.helpshift.util.HSLogger.e(r1, r2, r0)     // Catch: java.lang.Throwable -> L53
            if (r11 == 0) goto L52
            goto L3b
        L52:
            return r10
        L53:
            r10 = move-exception
        L54:
            if (r11 == 0) goto L59
            r11.close()
        L59:
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.db.conversation.smartintent.SmartIntentDB.getSmartIntentTree(long):com.helpshift.conversation.smartintent.dto.SITreeDTO");
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0044 A[PHI: r10
      0x0044: PHI (r10v4 android.database.Cursor) = (r10v3 android.database.Cursor), (r10v5 android.database.Cursor) binds: [B:13:0x0042, B:7:0x0035] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.util.List<com.helpshift.conversation.smartintent.dto.SmartIntentDTO> getSmartIntents(long r9) {
        /*
            r8 = this;
            java.lang.String r3 = "tree_local_id = ? "
            r0 = 1
            java.lang.String[] r4 = new java.lang.String[r0]
            java.lang.String r9 = java.lang.String.valueOf(r9)
            r10 = 0
            r4[r10] = r9
            java.util.ArrayList r9 = new java.util.ArrayList
            r9.<init>()
            r10 = 0
            com.helpshift.db.smartintents.SmartIntentsDBHelper r0 = r8.siDbHelper     // Catch: java.lang.Throwable -> L38 java.lang.Exception -> L3a
            android.database.sqlite.SQLiteDatabase r0 = r0.getReadableDatabase()     // Catch: java.lang.Throwable -> L38 java.lang.Exception -> L3a
            java.lang.String r1 = "si_intents_table"
            r2 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r10 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L38 java.lang.Exception -> L3a
            boolean r0 = r10.moveToFirst()     // Catch: java.lang.Throwable -> L38 java.lang.Exception -> L3a
            if (r0 == 0) goto L35
        L28:
            com.helpshift.conversation.smartintent.dto.SmartIntentDTO r0 = r8.cursorToSmartIntent(r10)     // Catch: java.lang.Throwable -> L38 java.lang.Exception -> L3a
            r9.add(r0)     // Catch: java.lang.Throwable -> L38 java.lang.Exception -> L3a
            boolean r0 = r10.moveToNext()     // Catch: java.lang.Throwable -> L38 java.lang.Exception -> L3a
            if (r0 != 0) goto L28
        L35:
            if (r10 == 0) goto L47
            goto L44
        L38:
            r9 = move-exception
            goto L48
        L3a:
            r0 = move-exception
            java.lang.String r1 = "Helpshift_SiDB"
            java.lang.String r2 = "Error in reading smart intents from db"
            com.helpshift.util.HSLogger.e(r1, r2, r0)     // Catch: java.lang.Throwable -> L38
            if (r10 == 0) goto L47
        L44:
            r10.close()
        L47:
            return r9
        L48:
            if (r10 == 0) goto L4d
            r10.close()
        L4d:
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.db.conversation.smartintent.SmartIntentDB.getSmartIntents(long):java.util.List");
    }

    private SmartIntentDTO cursorToSmartIntent(Cursor cursor) {
        long j = cursor.getLong(cursor.getColumnIndex("local_id"));
        SmartIntentDTO smartIntentDTO = new SmartIntentDTO(cursor.getString(cursor.getColumnIndex("label")), cursor.getString(cursor.getColumnIndex("server_id")), cursor.getString(cursor.getColumnIndex(SmartIntentsTable.Columns.SI_INTENT_PARENT_SERVER_ID)), null);
        smartIntentDTO.localId = Long.valueOf(j);
        return smartIntentDTO;
    }

    private List<SmartIntentDTO> buildIntentTree(List<SmartIntentDTO> list) {
        List<SmartIntentDTO> listFilterRootIntents = filterRootIntents(list);
        Map<String, List<SmartIntentDTO>> mapBuildIntentIdToChildIntentMap = buildIntentIdToChildIntentMap(list);
        LinkedList linkedList = new LinkedList();
        for (SmartIntentDTO smartIntentDTO : listFilterRootIntents) {
            List<SmartIntentDTO> list2 = mapBuildIntentIdToChildIntentMap.get(smartIntentDTO.serverId);
            if (ListUtils.isNotEmpty(list2)) {
                smartIntentDTO.children = list2;
                linkedList.addAll(list2);
            }
        }
        while (!linkedList.isEmpty()) {
            SmartIntentDTO smartIntentDTO2 = (SmartIntentDTO) linkedList.poll();
            List<SmartIntentDTO> list3 = mapBuildIntentIdToChildIntentMap.get(smartIntentDTO2.serverId);
            if (ListUtils.isNotEmpty(list3)) {
                smartIntentDTO2.children = list3;
                linkedList.addAll(list3);
            }
        }
        return listFilterRootIntents;
    }

    private List<SmartIntentDTO> filterRootIntents(List<SmartIntentDTO> list) {
        ArrayList arrayList = new ArrayList();
        for (SmartIntentDTO smartIntentDTO : list) {
            if (StringUtils.isEmpty(smartIntentDTO.parentServerId)) {
                arrayList.add(smartIntentDTO);
            }
        }
        return arrayList;
    }

    private Map<String, List<SmartIntentDTO>> buildIntentIdToChildIntentMap(List<SmartIntentDTO> list) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (SmartIntentDTO smartIntentDTO : list) {
            if (!StringUtils.isEmpty(smartIntentDTO.parentServerId)) {
                List linkedList = (List) linkedHashMap.get(smartIntentDTO.parentServerId);
                if (ListUtils.isEmpty(linkedList)) {
                    linkedList = new LinkedList();
                }
                linkedList.add(smartIntentDTO);
                linkedHashMap.put(smartIntentDTO.parentServerId, linkedList);
            }
        }
        return linkedHashMap;
    }

    private SITreeDTO cursorToSmartIntentTree(Cursor cursor, List<SmartIntentDTO> list) {
        long j = cursor.getLong(cursor.getColumnIndex("local_id"));
        String string = cursor.getString(cursor.getColumnIndex("server_id"));
        boolean booleanColumnSafe = DatabaseUtils.parseBooleanColumnSafe(cursor, SmartIntentTreeTable.Columns.SI_TREE_ENFORCE_INTENT_SELECTION, false);
        long j2 = cursor.getLong(cursor.getColumnIndex("last_refreshed_at"));
        SITreeDTO sITreeDTO = new SITreeDTO(string, cursor.getInt(cursor.getColumnIndex(SmartIntentTreeTable.Columns.TREE_VERSION)), cursor.getString(cursor.getColumnIndex(SmartIntentTreeTable.Columns.SI_TREE_PROMPT_TITLE)), cursor.getString(cursor.getColumnIndex(SmartIntentTreeTable.Columns.SI_TREE_TEXT_INPUT_HINT)), cursor.getString(cursor.getColumnIndex(SmartIntentTreeTable.Columns.SI_TREE_SEARCH_TITLE)), cursor.getString(cursor.getColumnIndex(SmartIntentTreeTable.Columns.SI_TREE_EMPTY_SEARCH_TITLE)), cursor.getString(cursor.getColumnIndex(SmartIntentTreeTable.Columns.SI_TREE_EMPTY_SEARCH_DESCRIPTION)), booleanColumnSafe, HSJSONUtils.jsonArrayToStringArrayList(cursor.getString(cursor.getColumnIndex(SmartIntentTreeTable.Columns.SI_TREE_TOKEN_DELIMITER))), list);
        sITreeDTO.lastRefreshedAt = j2;
        sITreeDTO.localId = Long.valueOf(j);
        return sITreeDTO;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0044  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.helpshift.conversation.smartintent.dto.SISearchModelDTO getModelWithoutWordProbabilities(long r10) throws java.lang.Throwable {
        /*
            r9 = this;
            java.lang.String r3 = "tree_local_id = ? "
            r0 = 1
            java.lang.String[] r4 = new java.lang.String[r0]
            java.lang.String r10 = java.lang.String.valueOf(r10)
            r11 = 0
            r4[r11] = r10
            r10 = 0
            com.helpshift.db.smartintents.SmartIntentsDBHelper r11 = r9.siDbHelper     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L34
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L34
            java.lang.String r1 = "si_models_table"
            r2 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r11 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L2f java.lang.Exception -> L34
            boolean r0 = r11.moveToFirst()     // Catch: java.lang.Exception -> L2d java.lang.Throwable -> L41
            if (r0 == 0) goto L27
            com.helpshift.conversation.smartintent.dto.SISearchModelDTO r10 = r9.cursorToModelWithoutWordProbabilities(r11)     // Catch: java.lang.Exception -> L2d java.lang.Throwable -> L41
        L27:
            if (r11 == 0) goto L40
        L29:
            r11.close()
            goto L40
        L2d:
            r0 = move-exception
            goto L36
        L2f:
            r11 = move-exception
            r8 = r11
            r11 = r10
            r10 = r8
            goto L42
        L34:
            r0 = move-exception
            r11 = r10
        L36:
            java.lang.String r1 = "Helpshift_SiDB"
            java.lang.String r2 = "Error in reading the search model "
            com.helpshift.util.HSLogger.e(r1, r2, r0)     // Catch: java.lang.Throwable -> L41
            if (r11 == 0) goto L40
            goto L29
        L40:
            return r10
        L41:
            r10 = move-exception
        L42:
            if (r11 == 0) goto L47
            r11.close()
        L47:
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.db.conversation.smartintent.SmartIntentDB.getModelWithoutWordProbabilities(long):com.helpshift.conversation.smartintent.dto.SISearchModelDTO");
    }

    private SISearchModelDTO cursorToModelWithoutWordProbabilities(Cursor cursor) {
        long j = cursor.getLong(cursor.getColumnIndex("local_id"));
        int i = cursor.getInt(cursor.getColumnIndex("version"));
        double d = cursor.getDouble(cursor.getColumnIndex(SmartIntentModelsTable.Columns.CONFIDENCE_THRESHOLD));
        double d2 = cursor.getDouble(cursor.getColumnIndex(SmartIntentModelsTable.Columns.MAX_COMBINED_CONFIDENCE));
        long j2 = cursor.getLong(cursor.getColumnIndex("last_refreshed_at"));
        SISearchModelDTO sISearchModelDTO = new SISearchModelDTO(Integer.valueOf(i), Double.valueOf(d), Double.valueOf(d2), HSJSONUtils.jsonArrayToStringArrayList(cursor.getString(cursor.getColumnIndex(SmartIntentModelsTable.Columns.LEAF_INTENT_SERVER_IDS))), HSJSONUtils.jsonToDoubleArrayList(cursor.getString(cursor.getColumnIndex(SmartIntentModelsTable.Columns.LEAF_INTENT_BASE_PROBABILITIES))), null);
        sISearchModelDTO.localId = Long.valueOf(j);
        sISearchModelDTO.lastRefreshedAt = j2;
        return sISearchModelDTO;
    }

    public synchronized boolean updateModelRefreshedAt(long j, long j2) {
        boolean z;
        ContentValues contentValues = new ContentValues();
        contentValues.put("last_refreshed_at", Long.valueOf(j2));
        z = true;
        try {
            this.siDbHelper.getWritableDatabase().update(SmartIntentModelsTable.TABLE_NAME, contentValues, "tree_local_id = ? ", new String[]{String.valueOf(j)});
        } catch (Exception e) {
            HSLogger.e(TAG, "Error in updating model refreshedAt", e);
            z = false;
        }
        return z;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:21:0x004b  */
    /* JADX WARN: Type inference failed for: r11v1 */
    /* JADX WARN: Type inference failed for: r11v3 */
    /* JADX WARN: Type inference failed for: r11v5, types: [android.database.Cursor] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<java.lang.Double> getWordToIntentProbabilities(long r10, java.lang.String r12) throws java.lang.Throwable {
        /*
            r9 = this;
            java.lang.String r3 = "model_local_id = ? AND word = ?"
            r0 = 2
            java.lang.String[] r4 = new java.lang.String[r0]
            java.lang.String r10 = java.lang.String.valueOf(r10)
            r11 = 0
            r4[r11] = r10
            java.lang.String r10 = java.lang.String.valueOf(r12)
            r11 = 1
            r4[r11] = r10
            r10 = 0
            com.helpshift.db.smartintents.SmartIntentsDBHelper r11 = r9.siDbHelper     // Catch: java.lang.Throwable -> L36 java.lang.Exception -> L3b
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch: java.lang.Throwable -> L36 java.lang.Exception -> L3b
            java.lang.String r1 = "si_word_probabilities_table"
            r2 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r11 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch: java.lang.Throwable -> L36 java.lang.Exception -> L3b
            boolean r12 = r11.moveToFirst()     // Catch: java.lang.Exception -> L34 java.lang.Throwable -> L48
            if (r12 == 0) goto L2e
            java.util.List r10 = r9.cursorToWordProbabilities(r11)     // Catch: java.lang.Exception -> L34 java.lang.Throwable -> L48
        L2e:
            if (r11 == 0) goto L47
        L30:
            r11.close()
            goto L47
        L34:
            r12 = move-exception
            goto L3d
        L36:
            r11 = move-exception
            r8 = r11
            r11 = r10
            r10 = r8
            goto L49
        L3b:
            r12 = move-exception
            r11 = r10
        L3d:
            java.lang.String r0 = "Helpshift_SiDB"
            java.lang.String r1 = "Error in getting word probabilities "
            com.helpshift.util.HSLogger.e(r0, r1, r12)     // Catch: java.lang.Throwable -> L48
            if (r11 == 0) goto L47
            goto L30
        L47:
            return r10
        L48:
            r10 = move-exception
        L49:
            if (r11 == 0) goto L4e
            r11.close()
        L4e:
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.db.conversation.smartintent.SmartIntentDB.getWordToIntentProbabilities(long, java.lang.String):java.util.List");
    }

    private List<Double> cursorToWordProbabilities(Cursor cursor) {
        return HSJSONUtils.jsonToDoubleArrayList(cursor.getString(cursor.getColumnIndex(SmartIntentWordProbabilitiesTable.Columns.SI_WORD_PROBABILITIES_PROBABILITIES)));
    }
}
