package com.helpshift.campaigns.models;

import android.content.Context;
import android.os.Build;
import android.telephony.TelephonyManager;
import com.helpshift.util.ApplicationUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.LocaleUtil;
import com.helpshift.util.TextUtils;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.TimeZone;

/* JADX INFO: loaded from: classes.dex */
public class AndroidDevice implements Device {
    private static final String TAG = "Helpshift_AndroidDevice";

    @Override // com.helpshift.campaigns.models.Device
    public String getOsVersion() {
        return Build.VERSION.RELEASE;
    }

    @Override // com.helpshift.campaigns.models.Device
    public String getBuildModel() {
        return Build.MODEL;
    }

    @Override // com.helpshift.campaigns.models.Device
    public String getAppVersion() {
        return ApplicationUtil.getApplicationVersion(HelpshiftContext.getApplicationContext());
    }

    @Override // com.helpshift.campaigns.models.Device
    public String getCountryCode() {
        String networkCountryIso;
        String country;
        Context applicationContext = HelpshiftContext.getApplicationContext();
        TelephonyManager telephonyManager = (TelephonyManager) applicationContext.getSystemService("phone");
        networkCountryIso = "";
        if (telephonyManager != null) {
            networkCountryIso = telephonyManager.getPhoneType() != 2 ? telephonyManager.getNetworkCountryIso() : "";
            if (TextUtils.isEmpty(networkCountryIso)) {
                networkCountryIso = telephonyManager.getSimCountryIso();
            }
        }
        return (!TextUtils.isEmpty(networkCountryIso) || (country = LocaleUtil.getCountry(applicationContext)) == null) ? networkCountryIso : country.toLowerCase();
    }

    @Override // com.helpshift.campaigns.models.Device
    public String getLanguageCode() {
        try {
            return Locale.getDefault().toString();
        } catch (MissingResourceException e) {
            HSLogger.d(TAG, "Device Info - MissingResourceException", e);
            return null;
        }
    }

    @Override // com.helpshift.campaigns.models.Device
    public String getCarrierName() {
        TelephonyManager telephonyManager = (TelephonyManager) HelpshiftContext.getApplicationContext().getSystemService("phone");
        return telephonyManager == null ? "" : telephonyManager.getNetworkOperatorName();
    }

    @Override // com.helpshift.campaigns.models.Device
    public Integer getTimeZone() {
        return Integer.valueOf(TimeZone.getDefault().getOffset(System.currentTimeMillis()) / 60000);
    }
}
