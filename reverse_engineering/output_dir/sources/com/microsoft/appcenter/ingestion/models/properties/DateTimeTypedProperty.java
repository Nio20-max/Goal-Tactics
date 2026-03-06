package com.microsoft.appcenter.ingestion.models.properties;

import com.microsoft.appcenter.ingestion.models.json.JSONDateUtils;
import java.util.Date;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public class DateTimeTypedProperty extends TypedProperty {
    public static final String TYPE = "dateTime";
    private Date value;

    @Override // com.microsoft.appcenter.ingestion.models.properties.TypedProperty
    public String getType() {
        return TYPE;
    }

    public Date getValue() {
        return this.value;
    }

    public void setValue(Date value) {
        this.value = value;
    }

    @Override // com.microsoft.appcenter.ingestion.models.properties.TypedProperty, com.microsoft.appcenter.ingestion.models.Model
    public void read(JSONObject object) throws JSONException {
        super.read(object);
        setValue(JSONDateUtils.toDate(object.getString("value")));
    }

    @Override // com.microsoft.appcenter.ingestion.models.properties.TypedProperty, com.microsoft.appcenter.ingestion.models.Model
    public void write(JSONStringer writer) throws JSONException {
        super.write(writer);
        writer.key("value").value(JSONDateUtils.toString(getValue()));
    }

    @Override // com.microsoft.appcenter.ingestion.models.properties.TypedProperty
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass() || !super.equals(o)) {
            return false;
        }
        Date date = this.value;
        Date date2 = ((DateTimeTypedProperty) o).value;
        return date != null ? date.equals(date2) : date2 == null;
    }

    @Override // com.microsoft.appcenter.ingestion.models.properties.TypedProperty
    public int hashCode() {
        int iHashCode = super.hashCode() * 31;
        Date date = this.value;
        return iHashCode + (date != null ? date.hashCode() : 0);
    }
}
