package com.microsoft.appcenter.ingestion.models.properties;

import com.microsoft.appcenter.ingestion.models.CommonProperties;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class TypedPropertyUtils {
    public static TypedProperty create(String type) throws JSONException {
        if ("boolean".equals(type)) {
            return new BooleanTypedProperty();
        }
        if (DateTimeTypedProperty.TYPE.equals(type)) {
            return new DateTimeTypedProperty();
        }
        if (DoubleTypedProperty.TYPE.equals(type)) {
            return new DoubleTypedProperty();
        }
        if (LongTypedProperty.TYPE.equals(type)) {
            return new LongTypedProperty();
        }
        if ("string".equals(type)) {
            return new StringTypedProperty();
        }
        throw new JSONException("Unsupported type: " + type);
    }

    public static List<TypedProperty> read(JSONObject object) throws JSONException {
        JSONArray jSONArrayOptJSONArray = object.optJSONArray(CommonProperties.TYPED_PROPERTIES);
        if (jSONArrayOptJSONArray == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(jSONArrayOptJSONArray.length());
        for (int i = 0; i < jSONArrayOptJSONArray.length(); i++) {
            JSONObject jSONObject = jSONArrayOptJSONArray.getJSONObject(i);
            TypedProperty typedPropertyCreate = create(jSONObject.getString("type"));
            typedPropertyCreate.read(jSONObject);
            arrayList.add(typedPropertyCreate);
        }
        return arrayList;
    }
}
