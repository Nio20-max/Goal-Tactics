package com.microsoft.appcenter.ingestion.models.json;

import com.microsoft.appcenter.ingestion.models.Log;
import com.microsoft.appcenter.ingestion.models.LogContainer;
import com.microsoft.appcenter.ingestion.models.one.CommonSchemaLog;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;

/* JADX INFO: loaded from: classes2.dex */
public class DefaultLogSerializer implements LogSerializer {
    private static final String LOGS = "logs";
    private final Map<String, LogFactory> mLogFactories = new HashMap();

    private JSONStringer writeLog(JSONStringer writer, Log log) throws JSONException {
        writer.object();
        log.write(writer);
        writer.endObject();
        return writer;
    }

    private Log readLog(JSONObject object, String type) throws JSONException {
        if (type == null) {
            type = object.getString("type");
        }
        LogFactory logFactory = this.mLogFactories.get(type);
        if (logFactory == null) {
            throw new JSONException("Unknown log type: " + type);
        }
        Log logCreate = logFactory.create();
        logCreate.read(object);
        return logCreate;
    }

    @Override // com.microsoft.appcenter.ingestion.models.json.LogSerializer
    public String serializeLog(Log log) throws JSONException {
        return writeLog(new JSONStringer(), log).toString();
    }

    @Override // com.microsoft.appcenter.ingestion.models.json.LogSerializer
    public Log deserializeLog(String json, String type) throws JSONException {
        return readLog(new JSONObject(json), type);
    }

    @Override // com.microsoft.appcenter.ingestion.models.json.LogSerializer
    public Collection<CommonSchemaLog> toCommonSchemaLog(Log log) {
        return this.mLogFactories.get(log.getType()).toCommonSchemaLogs(log);
    }

    @Override // com.microsoft.appcenter.ingestion.models.json.LogSerializer
    public String serializeContainer(LogContainer logContainer) throws JSONException {
        JSONStringer jSONStringer = new JSONStringer();
        jSONStringer.object();
        jSONStringer.key(LOGS).array();
        Iterator<Log> it = logContainer.getLogs().iterator();
        while (it.hasNext()) {
            writeLog(jSONStringer, it.next());
        }
        jSONStringer.endArray();
        jSONStringer.endObject();
        return jSONStringer.toString();
    }

    @Override // com.microsoft.appcenter.ingestion.models.json.LogSerializer
    public LogContainer deserializeContainer(String json, String type) throws JSONException {
        JSONObject jSONObject = new JSONObject(json);
        LogContainer logContainer = new LogContainer();
        JSONArray jSONArray = jSONObject.getJSONArray(LOGS);
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < jSONArray.length(); i++) {
            arrayList.add(readLog(jSONArray.getJSONObject(i), type));
        }
        logContainer.setLogs(arrayList);
        return logContainer;
    }

    @Override // com.microsoft.appcenter.ingestion.models.json.LogSerializer
    public void addLogFactory(String logType, LogFactory logFactory) {
        this.mLogFactories.put(logType, logFactory);
    }
}
