package com.microsoft.appcenter.ingestion.models.json;

import com.microsoft.appcenter.ingestion.models.Log;
import com.microsoft.appcenter.ingestion.models.LogContainer;
import com.microsoft.appcenter.ingestion.models.one.CommonSchemaLog;
import java.util.Collection;
import org.json.JSONException;

/* JADX INFO: loaded from: classes2.dex */
public interface LogSerializer {
    void addLogFactory(String logType, LogFactory logFactory);

    LogContainer deserializeContainer(String json, String type) throws JSONException;

    Log deserializeLog(String json, String type) throws JSONException;

    String serializeContainer(LogContainer container) throws JSONException;

    String serializeLog(Log log) throws JSONException;

    Collection<CommonSchemaLog> toCommonSchemaLog(Log log);
}
