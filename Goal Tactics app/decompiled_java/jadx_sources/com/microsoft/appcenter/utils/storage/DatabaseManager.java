package com.microsoft.appcenter.utils.storage;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteFullException;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import com.microsoft.appcenter.utils.AppCenterLog;
import java.io.Closeable;
import java.util.Arrays;

/* JADX INFO: loaded from: classes2.dex */
public class DatabaseManager implements Closeable {
    public static final String PRIMARY_KEY = "oid";
    public static final String[] SELECT_PRIMARY_KEY = {PRIMARY_KEY};
    private final Context mContext;
    private final String mDatabase;
    private final String mDefaultTable;
    private final Listener mListener;
    private SQLiteOpenHelper mSQLiteOpenHelper;
    private final ContentValues mSchema;

    public interface Listener {
        void onCreate(SQLiteDatabase db);

        void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion);
    }

    public DatabaseManager(Context context, String database, String defaultTable, int version, ContentValues schema, final String sqlCreateCommand, Listener listener) {
        this.mContext = context;
        this.mDatabase = database;
        this.mDefaultTable = defaultTable;
        this.mSchema = schema;
        this.mListener = listener;
        this.mSQLiteOpenHelper = new SQLiteOpenHelper(context, database, null, version) { // from class: com.microsoft.appcenter.utils.storage.DatabaseManager.1
            @Override // android.database.sqlite.SQLiteOpenHelper
            public void onCreate(SQLiteDatabase db) {
                db.execSQL(sqlCreateCommand);
                DatabaseManager.this.mListener.onCreate(db);
            }

            @Override // android.database.sqlite.SQLiteOpenHelper
            public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
                DatabaseManager.this.mListener.onUpgrade(db, oldVersion, newVersion);
            }
        };
    }

    private static ContentValues buildValues(Cursor cursor, ContentValues schema) {
        ContentValues contentValues = new ContentValues();
        for (int i = 0; i < cursor.getColumnCount(); i++) {
            if (!cursor.isNull(i)) {
                String columnName = cursor.getColumnName(i);
                if (columnName.equals(PRIMARY_KEY)) {
                    contentValues.put(columnName, Long.valueOf(cursor.getLong(i)));
                } else {
                    Object obj = schema.get(columnName);
                    if (obj instanceof byte[]) {
                        contentValues.put(columnName, cursor.getBlob(i));
                    } else if (obj instanceof Double) {
                        contentValues.put(columnName, Double.valueOf(cursor.getDouble(i)));
                    } else if (obj instanceof Float) {
                        contentValues.put(columnName, Float.valueOf(cursor.getFloat(i)));
                    } else if (obj instanceof Integer) {
                        contentValues.put(columnName, Integer.valueOf(cursor.getInt(i)));
                    } else if (obj instanceof Long) {
                        contentValues.put(columnName, Long.valueOf(cursor.getLong(i)));
                    } else if (obj instanceof Short) {
                        contentValues.put(columnName, Short.valueOf(cursor.getShort(i)));
                    } else if (obj instanceof Boolean) {
                        contentValues.put(columnName, Boolean.valueOf(cursor.getInt(i) == 1));
                    } else {
                        contentValues.put(columnName, cursor.getString(i));
                    }
                }
            }
        }
        return contentValues;
    }

    public ContentValues buildValues(Cursor cursor) {
        return buildValues(cursor, this.mSchema);
    }

    public ContentValues nextValues(Cursor cursor) {
        try {
            if (cursor.moveToNext()) {
                return buildValues(cursor);
            }
            return null;
        } catch (RuntimeException e) {
            AppCenterLog.error("AppCenter", "Failed to get next cursor value: ", e);
            return null;
        }
    }

    public long put(ContentValues values, String priorityColumn) {
        Long lValueOf = null;
        Cursor cursor = null;
        while (lValueOf == null) {
            try {
                try {
                    lValueOf = Long.valueOf(getDatabase().insertOrThrow(this.mDefaultTable, null, values));
                } catch (RuntimeException e) {
                    lValueOf = -1L;
                    AppCenterLog.error("AppCenter", String.format("Failed to insert values (%s) to database %s.", values.toString(), this.mDatabase), e);
                }
            } catch (SQLiteFullException e2) {
                AppCenterLog.debug("AppCenter", "Storage is full, trying to delete the oldest log that has the lowest priority which is lower or equal priority than the new log");
                if (cursor == null) {
                    String asString = values.getAsString(priorityColumn);
                    SQLiteQueryBuilder sQLiteQueryBuilderNewSQLiteQueryBuilder = SQLiteUtils.newSQLiteQueryBuilder();
                    sQLiteQueryBuilderNewSQLiteQueryBuilder.appendWhere(priorityColumn + " <= ?");
                    cursor = getCursor(sQLiteQueryBuilderNewSQLiteQueryBuilder, SELECT_PRIMARY_KEY, new String[]{asString}, priorityColumn + " , " + PRIMARY_KEY);
                }
                if (cursor.moveToNext()) {
                    long j = cursor.getLong(0);
                    delete(j);
                    AppCenterLog.debug("AppCenter", "Deleted log id=" + j);
                } else {
                    throw e2;
                }
            }
        }
        if (cursor != null) {
            try {
                cursor.close();
            } catch (RuntimeException unused) {
            }
        }
        return lValueOf.longValue();
    }

    public void delete(long id) {
        delete(this.mDefaultTable, PRIMARY_KEY, Long.valueOf(id));
    }

    public int delete(String key, Object value) {
        return delete(this.mDefaultTable, key, value);
    }

    private int delete(String table, String key, Object value) {
        String[] strArr = {String.valueOf(value)};
        try {
            return getDatabase().delete(table, key + " = ?", strArr);
        } catch (RuntimeException e) {
            AppCenterLog.error("AppCenter", String.format("Failed to delete values that match condition=\"%s\" and values=\"%s\" from database %s.", key + " = ?", Arrays.toString(strArr), this.mDatabase), e);
            return 0;
        }
    }

    public void clear() {
        try {
            getDatabase().delete(this.mDefaultTable, null, null);
        } catch (RuntimeException e) {
            AppCenterLog.error("AppCenter", "Failed to clear the table.", e);
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        try {
            this.mSQLiteOpenHelper.close();
        } catch (RuntimeException e) {
            AppCenterLog.error("AppCenter", "Failed to close the database.", e);
        }
    }

    public final long getRowCount() {
        try {
            return DatabaseUtils.queryNumEntries(getDatabase(), this.mDefaultTable);
        } catch (RuntimeException e) {
            AppCenterLog.error("AppCenter", "Failed to get row count of database.", e);
            return -1L;
        }
    }

    public Cursor getCursor(SQLiteQueryBuilder queryBuilder, String[] columns, String[] selectionArgs, String sortOrder) throws RuntimeException {
        return getCursor(this.mDefaultTable, queryBuilder, columns, selectionArgs, sortOrder);
    }

    Cursor getCursor(String table, SQLiteQueryBuilder queryBuilder, String[] columns, String[] selectionArgs, String sortOrder) throws RuntimeException {
        if (queryBuilder == null) {
            queryBuilder = SQLiteUtils.newSQLiteQueryBuilder();
        }
        SQLiteQueryBuilder sQLiteQueryBuilder = queryBuilder;
        sQLiteQueryBuilder.setTables(table);
        return sQLiteQueryBuilder.query(getDatabase(), columns, null, selectionArgs, null, null, sortOrder);
    }

    SQLiteDatabase getDatabase() {
        try {
            return this.mSQLiteOpenHelper.getWritableDatabase();
        } catch (RuntimeException e) {
            AppCenterLog.warn("AppCenter", "Failed to open database. Trying to delete database (may be corrupted).", e);
            if (this.mContext.deleteDatabase(this.mDatabase)) {
                AppCenterLog.info("AppCenter", "The database was successfully deleted.");
            } else {
                AppCenterLog.warn("AppCenter", "Failed to delete database.");
            }
            return this.mSQLiteOpenHelper.getWritableDatabase();
        }
    }

    void setSQLiteOpenHelper(SQLiteOpenHelper helper) {
        this.mSQLiteOpenHelper.close();
        this.mSQLiteOpenHelper = helper;
    }

    public boolean setMaxSize(long maxStorageSizeInBytes) {
        try {
            SQLiteDatabase database = getDatabase();
            long maximumSize = database.setMaximumSize(maxStorageSizeInBytes);
            long pageSize = database.getPageSize();
            long j = maxStorageSizeInBytes / pageSize;
            if (maxStorageSizeInBytes % pageSize != 0) {
                j++;
            }
            if (maximumSize != j * pageSize) {
                AppCenterLog.error("AppCenter", "Could not change maximum database size to " + maxStorageSizeInBytes + " bytes, current maximum size is " + maximumSize + " bytes.");
                return false;
            }
            if (maxStorageSizeInBytes == maximumSize) {
                AppCenterLog.info("AppCenter", "Changed maximum database size to " + maximumSize + " bytes.");
                return true;
            }
            AppCenterLog.info("AppCenter", "Changed maximum database size to " + maximumSize + " bytes (next multiple of page size).");
            return true;
        } catch (RuntimeException e) {
            AppCenterLog.error("AppCenter", "Could not change maximum database size.", e);
            return false;
        }
    }

    public long getMaxSize() {
        try {
            return getDatabase().getMaximumSize();
        } catch (RuntimeException e) {
            AppCenterLog.error("AppCenter", "Could not get maximum database size.", e);
            return -1L;
        }
    }
}
