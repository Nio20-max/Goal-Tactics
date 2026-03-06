package com.microsoft.appcenter.utils.storage;

import android.content.Context;
import android.content.SharedPreferences;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class SharedPreferencesManager {
    private static final String PREFERENCES_NAME = "AppCenter";
    private static Context sContext;
    private static SharedPreferences sSharedPreferences;

    public static synchronized void initialize(Context context) {
        if (sContext == null) {
            sContext = context;
            sSharedPreferences = context.getSharedPreferences("AppCenter", 0);
        }
    }

    public static boolean getBoolean(String key) {
        return getBoolean(key, false);
    }

    public static boolean getBoolean(String key, boolean defValue) {
        return sSharedPreferences.getBoolean(key, defValue);
    }

    public static void putBoolean(String key, boolean value) {
        SharedPreferences.Editor editorEdit = sSharedPreferences.edit();
        editorEdit.putBoolean(key, value);
        editorEdit.apply();
    }

    public static float getFloat(String key) {
        return getFloat(key, 0.0f);
    }

    public static float getFloat(String key, float defValue) {
        return sSharedPreferences.getFloat(key, defValue);
    }

    public static void putFloat(String key, float value) {
        SharedPreferences.Editor editorEdit = sSharedPreferences.edit();
        editorEdit.putFloat(key, value);
        editorEdit.apply();
    }

    public static int getInt(String key) {
        return getInt(key, 0);
    }

    public static int getInt(String key, int defValue) {
        return sSharedPreferences.getInt(key, defValue);
    }

    public static void putInt(String key, int value) {
        SharedPreferences.Editor editorEdit = sSharedPreferences.edit();
        editorEdit.putInt(key, value);
        editorEdit.apply();
    }

    public static long getLong(String key) {
        return getLong(key, 0L);
    }

    public static long getLong(String key, long defValue) {
        return sSharedPreferences.getLong(key, defValue);
    }

    public static void putLong(String key, long value) {
        SharedPreferences.Editor editorEdit = sSharedPreferences.edit();
        editorEdit.putLong(key, value);
        editorEdit.apply();
    }

    public static String getString(String key) {
        return getString(key, null);
    }

    public static String getString(String key, String defValue) {
        return sSharedPreferences.getString(key, defValue);
    }

    public static void putString(String key, String value) {
        SharedPreferences.Editor editorEdit = sSharedPreferences.edit();
        editorEdit.putString(key, value);
        editorEdit.apply();
    }

    public static Set<String> getStringSet(String key) {
        return getStringSet(key, null);
    }

    public static Set<String> getStringSet(String key, Set<String> defValue) {
        return sSharedPreferences.getStringSet(key, defValue);
    }

    public static void putStringSet(String key, Set<String> value) {
        SharedPreferences.Editor editorEdit = sSharedPreferences.edit();
        editorEdit.putStringSet(key, value);
        editorEdit.apply();
    }

    public static void remove(String key) {
        SharedPreferences.Editor editorEdit = sSharedPreferences.edit();
        editorEdit.remove(key);
        editorEdit.apply();
    }

    public static void clear() {
        SharedPreferences.Editor editorEdit = sSharedPreferences.edit();
        editorEdit.clear();
        editorEdit.apply();
    }
}
