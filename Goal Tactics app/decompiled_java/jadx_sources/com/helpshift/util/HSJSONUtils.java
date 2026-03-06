package com.helpshift.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class HSJSONUtils {
    private static final String TAG = "HelpshiftDebug";

    public static Map<String, String> toStringMap(JSONObject jSONObject) throws JSONException {
        HashMap map = new HashMap();
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            map.put(next, jSONObject.getString(next));
        }
        return map;
    }

    public static HashMap<String, Object> toMap(JSONObject jSONObject) throws JSONException {
        HashMap<String, Object> map = new HashMap<>();
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            map.put(next, fromJson(jSONObject.get(next)));
        }
        return map;
    }

    public static List toList(JSONArray jSONArray) throws JSONException {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < jSONArray.length(); i++) {
            arrayList.add(fromJson(jSONArray.get(i)));
        }
        return arrayList;
    }

    private static Object fromJson(Object obj) throws JSONException {
        if (obj == JSONObject.NULL) {
            return null;
        }
        if (obj instanceof JSONObject) {
            return toMap((JSONObject) obj);
        }
        return obj instanceof JSONArray ? toList((JSONArray) obj) : obj;
    }

    public static JSONObject fromNestedMap(Map<String, ArrayList> map) {
        JSONObject jSONObject = new JSONObject();
        try {
            for (Map.Entry<String, ArrayList> entry : map.entrySet()) {
                jSONObject.put(entry.getKey(), new JSONArray((Collection) entry.getValue()));
            }
        } catch (JSONException e) {
            HSLogger.d(TAG, "JSON Exception in parsing complex object", e);
        }
        return jSONObject;
    }

    public static JSONArray fromListOfMaps(List<HashMap> list) {
        JSONArray jSONArray = new JSONArray();
        try {
            for (HashMap map : list) {
                JSONObject jSONObject = new JSONObject();
                for (Object obj : map.keySet()) {
                    if (obj instanceof String) {
                        jSONObject.put((String) obj, map.get(obj));
                    }
                }
                jSONArray.put(jSONObject);
            }
        } catch (JSONException e) {
            HSLogger.d(TAG, "JSON Exception in parsing complex list", e);
        }
        return jSONArray;
    }

    public static ArrayList<String> jsonArrayToStringArrayList(String str) {
        ArrayList<String> arrayList = new ArrayList<>();
        try {
            JSONArray jSONArray = new JSONArray(str);
            int length = jSONArray.length();
            for (int i = 0; i < length; i++) {
                arrayList.add(jSONArray.getString(i));
            }
        } catch (JSONException e) {
            HSLogger.d(TAG, "jsonArrayToStringArrayList", e);
        }
        return arrayList;
    }

    public static JSONArray listToJsonArray(List<String> list) {
        JSONArray jSONArray = new JSONArray();
        if (ListUtils.isEmpty(list)) {
            return jSONArray;
        }
        for (String str : list) {
            if (!StringUtils.isEmpty(str, false)) {
                jSONArray.put(str);
            }
        }
        return jSONArray;
    }

    public static JSONArray doubleListToJsonArray(List<Double> list) {
        JSONArray jSONArray = new JSONArray();
        if (ListUtils.isEmpty(list)) {
            return jSONArray;
        }
        Iterator<Double> it = list.iterator();
        while (it.hasNext()) {
            jSONArray.put(it.next());
        }
        return jSONArray;
    }

    public static List<Double> jsonToDoubleArrayList(String str) {
        ArrayList arrayList = new ArrayList();
        if (StringUtils.isEmpty(str)) {
            return arrayList;
        }
        try {
            JSONArray jSONArray = new JSONArray(str);
            int length = jSONArray.length();
            for (int i = 0; i < length; i++) {
                try {
                    arrayList.add(Double.valueOf(Double.parseDouble(jSONArray.getString(i))));
                } catch (NumberFormatException e) {
                    HSLogger.e(TAG, "Cannot parse value to double jsonToDoubleArrayList", e);
                }
            }
        } catch (JSONException e2) {
            HSLogger.d(TAG, "jsonToDoubleArrayList", e2);
        }
        return arrayList;
    }

    public static List<Double> getDoubleListFromJSONArray(JSONArray jSONArray) {
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i = 0; i < length; i++) {
            try {
                arrayList.add(Double.valueOf(jSONArray.getDouble(i)));
            } catch (JSONException e) {
                HSLogger.e(TAG, "Parsing exception while convert jsonArray to double array list", e);
            }
        }
        return arrayList;
    }

    public static List<String> convertJSONArrayToStringList(JSONArray jSONArray) {
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i = 0; i < length; i++) {
            try {
                arrayList.add(jSONArray.getString(i));
            } catch (JSONException e) {
                HSLogger.e(TAG, "Parsing exception while convert jsonArray to string array list", e);
            }
        }
        return arrayList;
    }

    public static ArrayList<ArrayList<String>> nestedJsonArrayToNestedArrayList(String str) {
        ArrayList<ArrayList<String>> arrayList = new ArrayList<>();
        try {
            JSONArray jSONArray = new JSONArray(str);
            int length = jSONArray.length();
            for (int i = 0; i < length; i++) {
                JSONArray jSONArray2 = jSONArray.getJSONArray(i);
                int length2 = jSONArray2.length();
                ArrayList<String> arrayList2 = new ArrayList<>();
                for (int i2 = 0; i2 < length2; i2++) {
                    arrayList2.add(jSONArray2.getString(i2));
                }
                arrayList.add(arrayList2);
            }
        } catch (JSONException e) {
            HSLogger.d(TAG, "nestedJsonArrayToNestedArrayList", e);
        }
        return arrayList;
    }
}
