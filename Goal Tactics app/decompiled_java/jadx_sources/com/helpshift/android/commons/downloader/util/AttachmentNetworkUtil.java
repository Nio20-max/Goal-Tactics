package com.helpshift.android.commons.downloader.util;

import com.facebook.share.internal.ShareConstants;
import com.helpshift.android.commons.downloader.contracts.NetworkAuthDataFetcher;
import com.ironsource.sdk.constants.Constants;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class AttachmentNetworkUtil {
    public static URL buildSecureURL(String str, NetworkAuthDataFetcher networkAuthDataFetcher) throws GeneralSecurityException, MalformedURLException, URISyntaxException {
        URI uri = new URI(str);
        String path = uri.getPath();
        Map<String, String> queryMap = getQueryMap(uri.getQuery());
        queryMap.put("v", "1");
        queryMap.put(ShareConstants.MEDIA_URI, path);
        Map<String, String> authData = networkAuthDataFetcher.getAuthData(queryMap);
        ArrayList arrayList = new ArrayList();
        for (Map.Entry<String, String> entry : authData.entrySet()) {
            arrayList.add(entry.getKey() + Constants.RequestParameters.EQUAL + entry.getValue());
        }
        return new URL(new URI(uri.getScheme(), uri.getAuthority(), uri.getPath(), join(Constants.RequestParameters.AMPERSAND, arrayList), null).toASCIIString());
    }

    public static Map<String, String> getQueryMap(String str) {
        String[] strArrSplit = str.split(Constants.RequestParameters.AMPERSAND);
        HashMap map = new HashMap();
        for (String str2 : strArrSplit) {
            String[] strArrSplit2 = str2.split(Constants.RequestParameters.EQUAL);
            if (strArrSplit2.length == 2) {
                map.put(strArrSplit2[0], strArrSplit2[1]);
            }
        }
        return map;
    }

    public static String join(CharSequence charSequence, Iterable iterable) {
        if (iterable == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        boolean z = true;
        for (Object obj : iterable) {
            if (z) {
                z = false;
            } else {
                sb.append(charSequence);
            }
            sb.append(obj);
        }
        return sb.toString();
    }
}
