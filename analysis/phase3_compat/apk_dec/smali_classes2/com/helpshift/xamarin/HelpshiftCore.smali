.class public Lcom/helpshift/xamarin/HelpshiftCore;
.super Ljava/lang/Object;
.source "HelpshiftCore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/xamarin/HelpshiftCore$HSApiProviderIdentifier;
    }
.end annotation


# static fields
.field private static final PLUGIN_VERSION:Ljava/lang/String; = "3.6.1"

.field public static final TAG:Ljava/lang/String; = "Helpshift_XamHsCore"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildExtrasMap(Ljava/lang/String;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 111
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "sdkType"

    const-string v2, "xamarin"

    .line 112
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pluginVersion"

    const-string v2, "3.6.1"

    .line 113
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/helpshift/util/HSJSONUtils;->toMap(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v1, "Helpshift_XamHsCore"

    const-string v2, "buildExtrasMap"

    .line 117
    invoke-static {v1, v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-object v0
.end method

.method public static clearAnonymousUser()V
    .locals 0

    .line 177
    invoke-static {}, Lcom/helpshift/Core;->clearAnonymousUser()V

    return-void
.end method

.method public static handlePush(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 127
    invoke-static {p0, p1}, Lcom/helpshift/Core;->handlePush(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static handlePush(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 0

    .line 131
    invoke-static {p0, p1}, Lcom/helpshift/Core;->handlePush(Landroid/content/Context;Landroid/os/Bundle;)V

    return-void
.end method

.method public static handlePush(Landroid/content/Context;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 135
    invoke-static {p0, p1}, Lcom/helpshift/Core;->handlePush(Landroid/content/Context;Ljava/util/Map;)V

    return-void
.end method

.method public static init(I)V
    .locals 1

    .line 53
    sget v0, Lcom/helpshift/xamarin/HelpshiftCore$HSApiProviderIdentifier;->ALL:I

    if-ne p0, v0, :cond_0

    .line 54
    invoke-static {}, Lcom/helpshift/All;->getInstance()Lcom/helpshift/All;

    move-result-object p0

    goto :goto_0

    .line 55
    :cond_0
    sget v0, Lcom/helpshift/xamarin/HelpshiftCore$HSApiProviderIdentifier;->SUPPORT:I

    if-ne p0, v0, :cond_1

    .line 56
    invoke-static {}, Lcom/helpshift/support/Support;->getInstance()Lcom/helpshift/support/Support;

    move-result-object p0

    goto :goto_0

    .line 57
    :cond_1
    sget v0, Lcom/helpshift/xamarin/HelpshiftCore$HSApiProviderIdentifier;->CAMPAIGNS:I

    if-ne p0, v0, :cond_2

    .line 58
    invoke-static {}, Lcom/helpshift/campaigns/Campaigns;->getInstance()Lcom/helpshift/campaigns/Campaigns;

    move-result-object p0

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_3

    .line 65
    invoke-static {p0}, Lcom/helpshift/Core;->init(Lcom/helpshift/Core$ApiProvider;)V

    return-void

    .line 62
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Unknown provider identifier"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 73
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, p1, p2, p3, v0}, Lcom/helpshift/xamarin/HelpshiftCore;->install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/xamarin/HelpshiftInstallConfig;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 93
    new-instance v0, Lcom/helpshift/InstallConfig$Builder;

    invoke-direct {v0}, Lcom/helpshift/InstallConfig$Builder;-><init>()V

    iget-boolean v1, p4, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->enableInAppNotification:Z

    .line 94
    invoke-virtual {v0, v1}, Lcom/helpshift/InstallConfig$Builder;->setEnableInAppNotification(Z)Lcom/helpshift/InstallConfig$Builder;

    move-result-object v0

    iget v1, p4, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->notificationIcon:I

    .line 95
    invoke-virtual {v0, v1}, Lcom/helpshift/InstallConfig$Builder;->setNotificationIcon(I)Lcom/helpshift/InstallConfig$Builder;

    move-result-object v0

    iget v1, p4, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->largeNotificationIcon:I

    .line 96
    invoke-virtual {v0, v1}, Lcom/helpshift/InstallConfig$Builder;->setLargeNotificationIcon(I)Lcom/helpshift/InstallConfig$Builder;

    move-result-object v0

    iget v1, p4, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->notificationSound:I

    .line 97
    invoke-virtual {v0, v1}, Lcom/helpshift/InstallConfig$Builder;->setNotificationSound(I)Lcom/helpshift/InstallConfig$Builder;

    move-result-object v0

    iget-boolean v1, p4, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->enableDefaultFallbackLanguage:Z

    .line 98
    invoke-virtual {v0, v1}, Lcom/helpshift/InstallConfig$Builder;->setEnableDefaultFallbackLanguage(Z)Lcom/helpshift/InstallConfig$Builder;

    move-result-object v0

    iget-boolean v1, p4, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->enableInboxPolling:Z

    .line 99
    invoke-virtual {v0, v1}, Lcom/helpshift/InstallConfig$Builder;->setEnableInboxPolling(Z)Lcom/helpshift/InstallConfig$Builder;

    move-result-object v0

    iget-object v1, p4, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->fontPath:Ljava/lang/String;

    .line 100
    invoke-virtual {v0, v1}, Lcom/helpshift/InstallConfig$Builder;->setFont(Ljava/lang/String;)Lcom/helpshift/InstallConfig$Builder;

    move-result-object v0

    iget-boolean v1, p4, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->enableLogging:Z

    .line 101
    invoke-virtual {v0, v1}, Lcom/helpshift/InstallConfig$Builder;->setEnableLogging(Z)Lcom/helpshift/InstallConfig$Builder;

    move-result-object v0

    iget v1, p4, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->screenOrientation:I

    .line 102
    invoke-virtual {v0, v1}, Lcom/helpshift/InstallConfig$Builder;->setScreenOrientation(I)Lcom/helpshift/InstallConfig$Builder;

    move-result-object v0

    iget-object v1, p4, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->supportNotificationChannelId:Ljava/lang/String;

    .line 103
    invoke-virtual {v0, v1}, Lcom/helpshift/InstallConfig$Builder;->setSupportNotificationChannelId(Ljava/lang/String;)Lcom/helpshift/InstallConfig$Builder;

    move-result-object v0

    iget-object v1, p4, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->campaignsNotificationChannelId:Ljava/lang/String;

    .line 104
    invoke-virtual {v0, v1}, Lcom/helpshift/InstallConfig$Builder;->setCampaignsNotificationChannelId(Ljava/lang/String;)Lcom/helpshift/InstallConfig$Builder;

    move-result-object v0

    iget-boolean v1, p4, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->disableErrorReporting:Z

    .line 105
    invoke-virtual {v0, v1}, Lcom/helpshift/InstallConfig$Builder;->disableErrorReporting(Z)Lcom/helpshift/InstallConfig$Builder;

    move-result-object v0

    iget-object p4, p4, Lcom/helpshift/xamarin/HelpshiftInstallConfig;->extrasJson:Ljava/lang/String;

    .line 106
    invoke-static {p4}, Lcom/helpshift/xamarin/HelpshiftCore;->buildExtrasMap(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p4

    invoke-virtual {v0, p4}, Lcom/helpshift/InstallConfig$Builder;->setExtras(Ljava/util/Map;)Lcom/helpshift/InstallConfig$Builder;

    move-result-object p4

    .line 107
    invoke-virtual {p4}, Lcom/helpshift/InstallConfig$Builder;->build()Lcom/helpshift/InstallConfig;

    move-result-object p4

    .line 93
    invoke-static {p0, p1, p2, p3, p4}, Lcom/helpshift/Core;->install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/InstallConfig;)V

    return-void
.end method

.method public static install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 78
    invoke-static {p4}, Lcom/helpshift/xamarin/HelpshiftCore;->sanitizeConfigMap(Ljava/util/Map;)V

    .line 79
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    const-string v1, "enableInAppNotification"

    .line 80
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "enableDefaultFallbackLanguage"

    .line 81
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "disableHelpshiftBranding"

    .line 82
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "enableLogging"

    .line 83
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "disableErrorLogging"

    .line 84
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "disableErrorReporting"

    .line 85
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "enableInboxPolling"

    .line 86
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 87
    invoke-static {v0, p4}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->replaceWithBoolean(Ljava/util/HashSet;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p4

    .line 89
    invoke-static {p0, p1, p2, p3, p4}, Lcom/helpshift/Core;->install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static login(Lcom/helpshift/xamarin/WrappedHelpshiftUser;)V
    .locals 3

    .line 181
    new-instance v0, Lcom/helpshift/HelpshiftUser$Builder;

    iget-object v1, p0, Lcom/helpshift/xamarin/WrappedHelpshiftUser;->identifier:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/xamarin/WrappedHelpshiftUser;->email:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/helpshift/HelpshiftUser$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/helpshift/xamarin/WrappedHelpshiftUser;->name:Ljava/lang/String;

    .line 182
    invoke-virtual {v0, v1}, Lcom/helpshift/HelpshiftUser$Builder;->setName(Ljava/lang/String;)Lcom/helpshift/HelpshiftUser$Builder;

    move-result-object v0

    iget-object p0, p0, Lcom/helpshift/xamarin/WrappedHelpshiftUser;->authToken:Ljava/lang/String;

    .line 183
    invoke-virtual {v0, p0}, Lcom/helpshift/HelpshiftUser$Builder;->setAuthToken(Ljava/lang/String;)Lcom/helpshift/HelpshiftUser$Builder;

    move-result-object p0

    .line 184
    invoke-virtual {p0}, Lcom/helpshift/HelpshiftUser$Builder;->build()Lcom/helpshift/HelpshiftUser;

    move-result-object p0

    .line 181
    invoke-static {p0}, Lcom/helpshift/Core;->login(Lcom/helpshift/HelpshiftUser;)V

    return-void
.end method

.method public static login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 139
    invoke-static {p0, p1, p2}, Lcom/helpshift/Core;->login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static logout()V
    .locals 0

    .line 143
    invoke-static {}, Lcom/helpshift/Core;->logout()V

    return-void
.end method

.method public static registerDeviceToken(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 123
    invoke-static {p0, p1}, Lcom/helpshift/Core;->registerDeviceToken(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method private static sanitizeConfigMap(Ljava/util/Map;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    const-string v0, "sdkType"

    const-string v1, "xamarin"

    .line 172
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "pluginVersion"

    const-string v1, "3.6.1"

    .line 173
    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 69
    invoke-static {p0, p1}, Lcom/helpshift/Core;->setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static setSDKLanguage(Ljava/lang/String;)V
    .locals 0

    .line 147
    invoke-static {p0}, Lcom/helpshift/Core;->setSDKLanguage(Ljava/lang/String;)V

    return-void
.end method

.method public static setTheme(Ljava/lang/String;)V
    .locals 3

    .line 151
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p0, "Helpshift_XamHsCore"

    const-string v0, "setTheme API called before Helpshift install call"

    .line 153
    invoke-static {p0, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v1, 0x0

    if-eqz p0, :cond_1

    .line 162
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "style"

    .line 159
    invoke-static {v0, p0, v2, v1}, Lcom/helpshift/util/ApplicationUtil;->getResourceIdFromName(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 164
    :cond_1
    invoke-static {v1}, Lcom/helpshift/Core;->setTheme(I)V

    return-void
.end method
