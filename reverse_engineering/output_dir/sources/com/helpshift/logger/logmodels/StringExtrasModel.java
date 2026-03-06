package com.helpshift.logger.logmodels;

import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
class StringExtrasModel implements ILogExtrasModel {
    private String key;
    private String value;

    StringExtrasModel(String str, String str2) {
        this.key = str;
        this.value = str2;
    }

    @Override // com.helpshift.logger.logmodels.ILogExtrasModel
    public String getConsoleLoggingMessage() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.key);
        sb.append(" : ");
        String str = this.value;
        if (str == null) {
            str = "";
        }
        sb.append(str);
        return sb.toString();
    }

    @Override // com.helpshift.logger.logmodels.ILogExtrasModel
    public Object toJSONObject() {
        JSONObject jSONObject = new JSONObject();
        try {
            String str = this.key;
            String str2 = this.value;
            if (str2 == null) {
                str2 = "";
            }
            jSONObject.put(str, str2);
        } catch (JSONException unused) {
        }
        return jSONObject;
    }
}
