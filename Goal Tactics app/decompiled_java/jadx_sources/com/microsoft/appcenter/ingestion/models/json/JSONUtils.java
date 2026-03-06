package com.microsoft.appcenter.ingestion.models.json;

import com.microsoft.appcenter.ingestion.models.Model;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public class JSONUtils {
    JSONUtils() {
    }

    public static Integer readInteger(JSONObject object, String key) throws JSONException {
        if (object.has(key)) {
            return Integer.valueOf(object.getInt(key));
        }
        return null;
    }

    public static Long readLong(JSONObject object, String key) throws JSONException {
        if (object.has(key)) {
            return Long.valueOf(object.getLong(key));
        }
        return null;
    }

    public static Boolean readBoolean(JSONObject object, String key) throws JSONException {
        if (object.has(key)) {
            return Boolean.valueOf(object.getBoolean(key));
        }
        return null;
    }

    public static Map<String, String> readMap(JSONObject object, String key) throws JSONException {
        JSONObject jSONObjectOptJSONObject = object.optJSONObject(key);
        if (jSONObjectOptJSONObject == null) {
            return null;
        }
        HashMap map = new HashMap(jSONObjectOptJSONObject.length());
        Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            map.put(next, jSONObjectOptJSONObject.getString(next));
        }
        return map;
    }

    public static <M extends Model> List<M> readArray(JSONObject jSONObject, String str, ModelFactory<M> modelFactory) throws JSONException {
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray(str);
        if (jSONArrayOptJSONArray == null) {
            return null;
        }
        List<M> listCreateList = modelFactory.createList(jSONArrayOptJSONArray.length());
        for (int i = 0; i < jSONArrayOptJSONArray.length(); i++) {
            JSONObject jSONObject2 = jSONArrayOptJSONArray.getJSONObject(i);
            Model modelCreate = modelFactory.create();
            modelCreate.read(jSONObject2);
            listCreateList.add(modelCreate);
        }
        return listCreateList;
    }

    public static List<String> readStringArray(JSONObject object, String key) throws JSONException {
        JSONArray jSONArrayOptJSONArray = object.optJSONArray(key);
        if (jSONArrayOptJSONArray == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(jSONArrayOptJSONArray.length());
        for (int i = 0; i < jSONArrayOptJSONArray.length(); i++) {
            arrayList.add(jSONArrayOptJSONArray.getString(i));
        }
        return arrayList;
    }

    public static void write(JSONStringer writer, String key, Object value) throws JSONException {
        if (value != null) {
            writer.key(key).value(value);
        }
    }

    public static void writeMap(JSONStringer writer, String key, Map<String, String> value) throws JSONException {
        if (value != null) {
            writer.key(key).object();
            for (Map.Entry<String, String> entry : value.entrySet()) {
                writer.key(entry.getKey()).value(entry.getValue());
            }
            writer.endObject();
        }
    }

    public static void writeArray(JSONStringer writer, String key, List<? extends Model> value) throws JSONException {
        if (value != null) {
            writer.key(key).array();
            for (Model model : value) {
                writer.object();
                model.write(writer);
                writer.endObject();
            }
            writer.endArray();
        }
    }

    public static void writeStringArray(JSONStringer writer, String key, List<String> values) throws JSONException {
        if (values != null) {
            writer.key(key).array();
            Iterator<String> it = values.iterator();
            while (it.hasNext()) {
                writer.value(it.next());
            }
            writer.endArray();
        }
    }
}
