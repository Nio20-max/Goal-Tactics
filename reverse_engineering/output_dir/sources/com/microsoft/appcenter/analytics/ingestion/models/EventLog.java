package com.microsoft.appcenter.analytics.ingestion.models;

import com.microsoft.appcenter.ingestion.models.CommonProperties;
import com.microsoft.appcenter.ingestion.models.json.JSONUtils;
import com.microsoft.appcenter.ingestion.models.properties.TypedProperty;
import com.microsoft.appcenter.ingestion.models.properties.TypedPropertyUtils;
import java.util.List;
import java.util.UUID;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public class EventLog extends LogWithNameAndProperties {
    public static final String TYPE = "event";
    private UUID id;
    private List<TypedProperty> typedProperties;

    @Override // com.microsoft.appcenter.ingestion.models.Log
    public String getType() {
        return "event";
    }

    public UUID getId() {
        return this.id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public List<TypedProperty> getTypedProperties() {
        return this.typedProperties;
    }

    public void setTypedProperties(List<TypedProperty> typedProperties) {
        this.typedProperties = typedProperties;
    }

    @Override // com.microsoft.appcenter.analytics.ingestion.models.LogWithNameAndProperties, com.microsoft.appcenter.ingestion.models.LogWithProperties, com.microsoft.appcenter.ingestion.models.AbstractLog, com.microsoft.appcenter.ingestion.models.Model
    public void read(JSONObject object) throws JSONException {
        super.read(object);
        setId(UUID.fromString(object.getString("id")));
        setTypedProperties(TypedPropertyUtils.read(object));
    }

    @Override // com.microsoft.appcenter.analytics.ingestion.models.LogWithNameAndProperties, com.microsoft.appcenter.ingestion.models.LogWithProperties, com.microsoft.appcenter.ingestion.models.AbstractLog, com.microsoft.appcenter.ingestion.models.Model
    public void write(JSONStringer writer) throws JSONException {
        super.write(writer);
        writer.key("id").value(getId());
        JSONUtils.writeArray(writer, CommonProperties.TYPED_PROPERTIES, getTypedProperties());
    }

    @Override // com.microsoft.appcenter.analytics.ingestion.models.LogWithNameAndProperties, com.microsoft.appcenter.ingestion.models.LogWithProperties, com.microsoft.appcenter.ingestion.models.AbstractLog
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass() || !super.equals(o)) {
            return false;
        }
        EventLog eventLog = (EventLog) o;
        UUID uuid = this.id;
        if (uuid == null ? eventLog.id != null : !uuid.equals(eventLog.id)) {
            return false;
        }
        List<TypedProperty> list = this.typedProperties;
        List<TypedProperty> list2 = eventLog.typedProperties;
        return list != null ? list.equals(list2) : list2 == null;
    }

    @Override // com.microsoft.appcenter.analytics.ingestion.models.LogWithNameAndProperties, com.microsoft.appcenter.ingestion.models.LogWithProperties, com.microsoft.appcenter.ingestion.models.AbstractLog
    public int hashCode() {
        int iHashCode = super.hashCode() * 31;
        UUID uuid = this.id;
        int iHashCode2 = (iHashCode + (uuid != null ? uuid.hashCode() : 0)) * 31;
        List<TypedProperty> list = this.typedProperties;
        return iHashCode2 + (list != null ? list.hashCode() : 0);
    }
}
