package com.microsoft.appcenter.ingestion.models.one;

import com.microsoft.appcenter.ingestion.models.Model;
import com.microsoft.appcenter.ingestion.models.json.JSONUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public class Data implements Model {
    static final String BASE_DATA = "baseData";
    static final String BASE_TYPE = "baseType";
    private final JSONObject mProperties = new JSONObject();

    public JSONObject getProperties() {
        return this.mProperties;
    }

    @Override // com.microsoft.appcenter.ingestion.models.Model
    public void read(JSONObject object) throws JSONException {
        JSONArray jSONArrayNames = object.names();
        if (jSONArrayNames != null) {
            for (int i = 0; i < jSONArrayNames.length(); i++) {
                String string = jSONArrayNames.getString(i);
                this.mProperties.put(string, object.get(string));
            }
        }
    }

    @Override // com.microsoft.appcenter.ingestion.models.Model
    public void write(JSONStringer writer) throws JSONException {
        JSONUtils.write(writer, BASE_TYPE, this.mProperties.optString(BASE_TYPE, null));
        JSONUtils.write(writer, BASE_DATA, this.mProperties.optJSONObject(BASE_DATA));
        JSONArray jSONArrayNames = this.mProperties.names();
        if (jSONArrayNames != null) {
            for (int i = 0; i < jSONArrayNames.length(); i++) {
                String string = jSONArrayNames.getString(i);
                if (!string.equals(BASE_TYPE) && !string.equals(BASE_DATA)) {
                    writer.key(string).value(this.mProperties.get(string));
                }
            }
        }
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        return this.mProperties.toString().equals(((Data) o).mProperties.toString());
    }

    public int hashCode() {
        return this.mProperties.toString().hashCode();
    }
}
