package com.microsoft.appcenter.ingestion.models;

import com.microsoft.appcenter.ingestion.models.json.JSONUtils;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public class StartServiceLog extends AbstractLog {
    private static final String IS_ONE_COLLECTOR_ENABLED = "isOneCollectorEnabled";
    private static final String SERVICES = "services";
    public static final String TYPE = "startService";
    private Boolean isOneCollectorEnabled = null;
    private List<String> services;

    @Override // com.microsoft.appcenter.ingestion.models.Log
    public String getType() {
        return TYPE;
    }

    public List<String> getServices() {
        return this.services;
    }

    public void setServices(List<String> services) {
        this.services = services;
    }

    public void oneCollectorEnabled(Boolean isEnabled) {
        this.isOneCollectorEnabled = isEnabled;
    }

    public Boolean isOneCollectorEnabled() {
        return this.isOneCollectorEnabled;
    }

    @Override // com.microsoft.appcenter.ingestion.models.AbstractLog, com.microsoft.appcenter.ingestion.models.Model
    public void read(JSONObject object) throws JSONException {
        super.read(object);
        setServices(JSONUtils.readStringArray(object, SERVICES));
        oneCollectorEnabled(JSONUtils.readBoolean(object, IS_ONE_COLLECTOR_ENABLED));
    }

    @Override // com.microsoft.appcenter.ingestion.models.AbstractLog, com.microsoft.appcenter.ingestion.models.Model
    public void write(JSONStringer writer) throws JSONException {
        super.write(writer);
        JSONUtils.writeStringArray(writer, SERVICES, getServices());
        JSONUtils.write(writer, IS_ONE_COLLECTOR_ENABLED, isOneCollectorEnabled());
    }

    @Override // com.microsoft.appcenter.ingestion.models.AbstractLog
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass() || !super.equals(o)) {
            return false;
        }
        List<String> list = this.services;
        List<String> list2 = ((StartServiceLog) o).services;
        return list != null ? list.equals(list2) : list2 == null;
    }

    @Override // com.microsoft.appcenter.ingestion.models.AbstractLog
    public int hashCode() {
        int iHashCode = super.hashCode() * 31;
        List<String> list = this.services;
        return iHashCode + (list != null ? list.hashCode() : 0);
    }
}
