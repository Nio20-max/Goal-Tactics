package com.helpshift.util;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public final class ListUtils {
    public static boolean isEmpty(List list) {
        return list == null || list.isEmpty();
    }

    public static boolean isNotEmpty(List list) {
        return !isEmpty(list);
    }

    public static <T> List<List<T>> unflatten(List<T> list) {
        if (list == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (T t : list) {
            ArrayList arrayList2 = new ArrayList();
            arrayList2.add(t);
            arrayList.add(arrayList2);
        }
        return arrayList;
    }

    public static <T> List<T> flatten(List<List<T>> list) {
        if (list == null) {
            return new ArrayList();
        }
        ArrayList arrayList = new ArrayList();
        for (List<T> list2 : list) {
            if (!isEmpty(list2)) {
                arrayList.addAll(list2);
            }
        }
        return arrayList;
    }

    public static String serializeWithDelimiter(List<String> list, String str) {
        if (isEmpty(list)) {
            return "";
        }
        int size = list.size();
        StringBuilder sb = new StringBuilder(list.get(0));
        for (int i = 1; i < size; i++) {
            sb.append(str);
            sb.append(" ");
            sb.append(list.get(i));
        }
        return sb.toString();
    }
}
