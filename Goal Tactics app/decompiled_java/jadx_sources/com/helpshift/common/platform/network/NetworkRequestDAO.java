package com.helpshift.common.platform.network;

import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public interface NetworkRequestDAO {
    void clearSuccessfulRequestIds();

    void deletePendingRequestId(String str, String str2);

    Set<String> getAllSuccessfulRequestIds();

    String getETag(String str);

    String getPendingRequestId(String str, String str2);

    Map<String, String> getPendingRequestIdMapForRoute(String str);

    float getServerTimeDelta();

    void removeETag(String str);

    void storeETag(String str, String str2);

    void storePendingRequestId(String str, String str2, String str3);

    void storeServerTimeDelta(float f);

    void storeSuccessfulRequestId(String str);
}
