package com.microsoft.appcenter.utils.context;

import android.text.TextUtils;
import com.microsoft.appcenter.utils.AppCenterLog;
import java.util.Collections;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes2.dex */
public class UserIdContext {
    private static final String CUSTOM_PREFIX = "c";
    public static final int USER_ID_APP_CENTER_MAX_LENGTH = 256;
    private static UserIdContext sInstance;
    private final Set<Listener> mListeners = Collections.newSetFromMap(new ConcurrentHashMap());
    private String mUserId;

    public interface Listener {
        void onNewUserId(String userId);
    }

    public static synchronized UserIdContext getInstance() {
        if (sInstance == null) {
            sInstance = new UserIdContext();
        }
        return sInstance;
    }

    public static synchronized void unsetInstance() {
        sInstance = null;
    }

    public static boolean checkUserIdValidForOneCollector(String userId) {
        if (userId == null) {
            return true;
        }
        if (userId.isEmpty()) {
            AppCenterLog.error("AppCenter", "userId must not be empty.");
            return false;
        }
        int iIndexOf = userId.indexOf(":");
        if (iIndexOf >= 0) {
            String strSubstring = userId.substring(0, iIndexOf);
            if (!strSubstring.equals("c")) {
                AppCenterLog.error("AppCenter", String.format("userId prefix must be '%s%s', '%s%s' is not supported.", "c", ":", strSubstring, ":"));
                return false;
            }
            if (iIndexOf == userId.length() - 1) {
                AppCenterLog.error("AppCenter", "userId must not be empty.");
                return false;
            }
        }
        return true;
    }

    public static boolean checkUserIdValidForAppCenter(String userId) {
        if (userId == null || userId.length() <= 256) {
            return true;
        }
        AppCenterLog.error("AppCenter", "userId is limited to 256 characters.");
        return false;
    }

    public static String getPrefixedUserId(String userId) {
        if (userId == null || userId.contains(":")) {
            return userId;
        }
        return "c:" + userId;
    }

    public void addListener(Listener listener) {
        this.mListeners.add(listener);
    }

    public void removeListener(Listener listener) {
        this.mListeners.remove(listener);
    }

    public synchronized String getUserId() {
        return this.mUserId;
    }

    public void setUserId(String userId) {
        if (updateUserId(userId)) {
            Iterator<Listener> it = this.mListeners.iterator();
            while (it.hasNext()) {
                it.next().onNewUserId(this.mUserId);
            }
        }
    }

    private synchronized boolean updateUserId(String userId) {
        if (TextUtils.equals(this.mUserId, userId)) {
            return false;
        }
        this.mUserId = userId;
        return true;
    }
}
