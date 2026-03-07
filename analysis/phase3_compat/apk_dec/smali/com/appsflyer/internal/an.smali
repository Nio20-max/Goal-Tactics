.class public abstract Lcom/appsflyer/internal/an;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/an$c;
    }
.end annotation


# static fields
.field protected static AFInAppEventType:Ljava/lang/String; = null

.field private static AFKeystoreWrapper:Ljava/lang/String; = null

.field private static AFLogger$LogLevel:I = 0x0

.field private static init:J = 0x0L

.field private static onAppOpenAttributionNative:C = '\u0000'

.field private static onAttributionFailureNative:I = 0x1

.field private static onInstallConversionDataLoadedNative:I


# instance fields
.field public AFInAppEventParameterName:Ljava/lang/String;

.field public final AFVersionDeclaration:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final AppsFlyer2dXConversionCallback:Ljava/lang/String;

.field private final getLevel:Landroid/content/Context;

.field public final valueOf:Ljava/lang/String;

.field private final values:Lcom/appsflyer/internal/ac;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    invoke-static {}, Lcom/appsflyer/internal/an;->AFKeystoreWrapper()V

    const-string/jumbo v0, "v2"

    .line 28
    sput-object v0, Lcom/appsflyer/internal/an;->AFKeystoreWrapper:Ljava/lang/String;

    .line 30
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://%sonelink.%s/shortlink-sdk/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/appsflyer/internal/an;->AFKeystoreWrapper:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/internal/an;->AFInAppEventType:Ljava/lang/String;

    sget v0, Lcom/appsflyer/internal/an;->onAttributionFailureNative:I

    add-int/lit8 v0, v0, 0x19

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/an;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    return-void
.end method

.method public constructor <init>(Lcom/appsflyer/internal/ac;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/appsflyer/internal/an;->values:Lcom/appsflyer/internal/ac;

    .line 42
    iput-object p2, p0, Lcom/appsflyer/internal/an;->getLevel:Landroid/content/Context;

    .line 43
    iput-object p3, p0, Lcom/appsflyer/internal/an;->valueOf:Ljava/lang/String;

    .line 44
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/appsflyer/internal/an;->AppsFlyer2dXConversionCallback:Ljava/lang/String;

    .line 45
    invoke-direct {p0}, Lcom/appsflyer/internal/an;->AFInAppEventParameterName()Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lcom/appsflyer/internal/an;->AFVersionDeclaration:Ljava/util/Map;

    return-void
.end method

.method private AFInAppEventParameterName()Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 117
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "build_number"

    const-string v2, "6.5.4"

    .line 118
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    iget-object v1, p0, Lcom/appsflyer/internal/an;->values:Lcom/appsflyer/internal/ac;

    iget-object v2, p0, Lcom/appsflyer/internal/an;->getLevel:Landroid/content/Context;

    invoke-static {v2}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Z)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "counter"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v2, "model"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v1, -0x57134319

    const-string v2, ""

    .line 121
    invoke-static {v2, v2}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    move-result v2

    sub-int/2addr v1, v2

    const v2, 0xfe1e

    invoke-static {}, Landroid/view/ViewConfiguration;->getWindowTouchSlop()I

    move-result v4

    shr-int/lit8 v4, v4, 0x8

    add-int/2addr v4, v2

    int-to-char v2, v4

    const-string/jumbo v4, "\u7c9e\u1ca0\u4955\u7a77\uc791"

    const-string/jumbo v5, "\ue724\uecbc\u1ea8\u22fe"

    const-string/jumbo v6, "\u5622\uc972\u4eb3\u5137"

    invoke-static {v4, v5, v6, v1, v2}, Lcom/appsflyer/internal/an;->AFKeystoreWrapper(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "sdk"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_0
    const-string v1, "app_version_name"

    .line 124
    iget-object v2, p0, Lcom/appsflyer/internal/an;->getLevel:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    iget-object v4, p0, Lcom/appsflyer/internal/an;->getLevel:Landroid/content/Context;

    .line 125
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 124
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 131
    sget v1, Lcom/appsflyer/internal/an;->onInstallConversionDataLoadedNative:I

    add-int/lit8 v1, v1, 0x5f

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/an;->onAttributionFailureNative:I

    rem-int/lit8 v1, v1, 0x2

    .line 129
    :catch_0
    iget-object v1, p0, Lcom/appsflyer/internal/an;->getLevel:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "app_id"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    new-instance v1, Lcom/appsflyer/internal/al;

    invoke-direct {v1}, Lcom/appsflyer/internal/al;-><init>()V

    invoke-virtual {v1}, Lcom/appsflyer/internal/al;->AFInAppEventType()Ljava/lang/String;

    move-result-object v1

    const-string v2, "platformextension"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    sget v1, Lcom/appsflyer/internal/an;->onAttributionFailureNative:I

    add-int/lit8 v1, v1, 0x45

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/an;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v1, v1, 0x2

    return-object v0
.end method

.method private AFInAppEventType()V
    .locals 7

    const-string v0, ""

    .line 60
    invoke-virtual {p0}, Lcom/appsflyer/internal/an;->values()Ljava/lang/String;

    move-result-object v1

    .line 61
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "oneLinkUrl: "

    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    .line 1102
    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1103
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljavax/net/ssl/HttpsURLConnection;

    const-string v3, "content-type"

    const-string v4, "application/json"

    .line 64
    invoke-virtual {v2, v3, v4}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v3, 0xbb8

    .line 65
    invoke-virtual {v2, v3}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 66
    invoke-virtual {v2, v3}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 67
    iget-object v3, p0, Lcom/appsflyer/internal/an;->valueOf:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 68
    invoke-virtual {p0, v2}, Lcom/appsflyer/internal/an;->AFInAppEventParameterName(Ljavax/net/ssl/HttpsURLConnection;)V

    .line 69
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    .line 70
    invoke-static {v2}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 v4, 0xc8

    const/16 v5, 0x4b

    if-ne v3, v4, :cond_0

    const/16 v4, 0x51

    goto :goto_0

    :cond_0
    const/16 v4, 0x4b

    :goto_0
    if-eq v4, v5, :cond_3

    .line 85
    sget v3, Lcom/appsflyer/internal/an;->onAttributionFailureNative:I

    add-int/lit8 v3, v3, 0x2b

    rem-int/lit16 v4, v3, 0x80

    sput v4, Lcom/appsflyer/internal/an;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v3, v3, 0x2

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    const-string v4, "Status 200 ok"

    if-eqz v3, :cond_2

    .line 72
    :try_start_1
    invoke-static {v4}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    const/4 v3, 0x0

    array-length v1, v3

    goto :goto_3

    :cond_2
    invoke-static {v4}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    goto :goto_3

    .line 74
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "Response code = "

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " content = "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_2

    :catchall_1
    move-exception v2

    move-object v6, v2

    move-object v2, v0

    move-object v0, v6

    .line 77
    :goto_2
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "Error while calling "

    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " stacktrace: "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 80
    :goto_3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/16 v3, 0x1a

    if-eqz v1, :cond_4

    const/4 v1, 0x4

    goto :goto_4

    :cond_4
    const/16 v1, 0x1a

    :goto_4
    if-eq v1, v3, :cond_5

    .line 85
    sget v0, Lcom/appsflyer/internal/an;->onAttributionFailureNative:I

    add-int/lit8 v0, v0, 0x4d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/an;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    .line 81
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Connection call succeeded: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 82
    invoke-virtual {p0, v2}, Lcom/appsflyer/internal/an;->valueOf(Ljava/lang/String;)V

    return-void

    .line 84
    :cond_5
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Connection error: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    .line 85
    invoke-virtual {p0}, Lcom/appsflyer/internal/an;->valueOf()V

    return-void
.end method

.method private static AFKeystoreWrapper(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IC)Ljava/lang/String;
    .locals 7

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object p2

    :cond_0
    check-cast p2, [C

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object p1

    :cond_1
    check-cast p1, [C

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    :cond_2
    check-cast p0, [C

    .line 1123
    sget-object v0, Lcom/appsflyer/internal/dp;->valueOf:Ljava/lang/Object;

    monitor-enter v0

    .line 1125
    :try_start_0
    invoke-virtual {p1}, [C->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [C

    .line 1126
    invoke-virtual {p2}, [C->clone()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [C

    const/4 v1, 0x0

    .line 1127
    aget-char v2, p1, v1

    xor-int/2addr p4, v2

    int-to-char p4, p4

    aput-char p4, p1, v1

    const/4 p4, 0x2

    .line 1128
    aget-char v2, p2, p4

    int-to-char p3, p3

    add-int/2addr v2, p3

    int-to-char p3, v2

    aput-char p3, p2, p4

    .line 1130
    array-length p3, p0

    .line 1131
    new-array v2, p3, [C

    .line 1132
    sput v1, Lcom/appsflyer/internal/dp;->AFInAppEventParameterName:I

    :goto_0
    sget v1, Lcom/appsflyer/internal/dp;->AFInAppEventParameterName:I

    if-ge v1, p3, :cond_3

    .line 1134
    sget v1, Lcom/appsflyer/internal/dp;->AFInAppEventParameterName:I

    add-int/2addr v1, p4

    rem-int/lit8 v1, v1, 0x4

    .line 1135
    sget v3, Lcom/appsflyer/internal/dp;->AFInAppEventParameterName:I

    add-int/lit8 v3, v3, 0x3

    rem-int/lit8 v3, v3, 0x4

    .line 1138
    sget v4, Lcom/appsflyer/internal/dp;->AFInAppEventParameterName:I

    rem-int/lit8 v4, v4, 0x4

    aget-char v4, p1, v4

    mul-int/lit16 v4, v4, 0x7fce

    aget-char v5, p2, v1

    add-int/2addr v4, v5

    const v5, 0xffff

    rem-int/2addr v4, v5

    int-to-char v4, v4

    sput-char v4, Lcom/appsflyer/internal/dp;->AFInAppEventType:C

    .line 1141
    aget-char v4, p1, v3

    mul-int/lit16 v4, v4, 0x7fce

    aget-char v1, p2, v1

    add-int/2addr v4, v1

    div-int/2addr v4, v5

    int-to-char v1, v4

    aput-char v1, p2, v3

    .line 1144
    sget-char v1, Lcom/appsflyer/internal/dp;->AFInAppEventType:C

    aput-char v1, p1, v3

    .line 1147
    sget v1, Lcom/appsflyer/internal/dp;->AFInAppEventParameterName:I

    sget v4, Lcom/appsflyer/internal/dp;->AFInAppEventParameterName:I

    aget-char v4, p0, v4

    aget-char v3, p1, v3

    xor-int/2addr v3, v4

    int-to-long v3, v3

    sget-wide v5, Lcom/appsflyer/internal/an;->init:J

    xor-long/2addr v3, v5

    sget v5, Lcom/appsflyer/internal/an;->AFLogger$LogLevel:I

    int-to-long v5, v5

    xor-long/2addr v3, v5

    sget-char v5, Lcom/appsflyer/internal/an;->onAppOpenAttributionNative:C

    int-to-long v5, v5

    xor-long/2addr v3, v5

    long-to-int v4, v3

    int-to-char v3, v4

    aput-char v3, v2, v1

    .line 1132
    sget v1, Lcom/appsflyer/internal/dp;->AFInAppEventParameterName:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Lcom/appsflyer/internal/dp;->AFInAppEventParameterName:I

    goto :goto_0

    .line 1154
    :cond_3
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v2}, Ljava/lang/String;-><init>([C)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 1155
    monitor-exit v0

    throw p0
.end method

.method static AFKeystoreWrapper()V
    .locals 2

    const-wide v0, 0x51374eb3c9725622L    # 1.7686961262466715E83

    sput-wide v0, Lcom/appsflyer/internal/an;->init:J

    const/4 v0, 0x0

    sput-char v0, Lcom/appsflyer/internal/an;->onAppOpenAttributionNative:C

    sput v0, Lcom/appsflyer/internal/an;->AFLogger$LogLevel:I

    return-void
.end method


# virtual methods
.method protected abstract AFInAppEventParameterName(Ljavax/net/ssl/HttpsURLConnection;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected final varargs AFKeystoreWrapper(Ljavax/net/ssl/HttpsURLConnection;[Ljava/lang/String;)V
    .locals 6

    .line 108
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 p2, 0x1

    .line 109
    sget-object v1, Lcom/appsflyer/internal/an;->AFKeystoreWrapper:Ljava/lang/String;

    invoke-interface {v0, p2, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    const/4 p2, 0x0

    new-array v1, p2, [Ljava/lang/String;

    .line 110
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-static {v0}, Lcom/appsflyer/internal/ag;->AFInAppEventParameterName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v2

    invoke-virtual {v2}, Lcom/appsflyer/AppsFlyerProperties;->getDevKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/appsflyer/internal/an;->AppsFlyer2dXConversionCallback:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/appsflyer/internal/an;->AFKeystoreWrapper:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    const/16 v3, 0x30

    .line 113
    invoke-static {v2, v3, p2}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;CI)I

    move-result v4

    rsub-int/lit8 v4, v4, -0x1

    invoke-static {v2, v3, p2, p2}, Landroid/text/TextUtils;->lastIndexOf(Ljava/lang/CharSequence;CII)I

    move-result p2

    rsub-int/lit8 p2, p2, -0x1

    int-to-char p2, p2

    const-string/jumbo v2, "\u12fa\u529b\ufffb\ucb23\ua83b\u1335\uc0b8\u7443\ub702\u18eb\ud9f4\uef35"

    const-string/jumbo v3, "\ubf8e\uc235\udf77\u2497"

    const-string/jumbo v5, "\u5622\uc972\u4eb3\u5137"

    invoke-static {v2, v3, v5, v4, p2}, Lcom/appsflyer/internal/an;->AFKeystoreWrapper(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, v1}, Lcom/appsflyer/internal/ag;->valueOf(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    sget p1, Lcom/appsflyer/internal/an;->onInstallConversionDataLoadedNative:I

    add-int/lit8 p1, p1, 0x29

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/an;->onAttributionFailureNative:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method public run()V
    .locals 3

    .line 54
    sget v0, Lcom/appsflyer/internal/an;->onAttributionFailureNative:I

    add-int/lit8 v0, v0, 0x17

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/an;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0xa

    if-eqz v0, :cond_0

    const/16 v0, 0x34

    goto :goto_0

    :cond_0
    const/16 v0, 0xa

    :goto_0
    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/appsflyer/internal/an;->AFInAppEventType()V

    if-eq v0, v1, :cond_1

    const/16 v0, 0x41

    :try_start_0
    div-int/2addr v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    throw v0

    :cond_1
    :goto_1
    sget v0, Lcom/appsflyer/internal/an;->onAttributionFailureNative:I

    add-int/lit8 v0, v0, 0x7d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/an;->onInstallConversionDataLoadedNative:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_2

    const/4 v2, 0x1

    :cond_2
    if-eqz v2, :cond_3

    const/4 v0, 0x0

    :try_start_1
    invoke-super {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception v0

    throw v0

    :cond_3
    return-void
.end method

.method protected abstract valueOf()V
.end method

.method protected abstract valueOf(Ljava/lang/String;)V
.end method

.method protected abstract values()Ljava/lang/String;
.end method
