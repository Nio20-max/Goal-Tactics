package com.helpshift.logger.logmodels;

import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
class MapExtrasModel implements ILogExtrasModel {
    private String key;
    private Map value;

    MapExtrasModel(String str, Map map) {
        this.key = str;
        this.value = map;
    }

    @Override // com.helpshift.logger.logmodels.ILogExtrasModel
    public String getConsoleLoggingMessage() {
        if (this.value == null) {
            return this.key + " : " + this.value;
        }
        return this.key + " : " + new JSONObject(this.value).toString();
    }

    @Override // com.helpshift.logger.logmodels.ILogExtrasModel
    public Object toJSONObject() {
        JSONObject jSONObject = new JSONObject();
        try {
            String str = this.key;
            Map map = this.value;
            jSONObject.put(str, map == null ? "" : map.toString());
        } catch (JSONException unused) {
        }
        return jSONObject;
    }
}
