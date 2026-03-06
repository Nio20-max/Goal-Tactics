package com.helpshift.common.platform;

import com.helpshift.common.platform.network.NetworkRequestDAO;
import com.helpshift.util.HSLogger;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidNetworkRequestDAO implements NetworkRequestDAO {
    private static final String KEY_IDEMPOTENT_REQUEST_ID_PREFIX = "idempotent_";
    private static final String KEY_ROUTE_ETAG_MAP = "route_etag_map";
    public static final String KEY_SERVER_TIME_DELTA = "server_time_delta";
    private KVStore kvStore;
    private Set<String> successfulRequestIds = new HashSet();

    public AndroidNetworkRequestDAO(KVStore kVStore) {
        this.kvStore = kVStore;
    }

    @Override // com.helpshift.common.platform.network.NetworkRequestDAO
    public void storeServerTimeDelta(float f) {
        this.kvStore.setFloat(KEY_SERVER_TIME_DELTA, Float.valueOf(f));
        HSLogger.updateTimeStampDelta(f);
    }

    @Override // com.helpshift.common.platform.network.NetworkRequestDAO
    public float getServerTimeDelta() {
        return this.kvStore.getFloat(KEY_SERVER_TIME_DELTA, Float.valueOf(0.0f)).floatValue();
    }

    @Override // com.helpshift.common.platform.network.NetworkRequestDAO
    public void storeETag(String str, String str2) {
        HashMap map;
        Object serializable = this.kvStore.getSerializable(KEY_ROUTE_ETAG_MAP);
        if (serializable == null) {
            map = new HashMap();
        } else {
            map = (HashMap) serializable;
        }
        map.put(str, str2);
        this.kvStore.setSerializable(KEY_ROUTE_ETAG_MAP, map);
    }

    @Override // com.helpshift.common.platform.network.NetworkRequestDAO
    public void removeETag(String str) {
        Object serializable;
        if (str == null || (serializable = this.kvStore.getSerializable(KEY_ROUTE_ETAG_MAP)) == null) {
            return;
        }
        HashMap map = (HashMap) serializable;
        if (map.containsKey(str)) {
            map.remove(str);
            this.kvStore.setSerializable(KEY_ROUTE_ETAG_MAP, map);
        }
    }

    @Override // com.helpshift.common.platform.network.NetworkRequestDAO
    public String getETag(String str) {
        Object serializable = this.kvStore.getSerializable(KEY_ROUTE_ETAG_MAP);
        if (serializable == null) {
            return null;
        }
        return (String) ((HashMap) serializable).get(str);
    }

    @Override // com.helpshift.common.platform.network.NetworkRequestDAO
    public void storePendingRequestId(String str, String str2, String str3) {
        HashMap map;
        String str4 = KEY_IDEMPOTENT_REQUEST_ID_PREFIX + str;
        Object serializable = this.kvStore.getSerializable(str4);
        if (serializable == null) {
            map = new HashMap();
        } else {
            map = (HashMap) serializable;
        }
        map.put(str2, str3);
        this.kvStore.setSerializable(str4, map);
    }

    @Override // com.helpshift.common.platform.network.NetworkRequestDAO
    public void deletePendingRequestId(String str, String str2) {
        String str3 = KEY_IDEMPOTENT_REQUEST_ID_PREFIX + str;
        Object serializable = this.kvStore.getSerializable(str3);
        if (serializable instanceof HashMap) {
            HashMap map = (HashMap) serializable;
            map.remove(str2);
            this.kvStore.setSerializable(str3, map);
        }
    }

    @Override // com.helpshift.common.platform.network.NetworkRequestDAO
    public String getPendingRequestId(String str, String str2) {
        Object serializable = this.kvStore.getSerializable(KEY_IDEMPOTENT_REQUEST_ID_PREFIX + str);
        if (serializable == null) {
            return null;
        }
        return (String) ((HashMap) serializable).get(str2);
    }

    @Override // com.helpshift.common.platform.network.NetworkRequestDAO
    public Map<String, String> getPendingRequestIdMapForRoute(String str) {
        Object serializable = this.kvStore.getSerializable(KEY_IDEMPOTENT_REQUEST_ID_PREFIX + str);
        if (serializable == null) {
            return null;
        }
        return (HashMap) serializable;
    }

    @Override // com.helpshift.common.platform.network.NetworkRequestDAO
    public void storeSuccessfulRequestId(String str) {
        this.successfulRequestIds.add(str);
    }

    @Override // com.helpshift.common.platform.network.NetworkRequestDAO
    public Set<String> getAllSuccessfulRequestIds() {
        return this.successfulRequestIds;
    }

    @Override // com.helpshift.common.platform.network.NetworkRequestDAO
    public void clearSuccessfulRequestIds() {
        this.successfulRequestIds.clear();
    }
}
