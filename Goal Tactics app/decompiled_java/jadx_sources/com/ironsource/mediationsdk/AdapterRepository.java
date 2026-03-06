package com.ironsource.mediationsdk;

import com.ironsource.environment.StringUtils;
import com.ironsource.mediationsdk.logger.IronSourceLogger;
import com.ironsource.mediationsdk.logger.IronSourceLoggerManager;
import com.ironsource.mediationsdk.model.ProviderSettings;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class AdapterRepository {
    private static final String IRONSOURCE_ADAPTER_PREFIX = "IronSource";
    private Boolean mAdapterDebug;
    private String mAppKey;
    private Boolean mConsent;
    private String mUserId;
    private static AdapterRepository mInstance = new AdapterRepository();
    private static final Object lock = new Object();
    private AtomicBoolean mDidIronSourceEarlyInit = new AtomicBoolean(false);
    private ConcurrentHashMap<String, AbstractAdapter> adapters = new ConcurrentHashMap<>();
    private ConcurrentHashMap<String, List<String>> mMetaData = new ConcurrentHashMap<>();

    public static AdapterRepository getInstance() {
        return mInstance;
    }

    private AdapterRepository() {
    }

    public void setInitParams(String str, String str2) {
        this.mAppKey = str;
        this.mUserId = str2;
    }

    public void setConsent(boolean z) {
        synchronized (lock) {
            this.mConsent = Boolean.valueOf(z);
            Iterator<AbstractAdapter> it = this.adapters.values().iterator();
            while (it.hasNext()) {
                setConsent(it.next());
            }
        }
    }

    private void setConsent(AbstractAdapter abstractAdapter) {
        try {
            Boolean bool = this.mConsent;
            if (bool != null) {
                abstractAdapter.setConsent(bool.booleanValue());
            }
        } catch (Throwable th) {
            logInternal("error while setting consent of " + abstractAdapter.getProviderName() + ": " + th.getLocalizedMessage());
            th.printStackTrace();
        }
    }

    public AbstractAdapter createAdapter(ProviderSettings providerSettings) {
        String adapterKey = getAdapterKey(providerSettings);
        if (providerSettings.getProviderTypeForReflection().equalsIgnoreCase(IronSourceConstants.SUPERSONIC_CONFIG_NAME)) {
            return this.adapters.get(adapterKey);
        }
        return getAdapterByReflection(adapterKey, providerSettings.getProviderTypeForReflection());
    }

    public AbstractAdapter getAdapter(ProviderSettings providerSettings, JSONObject jSONObject) {
        return getAdapter(providerSettings, jSONObject, false);
    }

    public AbstractAdapter getAdapter(ProviderSettings providerSettings, JSONObject jSONObject, boolean z) {
        return getAdapterInternal(getAdapterKey(providerSettings), z ? "IronSource" : providerSettings.getProviderTypeForReflection(), jSONObject);
    }

    private AbstractAdapter getAdapterInternal(String str, String str2, JSONObject jSONObject) {
        logInternal(str + " (" + str2 + ") - Getting adapter");
        synchronized (lock) {
            if (this.adapters.containsKey(str)) {
                logInternal(str + " was already allocated");
                return this.adapters.get(str);
            }
            AbstractAdapter adapterByReflection = getAdapterByReflection(str, str2);
            if (adapterByReflection == null) {
                logErrorInternal(str + " adapter was not loaded");
                return null;
            }
            logInternal(str + " was allocated (adapter version: " + adapterByReflection.getVersion() + ", sdk version: " + adapterByReflection.getCoreSDKVersion() + ")");
            adapterByReflection.setLogListener(IronSourceLoggerManager.getLogger());
            setMetaData(adapterByReflection);
            setConsent(adapterByReflection);
            setAdaptersDebug(adapterByReflection);
            earlyInitAdapter(jSONObject, adapterByReflection, str2);
            this.adapters.put(str, adapterByReflection);
            return adapterByReflection;
        }
    }

    private void earlyInitAdapter(JSONObject jSONObject, AbstractAdapter abstractAdapter, String str) {
        if ((str.equalsIgnoreCase(IronSourceConstants.SUPERSONIC_CONFIG_NAME) || str.equalsIgnoreCase("IronSource")) && this.mDidIronSourceEarlyInit.compareAndSet(false, true)) {
            logInternal("SDK5 earlyInit  <" + str + ">");
            abstractAdapter.earlyInit(this.mAppKey, this.mUserId, jSONObject);
        }
    }

    private AbstractAdapter getAdapterByReflection(String str, String str2) {
        try {
            Class<?> cls = Class.forName("com.ironsource.adapters." + StringUtils.toLowerCase(str2) + "." + str2 + "Adapter");
            return (AbstractAdapter) cls.getMethod(IronSourceConstants.START_ADAPTER, String.class).invoke(cls, str);
        } catch (Exception e) {
            logErrorInternal("Error while loading adapter - exception = " + e);
            return null;
        }
    }

    private void logErrorInternal(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "AdapterRepository: " + str, 3);
    }

    private void logInternal(String str) {
        IronSourceLoggerManager.getLogger().log(IronSourceLogger.IronSourceTag.INTERNAL, "AdapterRepository: " + str, 0);
    }

    public void setAdaptersDebug(boolean z) {
        synchronized (lock) {
            this.mAdapterDebug = Boolean.valueOf(z);
            Iterator<AbstractAdapter> it = this.adapters.values().iterator();
            while (it.hasNext()) {
                setAdaptersDebug(it.next());
            }
        }
    }

    private void setAdaptersDebug(AbstractAdapter abstractAdapter) {
        Boolean bool = this.mAdapterDebug;
        if (bool != null) {
            try {
                abstractAdapter.setAdapterDebug(bool);
            } catch (Throwable th) {
                logInternal("error while setting adapterDebug of " + abstractAdapter.getProviderName() + ": " + th.getLocalizedMessage());
                th.printStackTrace();
            }
        }
    }

    public void setMetaData(String str, List<String> list) {
        synchronized (lock) {
            this.mMetaData.put(str, list);
            for (AbstractAdapter abstractAdapter : this.adapters.values()) {
                try {
                    abstractAdapter.setMetaData(str, list);
                } catch (Throwable th) {
                    logInternal("error while setting metadata of " + abstractAdapter.getProviderName() + ": " + th.getLocalizedMessage());
                    th.printStackTrace();
                }
            }
        }
    }

    private void setMetaData(AbstractAdapter abstractAdapter) {
        for (String str : this.mMetaData.keySet()) {
            try {
                abstractAdapter.setMetaData(str, this.mMetaData.get(str));
            } catch (Throwable th) {
                logInternal("error while setting metadata of " + abstractAdapter.getProviderName() + ": " + th.getLocalizedMessage());
                th.printStackTrace();
            }
        }
    }

    public ConcurrentHashMap<String, List<String>> getMetaData() {
        return this.mMetaData;
    }

    private String getAdapterKey(ProviderSettings providerSettings) {
        return providerSettings.isMultipleInstances() ? providerSettings.getProviderTypeForReflection() : providerSettings.getProviderName();
    }

    private Set<AbstractAdapter> getUniqueAdapters() {
        TreeSet treeSet = new TreeSet(new Comparator<AbstractAdapter>() { // from class: com.ironsource.mediationsdk.AdapterRepository.1
            @Override // java.util.Comparator
            public int compare(AbstractAdapter abstractAdapter, AbstractAdapter abstractAdapter2) {
                return abstractAdapter.getClass().getSimpleName().compareTo(abstractAdapter2.getClass().getSimpleName());
            }
        });
        treeSet.addAll(this.adapters.values());
        return treeSet;
    }
}
