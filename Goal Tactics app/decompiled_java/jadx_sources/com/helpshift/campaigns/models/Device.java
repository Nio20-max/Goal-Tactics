package com.helpshift.campaigns.models;

/* JADX INFO: loaded from: classes.dex */
public interface Device {
    String getAppVersion();

    String getBuildModel();

    String getCarrierName();

    String getCountryCode();

    String getLanguageCode();

    String getOsVersion();

    Integer getTimeZone();
}
