package com.helpshift.common.domain.network;

import com.facebook.share.internal.ShareConstants;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Device;
import com.helpshift.common.platform.Jsonifier;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.HTTPTransport;
import com.helpshift.common.platform.network.KeyValuePair;
import com.helpshift.common.platform.network.Method;
import com.helpshift.common.platform.network.NetworkRequestDAO;
import com.helpshift.common.platform.network.Request;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.common.platform.network.Response;
import com.helpshift.crypto.CryptoDM;
import com.helpshift.localeprovider.domainmodel.LocaleProviderDM;
import com.helpshift.util.StringUtils;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
abstract class BaseNetwork implements Network {
    private final String apiKey;
    private final String appId;
    private final CryptoDM cryptoDM;
    private final Device device;
    private final Domain domain;
    private final String domainKey;
    private final Jsonifier jsonifier;
    private final LocaleProviderDM localeProviderDM;
    final NetworkRequestDAO networkRequestDAO;
    private final Platform platform;
    final String route;
    private final HTTPTransport transport;

    abstract Request getRequest(RequestData requestData);

    BaseNetwork(String str, Domain domain, Platform platform) {
        this.route = str;
        this.platform = platform;
        this.domain = domain;
        this.localeProviderDM = domain.getLocaleProviderDM();
        this.cryptoDM = domain.getCryptoDM();
        this.networkRequestDAO = platform.getNetworkRequestDAO();
        this.transport = platform.getHTTPTransport();
        this.apiKey = platform.getAPIKey();
        this.domainKey = platform.getDomain();
        this.appId = platform.getAppId();
        this.device = platform.getDevice();
        this.jsonifier = platform.getJsonifier();
    }

    protected String getURL() {
        return NetworkConstants.scheme + this.domainKey + getURI();
    }

    private String getURI() {
        return "/api/lib/3" + this.route;
    }

    Map<String, String> getAuthData(Method method, Map<String, String> map) {
        AuthDataProvider authDataProvider = new AuthDataProvider(this.domain, this.platform, this.route);
        map.put(ShareConstants.MEDIA_URI, getURI());
        try {
            return authDataProvider.getAuthData(method, map);
        } catch (GeneralSecurityException e) {
            NetworkException networkException = NetworkException.UNABLE_TO_GENERATE_SIGNATURE;
            networkException.route = this.route;
            throw RootAPIException.wrap(e, networkException, "Network error");
        }
    }

    List<KeyValuePair> getHeaders(String str, RequestData requestData) {
        List<KeyValuePair> commonHeaders = getCommonHeaders(str);
        commonHeaders.addAll(getCustomHeaders(requestData));
        return commonHeaders;
    }

    List<KeyValuePair> getCommonHeaders(String str) {
        String str2;
        String str3 = String.format(Locale.ENGLISH, "Helpshift-%s/%s/%s", this.device.getPlatformName(), this.device.getSDKVersion(), this.device.getOSVersion());
        String sDKLanguage = this.localeProviderDM.getSDKLanguage();
        String defaultLanguage = this.localeProviderDM.getDefaultLanguage();
        if (!StringUtils.isEmpty(sDKLanguage)) {
            str2 = String.format(Locale.ENGLISH, "%s;q=1.0, %s;q=0.5", sDKLanguage, defaultLanguage);
        } else {
            str2 = String.format(Locale.ENGLISH, "%s;q=1.0", defaultLanguage);
        }
        String str4 = String.format(Locale.ENGLISH, "Helpshift-%s/%s", this.device.getPlatformName(), this.device.getSDKVersion());
        ArrayList arrayList = new ArrayList();
        arrayList.add(new KeyValuePair("User-Agent", str3));
        arrayList.add(new KeyValuePair("Accept-Language", str2));
        arrayList.add(new KeyValuePair("Accept-Encoding", "gzip"));
        arrayList.add(new KeyValuePair("X-HS-V", str4));
        arrayList.add(new KeyValuePair("X-HS-Request-ID", str));
        return arrayList;
    }

    private List<KeyValuePair> getCustomHeaders(RequestData requestData) {
        ArrayList arrayList = new ArrayList();
        Map<String, String> customHeaders = requestData.getCustomHeaders();
        if (customHeaders != null) {
            for (Map.Entry<String, String> entry : customHeaders.entrySet()) {
                arrayList.add(new KeyValuePair(entry.getKey(), entry.getValue()));
            }
        }
        return arrayList;
    }

    @Override // com.helpshift.common.domain.network.Network
    public Response makeRequest(RequestData requestData) {
        return this.transport.makeRequest(getRequest(requestData));
    }
}
