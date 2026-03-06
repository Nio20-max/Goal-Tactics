package com.ironsource.mediationsdk;

import com.android.billingclient.BuildConfig;
import com.ironsource.environment.StringUtils;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.mediationsdk.utils.IronSourceUtils;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/* JADX INFO: loaded from: classes2.dex */
public class AdaptersCompatibilityHandler {
    private static final AdaptersCompatibilityHandler instance = new AdaptersCompatibilityHandler();
    private final ConcurrentHashMap<String, String> mAdapterNameToMinIsVersion;
    private final ConcurrentHashMap<String, String> mAdapterNameToMinRvVersion;

    public static AdaptersCompatibilityHandler getInstance() {
        return instance;
    }

    private AdaptersCompatibilityHandler() {
        ConcurrentHashMap<String, String> concurrentHashMap = new ConcurrentHashMap<>();
        this.mAdapterNameToMinIsVersion = concurrentHashMap;
        concurrentHashMap.put("adcolony", "4.1.6");
        concurrentHashMap.put("vungle", "4.1.5");
        concurrentHashMap.put("applovin", "4.3.3");
        concurrentHashMap.put("admob", "4.3.2");
        ConcurrentHashMap<String, String> concurrentHashMap2 = new ConcurrentHashMap<>();
        this.mAdapterNameToMinRvVersion = concurrentHashMap2;
        concurrentHashMap2.put("adcolony", "4.1.6");
        concurrentHashMap2.put("admob", "4.3.2");
        concurrentHashMap2.put("applovin", "4.3.3");
        concurrentHashMap2.put("chartboost", "4.1.9");
        concurrentHashMap2.put("fyber", "4.1.0");
        concurrentHashMap2.put("hyprmx", "4.1.2");
        concurrentHashMap2.put("inmobi", "4.3.1");
        concurrentHashMap2.put("maio", "4.1.3");
        concurrentHashMap2.put("tapjoy", BuildConfig.VERSION_NAME);
        concurrentHashMap2.put("unityads", "4.1.4");
        concurrentHashMap2.put("vungle", "4.1.5");
    }

    public boolean isAdapterVersionRVCompatible(AbstractAdapter abstractAdapter) {
        return isAdapterVersionCompatible(abstractAdapter, this.mAdapterNameToMinRvVersion, "rewarded video");
    }

    public boolean isAdapterVersionISCompatible(AbstractAdapter abstractAdapter) {
        return isAdapterVersionCompatible(abstractAdapter, this.mAdapterNameToMinIsVersion, IronSourceConstants.AD_UNIT_IS_MEDIATION_STATE);
    }

    private boolean isAdapterVersionCompatible(AbstractAdapter abstractAdapter, Map<String, String> map, String str) {
        if (abstractAdapter == null) {
            return false;
        }
        String lowerCase = StringUtils.toLowerCase(abstractAdapter.getProviderName());
        if (!map.containsKey(lowerCase)) {
            return true;
        }
        String str2 = map.get(lowerCase);
        String version = abstractAdapter.getVersion();
        boolean zIsVersionGreaterOrEqual = isVersionGreaterOrEqual(str2, version);
        if (!zIsVersionGreaterOrEqual) {
            IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.API, abstractAdapter.getProviderName() + " adapter " + version + " is incompatible with SDK version " + IronSourceUtils.getSDKVersion() + " for " + str + " ad unit, please update your adapter to the latest version", 3);
        }
        return zIsVersionGreaterOrEqual;
    }

    public boolean isBannerAdapterCompatible(AbstractAdapter abstractAdapter) {
        if (abstractAdapter == null) {
            return false;
        }
        String version = abstractAdapter.getVersion();
        boolean zIsVersionGreaterOrEqual = isVersionGreaterOrEqual("4.3.0", version);
        if (!zIsVersionGreaterOrEqual) {
            IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.API, abstractAdapter.getProviderName() + " adapter " + version + " is incompatible with SDK version " + IronSourceUtils.getSDKVersion() + ", please update your adapter to the latest version", 3);
        }
        return zIsVersionGreaterOrEqual;
    }

    private boolean isVersionGreaterOrEqual(String str, String str2) {
        if (str.equalsIgnoreCase(str2)) {
            return true;
        }
        String[] strArrSplit = str.split("\\.");
        String[] strArrSplit2 = str2.split("\\.");
        for (int i = 0; i < 3; i++) {
            int i2 = Integer.parseInt(strArrSplit[i]);
            int i3 = Integer.parseInt(strArrSplit2[i]);
            if (i3 < i2) {
                return false;
            }
            if (i3 > i2) {
                return true;
            }
        }
        return true;
    }
}
