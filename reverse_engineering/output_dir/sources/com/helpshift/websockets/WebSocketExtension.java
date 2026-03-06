package com.helpshift.websockets;

import com.ironsource.sdk.constants.Constants;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class WebSocketExtension {
    public static final String PERMESSAGE_DEFLATE = "permessage-deflate";
    private final String mName;
    private final Map<String, String> mParameters;

    void validate() throws WebSocketException {
    }

    public WebSocketExtension(String str) {
        if (!Token.isValid(str)) {
            throw new IllegalArgumentException("'name' is not a valid token.");
        }
        this.mName = str;
        this.mParameters = new LinkedHashMap();
    }

    public WebSocketExtension(WebSocketExtension webSocketExtension) {
        if (webSocketExtension == null) {
            throw new IllegalArgumentException("'source' is null.");
        }
        this.mName = webSocketExtension.getName();
        this.mParameters = new LinkedHashMap(webSocketExtension.getParameters());
    }

    public static WebSocketExtension parse(String str) {
        String strExtractValue;
        if (str == null) {
            return null;
        }
        String[] strArrSplit = str.trim().split("\\s*;\\s*");
        if (strArrSplit.length == 0) {
            return null;
        }
        String str2 = strArrSplit[0];
        if (!Token.isValid(str2)) {
            return null;
        }
        WebSocketExtension webSocketExtensionCreateInstance = createInstance(str2);
        for (int i = 1; i < strArrSplit.length; i++) {
            String[] strArrSplit2 = strArrSplit[i].split("\\s*=\\s*", 2);
            if (strArrSplit2.length != 0 && strArrSplit2[0].length() != 0) {
                String str3 = strArrSplit2[0];
                if (Token.isValid(str3) && ((strExtractValue = extractValue(strArrSplit2)) == null || Token.isValid(strExtractValue))) {
                    webSocketExtensionCreateInstance.setParameter(str3, strExtractValue);
                }
            }
        }
        return webSocketExtensionCreateInstance;
    }

    private static String extractValue(String[] strArr) {
        if (strArr.length != 2) {
            return null;
        }
        return Token.unquote(strArr[1]);
    }

    private static WebSocketExtension createInstance(String str) {
        if (PERMESSAGE_DEFLATE.equals(str)) {
            return new PerMessageDeflateExtension(str);
        }
        return new WebSocketExtension(str);
    }

    public String getName() {
        return this.mName;
    }

    public Map<String, String> getParameters() {
        return this.mParameters;
    }

    public boolean containsParameter(String str) {
        return this.mParameters.containsKey(str);
    }

    public String getParameter(String str) {
        return this.mParameters.get(str);
    }

    public WebSocketExtension setParameter(String str, String str2) {
        if (!Token.isValid(str)) {
            throw new IllegalArgumentException("'key' is not a valid token.");
        }
        if (str2 != null && !Token.isValid(str2)) {
            throw new IllegalArgumentException("'value' is not a valid token.");
        }
        this.mParameters.put(str, str2);
        return this;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(this.mName);
        for (Map.Entry<String, String> entry : this.mParameters.entrySet()) {
            sb.append("; ");
            sb.append(entry.getKey());
            String value = entry.getValue();
            if (value != null && value.length() != 0) {
                sb.append(Constants.RequestParameters.EQUAL);
                sb.append(value);
            }
        }
        return sb.toString();
    }
}
