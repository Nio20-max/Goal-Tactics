package com.microsoft.appcenter.ingestion.models.properties;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public class StringTypedProperty extends TypedProperty {
    public static final String TYPE = "string";
    private String value;

    @Override // com.microsoft.appcenter.ingestion.models.properties.TypedProperty
    public String getType() {
        return "string";
    }

    public String getValue() {
        return this.value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override // com.microsoft.appcenter.ingestion.models.properties.TypedProperty, com.microsoft.appcenter.ingestion.models.Model
    public void read(JSONObject object) throws JSONException {
        super.read(object);
        setValue(object.getString("value"));
    }

    @Override // com.microsoft.appcenter.ingestion.models.properties.TypedProperty, com.microsoft.appcenter.ingestion.models.Model
    public void write(JSONStringer writer) throws JSONException {
        super.write(writer);
        writer.key("value").value(getValue());
    }

    @Override // com.microsoft.appcenter.ingestion.models.properties.TypedProperty
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass() || !super.equals(o)) {
            return false;
        }
        String str = this.value;
        String str2 = ((StringTypedProperty) o).value;
        return str != null ? str.equals(str2) : str2 == null;
    }

    @Override // com.microsoft.appcenter.ingestion.models.properties.TypedProperty
    public int hashCode() {
        int iHashCode = super.hashCode() * 31;
        String str = this.value;
        return iHashCode + (str != null ? str.hashCode() : 0);
    }
}
