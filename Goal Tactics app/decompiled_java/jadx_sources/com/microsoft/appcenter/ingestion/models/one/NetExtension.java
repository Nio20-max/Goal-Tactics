package com.microsoft.appcenter.ingestion.models.one;

import com.microsoft.appcenter.ingestion.models.Model;
import com.microsoft.appcenter.ingestion.models.json.JSONUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public class NetExtension implements Model {
    private static final String PROVIDER = "provider";
    private String provider;

    public String getProvider() {
        return this.provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    @Override // com.microsoft.appcenter.ingestion.models.Model
    public void read(JSONObject object) {
        setProvider(object.optString("provider", null));
    }

    @Override // com.microsoft.appcenter.ingestion.models.Model
    public void write(JSONStringer writer) throws JSONException {
        JSONUtils.write(writer, "provider", getProvider());
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        String str = this.provider;
        String str2 = ((NetExtension) o).provider;
        return str != null ? str.equals(str2) : str2 == null;
    }

    public int hashCode() {
        String str = this.provider;
        if (str != null) {
            return str.hashCode();
        }
        return 0;
    }
}
