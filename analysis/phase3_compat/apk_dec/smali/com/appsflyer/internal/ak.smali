.class public final Lcom/appsflyer/internal/ak;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static AppsFlyer2dXConversionCallback:C = '\uae13'

.field private static init:C = '\uf714'

.field private static onAppOpenAttributionNative:C = '\u3c85'

.field private static onDeepLinkingNative:I = 0x0

.field private static onInstallConversionDataLoadedNative:I = 0x1

.field private static onInstallConversionFailureNative:C = '\u27aa'

.field private static values:Lcom/appsflyer/internal/ak;


# instance fields
.field private AFInAppEventParameterName:I

.field private AFInAppEventType:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private AFKeystoreWrapper:Z

.field private AFLogger$LogLevel:Z

.field private AFVersionDeclaration:Z

.field private getLevel:Ljava/lang/String;

.field private valueOf:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/ak;->AFInAppEventType:Ljava/util/List;

    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper:Z

    const-string v1, "-1"

    .line 33
    iput-object v1, p0, Lcom/appsflyer/internal/ak;->getLevel:Ljava/lang/String;

    .line 38
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const-string v2, "disableProxy"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/appsflyer/internal/ak;->AFLogger$LogLevel:Z

    .line 39
    iput v3, p0, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName:I

    .line 40
    iput-boolean v3, p0, Lcom/appsflyer/internal/ak;->AFVersionDeclaration:Z

    return-void
.end method

.method private static AFInAppEventParameterName(Ljava/lang/String;I)Ljava/lang/String;
    .locals 12

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    :cond_0
    check-cast p0, [C

    .line 1105
    sget-object v0, Lcom/appsflyer/internal/dt;->valueOf:Ljava/lang/Object;

    monitor-enter v0

    .line 1107
    :try_start_0
    array-length v1, p0

    new-array v1, v1, [C

    const/4 v2, 0x0

    .line 1109
    sput v2, Lcom/appsflyer/internal/dt;->AFInAppEventType:I

    const/4 v3, 0x2

    new-array v4, v3, [C

    .line 1111
    :goto_0
    sget v5, Lcom/appsflyer/internal/dt;->AFInAppEventType:I

    array-length v6, p0

    if-ge v5, v6, :cond_2

    .line 1113
    sget v5, Lcom/appsflyer/internal/dt;->AFInAppEventType:I

    aget-char v5, p0, v5

    aput-char v5, v4, v2

    .line 1114
    sget v5, Lcom/appsflyer/internal/dt;->AFInAppEventType:I

    const/4 v6, 0x1

    add-int/2addr v5, v6

    aget-char v5, p0, v5

    aput-char v5, v4, v6

    const v5, 0xe370

    const/4 v7, 0x0

    :goto_1
    const/16 v8, 0x10

    if-ge v7, v8, :cond_1

    .line 1119
    aget-char v8, v4, v6

    aget-char v9, v4, v2

    add-int/2addr v9, v5

    aget-char v10, v4, v2

    shl-int/lit8 v10, v10, 0x4

    sget-char v11, Lcom/appsflyer/internal/ak;->onInstallConversionFailureNative:C

    add-int/2addr v10, v11

    xor-int/2addr v9, v10

    aget-char v10, v4, v2

    ushr-int/lit8 v10, v10, 0x5

    sget-char v11, Lcom/appsflyer/internal/ak;->onAppOpenAttributionNative:C

    add-int/2addr v10, v11

    xor-int/2addr v9, v10

    sub-int/2addr v8, v9

    int-to-char v8, v8

    aput-char v8, v4, v6

    .line 1122
    aget-char v8, v4, v2

    aget-char v9, v4, v6

    add-int/2addr v9, v5

    aget-char v10, v4, v6

    shl-int/lit8 v10, v10, 0x4

    sget-char v11, Lcom/appsflyer/internal/ak;->init:C

    add-int/2addr v10, v11

    xor-int/2addr v9, v10

    aget-char v10, v4, v6

    ushr-int/lit8 v10, v10, 0x5

    sget-char v11, Lcom/appsflyer/internal/ak;->AppsFlyer2dXConversionCallback:C

    add-int/2addr v10, v11

    xor-int/2addr v9, v10

    sub-int/2addr v8, v9

    int-to-char v8, v8

    aput-char v8, v4, v2

    const v8, 0x9e37

    sub-int/2addr v5, v8

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1128
    :cond_1
    sget v5, Lcom/appsflyer/internal/dt;->AFInAppEventType:I

    aget-char v7, v4, v2

    aput-char v7, v1, v5

    .line 1129
    sget v5, Lcom/appsflyer/internal/dt;->AFInAppEventType:I

    add-int/2addr v5, v6

    aget-char v6, v4, v6

    aput-char v6, v1, v5

    .line 1130
    sget v5, Lcom/appsflyer/internal/dt;->AFInAppEventType:I

    add-int/2addr v5, v3

    sput v5, Lcom/appsflyer/internal/dt;->AFInAppEventType:I

    goto :goto_0

    .line 1134
    :cond_2
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1, v2, p1}, Ljava/lang/String;-><init>([CII)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 1135
    monitor-exit v0

    throw p0
.end method

.method private declared-synchronized AFInAppEventParameterName(Ljava/lang/String;Landroid/content/pm/PackageManager;)V
    .locals 8

    monitor-enter p0

    .line 221
    :try_start_0
    sget v0, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 v0, v0, 0x43

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eq v0, v1, :cond_1

    .line 192
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v3, "remote_debug_static_data"

    .line 194
    invoke-virtual {v0, v3}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    goto :goto_1

    .line 192
    :cond_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v3, "remote_debug_static_data"

    .line 194
    invoke-virtual {v0, v3}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    const/16 v5, 0x5e

    .line 195
    :try_start_1
    div-int/2addr v5, v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-eqz v4, :cond_2

    .line 197
    :goto_1
    :try_start_2
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/appsflyer/internal/n;->valueOf(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    .line 201
    :cond_2
    :try_start_3
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    .line 202
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v4

    const-string v5, "advertiserId"

    .line 204
    invoke-virtual {v0, v5}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, v4, Lcom/appsflyer/internal/ac;->AppsFlyer2dXConversionCallback:Ljava/lang/String;

    iget-object v4, v4, Lcom/appsflyer/internal/ac;->init:Ljava/lang/String;

    .line 203
    invoke-direct {p0, v5, v6, v4}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "6.5.4."

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Lcom/appsflyer/internal/ac;->valueOf:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 209
    invoke-virtual {v0}, Lcom/appsflyer/AppsFlyerProperties;->getDevKey()Ljava/lang/String;

    move-result-object v5

    const-string v6, "KSAppsFlyerId"

    .line 210
    invoke-virtual {v0, v6}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "uid"

    .line 211
    invoke-virtual {v0, v7}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 207
    invoke-direct {p0, v4, v5, v6, v7}, Lcom/appsflyer/internal/ak;->AFInAppEventType(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 213
    :try_start_4
    invoke-virtual {p2, p1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p2

    iget p2, p2, Landroid/content/pm/PackageInfo;->versionCode:I

    const-string v4, "channel"

    .line 214
    invoke-virtual {v0, v4}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "preInstallName"

    .line 215
    invoke-virtual {v0, v5}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 216
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2, v4, v5}, Lcom/appsflyer/internal/ak;->valueOf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 219
    :catchall_0
    :try_start_5
    new-instance p1, Lorg/json/JSONObject;

    iget-object p2, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    invoke-direct {p1, p2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v3, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    sget p1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 p1, p1, 0x61

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_3

    const/4 v2, 0x1

    .line 221
    :catchall_1
    :cond_3
    :goto_2
    iget-object p1, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string p2, "launch_counter"

    iget-object v0, p0, Lcom/appsflyer/internal/ak;->getLevel:Ljava/lang/String;

    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    monitor-exit p0

    return-void

    :catchall_2
    move-exception p1

    :try_start_6
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    :catchall_3
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    monitor-enter p0

    .line 95
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string/jumbo v1, "\uc25d\u93ed\u78bb\u58e8\uf0c3\ufbbb"

    const/4 v2, 0x0

    invoke-static {v2, v2}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v3

    rsub-int/lit8 v3, v3, 0x5

    invoke-static {v1, v3}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    sget-object v3, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    iget-object v0, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string v1, "model"

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    iget-object v0, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string v1, "platform"

    const-string v3, "Android"

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    iget-object v0, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string v1, "platform_version"

    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    const/4 v2, 0x1

    :cond_0
    if-eq v2, v0, :cond_1

    goto :goto_0

    .line 99
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_2

    .line 100
    iget-object v0, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string v1, "advertiserId"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :cond_2
    :goto_0
    const/16 p1, 0x29

    if-eqz p2, :cond_3

    const/16 v0, 0x29

    goto :goto_1

    :cond_3
    const/16 v0, 0x40

    :goto_1
    if-eq v0, p1, :cond_4

    goto :goto_3

    .line 108
    :cond_4
    :try_start_1
    sget p1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 p1, p1, 0x73

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 p1, p1, 0x2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    :try_start_2
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    const/16 v0, 0x46

    if-lez p1, :cond_5

    const/16 p1, 0x46

    goto :goto_2

    :cond_5
    const/16 p1, 0x37

    :goto_2
    if-eq p1, v0, :cond_6

    goto :goto_3

    .line 103
    :cond_6
    iget-object p1, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string v0, "imei"

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_3
    if-eqz p3, :cond_7

    .line 105
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-lez p1, :cond_7

    .line 108
    :try_start_3
    sget p1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 p1, p1, 0x11

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 p1, p1, 0x2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 106
    :try_start_4
    iget-object p1, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string p2, "android_id"

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_7
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    .line 108
    :catchall_1
    monitor-exit p0

    return-void
.end method

.method private varargs declared-synchronized AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V
    .locals 3

    monitor-enter p0

    .line 181
    :try_start_0
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x55

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    .line 172
    invoke-direct {p0}, Lcom/appsflyer/internal/ak;->AppsFlyer2dXConversionCallback()Z

    move-result v0

    const/16 v1, 0xd

    if-eqz v0, :cond_0

    const/16 v0, 0x52

    goto :goto_0

    :cond_0
    const/16 v0, 0xd

    :goto_0
    if-eq v0, v1, :cond_5

    iget v0, p0, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const v1, 0x18000

    if-lt v0, v1, :cond_1

    goto/16 :goto_3

    .line 174
    :cond_1
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-string v2, ", "

    .line 175
    invoke-static {v2, p3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    if-eqz p1, :cond_2

    .line 177
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " _/AppsFlyer_6.5.4 ["

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "] "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 178
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "/AppsFlyer_6.5.4 "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 179
    :goto_1
    iget-object p2, p0, Lcom/appsflyer/internal/ak;->AFInAppEventType:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    iget p2, p0, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    shl-int/lit8 p1, p1, 0x1

    add-int/2addr p2, p1

    iput p2, p0, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 181
    :try_start_2
    sget p1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 p1, p1, 0x1f

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 p1, p1, 0x2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    const/16 p2, 0x59

    if-eqz p1, :cond_3

    const/16 p1, 0x11

    goto :goto_2

    :cond_3
    const/16 p1, 0x59

    :goto_2
    if-eq p1, p2, :cond_4

    const/4 p1, 0x0

    :try_start_3
    array-length p1, p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_4
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :cond_4
    monitor-exit p0

    return-void

    :catchall_1
    monitor-exit p0

    return-void

    :cond_5
    :goto_3
    :try_start_5
    sget p1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 p1, p1, 0x67

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 p1, p1, 0x2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    monitor-exit p0

    return-void

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public static AFInAppEventType()Lcom/appsflyer/internal/ak;
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 51
    sget v0, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 v0, v0, 0x13

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 v0, v0, 0x2

    .line 48
    sget-object v0, Lcom/appsflyer/internal/ak;->values:Lcom/appsflyer/internal/ak;

    if-nez v0, :cond_0

    .line 49
    new-instance v0, Lcom/appsflyer/internal/ak;

    invoke-direct {v0}, Lcom/appsflyer/internal/ak;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/ak;->values:Lcom/appsflyer/internal/ak;

    .line 51
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/ak;->values:Lcom/appsflyer/internal/ak;

    sget v1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v1, v1, 0xd

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v2, 0x1

    if-nez v1, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    :goto_0
    if-eq v1, v2, :cond_2

    const/4 v1, 0x0

    :try_start_0
    invoke-super {v1}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v0

    throw v0

    :cond_2
    return-object v0
.end method

.method private declared-synchronized AFInAppEventType(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    monitor-enter p0

    .line 114
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string v1, "sdk_version"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 p1, 0x37

    if-eqz p2, :cond_0

    const/16 v0, 0x35

    goto :goto_0

    :cond_0
    const/16 v0, 0x37

    :goto_0
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, p1, :cond_2

    .line 115
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_1

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    if-eqz p1, :cond_2

    .line 116
    iget-object p1, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string v0, "devkey"

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :cond_2
    if-eqz p3, :cond_7

    .line 119
    :try_start_1
    sget p1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 p1, p1, 0x11

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 p1, p1, 0x2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p1, :cond_3

    :try_start_2
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1

    const/4 p2, 0x0

    array-length p2, p2

    if-lez p1, :cond_7

    goto :goto_3

    .line 118
    :cond_3
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/16 p2, 0x53

    if-lez p1, :cond_4

    const/16 p1, 0x2b

    goto :goto_2

    :cond_4
    const/16 p1, 0x53

    :goto_2
    if-eq p1, p2, :cond_7

    .line 124
    :goto_3
    :try_start_3
    sget p1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 p1, p1, 0x61

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 p1, p1, 0x2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz p1, :cond_5

    const/4 p1, 0x1

    goto :goto_4

    :cond_5
    const/4 p1, 0x0

    :goto_4
    if-eq p1, v1, :cond_6

    .line 119
    :try_start_4
    iget-object p1, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string p2, "originalAppsFlyerId"

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    :cond_6
    iget-object p1, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string p2, "originalAppsFlyerId"

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 p1, 0x38

    div-int/2addr p1, v2

    goto :goto_5

    :catchall_0
    move-exception p1

    goto :goto_7

    :cond_7
    :goto_5
    const/16 p1, 0x10

    if-eqz p4, :cond_8

    const/16 p2, 0x10

    goto :goto_6

    :cond_8
    const/16 p2, 0x5c

    :goto_6
    if-eq p2, p1, :cond_9

    goto :goto_8

    .line 121
    :cond_9
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-lez p1, :cond_b

    .line 119
    :try_start_5
    sget p1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 p1, p1, 0x4b

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 p1, p1, 0x2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz p1, :cond_a

    .line 122
    :try_start_6
    iget-object p1, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string/jumbo p2, "uid"

    invoke-interface {p1, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 p1, 0x3f

    div-int/2addr p1, v2

    goto :goto_8

    :cond_a
    iget-object p1, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string/jumbo p2, "uid"

    invoke-interface {p1, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_8

    :goto_7
    monitor-exit p0

    throw p1

    :cond_b
    :goto_8
    monitor-exit p0

    return-void

    .line 124
    :catchall_1
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized AFLogger$LogLevel()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    .line 188
    :try_start_0
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x2f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    .line 186
    iget-object v0, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string v1, "data"

    iget-object v2, p0, Lcom/appsflyer/internal/ak;->AFInAppEventType:Ljava/util/List;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    invoke-direct {p0}, Lcom/appsflyer/internal/ak;->init()V

    .line 188
    iget-object v0, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    sget v1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v1, v1, 0x73

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v1, v1, 0x2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 v2, 0x30

    if-nez v1, :cond_0

    const/16 v1, 0x5a

    goto :goto_0

    :cond_0
    const/16 v1, 0x30

    :goto_0
    if-eq v1, v2, :cond_1

    const/4 v1, 0x0

    :try_start_1
    invoke-super {v1}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_2
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_1
    monitor-exit p0

    return-object v0

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private AppsFlyer2dXConversionCallback()Z
    .locals 4

    .line 89
    sget v0, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 v0, v0, 0x3d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0xe

    if-eqz v0, :cond_0

    const/16 v0, 0x10

    goto :goto_0

    :cond_0
    const/16 v0, 0xe

    :goto_0
    const/4 v2, 0x0

    if-eq v0, v1, :cond_1

    iget-boolean v0, p0, Lcom/appsflyer/internal/ak;->AFLogger$LogLevel:Z

    const/4 v1, 0x0

    :try_start_0
    invoke-super {v1}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_7

    goto :goto_2

    :catchall_0
    move-exception v0

    throw v0

    :cond_1
    iget-boolean v0, p0, Lcom/appsflyer/internal/ak;->AFLogger$LogLevel:Z

    const/16 v1, 0x5c

    if-eqz v0, :cond_2

    const/16 v0, 0x5c

    goto :goto_1

    :cond_2
    const/16 v0, 0x53

    :goto_1
    if-eq v0, v1, :cond_3

    goto :goto_5

    :cond_3
    :goto_2
    iget-boolean v0, p0, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper:Z

    const/4 v1, 0x1

    if-nez v0, :cond_4

    const/4 v0, 0x1

    goto :goto_3

    :cond_4
    const/4 v0, 0x0

    :goto_3
    if-eq v0, v1, :cond_5

    goto :goto_6

    :cond_5
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x55

    rem-int/lit16 v3, v0, 0x80

    sput v3, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    iget-boolean v0, p0, Lcom/appsflyer/internal/ak;->AFVersionDeclaration:Z

    if-eqz v0, :cond_6

    const/4 v0, 0x0

    goto :goto_4

    :cond_6
    const/4 v0, 0x1

    :goto_4
    if-eqz v0, :cond_8

    :cond_7
    :goto_5
    sget v0, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 v0, v0, 0x2b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 v0, v0, 0x2

    return v2

    :cond_8
    :goto_6
    return v1
.end method

.method private declared-synchronized init()V
    .locals 3

    monitor-enter p0

    .line 237
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/ak;->AFInAppEventType:Ljava/util/List;

    const/4 v0, 0x0

    .line 238
    iput v0, p0, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName:I

    sget v1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v1, v1, 0x49

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v1, v1, 0x2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    const/16 v1, 0x48

    :try_start_1
    div-int/2addr v1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_1
    monitor-exit p0

    return-void

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized valueOf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    monitor-enter p0

    .line 131
    :try_start_0
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x37

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 130
    :try_start_1
    array-length v0, v1

    if-eqz p1, :cond_4

    goto :goto_1

    :cond_0
    const/16 v0, 0x10

    if-eqz p1, :cond_1

    const/16 v2, 0x10

    goto :goto_0

    :cond_1
    const/16 v2, 0x43

    :goto_0
    if-eq v2, v0, :cond_2

    goto :goto_2

    :cond_2
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-lez v0, :cond_4

    .line 142
    :try_start_2
    sget v0, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 v0, v0, 0x55

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 v0, v0, 0x2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v0, :cond_3

    .line 131
    :try_start_3
    iget-object v0, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string v2, "app_id"

    invoke-interface {v0, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    array-length p1, v1

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string v1, "app_id"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    :goto_2
    const/4 p1, 0x7

    if-eqz p2, :cond_5

    const/4 v0, 0x7

    goto :goto_3

    :cond_5
    const/16 v0, 0x5b

    :goto_3
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, p1, :cond_6

    goto :goto_5

    .line 133
    :cond_6
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-lez p1, :cond_7

    const/4 p1, 0x1

    goto :goto_4

    :cond_7
    const/4 p1, 0x0

    :goto_4
    if-eqz p1, :cond_8

    .line 131
    :try_start_4
    sget p1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 p1, p1, 0x45

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 p1, p1, 0x2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 134
    :try_start_5
    iget-object p1, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string v0, "app_version"

    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_8
    :goto_5
    if-eqz p3, :cond_9

    .line 136
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1

    if-lez p1, :cond_9

    .line 137
    iget-object p1, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string p2, "channel"

    invoke-interface {p1, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9
    const/16 p1, 0x47

    if-eqz p4, :cond_a

    const/16 p2, 0x47

    goto :goto_6

    :cond_a
    const/16 p2, 0x41

    :goto_6
    if-eq p2, p1, :cond_b

    goto :goto_7

    .line 139
    :cond_b
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-lez p1, :cond_c

    const/4 v1, 0x1

    :cond_c
    if-eq v1, v2, :cond_d

    goto :goto_7

    .line 130
    :cond_d
    :try_start_6
    sget p1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 p1, p1, 0x71

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 p1, p1, 0x2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 140
    :try_start_7
    iget-object p1, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    const-string p2, "preInstall"

    invoke-interface {p1, p2, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    :goto_7
    monitor-exit p0

    return-void

    .line 142
    :catchall_0
    monitor-exit p0

    return-void

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private static values(Ljava/lang/String;[Ljava/lang/StackTraceElement;)[Ljava/lang/String;
    .locals 4

    .line 233
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x7b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v0, 0x1d

    if-nez p1, :cond_0

    const/16 v1, 0x1d

    goto :goto_0

    :cond_0
    const/16 v1, 0x31

    :goto_0
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v1, v0, :cond_5

    .line 228
    array-length v0, p1

    add-int/2addr v0, v3

    new-array v0, v0, [Ljava/lang/String;

    .line 229
    aput-object p0, v0, v2

    .line 230
    :goto_1
    array-length p0, p1

    const/16 v1, 0x3c

    if-ge v3, p0, :cond_1

    const/16 p0, 0x9

    goto :goto_2

    :cond_1
    const/16 p0, 0x3c

    :goto_2
    if-eq p0, v1, :cond_2

    .line 231
    aget-object p0, p1, v3

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v0, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 233
    :cond_2
    sget p0, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 p0, p0, 0x1f

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 p0, p0, 0x2

    const/16 p1, 0x3d

    if-eqz p0, :cond_3

    const/16 p0, 0x2f

    goto :goto_3

    :cond_3
    const/16 p0, 0x3d

    :goto_3
    if-eq p0, p1, :cond_4

    const/16 p0, 0x28

    :try_start_0
    div-int/2addr p0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception p0

    throw p0

    :cond_4
    return-object v0

    :cond_5
    new-array p1, v3, [Ljava/lang/String;

    aput-object p0, p1, v2

    return-object p1
.end method


# virtual methods
.method final declared-synchronized AFInAppEventParameterName()V
    .locals 4

    monitor-enter p0

    :try_start_0
    const-string v0, "r_debugging_off"

    .line 64
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyy-MM-dd HH:mm:ssZ"

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/String;

    invoke-direct {p0, v0, v1, v3}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 65
    iput-boolean v2, p0, Lcom/appsflyer/internal/ak;->AFVersionDeclaration:Z

    .line 66
    iput-boolean v2, p0, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper:Z

    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x2b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    const/4 v1, 0x2

    rem-int/2addr v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v3, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    if-eq v0, v3, :cond_1

    :try_start_1
    div-int/2addr v1, v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_1
    monitor-exit p0

    return-void

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 168
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x7b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v0, 0x0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-direct {p0, v0, p1, v1}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    sget p1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 p1, p1, 0x17

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method final AFInAppEventType(Ljava/lang/String;Landroid/content/pm/PackageManager;)V
    .locals 2

    .line 84
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x75

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    .line 76
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Landroid/content/pm/PackageManager;)V

    .line 77
    invoke-direct {p0}, Lcom/appsflyer/internal/ak;->AFLogger$LogLevel()Ljava/util/Map;

    move-result-object p1

    .line 78
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object p2

    .line 79
    invoke-virtual {p2}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object p2

    .line 80
    invoke-interface {p2}, Lcom/appsflyer/internal/bg;->valueOf()Lcom/appsflyer/internal/bd;

    move-result-object p2

    .line 81
    invoke-virtual {p2, p1}, Lcom/appsflyer/internal/bd;->AFKeystoreWrapper(Ljava/util/Map;)Lcom/appsflyer/internal/bl;

    move-result-object p1

    const/4 p2, 0x0

    .line 1084
    iget-object v0, p1, Lcom/appsflyer/internal/bl;->valueOf:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1060
    iget-object v0, p1, Lcom/appsflyer/internal/bl;->AFKeystoreWrapper:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/appsflyer/internal/bl$3;

    invoke-direct {v1, p1, p2}, Lcom/appsflyer/internal/bl$3;-><init>(Lcom/appsflyer/internal/bl;Lcom/appsflyer/internal/bi;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    sget p1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 p1, p1, 0x7d

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 p1, p1, 0x2

    return-void

    .line 1085
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Http call is already executed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 84
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/Throwable;)V

    return-void
.end method

.method public final AFInAppEventType(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 160
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x69

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    const-string p2, "server_request"

    invoke-direct {p0, p2, p1, v0}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    sget p1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 p1, p1, 0x2b

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 p1, p1, 0x2

    const/16 p2, 0x59

    if-nez p1, :cond_0

    const/16 p1, 0x12

    goto :goto_0

    :cond_0
    const/16 p1, 0x59

    :goto_0
    if-eq p1, p2, :cond_1

    const/4 p1, 0x0

    :try_start_0
    invoke-super {p1}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1

    :cond_1
    return-void
.end method

.method final declared-synchronized AFKeystoreWrapper()V
    .locals 4

    monitor-enter p0

    const/4 v0, 0x1

    .line 59
    :try_start_0
    iput-boolean v0, p0, Lcom/appsflyer/internal/ak;->AFVersionDeclaration:Z

    const-string v0, "r_debugging_on"

    .line 60
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string/jumbo v2, "yyyy-MM-dd HH:mm:ssZ"

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    sget v0, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 v0, v0, 0x1b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 v0, v0, 0x2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final varargs AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V
    .locals 3

    .line 147
    sget v0, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 v0, v0, 0x4d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x25

    if-eqz v0, :cond_0

    const/16 v0, 0x62

    goto :goto_0

    :cond_0
    const/16 v0, 0x25

    :goto_0
    const-string v2, "public_api_call"

    invoke-direct {p0, v2, p1, p2}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    if-eq v0, v1, :cond_1

    const/4 p1, 0x0

    :try_start_0
    array-length p1, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    throw p1

    :cond_1
    :goto_1
    sget p1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 p1, p1, 0x59

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method final AFVersionDeclaration()Z
    .locals 3

    .line 251
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x15

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    iget-boolean v0, p0, Lcom/appsflyer/internal/ak;->AFVersionDeclaration:Z

    add-int/lit8 v1, v1, 0x31

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 v1, v1, 0x2

    const/16 v2, 0x37

    if-eqz v1, :cond_0

    const/4 v1, 0x3

    goto :goto_0

    :cond_0
    const/16 v1, 0x37

    :goto_0
    if-eq v1, v2, :cond_1

    const/4 v1, 0x0

    :try_start_0
    invoke-super {v1}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    :catchall_0
    move-exception v0

    throw v0

    :cond_1
    return v0
.end method

.method final getLevel()V
    .locals 3

    .line 247
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v1, v0, 0x1d

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v1, v1, 0x2

    const/16 v2, 0x57

    if-nez v1, :cond_0

    const/16 v1, 0x4f

    goto :goto_0

    :cond_0
    const/16 v1, 0x57

    :goto_0
    if-eq v1, v2, :cond_1

    const/4 v1, 0x1

    :goto_1
    iput-boolean v1, p0, Lcom/appsflyer/internal/ak;->AFLogger$LogLevel:Z

    goto :goto_2

    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    :goto_2
    add-int/lit8 v0, v0, 0x2d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    return-void
.end method

.method final declared-synchronized valueOf()V
    .locals 3

    monitor-enter p0

    .line 243
    :try_start_0
    sget v0, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 v0, v0, 0x5b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x14

    if-eqz v0, :cond_0

    const/16 v0, 0x28

    goto :goto_0

    :cond_0
    const/16 v0, 0x14

    :goto_0
    const/4 v2, 0x0

    if-eq v0, v1, :cond_1

    .line 242
    iput-boolean v2, p0, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper:Z

    .line 243
    :goto_1
    invoke-direct {p0}, Lcom/appsflyer/internal/ak;->init()V

    goto :goto_2

    .line 242
    :cond_1
    iput-boolean v2, p0, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 243
    :goto_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final valueOf(Ljava/lang/Throwable;)V
    .locals 5

    .line 156
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x75

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    .line 151
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 152
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x3f

    if-nez v0, :cond_0

    const/16 v3, 0x2e

    goto :goto_0

    :cond_0
    const/16 v3, 0x3f

    :goto_0
    if-eq v3, v2, :cond_1

    .line 153
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    :goto_1
    const/4 v3, 0x1

    if-nez v0, :cond_2

    const/4 v4, 0x0

    goto :goto_2

    :cond_2
    const/4 v4, 0x1

    :goto_2
    if-eq v4, v3, :cond_3

    .line 156
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x57

    rem-int/lit16 v3, v0, 0x80

    sput v3, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    .line 154
    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p1

    goto :goto_3

    :cond_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p1

    .line 156
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x33

    rem-int/lit16 v3, v0, 0x80

    sput v3, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    .line 155
    :goto_3
    invoke-static {v2, p1}, Lcom/appsflyer/internal/ak;->values(Ljava/lang/String;[Ljava/lang/StackTraceElement;)[Ljava/lang/String;

    move-result-object p1

    const-string v0, "exception"

    .line 156
    invoke-direct {p0, v0, v1, p1}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method final declared-synchronized values()V
    .locals 3

    monitor-enter p0

    .line 71
    :try_start_0
    sget v0, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    add-int/lit8 v0, v0, 0x17

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 v2, 0x0

    if-eq v0, v1, :cond_1

    .line 70
    iput-object v2, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    .line 71
    sput-object v2, Lcom/appsflyer/internal/ak;->values:Lcom/appsflyer/internal/ak;

    goto :goto_1

    .line 70
    :cond_1
    iput-object v2, p0, Lcom/appsflyer/internal/ak;->valueOf:Ljava/util/Map;

    .line 71
    sput-object v2, Lcom/appsflyer/internal/ak;->values:Lcom/appsflyer/internal/ak;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    array-length v0, v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_2
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final declared-synchronized values(Ljava/lang/String;)V
    .locals 3

    monitor-enter p0

    .line 55
    :try_start_0
    sget v0, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 v1, v0, 0x61

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 v1, v1, 0x2

    iput-object p1, p0, Lcom/appsflyer/internal/ak;->getLevel:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x23

    rem-int/lit16 p1, v0, 0x80

    sput p1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    rem-int/lit8 v0, v0, 0x2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    if-eqz p1, :cond_1

    monitor-exit p0

    return-void

    :cond_1
    const/4 p1, 0x0

    :try_start_1
    array-length p1, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_2
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final values(Ljava/lang/String;ILjava/lang/String;)V
    .locals 5

    .line 164
    sget v0, Lcom/appsflyer/internal/ak;->onInstallConversionDataLoadedNative:I

    add-int/lit8 v0, v0, 0x3b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ak;->onDeepLinkingNative:I

    const/4 v1, 0x2

    rem-int/2addr v0, v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const-string v4, "server_response"

    if-eq v0, v3, :cond_1

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    aput-object p2, v0, v3

    aput-object p3, v0, v3

    invoke-direct {p0, v4, p1, v0}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    new-array v0, v1, [Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    aput-object p2, v0, v2

    aput-object p3, v0, v3

    invoke-direct {p0, v4, p1, v0}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    :goto_1
    return-void
.end method
