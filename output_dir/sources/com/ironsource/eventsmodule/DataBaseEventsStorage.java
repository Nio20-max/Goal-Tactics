package com.ironsource.eventsmodule;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.provider.BaseColumns;
import android.util.Log;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class DataBaseEventsStorage extends SQLiteOpenHelper implements IEventsStorageHelper {
    private static final String COMMA_SEP = ",";
    private static final String TYPE_INTEGER = " INTEGER";
    private static final String TYPE_TEXT = " TEXT";
    private static DataBaseEventsStorage mInstance;
    private final int DB_OPEN_BACKOFF_TIME;
    private final int DB_RETRY_NUM;
    private final String SQL_CREATE_ENTRIES;
    private final String SQL_DELETE_TABLE;

    public DataBaseEventsStorage(Context context, String str, int i) {
        super(context, str, (SQLiteDatabase.CursorFactory) null, i);
        this.DB_RETRY_NUM = 4;
        this.DB_OPEN_BACKOFF_TIME = 400;
        this.SQL_DELETE_TABLE = "DROP TABLE IF EXISTS events";
        this.SQL_CREATE_ENTRIES = "CREATE TABLE events (_id INTEGER PRIMARY KEY,eventid INTEGER,timestamp INTEGER,type TEXT,data TEXT )";
    }

    public static synchronized DataBaseEventsStorage getInstance(Context context, String str, int i) {
        if (mInstance == null) {
            mInstance = new DataBaseEventsStorage(context, str, i);
        }
        return mInstance;
    }

    @Override // com.ironsource.eventsmodule.IEventsStorageHelper
    public synchronized void saveEvents(List<EventData> list, String str) {
        if (list != null) {
            if (!list.isEmpty()) {
                SQLiteDatabase sQLiteDatabase = null;
                try {
                    SQLiteDatabase dataBaseWithRetries = getDataBaseWithRetries(true);
                    try {
                        Iterator<EventData> it = list.iterator();
                        while (it.hasNext()) {
                            ContentValues contentValuesForEvent = getContentValuesForEvent(it.next(), str);
                            if (dataBaseWithRetries != null && contentValuesForEvent != null) {
                                dataBaseWithRetries.insert("events", null, contentValuesForEvent);
                            }
                        }
                        if (dataBaseWithRetries != null && dataBaseWithRetries.isOpen()) {
                            dataBaseWithRetries.close();
                        }
                    } catch (Throwable th) {
                        th = th;
                        sQLiteDatabase = dataBaseWithRetries;
                        try {
                            Log.e(IronSourceConstants.IRONSOURCE_CONFIG_NAME, "Exception while saving events: ", th);
                        } finally {
                            if (sQLiteDatabase != null && sQLiteDatabase.isOpen()) {
                                sQLiteDatabase.close();
                            }
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                }
            }
        }
    }

    @Override // com.ironsource.eventsmodule.IEventsStorageHelper
    public synchronized ArrayList<EventData> loadEvents(String str) {
        ArrayList<EventData> arrayList;
        SQLiteDatabase dataBaseWithRetries;
        arrayList = new ArrayList<>();
        Cursor cursorQuery = null;
        try {
            dataBaseWithRetries = getDataBaseWithRetries(false);
            try {
                cursorQuery = dataBaseWithRetries.query("events", null, "type = ?", new String[]{str}, null, null, "timestamp ASC");
                if (cursorQuery.getCount() > 0) {
                    cursorQuery.moveToFirst();
                    while (!cursorQuery.isAfterLast()) {
                        arrayList.add(new EventData(cursorQuery.getInt(cursorQuery.getColumnIndex("eventid")), cursorQuery.getLong(cursorQuery.getColumnIndex(EventEntry.COLUMN_NAME_TIMESTAMP)), new JSONObject(cursorQuery.getString(cursorQuery.getColumnIndex("data")))));
                        cursorQuery.moveToNext();
                    }
                    cursorQuery.close();
                }
            } catch (Throwable th) {
                th = th;
                try {
                    Log.e(IronSourceConstants.IRONSOURCE_CONFIG_NAME, "Exception while loading events: ", th);
                    if (cursorQuery != null && !cursorQuery.isClosed()) {
                        cursorQuery.close();
                    }
                    if (dataBaseWithRetries != null && dataBaseWithRetries.isOpen()) {
                    }
                    return arrayList;
                } finally {
                    if (cursorQuery != null && !cursorQuery.isClosed()) {
                        cursorQuery.close();
                    }
                    if (dataBaseWithRetries != null && dataBaseWithRetries.isOpen()) {
                        dataBaseWithRetries.close();
                    }
                }
            }
        } catch (Throwable th2) {
            th = th2;
            dataBaseWithRetries = null;
        }
        return arrayList;
    }

    @Override // com.ironsource.eventsmodule.IEventsStorageHelper
    public synchronized void clearEvents(String str) {
        SQLiteDatabase dataBaseWithRetries = null;
        String[] strArr = {str};
        try {
            dataBaseWithRetries = getDataBaseWithRetries(true);
            dataBaseWithRetries.delete("events", "type = ?", strArr);
        } catch (Throwable th) {
            try {
                Log.e(IronSourceConstants.IRONSOURCE_CONFIG_NAME, "Exception while clearing events: ", th);
                if (dataBaseWithRetries != null && dataBaseWithRetries.isOpen()) {
                }
            } finally {
                if (dataBaseWithRetries != null && dataBaseWithRetries.isOpen()) {
                    dataBaseWithRetries.close();
                }
            }
        }
    }

    private ContentValues getContentValuesForEvent(EventData eventData, String str) {
        if (eventData == null) {
            return null;
        }
        ContentValues contentValues = new ContentValues(4);
        contentValues.put("eventid", Integer.valueOf(eventData.getEventId()));
        contentValues.put(EventEntry.COLUMN_NAME_TIMESTAMP, Long.valueOf(eventData.getTimeStamp()));
        contentValues.put("type", str);
        contentValues.put("data", eventData.getAdditionalData());
        return contentValues;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("CREATE TABLE events (_id INTEGER PRIMARY KEY,eventid INTEGER,timestamp INTEGER,type TEXT,data TEXT )");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS events");
        onCreate(sQLiteDatabase);
    }

    private synchronized SQLiteDatabase getDataBaseWithRetries(boolean z) throws Throwable {
        int i = 0;
        while (true) {
            try {
                if (z) {
                    return getWritableDatabase();
                }
                return getReadableDatabase();
            } finally {
            }
        }
    }

    static abstract class EventEntry implements BaseColumns {
        public static final String COLUMN_NAME_DATA = "data";
        public static final String COLUMN_NAME_EVENT_ID = "eventid";
        public static final String COLUMN_NAME_TIMESTAMP = "timestamp";
        public static final String COLUMN_NAME_TYPE = "type";
        public static final int NUMBER_OF_COLUMNS = 4;
        public static final String TABLE_NAME = "events";

        EventEntry() {
        }
    }
}
