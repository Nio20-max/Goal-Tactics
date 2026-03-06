package com.microsoft.appcenter.utils.context;

import com.microsoft.appcenter.utils.AppCenterLog;
import com.microsoft.appcenter.utils.storage.SharedPreferencesManager;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.NavigableMap;
import java.util.Set;
import java.util.TreeMap;
import java.util.UUID;

/* JADX INFO: loaded from: classes2.dex */
public class SessionContext {
    private static final String STORAGE_KEY = "sessions";
    private static final String STORAGE_KEY_VALUE_SEPARATOR = "/";
    private static final int STORAGE_MAX_SESSIONS = 10;
    private static SessionContext sInstance;
    private final NavigableMap<Long, SessionInfo> mSessions = new TreeMap();
    private final long mAppLaunchTimestamp = System.currentTimeMillis();

    private SessionContext() {
        Set<String> stringSet = SharedPreferencesManager.getStringSet("sessions");
        if (stringSet != null) {
            for (String str : stringSet) {
                String[] strArrSplit = str.split(STORAGE_KEY_VALUE_SEPARATOR, -1);
                try {
                    long j = Long.parseLong(strArrSplit[0]);
                    String str2 = strArrSplit[1];
                    this.mSessions.put(Long.valueOf(j), new SessionInfo(j, str2.isEmpty() ? null : UUID.fromString(str2), strArrSplit.length > 2 ? Long.parseLong(strArrSplit[2]) : j));
                } catch (RuntimeException e) {
                    AppCenterLog.warn("AppCenter", "Ignore invalid session in store: " + str, e);
                }
            }
        }
        AppCenterLog.debug("AppCenter", "Loaded stored sessions: " + this.mSessions);
        addSession(null);
    }

    public static synchronized SessionContext getInstance() {
        if (sInstance == null) {
            sInstance = new SessionContext();
        }
        return sInstance;
    }

    public static synchronized void unsetInstance() {
        sInstance = null;
    }

    public synchronized void addSession(UUID sessionId) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        this.mSessions.put(Long.valueOf(jCurrentTimeMillis), new SessionInfo(jCurrentTimeMillis, sessionId, this.mAppLaunchTimestamp));
        if (this.mSessions.size() > 10) {
            this.mSessions.pollFirstEntry();
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        Iterator<SessionInfo> it = this.mSessions.values().iterator();
        while (it.hasNext()) {
            linkedHashSet.add(it.next().toString());
        }
        SharedPreferencesManager.putStringSet("sessions", linkedHashSet);
    }

    public synchronized SessionInfo getSessionAt(long timestamp) {
        Map.Entry<Long, SessionInfo> entryFloorEntry = this.mSessions.floorEntry(Long.valueOf(timestamp));
        if (entryFloorEntry == null) {
            return null;
        }
        return entryFloorEntry.getValue();
    }

    public synchronized void clearSessions() {
        this.mSessions.clear();
        SharedPreferencesManager.remove("sessions");
    }

    public static class SessionInfo {
        private final long mAppLaunchTimestamp;
        private final UUID mSessionId;
        private final long mTimestamp;

        SessionInfo(long timestamp, UUID sessionId, long appLaunchTimestamp) {
            this.mTimestamp = timestamp;
            this.mSessionId = sessionId;
            this.mAppLaunchTimestamp = appLaunchTimestamp;
        }

        long getTimestamp() {
            return this.mTimestamp;
        }

        public UUID getSessionId() {
            return this.mSessionId;
        }

        public long getAppLaunchTimestamp() {
            return this.mAppLaunchTimestamp;
        }

        public String toString() {
            String str = getTimestamp() + SessionContext.STORAGE_KEY_VALUE_SEPARATOR;
            if (getSessionId() != null) {
                str = str + getSessionId();
            }
            return str + SessionContext.STORAGE_KEY_VALUE_SEPARATOR + getAppLaunchTimestamp();
        }
    }
}
