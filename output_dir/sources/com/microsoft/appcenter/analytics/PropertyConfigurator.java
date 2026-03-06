package com.microsoft.appcenter.analytics;

import android.provider.Settings;
import com.microsoft.appcenter.channel.AbstractChannelListener;
import com.microsoft.appcenter.ingestion.models.Log;
import com.microsoft.appcenter.ingestion.models.one.AppExtension;
import com.microsoft.appcenter.ingestion.models.one.CommonSchemaLog;
import com.microsoft.appcenter.ingestion.models.one.DeviceExtension;
import com.microsoft.appcenter.ingestion.models.one.UserExtension;
import com.microsoft.appcenter.ingestion.models.properties.TypedProperty;
import com.microsoft.appcenter.utils.context.UserIdContext;
import java.util.Date;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class PropertyConfigurator extends AbstractChannelListener {
    private static final String ANDROID_DEVICE_ID_PREFIX = "a:";
    private String mAppLocale;
    private String mAppName;
    private String mAppVersion;
    private boolean mDeviceIdEnabled;
    private final EventProperties mEventProperties = new EventProperties();
    private final AnalyticsTransmissionTarget mTransmissionTarget;
    private String mUserId;

    PropertyConfigurator(AnalyticsTransmissionTarget transmissionTarget) {
        this.mTransmissionTarget = transmissionTarget;
    }

    @Override // com.microsoft.appcenter.channel.AbstractChannelListener, com.microsoft.appcenter.channel.Channel.Listener
    public void onPreparingLog(Log log, String groupName) {
        if (shouldOverridePartAProperties(log)) {
            CommonSchemaLog commonSchemaLog = (CommonSchemaLog) log;
            AppExtension app = commonSchemaLog.getExt().getApp();
            UserExtension user = commonSchemaLog.getExt().getUser();
            DeviceExtension device = commonSchemaLog.getExt().getDevice();
            String str = this.mAppName;
            if (str != null) {
                app.setName(str);
            } else {
                AnalyticsTransmissionTarget analyticsTransmissionTarget = this.mTransmissionTarget;
                while (true) {
                    analyticsTransmissionTarget = analyticsTransmissionTarget.mParentTarget;
                    if (analyticsTransmissionTarget == null) {
                        break;
                    }
                    String appName = analyticsTransmissionTarget.getPropertyConfigurator().getAppName();
                    if (appName != null) {
                        app.setName(appName);
                        break;
                    }
                }
            }
            String str2 = this.mAppVersion;
            if (str2 != null) {
                app.setVer(str2);
            } else {
                AnalyticsTransmissionTarget analyticsTransmissionTarget2 = this.mTransmissionTarget;
                while (true) {
                    analyticsTransmissionTarget2 = analyticsTransmissionTarget2.mParentTarget;
                    if (analyticsTransmissionTarget2 == null) {
                        break;
                    }
                    String appVersion = analyticsTransmissionTarget2.getPropertyConfigurator().getAppVersion();
                    if (appVersion != null) {
                        app.setVer(appVersion);
                        break;
                    }
                }
            }
            String str3 = this.mAppLocale;
            if (str3 != null) {
                app.setLocale(str3);
            } else {
                AnalyticsTransmissionTarget analyticsTransmissionTarget3 = this.mTransmissionTarget;
                while (true) {
                    analyticsTransmissionTarget3 = analyticsTransmissionTarget3.mParentTarget;
                    if (analyticsTransmissionTarget3 == null) {
                        break;
                    }
                    String appLocale = analyticsTransmissionTarget3.getPropertyConfigurator().getAppLocale();
                    if (appLocale != null) {
                        app.setLocale(appLocale);
                        break;
                    }
                }
            }
            String str4 = this.mUserId;
            if (str4 != null) {
                user.setLocalId(str4);
            } else {
                AnalyticsTransmissionTarget analyticsTransmissionTarget4 = this.mTransmissionTarget;
                while (true) {
                    analyticsTransmissionTarget4 = analyticsTransmissionTarget4.mParentTarget;
                    if (analyticsTransmissionTarget4 == null) {
                        break;
                    }
                    String userId = analyticsTransmissionTarget4.getPropertyConfigurator().getUserId();
                    if (userId != null) {
                        user.setLocalId(userId);
                        break;
                    }
                }
            }
            if (this.mDeviceIdEnabled) {
                device.setLocalId(ANDROID_DEVICE_ID_PREFIX + Settings.Secure.getString(this.mTransmissionTarget.mContext.getContentResolver(), "android_id"));
            }
        }
    }

    private boolean shouldOverridePartAProperties(Log log) {
        if (log instanceof CommonSchemaLog) {
            Object tag = log.getTag();
            AnalyticsTransmissionTarget analyticsTransmissionTarget = this.mTransmissionTarget;
            if (tag == analyticsTransmissionTarget && analyticsTransmissionTarget.isEnabled()) {
                return true;
            }
        }
        return false;
    }

    private String getAppName() {
        return this.mAppName;
    }

    public void setAppName(final String appName) {
        Analytics.getInstance().postCommandEvenIfDisabled(new Runnable() { // from class: com.microsoft.appcenter.analytics.PropertyConfigurator.1
            @Override // java.lang.Runnable
            public void run() {
                PropertyConfigurator.this.mAppName = appName;
            }
        });
    }

    private String getAppVersion() {
        return this.mAppVersion;
    }

    public void setAppVersion(final String appVersion) {
        Analytics.getInstance().postCommandEvenIfDisabled(new Runnable() { // from class: com.microsoft.appcenter.analytics.PropertyConfigurator.2
            @Override // java.lang.Runnable
            public void run() {
                PropertyConfigurator.this.mAppVersion = appVersion;
            }
        });
    }

    private String getAppLocale() {
        return this.mAppLocale;
    }

    public void setAppLocale(final String appLocale) {
        Analytics.getInstance().postCommandEvenIfDisabled(new Runnable() { // from class: com.microsoft.appcenter.analytics.PropertyConfigurator.3
            @Override // java.lang.Runnable
            public void run() {
                PropertyConfigurator.this.mAppLocale = appLocale;
            }
        });
    }

    private String getUserId() {
        return this.mUserId;
    }

    public void setUserId(final String userId) {
        if (UserIdContext.checkUserIdValidForOneCollector(userId)) {
            Analytics.getInstance().postCommandEvenIfDisabled(new Runnable() { // from class: com.microsoft.appcenter.analytics.PropertyConfigurator.4
                @Override // java.lang.Runnable
                public void run() {
                    PropertyConfigurator.this.mUserId = UserIdContext.getPrefixedUserId(userId);
                }
            });
        }
    }

    public synchronized void setEventProperty(String key, boolean value) {
        this.mEventProperties.set(key, value);
    }

    public synchronized void setEventProperty(String key, Date value) {
        this.mEventProperties.set(key, value);
    }

    public synchronized void setEventProperty(String key, double value) {
        this.mEventProperties.set(key, value);
    }

    public synchronized void setEventProperty(String key, long value) {
        this.mEventProperties.set(key, value);
    }

    public synchronized void setEventProperty(String key, String value) {
        this.mEventProperties.set(key, value);
    }

    public synchronized void removeEventProperty(String key) {
        this.mEventProperties.getProperties().remove(key);
    }

    public void collectDeviceId() {
        Analytics.getInstance().postCommandEvenIfDisabled(new Runnable() { // from class: com.microsoft.appcenter.analytics.PropertyConfigurator.5
            @Override // java.lang.Runnable
            public void run() {
                PropertyConfigurator.this.mDeviceIdEnabled = true;
            }
        });
    }

    synchronized void mergeEventProperties(EventProperties mergedProperties) {
        for (Map.Entry<String, TypedProperty> entry : this.mEventProperties.getProperties().entrySet()) {
            String key = entry.getKey();
            if (!mergedProperties.getProperties().containsKey(key)) {
                mergedProperties.getProperties().put(key, entry.getValue());
            }
        }
    }
}
