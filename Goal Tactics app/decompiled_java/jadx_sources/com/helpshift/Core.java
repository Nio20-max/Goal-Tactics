package com.helpshift;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.helpshift.HelpshiftUser;
import com.helpshift.exceptions.InstallException;
import com.helpshift.executors.ActionExecutor;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class Core {

    public interface ApiProvider {
        boolean _clearAnonymousUser();

        ActionExecutor _getActionExecutor();

        void _handlePush(Context context, Intent intent);

        void _install(Application application, String str, String str2, String str3);

        void _install(Application application, String str, String str2, String str3, Map<String, Object> map);

        boolean _login(HelpshiftUser helpshiftUser);

        boolean _logout();

        void _preInstall(Application application, String str, String str2, String str3, Map<String, Object> map);

        void _registerDeviceToken(Context context, String str);

        void _setNameAndEmail(String str, String str2);

        void _setSDKLanguage(String str);

        void _setTheme(int i);
    }

    public static void init(ApiProvider apiProvider) {
        CoreInternal.init(apiProvider);
    }

    @Deprecated
    public static void setNameAndEmail(String str, String str2) {
        CoreInternal.setNameAndEmail(str, str2);
    }

    public static void install(Application application, String str, String str2, String str3) throws InstallException {
        install(application, str, str2, str3, new HashMap());
    }

    @Deprecated
    public static void install(Application application, String str, String str2, String str3, Map<String, Object> map) throws InstallException {
        CoreInternal.install(application, str, str2, str3, map);
    }

    public static void install(Application application, String str, String str2, String str3, InstallConfig installConfig) throws InstallException {
        HashMap map = new HashMap();
        if (installConfig != null) {
            map.putAll(installConfig.toMap());
        }
        install(application, str, str2, str3, map);
    }

    public static void registerDeviceToken(Context context, String str) {
        CoreInternal.registerDeviceToken(context, str);
    }

    public static void handlePush(Context context, Intent intent) {
        CoreInternal.handlePush(context, intent);
    }

    public static void handlePush(Context context, Bundle bundle) {
        CoreInternal.handlePush(context, bundle);
    }

    public static void handlePush(Context context, Map<String, String> map) {
        CoreInternal.handlePush(context, map);
    }

    @Deprecated
    public static void login(String str, String str2, String str3) {
        CoreInternal.login(new HelpshiftUser.Builder(str, str3).setName(str2).build());
    }

    public static void login(HelpshiftUser helpshiftUser) {
        CoreInternal.login(helpshiftUser);
    }

    public static void logout() {
        CoreInternal.logout();
    }

    public static void clearAnonymousUser() {
        CoreInternal.clearAnonymousUser();
    }

    public static void setSDKLanguage(String str) {
        CoreInternal.setSDKLanguage(str);
    }

    public static void setTheme(int i) {
        CoreInternal.setTheme(i);
    }
}
