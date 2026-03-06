package com.facebook;

import com.microsoft.appcenter.http.DefaultHttpClient;
import java.util.Arrays;
import kotlin.Metadata;

/* JADX INFO: compiled from: HttpMethod.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0005\b\u0086\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005¨\u0006\u0006"}, d2 = {"Lcom/facebook/HttpMethod;", "", "(Ljava/lang/String;I)V", "GET", "POST", DefaultHttpClient.METHOD_DELETE, "facebook-core_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
public enum HttpMethod {
    GET,
    POST,
    DELETE;

    /* JADX INFO: renamed from: values, reason: to resolve conflict with enum method */
    public static HttpMethod[] valuesCustom() {
        HttpMethod[] httpMethodArrValuesCustom = values();
        return (HttpMethod[]) Arrays.copyOf(httpMethodArrValuesCustom, httpMethodArrValuesCustom.length);
    }
}
