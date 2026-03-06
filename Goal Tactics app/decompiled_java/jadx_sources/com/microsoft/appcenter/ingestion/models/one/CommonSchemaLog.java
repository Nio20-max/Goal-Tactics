package com.microsoft.appcenter.ingestion.models.one;

import com.microsoft.appcenter.ingestion.models.AbstractLog;
import com.microsoft.appcenter.ingestion.models.json.JSONDateUtils;
import com.microsoft.appcenter.ingestion.models.json.JSONUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public abstract class CommonSchemaLog extends AbstractLog {
    private static final String CV = "cV";
    private static final String DATA = "data";
    private static final String EXT = "ext";
    private static final String FLAGS = "flags";
    private static final String IKEY = "iKey";
    private static final String NAME = "name";
    private static final String POP_SAMPLE = "popSample";
    private static final String TIME = "time";
    private static final String VER = "ver";
    private String cV;
    private Data data;
    private Extensions ext;
    private Long flags;
    private String iKey;
    private String name;
    private Double popSample;
    private String ver;

    public String getVer() {
        return this.ver;
    }

    public void setVer(String ver) {
        this.ver = ver;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPopSample() {
        return this.popSample;
    }

    public void setPopSample(Double popSample) {
        this.popSample = popSample;
    }

    public String getIKey() {
        return this.iKey;
    }

    public void setIKey(String iKey) {
        this.iKey = iKey;
    }

    public Long getFlags() {
        return this.flags;
    }

    public void setFlags(Long flags) {
        this.flags = flags;
    }

    public String getCV() {
        return this.cV;
    }

    public void setCV(String cV) {
        this.cV = cV;
    }

    public Extensions getExt() {
        return this.ext;
    }

    public void setExt(Extensions ext) {
        this.ext = ext;
    }

    public Data getData() {
        return this.data;
    }

    public void setData(Data data) {
        this.data = data;
    }

    @Override // com.microsoft.appcenter.ingestion.models.AbstractLog, com.microsoft.appcenter.ingestion.models.Model
    public void read(JSONObject object) throws JSONException {
        setVer(object.getString(VER));
        setName(object.getString("name"));
        setTimestamp(JSONDateUtils.toDate(object.getString("time")));
        if (object.has(POP_SAMPLE)) {
            setPopSample(Double.valueOf(object.getDouble(POP_SAMPLE)));
        }
        setIKey(object.optString(IKEY, null));
        setFlags(JSONUtils.readLong(object, FLAGS));
        setCV(object.optString(CV, null));
        if (object.has(EXT)) {
            Extensions extensions = new Extensions();
            extensions.read(object.getJSONObject(EXT));
            setExt(extensions);
        }
        if (object.has("data")) {
            Data data = new Data();
            data.read(object.getJSONObject("data"));
            setData(data);
        }
    }

    @Override // com.microsoft.appcenter.ingestion.models.AbstractLog, com.microsoft.appcenter.ingestion.models.Model
    public void write(JSONStringer writer) throws JSONException {
        writer.key(VER).value(getVer());
        writer.key("name").value(getName());
        writer.key("time").value(JSONDateUtils.toString(getTimestamp()));
        JSONUtils.write(writer, POP_SAMPLE, getPopSample());
        JSONUtils.write(writer, IKEY, getIKey());
        JSONUtils.write(writer, FLAGS, getFlags());
        JSONUtils.write(writer, CV, getCV());
        if (getExt() != null) {
            writer.key(EXT).object();
            getExt().write(writer);
            writer.endObject();
        }
        if (getData() != null) {
            writer.key("data").object();
            getData().write(writer);
            writer.endObject();
        }
    }

    @Override // com.microsoft.appcenter.ingestion.models.AbstractLog
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass() || !super.equals(o)) {
            return false;
        }
        CommonSchemaLog commonSchemaLog = (CommonSchemaLog) o;
        String str = this.ver;
        if (str == null ? commonSchemaLog.ver != null : !str.equals(commonSchemaLog.ver)) {
            return false;
        }
        String str2 = this.name;
        if (str2 == null ? commonSchemaLog.name != null : !str2.equals(commonSchemaLog.name)) {
            return false;
        }
        Double d = this.popSample;
        if (d == null ? commonSchemaLog.popSample != null : !d.equals(commonSchemaLog.popSample)) {
            return false;
        }
        String str3 = this.iKey;
        if (str3 == null ? commonSchemaLog.iKey != null : !str3.equals(commonSchemaLog.iKey)) {
            return false;
        }
        Long l = this.flags;
        if (l == null ? commonSchemaLog.flags != null : !l.equals(commonSchemaLog.flags)) {
            return false;
        }
        String str4 = this.cV;
        if (str4 == null ? commonSchemaLog.cV != null : !str4.equals(commonSchemaLog.cV)) {
            return false;
        }
        Extensions extensions = this.ext;
        if (extensions == null ? commonSchemaLog.ext != null : !extensions.equals(commonSchemaLog.ext)) {
            return false;
        }
        Data data = this.data;
        Data data2 = commonSchemaLog.data;
        return data != null ? data.equals(data2) : data2 == null;
    }

    @Override // com.microsoft.appcenter.ingestion.models.AbstractLog
    public int hashCode() {
        int iHashCode = super.hashCode() * 31;
        String str = this.ver;
        int iHashCode2 = (iHashCode + (str != null ? str.hashCode() : 0)) * 31;
        String str2 = this.name;
        int iHashCode3 = (iHashCode2 + (str2 != null ? str2.hashCode() : 0)) * 31;
        Double d = this.popSample;
        int iHashCode4 = (iHashCode3 + (d != null ? d.hashCode() : 0)) * 31;
        String str3 = this.iKey;
        int iHashCode5 = (iHashCode4 + (str3 != null ? str3.hashCode() : 0)) * 31;
        Long l = this.flags;
        int iHashCode6 = (iHashCode5 + (l != null ? l.hashCode() : 0)) * 31;
        String str4 = this.cV;
        int iHashCode7 = (iHashCode6 + (str4 != null ? str4.hashCode() : 0)) * 31;
        Extensions extensions = this.ext;
        int iHashCode8 = (iHashCode7 + (extensions != null ? extensions.hashCode() : 0)) * 31;
        Data data = this.data;
        return iHashCode8 + (data != null ? data.hashCode() : 0);
    }
}
