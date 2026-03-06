package com.microsoft.appcenter.persistence;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteQueryBuilder;
import com.ironsource.sdk.precache.DownloadManager;
import com.microsoft.appcenter.Constants;
import com.microsoft.appcenter.Flags;
import com.microsoft.appcenter.ingestion.models.Log;
import com.microsoft.appcenter.ingestion.models.one.CommonSchemaLog;
import com.microsoft.appcenter.ingestion.models.one.PartAUtils;
import com.microsoft.appcenter.persistence.Persistence;
import com.microsoft.appcenter.utils.AppCenterLog;
import com.microsoft.appcenter.utils.crypto.CryptoUtils;
import com.microsoft.appcenter.utils.storage.DatabaseManager;
import com.microsoft.appcenter.utils.storage.FileManager;
import com.microsoft.appcenter.utils.storage.SQLiteUtils;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import org.json.JSONException;

/* JADX INFO: loaded from: classes2.dex */
public class DatabasePersistence extends Persistence {
    private static final String COLUMN_DATA_TYPE = "type";
    static final String COLUMN_GROUP = "persistence_group";
    static final String COLUMN_LOG = "log";
    static final String COLUMN_PRIORITY = "priority";
    static final String COLUMN_TARGET_KEY = "target_key";
    static final String COLUMN_TARGET_TOKEN = "target_token";
    static final String CREATE_LOGS_SQL = "CREATE TABLE IF NOT EXISTS `logs`(`oid` INTEGER PRIMARY KEY AUTOINCREMENT,`target_token` TEXT,`type` TEXT,`priority` INTEGER,`log` TEXT,`persistence_group` TEXT,`target_key` TEXT);";
    private static final String CREATE_PRIORITY_INDEX_LOGS = "CREATE INDEX `ix_logs_priority` ON logs (`priority`)";
    static final String DATABASE = "com.microsoft.appcenter.persistence";
    private static final String DROP_LOGS_SQL = "DROP TABLE `logs`";
    private static final String GET_SORT_ORDER = "priority DESC, oid";
    private static final String PAYLOAD_FILE_EXTENSION = ".json";
    private static final String PAYLOAD_LARGE_DIRECTORY = "/appcenter/database_large_payloads";
    private static final int PAYLOAD_MAX_SIZE = 1992294;
    static final ContentValues SCHEMA = getContentValues("", "", "", "", "", 0);
    static final String TABLE = "logs";
    private static final int VERSION = 6;
    static final int VERSION_TIMESTAMP_COLUMN = 5;
    private final Context mContext;
    final DatabaseManager mDatabaseManager;
    private final File mLargePayloadDirectory;
    final Set<Long> mPendingDbIdentifiers;
    final Map<String, List<Long>> mPendingDbIdentifiersGroups;

    public DatabasePersistence(Context context) {
        this(context, 6, SCHEMA);
    }

    DatabasePersistence(Context context, int version, final ContentValues schema) {
        this.mContext = context;
        this.mPendingDbIdentifiersGroups = new HashMap();
        this.mPendingDbIdentifiers = new HashSet();
        this.mDatabaseManager = new DatabaseManager(context, DATABASE, TABLE, version, schema, CREATE_LOGS_SQL, new DatabaseManager.Listener() { // from class: com.microsoft.appcenter.persistence.DatabasePersistence.1
            @Override // com.microsoft.appcenter.utils.storage.DatabaseManager.Listener
            public void onCreate(SQLiteDatabase db) {
                db.execSQL(DatabasePersistence.CREATE_PRIORITY_INDEX_LOGS);
            }

            @Override // com.microsoft.appcenter.utils.storage.DatabaseManager.Listener
            public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
                db.execSQL(DatabasePersistence.DROP_LOGS_SQL);
                db.execSQL(DatabasePersistence.CREATE_LOGS_SQL);
                db.execSQL(DatabasePersistence.CREATE_PRIORITY_INDEX_LOGS);
            }
        });
        File file = new File(Constants.FILES_PATH + PAYLOAD_LARGE_DIRECTORY);
        this.mLargePayloadDirectory = file;
        file.mkdirs();
    }

    private static ContentValues getContentValues(String group, String logJ, String targetToken, String type, String targetKey, int priority) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(COLUMN_GROUP, group);
        contentValues.put(COLUMN_LOG, logJ);
        contentValues.put(COLUMN_TARGET_TOKEN, targetToken);
        contentValues.put("type", type);
        contentValues.put(COLUMN_TARGET_KEY, targetKey);
        contentValues.put(COLUMN_PRIORITY, Integer.valueOf(priority));
        return contentValues;
    }

    @Override // com.microsoft.appcenter.persistence.Persistence
    public boolean setMaxStorageSize(long maxStorageSizeInBytes) {
        return this.mDatabaseManager.setMaxSize(maxStorageSizeInBytes);
    }

    @Override // com.microsoft.appcenter.persistence.Persistence
    public long putLog(Log log, String group, int flags) throws Persistence.PersistenceException {
        String strEncrypt;
        String targetKey;
        try {
            try {
                AppCenterLog.debug("AppCenter", "Storing a log to the Persistence database for log type " + log.getType() + " with flags=" + flags);
                String strSerializeLog = getLogSerializer().serializeLog(log);
                int length = strSerializeLog.getBytes(DownloadManager.UTF8_CHARSET).length;
                boolean z = length >= PAYLOAD_MAX_SIZE;
                if (!(log instanceof CommonSchemaLog)) {
                    strEncrypt = null;
                    targetKey = null;
                } else {
                    if (z) {
                        throw new Persistence.PersistenceException("Log is larger than 1992294 bytes, cannot send to OneCollector.");
                    }
                    String next = log.getTransmissionTargetTokens().iterator().next();
                    targetKey = PartAUtils.getTargetKey(next);
                    strEncrypt = CryptoUtils.getInstance(this.mContext).encrypt(next);
                }
                long maxSize = this.mDatabaseManager.getMaxSize();
                if (maxSize == -1) {
                    throw new Persistence.PersistenceException("Failed to store a log to the Persistence database.");
                }
                if (!z && maxSize <= length) {
                    throw new Persistence.PersistenceException("Log is too large (" + length + " bytes) to store in database. Current maximum database size is " + maxSize + " bytes.");
                }
                long jPut = this.mDatabaseManager.put(getContentValues(group, z ? null : strSerializeLog, strEncrypt, log.getType(), targetKey, Flags.getPersistenceFlag(flags, false)), COLUMN_PRIORITY);
                if (jPut == -1) {
                    throw new Persistence.PersistenceException("Failed to store a log to the Persistence database for log type " + log.getType() + ".");
                }
                AppCenterLog.debug("AppCenter", "Stored a log to the Persistence database for log type " + log.getType() + " with databaseId=" + jPut);
                if (z) {
                    AppCenterLog.debug("AppCenter", "Payload is larger than what SQLite supports, storing payload in a separate file.");
                    File largePayloadGroupDirectory = getLargePayloadGroupDirectory(group);
                    largePayloadGroupDirectory.mkdir();
                    File largePayloadFile = getLargePayloadFile(largePayloadGroupDirectory, jPut);
                    try {
                        FileManager.write(largePayloadFile, strSerializeLog);
                        AppCenterLog.debug("AppCenter", "Payload written to " + largePayloadFile);
                    } catch (IOException e) {
                        this.mDatabaseManager.delete(jPut);
                        throw e;
                    }
                }
                return jPut;
            } catch (JSONException e2) {
                throw new Persistence.PersistenceException("Cannot convert to JSON string.", e2);
            }
        } catch (IOException e3) {
            throw new Persistence.PersistenceException("Cannot save large payload in a file.", e3);
        }
    }

    File getLargePayloadGroupDirectory(String group) {
        return new File(this.mLargePayloadDirectory, group);
    }

    File getLargePayloadFile(File directory, long databaseId) {
        return new File(directory, databaseId + ".json");
    }

    private void deleteLog(File groupLargePayloadDirectory, long id) {
        getLargePayloadFile(groupLargePayloadDirectory, id).delete();
        this.mDatabaseManager.delete(id);
    }

    @Override // com.microsoft.appcenter.persistence.Persistence
    public void deleteLogs(String group, String id) {
        AppCenterLog.debug("AppCenter", "Deleting logs from the Persistence database for " + group + " with " + id);
        AppCenterLog.debug("AppCenter", "The IDs for deleting log(s) is/are:");
        List<Long> listRemove = this.mPendingDbIdentifiersGroups.remove(group + id);
        File largePayloadGroupDirectory = getLargePayloadGroupDirectory(group);
        if (listRemove != null) {
            for (Long l : listRemove) {
                AppCenterLog.debug("AppCenter", "\t" + l);
                deleteLog(largePayloadGroupDirectory, l.longValue());
                this.mPendingDbIdentifiers.remove(l);
            }
        }
    }

    @Override // com.microsoft.appcenter.persistence.Persistence
    public void deleteLogs(String group) {
        AppCenterLog.debug("AppCenter", "Deleting all logs from the Persistence database for " + group);
        File largePayloadGroupDirectory = getLargePayloadGroupDirectory(group);
        File[] fileArrListFiles = largePayloadGroupDirectory.listFiles();
        if (fileArrListFiles != null) {
            for (File file : fileArrListFiles) {
                file.delete();
            }
        }
        largePayloadGroupDirectory.delete();
        AppCenterLog.debug("AppCenter", "Deleted " + this.mDatabaseManager.delete(COLUMN_GROUP, group) + " logs.");
        Iterator<String> it = this.mPendingDbIdentifiersGroups.keySet().iterator();
        while (it.hasNext()) {
            if (it.next().startsWith(group)) {
                it.remove();
            }
        }
    }

    @Override // com.microsoft.appcenter.persistence.Persistence
    public int countLogs(String group) {
        SQLiteQueryBuilder sQLiteQueryBuilderNewSQLiteQueryBuilder = SQLiteUtils.newSQLiteQueryBuilder();
        sQLiteQueryBuilderNewSQLiteQueryBuilder.appendWhere("persistence_group = ?");
        int i = 0;
        try {
            Cursor cursor = this.mDatabaseManager.getCursor(sQLiteQueryBuilderNewSQLiteQueryBuilder, new String[]{"COUNT(*)"}, new String[]{group}, null);
            try {
                cursor.moveToNext();
                i = cursor.getInt(0);
                cursor.close();
            } catch (Throwable th) {
                cursor.close();
                throw th;
            }
        } catch (RuntimeException e) {
            AppCenterLog.error("AppCenter", "Failed to get logs count: ", e);
        }
        return i;
    }

    @Override // com.microsoft.appcenter.persistence.Persistence
    public String getLogs(String group, Collection<String> pausedTargetKeys, int limit, List<Log> outLogs) {
        Cursor cursor;
        AppCenterLog.debug("AppCenter", "Trying to get " + limit + " logs from the Persistence database for " + group);
        SQLiteQueryBuilder sQLiteQueryBuilderNewSQLiteQueryBuilder = SQLiteUtils.newSQLiteQueryBuilder();
        sQLiteQueryBuilderNewSQLiteQueryBuilder.appendWhere("persistence_group = ?");
        ArrayList arrayList = new ArrayList();
        arrayList.add(group);
        if (!pausedTargetKeys.isEmpty()) {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < pausedTargetKeys.size(); i++) {
                sb.append("?,");
            }
            sb.deleteCharAt(sb.length() - 1);
            sQLiteQueryBuilderNewSQLiteQueryBuilder.appendWhere(" AND ");
            sQLiteQueryBuilderNewSQLiteQueryBuilder.appendWhere("target_key NOT IN (" + sb.toString() + ")");
            arrayList.addAll(pausedTargetKeys);
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        ArrayList arrayList2 = new ArrayList();
        File largePayloadGroupDirectory = getLargePayloadGroupDirectory(group);
        String[] strArr = (String[]) arrayList.toArray(new String[0]);
        try {
            cursor = this.mDatabaseManager.getCursor(sQLiteQueryBuilderNewSQLiteQueryBuilder, null, strArr, GET_SORT_ORDER);
        } catch (RuntimeException e) {
            AppCenterLog.error("AppCenter", "Failed to get logs: ", e);
            cursor = null;
        }
        int i2 = 0;
        while (cursor != null) {
            ContentValues contentValuesNextValues = this.mDatabaseManager.nextValues(cursor);
            if (contentValuesNextValues == null || i2 >= limit) {
                break;
            }
            Long asLong = contentValuesNextValues.getAsLong(DatabaseManager.PRIMARY_KEY);
            if (asLong == null) {
                AppCenterLog.error("AppCenter", "Empty database record, probably content was larger than 2MB, need to delete as it's now corrupted.");
                Iterator<Long> it = getLogsIds(sQLiteQueryBuilderNewSQLiteQueryBuilder, strArr).iterator();
                while (true) {
                    if (it.hasNext()) {
                        Long next = it.next();
                        if (!this.mPendingDbIdentifiers.contains(next) && !linkedHashMap.containsKey(next)) {
                            deleteLog(largePayloadGroupDirectory, next.longValue());
                            AppCenterLog.error("AppCenter", "Empty database corrupted empty record deleted, id=" + next);
                            break;
                        }
                    }
                }
            } else if (!this.mPendingDbIdentifiers.contains(asLong)) {
                try {
                    String asString = contentValuesNextValues.getAsString(COLUMN_LOG);
                    if (asString == null) {
                        File largePayloadFile = getLargePayloadFile(largePayloadGroupDirectory, asLong.longValue());
                        AppCenterLog.debug("AppCenter", "Read payload file " + largePayloadFile);
                        asString = FileManager.read(largePayloadFile);
                        if (asString == null) {
                            throw new JSONException("Log payload is null and not stored as a file.");
                        }
                    }
                    Log logDeserializeLog = getLogSerializer().deserializeLog(asString, contentValuesNextValues.getAsString("type"));
                    String asString2 = contentValuesNextValues.getAsString(COLUMN_TARGET_TOKEN);
                    if (asString2 != null) {
                        logDeserializeLog.addTransmissionTarget(CryptoUtils.getInstance(this.mContext).decrypt(asString2).getDecryptedData());
                    }
                    linkedHashMap.put(asLong, logDeserializeLog);
                    i2++;
                } catch (JSONException e2) {
                    AppCenterLog.error("AppCenter", "Cannot deserialize a log in the database", e2);
                    arrayList2.add(asLong);
                }
            }
        }
        if (cursor != null) {
            try {
                cursor.close();
            } catch (RuntimeException unused) {
            }
        }
        if (arrayList2.size() > 0) {
            Iterator it2 = arrayList2.iterator();
            while (it2.hasNext()) {
                deleteLog(largePayloadGroupDirectory, ((Long) it2.next()).longValue());
            }
            AppCenterLog.warn("AppCenter", "Deleted logs that cannot be deserialized");
        }
        if (linkedHashMap.size() <= 0) {
            AppCenterLog.debug("AppCenter", "No logs found in the Persistence database at the moment");
            return null;
        }
        String string = UUID.randomUUID().toString();
        AppCenterLog.debug("AppCenter", "Returning " + linkedHashMap.size() + " log(s) with an ID, " + string);
        AppCenterLog.debug("AppCenter", "The SID/ID pairs for returning log(s) is/are:");
        ArrayList arrayList3 = new ArrayList();
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            Long l = (Long) entry.getKey();
            this.mPendingDbIdentifiers.add(l);
            arrayList3.add(l);
            outLogs.add((Log) entry.getValue());
            AppCenterLog.debug("AppCenter", "\t" + ((Log) entry.getValue()).getSid() + " / " + l);
        }
        this.mPendingDbIdentifiersGroups.put(group + string, arrayList3);
        return string;
    }

    @Override // com.microsoft.appcenter.persistence.Persistence
    public void clearPendingLogState() {
        this.mPendingDbIdentifiers.clear();
        this.mPendingDbIdentifiersGroups.clear();
        AppCenterLog.debug("AppCenter", "Cleared pending log states");
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        this.mDatabaseManager.close();
    }

    private List<Long> getLogsIds(SQLiteQueryBuilder builder, String[] selectionArgs) {
        ArrayList arrayList = new ArrayList();
        try {
            Cursor cursor = this.mDatabaseManager.getCursor(builder, DatabaseManager.SELECT_PRIMARY_KEY, selectionArgs, null);
            while (cursor.moveToNext()) {
                try {
                    arrayList.add(this.mDatabaseManager.buildValues(cursor).getAsLong(DatabaseManager.PRIMARY_KEY));
                } catch (Throwable th) {
                    cursor.close();
                    throw th;
                }
            }
            cursor.close();
        } catch (RuntimeException e) {
            AppCenterLog.error("AppCenter", "Failed to get corrupted ids: ", e);
        }
        return arrayList;
    }
}
