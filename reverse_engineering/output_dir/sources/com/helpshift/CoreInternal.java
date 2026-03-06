package com.helpshift;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import com.helpshift.Core;
import com.helpshift.applifecycle.HSAppLifeCycleController;
import com.helpshift.common.HelpshiftUtils;
import com.helpshift.exceptions.HelpshiftInitializationException;
import com.helpshift.exceptions.InstallException;
import com.helpshift.exceptions.handlers.UncaughtExceptionHandler;
import com.helpshift.executors.ActionExecutor;
import com.helpshift.logger.Logger;
import com.helpshift.logger.logmodels.LogExtrasModelFactory;
import com.helpshift.logger.logmodels.LogExtrasModelProvider;
import com.helpshift.static_classes.ErrorReporting;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.SchemaUtil;
import com.helpshift.util.TextUtils;
import com.helpshift.util.concurrent.ApiExecutor;
import com.helpshift.util.concurrent.ApiExecutorFactory;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class CoreInternal {
    private static final String TAG = "Helpshift_CoreInternal";
    static Core.ApiProvider apiProvider;

    public static void init(Core.ApiProvider apiProvider2) {
        apiProvider = apiProvider2;
    }

    protected static void verifyInit() {
        if (apiProvider == null) {
            throw new HelpshiftInitializationException("com.helpshift.Core.init() method not called with valid arguments");
        }
    }

    public static void setNameAndEmail(final String str, final String str2) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.CoreInternal.1
                @Override // java.lang.Runnable
                public void run() {
                    CoreInternal.apiProvider._setNameAndEmail(str, str2);
                }
            });
        }
    }

    public static void install(Application application, String str, String str2, String str3) throws InstallException {
        install(application, str, str2, str3, new HashMap());
    }

    public static void install(final Application application, String str, final String str2, String str3, final Map map) throws InstallException {
        verifyInit();
        if (!TextUtils.isEmpty(str)) {
            str = str.trim();
        }
        String strTrim = !TextUtils.isEmpty(str2) ? str2.trim() : str2;
        if (!TextUtils.isEmpty(str3)) {
            str3 = str3.trim();
        }
        SchemaUtil.validateInstallCredentials(str, strTrim, str3);
        ApiExecutor handlerExecutor = ApiExecutorFactory.getHandlerExecutor();
        final String str4 = str;
        final String str5 = strTrim;
        final String str6 = str3;
        handlerExecutor.runSync(new Runnable() { // from class: com.helpshift.CoreInternal.2
            @Override // java.lang.Runnable
            public void run() {
                if (HelpshiftContext.installCallSuccessful.get()) {
                    return;
                }
                CoreInternal.apiProvider._preInstall(application, str4, str5, str6, map);
            }
        });
        final String str7 = str;
        final String str8 = strTrim;
        final String str9 = str3;
        handlerExecutor.runAsync(new Runnable() { // from class: com.helpshift.CoreInternal.3
            @Override // java.lang.Runnable
            public void run() {
                if (HelpshiftContext.installCallSuccessful.get()) {
                    return;
                }
                CoreInternal.initLogging(application.getApplicationContext(), map);
                HSLogger.d(CoreInternal.TAG, "Helpshift install :\n Flavor : " + CoreInternal.apiProvider.getClass().getSimpleName() + "\n Domain : " + str2 + "\n Config : " + map.toString() + "\n Package Id : " + application.getPackageName() + "\n SDK version : 7.11.1\n OS version : " + Build.VERSION.SDK_INT + "\n Device : " + Build.DEVICE);
                CoreInternal.apiProvider._install(application, str7, str8, str9, map);
                HelpshiftContext.installCallSuccessful.compareAndSet(false, true);
                if (PluginEventBridge.shouldCallFirstForegroundEvent()) {
                    HSAppLifeCycleController.getInstance().onAppForeground(application.getApplicationContext());
                }
            }
        });
        HelpshiftContext.installAPICalled.compareAndSet(false, true);
    }

    public static void registerDeviceToken(final Context context, final String str) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.CoreInternal.4
                @Override // java.lang.Runnable
                public void run() {
                    HSLogger.d(CoreInternal.TAG, "Registering push token : " + str);
                    CoreInternal.apiProvider._registerDeviceToken(context, str);
                }
            });
        }
    }

    public static void handlePush(final Context context, final Intent intent) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.CoreInternal.5
                @Override // java.lang.Runnable
                public void run() {
                    HSLogger.d(CoreInternal.TAG, "Handling push");
                    CoreInternal.apiProvider._handlePush(context, intent);
                }
            });
        }
    }

    public static void handlePush(Context context, Bundle bundle) {
        Intent intent = new Intent();
        intent.putExtras(bundle);
        handlePush(context, intent);
    }

    public static void handlePush(Context context, Map<String, String> map) {
        if (map == null || map.size() == 0) {
            return;
        }
        Intent intent = new Intent();
        Bundle bundle = new Bundle();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            bundle.putString(entry.getKey(), entry.getValue());
        }
        intent.putExtras(bundle);
        handlePush(context, intent);
    }

    public static void login(final HelpshiftUser helpshiftUser) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.CoreInternal.6
                @Override // java.lang.Runnable
                public void run() {
                    if (HelpshiftUtils.isValidHelpshiftUser(helpshiftUser)) {
                        HSLogger.d(CoreInternal.TAG, "Login state changed : name : " + helpshiftUser.getName());
                        CoreInternal.apiProvider._login(helpshiftUser);
                        return;
                    }
                    HSLogger.d(CoreInternal.TAG, "Login called with invalid helpshift user,So calling Logout");
                    CoreInternal.apiProvider._logout();
                }
            });
        }
    }

    public static void logout() {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.CoreInternal.7
                @Override // java.lang.Runnable
                public void run() {
                    CoreInternal.apiProvider._logout();
                    HSLogger.d(CoreInternal.TAG, "Logged out.");
                }
            });
        }
    }

    public static void clearAnonymousUser() {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.CoreInternal.8
                @Override // java.lang.Runnable
                public void run() {
                    CoreInternal.apiProvider._clearAnonymousUser();
                    HSLogger.d(CoreInternal.TAG, "resetAnonymousUser API called");
                }
            });
        }
    }

    public static void setSDKLanguage(final String str) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.CoreInternal.9
                @Override // java.lang.Runnable
                public void run() {
                    HSLogger.d(CoreInternal.TAG, "Setting SDK language : " + str);
                    CoreInternal.apiProvider._setSDKLanguage(str);
                }
            });
        }
    }

    public static void setTheme(final int i) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.CoreInternal.10
                @Override // java.lang.Runnable
                public void run() {
                    HSLogger.d(CoreInternal.TAG, "Setting SDK theme : " + i);
                    CoreInternal.apiProvider._setTheme(i);
                }
            });
        }
    }

    public static void onAppForeground() {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.CoreInternal.11
                @Override // java.lang.Runnable
                public void run() {
                    HSLogger.d(CoreInternal.TAG, "Application foreground");
                    HSAppLifeCycleController.getInstance().onManualAppForegroundAPI();
                }
            });
        }
    }

    public static void onAppBackground() {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.CoreInternal.12
                @Override // java.lang.Runnable
                public void run() {
                    HSLogger.d(CoreInternal.TAG, "Application background");
                    HSAppLifeCycleController.getInstance().onManualAppBackgroundAPI();
                }
            });
        }
    }

    public static ActionExecutor getActionExecutor() {
        return apiProvider._getActionExecutor();
    }

    static void initLogging(Context context, Map map) {
        Object obj = map.get("enableLogging");
        boolean z = false;
        boolean z2 = (obj instanceof Boolean) && ((Boolean) obj).booleanValue();
        Object obj2 = map.get("disableErrorReporting");
        if ((obj2 instanceof Boolean) && ((Boolean) obj2).booleanValue()) {
            z = true;
        }
        float serverTimeDelta = HelpshiftContext.getPlatform().getNetworkRequestDAO().getServerTimeDelta();
        HSLogger.initialize(new Logger(context, HSLogger.LOG_STORE_DB_NAME, "7.11.1"), ApplicationUtil.isApplicationDebuggable(context) ? 2 : 4, HelpshiftContext.getCoreApi().getSDKConfigurationDM().getRequiredLogCachingLevel());
        LogExtrasModelProvider.initialize(new LogExtrasModelFactory());
        HSLogger.updateTimeStampDelta(serverTimeDelta);
        HSLogger.enableLogging(z2, !z);
        ErrorReporting.shouldEnable(!z);
        if (z) {
            return;
        }
        UncaughtExceptionHandler.init(context);
    }
}
