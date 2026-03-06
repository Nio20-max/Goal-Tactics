package com.helpshift.support.util;

import com.helpshift.util.AssetsUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class HSTransliterator {
    private static final String TAG = "Helpshift_Transliteratr";
    private static HSCharacters hsCharacters = null;
    private static boolean initDone = false;

    public static boolean isLoaded() {
        return initDone;
    }

    public static void init() {
        if (initDone) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(AssetsUtil.readFileAsString(HelpshiftContext.getApplicationContext(), "hs__data")).getJSONObject("HSCharacters");
            if (jSONObject != null) {
                hsCharacters = new HSCharacters(jSONObject);
                initDone = true;
            }
        } catch (JSONException e) {
            HSLogger.w(TAG, "Error reading json : ", e);
        }
    }

    public static void deinit() {
        hsCharacters = null;
        initDone = false;
    }

    public static String unidecode(String str) {
        if (!initDone) {
            init();
        }
        if (str == null || str.length() == 0) {
            return "";
        }
        for (int i = 0; i < str.length() && str.charAt(i) <= 128; i++) {
            if (i >= str.length()) {
                return str;
            }
        }
        char[] charArray = str.toCharArray();
        StringBuilder sb = new StringBuilder();
        for (char c : charArray) {
            if (c < 128) {
                sb.append(c);
            } else {
                int i2 = c >> '\b';
                int i3 = c & 255;
                HSCharacters hSCharacters = hsCharacters;
                if (hSCharacters != null && hSCharacters.containsKey(String.valueOf(i2), i3)) {
                    sb.append(hsCharacters.get(String.valueOf(i2), i3));
                } else {
                    sb.append("");
                }
            }
        }
        return sb.toString();
    }
}
