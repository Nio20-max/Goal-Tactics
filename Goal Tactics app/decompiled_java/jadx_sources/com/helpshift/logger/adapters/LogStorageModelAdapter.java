package com.helpshift.logger.adapters;

import android.content.ContentValues;
import android.database.Cursor;
import com.helpshift.logger.model.LogDatabaseTable;
import com.helpshift.logger.model.LogModel;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class LogStorageModelAdapter {
    public static ContentValues toContentValues(LogModel logModel) {
        ContentValues contentValues = new ContentValues();
        contentValues.put(LogDatabaseTable.LogTableColumns.TIMESTAMP, logModel.timeStamp);
        contentValues.put(LogDatabaseTable.LogTableColumns.MESSAGE, logModel.message);
        contentValues.put(LogDatabaseTable.LogTableColumns.LEVEL, logModel.level);
        contentValues.put(LogDatabaseTable.LogTableColumns.EXTRAS, logModel.extras);
        contentValues.put(LogDatabaseTable.LogTableColumns.STACKTRACE, logModel.stacktrace);
        contentValues.put(LogDatabaseTable.LogTableColumns.SDK_VERSION, logModel.sdkVersion);
        return contentValues;
    }

    public static List<LogModel> fromCursor(Cursor cursor) {
        ArrayList arrayList = new ArrayList();
        if (cursor != null && cursor.moveToFirst()) {
            while (!cursor.isAfterLast()) {
                arrayList.add(new LogModel(cursor.getString(cursor.getColumnIndex(LogDatabaseTable.LogTableColumns.TIMESTAMP)), cursor.getString(cursor.getColumnIndex(LogDatabaseTable.LogTableColumns.LEVEL)), cursor.getString(cursor.getColumnIndex(LogDatabaseTable.LogTableColumns.MESSAGE)), cursor.getString(cursor.getColumnIndex(LogDatabaseTable.LogTableColumns.STACKTRACE)), cursor.getString(cursor.getColumnIndex(LogDatabaseTable.LogTableColumns.EXTRAS)), cursor.getString(cursor.getColumnIndex(LogDatabaseTable.LogTableColumns.SDK_VERSION))));
                cursor.moveToNext();
            }
        }
        return arrayList;
    }
}
