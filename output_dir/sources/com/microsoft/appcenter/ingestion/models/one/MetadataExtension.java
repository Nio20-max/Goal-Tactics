package com.microsoft.appcenter.ingestion.models.one;

import com.microsoft.appcenter.ingestion.models.Model;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public class MetadataExtension implements Model {
    private JSONObject mMetadata = new JSONObject();

    public JSONObject getMetadata() {
        return this.mMetadata;
    }

    @Override // com.microsoft.appcenter.ingestion.models.Model
    public void read(JSONObject object) {
        this.mMetadata = object;
    }

    @Override // com.microsoft.appcenter.ingestion.models.Model
    public void write(JSONStringer writer) throws JSONException {
        Iterator<String> itKeys = this.mMetadata.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            writer.key(next).value(this.mMetadata.get(next));
        }
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        return this.mMetadata.toString().equals(((MetadataExtension) o).mMetadata.toString());
    }

    public int hashCode() {
        return this.mMetadata.toString().hashCode();
    }
}
