package com.helpshift.xamarin;

/* JADX INFO: loaded from: classes2.dex */
public class HelpshiftInstallConfig {
    public final String campaignsNotificationChannelId;
    public final boolean disableErrorReporting;
    public final boolean enableDefaultFallbackLanguage;
    public final boolean enableInAppNotification;
    public final boolean enableInboxPolling;
    public final boolean enableLogging;
    public final String extrasJson;
    public final String fontPath;
    public final int largeNotificationIcon;
    public final int notificationIcon;
    public final int notificationSound;
    public final int screenOrientation;
    public final String supportNotificationChannelId;

    public HelpshiftInstallConfig(boolean z, int i, int i2, int i3, boolean z2, boolean z3, String str, boolean z4, int i4, String str2, String str3, boolean z5, String str4) {
        this.enableInAppNotification = z;
        this.notificationIcon = i;
        this.largeNotificationIcon = i2;
        this.notificationSound = i3;
        this.enableDefaultFallbackLanguage = z2;
        this.enableInboxPolling = z3;
        this.fontPath = str;
        this.enableLogging = z4;
        this.screenOrientation = i4;
        this.supportNotificationChannelId = str2;
        this.campaignsNotificationChannelId = str3;
        this.disableErrorReporting = z5;
        this.extrasJson = str4;
    }
}
