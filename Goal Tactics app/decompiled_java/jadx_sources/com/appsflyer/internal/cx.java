package com.appsflyer.internal;

import android.content.Context;
import androidx.core.app.NotificationCompat;
import com.android.installreferrer.api.InstallReferrerClient;
import com.android.installreferrer.api.InstallReferrerStateListener;
import com.android.installreferrer.api.ReferrerDetails;
import com.appsflyer.AFLogger;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class cx extends dd {
    public final Map<String, Object> valueOf;

    public cx(Runnable runnable) {
        super("google", runnable);
        this.valueOf = new HashMap();
    }

    private static boolean AFKeystoreWrapper(Context context) {
        if (ac.AFInAppEventParameterName().valueOf(ac.AFInAppEventType(context), false) > 0) {
            AFLogger.AFKeystoreWrapper("Install referrer will not load, the counter > 1, ");
            return false;
        }
        try {
            Class.forName("com.android.installreferrer.api.InstallReferrerClient");
            if (z.AFInAppEventType(context, "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE")) {
                AFLogger.AFInAppEventParameterName("Install referrer is allowed");
                return true;
            }
            AFLogger.AFInAppEventParameterName("Install referrer is not allowed");
            return false;
        } catch (ClassNotFoundException unused) {
            StringBuilder sb = new StringBuilder("Class ");
            sb.append("com.android.installreferrer.api.InstallReferrerClient");
            sb.append(" not found");
            AFLogger.AFKeystoreWrapper(sb.toString());
            return false;
        } catch (Throwable th) {
            AFLogger.valueOf("An error occurred while trying to verify manifest : ".concat("com.android.installreferrer.api.InstallReferrerClient"), th);
            return false;
        }
    }

    @Override // com.appsflyer.internal.dd
    public final void AFInAppEventParameterName(final Context context) {
        if (AFKeystoreWrapper(context)) {
            values();
            try {
                final InstallReferrerClient installReferrerClientBuild = InstallReferrerClient.newBuilder(context).build();
                AFLogger.AFInAppEventParameterName("Connecting to Install Referrer Library...");
                installReferrerClientBuild.startConnection(new InstallReferrerStateListener() { // from class: com.appsflyer.internal.cx.5
                    @Override // com.android.installreferrer.api.InstallReferrerStateListener
                    public final void onInstallReferrerSetupFinished(int i) {
                        cx.this.valueOf.put("code", String.valueOf(i));
                        cx.this.AFInAppEventType.put("api_ver", Long.valueOf(z.values(context, "com.android.vending")));
                        cx.this.AFInAppEventType.put("api_ver_name", z.AFKeystoreWrapper(context, "com.android.vending"));
                        if (i == -1) {
                            AFLogger.AppsFlyer2dXConversionCallback("InstallReferrer SERVICE_DISCONNECTED");
                            cx.this.AFInAppEventType.put("response", "SERVICE_DISCONNECTED");
                        } else if (i == 0) {
                            cx.this.AFInAppEventType.put("response", "OK");
                            try {
                                AFLogger.AFInAppEventParameterName("InstallReferrer connected");
                                if (installReferrerClientBuild.isReady()) {
                                    ReferrerDetails installReferrer = installReferrerClientBuild.getInstallReferrer();
                                    String installReferrer2 = installReferrer.getInstallReferrer();
                                    if (installReferrer2 != null) {
                                        cx.this.valueOf.put("val", installReferrer2);
                                        cx.this.AFInAppEventType.put("referrer", installReferrer2);
                                    }
                                    long referrerClickTimestampSeconds = installReferrer.getReferrerClickTimestampSeconds();
                                    cx.this.valueOf.put("clk", Long.toString(referrerClickTimestampSeconds));
                                    cx.this.AFInAppEventType.put("click_ts", Long.valueOf(referrerClickTimestampSeconds));
                                    long installBeginTimestampSeconds = installReferrer.getInstallBeginTimestampSeconds();
                                    cx.this.valueOf.put("install", Long.toString(installBeginTimestampSeconds));
                                    cx.this.AFInAppEventType.put("install_begin_ts", Long.valueOf(installBeginTimestampSeconds));
                                    HashMap map = new HashMap();
                                    try {
                                        boolean googlePlayInstantParam = installReferrer.getGooglePlayInstantParam();
                                        cx.this.valueOf.put("instant", Boolean.valueOf(googlePlayInstantParam));
                                        map.put("instant", Boolean.valueOf(googlePlayInstantParam));
                                    } catch (NoSuchMethodError unused) {
                                    }
                                    try {
                                        map.put("click_server_ts", Long.valueOf(installReferrer.getReferrerClickTimestampServerSeconds()));
                                        map.put("install_begin_server_ts", Long.valueOf(installReferrer.getInstallBeginTimestampServerSeconds()));
                                        map.put("install_version", installReferrer.getInstallVersion());
                                    } catch (NoSuchMethodError unused2) {
                                    }
                                    if (!map.isEmpty()) {
                                        cx.this.AFInAppEventType.put("google_custom", map);
                                    }
                                } else {
                                    AFLogger.AppsFlyer2dXConversionCallback("ReferrerClient: InstallReferrer is not ready");
                                    cx.this.valueOf.put(NotificationCompat.CATEGORY_ERROR, "ReferrerClient: InstallReferrer is not ready");
                                }
                            } catch (Throwable th) {
                                AFLogger.AppsFlyer2dXConversionCallback("Failed to get install referrer: " + th.getMessage());
                                cx.this.valueOf.put(NotificationCompat.CATEGORY_ERROR, th.getMessage());
                            }
                        } else if (i == 1) {
                            cx.this.AFInAppEventType.put("response", "SERVICE_UNAVAILABLE");
                            AFLogger.AppsFlyer2dXConversionCallback("InstallReferrer not supported");
                        } else if (i == 2) {
                            AFLogger.AppsFlyer2dXConversionCallback("InstallReferrer FEATURE_NOT_SUPPORTED");
                            cx.this.AFInAppEventType.put("response", "FEATURE_NOT_SUPPORTED");
                        } else if (i == 3) {
                            AFLogger.AppsFlyer2dXConversionCallback("InstallReferrer DEVELOPER_ERROR");
                            cx.this.AFInAppEventType.put("response", "DEVELOPER_ERROR");
                        } else {
                            AFLogger.AppsFlyer2dXConversionCallback("responseCode not found.");
                        }
                        AFLogger.AFInAppEventParameterName("Install Referrer collected locally");
                        cx.this.valueOf();
                        installReferrerClientBuild.endConnection();
                    }

                    @Override // com.android.installreferrer.api.InstallReferrerStateListener
                    public final void onInstallReferrerServiceDisconnected() {
                        AFLogger.AFInAppEventParameterName("Install Referrer service disconnected");
                    }
                });
            } catch (Throwable th) {
                AFLogger.valueOf("referrerClient -> startConnection", th);
            }
        }
    }
}
