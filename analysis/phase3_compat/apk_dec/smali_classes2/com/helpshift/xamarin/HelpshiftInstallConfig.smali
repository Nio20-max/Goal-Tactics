.class public Lcom/helpshift/xamarin/HelpshiftInstallConfig;
.super Ljava/lang/Object;
.source "HelpshiftInstallConfig.java"


# instance fields
.field public final campaignsNotificationChannelId:Ljava/lang/String;

.field public final disableErrorReporting:Z

.field public final enableDefaultFallbackLanguage:Z

.field public final enableInAppNotification:Z

.field public final enableInboxPolling:Z

.field public final enableLogging:Z

.field public final extrasJson:Ljava/lang/String;

.field public final fontPath:Ljava/lang/String;

.field public final largeNotificationIcon:I

.field public final notificationIcon:I

.field public final notificationSound:I

.field public final screenOrientation:I

.field public final supportNotificationChannelId:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZIIIZZLjava/lang/String;ZILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-boolean p1, p0, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->enableInAppNotification:Z

    .line 28
    iput p2, p0, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->notificationIcon:I

    .line 29
    iput p3, p0, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->largeNotificationIcon:I

    .line 30
    iput p4, p0, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->notificationSound:I

    .line 31
    iput-boolean p5, p0, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->enableDefaultFallbackLanguage:Z

    .line 32
    iput-boolean p6, p0, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->enableInboxPolling:Z

    .line 33
    iput-object p7, p0, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->fontPath:Ljava/lang/String;

    .line 34
    iput-boolean p8, p0, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->enableLogging:Z

    .line 35
    iput p9, p0, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->screenOrientation:I

    .line 36
    iput-object p10, p0, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->supportNotificationChannelId:Ljava/lang/String;

    .line 37
    iput-object p11, p0, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->campaignsNotificationChannelId:Ljava/lang/String;

    .line 38
    iput-boolean p12, p0, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->disableErrorReporting:Z

    .line 39
    iput-object p13, p0, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->extrasJson:Ljava/lang/String;

    return-void
.end method
