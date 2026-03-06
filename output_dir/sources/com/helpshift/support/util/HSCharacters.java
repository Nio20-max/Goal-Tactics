package com.helpshift.support.util;

import com.helpshift.util.HSJSONUtils;
import com.helpshift.util.HSLogger;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class HSCharacters {
    private static final String TAG = "HSCharacters";
    private Map<String, List<String>> characters;

    public HSCharacters(JSONObject jSONObject) {
        try {
            this.characters = new HashMap();
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                this.characters.put(next, HSJSONUtils.toList(jSONObject.getJSONArray(next)));
            }
        } catch (JSONException e) {
            HSLogger.e(TAG, "HSCharacters constructor error : " + e.getMessage());
        }
    }

    public boolean containsKey(String str, int i) {
        List<String> list = this.characters.get(str);
        return list != null && i < list.size() && list.get(i).length() > 0;
    }

    public String get(String str, int i) {
        List<String> list = this.characters.get(str);
        return list == null ? "" : list.get(i);
    }
}
