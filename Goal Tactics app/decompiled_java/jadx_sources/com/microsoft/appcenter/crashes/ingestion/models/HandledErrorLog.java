package com.microsoft.appcenter.crashes.ingestion.models;

import com.microsoft.appcenter.ingestion.models.LogWithProperties;
import java.util.UUID;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public class HandledErrorLog extends LogWithProperties {
    private static final String EXCEPTION = "exception";
    public static final String TYPE = "handledError";
    private Exception exception;
    private UUID id;

    @Override // com.microsoft.appcenter.ingestion.models.Log
    public String getType() {
        return TYPE;
    }

    public UUID getId() {
        return this.id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public Exception getException() {
        return this.exception;
    }

    public void setException(Exception exception) {
        this.exception = exception;
    }

    @Override // com.microsoft.appcenter.ingestion.models.LogWithProperties, com.microsoft.appcenter.ingestion.models.AbstractLog, com.microsoft.appcenter.ingestion.models.Model
    public void read(JSONObject object) throws JSONException {
        super.read(object);
        setId(UUID.fromString(object.getString("id")));
        if (object.has(EXCEPTION)) {
            JSONObject jSONObject = object.getJSONObject(EXCEPTION);
            Exception exception = new Exception();
            exception.read(jSONObject);
            setException(exception);
        }
    }

    @Override // com.microsoft.appcenter.ingestion.models.LogWithProperties, com.microsoft.appcenter.ingestion.models.AbstractLog, com.microsoft.appcenter.ingestion.models.Model
    public void write(JSONStringer writer) throws JSONException {
        super.write(writer);
        writer.key("id").value(getId());
        if (getException() != null) {
            writer.key(EXCEPTION).object();
            this.exception.write(writer);
            writer.endObject();
        }
    }

    @Override // com.microsoft.appcenter.ingestion.models.LogWithProperties, com.microsoft.appcenter.ingestion.models.AbstractLog
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass() || !super.equals(o)) {
            return false;
        }
        HandledErrorLog handledErrorLog = (HandledErrorLog) o;
        UUID uuid = this.id;
        if (uuid == null ? handledErrorLog.id != null : !uuid.equals(handledErrorLog.id)) {
            return false;
        }
        Exception exception = this.exception;
        Exception exception2 = handledErrorLog.exception;
        return exception != null ? exception.equals(exception2) : exception2 == null;
    }

    @Override // com.microsoft.appcenter.ingestion.models.LogWithProperties, com.microsoft.appcenter.ingestion.models.AbstractLog
    public int hashCode() {
        int iHashCode = super.hashCode() * 31;
        UUID uuid = this.id;
        int iHashCode2 = (iHashCode + (uuid != null ? uuid.hashCode() : 0)) * 31;
        Exception exception = this.exception;
        return iHashCode2 + (exception != null ? exception.hashCode() : 0);
    }
}
