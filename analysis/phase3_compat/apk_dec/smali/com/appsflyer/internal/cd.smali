.class public final Lcom/appsflyer/internal/cd;
.super Lcom/appsflyer/internal/cm;
.source ""


# static fields
.field private static onAppOpenAttribution:I = 0x0

.field private static onAttributionFailureNative:Ljava/lang/String; = null

.field private static onConversionDataFail:C = '\u0000'

.field private static onResponseErrorNative:[C = null

.field private static onResponseNative:I = 0x1


# instance fields
.field private final onAppOpenAttributionNative:Lcom/appsflyer/internal/bv;

.field private final onInstallConversionDataLoadedNative:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    invoke-static {}, Lcom/appsflyer/internal/cd;->AFVersionDeclaration()V

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://%sregister.%s/api/v"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/appsflyer/internal/ac;->values:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/internal/cd;->onAttributionFailureNative:Ljava/lang/String;

    sget v0, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    add-int/lit8 v0, v0, 0x3

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/cd;->onResponseNative:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x24

    if-nez v0, :cond_0

    const/16 v0, 0x44

    goto :goto_0

    :cond_0
    const/16 v0, 0x24

    :goto_0
    if-eq v0, v1, :cond_1

    const/4 v0, 0x0

    :try_start_0
    invoke-super {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    throw v0

    :cond_1
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 9

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/appsflyer/internal/cd;->onAttributionFailureNative:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    .line 1062
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v3

    invoke-virtual {v3}, Lcom/appsflyer/AppsFlyerLib;->getHostPrefix()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v3

    invoke-virtual {v3}, Lcom/appsflyer/AppsFlyerLib;->getHostName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p0

    move-object v8, p1

    .line 51
    invoke-direct/range {v2 .. v8}, Lcom/appsflyer/internal/cm;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Boolean;Ljava/lang/Boolean;Landroid/content/Context;)V

    .line 58
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/internal/cd;->onInstallConversionDataLoadedNative:Landroid/content/SharedPreferences;

    .line 62
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/appsflyer/internal/ac;->values(Landroid/content/Context;)Lcom/appsflyer/internal/bv;

    move-result-object p1

    iput-object p1, p0, Lcom/appsflyer/internal/cd;->onAppOpenAttributionNative:Lcom/appsflyer/internal/bv;

    return-void
.end method

.method public static AFInAppEventType(Landroid/content/SharedPreferences;)Z
    .locals 4

    .line 82
    sget v0, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    add-int/lit8 v0, v0, 0x9

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/cd;->onResponseNative:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0xf

    if-nez v0, :cond_0

    const/16 v0, 0xf

    goto :goto_0

    :cond_0
    const/16 v0, 0x2f

    :goto_0
    const/4 v2, 0x0

    const-string v3, "sentRegisterRequestToAF"

    invoke-interface {p0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private static AFKeystoreWrapper(IBLjava/lang/String;)Ljava/lang/String;
    .locals 8

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object p2

    :cond_0
    check-cast p2, [C

    .line 5208
    sget-object v0, Lcom/appsflyer/internal/do;->AFVersionDeclaration:Ljava/lang/Object;

    monitor-enter v0

    .line 5212
    :try_start_0
    sget-object v1, Lcom/appsflyer/internal/cd;->onResponseErrorNative:[C

    .line 5214
    sget-char v2, Lcom/appsflyer/internal/cd;->onConversionDataFail:C

    .line 5218
    new-array v3, p0, [C

    .line 5221
    rem-int/lit8 v4, p0, 0x2

    if-eqz v4, :cond_1

    add-int/lit8 p0, p0, -0x1

    .line 5224
    aget-char v4, p2, p0

    sub-int/2addr v4, p1

    int-to-char v4, v4

    aput-char v4, v3, p0

    :cond_1
    const/4 v4, 0x1

    if-le p0, v4, :cond_5

    const/4 v5, 0x0

    .line 5229
    sput v5, Lcom/appsflyer/internal/do;->values:I

    :goto_0
    sget v5, Lcom/appsflyer/internal/do;->values:I

    if-ge v5, p0, :cond_5

    .line 5233
    sget v5, Lcom/appsflyer/internal/do;->values:I

    aget-char v5, p2, v5

    sput-char v5, Lcom/appsflyer/internal/do;->AFInAppEventType:C

    .line 5234
    sget v5, Lcom/appsflyer/internal/do;->values:I

    add-int/2addr v5, v4

    aget-char v5, p2, v5

    sput-char v5, Lcom/appsflyer/internal/do;->valueOf:C

    .line 5237
    sget-char v5, Lcom/appsflyer/internal/do;->AFInAppEventType:C

    sget-char v6, Lcom/appsflyer/internal/do;->valueOf:C

    if-ne v5, v6, :cond_2

    .line 5239
    sget v5, Lcom/appsflyer/internal/do;->values:I

    sget-char v6, Lcom/appsflyer/internal/do;->AFInAppEventType:C

    sub-int/2addr v6, p1

    int-to-char v6, v6

    aput-char v6, v3, v5

    .line 5240
    sget v5, Lcom/appsflyer/internal/do;->values:I

    add-int/2addr v5, v4

    sget-char v6, Lcom/appsflyer/internal/do;->valueOf:C

    sub-int/2addr v6, p1

    int-to-char v6, v6

    aput-char v6, v3, v5

    goto/16 :goto_1

    .line 5245
    :cond_2
    sget-char v5, Lcom/appsflyer/internal/do;->AFInAppEventType:C

    div-int/2addr v5, v2

    sput v5, Lcom/appsflyer/internal/do;->AFKeystoreWrapper:I

    .line 5246
    sget-char v5, Lcom/appsflyer/internal/do;->AFInAppEventType:C

    rem-int/2addr v5, v2

    sput v5, Lcom/appsflyer/internal/do;->init:I

    .line 5247
    sget-char v5, Lcom/appsflyer/internal/do;->valueOf:C

    div-int/2addr v5, v2

    sput v5, Lcom/appsflyer/internal/do;->AFInAppEventParameterName:I

    .line 5248
    sget-char v5, Lcom/appsflyer/internal/do;->valueOf:C

    rem-int/2addr v5, v2

    sput v5, Lcom/appsflyer/internal/do;->getLevel:I

    .line 5251
    sget v5, Lcom/appsflyer/internal/do;->init:I

    sget v6, Lcom/appsflyer/internal/do;->getLevel:I

    if-ne v5, v6, :cond_3

    .line 5253
    sget v5, Lcom/appsflyer/internal/do;->AFKeystoreWrapper:I

    add-int/2addr v5, v2

    sub-int/2addr v5, v4

    rem-int/2addr v5, v2

    sput v5, Lcom/appsflyer/internal/do;->AFKeystoreWrapper:I

    .line 5254
    sget v5, Lcom/appsflyer/internal/do;->AFInAppEventParameterName:I

    add-int/2addr v5, v2

    sub-int/2addr v5, v4

    rem-int/2addr v5, v2

    sput v5, Lcom/appsflyer/internal/do;->AFInAppEventParameterName:I

    .line 5256
    sget v5, Lcom/appsflyer/internal/do;->AFKeystoreWrapper:I

    mul-int v5, v5, v2

    sget v6, Lcom/appsflyer/internal/do;->init:I

    add-int/2addr v5, v6

    .line 5257
    sget v6, Lcom/appsflyer/internal/do;->AFInAppEventParameterName:I

    mul-int v6, v6, v2

    sget v7, Lcom/appsflyer/internal/do;->getLevel:I

    add-int/2addr v6, v7

    .line 5259
    sget v7, Lcom/appsflyer/internal/do;->values:I

    aget-char v5, v1, v5

    aput-char v5, v3, v7

    .line 5260
    sget v5, Lcom/appsflyer/internal/do;->values:I

    add-int/2addr v5, v4

    aget-char v6, v1, v6

    aput-char v6, v3, v5

    goto :goto_1

    .line 5264
    :cond_3
    sget v5, Lcom/appsflyer/internal/do;->AFKeystoreWrapper:I

    sget v6, Lcom/appsflyer/internal/do;->AFInAppEventParameterName:I

    if-ne v5, v6, :cond_4

    .line 5266
    sget v5, Lcom/appsflyer/internal/do;->init:I

    add-int/2addr v5, v2

    sub-int/2addr v5, v4

    rem-int/2addr v5, v2

    sput v5, Lcom/appsflyer/internal/do;->init:I

    .line 5267
    sget v5, Lcom/appsflyer/internal/do;->getLevel:I

    add-int/2addr v5, v2

    sub-int/2addr v5, v4

    rem-int/2addr v5, v2

    sput v5, Lcom/appsflyer/internal/do;->getLevel:I

    .line 5269
    sget v5, Lcom/appsflyer/internal/do;->AFKeystoreWrapper:I

    mul-int v5, v5, v2

    sget v6, Lcom/appsflyer/internal/do;->init:I

    add-int/2addr v5, v6

    .line 5270
    sget v6, Lcom/appsflyer/internal/do;->AFInAppEventParameterName:I

    mul-int v6, v6, v2

    sget v7, Lcom/appsflyer/internal/do;->getLevel:I

    add-int/2addr v6, v7

    .line 5272
    sget v7, Lcom/appsflyer/internal/do;->values:I

    aget-char v5, v1, v5

    aput-char v5, v3, v7

    .line 5273
    sget v5, Lcom/appsflyer/internal/do;->values:I

    add-int/2addr v5, v4

    aget-char v6, v1, v6

    aput-char v6, v3, v5

    goto :goto_1

    .line 5281
    :cond_4
    sget v5, Lcom/appsflyer/internal/do;->AFKeystoreWrapper:I

    mul-int v5, v5, v2

    sget v6, Lcom/appsflyer/internal/do;->getLevel:I

    add-int/2addr v5, v6

    .line 5282
    sget v6, Lcom/appsflyer/internal/do;->AFInAppEventParameterName:I

    mul-int v6, v6, v2

    sget v7, Lcom/appsflyer/internal/do;->init:I

    add-int/2addr v6, v7

    .line 5284
    sget v7, Lcom/appsflyer/internal/do;->values:I

    aget-char v5, v1, v5

    aput-char v5, v3, v7

    .line 5285
    sget v5, Lcom/appsflyer/internal/do;->values:I

    add-int/2addr v5, v4

    aget-char v6, v1, v6

    aput-char v6, v3, v5

    .line 5229
    :goto_1
    sget v5, Lcom/appsflyer/internal/do;->values:I

    add-int/lit8 v5, v5, 0x2

    sput v5, Lcom/appsflyer/internal/do;->values:I

    goto/16 :goto_0

    .line 5291
    :cond_5
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v3}, Ljava/lang/String;-><init>([C)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 5292
    monitor-exit v0

    throw p0
.end method

.method private AFKeystoreWrapper(Ljava/lang/String;)V
    .locals 10

    .line 204
    sget v0, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    add-int/lit8 v0, v0, 0x65

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/cd;->onResponseNative:I

    rem-int/lit8 v0, v0, 0x2

    .line 4058
    iget-object v0, p0, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    .line 152
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v1

    .line 153
    invoke-virtual {v1}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    const-string p1, "CustomerUserId not set, Tracking is disabled"

    .line 154
    invoke-static {p1, v3}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;Z)V

    return-void

    .line 157
    :cond_0
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v2

    invoke-virtual {v2}, Lcom/appsflyer/AppsFlyerProperties;->getDevKey()Ljava/lang/String;

    move-result-object v2

    const/16 v4, 0x29

    if-nez v2, :cond_1

    const/16 v5, 0x8

    goto :goto_0

    :cond_1
    const/16 v5, 0x29

    :goto_0
    if-eq v5, v4, :cond_2

    const-string p1, "[registerUninstall] AppsFlyer\'s SDK cannot send any event without providing DevKey."

    .line 159
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    return-void

    .line 162
    :cond_2
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 163
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    .line 166
    :try_start_0
    invoke-virtual {v4, v5, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v5

    .line 167
    iget-object v7, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const-string v8, "app_version_code"

    iget v9, v5, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v9}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    iget-object v7, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const-string v8, "app_version_name"

    iget-object v9, v5, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    iget-object v7, v5, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {v4, v7}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    .line 171
    iget-object v7, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const-string v8, "app_name"

    invoke-interface {v7, v8, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    iget-wide v4, v5, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    const-string/jumbo v7, "yyyy-MM-dd_HHmmssZ"

    .line 5020
    new-instance v8, Ljava/text/SimpleDateFormat;

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v8, v7, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 175
    iget-object v7, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const-string v9, "installDate"

    invoke-static {v8, v4, v5}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/text/SimpleDateFormat;J)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v7, v9, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v4

    const-string v5, "Exception while collecting application version info."

    .line 177
    invoke-static {v5, v4}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 179
    :goto_1
    iget-object v4, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    invoke-static {v0, v4}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;Ljava/util/Map;)V

    .line 181
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventType()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 183
    iget-object v5, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const-string v7, "appUserId"

    invoke-interface {v5, v7, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    :cond_3
    :try_start_1
    iget-object v4, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const-string v5, "model"

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-interface {v4, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    iget-object v4, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const/4 v5, 0x0

    invoke-static {v5, v5}, Landroid/graphics/PointF;->length(FF)F

    move-result v7

    cmpl-float v5, v7, v5

    add-int/lit8 v5, v5, 0x5

    const-string v7, ""

    const/16 v8, 0x30

    invoke-static {v7, v8}, Landroid/text/TextUtils;->lastIndexOf(Ljava/lang/CharSequence;C)I

    move-result v7

    rsub-int/lit8 v7, v7, 0x5f

    int-to-byte v7, v7

    const-string v8, "\u0001\u0002\u0000\u0005\u00c4"

    invoke-static {v5, v7, v8}, Lcom/appsflyer/internal/cd;->AFKeystoreWrapper(IBLjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v5

    sget-object v7, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-interface {v4, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception v4

    const-string v5, "Exception while collecting device brand and model."

    .line 190
    invoke-static {v5, v4}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 193
    :goto_2
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    const-string v5, "deviceTrackingDisabled"

    invoke-virtual {v4, v5, v6}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v4, 0x0

    goto :goto_3

    :cond_4
    const/4 v4, 0x1

    :goto_3
    if-eqz v4, :cond_5

    goto :goto_4

    .line 230
    :cond_5
    sget v4, Lcom/appsflyer/internal/cd;->onResponseNative:I

    add-int/lit8 v4, v4, 0x4d

    rem-int/lit16 v7, v4, 0x80

    sput v7, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    rem-int/lit8 v4, v4, 0x2

    const-string/jumbo v7, "true"

    if-eqz v4, :cond_6

    .line 195
    iget-object v4, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    invoke-interface {v4, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v4, 0x5d

    :try_start_2
    div-int/2addr v4, v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_4

    :catchall_2
    move-exception p1

    .line 230
    throw p1

    .line 195
    :cond_6
    iget-object v4, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    invoke-interface {v4, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    :goto_4
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-static {v4}, Lcom/appsflyer/internal/ab;->AFInAppEventType(Landroid/content/ContentResolver;)Lcom/appsflyer/internal/g;

    move-result-object v4

    const/16 v5, 0x5b

    if-eqz v4, :cond_7

    const/16 v7, 0x5b

    goto :goto_5

    :cond_7
    const/16 v7, 0x59

    :goto_5
    if-eq v7, v5, :cond_8

    goto :goto_6

    .line 199
    :cond_8
    iget-object v5, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    .line 5024
    iget-object v7, v4, Lcom/appsflyer/internal/g;->values:Ljava/lang/String;

    const-string v8, "amazon_aid"

    .line 199
    invoke-interface {v5, v8, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    iget-object v5, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    .line 5029
    iget-object v4, v4, Lcom/appsflyer/internal/g;->AFKeystoreWrapper:Ljava/lang/Boolean;

    .line 200
    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v7, "amazon_aid_limit"

    invoke-interface {v5, v7, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    :goto_6
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    const-string v5, "advertiserId"

    invoke-virtual {v4, v5}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_9

    const/4 v7, 0x0

    goto :goto_7

    :cond_9
    const/4 v7, 0x1

    :goto_7
    if-eq v7, v3, :cond_b

    .line 195
    sget v7, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    add-int/2addr v7, v3

    rem-int/lit16 v3, v7, 0x80

    sput v3, Lcom/appsflyer/internal/cd;->onResponseNative:I

    rem-int/lit8 v7, v7, 0x2

    if-nez v7, :cond_a

    .line 204
    iget-object v3, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    invoke-interface {v3, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v3, 0x37

    :try_start_3
    div-int/2addr v3, v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    goto :goto_8

    :catchall_3
    move-exception p1

    .line 195
    throw p1

    .line 204
    :cond_a
    iget-object v3, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    invoke-interface {v3, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    :cond_b
    :goto_8
    iget-object v3, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const-string v4, "devkey"

    invoke-interface {v3, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    iget-object v2, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v3}, Lcom/appsflyer/internal/af;->valueOf(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "uid"

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    iget-object v2, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const-string v3, "af_gcm_token"

    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    iget-object p1, p0, Lcom/appsflyer/internal/cd;->onInstallConversionDataLoadedNative:Landroid/content/SharedPreferences;

    invoke-virtual {v1, p1, v6}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Z)I

    move-result p1

    .line 210
    iget-object v2, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    const-string v3, "launch_counter"

    invoke-interface {v2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    iget-object p1, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "sdk"

    invoke-interface {p1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    invoke-virtual {v1, v0}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x1b

    if-eqz p1, :cond_c

    const/16 v2, 0x3f

    goto :goto_9

    :cond_c
    const/16 v2, 0x1b

    :goto_9
    if-eq v2, v0, :cond_d

    .line 214
    iget-object v0, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const-string v2, "channel"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    :cond_d
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/appsflyer/internal/cd$3;

    invoke-direct {v0, p0, v1}, Lcom/appsflyer/internal/cd$3;-><init>(Lcom/appsflyer/internal/cd;Lcom/appsflyer/internal/ac;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 230
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public static AFKeystoreWrapper(Landroid/content/Context;)Z
    .locals 6

    .line 67
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_3

    :try_start_0
    const-string v0, "com.google.firebase.messaging.FirebaseMessagingService"

    .line 71
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 72
    new-instance v0, Landroid/content/Intent;

    const-string v3, "com.google.firebase.MESSAGING_EVENT"

    const/4 v4, 0x0

    const-class v5, Lcom/appsflyer/FirebaseMessagingServiceListener;

    invoke-direct {v0, v3, v4, p0, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    .line 73
    invoke-static {p0, v0}, Lcom/appsflyer/internal/z;->AFKeystoreWrapper(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v0, 0x28

    if-eqz p0, :cond_1

    const/16 p0, 0x28

    goto :goto_1

    :cond_1
    const/16 p0, 0x39

    :goto_1
    if-eq p0, v0, :cond_2

    goto :goto_2

    .line 78
    :cond_2
    sget p0, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    add-int/lit8 p0, p0, 0x51

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/cd;->onResponseNative:I

    rem-int/lit8 p0, p0, 0x2

    return v1

    :catchall_0
    move-exception p0

    const-string v0, "An error occurred while trying to verify manifest declarations: "

    .line 76
    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :catch_0
    :goto_2
    return v2

    .line 78
    :cond_3
    sget p0, Lcom/appsflyer/internal/cd;->onResponseNative:I

    add-int/lit8 v0, p0, 0x35

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    rem-int/lit8 v0, v0, 0x2

    add-int/lit8 p0, p0, 0xf

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    rem-int/lit8 p0, p0, 0x2

    return v2
.end method

.method static AFVersionDeclaration()V
    .locals 1

    const/16 v0, 0x9

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/appsflyer/internal/cd;->onResponseErrorNative:[C

    const/4 v0, 0x3

    sput-char v0, Lcom/appsflyer/internal/cd;->onConversionDataFail:C

    return-void

    nop

    :array_0
    .array-data 2
        0x62s
        0x72s
        0x61s
        0x6es
        0x64s
        0x63s
        0x65s
        0x66s
        0x67s
    .end array-data
.end method

.method private init()V
    .locals 5

    .line 110
    sget v0, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    add-int/lit8 v0, v0, 0x59

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/cd;->onResponseNative:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const-string v3, "Successfully registered for Uninstall Tracking"

    const-string v4, "sentRegisterRequestToAF"

    if-eqz v0, :cond_1

    .line 109
    iget-object v0, p0, Lcom/appsflyer/internal/cd;->onAppOpenAttributionNative:Lcom/appsflyer/internal/bv;

    invoke-interface {v0, v4, v2}, Lcom/appsflyer/internal/bv;->AFInAppEventType(Ljava/lang/String;Z)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/appsflyer/internal/cd;->onAppOpenAttributionNative:Lcom/appsflyer/internal/bv;

    invoke-interface {v0, v4, v1}, Lcom/appsflyer/internal/bv;->AFInAppEventType(Ljava/lang/String;Z)V

    .line 110
    :goto_1
    invoke-static {v3}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    sget v0, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    add-int/lit8 v0, v0, 0x4f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/cd;->onResponseNative:I

    rem-int/lit8 v0, v0, 0x2

    return-void
.end method

.method private onInstallConversionDataLoadedNative()Lcom/appsflyer/internal/am;
    .locals 12

    .line 115
    iget-object v0, p0, Lcom/appsflyer/internal/cd;->onInstallConversionDataLoadedNative:Landroid/content/SharedPreferences;

    const-string v1, "afUninstallToken"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 116
    iget-object v3, p0, Lcom/appsflyer/internal/cd;->onInstallConversionDataLoadedNative:Landroid/content/SharedPreferences;

    const-string v4, "afUninstallToken_received_time"

    const-wide/16 v5, 0x0

    invoke-interface {v3, v4, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    .line 117
    iget-object v7, p0, Lcom/appsflyer/internal/cd;->onInstallConversionDataLoadedNative:Landroid/content/SharedPreferences;

    const-string v8, "afUninstallToken_queued"

    const/4 v9, 0x0

    invoke-interface {v7, v8, v9}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    .line 118
    iget-object v10, p0, Lcom/appsflyer/internal/cd;->onAppOpenAttributionNative:Lcom/appsflyer/internal/bv;

    invoke-interface {v10, v8, v9}, Lcom/appsflyer/internal/bv;->AFInAppEventType(Ljava/lang/String;Z)V

    const-string v8, ","

    const/4 v10, 0x1

    if-nez v0, :cond_0

    .line 121
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v11

    invoke-virtual {v11, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_0

    .line 123
    invoke-virtual {v11, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 124
    array-length v11, v0

    sub-int/2addr v11, v10

    aget-object v0, v0, v11

    :cond_0
    cmp-long v11, v3, v5

    if-nez v11, :cond_1

    const/4 v5, 0x1

    goto :goto_0

    :cond_1
    const/4 v5, 0x0

    :goto_0
    const/4 v6, 0x2

    if-eqz v5, :cond_2

    .line 128
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 139
    sget v5, Lcom/appsflyer/internal/cd;->onResponseNative:I

    add-int/lit8 v5, v5, 0x7d

    rem-int/lit16 v11, v5, 0x80

    sput v11, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    rem-int/2addr v5, v6

    .line 130
    invoke-virtual {v1, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 131
    array-length v5, v1

    if-lt v5, v6, :cond_2

    .line 139
    sget v5, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    add-int/lit8 v5, v5, 0x51

    rem-int/lit16 v8, v5, 0x80

    sput v8, Lcom/appsflyer/internal/cd;->onResponseNative:I

    rem-int/2addr v5, v6

    .line 133
    :try_start_0
    array-length v5, v1

    sub-int/2addr v5, v6

    aget-object v1, v1, v5

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    nop

    :cond_2
    :goto_1
    if-eqz v0, :cond_5

    .line 139
    new-instance v1, Lcom/appsflyer/internal/am;

    invoke-direct {v1, v0, v3, v4, v7}, Lcom/appsflyer/internal/am;-><init>(Ljava/lang/String;JZ)V

    sget v0, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    add-int/lit8 v0, v0, 0x23

    rem-int/lit16 v3, v0, 0x80

    sput v3, Lcom/appsflyer/internal/cd;->onResponseNative:I

    rem-int/2addr v0, v6

    if-nez v0, :cond_3

    goto :goto_2

    :cond_3
    const/4 v9, 0x1

    :goto_2
    if-eqz v9, :cond_4

    return-object v1

    :cond_4
    :try_start_1
    invoke-super {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v1

    :catchall_0
    move-exception v0

    throw v0

    :cond_5
    return-object v2
.end method

.method static synthetic valueOf(Lcom/appsflyer/internal/cd;)V
    .locals 2

    .line 35
    sget v0, Lcom/appsflyer/internal/cd;->onResponseNative:I

    add-int/lit8 v0, v0, 0x2f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0}, Lcom/appsflyer/internal/cd;->init()V

    if-eqz v0, :cond_1

    const/4 p0, 0x0

    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    throw p0

    :cond_1
    :goto_1
    return-void
.end method

.method private values(Lcom/appsflyer/internal/am;)V
    .locals 4

    .line 147
    sget v0, Lcom/appsflyer/internal/cd;->onResponseNative:I

    add-int/lit8 v0, v0, 0x73

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    rem-int/lit8 v0, v0, 0x2

    .line 143
    iget-object v0, p0, Lcom/appsflyer/internal/cd;->onInstallConversionDataLoadedNative:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 4015
    iget-object v1, p1, Lcom/appsflyer/internal/am;->AFInAppEventType:Ljava/lang/String;

    const-string v2, "afUninstallToken"

    .line 144
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 4019
    iget-wide v1, p1, Lcom/appsflyer/internal/am;->AFKeystoreWrapper:J

    const-string v3, "afUninstallToken_received_time"

    .line 145
    invoke-interface {v0, v3, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 146
    invoke-virtual {p1}, Lcom/appsflyer/internal/am;->values()Z

    move-result p1

    const-string v1, "afUninstallToken_queued"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    .line 147
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    sget p1, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    add-int/lit8 p1, p1, 0x3f

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/cd;->onResponseNative:I

    rem-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_1

    const/4 p1, 0x0

    :try_start_0
    array-length p1, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1

    :cond_1
    return-void
.end method


# virtual methods
.method public final AFInAppEventParameterName(Ljava/lang/String;)V
    .locals 7

    if-eqz p1, :cond_3

    .line 87
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Firebase Refreshed Token = "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 88
    invoke-direct {p0}, Lcom/appsflyer/internal/cd;->onInstallConversionDataLoadedNative()Lcom/appsflyer/internal/am;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2015
    iget-object v1, v0, Lcom/appsflyer/internal/am;->AFInAppEventType:Ljava/lang/String;

    .line 89
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 90
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 91
    iget-object v3, p0, Lcom/appsflyer/internal/cd;->onInstallConversionDataLoadedNative:Landroid/content/SharedPreferences;

    invoke-static {v3}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/SharedPreferences;)Z

    move-result v3

    if-eqz v3, :cond_2

    if-eqz v0, :cond_1

    .line 2019
    iget-wide v3, v0, Lcom/appsflyer/internal/am;->AFKeystoreWrapper:J

    sub-long v3, v1, v3

    .line 91
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v5, 0x2

    invoke-virtual {v0, v5, v6}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v5

    cmp-long v0, v3, v5

    if-lez v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 92
    :goto_0
    new-instance v3, Lcom/appsflyer/internal/am;

    xor-int/lit8 v4, v0, 0x1

    invoke-direct {v3, p1, v1, v2, v4}, Lcom/appsflyer/internal/am;-><init>(Ljava/lang/String;JZ)V

    invoke-direct {p0, v3}, Lcom/appsflyer/internal/cd;->values(Lcom/appsflyer/internal/am;)V

    if-eqz v0, :cond_3

    .line 93
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/cd;->AFKeystoreWrapper(Ljava/lang/String;)V

    :cond_3
    return-void
.end method

.method public final AFKeystoreWrapper()V
    .locals 6

    .line 99
    invoke-direct {p0}, Lcom/appsflyer/internal/cd;->onInstallConversionDataLoadedNative()Lcom/appsflyer/internal/am;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    const/4 v4, 0x0

    if-eqz v3, :cond_3

    .line 104
    sget v3, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    add-int/lit8 v3, v3, 0x53

    rem-int/lit16 v5, v3, 0x80

    sput v5, Lcom/appsflyer/internal/cd;->onResponseNative:I

    rem-int/lit8 v3, v3, 0x2

    .line 100
    invoke-virtual {v0}, Lcom/appsflyer/internal/am;->values()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 104
    sget v3, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    add-int/lit8 v3, v3, 0xf

    rem-int/lit16 v5, v3, 0x80

    sput v5, Lcom/appsflyer/internal/cd;->onResponseNative:I

    rem-int/lit8 v3, v3, 0x2

    if-nez v3, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    const-string v2, "Resending Uninstall token to AF servers: "

    if-eqz v1, :cond_2

    .line 3015
    iget-object v0, v0, Lcom/appsflyer/internal/am;->AFInAppEventType:Ljava/lang/String;

    .line 103
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 104
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/cd;->AFKeystoreWrapper(Ljava/lang/String;)V

    :try_start_0
    invoke-super {v4}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    throw v0

    .line 3015
    :cond_2
    iget-object v0, v0, Lcom/appsflyer/internal/am;->AFInAppEventType:Ljava/lang/String;

    .line 103
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 104
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/cd;->AFKeystoreWrapper(Ljava/lang/String;)V

    :cond_3
    :goto_2
    sget v0, Lcom/appsflyer/internal/cd;->onResponseNative:I

    add-int/lit8 v0, v0, 0x4f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/cd;->onAppOpenAttribution:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x1a

    if-eqz v0, :cond_4

    const/16 v0, 0x1a

    goto :goto_3

    :cond_4
    const/16 v0, 0x50

    :goto_3
    if-eq v0, v1, :cond_5

    return-void

    :cond_5
    :try_start_1
    invoke-super {v4}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception v0

    throw v0
.end method
