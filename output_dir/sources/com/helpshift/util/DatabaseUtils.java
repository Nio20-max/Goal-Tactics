package com.helpshift.util;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class DatabaseUtils {
    public static final int MAX_WILDCARD_COUNT = 900;

    public static boolean exists(SQLiteDatabase sQLiteDatabase, String str, String str2, String[] strArr) {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT COUNT(*) FROM ");
        sb.append(str);
        sb.append(" WHERE ");
        sb.append(str2);
        sb.append(" LIMIT 1");
        return android.database.DatabaseUtils.longForQuery(sQLiteDatabase, sb.toString(), strArr) > 0;
    }

    public static String makePlaceholders(int i) {
        if (i < 1) {
            return null;
        }
        StringBuilder sb = new StringBuilder((i * 2) - 1);
        sb.append("?");
        for (int i2 = 1; i2 < i; i2++) {
            sb.append(",?");
        }
        return sb.toString();
    }

    public static <T> List<List<T>> createBatches(int i, List<T> list) {
        ArrayList arrayList = new ArrayList();
        if (i > list.size()) {
            arrayList.add(list);
        } else {
            int i2 = 0;
            int iMin = i;
            while (iMin <= list.size() && i2 <= iMin) {
                List<T> listSubList = list.subList(i2, iMin);
                i2 += i;
                iMin = Math.min(listSubList.size() + iMin, list.size());
                if (listSubList.size() > 0) {
                    arrayList.add(listSubList);
                }
            }
        }
        return arrayList;
    }

    public static <T> T parseColumnSafe(Cursor cursor, String str, Class<T> cls) {
        T tCast;
        try {
            int columnIndex = cursor.getColumnIndex(str);
            if (cls == Long.class) {
                if (cursor.isNull(columnIndex)) {
                    return null;
                }
                tCast = cls.cast(Long.valueOf(cursor.getLong(columnIndex)));
            } else if (cls == Integer.class) {
                if (cursor.isNull(columnIndex)) {
                    return null;
                }
                tCast = cls.cast(Integer.valueOf(cursor.getInt(columnIndex)));
            } else {
                if (cls != String.class) {
                    return null;
                }
                tCast = cls.cast(cursor.getString(cursor.getColumnIndex(str)));
            }
            return tCast;
        } catch (Exception e) {
            HSLogger.e("DatabaseUtils", "Error in parse long column : " + str, e);
            return null;
        }
    }

    public static boolean parseBooleanColumnSafe(Cursor cursor, String str, boolean z) {
        Boolean booleanColumnSafe = parseBooleanColumnSafe(cursor, str);
        return booleanColumnSafe == null ? z : booleanColumnSafe.booleanValue();
    }

    public static Boolean parseBooleanColumnSafe(Cursor cursor, String str) {
        Integer num = (Integer) parseColumnSafe(cursor, str, Integer.class);
        if (num == null) {
            return null;
        }
        return Boolean.valueOf(num.intValue() == 1);
    }
}
