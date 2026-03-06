package com.helpshift.localeprovider.domainmodel;

import com.helpshift.common.platform.Device;
import com.helpshift.common.platform.Platform;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.util.StringUtils;
import java.util.Locale;

/* JADX INFO: loaded from: classes2.dex */
public class LocaleProviderDM {
    private Device device;
    private Locale previousLocale;
    private SDKConfigurationDM sdkConfigurationDM;

    public LocaleProviderDM(SDKConfigurationDM sDKConfigurationDM, Platform platform) {
        this.sdkConfigurationDM = sDKConfigurationDM;
        this.device = platform.getDevice();
    }

    public void backupApplicationLocale() {
        if (this.previousLocale == null) {
            this.previousLocale = this.device.getLocale();
        }
    }

    public void restoreApplicationLocale() {
        Locale locale = this.previousLocale;
        if (locale != null) {
            this.device.changeLocale(locale);
            this.previousLocale = null;
        }
    }

    public Locale getCurrentLocale() {
        Locale locale;
        String string = this.sdkConfigurationDM.getString(SDKConfigurationDM.SDK_LANGUAGE);
        if (StringUtils.isEmpty(string)) {
            return Locale.getDefault();
        }
        if (string.contains("_")) {
            String[] strArrSplit = string.split("_");
            locale = new Locale(strArrSplit[0], strArrSplit[1]);
        } else {
            locale = new Locale(string);
        }
        return locale;
    }

    public Locale getCurrentLocaleFromStorage() {
        String string = this.sdkConfigurationDM.getString(SDKConfigurationDM.SDK_LANGUAGE);
        if (StringUtils.isEmpty(string)) {
            return null;
        }
        if (string.contains("_")) {
            String[] strArrSplit = string.split("_");
            return new Locale(strArrSplit[0], strArrSplit[1]);
        }
        return new Locale(string);
    }

    public String getSDKLanguage() {
        String string = this.sdkConfigurationDM.getString(SDKConfigurationDM.SDK_LANGUAGE);
        return StringUtils.isEmpty(string) ? "" : string;
    }

    public String getDefaultLanguage() {
        return Locale.getDefault().toString();
    }
}
