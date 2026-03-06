package com.helpshift.campaigns.storage;

import android.content.Context;
import android.content.SharedPreferences;
import com.helpshift.constants.CommonSharedPrefrences;

/* JADX INFO: loaded from: classes.dex */
public class CampaignsSharedPrefs {
    public static final String SHARED_PREF_NAME = "HSCampaignsSharedPref";
    private static CampaignsSharedPrefs campaignsSharedPrefs;
    private final SharedPreferences sharedPreferences;

    private CampaignsSharedPrefs(Context context) {
        this.sharedPreferences = context.getSharedPreferences(SHARED_PREF_NAME, 0);
    }

    public static synchronized CampaignsSharedPrefs getInstance(Context context) {
        if (campaignsSharedPrefs == null) {
            campaignsSharedPrefs = new CampaignsSharedPrefs(context);
        }
        return campaignsSharedPrefs;
    }

    public String getCurrentSDKVersion() {
        return this.sharedPreferences.getString(CommonSharedPrefrences.LIBRARY_VERSION, "");
    }

    public void setCurrentSDKVersion(String str) {
        this.sharedPreferences.edit().putString(CommonSharedPrefrences.LIBRARY_VERSION, str).commit();
    }
}
