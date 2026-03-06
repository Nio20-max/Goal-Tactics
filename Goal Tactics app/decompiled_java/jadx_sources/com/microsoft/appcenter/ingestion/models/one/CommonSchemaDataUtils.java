package com.microsoft.appcenter.ingestion.models.one;

import com.microsoft.appcenter.ingestion.models.json.JSONDateUtils;
import com.microsoft.appcenter.ingestion.models.properties.BooleanTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.DateTimeTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.DoubleTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.LongTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.StringTypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.TypedProperty;
import com.microsoft.appcenter.utils.AppCenterLog;
import java.util.Iterator;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class CommonSchemaDataUtils {
    static final int DATA_TYPE_DATETIME = 9;
    static final int DATA_TYPE_DOUBLE = 6;
    static final int DATA_TYPE_INT64 = 4;
    static final String METADATA_FIELDS = "f";

    public static void addCommonSchemaData(List<TypedProperty> properties, CommonSchemaLog dest) {
        Iterator<TypedProperty> it;
        if (properties == null) {
            return;
        }
        try {
            Data data = new Data();
            dest.setData(data);
            MetadataExtension metadataExtension = new MetadataExtension();
            Iterator<TypedProperty> it2 = properties.iterator();
            while (it2.hasNext()) {
                TypedProperty next = it2.next();
                try {
                    Object objValidateProperty = validateProperty(next);
                    Integer metadataType = getMetadataType(next);
                    String[] strArrSplit = next.getName().split("\\.", -1);
                    int length = strArrSplit.length - 1;
                    JSONObject properties2 = data.getProperties();
                    JSONObject metadata = metadataExtension.getMetadata();
                    int i = 0;
                    while (i < length) {
                        Iterator<TypedProperty> it3 = it2;
                        String str = strArrSplit[i];
                        JSONObject jSONObjectOptJSONObject = properties2.optJSONObject(str);
                        if (jSONObjectOptJSONObject == null) {
                            if (properties2.has(str)) {
                                AppCenterLog.warn("AppCenter", "Property key '" + str + "' already has a value, the old value will be overridden.");
                            }
                            JSONObject jSONObject = new JSONObject();
                            properties2.put(str, jSONObject);
                            properties2 = jSONObject;
                        } else {
                            properties2 = jSONObjectOptJSONObject;
                        }
                        metadata = addIntermediateMetadata(metadata, str);
                        i++;
                        it2 = it3;
                    }
                    it = it2;
                    String str2 = strArrSplit[length];
                    if (properties2.has(str2)) {
                        AppCenterLog.warn("AppCenter", "Property key '" + str2 + "' already has a value, the old value will be overridden.");
                    }
                    properties2.put(str2, objValidateProperty);
                    addLeafMetadata(metadataType, metadata, str2);
                } catch (IllegalArgumentException e) {
                    it = it2;
                    AppCenterLog.warn("AppCenter", e.getMessage());
                }
                it2 = it;
            }
            JSONObject properties3 = data.getProperties();
            String strOptString = properties3.optString("baseType", null);
            JSONObject jSONObjectOptJSONObject2 = properties3.optJSONObject("baseData");
            if (strOptString == null && jSONObjectOptJSONObject2 != null) {
                AppCenterLog.warn("AppCenter", "baseData was set but baseType is missing.");
                properties3.remove("baseData");
                metadataExtension.getMetadata().optJSONObject(METADATA_FIELDS).remove("baseData");
            }
            if (strOptString != null && jSONObjectOptJSONObject2 == null) {
                AppCenterLog.warn("AppCenter", "baseType was set but baseData is missing.");
                properties3.remove("baseType");
            }
            if (cleanUpEmptyObjectsInMetadata(metadataExtension.getMetadata())) {
                return;
            }
            if (dest.getExt() == null) {
                dest.setExt(new Extensions());
            }
            dest.getExt().setMetadata(metadataExtension);
        } catch (JSONException unused) {
        }
    }

    private static Object validateProperty(TypedProperty property) throws JSONException, IllegalArgumentException {
        Object objValueOf;
        String name = property.getName();
        if (name == null) {
            throw new IllegalArgumentException("Property key cannot be null.");
        }
        if (name.equals("baseType") && !(property instanceof StringTypedProperty)) {
            throw new IllegalArgumentException("baseType must be a string.");
        }
        if (name.startsWith("baseType.")) {
            throw new IllegalArgumentException("baseType must be a string.");
        }
        if (name.equals("baseData")) {
            throw new IllegalArgumentException("baseData must be an object.");
        }
        if (property instanceof StringTypedProperty) {
            objValueOf = ((StringTypedProperty) property).getValue();
        } else if (property instanceof LongTypedProperty) {
            objValueOf = Long.valueOf(((LongTypedProperty) property).getValue());
        } else if (property instanceof DoubleTypedProperty) {
            objValueOf = Double.valueOf(((DoubleTypedProperty) property).getValue());
        } else if (property instanceof DateTimeTypedProperty) {
            objValueOf = JSONDateUtils.toString(((DateTimeTypedProperty) property).getValue());
        } else if (property instanceof BooleanTypedProperty) {
            objValueOf = Boolean.valueOf(((BooleanTypedProperty) property).getValue());
        } else {
            throw new IllegalArgumentException("Unsupported property type: " + property.getType());
        }
        if (objValueOf != null) {
            return objValueOf;
        }
        throw new IllegalArgumentException("Value of property with key '" + name + "' cannot be null.");
    }

    private static Integer getMetadataType(TypedProperty property) {
        if (property instanceof LongTypedProperty) {
            return 4;
        }
        if (property instanceof DoubleTypedProperty) {
            return 6;
        }
        return property instanceof DateTimeTypedProperty ? 9 : null;
    }

    private static void addLeafMetadata(Integer metadataType, JSONObject destMetadata, String lastKey) throws JSONException {
        JSONObject jSONObjectOptJSONObject = destMetadata.optJSONObject(METADATA_FIELDS);
        if (metadataType == null) {
            if (jSONObjectOptJSONObject != null) {
                jSONObjectOptJSONObject.remove(lastKey);
            }
        } else {
            if (jSONObjectOptJSONObject == null) {
                jSONObjectOptJSONObject = new JSONObject();
                destMetadata.put(METADATA_FIELDS, jSONObjectOptJSONObject);
            }
            jSONObjectOptJSONObject.put(lastKey, metadataType);
        }
    }

    private static JSONObject addIntermediateMetadata(JSONObject destMetadata, String subKey) throws JSONException {
        JSONObject jSONObjectOptJSONObject = destMetadata.optJSONObject(METADATA_FIELDS);
        if (jSONObjectOptJSONObject == null) {
            jSONObjectOptJSONObject = new JSONObject();
            destMetadata.put(METADATA_FIELDS, jSONObjectOptJSONObject);
        }
        JSONObject jSONObjectOptJSONObject2 = jSONObjectOptJSONObject.optJSONObject(subKey);
        if (jSONObjectOptJSONObject2 != null) {
            return jSONObjectOptJSONObject2;
        }
        JSONObject jSONObject = new JSONObject();
        jSONObjectOptJSONObject.put(subKey, jSONObject);
        return jSONObject;
    }

    private static boolean cleanUpEmptyObjectsInMetadata(JSONObject object) {
        Iterator<String> itKeys = object.keys();
        while (itKeys.hasNext()) {
            JSONObject jSONObjectOptJSONObject = object.optJSONObject(itKeys.next());
            if (jSONObjectOptJSONObject != null && cleanUpEmptyObjectsInMetadata(jSONObjectOptJSONObject)) {
                itKeys.remove();
            }
        }
        return object.length() == 0;
    }
}
