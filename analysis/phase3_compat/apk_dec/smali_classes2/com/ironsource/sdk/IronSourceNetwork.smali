.class public Lcom/ironsource/sdk/IronSourceNetwork;
.super Ljava/lang/Object;
.source "IronSourceNetwork.java"


# static fields
.field static final TAG:Ljava/lang/String; = "IronSourceNetwork"

.field private static ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;

.field private static mConsentParams:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized applyConsentInfo(Lorg/json/JSONObject;)V
    .locals 2

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 195
    :try_start_0
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 196
    monitor-exit v0

    return-void

    :cond_0
    if-nez p0, :cond_1

    .line 200
    monitor-exit v0

    return-void

    .line 202
    :cond_1
    :try_start_1
    invoke-interface {v1, p0}, Lcom/ironsource/sdk/IronSourceNetworkAPI;->updateConsentInfo(Lorg/json/JSONObject;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 203
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized createBanner(Landroid/app/Activity;Lcom/ironsource/sdk/ISAdSize;)Lcom/ironsource/sdk/ISNAdView/ISNAdView;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 285
    :try_start_0
    invoke-static {}, Lcom/ironsource/sdk/IronSourceNetwork;->validateInitSDK()V

    .line 286
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;

    invoke-interface {v1, p0, p1}, Lcom/ironsource/sdk/IronSourceNetworkAPI;->createBanner(Landroid/app/Activity;Lcom/ironsource/sdk/ISAdSize;)Lcom/ironsource/sdk/ISNAdView/ISNAdView;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized getOfferWallCredits(Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 260
    :try_start_0
    invoke-static {}, Lcom/ironsource/sdk/IronSourceNetwork;->validateInitSDK()V

    .line 261
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;

    invoke-interface {v1, p0}, Lcom/ironsource/sdk/IronSourceNetworkAPI;->getOfferWallCredits(Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 264
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized getRawToken(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 2

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 236
    :try_start_0
    invoke-static {}, Lcom/ironsource/sdk/service/TokenService;->getInstance()Lcom/ironsource/sdk/service/TokenService;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/ironsource/sdk/service/TokenService;->getRawToken(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized getToken(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 227
    :try_start_0
    invoke-static {}, Lcom/ironsource/sdk/service/TokenService;->getInstance()Lcom/ironsource/sdk/service/TokenService;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/ironsource/sdk/service/TokenService;->getToken(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static getVersion()Ljava/lang/String;
    .locals 1

    .line 125
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->getSDKVersion()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static declared-synchronized initBanner(Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnBannerListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/sdk/listeners/OnBannerListener;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 269
    :try_start_0
    invoke-static {}, Lcom/ironsource/sdk/IronSourceNetwork;->validateInitSDK()V

    .line 270
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;

    invoke-interface {v1, p0, p1, p2}, Lcom/ironsource/sdk/IronSourceNetworkAPI;->initBanner(Ljava/lang/String;Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnBannerListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 275
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized initOfferWall(Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/sdk/listeners/OnOfferWallListener;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 244
    :try_start_0
    invoke-static {}, Lcom/ironsource/sdk/IronSourceNetwork;->validateInitSDK()V

    .line 245
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;

    invoke-interface {v1, p0, p1}, Lcom/ironsource/sdk/IronSourceNetworkAPI;->initOfferWall(Ljava/util/Map;Lcom/ironsource/sdk/listeners/OnOfferWallListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 249
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized initSDK(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 47
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p0, "IronSourceNetwork"

    const-string p1, "applicationKey is NULL"

    .line 48
    invoke-static {p0, p1}, Lcom/ironsource/sdk/utils/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    monitor-exit v0

    return-void

    .line 52
    :cond_0
    :try_start_1
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;

    if-nez v1, :cond_2

    .line 53
    invoke-static {p3}, Lcom/ironsource/sdk/utils/SDKUtils;->setInitSDKParams(Ljava/util/Map;)V

    .line 55
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->getNetworkConfiguration()Lorg/json/JSONObject;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    const-string v2, "events"

    .line 57
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 59
    invoke-static {p0, v1, p2, p1, p3}, Lcom/ironsource/sdk/IronSourceNetwork;->initSDK5EventTracker(Landroid/app/Activity;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p3

    :try_start_3
    const-string v1, "IronSourceNetwork"

    .line 67
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to init event tracker: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v1, p3}, Lcom/ironsource/sdk/utils/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    :cond_1
    :goto_0
    invoke-static {p0, p1, p2}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->createInstance(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)Lcom/ironsource/sdk/IronSourceNetworkAPI;

    move-result-object p0

    sput-object p0, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;

    .line 76
    sget-object p0, Lcom/ironsource/sdk/IronSourceNetwork;->mConsentParams:Lorg/json/JSONObject;

    invoke-static {p0}, Lcom/ironsource/sdk/IronSourceNetwork;->applyConsentInfo(Lorg/json/JSONObject;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 78
    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static initSDK5EventTracker(Landroid/app/Activity;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lorg/json/JSONObject;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 86
    invoke-static {p1}, Lcom/ironsource/sdk/Events/ISNEventsUtils;->createConfigurations(Lorg/json/JSONObject;)Lcom/ironsource/eventsTracker/EventsConfiguration;

    move-result-object p1

    .line 88
    invoke-virtual {p1}, Lcom/ironsource/eventsTracker/EventsConfiguration;->areEventsEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    invoke-static {p0, p2, p3, p4}, Lcom/ironsource/sdk/Events/ISNEventsUtils;->createEventsBaseData(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lcom/ironsource/sdk/Events/ISNEventsBaseData;

    move-result-object p0

    .line 89
    invoke-static {p1, p0}, Lcom/ironsource/sdk/Events/ISNEventsTracker;->init(Lcom/ironsource/eventsTracker/EventsConfiguration;Lcom/ironsource/sdk/Events/ISNEventsBaseData;)V

    :cond_0
    return-void
.end method

.method public static declared-synchronized isAdAvailableForInstance(Lcom/ironsource/sdk/IronSourceAdInstance;)Z
    .locals 2

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 159
    :try_start_0
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    const/4 p0, 0x0

    .line 160
    monitor-exit v0

    return p0

    .line 162
    :cond_0
    :try_start_1
    invoke-interface {v1, p0}, Lcom/ironsource/sdk/IronSourceNetworkAPI;->isAdAvailable(Lcom/ironsource/sdk/IronSourceAdInstance;)Z

    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized loadAd(Lcom/ironsource/sdk/IronSourceAdInstance;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    const/4 v1, 0x0

    .line 129
    :try_start_0
    invoke-static {p0, v1}, Lcom/ironsource/sdk/IronSourceNetwork;->loadAd(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized loadAd(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/IronSourceAdInstance;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 114
    :try_start_0
    invoke-static {}, Lcom/ironsource/sdk/IronSourceNetwork;->validateInitSDK()V

    .line 115
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;

    invoke-interface {v1, p0, p1}, Lcom/ironsource/sdk/IronSourceNetworkAPI;->loadAd(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 119
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized loadBanner(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 278
    :try_start_0
    invoke-static {}, Lcom/ironsource/sdk/IronSourceNetwork;->validateInitSDK()V

    .line 279
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;

    invoke-interface {v1, p0}, Lcom/ironsource/sdk/IronSourceNetworkAPI;->loadBanner(Lorg/json/JSONObject;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 282
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized onPause(Landroid/app/Activity;)V
    .locals 2

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 169
    :try_start_0
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 170
    monitor-exit v0

    return-void

    .line 173
    :cond_0
    :try_start_1
    invoke-interface {v1, p0}, Lcom/ironsource/sdk/IronSourceNetworkAPI;->onPause(Landroid/app/Activity;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 174
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized onResume(Landroid/app/Activity;)V
    .locals 2

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 180
    :try_start_0
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 181
    monitor-exit v0

    return-void

    .line 183
    :cond_0
    :try_start_1
    invoke-interface {v1, p0}, Lcom/ironsource/sdk/IronSourceNetworkAPI;->onResume(Landroid/app/Activity;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 184
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized release(Landroid/app/Activity;)V
    .locals 2

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 213
    :try_start_0
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 214
    monitor-exit v0

    return-void

    .line 216
    :cond_0
    :try_start_1
    invoke-interface {v1, p0}, Lcom/ironsource/sdk/IronSourceNetworkAPI;->release(Landroid/app/Activity;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 217
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized showAd(Lcom/ironsource/sdk/IronSourceAdInstance;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    const/4 v1, 0x0

    .line 147
    :try_start_0
    invoke-static {p0, v1}, Lcom/ironsource/sdk/IronSourceNetwork;->showAd(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 151
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized showAd(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ironsource/sdk/IronSourceAdInstance;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 139
    :try_start_0
    invoke-static {}, Lcom/ironsource/sdk/IronSourceNetwork;->validateInitSDK()V

    .line 140
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;

    invoke-interface {v1, p0, p1}, Lcom/ironsource/sdk/IronSourceNetworkAPI;->showAd(Lcom/ironsource/sdk/IronSourceAdInstance;Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 144
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized showOfferWall(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 252
    :try_start_0
    invoke-static {}, Lcom/ironsource/sdk/IronSourceNetwork;->validateInitSDK()V

    .line 253
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;

    invoke-interface {v1, p0}, Lcom/ironsource/sdk/IronSourceNetworkAPI;->showOfferWall(Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 256
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized updateConsentInfo(Lorg/json/JSONObject;)V
    .locals 1

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 190
    :try_start_0
    sput-object p0, Lcom/ironsource/sdk/IronSourceNetwork;->mConsentParams:Lorg/json/JSONObject;

    .line 191
    invoke-static {p0}, Lcom/ironsource/sdk/IronSourceNetwork;->applyConsentInfo(Lorg/json/JSONObject;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 192
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized updateMetadata(Lorg/json/JSONObject;)V
    .locals 2

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 209
    :try_start_0
    invoke-static {}, Lcom/ironsource/sdk/service/TokenService;->getInstance()Lcom/ironsource/sdk/service/TokenService;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/ironsource/sdk/service/TokenService;->updateMetaData(Lorg/json/JSONObject;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 210
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static declared-synchronized validateInitSDK()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/ironsource/sdk/IronSourceNetwork;

    monitor-enter v0

    .line 96
    :try_start_0
    sget-object v1, Lcom/ironsource/sdk/IronSourceNetwork;->ironSourceNetwork:Lcom/ironsource/sdk/IronSourceNetworkAPI;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 99
    monitor-exit v0

    return-void

    .line 97
    :cond_0
    :try_start_1
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Call initSDK first"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
