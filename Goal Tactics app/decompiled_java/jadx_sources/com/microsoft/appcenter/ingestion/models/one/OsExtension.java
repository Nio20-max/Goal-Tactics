package com.microsoft.appcenter.ingestion.models.one;

import com.microsoft.appcenter.ingestion.models.Model;
import com.microsoft.appcenter.ingestion.models.json.JSONUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public class OsExtension implements Model {
    private static final String NAME = "name";
    private static final String VER = "ver";
    private String name;
    private String ver;

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVer() {
        return this.ver;
    }

    public void setVer(String ver) {
        this.ver = ver;
    }

    @Override // com.microsoft.appcenter.ingestion.models.Model
    public void read(JSONObject object) {
        setName(object.optString("name", null));
        setVer(object.optString(VER, null));
    }

    @Override // com.microsoft.appcenter.ingestion.models.Model
    public void write(JSONStringer writer) throws JSONException {
        JSONUtils.write(writer, "name", getName());
        JSONUtils.write(writer, VER, getVer());
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        OsExtension osExtension = (OsExtension) o;
        String str = this.name;
        if (str == null ? osExtension.name != null : !str.equals(osExtension.name)) {
            return false;
        }
        String str2 = this.ver;
        String str3 = osExtension.ver;
        return str2 != null ? str2.equals(str3) : str3 == null;
    }

    public int hashCode() {
        String str = this.name;
        int iHashCode = (str != null ? str.hashCode() : 0) * 31;
        String str2 = this.ver;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }
}
