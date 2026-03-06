package com.helpshift.network.util;

import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.constants.Events;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class HttpHeaderParser {
    public static String parseCharset(Map<String, String> map, String str) {
        String str2 = map.get("Content-Type");
        if (str2 != null) {
            String[] strArrSplit = str2.split(";");
            for (int i = 1; i < strArrSplit.length; i++) {
                String[] strArrSplit2 = strArrSplit[i].trim().split(Constants.RequestParameters.EQUAL);
                if (strArrSplit2.length == 2 && strArrSplit2[0].equals(Events.CHARSET)) {
                    return strArrSplit2[1];
                }
            }
        }
        return str;
    }
}
