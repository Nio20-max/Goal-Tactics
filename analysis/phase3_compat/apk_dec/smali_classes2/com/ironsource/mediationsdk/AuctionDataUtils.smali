.class public Lcom/ironsource/mediationsdk/AuctionDataUtils;
.super Ljava/lang/Object;
.source "AuctionDataUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ironsource/mediationsdk/AuctionDataUtils$ImpressionHttpTask;,
        Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;,
        Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;
    }
.end annotation


# static fields
.field public static final AUCTION_LOSS_MACRO:Ljava/lang/String; = "${AUCTION_LOSS}"

.field public static final AUCTION_MBR_MACRO:Ljava/lang/String; = "${AUCTION_MBR}"

.field public static final AUCTION_PRICE_MACRO:Ljava/lang/String; = "${AUCTION_PRICE}"

.field public static final AUCTION_RESPONSE_KEY_AD_MARKUP:Ljava/lang/String; = "adMarkup"

.field public static final AUCTION_RESPONSE_KEY_AUCTION_ID:Ljava/lang/String; = "auctionId"

.field public static final AUCTION_RESPONSE_KEY_BURL:Ljava/lang/String; = "burl"

.field public static final AUCTION_RESPONSE_KEY_IMPRESSION_DATA:Ljava/lang/String; = "armData"

.field public static final AUCTION_RESPONSE_KEY_INSTANCE:Ljava/lang/String; = "instance"

.field public static final AUCTION_RESPONSE_KEY_LURL:Ljava/lang/String; = "lurl"

.field public static final AUCTION_RESPONSE_KEY_NOTIFICATIONS:Ljava/lang/String; = "notifications"

.field public static final AUCTION_RESPONSE_KEY_NURL:Ljava/lang/String; = "nurl"

.field public static final AUCTION_RESPONSE_KEY_PRICE:Ljava/lang/String; = "price"

.field public static final AUCTION_RESPONSE_KEY_SERVER_DATA:Ljava/lang/String; = "serverData"

.field public static final AUCTION_RESPONSE_KEY_SETTINGS:Ljava/lang/String; = "settings"

.field public static final AUCTION_RESPONSE_KEY_WATERFALL:Ljava/lang/String; = "waterfall"

.field private static final AUCTION_RESPONSE_SERVER_DATA_ADM_KEY:Ljava/lang/String; = "adMarkup"

.field private static final AUCTION_RESPONSE_SERVER_DATA_MARKET_PLACE_DEMAND_TYPE_KEY:Ljava/lang/String; = "dynamicDemandSource"

.field private static final AUCTION_RESPONSE_SERVER_DATA_PARAMS_KEY:Ljava/lang/String; = "params"

.field public static final DYNAMIC_DEMAND_SOURCE_MACRO:Ljava/lang/String; = "${DYNAMIC_DEMAND_SOURCE}"

.field public static final INSTANCE_NAME_MACRO:Ljava/lang/String; = "${INSTANCE}"

.field public static final INSTANCE_TYPE_MACRO:Ljava/lang/String; = "${INSTANCE_TYPE}"

.field public static final PLACEMENT_NAME_MACRO:Ljava/lang/String; = "${PLACEMENT_NAME}"

.field private static final TAG:Ljava/lang/String; = "AuctionDataUtils"

.field private static sInstance:Lcom/ironsource/mediationsdk/AuctionDataUtils;


# instance fields
.field private mBrowserUserAgent:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 83
    new-instance v0, Lcom/ironsource/mediationsdk/AuctionDataUtils;

    invoke-direct {v0}, Lcom/ironsource/mediationsdk/AuctionDataUtils;-><init>()V

    sput-object v0, Lcom/ironsource/mediationsdk/AuctionDataUtils;->sInstance:Lcom/ironsource/mediationsdk/AuctionDataUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 76
    iput-object v0, p0, Lcom/ironsource/mediationsdk/AuctionDataUtils;->mBrowserUserAgent:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$500(Lcom/ironsource/mediationsdk/AuctionDataUtils;)Ljava/lang/String;
    .locals 0

    .line 42
    iget-object p0, p0, Lcom/ironsource/mediationsdk/AuctionDataUtils;->mBrowserUserAgent:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$502(Lcom/ironsource/mediationsdk/AuctionDataUtils;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 42
    iput-object p1, p0, Lcom/ironsource/mediationsdk/AuctionDataUtils;->mBrowserUserAgent:Ljava/lang/String;

    return-object p1
.end method

.method private fetchNativeKeysListFromMinimizedToken(Lorg/json/JSONObject;Ljava/util/List;)Lorg/json/JSONObject;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .line 418
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    if-eqz p1, :cond_1

    .line 420
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 421
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object p2, Lcom/ironsource/environment/TokenConstants;->defaultNativeTokenKeysToInclude:Ljava/util/ArrayList;

    .line 422
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 423
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 426
    :try_start_0
    invoke-interface {p2, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 427
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    .line 431
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private getAuctionSecureFlag()Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;
    .locals 4

    .line 211
    sget-object v0, Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;->SECURE:Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;

    .line 214
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_1

    .line 216
    invoke-static {}, Landroid/security/NetworkSecurityPolicy;->getInstance()Landroid/security/NetworkSecurityPolicy;

    move-result-object v0

    invoke-virtual {v0}, Landroid/security/NetworkSecurityPolicy;->isCleartextTrafficPermitted()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;->NOT_SECURE:Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;

    goto :goto_1

    :cond_0
    sget-object v0, Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;->SECURE:Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;

    goto :goto_1

    .line 218
    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_4

    .line 220
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 221
    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v1, 0x8000000

    and-int/2addr v0, v1

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_3

    .line 222
    sget-object v0, Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;->NOT_SECURE:Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;

    goto :goto_1

    :cond_3
    sget-object v0, Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;->SECURE:Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;

    goto :goto_1

    .line 226
    :cond_4
    sget-object v0, Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;->NOT_SECURE:Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;

    .line 229
    :goto_1
    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronLog;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronLog;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "secureFlag = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/ironsource/mediationsdk/logger/IronLog;->verbose(Ljava/lang/String;)V

    return-object v0
.end method

.method private getBidRatio(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 587
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, ""

    if-nez v0, :cond_2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 592
    :cond_0
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    .line 593
    invoke-static {p2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p1

    const-wide/16 v4, 0x0

    cmpl-double v0, p1, v4

    if-nez v0, :cond_1

    return-object v1

    :cond_1
    div-double/2addr v2, p1

    const-wide p1, 0x408f400000000000L    # 1000.0

    mul-double v2, v2, p1

    .line 604
    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    long-to-double v0, v0

    div-double/2addr v0, p1

    .line 606
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    :goto_0
    return-object v1
.end method

.method private getDeviceLang()Ljava/lang/String;
    .locals 4

    .line 203
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 204
    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronLog;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronLog;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "lang = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/ironsource/mediationsdk/logger/IronLog;->verbose(Ljava/lang/String;)V

    return-object v0
.end method

.method private getDeviceType()Ljava/lang/String;
    .locals 1

    .line 192
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getCurrentActiveActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/ironsource/environment/DeviceStatus;->getIsTablet(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "Tablet"

    goto :goto_0

    :cond_0
    const-string v0, "Phone"

    :goto_0
    return-object v0
.end method

.method public static getInstance()Lcom/ironsource/mediationsdk/AuctionDataUtils;
    .locals 1

    .line 86
    sget-object v0, Lcom/ironsource/mediationsdk/AuctionDataUtils;->sInstance:Lcom/ironsource/mediationsdk/AuctionDataUtils;

    return-object v0
.end method

.method private getPlayerTokenWithMinimizedKeyParams(Lorg/json/JSONObject;Ljava/util/List;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .line 394
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    if-eqz p1, :cond_3

    .line 396
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 397
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 398
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 400
    :try_start_0
    sget-object v3, Lcom/ironsource/environment/TokenConstants;->minimizedTokenKeyNames:Ljava/util/HashMap;

    invoke-virtual {p0, v3, v2}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->getMinimizedKeyParamFromMap(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 405
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_1

    sget-object v4, Lcom/ironsource/environment/TokenConstants;->defaultNativeTokenKeysToInclude:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "metadata_"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_1
    invoke-interface {p2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 406
    :cond_2
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    .line 409
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :cond_3
    return-object v0
.end method


# virtual methods
.method createToken(Lorg/json/JSONObject;Ljava/util/List;)Lorg/json/JSONObject;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .line 361
    invoke-static {}, Lcom/ironsource/mediationsdk/TokenDataService;->getInstance()Lcom/ironsource/mediationsdk/TokenDataService;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/TokenDataService;->getTokenData()Lorg/json/JSONObject;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->fetchNativeKeysListFromMinimizedToken(Lorg/json/JSONObject;Ljava/util/List;)Lorg/json/JSONObject;

    move-result-object v0

    .line 362
    invoke-direct {p0, p1, p2}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->getPlayerTokenWithMinimizedKeyParams(Lorg/json/JSONObject;Ljava/util/List;)Lorg/json/JSONObject;

    move-result-object p1

    .line 365
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object p2

    .line 366
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 367
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 370
    :try_start_0
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 371
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_1"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_0
    move-object v2, v1

    .line 373
    :goto_1
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 375
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method decodeAdmResponse(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1

    :try_start_0
    const-string v0, "C38FB23A402222A0C17D34A92F971D1F"

    .line 447
    invoke-static {v0, p1}, Lcom/ironsource/mediationsdk/utils/IronSourceAES;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 448
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    const/4 p1, 0x0

    return-object p1
.end method

.method encryptToken(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 1

    .line 439
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "C38FB23A402222A0C17D34A92F971D1F"

    .line 440
    invoke-static {v0, p1}, Lcom/ironsource/mediationsdk/utils/IronSourceAES;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public enrichNotificationURL(Ljava/lang/String;ILcom/ironsource/mediationsdk/AuctionResponseItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 9

    .line 468
    invoke-virtual {p3}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getPrice()Ljava/lang/String;

    move-result-object v5

    .line 469
    invoke-static {}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->getInstance()Lcom/ironsource/mediationsdk/AuctionDataUtils;

    move-result-object v0

    invoke-direct {v0, v5, p4}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->getBidRatio(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 470
    invoke-virtual {p3}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v2

    .line 471
    invoke-static {}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->getInstance()Lcom/ironsource/mediationsdk/AuctionDataUtils;

    move-result-object p4

    invoke-virtual {p3}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getServerData()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p4, p3}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->getDynamicDemandSourceIdFromServerData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move-object v7, p5

    move-object v8, p6

    .line 473
    invoke-virtual/range {v0 .. v8}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->enrichNotificationURL(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public enrichNotificationURL(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "${AUCTION_PRICE}"

    .line 457
    invoke-virtual {p1, v0, p5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string p5, "${AUCTION_LOSS}"

    .line 458
    invoke-virtual {p1, p5, p7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string p5, "${AUCTION_MBR}"

    .line 459
    invoke-virtual {p1, p5, p6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string p5, "${INSTANCE}"

    .line 460
    invoke-virtual {p1, p5, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 461
    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p2

    const-string p3, "${INSTANCE_TYPE}"

    invoke-virtual {p1, p3, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "${DYNAMIC_DEMAND_SOURCE}"

    .line 462
    invoke-virtual {p1, p2, p4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "${PLACEMENT_NAME}"

    .line 463
    invoke-virtual {p1, p2, p8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method enrichToken(Landroid/content/Context;Ljava/util/Map;Ljava/util/List;Lcom/ironsource/mediationsdk/AuctionHistory;ILjava/lang/String;Lcom/ironsource/mediationsdk/utils/AuctionSettings;Lcom/ironsource/mediationsdk/ISBannerSize;)Lorg/json/JSONObject;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/ironsource/mediationsdk/AuctionHistory;",
            "I",
            "Ljava/lang/String;",
            "Lcom/ironsource/mediationsdk/utils/AuctionSettings;",
            "Lcom/ironsource/mediationsdk/ISBannerSize;",
            ")",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    move-object v0, p4

    .line 244
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 246
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const-string v4, "performance"

    const/4 v5, 0x2

    const-string v6, "instanceType"

    const-string v7, ""

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 247
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 248
    invoke-virtual {v8, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 249
    new-instance v5, Lorg/json/JSONObject;

    move-object v9, p2

    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    const-string v6, "biddingAdditionalData"

    invoke-virtual {v8, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz v0, :cond_0

    .line 250
    invoke-virtual {p4, v3}, Lcom/ironsource/mediationsdk/AuctionHistory;->getStoredPerformanceForInstance(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 251
    :cond_0
    invoke-virtual {v8, v4, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 252
    invoke-virtual {v1, v3, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :cond_1
    const/4 v2, 0x1

    if-eqz p3, :cond_3

    .line 256
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 257
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    .line 258
    invoke-virtual {v9, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    if-eqz v0, :cond_2

    .line 259
    invoke-virtual {p4, v8}, Lcom/ironsource/mediationsdk/AuctionHistory;->getStoredPerformanceForInstance(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    goto :goto_2

    :cond_2
    move-object v10, v7

    .line 260
    :goto_2
    invoke-virtual {v9, v4, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 261
    invoke-virtual {v1, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 265
    :cond_3
    invoke-static {}, Lcom/ironsource/mediationsdk/AdapterRepository;->getInstance()Lcom/ironsource/mediationsdk/AdapterRepository;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/AdapterRepository;->getMetaData()Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v0

    .line 266
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 267
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 268
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    const-string v8, ","

    invoke-static {v8, v6}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    .line 269
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    .line 273
    :cond_4
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 274
    invoke-static {}, Lcom/ironsource/mediationsdk/IronSourceObject;->getInstance()Lcom/ironsource/mediationsdk/IronSourceObject;

    move-result-object v4

    invoke-virtual {v4}, Lcom/ironsource/mediationsdk/IronSourceObject;->getIronSourceUserId()Ljava/lang/String;

    move-result-object v4

    const-string v6, "applicationUserId"

    invoke-virtual {v0, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 276
    invoke-static {}, Lcom/ironsource/mediationsdk/IronSourceObject;->getInstance()Lcom/ironsource/mediationsdk/IronSourceObject;

    move-result-object v4

    invoke-virtual {v4}, Lcom/ironsource/mediationsdk/IronSourceObject;->getConsent()Ljava/lang/Boolean;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 278
    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    const-string v6, "consent"

    invoke-virtual {v0, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 281
    :cond_5
    invoke-static {p1}, Lcom/ironsource/environment/DeviceStatus;->getMobileCarrier(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "mobileCarrier"

    invoke-virtual {v0, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 282
    invoke-static {p1}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->getConnectionType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "connectionType"

    invoke-virtual {v0, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "deviceOS"

    const-string v6, "android"

    .line 283
    invoke-virtual {v0, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 284
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v4, v4, Landroid/content/res/Configuration;->screenWidthDp:I

    const-string v6, "deviceWidth"

    invoke-virtual {v0, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 285
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v4, v4, Landroid/content/res/Configuration;->screenHeightDp:I

    const-string v6, "deviceHeight"

    invoke-virtual {v0, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 286
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "("

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ")"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v6, "deviceOSVersion"

    invoke-virtual {v0, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 287
    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v6, "deviceModel"

    invoke-virtual {v0, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 288
    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v6, "deviceMake"

    invoke-virtual {v0, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 289
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    const-string v6, "bundleId"

    invoke-virtual {v0, v6, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 290
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    move-object v6, p1

    invoke-static {p1, v4}, Lcom/ironsource/environment/ApplicationContext;->getPublisherApplicationVersion(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v8, "appVersion"

    invoke-virtual {v0, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 291
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    const-string v4, "clientTimestamp"

    invoke-virtual {v0, v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 293
    invoke-virtual {p0}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->getBrowserUserAgent()Ljava/lang/String;

    move-result-object v4

    const-string v8, "browserUserAgent"

    invoke-virtual {v0, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 294
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->getDeviceType()Ljava/lang/String;

    move-result-object v4

    const-string v8, "deviceType"

    invoke-virtual {v0, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 295
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->getDeviceLang()Ljava/lang/String;

    move-result-object v4

    const-string v8, "deviceLang"

    invoke-virtual {v0, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 296
    invoke-direct {p0}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->getAuctionSecureFlag()Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;

    move-result-object v4

    invoke-virtual {v4}, Lcom/ironsource/mediationsdk/AuctionDataUtils$SecureFlag;->ordinal()I

    move-result v4

    const-string v8, "secure"

    invoke-virtual {v0, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    if-eqz p8, :cond_6

    .line 299
    invoke-virtual/range {p8 .. p8}, Lcom/ironsource/mediationsdk/ISBannerSize;->getDescription()Ljava/lang/String;

    move-result-object v4

    const-string v8, "bannerSize"

    invoke-virtual {v0, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 300
    invoke-virtual/range {p8 .. p8}, Lcom/ironsource/mediationsdk/ISBannerSize;->getWidth()I

    move-result v4

    const-string v8, "bannerWidth"

    invoke-virtual {v0, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 301
    invoke-virtual/range {p8 .. p8}, Lcom/ironsource/mediationsdk/ISBannerSize;->getHeight()I

    move-result v4

    const-string v8, "bannerHeight"

    invoke-virtual {v0, v8, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :cond_6
    const/4 v4, 0x0

    .line 312
    :try_start_0
    invoke-static {p1}, Lcom/ironsource/environment/DeviceStatus;->getAdvertisingIdInfo(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_8

    .line 313
    array-length v9, v8

    if-ne v9, v5, :cond_8

    .line 314
    aget-object v5, v8, v4

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_7

    .line 315
    aget-object v5, v8, v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_4

    :cond_7
    move-object v5, v7

    .line 317
    :goto_4
    :try_start_1
    aget-object v2, v8, v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move v4, v2

    goto :goto_5

    :catch_0
    nop

    goto :goto_5

    :catch_1
    :cond_8
    move-object v5, v7

    .line 323
    :goto_5
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_9

    const-string v7, "GAID"

    goto :goto_6

    .line 327
    :cond_9
    invoke-static {p1}, Lcom/ironsource/environment/DeviceStatus;->getOrGenerateOnceUniqueIdentifier(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    .line 328
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_a

    const-string v7, "UUID"

    .line 334
    :cond_a
    :goto_6
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_c

    const-string v2, "advId"

    .line 335
    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "advIdType"

    .line 336
    invoke-virtual {v0, v2, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz v4, :cond_b

    const-string v2, "true"

    goto :goto_7

    :cond_b
    const-string v2, "false"

    :goto_7
    const-string v4, "isLimitAdTrackingEnabled"

    .line 337
    invoke-virtual {v0, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 340
    :cond_c
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 341
    invoke-static {}, Lcom/ironsource/mediationsdk/IronSourceObject;->getInstance()Lcom/ironsource/mediationsdk/IronSourceObject;

    move-result-object v4

    invoke-virtual {v4}, Lcom/ironsource/mediationsdk/IronSourceObject;->getIronSourceAppKey()Ljava/lang/String;

    move-result-object v4

    const-string v5, "applicationKey"

    invoke-virtual {v2, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 342
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->getSDKVersion()Ljava/lang/String;

    move-result-object v4

    const-string v5, "SDKVersion"

    invoke-virtual {v2, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v4, "clientParams"

    .line 343
    invoke-virtual {v2, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "sessionDepth"

    move/from16 v4, p5

    .line 344
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "sessionId"

    move-object/from16 v4, p6

    .line 345
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "instances"

    .line 346
    invoke-virtual {v2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 347
    invoke-virtual/range {p7 .. p7}, Lcom/ironsource/mediationsdk/utils/AuctionSettings;->getAuctionData()Ljava/lang/String;

    move-result-object v0

    const-string v1, "auctionData"

    invoke-virtual {v2, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "metaData"

    .line 348
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-object v2
.end method

.method public getAdmFromServerData(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const-string v0, "adMarkup"

    .line 563
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 564
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 565
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-object p1
.end method

.method getAuctionDataFromResponse(Lorg/json/JSONObject;)Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 92
    new-instance v0, Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;

    invoke-direct {v0}, Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;-><init>()V

    const-string v1, "auctionId"

    .line 93
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;->access$002(Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "settings"

    .line 98
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 99
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 101
    new-instance v2, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-direct {v2, v1}, Lcom/ironsource/mediationsdk/AuctionResponseItem;-><init>(Lorg/json/JSONObject;)V

    invoke-static {v0, v2}, Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;->access$102(Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;Lcom/ironsource/mediationsdk/AuctionResponseItem;)Lcom/ironsource/mediationsdk/AuctionResponseItem;

    const-string v2, "armData"

    .line 102
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 103
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 107
    :goto_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, v2}, Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;->access$202(Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;Ljava/util/List;)Ljava/util/List;

    const-string v2, "waterfall"

    .line 108
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v2, 0x0

    .line 110
    :goto_1
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 111
    new-instance v3, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lcom/ironsource/mediationsdk/AuctionResponseItem;-><init>(Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    .line 112
    invoke-virtual {v3}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->isValid()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 118
    invoke-static {v0}, Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;->access$200(Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    const/16 p1, 0x3ea

    .line 113
    invoke-static {v0, p1}, Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;->access$302(Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;I)I

    .line 114
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "waterfall "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;->access$402(Lcom/ironsource/mediationsdk/AuctionDataUtils$AuctionData;Ljava/lang/String;)Ljava/lang/String;

    .line 115
    new-instance p1, Lorg/json/JSONException;

    const-string v0, "invalid response"

    invoke-direct {p1, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    return-object v0
.end method

.method public getAuctionResponseItem(Ljava/lang/String;Ljava/util/List;)Lcom/ironsource/mediationsdk/AuctionResponseItem;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/ironsource/mediationsdk/AuctionResponseItem;",
            ">;)",
            "Lcom/ironsource/mediationsdk/AuctionResponseItem;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 236
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 237
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getInstanceName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 238
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ironsource/mediationsdk/AuctionResponseItem;

    return-object p1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getAuctionResponseServerDataParams(Ljava/lang/String;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "params"

    .line 542
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 544
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 545
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 546
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 547
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v0

    .line 548
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 549
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 550
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 551
    instance-of v4, v3, Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 552
    check-cast v3, Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :cond_1
    return-object v1
.end method

.method public getBrowserUserAgent()Ljava/lang/String;
    .locals 1

    .line 180
    iget-object v0, p0, Lcom/ironsource/mediationsdk/AuctionDataUtils;->mBrowserUserAgent:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 181
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 183
    invoke-static {v0}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->getBrowserUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/ironsource/mediationsdk/AuctionDataUtils;->mBrowserUserAgent:Ljava/lang/String;

    return-object v0
.end method

.method public getDynamicDemandSourceIdFromServerData(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const-string v0, "dynamicDemandSource"

    const-string v1, "params"

    const-string v2, ""

    .line 574
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 575
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 576
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 577
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 578
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, p1

    :catch_0
    :cond_0
    return-object v2
.end method

.method getMinimizedKeyParamFromMap(Ljava/util/HashMap;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 385
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 386
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object p2, p1

    check-cast p2, Ljava/lang/String;

    :cond_0
    return-object p2
.end method

.method sendResponse(Ljava/lang/String;)V
    .locals 3

    .line 477
    new-instance v0, Lcom/ironsource/mediationsdk/AuctionDataUtils$ImpressionHttpTask;

    invoke-direct {v0}, Lcom/ironsource/mediationsdk/AuctionDataUtils$ImpressionHttpTask;-><init>()V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/ironsource/mediationsdk/AuctionDataUtils$ImpressionHttpTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public setBrowserUserAgent()V
    .locals 3

    .line 125
    sget-object v0, Lcom/ironsource/mediationsdk/logger/IronLog;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronLog;

    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/ironsource/mediationsdk/logger/IronLog;->verbose(Ljava/lang/String;)V

    .line 126
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getCurrentActiveActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 130
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_0

    .line 131
    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronLog;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronLog;

    const-string v2, "from web settings"

    invoke-virtual {v1, v2}, Lcom/ironsource/mediationsdk/logger/IronLog;->verbose(Ljava/lang/String;)V

    .line 135
    :try_start_0
    invoke-static {v0}, Landroid/webkit/WebSettings;->getDefaultUserAgent(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/ironsource/mediationsdk/AuctionDataUtils;->mBrowserUserAgent:Ljava/lang/String;

    .line 138
    invoke-static {v0, v1}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->saveBrowserUserAgent(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 144
    :cond_0
    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronLog;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronLog;

    const-string v2, "from web view"

    invoke-virtual {v1, v2}, Lcom/ironsource/mediationsdk/logger/IronLog;->verbose(Ljava/lang/String;)V

    .line 146
    invoke-static {}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->getInstance()Lcom/ironsource/mediationsdk/utils/ContextProvider;

    move-result-object v1

    new-instance v2, Lcom/ironsource/mediationsdk/AuctionDataUtils$1;

    invoke-direct {v2, p0, v0}, Lcom/ironsource/mediationsdk/AuctionDataUtils$1;-><init>(Lcom/ironsource/mediationsdk/AuctionDataUtils;Landroid/app/Activity;)V

    invoke-virtual {v1, v2}, Lcom/ironsource/mediationsdk/utils/ContextProvider;->runOnUIThread(Ljava/lang/Runnable;)V

    :catch_0
    :cond_1
    :goto_0
    return-void
.end method
