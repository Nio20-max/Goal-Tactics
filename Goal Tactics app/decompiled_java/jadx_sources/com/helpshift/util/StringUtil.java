package com.helpshift.util;

import java.util.ArrayList;
import java.util.Collection;
import org.json.JSONArray;

/* JADX INFO: loaded from: classes2.dex */
public class StringUtil {
    public static String toString(Object obj) {
        if (obj instanceof String) {
            return (String) obj;
        }
        if (obj instanceof ArrayList) {
            return new JSONArray((Collection) obj).toString();
        }
        return null;
    }

    public static String escapeForSql(String str) {
        return "'" + str + "'";
    }
}
