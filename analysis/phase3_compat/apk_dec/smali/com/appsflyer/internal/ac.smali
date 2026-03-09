.class public final Lcom/appsflyer/internal/ac;
.super Lcom/appsflyer/AppsFlyerLib;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/ac$e;,
        Lcom/appsflyer/internal/ac$d;,
        Lcom/appsflyer/internal/ac$b;
    }
.end annotation


# static fields
.field static AFInAppEventParameterName:Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener; = null

.field public static final AFInAppEventType:Ljava/lang/String;

.field public static AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener; = null

.field private static AFLogger$LogLevel:Ljava/lang/String; = null

.field private static enableLocationCollection:J = 0x0L

.field private static onAppOpenAttributionNative:Ljava/lang/String; = null

.field private static onAttributionFailureNative:Ljava/lang/String; = null

.field private static onConversionDataFail:Lcom/appsflyer/internal/ac; = null

.field private static onDeepLinkingNative:Ljava/lang/String; = null

.field private static final onInstallConversionDataLoadedNative:Ljava/lang/String;

.field private static onInstallConversionFailureNative:Ljava/lang/String; = null

.field private static onResponseErrorNative:Ljava/lang/String; = null

.field private static setCustomerIdAndLogSession:I = 0x1

.field static final valueOf:Ljava/lang/String;

.field public static final values:Ljava/lang/String;

.field private static waitForCustomerUserId:I


# instance fields
.field AFVersionDeclaration:J

.field AppsFlyer2dXConversionCallback:Ljava/lang/String;

.field private AppsFlyerConversionListener:Z

.field private AppsFlyerInAppPurchaseValidatorListener:Z

.field private AppsFlyerLib:Z

.field private getInstance:Z

.field public getLevel:Lcom/appsflyer/internal/y;

.field private getSdkVersion:Landroid/content/SharedPreferences;

.field init:Ljava/lang/String;

.field private onAppOpenAttribution:J

.field private onAttributionFailure:Ljava/util/concurrent/ScheduledExecutorService;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private onConversionDataSuccess:J

.field private onDeepLinking:Ljava/lang/String;

.field private onPause:Ljava/lang/String;

.field private onResponse:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private onResponseError:Z

.field private onResponseNative:J

.field private onValidateInApp:Z

.field private final onValidateInAppFailure:Lcom/appsflyer/internal/al;

.field private setAndroidIdData:Lcom/appsflyer/internal/dc;

.field private final setCustomerUserId:Lcom/appsflyer/internal/bf;

.field private setDebugLog:Z

.field private setImeiData:Lcom/appsflyer/internal/az;

.field private final setOaidData:Ljava/util/concurrent/Executor;

.field private stop:Landroid/app/Application;

.field private updateServerUninstallToken:Ljava/util/Map;
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
    .locals 3

    invoke-static {}, Lcom/appsflyer/internal/ac;->AFVersionDeclaration()V

    const-string v0, "170"

    .line 145
    sput-object v0, Lcom/appsflyer/internal/ac;->valueOf:Ljava/lang/String;

    const/4 v0, 0x0

    .line 148
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    add-int/lit16 v1, v1, 0x6fe3

    const-string/jumbo v2, "\u1cbd"

    invoke-static {v2, v1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    const-string v2, "6.5.4"

    invoke-virtual {v2, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/internal/ac;->AFInAppEventType:Ljava/lang/String;

    const-string v1, "https://%sstats.%s/stats"

    .line 149
    sput-object v1, Lcom/appsflyer/internal/ac;->AFLogger$LogLevel:Ljava/lang/String;

    .line 159
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/androidevent?buildnumber=6.5.4&app_id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/appsflyer/internal/ac;->values:Ljava/lang/String;

    .line 160
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://%sadrevenue.%s/api/v"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/android?buildnumber=6.5.4&app_id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/appsflyer/internal/ac;->onInstallConversionFailureNative:Ljava/lang/String;

    .line 163
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/androidevent?app_id="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/internal/ac;->onInstallConversionDataLoadedNative:Ljava/lang/String;

    .line 165
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://%sconversions.%s/api/v"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/appsflyer/internal/ac;->onDeepLinkingNative:Ljava/lang/String;

    .line 166
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://%slaunches.%s/api/v"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/appsflyer/internal/ac;->onAppOpenAttributionNative:Ljava/lang/String;

    .line 167
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://%sinapps.%s/api/v"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/appsflyer/internal/ac;->onAttributionFailureNative:Ljava/lang/String;

    .line 169
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://%sattr.%s/api/v"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/internal/ac;->onResponseErrorNative:Ljava/lang/String;

    const/4 v0, 0x0

    .line 191
    sput-object v0, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName:Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;

    .line 192
    sput-object v0, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener;

    .line 194
    new-instance v0, Lcom/appsflyer/internal/ac;

    invoke-direct {v0}, Lcom/appsflyer/internal/ac;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/ac;->onConversionDataFail:Lcom/appsflyer/internal/ac;

    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x1d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 236
    invoke-direct {p0}, Lcom/appsflyer/AppsFlyerLib;-><init>()V

    const-wide/16 v0, -0x1

    .line 197
    iput-wide v0, p0, Lcom/appsflyer/internal/ac;->onAppOpenAttribution:J

    .line 198
    iput-wide v0, p0, Lcom/appsflyer/internal/ac;->onResponseNative:J

    .line 199
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x5

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/appsflyer/internal/ac;->onConversionDataSuccess:J

    const/4 v0, 0x0

    .line 200
    iput-boolean v0, p0, Lcom/appsflyer/internal/ac;->onResponseError:Z

    const/4 v1, 0x0

    .line 203
    iput-object v1, p0, Lcom/appsflyer/internal/ac;->onAttributionFailure:Ljava/util/concurrent/ScheduledExecutorService;

    .line 205
    iput-boolean v0, p0, Lcom/appsflyer/internal/ac;->AppsFlyerConversionListener:Z

    .line 210
    new-instance v1, Lcom/appsflyer/internal/al;

    invoke-direct {v1}, Lcom/appsflyer/internal/al;-><init>()V

    iput-object v1, p0, Lcom/appsflyer/internal/ac;->onValidateInAppFailure:Lcom/appsflyer/internal/al;

    .line 211
    iput-boolean v0, p0, Lcom/appsflyer/internal/ac;->onValidateInApp:Z

    .line 212
    iput-boolean v0, p0, Lcom/appsflyer/internal/ac;->getInstance:Z

    .line 216
    iput-boolean v0, p0, Lcom/appsflyer/internal/ac;->setDebugLog:Z

    .line 220
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/internal/ac;->setOaidData:Ljava/util/concurrent/Executor;

    .line 237
    invoke-static {}, Lcom/appsflyer/AFVersionDeclaration;->init()V

    .line 238
    new-instance v0, Lcom/appsflyer/internal/bf;

    invoke-direct {v0}, Lcom/appsflyer/internal/bf;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    return-void
.end method

.method static synthetic AFInAppEventParameterName(Lcom/appsflyer/internal/ac;)Landroid/app/Application;
    .locals 3

    .line 139
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x27

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    iget-object p0, p0, Lcom/appsflyer/internal/ac;->stop:Landroid/app/Application;

    add-int/lit8 v1, v1, 0x1b

    rem-int/lit16 v0, v1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v0, 0x0

    const/4 v2, 0x1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    :goto_0
    if-eq v1, v2, :cond_1

    const/16 v1, 0x56

    :try_start_0
    div-int/2addr v1, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    throw p0

    :cond_1
    return-object p0
.end method

.method public static AFInAppEventParameterName()Lcom/appsflyer/internal/ac;
    .locals 3

    .line 247
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x67

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    sget-object v0, Lcom/appsflyer/internal/ac;->onConversionDataFail:Lcom/appsflyer/internal/ac;

    add-int/lit8 v1, v1, 0x2f

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    return-object v0
.end method

.method private static AFInAppEventParameterName(Landroid/app/Activity;)Ljava/lang/String;
    .locals 6

    const-string v0, "af"

    const/4 v1, 0x0

    if-eqz p0, :cond_3

    .line 2261
    sget v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v2, v2, 0x77

    rem-int/lit16 v3, v2, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v2, v2, 0x2

    .line 2244
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 2247
    :try_start_0
    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    const/16 v4, 0x60

    if-eqz v3, :cond_0

    const/16 v5, 0x18

    goto :goto_0

    :cond_0
    const/16 v5, 0x60

    :goto_0
    if-eq v5, v4, :cond_3

    .line 2249
    invoke-virtual {v3, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v4, 0x1c

    if-eqz v1, :cond_1

    const/16 v5, 0x1c

    goto :goto_1

    :cond_1
    const/16 v5, 0x40

    :goto_1
    if-eq v5, v4, :cond_2

    goto :goto_2

    .line 2261
    :cond_2
    sget v4, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v4, v4, 0x77

    rem-int/lit16 v5, v4, 0x80

    sput v5, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v4, v4, 0x2

    :try_start_1
    const-string v4, "Push Notification received af payload = "

    .line 2251
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 2252
    invoke-virtual {v3, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 2253
    invoke-virtual {v2, v3}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p0

    .line 2257
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    return-object v1
.end method

.method private static AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 622
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x3d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x3b

    if-nez v0, :cond_0

    const/16 v0, 0x3b

    goto :goto_0

    :cond_0
    const/16 v0, 0x60

    :goto_0
    if-eq v0, v1, :cond_1

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x1f

    :try_start_0
    div-int/lit8 v0, v0, 0x0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x2b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    return-object p0

    :catchall_0
    move-exception p0

    throw p0
.end method

.method public static AFInAppEventParameterName(Ljava/net/HttpURLConnection;)Ljava/lang/String;
    .locals 11

    .line 3041
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 3044
    :try_start_0
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v4

    if-nez v4, :cond_0

    .line 3046
    invoke-virtual {p0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    .line 3049
    :cond_0
    new-instance v5, Ljava/io/InputStreamReader;

    invoke-direct {v5, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 3050
    :try_start_1
    new-instance v4, Ljava/io/BufferedReader;

    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    const/4 v1, 0x0

    .line 3054
    :goto_0
    :try_start_2
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v6, :cond_3

    .line 3082
    sget v7, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v8, v7, 0x1b

    rem-int/lit16 v9, v8, 0x80

    sput v9, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v8, v8, 0x2

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    if-eqz v1, :cond_2

    add-int/lit8 v7, v7, 0x73

    rem-int/lit16 v1, v7, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v7, v7, 0x2

    const/16 v1, 0xa

    .line 3055
    :try_start_3
    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    goto :goto_2

    :cond_2
    const-string v1, ""

    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    const/4 v1, 0x1

    goto :goto_0

    .line 3063
    :cond_3
    :try_start_4
    invoke-virtual {v4}, Ljava/io/Reader;->close()V

    .line 3066
    invoke-virtual {v5}, Ljava/io/Reader;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_4

    :catchall_0
    move-exception p0

    .line 3069
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/Throwable;)V

    goto :goto_4

    :catchall_1
    move-exception v1

    move-object v10, v4

    move-object v4, v1

    move-object v1, v10

    goto :goto_3

    :catchall_2
    move-exception v4

    goto :goto_3

    :catchall_3
    move-exception v4

    move-object v5, v1

    .line 3059
    :goto_3
    :try_start_5
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Could not read connection response from: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/net/URLConnection;->getURL()Ljava/net/URL;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v4}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    if-eqz v1, :cond_4

    .line 3063
    :try_start_6
    invoke-virtual {v1}, Ljava/io/Reader;->close()V

    :cond_4
    if-eqz v5, :cond_5

    const/4 v2, 0x0

    :cond_5
    if-eqz v2, :cond_6

    goto :goto_4

    .line 3066
    :cond_6
    invoke-virtual {v5}, Ljava/io/Reader;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 3082
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x17

    rem-int/lit16 v1, p0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    .line 3072
    :goto_4
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    .line 3074
    :try_start_7
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_0

    return-object p0

    .line 3077
    :catch_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_8
    const-string/jumbo v1, "string_response"

    .line 3079
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3080
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_1

    return-object p0

    .line 3082
    :catch_1
    new-instance p0, Lorg/json/JSONObject;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :catchall_4
    move-exception p0

    if-eqz v1, :cond_7

    .line 3063
    :try_start_9
    invoke-virtual {v1}, Ljava/io/Reader;->close()V

    goto :goto_5

    :catchall_5
    move-exception v0

    goto :goto_7

    :cond_7
    :goto_5
    if-eqz v5, :cond_8

    goto :goto_6

    :cond_8
    const/4 v2, 0x0

    :goto_6
    if-eqz v2, :cond_9

    .line 3066
    invoke-virtual {v5}, Ljava/io/Reader;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    goto :goto_8

    .line 3069
    :goto_7
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/Throwable;)V

    goto :goto_9

    .line 3082
    :cond_9
    :goto_8
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x6f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 3071
    :goto_9
    throw p0
.end method

.method static synthetic AFInAppEventParameterName(Lcom/appsflyer/internal/ac;Ljava/util/concurrent/ScheduledExecutorService;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 2

    .line 139
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x75

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    iput-object p1, p0, Lcom/appsflyer/internal/ac;->onAttributionFailure:Ljava/util/concurrent/ScheduledExecutorService;

    add-int/lit8 v1, v1, 0x4d

    rem-int/lit16 p0, v1, 0x80

    sput p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    return-object p1
.end method

.method private AFInAppEventParameterName(Landroid/content/Context;Lcom/appsflyer/internal/ch;)V
    .locals 3

    .line 1250
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x5f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 1247
    iget-object v0, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    if-eqz p1, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_1

    add-int/lit8 v1, v1, 0x13

    .line 1250
    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    .line 18062
    iget-object v0, v0, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    if-eqz p1, :cond_1

    .line 19018
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, v0, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 1248
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/bg;->getLevel()Lcom/appsflyer/internal/cl;

    move-result-object v0

    .line 1249
    invoke-static {p1}, Lcom/appsflyer/internal/n;->AFInAppEventParameterName(Landroid/content/Context;)Lcom/appsflyer/internal/cj;

    move-result-object p1

    .line 19110
    invoke-virtual {v0}, Lcom/appsflyer/internal/cl;->AFInAppEventType()Z

    move-result v1

    const/16 v2, 0x41

    if-eqz v1, :cond_2

    const/16 v1, 0x38

    goto :goto_1

    :cond_2
    const/16 v1, 0x41

    :goto_1
    if-eq v1, v2, :cond_3

    .line 19111
    iget-object v1, v0, Lcom/appsflyer/internal/cl;->AFInAppEventParameterName:Ljava/util/Map;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v2, "api_name"

    invoke-interface {v1, v2, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19112
    invoke-virtual {v0, p1}, Lcom/appsflyer/internal/cl;->valueOf(Lcom/appsflyer/internal/cj;)V

    .line 1250
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x7b

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    :cond_3
    invoke-virtual {v0}, Lcom/appsflyer/internal/cl;->AFKeystoreWrapper()V

    return-void
.end method

.method private AFInAppEventParameterName(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1447
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v0, 0x69

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    if-eqz p3, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_2

    add-int/lit8 v0, v0, 0x39

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 1442
    invoke-virtual {p3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 1445
    :cond_1
    new-instance v0, Lcom/appsflyer/internal/co;

    invoke-direct {v0}, Lcom/appsflyer/internal/co;-><init>()V

    goto :goto_2

    .line 1443
    :cond_2
    :goto_1
    new-instance v0, Lcom/appsflyer/internal/cp;

    invoke-direct {v0}, Lcom/appsflyer/internal/cp;-><init>()V

    :goto_2
    const/16 v1, 0x5f

    if-eqz p1, :cond_3

    const/16 v2, 0x9

    goto :goto_3

    :cond_3
    const/16 v2, 0x5f

    :goto_3
    if-eq v2, v1, :cond_4

    .line 31053
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Landroid/app/Application;

    iput-object p1, v0, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    .line 31099
    :cond_4
    iput-object p3, v0, Lcom/appsflyer/internal/i;->getLevel:Ljava/lang/String;

    .line 31129
    iput-object p2, v0, Lcom/appsflyer/internal/i;->AFVersionDeclaration:Ljava/lang/String;

    .line 32062
    iput-object p4, v0, Lcom/appsflyer/internal/i;->values:Ljava/util/Map;

    .line 32108
    iput-object p5, v0, Lcom/appsflyer/internal/i;->AppsFlyer2dXConversionCallback:Ljava/lang/String;

    .line 32117
    iput-object p6, v0, Lcom/appsflyer/internal/i;->valueOf:Ljava/lang/String;

    .line 1447
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/ac;->values(Lcom/appsflyer/internal/i;)V

    return-void
.end method

.method private AFInAppEventParameterName(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1357
    new-instance v0, Lcom/appsflyer/internal/co;

    invoke-direct {v0}, Lcom/appsflyer/internal/co;-><init>()V

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    sget v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v2, v2, 0x77

    rem-int/lit16 v3, v2, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v2, v2, 0x2

    if-nez v2, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Landroid/app/Application;

    iput-object v2, v0, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    :try_start_0
    invoke-super {v1}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    throw p1

    .line 28053
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Landroid/app/Application;

    iput-object v2, v0, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    .line 28099
    :cond_1
    :goto_0
    iput-object p2, v0, Lcom/appsflyer/internal/i;->getLevel:Ljava/lang/String;

    .line 29062
    iput-object p3, v0, Lcom/appsflyer/internal/i;->values:Ljava/util/Map;

    .line 1358
    instance-of p2, p1, Landroid/app/Activity;

    if-eqz p2, :cond_2

    const/4 p2, 0x0

    goto :goto_1

    :cond_2
    const/4 p2, 0x1

    :goto_1
    if-eqz p2, :cond_3

    .line 1357
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x23

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    goto :goto_2

    :cond_3
    sget p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p2, p2, 0x49

    rem-int/lit16 p3, p2, 0x80

    sput p3, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_4

    check-cast p1, Landroid/app/Activity;

    :try_start_1
    invoke-super {v1}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v1, p1

    goto :goto_2

    :catchall_1
    move-exception p1

    throw p1

    .line 1358
    :cond_4
    move-object v1, p1

    check-cast v1, Landroid/app/Activity;

    .line 1357
    :goto_2
    invoke-virtual {p0, v0, v1}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Lcom/appsflyer/internal/i;Landroid/app/Activity;)V

    return-void
.end method

.method private AFInAppEventParameterName(Landroid/content/Context;ZLjava/util/Map;I)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;I)V"
        }
    .end annotation

    .line 2159
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "ro.product.cpu.abi"

    .line 2160
    invoke-static {v1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "cpu_abi"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "ro.product.cpu.abi2"

    .line 2161
    invoke-static {v1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "cpu_abi2"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "os.arch"

    .line 2162
    invoke-static {v1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "arch"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "ro.build.display.id"

    .line 2163
    invoke-static {v1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "build_display_id"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    :goto_0
    if-eqz p2, :cond_1

    goto :goto_5

    .line 2170
    :cond_1
    sget p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p2, p2, 0x4f

    rem-int/lit16 v1, p2, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    const/4 v1, 0x2

    rem-int/2addr p2, v1

    const/16 v2, 0x34

    if-nez p2, :cond_2

    const/16 p2, 0x34

    goto :goto_1

    :cond_2
    const/16 p2, 0x37

    :goto_1
    const/4 v3, 0x0

    if-eq p2, v2, :cond_3

    .line 2166
    iget-boolean p2, p0, Lcom/appsflyer/internal/ac;->AppsFlyerConversionListener:Z

    if-eqz p2, :cond_7

    goto :goto_2

    :cond_3
    iget-boolean p2, p0, Lcom/appsflyer/internal/ac;->AppsFlyerConversionListener:Z

    :try_start_0
    array-length v2, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p2, :cond_7

    .line 2168
    :goto_2
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFLogger$LogLevel(Landroid/content/Context;)Ljava/util/Map;

    move-result-object p2

    .line 2169
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    const/16 v4, 0x32

    if-nez v2, :cond_4

    const/16 v2, 0x32

    goto :goto_3

    :cond_4
    const/16 v2, 0x26

    :goto_3
    if-eq v2, v4, :cond_5

    goto :goto_4

    .line 2186
    :cond_5
    sget v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v2, v2, 0x2d

    rem-int/lit16 v4, v2, 0x80

    sput v4, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr v2, v1

    const-string v4, "loc"

    if-eqz v2, :cond_6

    .line 2170
    invoke-interface {v0, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_1
    invoke-super {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_4

    :catchall_0
    move-exception p1

    .line 2186
    throw p1

    .line 2170
    :cond_6
    invoke-interface {v0, v4, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2174
    :cond_7
    :goto_4
    invoke-static {p1, v0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Landroid/content/Context;Ljava/util/Map;)V

    if-gt p4, v1, :cond_8

    .line 2178
    invoke-static {p1}, Lcom/appsflyer/internal/w;->AFKeystoreWrapper(Landroid/content/Context;)Lcom/appsflyer/internal/w;

    move-result-object p2

    invoke-virtual {p2}, Lcom/appsflyer/internal/w;->AFKeystoreWrapper()Ljava/util/Map;

    move-result-object p2

    invoke-interface {v0, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 2182
    :cond_8
    :goto_5
    invoke-static {p1}, Lcom/appsflyer/internal/y;->AFInAppEventType(Landroid/content/Context;)Ljava/util/Map;

    move-result-object p1

    const-string p2, "dim"

    .line 2183
    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "deviceData"

    .line 2186
    invoke-interface {p3, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :catchall_1
    move-exception p1

    .line 2170
    throw p1
.end method

.method private static AFInAppEventParameterName(Landroid/content/SharedPreferences;Ljava/lang/String;J)V
    .locals 2

    .line 610
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x79

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 608
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 609
    invoke-interface {p0, p1, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 610
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/SharedPreferences$Editor;)V

    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x2d

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    return-void
.end method

.method static synthetic AFInAppEventParameterName(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;)V
    .locals 2

    .line 139
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x5d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    invoke-direct {p0, p1}, Lcom/appsflyer/internal/ac;->valueOf(Lcom/appsflyer/internal/i;)V

    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x63

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    :goto_0
    if-eqz p0, :cond_1

    return-void

    :cond_1
    const/4 p0, 0x0

    :try_start_0
    array-length p0, p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    throw p0
.end method

.method private AFInAppEventParameterName(Lcom/appsflyer/internal/i;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 2877
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "url: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50150
    iget-object v1, p1, Lcom/appsflyer/internal/i;->onDeepLinkingNative:Ljava/lang/String;

    .line 2877
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 50151
    iget-object v0, p1, Lcom/appsflyer/internal/i;->init:Ljava/lang/String;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 v3, 0x2

    if-eq v0, v1, :cond_3

    .line 2883
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p1}, Lcom/appsflyer/internal/i;->values()Ljava/util/Map;

    move-result-object v4

    invoke-direct {v0, v4}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v4, "\\p{C}"

    const-string v5, "*Non-printing character*"

    .line 2884
    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2885
    invoke-virtual {v4, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    if-eqz v1, :cond_2

    .line 2903
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x41

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr v0, v3

    const-string v0, "Payload contains non-printing characters"

    .line 2887
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    move-object v0, v4

    .line 2889
    :cond_2
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "data: "

    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/internal/ai;->AFKeystoreWrapper(Ljava/lang/String;)V

    .line 2903
    sget v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v1, 0x2f

    rem-int/lit16 v4, v1, 0x80

    sput v4, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr v1, v3

    goto :goto_2

    .line 2880
    :cond_3
    invoke-virtual {p1}, Lcom/appsflyer/internal/i;->AFInAppEventParameterName()[B

    move-result-object v0

    invoke-static {v0, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    .line 2881
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "cached data: "

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 2891
    :goto_2
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v1

    .line 50152
    iget-object v3, p1, Lcom/appsflyer/internal/i;->onDeepLinkingNative:Ljava/lang/String;

    .line 2891
    invoke-virtual {v1, v3, v0}, Lcom/appsflyer/internal/ak;->AFInAppEventType(Ljava/lang/String;Ljava/lang/String;)V

    .line 2894
    :try_start_0
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/ac;->init(Lcom/appsflyer/internal/i;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const-string v1, "Exception in sendRequestToServer. "

    .line 2896
    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2898
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    const-string/jumbo v3, "useHttpFallback"

    invoke-virtual {v1, v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 50153
    iget-object v0, p1, Lcom/appsflyer/internal/i;->onDeepLinkingNative:Ljava/lang/String;

    const-string v1, "https:"

    const-string v2, "http:"

    .line 2900
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/appsflyer/internal/i;->AFInAppEventType(Ljava/lang/String;)Lcom/appsflyer/internal/i;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/appsflyer/internal/ac;->init(Lcom/appsflyer/internal/i;)V

    return-void

    .line 2902
    :cond_4
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "failed to send request to server. "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 2903
    throw v0
.end method

.method private AFInAppEventParameterName(Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1683
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    const/16 v1, 0x4f

    add-int/2addr v0, v1

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const-string v2, "collectAndroidIdForceByUser"

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v0, :cond_0

    .line 1661
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    .line 1662
    invoke-virtual {v0, v2, v4}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_1

    .line 1661
    :cond_0
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    .line 1662
    invoke-virtual {v0, v2, v4}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    :goto_0
    if-eq v0, v3, :cond_3

    .line 1663
    :goto_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v2, "collectIMEIForceByUser"

    .line 1664
    invoke-virtual {v0, v2, v4}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    goto :goto_3

    :cond_3
    :goto_2
    const/4 v0, 0x1

    :goto_3
    if-nez v0, :cond_c

    .line 1662
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x55

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const-string v0, "advertiserId"

    .line 1667
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 1670
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/ac;->init:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/16 v2, 0x15

    if-eqz v0, :cond_4

    const/16 v0, 0x15

    goto :goto_4

    :cond_4
    const/16 v0, 0x26

    :goto_4
    if-eq v0, v2, :cond_5

    goto :goto_5

    .line 1662
    :cond_5
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/2addr v0, v2

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    :try_start_1
    const-string v0, "android_id"

    .line 1671
    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_6

    const-string/jumbo v0, "validateGaidAndIMEI :: removing: android_id"

    .line 1673
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 1676
    :cond_6
    :goto_5
    iget-object v0, p0, Lcom/appsflyer/internal/ac;->AppsFlyer2dXConversionCallback:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-eqz v0, :cond_b

    .line 1662
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x1d

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v2, 0x42

    if-nez v0, :cond_7

    const/16 v1, 0x42

    :cond_7
    const-string v0, "imei"

    if-eq v1, v2, :cond_9

    .line 1677
    :try_start_2
    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_8

    const/4 v3, 0x0

    :cond_8
    if-eqz v3, :cond_a

    goto :goto_6

    :cond_9
    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const/4 v0, 0x0

    :try_start_3
    invoke-super {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz p1, :cond_b

    :cond_a
    :try_start_4
    const-string/jumbo p1, "validateGaidAndIMEI :: removing: imei"

    .line 1679
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_6

    :catchall_0
    move-exception p1

    .line 1662
    throw p1

    :cond_b
    :goto_6
    return-void

    :catch_0
    move-exception p1

    const-string v0, "failed to remove IMEI or AndroidID key from params; "

    .line 1683
    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_c
    return-void
.end method

.method static synthetic AFInAppEventParameterName(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;Landroid/content/SharedPreferences;)Z
    .locals 2

    .line 139
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x43

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/ac;->valueOf(Lcom/appsflyer/internal/i;Landroid/content/SharedPreferences;)Z

    move-result p0

    if-eq v0, v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :try_start_0
    invoke-super {p1}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    return p0

    :catchall_0
    move-exception p0

    throw p0
.end method

.method public static declared-synchronized AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 4

    const-class v0, Lcom/appsflyer/internal/ac;

    monitor-enter v0

    .line 2802
    :try_start_0
    sget v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v1, 0x4f

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    .line 2798
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v1

    iget-object v1, v1, Lcom/appsflyer/internal/ac;->getSdkVersion:Landroid/content/SharedPreferences;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    .line 2802
    sget v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v1, v1, 0x19

    rem-int/lit16 v3, v1, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    .line 2799
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v1

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v3, "appsflyer-data"

    .line 2800
    invoke-virtual {p0, v3, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    iput-object p0, v1, Lcom/appsflyer/internal/ac;->getSdkVersion:Landroid/content/SharedPreferences;

    .line 2802
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x7

    rem-int/lit16 v1, p0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object p0

    iget-object p0, p0, Lcom/appsflyer/internal/ac;->getSdkVersion:Landroid/content/SharedPreferences;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static AFInAppEventType()Ljava/lang/String;
    .locals 3

    .line 1108
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0xf

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x36

    if-nez v0, :cond_0

    const/16 v0, 0x15

    goto :goto_0

    :cond_0
    const/16 v0, 0x36

    :goto_0
    const-string v2, "AppUserId"

    if-eq v0, v1, :cond_1

    invoke-static {v2}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x37

    :try_start_0
    div-int/lit8 v1, v1, 0x0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    throw v0

    :cond_1
    invoke-static {v2}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    return-object v0
.end method

.method private AFInAppEventType(Ljava/text/SimpleDateFormat;Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    .line 2769
    invoke-static {p2}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "appsFlyerFirstInstall"

    .line 2770
    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x12

    if-nez v0, :cond_0

    const/16 v3, 0x29

    goto :goto_0

    :cond_0
    const/16 v3, 0x12

    :goto_0
    if-eq v3, v1, :cond_2

    .line 2772
    invoke-static {p2}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "AppsFlyer: first launch detected"

    .line 2773
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 2774
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {p1, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    .line 2783
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x19

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    goto :goto_1

    :cond_1
    const-string p1, ""

    :goto_1
    move-object v0, p1

    .line 2778
    invoke-static {p2, v2, v0}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 2783
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x71

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    .line 2781
    :cond_2
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "AppsFlyer: first launch date: "

    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    return-object v0
.end method

.method public static AFInAppEventType(Ljava/util/Map;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 2125
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x17

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x2b

    if-nez v0, :cond_0

    const/16 v0, 0x48

    goto :goto_0

    :cond_0
    const/16 v0, 0x2b

    :goto_0
    const-string v2, "meta"

    if-eq v0, v1, :cond_1

    .line 2123
    invoke-interface {p0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    :try_start_0
    array-length v1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_3

    goto :goto_2

    :catchall_0
    move-exception p0

    .line 2125
    throw p0

    .line 2123
    :cond_1
    invoke-interface {p0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    const/16 v1, 0x19

    if-eqz v0, :cond_2

    const/16 v0, 0x19

    goto :goto_1

    :cond_2
    const/16 v0, 0x5d

    :goto_1
    if-eq v0, v1, :cond_4

    .line 2124
    :cond_3
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p0, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 2123
    :cond_4
    :goto_2
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object v0, p0

    check-cast v0, Ljava/util/Map;

    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0x1d

    rem-int/lit16 v1, p0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    :goto_3
    return-object v0
.end method

.method private AFInAppEventType(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5

    .line 1515
    new-instance v0, Lcom/appsflyer/internal/cq;

    invoke-direct {v0}, Lcom/appsflyer/internal/cq;-><init>()V

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    if-eqz v3, :cond_1

    .line 1522
    sget v3, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v3, v3, 0x6d

    rem-int/lit16 v4, v3, 0x80

    sput v4, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v3, v3, 0x2

    .line 36053
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Landroid/app/Application;

    iput-object v3, v0, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    .line 36108
    :cond_1
    iput-object p2, v0, Lcom/appsflyer/internal/i;->AppsFlyer2dXConversionCallback:Ljava/lang/String;

    if-eqz p2, :cond_2

    const/4 v3, 0x1

    goto :goto_1

    :cond_2
    const/4 v3, 0x0

    :goto_1
    if-eq v3, v1, :cond_3

    goto :goto_2

    .line 1518
    :cond_3
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    const/4 v1, 0x5

    if-le p2, v1, :cond_5

    .line 1522
    sget p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p2, p2, 0x17

    rem-int/lit16 v1, p2, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p2, p2, 0x2

    .line 1519
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/appsflyer/internal/ac;->valueOf(Lcom/appsflyer/internal/i;Landroid/content/SharedPreferences;)Z

    move-result p1

    if-eqz p1, :cond_5

    .line 37046
    sget-object p1, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    if-nez p1, :cond_4

    .line 37047
    new-instance p1, Lcom/appsflyer/internal/k;

    invoke-direct {p1}, Lcom/appsflyer/internal/k;-><init>()V

    sput-object p1, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 37049
    :cond_4
    sget-object p1, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 1520
    invoke-virtual {p1}, Lcom/appsflyer/internal/k;->AFKeystoreWrapper()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object p1

    .line 1521
    new-instance p2, Lcom/appsflyer/internal/ac$b;

    invoke-direct {p2, p0, v0, v2}, Lcom/appsflyer/internal/ac$b;-><init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;B)V

    const-wide/16 v0, 0x5

    .line 1522
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p1, p2, v0, v1, v2}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x3f

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    :cond_5
    :goto_2
    return-void
.end method

.method public static AFInAppEventType(Landroid/content/Context;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "-",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 2196
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0xf

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    .line 50097
    sget-object v0, Lcom/appsflyer/internal/u$d;->valueOf:Lcom/appsflyer/internal/u;

    .line 2190
    invoke-static {p0}, Lcom/appsflyer/internal/u;->AFInAppEventType(Landroid/content/Context;)Lcom/appsflyer/internal/u$a;

    move-result-object p0

    .line 50098
    iget-object v0, p0, Lcom/appsflyer/internal/u$a;->AFKeystoreWrapper:Ljava/lang/String;

    const-string v1, "network"

    .line 2191
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2192
    iget-object v0, p0, Lcom/appsflyer/internal/u$a;->values:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 2196
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x67

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v2, 0x18

    if-nez v0, :cond_0

    const/16 v0, 0x2a

    goto :goto_0

    :cond_0
    const/16 v0, 0x18

    :goto_0
    const-string v3, "operator"

    if-eq v0, v2, :cond_1

    .line 50100
    iget-object v0, p0, Lcom/appsflyer/internal/u$a;->values:Ljava/lang/String;

    .line 2193
    invoke-interface {p1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v0, 0x42

    :try_start_0
    div-int/2addr v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    .line 2196
    throw p0

    .line 50100
    :cond_1
    iget-object v0, p0, Lcom/appsflyer/internal/u$a;->values:Ljava/lang/String;

    .line 2193
    invoke-interface {p1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2195
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/appsflyer/internal/u$a;->AFInAppEventType:Ljava/lang/String;

    const/16 v2, 0xe

    if-eqz v0, :cond_3

    const/16 v0, 0xe

    goto :goto_2

    :cond_3
    const/16 v0, 0x14

    :goto_2
    if-eq v0, v2, :cond_4

    goto :goto_5

    .line 2196
    :cond_4
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    const/4 v2, 0x1

    add-int/2addr v0, v2

    rem-int/lit16 v3, v0, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_5

    goto :goto_3

    :cond_5
    const/4 v1, 0x1

    :goto_3
    const-string v0, "carrier"

    if-eqz v1, :cond_6

    .line 50102
    iget-object p0, p0, Lcom/appsflyer/internal/u$a;->AFInAppEventType:Ljava/lang/String;

    .line 2196
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 50102
    :cond_6
    iget-object p0, p0, Lcom/appsflyer/internal/u$a;->AFInAppEventType:Ljava/lang/String;

    .line 2196
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x0

    :try_start_1
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :goto_4
    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0x2b

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    :goto_5
    return-void

    :catchall_1
    move-exception p0

    throw p0
.end method

.method private static AFInAppEventType(Landroid/content/SharedPreferences$Editor;)V
    .locals 2

    .line 520
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x7b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x43

    if-eqz v0, :cond_0

    const/16 v0, 0x2a

    goto :goto_0

    :cond_0
    const/16 v0, 0x43

    :goto_0
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    if-eq v0, v1, :cond_1

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
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x1f

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    goto :goto_2

    :cond_2
    const/4 p0, 0x0

    :goto_2
    if-eqz p0, :cond_3

    const/16 p0, 0x11

    :try_start_1
    div-int/2addr p0, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception p0

    throw p0

    :cond_3
    return-void
.end method

.method static synthetic AFInAppEventType(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 139
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x23

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Lcom/appsflyer/internal/i;)V

    if-eq v0, v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    :try_start_0
    array-length p0, p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    return-void

    :catchall_0
    move-exception p0

    throw p0
.end method

.method private static AFInAppEventType(Ljava/lang/String;)V
    .locals 3

    .line 2589
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "pid"

    .line 2591
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/16 v1, 0x49

    if-eqz v0, :cond_0

    const/16 v0, 0x49

    goto :goto_0

    :cond_0
    const/16 v0, 0x41

    :goto_0
    if-eq v0, v1, :cond_1

    const-string p0, "Cannot set preinstall attribution data without a media source"

    .line 2594
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2592
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x57

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    return-void

    .line 2597
    :cond_1
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x67

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x58

    if-nez v0, :cond_2

    const/16 v0, 0x58

    goto :goto_1

    :cond_2
    const/16 v0, 0x26

    :goto_1
    const-string v2, "preInstallName"

    if-eq v0, v1, :cond_3

    .line 2592
    :try_start_1
    invoke-static {v2, p0}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_3
    invoke-static {v2, p0}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    const/4 p0, 0x0

    :try_start_2
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2597
    :goto_2
    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0x37

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    return-void

    :catchall_0
    move-exception p0

    throw p0

    :catch_0
    move-exception p0

    const-string v0, "Error parsing JSON for preinstall"

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private static AFInAppEventType(Ljava/util/Map;Lcom/appsflyer/internal/cl;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/appsflyer/internal/cl;",
            ")V"
        }
    .end annotation

    .line 50108
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p1, Lcom/appsflyer/internal/cl;->values:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 50109
    iget-object v1, p1, Lcom/appsflyer/internal/cl;->values:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 50111
    iget-object p1, p1, Lcom/appsflyer/internal/cl;->valueOf:Lcom/appsflyer/internal/bv;

    const-string v1, "gcd"

    invoke-interface {p1, v1}, Lcom/appsflyer/internal/bv;->AFInAppEventType(Ljava/lang/String;)V

    .line 2235
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result p1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eq p1, v3, :cond_1

    goto :goto_2

    .line 2237
    :cond_1
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x2b

    rem-int/lit16 v4, p1, 0x80

    sput v4, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v2, 0x1

    :goto_1
    if-eq v2, v3, :cond_3

    .line 2236
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    .line 2237
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x0

    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p0

    throw p0

    .line 2236
    :cond_3
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    .line 2237
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0x9

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    return-void
.end method

.method public static AFInAppEventType(Landroid/content/SharedPreferences;)Z
    .locals 5

    .line 2129
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x59

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const-string v3, "sentSuccessfully"

    const/4 v4, 0x0

    invoke-interface {p0, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p0

    if-eq v0, v2, :cond_1

    :try_start_0
    invoke-super {v4}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    throw p0

    :cond_1
    :goto_1
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x3

    rem-int/lit16 v3, v0, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_2

    const/4 v0, 0x0

    goto :goto_2

    :cond_2
    const/4 v0, 0x1

    :goto_2
    if-eq v0, v2, :cond_3

    const/16 v0, 0x2a

    :try_start_1
    div-int/2addr v0, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return p0

    :catchall_1
    move-exception p0

    throw p0

    :cond_3
    return p0
.end method

.method static synthetic AFInAppEventType(Lcom/appsflyer/internal/ac;)Z
    .locals 2

    .line 139
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x41

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    iget-boolean p0, p0, Lcom/appsflyer/internal/ac;->onResponseError:Z

    if-eq v0, v1, :cond_1

    const/4 v0, 0x0

    :try_start_0
    invoke-super {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    throw p0

    :cond_1
    :goto_1
    return p0
.end method

.method private static AFInAppEventType(Ljava/io/File;)Z
    .locals 3

    .line 2656
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x49

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :try_start_0
    array-length v0, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_2

    goto :goto_2

    :catchall_0
    move-exception p0

    throw p0

    :cond_1
    if-eqz p0, :cond_6

    :cond_2
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_3

    goto :goto_2

    :cond_3
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x35

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_4

    goto :goto_1

    :cond_4
    const/4 v1, 0x0

    :goto_1
    if-eqz v1, :cond_5

    const/16 p0, 0x31

    :try_start_1
    div-int/2addr p0, v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return v2

    :catchall_1
    move-exception p0

    throw p0

    :cond_5
    return v2

    :cond_6
    :goto_2
    return v1
.end method

.method private AFKeystoreWrapper(Landroid/content/SharedPreferences;Z)I
    .locals 2

    .line 2816
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x75

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const-string v0, "appsFlyerInAppEventCount"

    invoke-static {p1, v0, p2}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I

    move-result p1

    sget p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p2, p2, 0x5

    rem-int/lit16 v0, p2, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p2, p2, 0x2

    return p1
.end method

.method private AFKeystoreWrapper(Ljava/util/Map;)Lcom/appsflyer/internal/aq$a;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/appsflyer/internal/aq$a;"
        }
    .end annotation

    .line 2346
    new-instance v0, Lcom/appsflyer/internal/ac$6;

    invoke-direct {v0, p1}, Lcom/appsflyer/internal/ac$6;-><init>(Ljava/util/Map;)V

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    const/16 v1, 0x1f

    add-int/2addr p1, v1

    rem-int/lit16 v2, p1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_0

    const/16 p1, 0x43

    goto :goto_0

    :cond_0
    const/16 p1, 0x1f

    :goto_0
    if-eq p1, v1, :cond_1

    const/4 p1, 0x0

    :try_start_0
    invoke-super {p1}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception p1

    throw p1

    :cond_1
    return-object v0
.end method

.method private AFKeystoreWrapper(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 2558
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v1, v0, 0x73

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v1, 0x0

    const/4 v3, 0x1

    if-nez p1, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    const/4 v4, 0x1

    :goto_0
    if-eq v4, v3, :cond_3

    add-int/lit8 v2, v2, 0x5b

    rem-int/lit16 p1, v2, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v2, v2, 0x2

    add-int/lit8 p1, p1, 0x7

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    const/16 p2, 0x1b

    if-nez p1, :cond_1

    const/4 p1, 0x4

    goto :goto_1

    :cond_1
    const/16 p1, 0x1b

    :goto_1
    const/4 v0, 0x0

    if-eq p1, p2, :cond_2

    :try_start_0
    array-length p1, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception p1

    throw p1

    :cond_2
    return-object v0

    .line 2557
    :cond_3
    iget-object v2, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    if-eqz p1, :cond_6

    add-int/lit8 v0, v0, 0x1d

    .line 2558
    rem-int/lit16 v4, v0, 0x80

    sput v4, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    .line 50123
    iget-object v0, v2, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    if-eqz p1, :cond_4

    const/4 v1, 0x1

    :cond_4
    if-eq v1, v3, :cond_5

    goto :goto_2

    .line 50127
    :cond_5
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, v0, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 2558
    :cond_6
    :goto_2
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object p1

    invoke-interface {p1}, Lcom/appsflyer/internal/bg;->AFInAppEventType()Lcom/appsflyer/internal/aa;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/appsflyer/internal/aa;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private static AFKeystoreWrapper(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 2339
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x65

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x27

    if-nez v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/16 v0, 0x27

    :goto_0
    const/4 v2, -0x1

    if-eq v0, v1, :cond_2

    const/16 v0, 0x1f

    .line 2337
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/16 v1, 0x19

    if-ne v0, v2, :cond_1

    const/16 v2, 0x19

    goto :goto_1

    :cond_1
    const/16 v2, 0x4c

    :goto_1
    if-eq v2, v1, :cond_4

    goto :goto_4

    :cond_2
    const/16 v0, 0x3f

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ne v0, v2, :cond_3

    const/4 v1, 0x1

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    :goto_2
    if-eqz v1, :cond_6

    .line 2341
    :cond_4
    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0x13

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_5

    const/4 p0, 0x0

    .line 2339
    :try_start_0
    array-length p0, p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception p0

    .line 2341
    throw p0

    :cond_5
    :goto_3
    const-string p0, ""

    return-object p0

    :cond_6
    :goto_4
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x3b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    return-object p0
.end method

.method static synthetic AFKeystoreWrapper(Lcom/appsflyer/internal/ac;)Ljava/util/Map;
    .locals 2

    .line 139
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x71

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    iget-object p0, p0, Lcom/appsflyer/internal/ac;->updateServerUninstallToken:Ljava/util/Map;

    add-int/lit8 v1, v1, 0x57

    rem-int/lit16 v0, v1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v0, 0x1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    :goto_0
    if-eq v1, v0, :cond_1

    const/4 v0, 0x0

    :try_start_0
    invoke-super {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    throw p0

    :cond_1
    return-object p0
.end method

.method private static AFKeystoreWrapper(Landroid/content/Context;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 50103
    sget-object v0, Lcom/appsflyer/internal/a$a;->valueOf:Lcom/appsflyer/internal/a;

    .line 2201
    invoke-virtual {v0, p0}, Lcom/appsflyer/internal/a;->values(Landroid/content/Context;)Lcom/appsflyer/internal/a$d;

    move-result-object p0

    .line 50104
    iget v0, p0, Lcom/appsflyer/internal/a$d;->AFInAppEventType:F

    .line 2202
    invoke-static {v0}, Ljava/lang/Float;->toString(F)Ljava/lang/String;

    move-result-object v0

    const-string v1, "btl"

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50105
    iget-object v0, p0, Lcom/appsflyer/internal/a$d;->AFKeystoreWrapper:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const/4 v1, 0x0

    if-eqz v0, :cond_1

    goto :goto_2

    .line 2204
    :cond_1
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x9

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v2, 0x2b

    if-eqz v0, :cond_2

    const/16 v0, 0x59

    goto :goto_1

    :cond_2
    const/16 v0, 0x2b

    :goto_1
    const-string v3, "btch"

    if-eq v0, v2, :cond_3

    .line 50106
    iget-object p0, p0, Lcom/appsflyer/internal/a$d;->AFKeystoreWrapper:Ljava/lang/String;

    .line 2204
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_0
    invoke-super {v1}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p0

    throw p0

    .line 50106
    :cond_3
    iget-object p0, p0, Lcom/appsflyer/internal/a$d;->AFKeystoreWrapper:Ljava/lang/String;

    .line 2204
    invoke-interface {p1, v3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0x6d

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_4

    :try_start_1
    array-length p0, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception p0

    throw p0

    :cond_4
    return-void
.end method

.method private AFKeystoreWrapper(Lcom/appsflyer/internal/i;)V
    .locals 19

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    .line 26058
    iget-object v0, v2, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    .line 1288
    sget-object v3, Lcom/appsflyer/internal/ac;->onInstallConversionFailureNative:Ljava/lang/String;

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Object;

    .line 26062
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v6

    invoke-virtual {v6}, Lcom/appsflyer/AppsFlyerLib;->getHostPrefix()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v6

    invoke-virtual {v6}, Lcom/appsflyer/AppsFlyerLib;->getHostName()Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x1

    aput-object v6, v5, v8

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 1289
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1291
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 1292
    invoke-virtual {v1, v5, v7}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Z)I

    move-result v6

    .line 1293
    invoke-direct {v1, v5}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;)I

    move-result v9

    .line 1295
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 26072
    iget-object v11, v2, Lcom/appsflyer/internal/i;->values:Ljava/util/Map;

    const-string v12, "ad_network"

    .line 1296
    invoke-interface {v10, v12, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1297
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const-string v11, "adrevenue_counter"

    invoke-interface {v10, v11, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1299
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v9

    invoke-virtual {v9}, Lcom/appsflyer/AppsFlyerProperties;->getDevKey()Ljava/lang/String;

    move-result-object v9

    const-string v11, "af_key"

    .line 1300
    invoke-interface {v10, v11, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1302
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const-string v12, "launch_counter"

    invoke-interface {v10, v12, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1304
    new-instance v11, Ljava/util/Date;

    invoke-direct {v11}, Ljava/util/Date;-><init>()V

    invoke-virtual {v11}, Ljava/util/Date;->getTime()J

    move-result-wide v11

    .line 1305
    invoke-static {v7, v7}, Landroid/widget/ExpandableListView;->getPackedPositionForChild(II)J

    move-result-wide v13

    const-wide/16 v15, 0x0

    const-string v8, "advertiserIdEnabled"

    const-string v7, "advertiserId"

    const-string/jumbo v4, "\u1cf2\u6d00\uff26\u4938\udb2e\u2537\ub748\u0153\u934f\u1d6f\u6f6c\uf964"

    move-object/from16 v17, v9

    const-string/jumbo v9, "uid"

    move/from16 v18, v6

    cmp-long v6, v13, v15

    rsub-int v6, v6, 0x71f4

    invoke-static {v4, v6}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4

    invoke-static {v11, v12}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v10, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1307
    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v4}, Lcom/appsflyer/internal/af;->valueOf(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v10, v9, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1309
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    invoke-virtual {v4, v7}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1310
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v6

    invoke-virtual {v6, v8}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_0

    const/4 v9, 0x0

    goto :goto_0

    :cond_0
    const/4 v9, 0x1

    :goto_0
    if-eqz v9, :cond_1

    goto :goto_1

    .line 1348
    :cond_1
    sget v9, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v9, v9, 0x73

    rem-int/lit16 v11, v9, 0x80

    sput v11, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    const/4 v11, 0x2

    rem-int/2addr v9, v11

    .line 1312
    invoke-interface {v10, v8, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    if-eqz v4, :cond_2

    .line 1315
    invoke-interface {v10, v7, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1317
    :cond_2
    invoke-direct {v1, v0, v10}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/util/Map;)V

    .line 1318
    sget-object v4, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string v6, "device"

    invoke-interface {v10, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1319
    invoke-static {v0, v10}, Lcom/appsflyer/internal/ac;->values(Landroid/content/Context;Ljava/util/Map;)V

    .line 1322
    :try_start_0
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v7}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    const-string v6, "app_version_code"

    .line 1323
    iget v7, v4, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v10, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v6, "yyyy-MM-dd_HHmmssZ"

    .line 27020
    new-instance v7, Ljava/text/SimpleDateFormat;

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v7, v6, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 1327
    iget-wide v8, v4, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    const-string v4, "install_date"

    .line 1328
    invoke-static {v7, v8, v9}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/text/SimpleDateFormat;J)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v10, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "appsFlyerFirstInstall"

    const/4 v6, 0x0

    .line 1330
    invoke-interface {v5, v4, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_3

    const/4 v5, 0x0

    goto :goto_2

    :cond_3
    const/4 v5, 0x1

    :goto_2
    const/4 v6, 0x1

    if-eq v5, v6, :cond_4

    .line 1348
    sget v4, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v4, v4, 0x77

    rem-int/lit16 v5, v4, 0x80

    sput v5, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    const/4 v5, 0x2

    rem-int/2addr v4, v5

    .line 1332
    :try_start_1
    invoke-direct {v1, v7, v0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/text/SimpleDateFormat;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    :cond_4
    const-string v0, "first_launch_date"

    .line 1335
    invoke-interface {v10, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception v0

    const-string v4, "AdRevenue - Exception while collecting app version data "

    .line 1337
    invoke-static {v4, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1340
    :goto_3
    new-instance v0, Lcom/appsflyer/internal/ac$d;

    .line 1341
    invoke-virtual {v2, v3}, Lcom/appsflyer/internal/i;->AFInAppEventType(Ljava/lang/String;)Lcom/appsflyer/internal/i;

    move-result-object v2

    .line 1342
    invoke-virtual {v2, v10}, Lcom/appsflyer/internal/i;->AFInAppEventParameterName(Ljava/util/Map;)Lcom/appsflyer/internal/i;

    move-result-object v2

    move/from16 v3, v18

    .line 1343
    invoke-virtual {v2, v3}, Lcom/appsflyer/internal/i;->valueOf(I)Lcom/appsflyer/internal/i;

    move-result-object v2

    move-object/from16 v3, v17

    .line 27129
    iput-object v3, v2, Lcom/appsflyer/internal/i;->AFVersionDeclaration:Ljava/lang/String;

    const/4 v3, 0x0

    .line 1344
    invoke-direct {v0, v1, v2, v3}, Lcom/appsflyer/internal/ac$d;-><init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;B)V

    .line 28046
    sget-object v2, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    if-nez v2, :cond_5

    .line 28047
    new-instance v2, Lcom/appsflyer/internal/k;

    invoke-direct {v2}, Lcom/appsflyer/internal/k;-><init>()V

    sput-object v2, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 28049
    :cond_5
    sget-object v2, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 1346
    invoke-virtual {v2}, Lcom/appsflyer/internal/k;->AFKeystoreWrapper()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v2

    const-wide/16 v3, 0x1

    .line 1348
    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v2, v0, v3, v4, v5}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method public static AFKeystoreWrapper(Landroid/content/Context;)Z
    .locals 2

    .line 2514
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "appsFlyerCount"

    .line 2516
    invoke-interface {p0, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    const/16 v0, 0x3e

    if-nez p0, :cond_0

    const/16 p0, 0x3e

    goto :goto_0

    :cond_0
    const/16 p0, 0x2f

    :goto_0
    if-eq p0, v0, :cond_1

    const/4 p0, 0x0

    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x49

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    return p0

    :cond_1
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0xd

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    const/4 p0, 0x1

    return p0
.end method

.method private static AFKeystoreWrapper(Ljava/lang/String;Z)Z
    .locals 2

    .line 626
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0xb

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x27

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    return p0
.end method

.method private static AFLogger$LogLevel(Ljava/lang/String;)Ljava/io/File;
    .locals 4

    .line 2667
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x73

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    const/16 v0, 0x5d

    .line 2661
    :try_start_0
    div-int/2addr v0, v2

    const/16 v0, 0x4f

    if-eqz p0, :cond_0

    const/16 v3, 0x2f

    goto :goto_0

    :cond_0
    const/16 v3, 0x4f

    :goto_0
    if-eq v3, v0, :cond_5

    goto :goto_2

    :catchall_0
    move-exception p0

    goto :goto_4

    :cond_1
    if-eqz p0, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_5

    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_5

    .line 2662
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2667
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x25

    rem-int/lit16 v3, p0, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_3

    const/4 p0, 0x1

    goto :goto_3

    :cond_3
    const/4 p0, 0x0

    :goto_3
    if-eq p0, v1, :cond_4

    return-object v0

    :cond_4
    const/16 p0, 0x28

    :try_start_1
    div-int/2addr p0, v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object v0

    :catchall_1
    move-exception p0

    throw p0

    .line 2665
    :goto_4
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5

    .line 2667
    :cond_5
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x5

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    :goto_5
    const/4 p0, 0x0

    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x69

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    return-object p0
.end method

.method private static AFLogger$LogLevel(Landroid/content/Context;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 50107
    sget-object v0, Lcom/appsflyer/internal/v$b;->AFKeystoreWrapper:Lcom/appsflyer/internal/v;

    .line 2210
    invoke-virtual {v0, p0}, Lcom/appsflyer/internal/v;->valueOf(Landroid/content/Context;)Landroid/location/Location;

    move-result-object p0

    .line 2211
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const/16 v1, 0x62

    if-eqz p0, :cond_0

    const/16 v2, 0x62

    goto :goto_0

    :cond_0
    const/16 v2, 0x3f

    :goto_0
    if-eq v2, v1, :cond_1

    goto :goto_1

    .line 2217
    :cond_1
    sget v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v1, v1, 0x53

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    .line 2213
    invoke-virtual {p0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    const-string v2, "lat"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2214
    invoke-virtual {p0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v1

    const-string v2, "lon"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2215
    invoke-virtual {p0}, Landroid/location/Location;->getTime()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    const-string/jumbo v1, "ts"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2217
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x9

    rem-int/lit16 v1, p0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    :goto_1
    return-object v0
.end method

.method private AFLogger$LogLevel()Z
    .locals 4

    .line 1689
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x19

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    iget-object v0, p0, Lcom/appsflyer/internal/ac;->updateServerUninstallToken:Ljava/util/Map;

    const/16 v1, 0x58

    if-eqz v0, :cond_0

    const/16 v2, 0x39

    goto :goto_0

    :cond_0
    const/16 v2, 0x58

    :goto_0
    const/4 v3, 0x0

    if-eq v2, v1, :cond_2

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    const/4 v0, 0x1

    :goto_1
    if-eq v0, v1, :cond_2

    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/2addr v0, v1

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    return v1

    :cond_2
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x55

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    return v3
.end method

.method static AFVersionDeclaration()V
    .locals 2

    const-wide v0, -0x7845b730dd2be36dL

    sput-wide v0, Lcom/appsflyer/internal/ac;->enableLocationCollection:J

    return-void
.end method

.method private static AFVersionDeclaration(Landroid/content/Context;)Z
    .locals 4

    .line 2505
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "collectAndroidIdForceByUser"

    const/4 v2, 0x0

    .line 2506
    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    const/16 v1, 0x3c

    if-nez v0, :cond_0

    const/16 v0, 0x51

    goto :goto_0

    :cond_0
    const/16 v0, 0x3c

    :goto_0
    const/4 v3, 0x1

    if-eq v0, v1, :cond_3

    .line 2508
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x29

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const-string v1, "collectIMEIForceByUser"

    if-nez v0, :cond_1

    .line 2507
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    .line 2508
    invoke-virtual {v0, v1, v3}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    .line 2507
    :cond_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    .line 2508
    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x5

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v0, 0x1

    :goto_2
    const/16 v1, 0x1f

    if-nez v0, :cond_4

    const/16 v0, 0x9

    goto :goto_3

    :cond_4
    const/16 v0, 0x1f

    :goto_3
    if-eq v0, v1, :cond_6

    invoke-static {p0}, Lcom/appsflyer/internal/ac;->init(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_5

    goto :goto_4

    :cond_5
    return v2

    :cond_6
    :goto_4
    return v3
.end method

.method private static AppsFlyer2dXConversionCallback(Landroid/content/Context;)V
    .locals 5

    .line 1079
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x4f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const v3, 0x8000

    if-eqz v0, :cond_2

    .line 1069
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 1070
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/2addr v0, v3

    const/16 v3, 0x62

    if-eqz v0, :cond_1

    const/16 v0, 0x4b

    goto :goto_1

    :cond_1
    const/16 v0, 0x62

    :goto_1
    if-eq v0, v3, :cond_4

    goto :goto_2

    .line 1069
    :cond_2
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 1070
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v0, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/2addr v0, v3

    if-eqz v0, :cond_4

    .line 1071
    :goto_2
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v3, "appsflyer_backup_rules"

    const-string/jumbo v4, "xml"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v3, v4, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    if-eqz p0, :cond_3

    const-string p0, "appsflyer_backup_rules.xml detected, using AppsFlyer defined backup rules for AppsFlyer SDK data"

    .line 1073
    invoke-static {p0, v1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;Z)V

    return-void

    :cond_3
    const-string p0, "\'allowBackup\' is set to true; appsflyer_backup_rules.xml not detected.\nAppsFlyer shared preferences should be excluded from auto backup by adding: <exclude domain=\"sharedpref\" path=\"appsflyer-data\"/> to the Application\'s <full-backup-content> rules"

    .line 1075
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1079
    :cond_4
    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0xd

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_5

    const/4 v1, 0x0

    :cond_5
    if-eqz v1, :cond_6

    return-void

    :cond_6
    const/4 p0, 0x0

    :try_start_1
    array-length p0, p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    throw p0

    :catch_0
    move-exception p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "checkBackupRules Exception: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic getLevel(Lcom/appsflyer/internal/ac;)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 3

    .line 139
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v1, v0, 0x2f

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    iget-object p0, p0, Lcom/appsflyer/internal/ac;->onAttributionFailure:Ljava/util/concurrent/ScheduledExecutorService;

    add-int/lit8 v0, v0, 0x45

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    return-object p0
.end method

.method private static getLevel(Landroid/content/Context;)V
    .locals 4

    .line 1087
    invoke-static {}, Lcom/appsflyer/internal/z;->valueOf()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x17

    const-string v1, "OPPO device found"

    .line 1089
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/16 v0, 0x12

    .line 1092
    :goto_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v1, v0, :cond_2

    const-string v0, "keyPropDisableAFKeystore"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1093
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "OS SDK is="

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "; use KeyStore"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    .line 1094
    new-instance v0, Lcom/appsflyer/AFKeystoreWrapper;

    invoke-direct {v0, p0}, Lcom/appsflyer/AFKeystoreWrapper;-><init>(Landroid/content/Context;)V

    .line 1095
    invoke-virtual {v0}, Lcom/appsflyer/AFKeystoreWrapper;->AFKeystoreWrapper()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1096
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v1}, Lcom/appsflyer/internal/af;->valueOf(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object p0

    .line 15069
    iput-object p0, v0, Lcom/appsflyer/AFKeystoreWrapper;->values:Ljava/lang/String;

    const/4 p0, 0x0

    .line 15070
    iput p0, v0, Lcom/appsflyer/AFKeystoreWrapper;->AFInAppEventType:I

    .line 15071
    invoke-virtual {v0}, Lcom/appsflyer/AFKeystoreWrapper;->valueOf()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/appsflyer/AFKeystoreWrapper;->AFKeystoreWrapper(Ljava/lang/String;)V

    goto :goto_2

    .line 15078
    :cond_1
    invoke-virtual {v0}, Lcom/appsflyer/AFKeystoreWrapper;->valueOf()Ljava/lang/String;

    move-result-object p0

    .line 15079
    iget-object v2, v0, Lcom/appsflyer/AFKeystoreWrapper;->AFInAppEventParameterName:Ljava/lang/Object;

    monitor-enter v2

    .line 15080
    :try_start_0
    iget v3, v0, Lcom/appsflyer/AFKeystoreWrapper;->AFInAppEventType:I

    add-int/2addr v3, v1

    iput v3, v0, Lcom/appsflyer/AFKeystoreWrapper;->AFInAppEventType:I

    const-string v1, "Deleting key with alias: "

    .line 15161
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 15163
    :try_start_1
    iget-object v1, v0, Lcom/appsflyer/AFKeystoreWrapper;->AFInAppEventParameterName:Ljava/lang/Object;

    monitor-enter v1
    :try_end_1
    .catch Ljava/security/KeyStoreException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 15164
    :try_start_2
    iget-object v3, v0, Lcom/appsflyer/AFKeystoreWrapper;->valueOf:Ljava/security/KeyStore;

    invoke-virtual {v3, p0}, Ljava/security/KeyStore;->deleteEntry(Ljava/lang/String;)V

    .line 15165
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    :try_start_3
    monitor-exit v1

    throw p0
    :try_end_3
    .catch Ljava/security/KeyStoreException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catch_0
    move-exception p0

    .line 15167
    :try_start_4
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Exception "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " occurred"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15082
    :goto_1
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 15083
    invoke-virtual {v0}, Lcom/appsflyer/AFKeystoreWrapper;->valueOf()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/appsflyer/AFKeystoreWrapper;->AFKeystoreWrapper(Ljava/lang/String;)V

    :goto_2
    const-string p0, "KSAppsFlyerId"

    .line 1100
    invoke-virtual {v0}, Lcom/appsflyer/AFKeystoreWrapper;->values()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "KSAppsFlyerRICounter"

    .line 1101
    invoke-virtual {v0}, Lcom/appsflyer/AFKeystoreWrapper;->AFInAppEventType()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_1
    move-exception p0

    .line 15082
    monitor-exit v2

    throw p0

    .line 1103
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "OS SDK is="

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "; no KeyStore usage"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    return-void
.end method

.method private getLevel()Z
    .locals 11

    .line 1488
    iget-wide v0, p0, Lcom/appsflyer/internal/ac;->onAppOpenAttribution:J

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x2

    cmp-long v6, v0, v2

    if-lez v6, :cond_5

    .line 1489
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1490
    iget-wide v2, p0, Lcom/appsflyer/internal/ac;->onAppOpenAttribution:J

    sub-long/2addr v0, v2

    .line 36020
    new-instance v2, Ljava/text/SimpleDateFormat;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v6, "yyyy/MM/dd HH:mm:ss.SSS Z"

    invoke-direct {v2, v6, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 1492
    iget-wide v6, p0, Lcom/appsflyer/internal/ac;->onAppOpenAttribution:J

    invoke-static {v2, v6, v7}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/text/SimpleDateFormat;J)Ljava/lang/String;

    move-result-object v3

    .line 1493
    iget-wide v6, p0, Lcom/appsflyer/internal/ac;->onResponseNative:J

    invoke-static {v2, v6, v7}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/text/SimpleDateFormat;J)Ljava/lang/String;

    move-result-object v2

    .line 1495
    iget-wide v6, p0, Lcom/appsflyer/internal/ac;->onConversionDataSuccess:J

    const/4 v8, 0x3

    const/4 v9, 0x1

    cmp-long v10, v0, v6

    if-gez v10, :cond_1

    .line 1503
    sget v6, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v6, v6, 0x73

    rem-int/lit16 v7, v6, 0x80

    sput v7, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr v6, v5

    .line 1495
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v6

    if-nez v6, :cond_0

    const/4 v6, 0x0

    goto :goto_0

    :cond_0
    const/4 v6, 0x1

    :goto_0
    if-eq v6, v9, :cond_1

    .line 1497
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v3, v7, v4

    aput-object v2, v7, v9

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v7, v5

    iget-wide v0, p0, Lcom/appsflyer/internal/ac;->onConversionDataSuccess:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v7, v8

    const-string v0, "Last Launch attempt: %s;\nLast successful Launch event: %s;\nThis launch is blocked: %s ms < %s ms"

    invoke-static {v6, v0, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    return v9

    .line 1501
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v6

    if-nez v6, :cond_2

    const/4 v6, 0x1

    goto :goto_1

    :cond_2
    const/4 v6, 0x0

    :goto_1
    if-eqz v6, :cond_8

    .line 1508
    sget v6, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v6, v6, 0x15

    rem-int/lit16 v7, v6, 0x80

    sput v7, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr v6, v5

    const/16 v7, 0x53

    if-eqz v6, :cond_3

    const/16 v6, 0x55

    goto :goto_2

    :cond_3
    const/16 v6, 0x53

    :goto_2
    const-string v10, "Last Launch attempt: %s;\nLast successful Launch event: %s;\nSending launch (+%s ms)"

    if-eq v6, v7, :cond_4

    .line 1503
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v3, v5, v9

    aput-object v2, v5, v4

    const/4 v2, 0x5

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v5, v2

    invoke-static {v6, v10, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    :cond_4
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array v7, v8, [Ljava/lang/Object;

    aput-object v3, v7, v4

    aput-object v2, v7, v9

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v7, v5

    invoke-static {v6, v10, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_3
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    goto :goto_5

    .line 1507
    :cond_5
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v0

    const/16 v1, 0x2e

    if-nez v0, :cond_6

    const/16 v0, 0x18

    goto :goto_4

    :cond_6
    const/16 v0, 0x2e

    :goto_4
    if-eq v0, v1, :cond_8

    .line 1511
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x7d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr v0, v5

    const-string v1, "Sending first launch for this session!"

    if-nez v0, :cond_7

    .line 1508
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    const/4 v0, 0x0

    :try_start_0
    array-length v0, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_5

    :catchall_0
    move-exception v0

    .line 1511
    throw v0

    .line 1508
    :cond_7
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    :cond_8
    :goto_5
    return v4
.end method

.method private static init()Ljava/lang/String;
    .locals 3

    .line 1126
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x47

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const-string v0, "appid"

    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v1, 0x6b

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    const/16 v2, 0x57

    if-eqz v1, :cond_0

    const/16 v1, 0x41

    goto :goto_0

    :cond_0
    const/16 v1, 0x57

    :goto_0
    if-eq v1, v2, :cond_1

    const/4 v1, 0x0

    :try_start_0
    array-length v1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v0

    throw v0

    :cond_1
    return-object v0
.end method

.method private init(Lcom/appsflyer/internal/i;)V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50154
    new-instance v0, Ljava/net/URL;

    iget-object v1, p1, Lcom/appsflyer/internal/i;->onDeepLinkingNative:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 2910
    invoke-virtual {p1}, Lcom/appsflyer/internal/i;->AFInAppEventParameterName()[B

    move-result-object v1

    .line 50155
    iget-object v4, p1, Lcom/appsflyer/internal/i;->AFVersionDeclaration:Ljava/lang/String;

    .line 50156
    iget-object v2, p1, Lcom/appsflyer/internal/i;->init:Ljava/lang/String;

    .line 2913
    invoke-virtual {p1}, Lcom/appsflyer/internal/i;->valueOf()Z

    move-result v3

    .line 50157
    iget-object v5, p1, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    .line 50158
    iget-object v6, p1, Lcom/appsflyer/internal/i;->AFInAppEventParameterName:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 2917
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v7

    invoke-interface {v7}, Lcom/appsflyer/internal/bg;->getLevel()Lcom/appsflyer/internal/cl;

    move-result-object v7

    const/16 v8, 0x42

    if-eqz v3, :cond_0

    const/4 v9, 0x3

    goto :goto_0

    :cond_0
    const/16 v9, 0x42

    :goto_0
    if-eq v9, v8, :cond_1

    .line 50159
    iget v8, p1, Lcom/appsflyer/internal/i;->onInstallConversionFailureNative:I

    .line 2919
    invoke-virtual {v7, v8}, Lcom/appsflyer/internal/cl;->valueOf(I)V

    :cond_1
    const/4 v8, 0x0

    .line 2922
    :try_start_0
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v9

    check-cast v9, Ljava/net/HttpURLConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    :try_start_1
    const-string v10, "POST"

    .line 2923
    invoke-virtual {v9, v10}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 2924
    array-length v10, v1

    const-string v11, "Content-Length"

    .line 2925
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v11, v10}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "Content-Type"

    .line 2926
    invoke-virtual {p1}, Lcom/appsflyer/internal/i;->AFInAppEventType()Z

    move-result v11

    const/4 v12, 0x0

    const/4 v13, 0x1

    if-eqz v11, :cond_2

    const/4 v11, 0x0

    goto :goto_1

    :cond_2
    const/4 v11, 0x1

    :goto_1
    if-eqz v11, :cond_3

    const-string v11, "application/json"

    goto :goto_2

    :cond_3
    const-string v11, "application/octet-stream"

    :goto_2
    invoke-virtual {v9, v10, v11}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v10, 0x2710

    .line 2927
    invoke-virtual {v9, v10}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 2928
    invoke-virtual {v9, v13}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 2930
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v10

    const-string v11, "http_cache"

    invoke-virtual {v10, v11, v13}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    if-nez v10, :cond_4

    .line 2931
    invoke-virtual {v9, v12}, Ljava/net/URLConnection;->setUseCaches(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 2935
    :cond_4
    :try_start_2
    new-instance v10, Ljava/io/DataOutputStream;

    invoke-virtual {v9}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2936
    :try_start_3
    invoke-virtual {v10, v1}, Ljava/io/OutputStream;->write([B)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 2938
    :try_start_4
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 2988
    sget v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v1, 0x61

    rem-int/lit16 v10, v1, 0x80

    sput v10, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_6

    .line 2941
    :try_start_5
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    .line 2942
    array-length v8, v8

    if-eqz v3, :cond_5

    const/4 v8, 0x1

    goto :goto_3

    :cond_5
    const/4 v8, 0x0

    :goto_3
    if-eq v8, v13, :cond_7

    goto :goto_4

    .line 2941
    :cond_6
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    if-eqz v3, :cond_8

    .line 50160
    :cond_7
    iget v8, p1, Lcom/appsflyer/internal/i;->onInstallConversionFailureNative:I

    .line 2943
    invoke-virtual {v7, v8}, Lcom/appsflyer/internal/cl;->AFInAppEventType(I)V

    .line 2945
    :cond_8
    :goto_4
    invoke-static {v9}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v7

    .line 2946
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v8

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0, v1, v7}, Lcom/appsflyer/internal/ak;->values(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "response code: "

    .line 2947
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 2948
    invoke-static {v5}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const/16 v8, 0xc8

    if-ne v1, v8, :cond_9

    const/4 v8, 0x0

    goto :goto_5

    :cond_9
    const/4 v8, 0x1

    :goto_5
    if-eqz v8, :cond_a

    if-eqz v6, :cond_f

    .line 2972
    sget v2, Lcom/appsflyer/attribution/RequestError;->RESPONSE_CODE_FAILURE:I

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/appsflyer/internal/ba;->AFInAppEventType:Ljava/lang/String;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v6, v2, v3}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 2988
    sget v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v2, v2, 0x35

    rem-int/lit16 v3, v2, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v2, v2, 0x2

    goto :goto_8

    :cond_a
    if-eqz v5, :cond_b

    if-eqz v3, :cond_b

    .line 2954
    :try_start_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    iput-wide v10, p0, Lcom/appsflyer/internal/ac;->onResponseNative:J

    .line 2957
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v3

    invoke-interface {v3}, Lcom/appsflyer/internal/bg;->AFKeystoreWrapper()Lcom/appsflyer/internal/av;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 2942
    sget v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v3, v3, 0x11

    rem-int/lit16 v8, v3, 0x80

    sput v8, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v3, v3, 0x2

    :cond_b
    if-eqz v6, :cond_c

    const/4 v3, 0x1

    goto :goto_6

    :cond_c
    const/4 v3, 0x0

    :goto_6
    if-eqz v3, :cond_d

    .line 2988
    sget v3, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/2addr v3, v13

    rem-int/lit16 v8, v3, 0x80

    sput v8, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v3, v3, 0x2

    .line 2959
    :try_start_7
    invoke-interface {v6}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onSuccess()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 2988
    sget v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v3, v3, 0x25

    rem-int/lit16 v6, v3, 0x80

    sput v6, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v3, v3, 0x2

    :cond_d
    if-eqz v2, :cond_e

    .line 2961
    :try_start_8
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v3

    invoke-interface {v3}, Lcom/appsflyer/internal/bg;->AFVersionDeclaration()Lcom/appsflyer/internal/l;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/appsflyer/internal/l;->valueOf(Ljava/lang/String;)Z

    goto :goto_7

    :cond_e
    const-string v2, "sentSuccessfully"

    const-string/jumbo v3, "true"

    .line 2963
    invoke-static {v5, v2, v3}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 2964
    invoke-direct {p0, v5}, Lcom/appsflyer/internal/ac;->onAppOpenAttributionNative(Landroid/content/Context;)V

    .line 2966
    :goto_7
    new-instance v2, Lcom/appsflyer/internal/cd;

    invoke-direct {v2, v5}, Lcom/appsflyer/internal/cd;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Lcom/appsflyer/internal/cd;->AFKeystoreWrapper()V

    .line 2967
    invoke-static {v7}, Lcom/appsflyer/internal/as;->AFInAppEventParameterName(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "send_background"

    .line 2969
    invoke-virtual {v2, v3, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/appsflyer/internal/ac;->onValidateInApp:Z

    .line 2981
    :cond_f
    :goto_8
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v6, v0

    .line 2975
    invoke-static/range {v2 .. v8}, Lcom/appsflyer/internal/cg;->AFInAppEventType(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;Ljava/lang/String;Landroid/content/Context;Landroid/content/SharedPreferences;Ljava/lang/Integer;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    if-eqz v9, :cond_10

    goto :goto_9

    :cond_10
    const/4 v12, 0x1

    :goto_9
    if-eq v12, v13, :cond_11

    .line 2986
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_11
    return-void

    :catchall_0
    move-exception p1

    move-object v8, v10

    goto :goto_a

    :catchall_1
    move-exception p1

    :goto_a
    if-eqz v8, :cond_12

    .line 2938
    :try_start_9
    invoke-virtual {v8}, Ljava/io/OutputStream;->close()V

    .line 2939
    :cond_12
    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :catchall_2
    move-exception p1

    move-object v8, v9

    goto :goto_b

    :catchall_3
    move-exception p1

    :goto_b
    if-eqz v8, :cond_13

    .line 2986
    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 2988
    :cond_13
    throw p1
.end method

.method private static init(Landroid/content/Context;)Z
    .locals 4

    .line 2406
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x35

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x57

    if-eqz v0, :cond_0

    const/16 v0, 0x4d

    goto :goto_0

    :cond_0
    const/16 v0, 0x57

    :goto_0
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_2

    .line 2390
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    const/16 v1, 0x10

    div-int/2addr v1, v3

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    if-eq v0, v2, :cond_3

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_2

    :cond_2
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_5

    :cond_3
    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0x27

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_4

    const/4 p0, 0x0

    :try_start_1
    array-length p0, p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return v2

    :catchall_1
    move-exception p0

    throw p0

    :cond_4
    return v2

    :goto_2
    const-string v1, "WARNING:  Google play services is unavailable. "

    .line 2396
    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2400
    :cond_5
    :goto_3
    :try_start_2
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v0, "com.google.android.gms"

    invoke-virtual {p0, v0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    return v2

    :catch_0
    move-exception p0

    const-string v0, "WARNING:  Google Play Services is unavailable. "

    .line 2403
    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v3
.end method

.method private onAppOpenAttribution(Landroid/content/Context;)J
    .locals 8

    .line 2864
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x33

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 2847
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "AppsFlyerTimePassedSincePrevLaunch"

    const-wide/16 v2, 0x0

    .line 2849
    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 2851
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 2854
    invoke-virtual {p0, p1, v1, v6, v7}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;Ljava/lang/String;J)V

    cmp-long p1, v4, v2

    if-lez p1, :cond_0

    const/16 p1, 0x18

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_3

    sub-long/2addr v6, v4

    .line 2864
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x21

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    const/16 v0, 0x25

    if-nez p1, :cond_1

    const/16 p1, 0x25

    goto :goto_1

    :cond_1
    const/16 p1, 0x1f

    :goto_1
    const-wide/16 v1, 0x3e8

    if-eq p1, v0, :cond_2

    div-long/2addr v6, v1

    goto :goto_2

    :cond_2
    sub-long/2addr v6, v1

    :goto_2
    return-wide v6

    :cond_3
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method private onAppOpenAttributionNative(Landroid/content/Context;)V
    .locals 7

    .line 2725
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x51

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x57

    if-eqz v0, :cond_0

    const/16 v0, 0x57

    goto :goto_0

    :cond_0
    const/16 v0, 0xd

    :goto_0
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_1

    .line 2714
    iget-boolean v0, p0, Lcom/appsflyer/internal/ac;->onResponseError:Z

    if-nez v0, :cond_8

    goto :goto_2

    :cond_1
    iget-boolean v0, p0, Lcom/appsflyer/internal/ac;->onResponseError:Z

    const/16 v1, 0x43

    :try_start_0
    div-int/2addr v1, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-nez v0, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_8

    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v4, p0, Lcom/appsflyer/internal/ac;->AFVersionDeclaration:J

    sub-long/2addr v0, v4

    const-wide/16 v4, 0x3a98

    cmp-long v6, v0, v4

    if-gez v6, :cond_3

    goto :goto_3

    .line 2717
    :cond_3
    iget-object v0, p0, Lcom/appsflyer/internal/ac;->onAttributionFailure:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_6

    .line 2714
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x3d

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_4

    const/4 v2, 0x0

    :cond_4
    if-eqz v2, :cond_5

    return-void

    :cond_5
    const/4 p1, 0x0

    :try_start_1
    invoke-super {p1}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1

    .line 50130
    :cond_6
    sget-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    if-nez v0, :cond_7

    .line 50131
    new-instance v0, Lcom/appsflyer/internal/k;

    invoke-direct {v0}, Lcom/appsflyer/internal/k;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 50133
    :cond_7
    sget-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 2720
    invoke-virtual {v0}, Lcom/appsflyer/internal/k;->AFKeystoreWrapper()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/internal/ac;->onAttributionFailure:Ljava/util/concurrent/ScheduledExecutorService;

    .line 2722
    new-instance v0, Lcom/appsflyer/internal/ac$e;

    invoke-direct {v0, p0, p1}, Lcom/appsflyer/internal/ac$e;-><init>(Lcom/appsflyer/internal/ac;Landroid/content/Context;)V

    .line 2725
    iget-object p1, p0, Lcom/appsflyer/internal/ac;->onAttributionFailure:Ljava/util/concurrent/ScheduledExecutorService;

    const-wide/16 v1, 0x1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p1, v0, v1, v2, v3}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    return-void

    :cond_8
    :goto_3
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x37

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_9

    const/4 p1, 0x0

    goto :goto_4

    :cond_9
    const/4 p1, 0x1

    :goto_4
    if-eq p1, v2, :cond_a

    const/16 p1, 0x5e

    :try_start_2
    div-int/2addr p1, v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    return-void

    :catchall_1
    move-exception p1

    throw p1

    :cond_a
    return-void

    :catchall_2
    move-exception p1

    throw p1
.end method

.method private onAttributionFailureNative(Landroid/content/Context;)Ljava/lang/String;
    .locals 6

    .line 2672
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "preInstallName"

    .line 2673
    invoke-static {v1}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 2689
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x41

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    return-object v2

    .line 2676
    :cond_0
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    const/16 v4, 0x14

    if-eqz v3, :cond_1

    const/16 v3, 0x14

    goto :goto_0

    :cond_1
    const/16 v3, 0x42

    :goto_0
    const/4 v5, 0x0

    if-eq v3, v4, :cond_6

    .line 2679
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2681
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/ac;->onInstallConversionFailureNative(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    const/4 v0, 0x7

    if-eqz v2, :cond_2

    const/4 v3, 0x7

    goto :goto_1

    :cond_2
    const/16 v3, 0x5a

    :goto_1
    if-eq v3, v0, :cond_3

    const-string v0, "AF_PRE_INSTALL_NAME"

    .line 2685
    invoke-direct {p0, p1, v0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 2689
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x39

    rem-int/lit16 v3, v0, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    :cond_3
    if-eqz v2, :cond_7

    .line 2695
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x3

    rem-int/lit16 v3, v0, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v3, 0x37

    if-nez v0, :cond_4

    const/16 v0, 0x37

    goto :goto_2

    :cond_4
    const/16 v0, 0x2e

    .line 2689
    :goto_2
    invoke-static {p1, v1, v2}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    if-eq v0, v3, :cond_5

    goto :goto_3

    :cond_5
    :try_start_0
    array-length p1, v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception p1

    .line 2695
    throw p1

    .line 2677
    :cond_6
    invoke-interface {v0, v1, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_7
    :goto_3
    if-eqz v2, :cond_8

    .line 2693
    invoke-static {v1, v2}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    return-object v2
.end method

.method private static onConversionDataSuccess(Landroid/content/Context;)Z
    .locals 9

    const/4 v0, 0x0

    if-eqz p0, :cond_9

    .line 3111
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    const-string v3, "Failed collecting ivc data"

    if-lt v1, v2, :cond_6

    :try_start_0
    const-string v1, "connectivity"

    .line 3113
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    .line 3114
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getAllNetworks()[Landroid/net/Network;

    move-result-object v1

    array-length v2, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v4, 0x0

    :goto_0
    const/4 v5, 0x1

    if-ge v4, v2, :cond_0

    const/4 v6, 0x0

    goto :goto_1

    :cond_0
    const/4 v6, 0x1

    :goto_1
    if-eqz v6, :cond_1

    .line 3139
    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0x3b

    rem-int/lit16 v1, p0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    return v0

    .line 3114
    :cond_1
    :try_start_1
    aget-object v6, v1, v4

    .line 3115
    invoke-virtual {p0, v6}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v6

    const/4 v7, 0x4

    .line 3116
    invoke-virtual {v6, v7}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v7
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/16 v8, 0x51

    if-eqz v7, :cond_2

    const/16 v7, 0xa

    goto :goto_2

    :cond_2
    const/16 v7, 0x51

    :goto_2
    if-eq v7, v8, :cond_5

    .line 3139
    sget v7, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v7, v7, 0x13

    rem-int/lit16 v8, v7, 0x80

    sput v8, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v7, v7, 0x2

    const/16 v7, 0xf

    .line 3116
    :try_start_2
    invoke-virtual {v6, v7}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v6
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    const/16 v7, 0x3a

    if-nez v6, :cond_3

    const/16 v6, 0xe

    goto :goto_3

    :cond_3
    const/16 v6, 0x3a

    :goto_3
    if-eq v6, v7, :cond_5

    .line 3139
    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0x57

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_4

    const/4 p0, 0x0

    :try_start_3
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    return v5

    :catchall_0
    move-exception p0

    throw p0

    :cond_4
    return v5

    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    .line 3122
    invoke-static {v3, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_5

    .line 3124
    :cond_6
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt p0, v1, :cond_9

    .line 3125
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 3127
    :try_start_4
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_7
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/NetworkInterface;

    .line 3128
    invoke-virtual {v2}, Ljava/net/NetworkInterface;->isUp()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 3129
    invoke-virtual {v2}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_8
    const-string/jumbo v1, "tun0"

    .line 3132
    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    return p0

    :catch_1
    move-exception p0

    .line 3135
    invoke-static {v3, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_9
    :goto_5
    return v0
.end method

.method private onDeepLinkingNative(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 2532
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "api_store_value"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 2536
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x23

    rem-int/lit16 v1, p1, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    const/4 v2, 0x0

    if-eqz p1, :cond_1

    .line 2534
    :try_start_0
    array-length p1, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    .line 2536
    throw p1

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x5b

    rem-int/lit16 p1, v1, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    const/16 p1, 0x3e

    if-eqz v1, :cond_2

    const/16 v1, 0x3e

    goto :goto_2

    :cond_2
    const/16 v1, 0x19

    :goto_2
    if-eq v1, p1, :cond_3

    return-object v0

    :cond_3
    :try_start_1
    array-length p1, v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object v0

    :catchall_1
    move-exception p1

    throw p1

    :cond_4
    const-string v0, "AF_STORE"

    invoke-direct {p0, p1, v0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x79

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    return-object p1
.end method

.method private onInstallConversionDataLoadedNative(Landroid/content/Context;)Ljava/lang/String;
    .locals 5

    .line 2527
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x55

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 2520
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "INSTALL_STORE"

    .line 2521
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    const/16 v3, 0x5f

    if-eqz v2, :cond_0

    const/16 v2, 0x5f

    goto :goto_0

    :cond_0
    const/16 v2, 0x16

    :goto_0
    const/4 v4, 0x0

    if-eq v2, v3, :cond_2

    .line 2524
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/appsflyer/internal/ac;->onDeepLinkingNative(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 2527
    :cond_1
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x5d

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    .line 2526
    :goto_1
    invoke-static {p1, v1, v4}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-object v4

    .line 2522
    :cond_2
    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2527
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x5

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    return-object p1
.end method

.method private onInstallConversionFailureNative(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    .line 2616
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x11

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const-string v1, "ro.appsflyer.preinstall.path"

    const/4 v2, 0x0

    if-nez v0, :cond_0

    .line 2606
    invoke-static {v1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2607
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFLogger$LogLevel(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 2609
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/io/File;)Z

    move-result v1

    :try_start_0
    invoke-super {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 2616
    throw p1

    .line 2606
    :cond_0
    invoke-static {v1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2607
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFLogger$LogLevel(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 2609
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_1

    :goto_0
    const-string v0, "AF_PRE_INSTALL_PATH"

    .line 2611
    invoke-direct {p0, p1, v0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2612
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFLogger$LogLevel(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 2615
    :cond_1
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    goto :goto_1

    :cond_2
    const/4 v1, 0x1

    :goto_1
    if-eqz v1, :cond_3

    goto :goto_3

    .line 2623
    :cond_3
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x33

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x31

    if-eqz v0, :cond_4

    const/16 v0, 0x44

    goto :goto_2

    :cond_4
    const/16 v0, 0x31

    :goto_2
    const-string v3, "/data/local/tmp/pre_install.appsflyer"

    if-eq v0, v1, :cond_5

    .line 2616
    invoke-static {v3}, Lcom/appsflyer/internal/ac;->AFLogger$LogLevel(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    :try_start_1
    invoke-super {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception p1

    .line 2623
    throw p1

    .line 2616
    :cond_5
    invoke-static {v3}, Lcom/appsflyer/internal/ac;->AFLogger$LogLevel(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 2618
    :goto_3
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v0, "/etc/pre_install.appsflyer"

    .line 2619
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFLogger$LogLevel(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 2622
    :cond_6
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/io/File;)Z

    move-result v1

    const/16 v3, 0x51

    if-eqz v1, :cond_7

    const/16 v1, 0x18

    goto :goto_4

    :cond_7
    const/16 v1, 0x51

    :goto_4
    if-eq v1, v3, :cond_9

    .line 2626
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x2f

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_8

    .line 2623
    :try_start_2
    invoke-super {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_5

    :catchall_2
    move-exception p1

    .line 2626
    throw p1

    :cond_8
    :goto_5
    return-object v2

    :cond_9
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/appsflyer/internal/ac;->values(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private static onResponseNative(Landroid/content/Context;)F
    .locals 6

    const/high16 v0, 0x3f800000    # 1.0f

    .line 3091
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const/4 v1, 0x0

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object p0

    const-string v1, "level"

    const/4 v2, -0x1

    .line 3092
    invoke-virtual {p0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const-string v3, "scale"

    .line 3093
    invoke-virtual {p0, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    const/4 v3, 0x1

    if-eq v1, v2, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    const/4 v4, 0x1

    :goto_0
    if-eqz v4, :cond_1

    goto :goto_2

    .line 3105
    :cond_1
    sget v4, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v4, v4, 0x53

    rem-int/lit16 v5, v4, 0x80

    sput v5, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v4, v4, 0x2

    if-ne p0, v2, :cond_2

    goto :goto_1

    :cond_2
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_3

    int-to-float v0, v1

    int-to-float p0, p0

    div-float/2addr v0, p0

    const/high16 p0, 0x42c80000    # 100.0f

    mul-float v0, v0, p0

    add-int/lit8 v5, v5, 0x5d

    rem-int/lit16 p0, v5, 0x80

    sput p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v5, v5, 0x2

    goto :goto_3

    :cond_3
    :goto_2
    const/high16 p0, 0x42480000    # 50.0f

    return p0

    :catchall_0
    move-exception p0

    .line 3102
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3105
    :goto_3
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x75

    rem-int/lit16 v1, p0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    return v0
.end method

.method private valueOf(Landroid/content/SharedPreferences;)I
    .locals 5

    .line 2820
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x3

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0xb

    if-eqz v0, :cond_0

    const/16 v0, 0x36

    goto :goto_0

    :cond_0
    const/16 v0, 0xb

    :goto_0
    const/4 v2, 0x1

    const-string v3, "appsFlyerAdRevenueCount"

    const/4 v4, 0x0

    if-eq v0, v1, :cond_1

    invoke-static {p1, v3, v4}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I

    move-result p1

    goto :goto_1

    :cond_1
    invoke-static {p1, v3, v2}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I

    move-result p1

    :goto_1
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x75

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_2

    const/4 v2, 0x0

    :cond_2
    if-eqz v2, :cond_3

    return p1

    :cond_3
    const/16 v0, 0x55

    :try_start_0
    div-int/2addr v0, v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p1

    :catchall_0
    move-exception p1

    throw p1
.end method

.method private static valueOf(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I
    .locals 2

    .line 2842
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x57

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v0, 0x0

    .line 2829
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :cond_0
    if-eqz v0, :cond_1

    add-int/lit8 v1, v1, 0x1

    .line 2833
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 2834
    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 2835
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/SharedPreferences$Editor;)V

    .line 2842
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x2b

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    .line 2838
    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object p0

    invoke-virtual {p0}, Lcom/appsflyer/internal/ak;->AFVersionDeclaration()Z

    move-result p0

    if-eqz p0, :cond_2

    .line 2839
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object p0

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/ak;->values(Ljava/lang/String;)V

    :cond_2
    return v1
.end method

.method static synthetic valueOf(Lcom/appsflyer/internal/ac;)Lcom/appsflyer/internal/dc;
    .locals 2

    .line 139
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0xd

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    iget-object p0, p0, Lcom/appsflyer/internal/ac;->setAndroidIdData:Lcom/appsflyer/internal/dc;

    add-int/lit8 v1, v1, 0x79

    rem-int/lit16 v0, v1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    const/16 v0, 0x28

    if-nez v1, :cond_0

    const/16 v1, 0x28

    goto :goto_0

    :cond_0
    const/16 v1, 0x1f

    :goto_0
    if-eq v1, v0, :cond_1

    return-object p0

    :cond_1
    const/16 v0, 0x1c

    :try_start_0
    div-int/lit8 v0, v0, 0x0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    throw p0
.end method

.method private static valueOf(Ljava/lang/String;)Ljava/lang/String;
    .locals 10

    const/4 v0, 0x0

    if-nez p0, :cond_1

    .line 2306
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x9

    rem-int/lit16 v1, p0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    const/16 p0, 0x4c

    :try_start_0
    div-int/lit8 p0, p0, 0x0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception p0

    throw p0

    :cond_0
    return-object v0

    :cond_1
    const-string v1, "fb\\d*?://authorize.*"

    .line 2305
    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 2319
    sget v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v1, v1, 0x33

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    const-string v2, "access_token"

    if-nez v1, :cond_3

    .line 2306
    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v3, 0x1

    :try_start_1
    div-int/lit8 v3, v3, 0x0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/16 v3, 0x16

    if-eqz v1, :cond_2

    const/16 v1, 0x16

    goto :goto_0

    :cond_2
    const/16 v1, 0x12

    :goto_0
    if-eq v1, v3, :cond_4

    goto/16 :goto_7

    :catchall_1
    move-exception p0

    .line 2319
    throw p0

    .line 2306
    :cond_3
    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 2307
    :cond_4
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2308
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_5

    .line 2306
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x5f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    return-object p0

    .line 2309
    :cond_5
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const-string v4, "&"

    .line 2310
    invoke-virtual {v1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 2311
    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    goto :goto_1

    .line 2313
    :cond_6
    invoke-virtual {v3, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 2315
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 2316
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 2317
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_d

    .line 2333
    sget v6, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v6, v6, 0x3

    rem-int/lit16 v7, v6, 0x80

    sput v7, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v6, v6, 0x2

    const/16 v7, 0x23

    if-eqz v6, :cond_7

    const/16 v6, 0x2f

    goto :goto_3

    :cond_7
    const/16 v6, 0x23

    :goto_3
    if-eq v6, v7, :cond_8

    .line 2318
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 2319
    invoke-virtual {v6, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    :try_start_2
    array-length v8, v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz v7, :cond_9

    goto :goto_4

    :catchall_2
    move-exception p0

    .line 2333
    throw p0

    .line 2318
    :cond_8
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 2319
    invoke-virtual {v6, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 2320
    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    .line 2322
    :cond_9
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-eqz v7, :cond_a

    .line 2323
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_6

    :cond_a
    const-string v7, "?"

    .line 2324
    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    const/16 v9, 0x61

    if-nez v8, :cond_b

    const/16 v8, 0x61

    goto :goto_5

    :cond_b
    const/16 v8, 0x3a

    :goto_5
    if-eq v8, v9, :cond_c

    goto :goto_6

    .line 2325
    :cond_c
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2327
    :goto_6
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 2330
    :cond_d
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 2333
    :cond_e
    :goto_7
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x6f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_f

    const/16 v0, 0x1c

    :try_start_3
    div-int/lit8 v0, v0, 0x0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    return-object p0

    :catchall_3
    move-exception p0

    throw p0

    :cond_f
    return-object p0
.end method

.method public static valueOf(Ljava/text/SimpleDateFormat;J)Ljava/lang/String;
    .locals 1

    const-string v0, "UTC"

    .line 1428
    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 1429
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x13

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    return-object p0
.end method

.method private valueOf(Landroid/content/Context;)V
    .locals 12

    .line 921
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/ac;->updateServerUninstallToken:Ljava/util/Map;

    .line 922
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 923
    new-instance v2, Lcom/appsflyer/internal/ac$3;

    invoke-direct {v2, p0, v0, v1}, Lcom/appsflyer/internal/ac$3;-><init>(Lcom/appsflyer/internal/ac;J)V

    :try_start_0
    const-string v0, "com.facebook.FacebookSdk"

    .line 13033
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "sdkInitialize"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    .line 13034
    const-class v5, Landroid/content/Context;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v0, v1, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/Object;

    aput-object p1, v1, v6

    const/4 v4, 0x0

    .line 13035
    invoke-virtual {v0, v4, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "com.facebook.applinks.AppLinkData"

    .line 13037
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "com.facebook.applinks.AppLinkData$CompletionHandler"

    .line 13038
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v5, "fetchDeferredAppLinkData"

    const/4 v7, 0x3

    new-array v8, v7, [Ljava/lang/Class;

    .line 13039
    const-class v9, Landroid/content/Context;

    aput-object v9, v8, v6

    const-class v9, Ljava/lang/String;

    aput-object v9, v8, v3

    const/4 v9, 0x2

    aput-object v1, v8, v9

    invoke-virtual {v0, v5, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 13041
    new-instance v8, Lcom/appsflyer/internal/l$5;

    invoke-direct {v8, v0, v2}, Lcom/appsflyer/internal/l$5;-><init>(Ljava/lang/Class;Lcom/appsflyer/internal/l$d;)V

    .line 13089
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    new-array v10, v3, [Ljava/lang/Class;

    aput-object v1, v10, v6

    invoke-static {v0, v10, v8}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v0

    .line 13093
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v8, "facebook_app_id"

    const-string/jumbo v10, "string"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v1, v8, v10, v11}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 13094
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    const/16 v10, 0xb

    if-eqz v8, :cond_0

    const/16 v8, 0xb

    goto :goto_0

    :cond_0
    const/4 v8, 0x6

    :goto_0
    if-eq v8, v10, :cond_1

    new-array v7, v7, [Ljava/lang/Object;

    aput-object p1, v7, v6

    aput-object v1, v7, v3

    aput-object v0, v7, v9

    .line 13097
    invoke-virtual {v5, v4, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 13107
    :cond_1
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x77

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr p1, v9

    :try_start_1
    const-string p1, "Facebook app id not defined in resources"

    .line 13095
    invoke-interface {v2, p1}, Lcom/appsflyer/internal/l$d;->values(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0

    .line 13107
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x57

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr p1, v9

    return-void

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v2, p1}, Lcom/appsflyer/internal/l$d;->values(Ljava/lang/String;)V

    return-void

    :catch_1
    move-exception p1

    .line 13105
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v2, p1}, Lcom/appsflyer/internal/l$d;->values(Ljava/lang/String;)V

    return-void

    :catch_2
    move-exception p1

    .line 13103
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v2, p1}, Lcom/appsflyer/internal/l$d;->values(Ljava/lang/String;)V

    return-void

    :catch_3
    move-exception p1

    .line 13101
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v2, p1}, Lcom/appsflyer/internal/l$d;->values(Ljava/lang/String;)V

    return-void
.end method

.method private static valueOf(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 2

    .line 600
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x2d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x19

    if-eqz v0, :cond_0

    const/16 v0, 0x19

    goto :goto_0

    :cond_0
    const/4 v0, 0x5

    :goto_0
    if-eq v0, v1, :cond_1

    .line 597
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 598
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 599
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 600
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/SharedPreferences$Editor;)V

    goto :goto_1

    .line 597
    :cond_1
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 598
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 599
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 600
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/SharedPreferences$Editor;)V

    const/16 p0, 0x29

    :try_start_0
    div-int/lit8 p0, p0, 0x0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    return-void

    :catchall_0
    move-exception p0

    throw p0
.end method

.method public static valueOf(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 586
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x41

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    .line 583
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 584
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 585
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 586
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/SharedPreferences$Editor;)V

    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0x7d

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    const/4 p1, 0x1

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    :goto_0
    if-eq p0, p1, :cond_1

    const/4 p0, 0x0

    :try_start_0
    array-length p0, p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    throw p0

    :cond_1
    return-void
.end method

.method private valueOf(Landroid/content/Context;Ljava/util/Map;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string/jumbo v0, "use cached AndroidId: "

    const-string/jumbo v1, "use cached IMEI: "

    .line 2410
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v2

    const-string v3, "deviceTrackingDisabled"

    const/4 v4, 0x0

    .line 2411
    invoke-virtual {v2, v3, v4}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_0

    const-string/jumbo p1, "true"

    .line 2414
    invoke-interface {p2, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 2416
    :cond_0
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v5, "collectIMEI"

    .line 2417
    invoke-virtual {v2, v5, v4}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    const-string v6, "imeiCached"

    const/4 v7, 0x0

    .line 2418
    invoke-interface {v3, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    if-eqz v5, :cond_1

    const/4 v5, 0x1

    goto :goto_0

    :cond_1
    const/4 v5, 0x0

    :goto_0
    if-eq v5, v9, :cond_2

    goto :goto_2

    .line 2420
    :cond_2
    iget-object v5, p0, Lcom/appsflyer/internal/ac;->AppsFlyer2dXConversionCallback:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v5, 0x1

    goto :goto_1

    :cond_3
    const/4 v5, 0x0

    :goto_1
    if-eq v5, v9, :cond_4

    .line 2446
    :goto_2
    iget-object v1, p0, Lcom/appsflyer/internal/ac;->AppsFlyer2dXConversionCallback:Ljava/lang/String;

    if-eqz v1, :cond_d

    .line 2499
    sget v5, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v5, v5, 0x57

    rem-int/lit16 v8, v5, 0x80

    sput v8, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_e

    const/16 v5, 0x51

    .line 2447
    :try_start_0
    div-int/2addr v5, v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_b

    :catchall_0
    move-exception p1

    .line 2499
    throw p1

    .line 2453
    :cond_4
    sget v5, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v5, v5, 0x37

    rem-int/lit16 v10, v5, 0x80

    sput v10, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_5

    const/4 v5, 0x1

    goto :goto_3

    :cond_5
    const/4 v5, 0x0

    :goto_3
    if-eqz v5, :cond_7

    .line 2421
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFVersionDeclaration(Landroid/content/Context;)Z

    move-result v5

    :try_start_1
    array-length v10, v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v5, :cond_6

    const/4 v5, 0x1

    goto :goto_4

    :cond_6
    const/4 v5, 0x0

    :goto_4
    if-eqz v5, :cond_d

    goto :goto_5

    :catchall_1
    move-exception p1

    .line 2453
    throw p1

    .line 2421
    :cond_7
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFVersionDeclaration(Landroid/content/Context;)Z

    move-result v5

    if-eqz v5, :cond_d

    :goto_5
    :try_start_2
    const-string v5, "phone"

    .line 2423
    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/telephony/TelephonyManager;

    .line 2424
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    const-string v11, "getDeviceId"

    new-array v12, v4, [Ljava/lang/Class;

    invoke-virtual {v10, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    new-array v11, v4, [Ljava/lang/Object;

    invoke-virtual {v10, v5, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    if-eqz v5, :cond_8

    .line 2499
    sget v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v1, 0x35

    rem-int/lit16 v8, v1, 0x80

    sput v8, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    move-object v1, v5

    goto/16 :goto_b

    :cond_8
    if-eqz v8, :cond_9

    const/4 v5, 0x1

    goto :goto_6

    :cond_9
    const/4 v5, 0x0

    :goto_6
    if-eq v5, v9, :cond_a

    move-object v8, v7

    goto :goto_7

    .line 2428
    :cond_a
    :try_start_3
    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 2447
    :goto_7
    sget v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v1, v1, 0x4f

    rem-int/lit16 v5, v1, 0x80

    sput v5, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    goto :goto_a

    :catch_0
    move-exception v5

    if-eqz v8, :cond_b

    .line 2439
    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    goto :goto_8

    :cond_b
    move-object v8, v7

    .line 2442
    :goto_8
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v10, "WARNING: Can\'t collect IMEI: other reason: "

    invoke-direct {v1, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v5}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_a

    :catch_1
    move-exception v5

    if-eqz v8, :cond_c

    .line 2433
    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    goto :goto_9

    :cond_c
    move-object v8, v7

    .line 2436
    :goto_9
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v10, "WARNING: Can\'t collect IMEI because of missing permissions: "

    invoke-direct {v1, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v5}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_a
    move-object v1, v8

    goto :goto_b

    :cond_d
    move-object v1, v7

    .line 2451
    :cond_e
    :goto_b
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_f

    const/4 v5, 0x1

    goto :goto_c

    :cond_f
    const/4 v5, 0x0

    :goto_c
    if-eqz v5, :cond_12

    .line 2447
    sget v5, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v5, v5, 0xf

    rem-int/lit16 v8, v5, 0x80

    sput v8, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_10

    const/4 v5, 0x0

    goto :goto_d

    :cond_10
    const/4 v5, 0x1

    :goto_d
    const-string v8, "imei"

    if-eqz v5, :cond_11

    .line 2452
    invoke-static {p1, v6, v1}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 2453
    invoke-interface {p2, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e

    .line 2452
    :cond_11
    invoke-static {p1, v6, v1}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 2453
    invoke-interface {p2, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x41

    :try_start_4
    div-int/2addr v1, v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_e

    :catchall_2
    move-exception p1

    .line 2447
    throw p1

    :cond_12
    const-string v1, "IMEI was not collected."

    .line 2455
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    :goto_e
    const-string v1, "collectAndroidId"

    .line 2459
    invoke-virtual {v2, v1, v4}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    const-string v2, "androidIdCached"

    .line 2460
    invoke-interface {v3, v2, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "android_id"

    if-eqz v1, :cond_16

    .line 2462
    iget-object v1, p0, Lcom/appsflyer/internal/ac;->init:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 2463
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFVersionDeclaration(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 2465
    :try_start_5
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-static {v1, v5}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_13

    const/4 v6, 0x0

    goto :goto_f

    :cond_13
    const/4 v6, 0x1

    :goto_f
    if-eqz v6, :cond_14

    if-eqz v3, :cond_18

    .line 2469
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    move-object v7, v3

    goto :goto_11

    .line 2499
    :cond_14
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x31

    rem-int/lit16 v3, v0, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    move-object v7, v1

    goto :goto_11

    :catch_2
    move-exception v1

    if-eqz v3, :cond_15

    .line 2474
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    move-object v7, v3

    .line 2477
    :cond_15
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_11

    .line 2481
    :cond_16
    iget-object v0, p0, Lcom/appsflyer/internal/ac;->init:Ljava/lang/String;

    const/16 v1, 0x3b

    if-eqz v0, :cond_17

    const/16 v3, 0x59

    goto :goto_10

    :cond_17
    const/16 v3, 0x3b

    :goto_10
    if-eq v3, v1, :cond_18

    move-object v7, v0

    :cond_18
    :goto_11
    if-eqz v7, :cond_19

    const/4 v4, 0x1

    :cond_19
    if-eq v4, v9, :cond_1a

    const-string v0, "Android ID was not collected."

    .line 2490
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    goto :goto_12

    .line 2487
    :cond_1a
    invoke-static {p1, v2, v7}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 2488
    invoke-interface {p2, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2492
    :goto_12
    invoke-static {p1}, Lcom/appsflyer/internal/ab;->AFInAppEventType(Landroid/content/Context;)Lcom/appsflyer/internal/g;

    move-result-object p1

    if-eqz p1, :cond_1c

    .line 2494
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 50119
    iget-object v1, p1, Lcom/appsflyer/internal/g;->AFInAppEventParameterName:Ljava/lang/Boolean;

    const-string v2, "isManual"

    .line 2495
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50120
    iget-object v1, p1, Lcom/appsflyer/internal/g;->values:Ljava/lang/String;

    const-string/jumbo v2, "val"

    .line 2496
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50121
    iget-object p1, p1, Lcom/appsflyer/internal/g;->AFKeystoreWrapper:Ljava/lang/Boolean;

    if-eqz p1, :cond_1b

    const-string v1, "isLat"

    .line 2498
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1b
    const-string p1, "oaid"

    .line 2499
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1c
    return-void
.end method

.method private static valueOf(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 2383
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x3d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x13

    if-nez v0, :cond_0

    const/16 v0, 0x30

    goto :goto_0

    :cond_0
    const/16 v0, 0x13

    :goto_0
    const-string v2, "prev_event_timestamp"

    const/4 v3, 0x0

    const-string v4, "prev_event_name"

    if-eq v0, v1, :cond_1

    .line 2367
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 2368
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 2372
    :try_start_0
    invoke-interface {p0, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2373
    :try_start_1
    array-length v3, v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_2

    goto :goto_1

    :catchall_0
    move-exception p0

    .line 2383
    throw p0

    .line 2367
    :cond_1
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 2368
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 2372
    :try_start_2
    invoke-interface {p0, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 2374
    :goto_1
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-wide/16 v5, -0x1

    .line 2375
    invoke-interface {p0, v2, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    invoke-virtual {v3, v2, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 2376
    invoke-virtual {v3, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p0, "prev_event"

    .line 2377
    invoke-interface {p1, p0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2379
    :cond_2
    invoke-interface {v0, v4, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 2380
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    invoke-interface {v0, v2, p0, p1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 2381
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/SharedPreferences$Editor;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 2383
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x71

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    const/4 p1, 0x0

    if-eqz p0, :cond_3

    const/4 p0, 0x0

    goto :goto_2

    :cond_3
    const/4 p0, 0x1

    :goto_2
    if-eqz p0, :cond_4

    return-void

    :cond_4
    const/16 p0, 0x58

    :try_start_3
    div-int/2addr p0, p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    return-void

    :catchall_1
    move-exception p0

    throw p0

    :catch_0
    move-exception p0

    const-string p1, "Error while processing previous event."

    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private valueOf(Lcom/appsflyer/internal/i;)V
    .locals 10

    .line 37058
    iget-object v0, p1, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    if-nez v0, :cond_0

    const-string p1, "sendWithEvent - got null context. skipping event/launch."

    .line 1531
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    return-void

    .line 1535
    :cond_0
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1536
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/appsflyer/AppsFlyerProperties;->saveProperties(Landroid/content/SharedPreferences;)V

    .line 1537
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v2

    if-nez v2, :cond_1

    .line 1538
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "sendWithEvent from activity: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 1541
    :cond_1
    invoke-virtual {p1}, Lcom/appsflyer/internal/i;->valueOf()Z

    move-result v2

    .line 1543
    instance-of v3, p1, Lcom/appsflyer/internal/cq;

    .line 1544
    instance-of v4, p1, Lcom/appsflyer/internal/ci;

    .line 1546
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Lcom/appsflyer/internal/i;)Ljava/util/Map;

    move-result-object v5

    const-string v6, "appsflyerKey"

    .line 1547
    invoke-interface {v5, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    const/4 v7, 0x2

    if-eqz v6, :cond_17

    .line 1549
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_2

    goto/16 :goto_9

    .line 1556
    :cond_2
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v6

    if-nez v6, :cond_3

    const-string v6, "AppsFlyerLib.sendWithEvent"

    .line 1557
    invoke-static {v6}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    :cond_3
    const/4 v6, 0x0

    .line 1560
    invoke-virtual {p0, v1, v6}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Z)I

    move-result v1

    const/4 v8, 0x1

    if-nez v4, :cond_4

    const/4 v4, 0x1

    goto :goto_0

    :cond_4
    const/4 v4, 0x0

    :goto_0
    if-eq v4, v8, :cond_5

    goto :goto_2

    .line 1626
    :cond_5
    sget v4, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v4, v4, 0x7b

    rem-int/lit16 v9, v4, 0x80

    sput v9, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr v4, v7

    const/16 v9, 0x2d

    if-nez v4, :cond_6

    const/16 v4, 0x5e

    goto :goto_1

    :cond_6
    const/16 v4, 0x2d

    :goto_1
    if-eq v4, v9, :cond_7

    const/4 v4, 0x0

    :try_start_0
    array-length v4, v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_8

    goto :goto_2

    :catchall_0
    move-exception p1

    throw p1

    :cond_7
    if-eqz v3, :cond_8

    .line 1565
    :goto_2
    sget-object v3, Lcom/appsflyer/internal/ac;->onResponseErrorNative:Ljava/lang/String;

    new-array v4, v7, [Ljava/lang/Object;

    .line 39062
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v9

    invoke-virtual {v9}, Lcom/appsflyer/AppsFlyerLib;->getHostPrefix()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v6

    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v9

    invoke-virtual {v9}, Lcom/appsflyer/AppsFlyerLib;->getHostName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v8

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    :cond_8
    if-eqz v2, :cond_a

    if-ge v1, v7, :cond_9

    .line 1568
    sget-object v3, Lcom/appsflyer/internal/ac;->onDeepLinkingNative:Ljava/lang/String;

    new-array v4, v7, [Ljava/lang/Object;

    .line 40062
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v9

    invoke-virtual {v9}, Lcom/appsflyer/AppsFlyerLib;->getHostPrefix()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v6

    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v9

    invoke-virtual {v9}, Lcom/appsflyer/AppsFlyerLib;->getHostName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v8

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    .line 1570
    :cond_9
    sget-object v3, Lcom/appsflyer/internal/ac;->onAppOpenAttributionNative:Ljava/lang/String;

    new-array v4, v7, [Ljava/lang/Object;

    .line 41062
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v9

    invoke-virtual {v9}, Lcom/appsflyer/AppsFlyerLib;->getHostPrefix()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v6

    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v9

    invoke-virtual {v9}, Lcom/appsflyer/AppsFlyerLib;->getHostName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v8

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    .line 1573
    :cond_a
    sget-object v3, Lcom/appsflyer/internal/ac;->onAttributionFailureNative:Ljava/lang/String;

    new-array v4, v7, [Ljava/lang/Object;

    .line 42062
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v9

    invoke-virtual {v9}, Lcom/appsflyer/AppsFlyerLib;->getHostPrefix()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v6

    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v9

    invoke-virtual {v9}, Lcom/appsflyer/AppsFlyerLib;->getHostName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v4, v8

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 1576
    :goto_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1577
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "&buildnumber=6.5.4"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1579
    invoke-virtual {p0, v0}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 1581
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "&channel="

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 1584
    :cond_b
    invoke-direct {p0, v5}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/util/Map;)V

    .line 1586
    new-instance v0, Lcom/appsflyer/internal/ac$d;

    .line 1587
    invoke-virtual {p1, v3}, Lcom/appsflyer/internal/i;->AFInAppEventType(Ljava/lang/String;)Lcom/appsflyer/internal/i;

    move-result-object p1

    .line 1588
    invoke-virtual {p1, v5}, Lcom/appsflyer/internal/i;->AFInAppEventParameterName(Ljava/util/Map;)Lcom/appsflyer/internal/i;

    move-result-object p1

    .line 1589
    invoke-virtual {p1, v1}, Lcom/appsflyer/internal/i;->valueOf(I)Lcom/appsflyer/internal/i;

    move-result-object p1

    invoke-direct {v0, p0, p1, v6}, Lcom/appsflyer/internal/ac$d;-><init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;B)V

    if-eqz v2, :cond_f

    .line 1596
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->valueOf()[Lcom/appsflyer/internal/dd;

    move-result-object p1

    array-length v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_4
    if-ge v2, v1, :cond_d

    aget-object v4, p1, v2

    .line 43048
    iget-object v5, v4, Lcom/appsflyer/internal/dd;->AFInAppEventParameterName:Lcom/appsflyer/internal/dd$d;

    .line 1597
    sget-object v9, Lcom/appsflyer/internal/dd$d;->AFInAppEventParameterName:Lcom/appsflyer/internal/dd$d;

    if-ne v5, v9, :cond_c

    .line 1600
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "Failed to get "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43052
    iget-object v4, v4, Lcom/appsflyer/internal/dd;->AFKeystoreWrapper:Ljava/lang/String;

    .line 1600
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " referrer, wait ..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    const/4 v3, 0x1

    :cond_c
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 1604
    :cond_d
    iget-boolean p1, p0, Lcom/appsflyer/internal/ac;->setDebugLog:Z

    if-eqz p1, :cond_e

    invoke-direct {p0}, Lcom/appsflyer/internal/ac;->AFLogger$LogLevel()Z

    move-result p1

    if-nez p1, :cond_e

    const-string p1, "fetching Facebook deferred AppLink data, wait ..."

    .line 1606
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    const/4 v3, 0x1

    .line 1608
    :cond_e
    iget-object p1, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    invoke-virtual {p1}, Lcom/appsflyer/internal/bf;->init()Lcom/appsflyer/internal/ca;

    move-result-object p1

    invoke-virtual {p1}, Lcom/appsflyer/internal/ca;->AFInAppEventType()Z

    move-result p1

    if-eqz p1, :cond_10

    .line 1626
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x15

    rem-int/lit16 v1, p1, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr p1, v7

    const/4 v3, 0x1

    goto :goto_5

    :cond_f
    const/4 v3, 0x0

    .line 1619
    :cond_10
    :goto_5
    sget-boolean p1, Lcom/appsflyer/internal/f;->AFInAppEventParameterName:Z

    if-eqz p1, :cond_11

    goto :goto_6

    :cond_11
    const/4 v6, 0x1

    :goto_6
    if-eqz v6, :cond_13

    .line 45046
    sget-object p1, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    if-nez p1, :cond_12

    .line 45047
    new-instance p1, Lcom/appsflyer/internal/k;

    invoke-direct {p1}, Lcom/appsflyer/internal/k;-><init>()V

    sput-object p1, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 45049
    :cond_12
    sget-object p1, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 1623
    invoke-virtual {p1}, Lcom/appsflyer/internal/k;->AFKeystoreWrapper()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object p1

    goto :goto_7

    :cond_13
    const-string p1, "ESP deeplink: execute launch on SerialExecutor"

    .line 1620
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    .line 44046
    sget-object p1, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    if-nez p1, :cond_14

    .line 44047
    new-instance p1, Lcom/appsflyer/internal/k;

    invoke-direct {p1}, Lcom/appsflyer/internal/k;-><init>()V

    sput-object p1, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 1626
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x4d

    rem-int/lit16 v1, p1, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr p1, v7

    .line 44049
    :cond_14
    sget-object p1, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 44053
    iget-object v1, p1, Lcom/appsflyer/internal/k;->valueOf:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v1, :cond_15

    .line 1626
    sget v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v1, v1, 0x4b

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr v1, v7

    .line 44054
    iget-object v1, p1, Lcom/appsflyer/internal/k;->AFInAppEventType:Ljava/util/concurrent/ThreadFactory;

    invoke-static {v1}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    iput-object v1, p1, Lcom/appsflyer/internal/k;->valueOf:Ljava/util/concurrent/ScheduledExecutorService;

    .line 44056
    :cond_15
    iget-object p1, p1, Lcom/appsflyer/internal/k;->valueOf:Ljava/util/concurrent/ScheduledExecutorService;

    :goto_7
    if-eqz v3, :cond_16

    .line 1626
    sget v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v1, 0x63

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr v1, v7

    const-wide/16 v1, 0x1f4

    goto :goto_8

    :cond_16
    const-wide/16 v1, 0x0

    :goto_8
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {p1, v0, v1, v2, v3}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    return-void

    :cond_17
    :goto_9
    const-string v0, "Not sending data yet, waiting for dev key"

    .line 1550
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 38095
    iget-object p1, p1, Lcom/appsflyer/internal/i;->AFInAppEventParameterName:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    if-eqz p1, :cond_18

    .line 1626
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x51

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr v0, v7

    .line 1553
    sget v0, Lcom/appsflyer/attribution/RequestError;->NO_DEV_KEY:I

    sget-object v1, Lcom/appsflyer/internal/ba;->AFInAppEventParameterName:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    :cond_18
    return-void
.end method

.method private valueOf(Ljava/util/Map;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 2117
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x55

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v0, :cond_1

    .line 2115
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/bg;->values()Lcom/appsflyer/internal/by;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/internal/by;->AFKeystoreWrapper()Lcom/appsflyer/internal/ap;

    move-result-object v0

    .line 2116
    :try_start_0
    array-length v4, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    if-eqz v4, :cond_4

    goto :goto_2

    :catchall_0
    move-exception p1

    .line 2117
    throw p1

    .line 2115
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/bg;->values()Lcom/appsflyer/internal/by;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/internal/by;->AFKeystoreWrapper()Lcom/appsflyer/internal/ap;

    move-result-object v0

    const/16 v4, 0x46

    if-eqz v0, :cond_2

    const/16 v5, 0x46

    goto :goto_1

    :cond_2
    const/16 v5, 0x10

    :goto_1
    if-eq v5, v4, :cond_3

    goto :goto_3

    .line 2117
    :cond_3
    :goto_2
    invoke-virtual {v0}, Lcom/appsflyer/internal/ap;->AFKeystoreWrapper()Ljava/util/Map;

    move-result-object v0

    const-string v4, "rc"

    invoke-interface {p1, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4
    :goto_3
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x4f

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_5

    goto :goto_4

    :cond_5
    const/4 v1, 0x0

    :goto_4
    if-eqz v1, :cond_6

    :try_start_1
    invoke-super {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception p1

    throw p1

    :cond_6
    return-void
.end method

.method public static valueOf(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_5

    .line 3019
    :try_start_0
    invoke-interface {p0}, Ljava/util/concurrent/ScheduledExecutorService;->isShutdown()Z

    move-result v2
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    if-eq v2, v1, :cond_2

    goto :goto_3

    .line 3028
    :cond_2
    sget v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v2, v2, 0x57

    rem-int/lit16 v3, v2, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v2, v2, 0x2

    .line 3020
    :try_start_1
    invoke-interface {p0}, Ljava/util/concurrent/ScheduledExecutorService;->isTerminated()Z

    move-result v2
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v2, :cond_3

    goto :goto_2

    :cond_3
    const/4 v0, 0x1

    :goto_2
    if-eqz v0, :cond_4

    goto :goto_3

    .line 3028
    :cond_4
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x19

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 3021
    :try_start_2
    invoke-interface {p0, p1, p2, p3, p4}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    return-void

    :cond_5
    :goto_3
    const-string p0, "scheduler is null, shut downed or terminated"

    .line 3023
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 3028
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x2d

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    return-void

    :catchall_0
    move-exception p0

    const-string p1, "scheduleJob failed with Exception"

    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    :catch_0
    move-exception p0

    const-string p1, "scheduleJob failed with RejectedExecutionException Exception"

    .line 3026
    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private static valueOf(Lorg/json/JSONObject;)V
    .locals 15

    .line 423
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 425
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 426
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 427
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 432
    :try_start_0
    new-instance v4, Lorg/json/JSONArray;

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {v4, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 433
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v3, v2, :cond_0

    .line 434
    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :catch_0
    nop

    goto :goto_0

    .line 442
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 446
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 457
    sget v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v2, v2, 0x75

    rem-int/lit16 v4, v2, 0x80

    sput v4, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v2, v2, 0x2

    const/4 v2, 0x0

    :cond_2
    :goto_2
    move-object v4, v2

    .line 447
    :cond_3
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_b

    if-nez v4, :cond_b

    .line 448
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 451
    :try_start_1
    new-instance v7, Lorg/json/JSONArray;

    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-direct {v7, v8}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 v8, 0x0

    .line 454
    :goto_4
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v8, v9, :cond_3

    .line 456
    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v9

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Number;->longValue()J

    move-result-wide v11
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    cmp-long v13, v9, v11

    if-eqz v13, :cond_2

    .line 471
    sget v9, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v9, v9, 0x27

    rem-int/lit16 v10, v9, 0x80

    sput v10, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v9, v9, 0x2

    if-eqz v9, :cond_4

    const/4 v9, 0x1

    goto :goto_5

    :cond_4
    const/4 v9, 0x0

    :goto_5
    if-eq v9, v6, :cond_6

    .line 457
    :try_start_2
    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v9

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Number;->longValue()J

    move-result-wide v11

    cmp-long v13, v9, v11

    if-eqz v13, :cond_5

    const/4 v9, 0x1

    goto :goto_6

    :cond_5
    const/4 v9, 0x0

    :goto_6
    if-eq v9, v6, :cond_8

    goto :goto_2

    :cond_6
    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v9

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Number;->longValue()J

    move-result-wide v11

    const/16 v13, 0x1e

    cmp-long v14, v9, v11

    if-eqz v14, :cond_7

    const/16 v9, 0xe

    goto :goto_7

    :cond_7
    const/16 v9, 0x1e

    :goto_7
    if-eq v9, v13, :cond_2

    .line 458
    :cond_8
    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v9

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v11

    sub-int/2addr v11, v6

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Number;->longValue()J

    move-result-wide v11
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    const/16 v4, 0x28

    cmp-long v13, v9, v11

    if-nez v13, :cond_9

    const/16 v9, 0xf

    goto :goto_8

    :cond_9
    const/16 v9, 0x28

    :goto_8
    if-eq v9, v4, :cond_a

    goto/16 :goto_2

    :cond_a
    add-int/lit8 v8, v8, 0x1

    move-object v4, v5

    goto/16 :goto_4

    :catch_1
    nop

    goto/16 :goto_3

    :cond_b
    if-eqz v4, :cond_c

    const/4 v3, 0x1

    :cond_c
    if-eq v3, v6, :cond_d

    goto :goto_9

    .line 471
    :cond_d
    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    :goto_9
    return-void
.end method

.method private valueOf(Lcom/appsflyer/internal/i;Landroid/content/SharedPreferences;)Z
    .locals 4

    const/4 v0, 0x0

    .line 1638
    invoke-virtual {p0, p2, v0}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Z)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    if-eqz v3, :cond_1

    .line 1641
    instance-of p1, p1, Lcom/appsflyer/internal/ci;

    if-nez p1, :cond_1

    .line 1644
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x11

    rem-int/lit16 v3, p1, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    const-string v3, "newGPReferrerSent"

    invoke-interface {p2, v3, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    if-nez p2, :cond_3

    const/16 p2, 0x2a

    if-ne v1, v2, :cond_2

    const/16 v1, 0x60

    goto :goto_2

    :cond_2
    const/16 v1, 0x2a

    :goto_2
    if-eq v1, p2, :cond_3

    sget p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p2, p2, 0x73

    rem-int/lit16 v1, p2, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p2, p2, 0x2

    const/4 p2, 0x1

    goto :goto_3

    :cond_3
    const/4 p2, 0x0

    :goto_3
    if-nez p2, :cond_4

    const/4 p2, 0x0

    goto :goto_4

    :cond_4
    const/4 p2, 0x1

    :goto_4
    const/4 v1, 0x0

    if-eqz p2, :cond_5

    goto :goto_6

    :cond_5
    sget p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p2, p2, 0xf

    rem-int/lit16 v3, p2, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p2, p2, 0x2

    if-nez p2, :cond_6

    :try_start_0
    array-length p2, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_9

    goto :goto_6

    :catchall_0
    move-exception p1

    throw p1

    :cond_6
    const/16 p2, 0x57

    if-eqz p1, :cond_7

    const/16 p1, 0x52

    goto :goto_5

    :cond_7
    const/16 p1, 0x57

    :goto_5
    if-eq p1, p2, :cond_9

    :goto_6
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x2d

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_8

    :try_start_1
    invoke-super {v1}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return v2

    :catchall_1
    move-exception p1

    throw p1

    :cond_8
    return v2

    :cond_9
    return v0
.end method

.method static synthetic values(Lcom/appsflyer/internal/ac;)Lcom/appsflyer/internal/bf;
    .locals 3

    .line 139
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v0, 0x67

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    iget-object p0, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    add-int/lit8 v0, v0, 0x2d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :try_start_0
    invoke-super {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    throw p0

    :cond_1
    return-object p0
.end method

.method private static values(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    .line 2634
    :try_start_0
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 2635
    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 2636
    :try_start_1
    invoke-virtual {v1, v2}, Ljava/util/Properties;->load(Ljava/io/Reader;)V

    const-string v3, "Found PreInstall property!"

    .line 2637
    invoke-static {v3}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 2638
    invoke-virtual {v1, p1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 2646
    :try_start_2
    invoke-virtual {v2}, Ljava/io/Reader;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2652
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x5f

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 2649
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2652
    :goto_0
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x3d

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_0

    const/16 p1, 0x59

    :try_start_3
    div-int/lit8 p1, p1, 0x0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    return-object p0

    :catchall_1
    move-exception p0

    throw p0

    :cond_0
    return-object p0

    :catchall_2
    move-exception p0

    goto :goto_1

    :catchall_3
    move-exception p0

    move-object v2, v0

    .line 2642
    :goto_1
    :try_start_4
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    if-eqz v2, :cond_1

    .line 2646
    :try_start_5
    invoke-virtual {v2}, Ljava/io/Reader;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    goto :goto_2

    :catchall_4
    move-exception p0

    .line 2649
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    :catch_0
    move-object v2, v0

    .line 2640
    :catch_1
    :try_start_6
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "PreInstall file wasn\'t found: "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    if-eqz v2, :cond_1

    .line 2646
    :try_start_7
    invoke-virtual {v2}, Ljava/io/Reader;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 2652
    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0x71

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    :cond_1
    :goto_2
    return-object v0

    :catchall_5
    move-exception p0

    if-eqz v2, :cond_2

    .line 2646
    :try_start_8
    invoke-virtual {v2}, Ljava/io/Reader;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    goto :goto_3

    :catchall_6
    move-exception p1

    .line 2649
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2651
    :cond_2
    :goto_3
    throw p0
.end method

.method private static values(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 2548
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x5d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v3, "get"

    const-string v4, "android.os.SystemProperties"

    const/4 v5, 0x0

    if-eqz v0, :cond_1

    .line 2543
    :try_start_0
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    new-array v4, v2, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v2

    .line 2544
    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v2

    invoke-virtual {v0, v5, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_1

    .line 2543
    :cond_1
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    new-array v4, v2, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v4, v1

    .line 2544
    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p0, v2, v1

    invoke-virtual {v0, v5, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    :goto_1
    check-cast p0, Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v5, p0

    goto :goto_2

    :catchall_0
    move-exception p0

    .line 2546
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2548
    :goto_2
    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0x23

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    return-object v5
.end method

.method private static values(Ljava/lang/String;I)Ljava/lang/String;
    .locals 6

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    :cond_0
    check-cast p0, [C

    .line 50194
    sget-object v0, Lcom/appsflyer/internal/dn;->valueOf:Ljava/lang/Object;

    monitor-enter v0

    .line 50197
    :try_start_0
    sput p1, Lcom/appsflyer/internal/dn;->AFInAppEventType:I

    .line 50200
    array-length p1, p0

    new-array p1, p1, [C

    const/4 v1, 0x0

    .line 50201
    sput v1, Lcom/appsflyer/internal/dn;->values:I

    :goto_0
    sget v1, Lcom/appsflyer/internal/dn;->values:I

    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 50203
    sget v1, Lcom/appsflyer/internal/dn;->values:I

    sget v2, Lcom/appsflyer/internal/dn;->values:I

    aget-char v2, p0, v2

    sget v3, Lcom/appsflyer/internal/dn;->values:I

    sget v4, Lcom/appsflyer/internal/dn;->AFInAppEventType:I

    mul-int v3, v3, v4

    xor-int/2addr v2, v3

    int-to-long v2, v2

    sget-wide v4, Lcom/appsflyer/internal/ac;->enableLocationCollection:J

    xor-long/2addr v2, v4

    long-to-int v3, v2

    int-to-char v2, v3

    aput-char v2, p1, v1

    .line 50201
    sget v1, Lcom/appsflyer/internal/dn;->values:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Lcom/appsflyer/internal/dn;->values:I

    goto :goto_0

    .line 50207
    :cond_1
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, p1}, Ljava/lang/String;-><init>([C)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 50208
    monitor-exit v0

    throw p0
.end method

.method public static values(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    .line 593
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x7

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    if-eq v0, v2, :cond_1

    .line 590
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 591
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 592
    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 593
    :goto_1
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/SharedPreferences$Editor;)V

    goto :goto_2

    .line 590
    :cond_1
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 591
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 592
    invoke-interface {p0, p1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_1

    .line 593
    :goto_2
    sget p0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p0, p0, 0x5d

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p0, p0, 0x2

    return-void
.end method

.method private static values(Landroid/content/Context;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 2153
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x47

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    const/4 v1, 0x2

    rem-int/2addr v0, v1

    const-string/jumbo v0, "window"

    .line 2134
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/WindowManager;

    const/4 v0, 0x1

    if-eqz p0, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    const/4 v2, 0x1

    :goto_0
    if-eq v2, v0, :cond_5

    .line 2153
    sget v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v2, v2, 0x3f

    rem-int/lit16 v3, v2, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr v2, v1

    .line 2137
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    .line 2138
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    move-result p0

    if-eqz p0, :cond_4

    if-eq p0, v0, :cond_3

    if-eq p0, v1, :cond_2

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1

    const-string p0, ""

    goto :goto_1

    :cond_1
    const-string p0, "lr"

    goto :goto_1

    :cond_2
    const-string p0, "pr"

    goto :goto_1

    :cond_3
    const-string p0, "l"

    goto :goto_1

    :cond_4
    const-string p0, "p"

    :goto_1
    const-string v0, "sc_o"

    .line 2153
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    return-void
.end method

.method private static values(Lcom/appsflyer/AppsFlyerConversionListener;)V
    .locals 4

    .line 1404
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v0, 0x3d

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    :goto_0
    const/4 v3, 0x0

    if-eq v1, v2, :cond_1

    .line 1401
    :try_start_0
    array-length v1, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p0, :cond_4

    goto :goto_1

    :catchall_0
    move-exception p0

    .line 1404
    throw p0

    :cond_1
    if-nez p0, :cond_4

    :goto_1
    add-int/lit8 v0, v0, 0x5b

    .line 1401
    rem-int/lit16 p0, v0, 0x80

    sput p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 p0, 0x2d

    if-eqz v0, :cond_2

    const/16 v0, 0x31

    goto :goto_2

    :cond_2
    const/16 v0, 0x2d

    :goto_2
    if-eq v0, p0, :cond_3

    :try_start_1
    invoke-super {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception p0

    throw p0

    :cond_3
    return-void

    .line 1404
    :cond_4
    sput-object p0, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener;

    return-void
.end method

.method private values(Lcom/appsflyer/internal/i;)V
    .locals 5

    .line 33104
    iget-object v0, p1, Lcom/appsflyer/internal/i;->getLevel:Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 1458
    :goto_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper()Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    if-eqz v3, :cond_2

    const-string p1, "CustomerUserId not set, reporting is disabled"

    .line 1459
    invoke-static {p1, v2}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;Z)V

    return-void

    :cond_2
    if-eqz v0, :cond_a

    .line 1484
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x2b

    rem-int/lit16 v3, v0, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    goto :goto_2

    :cond_3
    const/4 v0, 0x1

    :goto_2
    const-string v3, "launchProtectEnabled"

    if-eq v0, v2, :cond_4

    .line 1466
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    .line 1467
    invoke-virtual {v0, v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_8

    goto :goto_4

    .line 1466
    :cond_4
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    .line 1467
    invoke-virtual {v0, v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_5

    goto :goto_3

    :cond_5
    const/4 v2, 0x0

    :goto_3
    if-eqz v2, :cond_8

    .line 1469
    :goto_4
    invoke-direct {p0}, Lcom/appsflyer/internal/ac;->getLevel()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 1467
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x4f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 34095
    iget-object p1, p1, Lcom/appsflyer/internal/i;->AFInAppEventParameterName:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    const/16 v0, 0x29

    if-eqz p1, :cond_6

    const/16 v1, 0x29

    goto :goto_5

    :cond_6
    const/16 v1, 0x16

    :goto_5
    if-eq v1, v0, :cond_7

    goto :goto_6

    .line 1472
    :cond_7
    sget v0, Lcom/appsflyer/attribution/RequestError;->EVENT_TIMEOUT:I

    sget-object v1, Lcom/appsflyer/internal/ba;->valueOf:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    :goto_6
    return-void

    :cond_8
    const-string v0, "Allowing multiple launches within a 5 second time window."

    .line 1477
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 1479
    :cond_9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/appsflyer/internal/ac;->onAppOpenAttribution:J

    .line 1484
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x65

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    .line 35046
    :cond_a
    sget-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    if-nez v0, :cond_b

    .line 35047
    new-instance v0, Lcom/appsflyer/internal/k;

    invoke-direct {v0}, Lcom/appsflyer/internal/k;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 35049
    :cond_b
    sget-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 1482
    invoke-virtual {v0}, Lcom/appsflyer/internal/k;->AFKeystoreWrapper()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v0

    .line 1483
    new-instance v2, Lcom/appsflyer/internal/ac$b;

    invoke-direct {v2, p0, p1, v1}, Lcom/appsflyer/internal/ac$b;-><init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;B)V

    const-wide/16 v3, 0x0

    .line 1484
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v0, v2, v3, v4, p1}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method private static values(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 614
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x23

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    sget p0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p0, p0, 0xf

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p0, p0, 0x2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    :goto_0
    if-eqz p0, :cond_1

    return-void

    :cond_1
    const/4 p0, 0x0

    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    throw p0
.end method

.method private static values(Ljava/lang/String;Z)V
    .locals 2

    .line 618
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x3

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_1

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    const/4 p0, 0x0

    :try_start_0
    array-length p0, p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    return-void

    :catchall_0
    move-exception p0

    throw p0
.end method

.method private static values(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 2227
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x79

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const-string v2, "onelinkVersion"

    const-string v3, "oneLinkSlug"

    if-eqz v0, :cond_0

    .line 2221
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2222
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x44

    .line 2223
    :try_start_0
    div-int/2addr v3, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_2

    goto :goto_0

    :catchall_0
    move-exception p0

    .line 2227
    throw p0

    .line 2221
    :cond_0
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2222
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    if-eqz v1, :cond_2

    :goto_0
    const-string v1, "onelink_id"

    .line 2224
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2
    const/16 v0, 0xf

    if-eqz v2, :cond_3

    const/16 v1, 0xf

    goto :goto_1

    :cond_3
    const/16 v1, 0x45

    :goto_1
    if-eq v1, v0, :cond_4

    goto :goto_2

    .line 2227
    :cond_4
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x35

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const-string v0, "onelink_ver"

    invoke-interface {p0, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    return-void
.end method

.method static synthetic values(Lcom/appsflyer/internal/ac;Z)Z
    .locals 2

    .line 139
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x1d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/appsflyer/internal/ac;->onResponseError:Z

    if-eq v0, v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    :try_start_0
    array-length p0, p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    return p1

    :catchall_0
    move-exception p0

    throw p0
.end method


# virtual methods
.method public final AFInAppEventParameterName(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 2737
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x53

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    .line 2730
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "channel"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "CHANNEL"

    .line 2732
    invoke-direct {p0, p1, v0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    const/16 p1, 0x56

    if-eqz v0, :cond_1

    const/16 v1, 0x56

    goto :goto_0

    :cond_1
    const/16 v1, 0x29

    :goto_0
    if-eq v1, p1, :cond_2

    goto :goto_3

    .line 2737
    :cond_2
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x6b

    rem-int/lit16 v1, p1, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    const/16 v1, 0x2f

    if-nez p1, :cond_3

    const/16 p1, 0x2f

    goto :goto_1

    :cond_3
    const/16 p1, 0x38

    :goto_1
    const-string v2, ""

    if-eq p1, v1, :cond_4

    .line 2734
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    goto :goto_4

    .line 2737
    :cond_4
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/16 v1, 0x1a

    :try_start_0
    div-int/lit8 v1, v1, 0x0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v1, 0x4d

    if-eqz p1, :cond_5

    const/16 p1, 0x4d

    goto :goto_2

    :cond_5
    const/4 p1, 0x5

    :goto_2
    if-eq p1, v1, :cond_7

    :cond_6
    :goto_3
    return-object v0

    :cond_7
    :goto_4
    const/4 p1, 0x0

    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x71

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    return-object p1

    :catchall_0
    move-exception p1

    throw p1
.end method

.method public final AFInAppEventParameterName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 2758
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "CACHED_CHANNEL"

    .line 2759
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eq v2, v3, :cond_1

    .line 2763
    invoke-static {p1, v1, p2}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-object p2

    .line 2764
    :cond_1
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x65

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    const/4 p1, 0x0

    .line 2760
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2764
    sget p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p2, p2, 0xf

    rem-int/lit16 v0, p2, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p2, p2, 0x2

    return-object p1
.end method

.method final AFInAppEventParameterName(Ljava/lang/ref/WeakReference;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;)V"
        }
    .end annotation

    .line 1163
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "app went to background"

    .line 1167
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 1168
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 1169
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/appsflyer/AppsFlyerProperties;->saveProperties(Landroid/content/SharedPreferences;)V

    .line 1172
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v1

    invoke-interface {v1}, Lcom/appsflyer/internal/bg;->getLevel()Lcom/appsflyer/internal/cl;

    move-result-object v1

    .line 16066
    iget-wide v1, v1, Lcom/appsflyer/internal/cl;->onDeepLinkingNative:J

    .line 1174
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 1175
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    invoke-virtual {v4}, Lcom/appsflyer/AppsFlyerProperties;->getDevKey()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1

    const-string p1, "[callStats] AppsFlyer\'s SDK cannot send any event without providing DevKey."

    .line 1177
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    return-void

    :cond_1
    const-string v5, "KSAppsFlyerId"

    .line 1180
    invoke-static {v5}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1182
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v6

    const-string v7, "deviceTrackingDisabled"

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    const/16 v9, 0x59

    if-eqz v6, :cond_2

    const/16 v6, 0x59

    goto :goto_0

    :cond_2
    const/16 v6, 0x32

    :goto_0
    if-eq v6, v9, :cond_3

    goto :goto_1

    :cond_3
    const-string/jumbo v6, "true"

    .line 1184
    invoke-interface {v3, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1186
    :goto_1
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-static {v6}, Lcom/appsflyer/internal/ab;->AFInAppEventType(Landroid/content/ContentResolver;)Lcom/appsflyer/internal/g;

    move-result-object v6

    const/16 v7, 0x5f

    if-eqz v6, :cond_4

    const/16 v9, 0x5f

    goto :goto_2

    :cond_4
    const/16 v9, 0x2d

    :goto_2
    const/4 v10, 0x2

    if-eq v9, v7, :cond_5

    goto :goto_3

    .line 1217
    :cond_5
    sget v7, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v7, v7, 0x5

    rem-int/lit16 v9, v7, 0x80

    sput v9, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr v7, v10

    .line 17024
    iget-object v7, v6, Lcom/appsflyer/internal/g;->values:Ljava/lang/String;

    const-string v9, "amazon_aid"

    .line 1188
    invoke-interface {v3, v9, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17029
    iget-object v6, v6, Lcom/appsflyer/internal/g;->AFKeystoreWrapper:Ljava/lang/Boolean;

    .line 1189
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "amazon_aid_limit"

    invoke-interface {v3, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1217
    sget v6, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v6, v6, 0x33

    rem-int/lit16 v7, v6, 0x80

    sput v7, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr v6, v10

    .line 1191
    :goto_3
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v6

    const-string v7, "advertiserId"

    invoke-virtual {v6, v7}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v9, 0x1

    if-eqz v6, :cond_6

    const/4 v11, 0x0

    goto :goto_4

    :cond_6
    const/4 v11, 0x1

    :goto_4
    if-eq v11, v9, :cond_8

    .line 1217
    sget v11, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v11, v11, 0x29

    rem-int/lit16 v12, v11, 0x80

    sput v12, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr v11, v10

    if-nez v11, :cond_7

    .line 1193
    invoke-interface {v3, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v6, 0x0

    :try_start_0
    invoke-super {v6}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_5

    :catchall_0
    move-exception p1

    .line 1217
    throw p1

    .line 1193
    :cond_7
    invoke-interface {v3, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1217
    :goto_5
    sget v6, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/2addr v6, v9

    rem-int/lit16 v7, v6, 0x80

    sput v7, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr v6, v10

    .line 1195
    :cond_8
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    const-string v7, "app_id"

    invoke-interface {v3, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "devkey"

    .line 1196
    invoke-interface {v3, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1197
    invoke-static {p1}, Lcom/appsflyer/internal/af;->valueOf(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v6, "uid"

    invoke-interface {v3, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1198
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "time_in_app"

    invoke-interface {v3, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v1, "statType"

    const-string/jumbo v2, "user_closed_app"

    .line 1199
    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "platform"

    const-string v2, "Android"

    .line 1200
    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1201
    invoke-virtual {p0, v0, v8}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Z)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "launch_counter"

    invoke-interface {v3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1202
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "channel"

    invoke-interface {v3, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 p1, 0x1f

    if-eqz v5, :cond_9

    const/16 v0, 0x41

    goto :goto_6

    :cond_9
    const/16 v0, 0x1f

    :goto_6
    if-eq v0, p1, :cond_a

    goto :goto_7

    :cond_a
    const-string v5, ""

    :goto_7
    const-string p1, "originalAppsflyerId"

    .line 1203
    invoke-interface {v3, p1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1206
    iget-boolean p1, p0, Lcom/appsflyer/internal/ac;->onValidateInApp:Z

    if-eqz p1, :cond_b

    :try_start_1
    const-string p1, "Running callStats task"

    .line 1208
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 1209
    new-instance p1, Lcom/appsflyer/internal/an$c;

    new-instance v0, Lcom/appsflyer/internal/cv;

    invoke-direct {v0}, Lcom/appsflyer/internal/cv;-><init>()V

    .line 1210
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v1

    .line 17030
    iput-boolean v1, v0, Lcom/appsflyer/internal/cm;->onConversionDataSuccess:Z

    .line 1211
    invoke-virtual {v0, v3}, Lcom/appsflyer/internal/i;->AFInAppEventParameterName(Ljava/util/Map;)Lcom/appsflyer/internal/i;

    move-result-object v0

    sget-object v1, Lcom/appsflyer/internal/ac;->AFLogger$LogLevel:Ljava/lang/String;

    new-array v2, v10, [Ljava/lang/Object;

    .line 17062
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v3

    invoke-virtual {v3}, Lcom/appsflyer/AppsFlyerLib;->getHostPrefix()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v8

    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v3

    invoke-virtual {v3}, Lcom/appsflyer/AppsFlyerLib;->getHostName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v9

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1212
    invoke-virtual {v0, v1}, Lcom/appsflyer/internal/i;->AFInAppEventType(Ljava/lang/String;)Lcom/appsflyer/internal/i;

    move-result-object v0

    check-cast v0, Lcom/appsflyer/internal/cm;

    invoke-direct {p1, v0}, Lcom/appsflyer/internal/an$c;-><init>(Lcom/appsflyer/internal/cm;)V

    .line 18025
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 18031
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception p1

    const-string v0, "Could not send callStats request"

    .line 1214
    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    :cond_b
    const-string p1, "Stats call is disabled, ignore ..."

    .line 1217
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    return-void
.end method

.method final AFInAppEventType(Lcom/appsflyer/internal/i;)Ljava/util/Map;
    .locals 32
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/i;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v3, "is_stop_tracking_used"

    const-string v4, "ddl"

    const-string v5, "af_deeplink"

    const-string v6, "advertiserId"

    const-string/jumbo v7, "versionCode"

    const-string v8, "Exception while collecting facebook\'s attribution ID. "

    const-string v9, "appid"

    const-string v10, "sdkExtension"

    const-string v11, "extraReferrers"

    const-string v12, "AFRequestCache"

    const-string/jumbo v13, "yyyy-MM-dd_HHmmssZ"

    .line 45058
    iget-object v14, v2, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    .line 45136
    iget-object v15, v2, Lcom/appsflyer/internal/i;->AFVersionDeclaration:Ljava/lang/String;

    move-object/from16 v16, v3

    .line 46104
    iget-object v3, v2, Lcom/appsflyer/internal/i;->getLevel:Ljava/lang/String;

    move-object/from16 v17, v4

    .line 47068
    new-instance v4, Lorg/json/JSONObject;

    move-object/from16 v18, v6

    iget-object v6, v2, Lcom/appsflyer/internal/i;->values:Ljava/util/Map;

    if-nez v6, :cond_0

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    goto :goto_0

    :cond_0
    iget-object v6, v2, Lcom/appsflyer/internal/i;->values:Ljava/util/Map;

    :goto_0
    invoke-direct {v4, v6}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    .line 47113
    iget-object v6, v2, Lcom/appsflyer/internal/i;->AppsFlyer2dXConversionCallback:Ljava/lang/String;

    move-object/from16 v19, v5

    .line 1698
    invoke-static {v14}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    move-object/from16 v20, v7

    .line 1699
    invoke-virtual/range {p1 .. p1}, Lcom/appsflyer/internal/i;->valueOf()Z

    move-result v7

    move-object/from16 v21, v13

    .line 47123
    iget-object v13, v2, Lcom/appsflyer/internal/i;->valueOf:Ljava/lang/String;

    .line 1701
    iget-object v2, v2, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    .line 1702
    invoke-static {v14, v2}, Lcom/appsflyer/internal/ab;->AFKeystoreWrapper(Landroid/content/Context;Ljava/util/Map;)Lcom/appsflyer/internal/g;

    .line 1703
    sget-object v22, Lcom/appsflyer/internal/ab;->AFInAppEventType:Ljava/lang/Boolean;

    move-object/from16 v23, v13

    if-eqz v22, :cond_1

    .line 1704
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v24

    if-nez v24, :cond_1

    .line 1705
    invoke-static {v2}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v13

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v22

    const/16 v24, 0x1

    xor-int/lit8 v22, v22, 0x1

    move-object/from16 v24, v8

    invoke-static/range {v22 .. v22}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    move-object/from16 v22, v9

    const-string v9, "ad_ids_disabled"

    invoke-interface {v13, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_1
    move-object/from16 v24, v8

    move-object/from16 v22, v9

    .line 1707
    :goto_1
    new-instance v8, Ljava/util/Date;

    invoke-direct {v8}, Ljava/util/Date;-><init>()V

    invoke-virtual {v8}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    .line 1708
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    move-result v13

    shr-int/lit8 v13, v13, 0x10

    rsub-int v13, v13, 0x71f5

    move-object/from16 v25, v4

    const-string/jumbo v4, "\u1cf2\u6d00\uff26\u4938\udb2e\u2537\ub748\u0153\u934f\u1d6f\u6f6c\uf964"

    invoke-static {v4, v13}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v2, v4, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1710
    invoke-static {v14, v8, v9}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    const-string v8, "cksm_v1"

    .line 1712
    invoke-interface {v2, v8, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1716
    :cond_2
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v4

    if-nez v4, :cond_4

    .line 1717
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v8, "******* sendTrackingWithEvent: "

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v7, :cond_3

    const-string v8, "Launch"

    goto :goto_2

    :cond_3
    move-object v8, v3

    :goto_2
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    goto :goto_3

    :cond_4
    const-string v4, "Reporting has been stopped"

    .line 1719
    invoke-static {v4}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 1721
    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v4

    invoke-interface {v4}, Lcom/appsflyer/internal/bg;->AFVersionDeclaration()Lcom/appsflyer/internal/l;

    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    .line 49044
    :try_start_1
    new-instance v8, Ljava/io/File;

    .line 50040
    iget-object v9, v4, Lcom/appsflyer/internal/l;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    .line 50041
    iget-object v9, v9, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 49044
    invoke-virtual {v9}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v9

    invoke-direct {v8, v9, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 48050
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_5

    .line 50042
    new-instance v8, Ljava/io/File;

    .line 50043
    iget-object v4, v4, Lcom/appsflyer/internal/l;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    .line 50044
    iget-object v4, v4, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 50042
    invoke-virtual {v4}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-direct {v8, v4, v12}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 48051
    invoke-virtual {v8}, Ljava/io/File;->mkdir()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    goto :goto_4

    :catch_0
    move-exception v0

    move-object v4, v0

    :try_start_2
    const-string v8, "CACHE: Could not create cache directory"

    .line 48054
    invoke-static {v8, v4}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_6

    .line 1725
    :cond_5
    :goto_4
    :try_start_3
    invoke-virtual {v14}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x1000

    invoke-virtual {v4, v8, v9}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v4

    .line 1726
    iget-object v4, v4, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    const-string v8, "android.permission.INTERNET"

    .line 1727
    invoke-interface {v4, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_6

    const-string v8, "Permission android.permission.INTERNET is missing in the AndroidManifest.xml"

    .line 1728
    invoke-static {v8}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    :cond_6
    const-string v8, "android.permission.ACCESS_NETWORK_STATE"

    .line 1730
    invoke-interface {v4, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_7

    const-string v8, "Permission android.permission.ACCESS_NETWORK_STATE is missing in the AndroidManifest.xml"

    .line 1731
    invoke-static {v8}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    :cond_7
    const-string v8, "android.permission.ACCESS_WIFI_STATE"

    .line 1733
    invoke-interface {v4, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_8

    const-string v4, "Permission android.permission.ACCESS_WIFI_STATE is missing in the AndroidManifest.xml"

    .line 1734
    invoke-static {v4}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_6

    goto :goto_5

    :catch_1
    move-exception v0

    move-object v4, v0

    :try_start_4
    const-string v8, "Exception while validation permissions. "

    .line 1737
    invoke-static {v8, v4}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_8
    :goto_5
    const-string v4, "af_events_api"

    const-string/jumbo v8, "\u1ca2"

    const v9, 0xa348

    const/4 v12, 0x0

    .line 1740
    invoke-static {v12}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    move-result v13

    sub-int/2addr v9, v13

    invoke-static {v8, v9}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v4, "\u1cf1\ucabc\ub048\u9fea\u4583"

    const v8, 0xd65e

    .line 1741
    invoke-static {}, Landroid/view/ViewConfiguration;->getZoomControlsTimeout()J

    move-result-wide v26

    const-wide/16 v12, 0x0

    cmp-long v28, v26, v12

    sub-int v8, v8, v28

    invoke-static {v4, v8}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4

    sget-object v8, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-interface {v2, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "device"

    .line 1742
    sget-object v8, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-interface {v2, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "product"

    .line 1743
    sget-object v8, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-interface {v2, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "sdk"

    .line 1744
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "model"

    .line 1745
    sget-object v8, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-interface {v2, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "deviceType"

    .line 1746
    sget-object v8, Landroid/os/Build;->TYPE:Ljava/lang/String;

    invoke-interface {v2, v4, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1747
    invoke-static {v14, v2}, Lcom/appsflyer/internal/ac;->values(Landroid/content/Context;Ljava/util/Map;)V

    .line 1748
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    .line 1749
    new-instance v8, Lcom/appsflyer/internal/ax;

    invoke-direct {v8, v14}, Lcom/appsflyer/internal/ax;-><init>(Landroid/content/Context;)V

    .line 1750
    invoke-virtual/range {p0 .. p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v26

    invoke-interface/range {v26 .. v26}, Lcom/appsflyer/internal/bg;->getLevel()Lcom/appsflyer/internal/cl;

    move-result-object v9

    if-eqz v7, :cond_14

    .line 1752
    invoke-static {v14}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Landroid/content/Context;)Z

    move-result v13

    if-eqz v13, :cond_c

    .line 1753
    invoke-virtual {v4}, Lcom/appsflyer/AppsFlyerProperties;->isOtherSdkStringDisabled()Z

    move-result v13

    if-nez v13, :cond_9

    .line 1754
    invoke-static {v14}, Lcom/appsflyer/internal/ac;->onResponseNative(Landroid/content/Context;)F

    move-result v13

    const-string v12, "batteryLevel"

    .line 1755
    invoke-static {v13}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v2, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1757
    :cond_9
    invoke-static {v14}, Lcom/appsflyer/internal/ac;->getLevel(Landroid/content/Context;)V

    .line 1759
    sget v12, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v13, 0x17

    if-lt v12, v13, :cond_a

    .line 1760
    const-class v12, Landroid/app/UiModeManager;

    invoke-virtual {v14, v12}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/app/UiModeManager;

    goto :goto_6

    :cond_a
    const-string/jumbo v12, "uimode"

    .line 1761
    invoke-virtual {v14, v12}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/app/UiModeManager;

    :goto_6
    if-eqz v12, :cond_b

    .line 1762
    invoke-virtual {v12}, Landroid/app/UiModeManager;->getCurrentModeType()I

    move-result v12

    const/4 v13, 0x4

    if-ne v12, v13, :cond_b

    const-string/jumbo v12, "tv"

    .line 1764
    sget-object v13, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v2, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1767
    :cond_b
    invoke-static {v14}, Lcom/appsflyer/internal/cf;->values(Landroid/content/Context;)Z

    move-result v12

    if-eqz v12, :cond_c

    const-string v12, "inst_app"

    .line 1768
    sget-object v13, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v2, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c
    const-string/jumbo v12, "timepassedsincelastlaunch"

    .line 1771
    invoke-direct {v1, v14}, Lcom/appsflyer/internal/ac;->onAppOpenAttribution(Landroid/content/Context;)J

    move-result-wide v30

    invoke-static/range {v30 .. v31}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v2, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1772
    invoke-static {v2}, Lcom/appsflyer/internal/ac;->values(Ljava/util/Map;)V

    .line 1773
    invoke-static {v2, v9}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/util/Map;Lcom/appsflyer/internal/cl;)V

    .line 1774
    iget-object v12, v1, Lcom/appsflyer/internal/ac;->onPause:Ljava/lang/String;

    if-eqz v12, :cond_d

    const-string v13, "phone"

    .line 1775
    invoke-interface {v2, v13, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1777
    :cond_d
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_6

    const-string v13, "referrer"

    if-nez v12, :cond_e

    :try_start_5
    invoke-interface {v2, v13, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_e
    const/4 v6, 0x0

    .line 1779
    invoke-interface {v5, v11, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_f

    .line 1780
    invoke-interface {v2, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1782
    :cond_f
    invoke-virtual {v4, v14}, Lcom/appsflyer/AppsFlyerProperties;->getReferrer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    .line 1783
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_10

    invoke-interface {v2, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-nez v11, :cond_10

    .line 1784
    invoke-interface {v2, v13, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50045
    :cond_10
    iget-wide v11, v9, Lcom/appsflyer/internal/cl;->onDeepLinkingNative:J

    const-wide/16 v28, 0x0

    cmp-long v6, v11, v28

    if-eqz v6, :cond_11

    const-string v6, "prev_session_dur"

    .line 1787
    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-interface {v2, v6, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50046
    :cond_11
    sget-object v6, Lcom/appsflyer/internal/ay;->AFInAppEventParameterName:Landroid/app/Application;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_6

    const-string v11, "exception_number"

    if-nez v6, :cond_12

    const-wide/16 v12, -0x1

    goto :goto_7

    .line 50047
    :cond_12
    :try_start_6
    sget-object v6, Lcom/appsflyer/internal/ay;->AFInAppEventParameterName:Landroid/app/Application;

    invoke-static {v6}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    const-wide/16 v12, 0x0

    invoke-interface {v6, v11, v12, v13}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v30

    move-wide/from16 v12, v30

    .line 1788
    :goto_7
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v2, v11, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1789
    iget-object v6, v1, Lcom/appsflyer/internal/ac;->setImeiData:Lcom/appsflyer/internal/az;

    if-eqz v6, :cond_15

    .line 50048
    iget-object v11, v6, Lcom/appsflyer/internal/az;->values:Ljava/util/Map;

    invoke-interface {v11}, Ljava/util/Map;->isEmpty()Z

    move-result v11
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_6

    const-string v12, "partner_data"

    if-nez v11, :cond_13

    :try_start_7
    iget-object v11, v6, Lcom/appsflyer/internal/az;->values:Ljava/util/Map;

    invoke-interface {v2, v12, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50049
    :cond_13
    iget-object v11, v6, Lcom/appsflyer/internal/az;->valueOf:Ljava/util/Map;

    invoke-interface {v11}, Ljava/util/Map;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_15

    .line 50050
    invoke-static {v2}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v11

    iget-object v13, v6, Lcom/appsflyer/internal/az;->valueOf:Ljava/util/Map;

    invoke-interface {v11, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50051
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    iput-object v11, v6, Lcom/appsflyer/internal/az;->valueOf:Ljava/util/Map;

    goto :goto_8

    .line 1791
    :cond_14
    invoke-static {v14, v2, v3}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;)V

    :cond_15
    :goto_8
    const-string v6, "KSAppsFlyerId"

    .line 1794
    invoke-static {v6}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v11, "KSAppsFlyerRICounter"

    .line 1795
    invoke-static {v11}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    if-eqz v6, :cond_16

    if-eqz v11, :cond_16

    .line 1796
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Number;->intValue()I

    move-result v12

    if-lez v12, :cond_16

    const-string v12, "reinstallCounter"

    .line 1797
    invoke-interface {v2, v12, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v11, "originalAppsflyerId"

    .line 1798
    invoke-interface {v2, v11, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_16
    const-string v6, "additionalCustomData"

    .line 1801
    invoke-static {v6}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_17

    const-string v11, "customData"

    .line 1803
    invoke-interface {v2, v11, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    .line 1807
    :cond_17
    :try_start_8
    invoke-virtual {v14}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v6, v11}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_18

    const-string v11, "installer_package"

    .line 1809
    invoke-interface {v2, v11, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_6

    goto :goto_9

    :catch_2
    move-exception v0

    move-object v6, v0

    :try_start_9
    const-string v11, "Exception while getting the app\'s installer package. "

    .line 1812
    invoke-static {v11, v6}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1815
    :cond_18
    :goto_9
    invoke-virtual {v4, v10}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_19

    .line 1816
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_19

    .line 1817
    invoke-interface {v2, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1820
    :cond_19
    invoke-virtual {v1, v14}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    .line 1821
    invoke-virtual {v1, v14, v6}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_1a

    .line 1828
    invoke-virtual {v10, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1b

    :cond_1a
    if-nez v10, :cond_1c

    if-eqz v6, :cond_1c

    :cond_1b
    const-string v10, "af_latestchannel"

    .line 1830
    invoke-interface {v2, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1833
    :cond_1c
    invoke-direct {v1, v14}, Lcom/appsflyer/internal/ac;->onInstallConversionDataLoadedNative(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1d

    const-string v10, "af_installstore"

    .line 1835
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1838
    :cond_1d
    invoke-direct {v1, v14}, Lcom/appsflyer/internal/ac;->onAttributionFailureNative(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1e

    const-string v10, "af_preinstall_name"

    .line 1840
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1843
    :cond_1e
    invoke-direct {v1, v14}, Lcom/appsflyer/internal/ac;->onDeepLinkingNative(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1f

    const-string v10, "af_currentstore"

    .line 1845
    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_6

    :cond_1f
    const-string v6, "appsflyerKey"

    if-eqz v15, :cond_20

    .line 1848
    :try_start_a
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v10

    if-lez v10, :cond_20

    .line 1849
    invoke-interface {v2, v6, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a

    .line 1851
    :cond_20
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v10

    invoke-virtual {v10}, Lcom/appsflyer/AppsFlyerProperties;->getDevKey()Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_41

    .line 1852
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_41

    .line 1853
    invoke-interface {v2, v6, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1861
    :goto_a
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventType()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_21

    const-string v10, "appUserId"

    .line 1863
    invoke-interface {v2, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_21
    const-string/jumbo v6, "userEmails"

    .line 1866
    invoke-virtual {v4, v6}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_22

    const-string/jumbo v10, "user_emails"

    .line 1869
    invoke-interface {v2, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b

    :cond_22
    const-string/jumbo v6, "userEmail"

    .line 1871
    invoke-static {v6}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_23

    const-string v10, "sha1_el"

    .line 1873
    invoke-static {v6}, Lcom/appsflyer/internal/ag;->valueOf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_23
    :goto_b
    if-eqz v3, :cond_24

    const-string v6, "eventName"

    .line 1878
    invoke-interface {v2, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "eventValue"

    move-object/from16 v10, v25

    .line 1879
    invoke-interface {v2, v6, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1882
    :cond_24
    invoke-static {}, Lcom/appsflyer/internal/ac;->init()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_25

    .line 1883
    invoke-static/range {v22 .. v22}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v10, v22

    invoke-interface {v2, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_25
    const-string v6, "currencyCode"

    .line 1885
    invoke-static {v6}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_27

    .line 1887
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v10

    const/4 v11, 0x3

    if-eq v10, v11, :cond_26

    .line 1888
    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "WARNING: currency code should be 3 characters!!! \'"

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "\' is not a legal value."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    :cond_26
    const-string v10, "currency"

    .line 1890
    invoke-interface {v2, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_27
    const-string v6, "IS_UPDATE"

    .line 1893
    invoke-static {v6}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_28

    const-string v10, "isUpdate"

    .line 1895
    invoke-interface {v2, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1897
    :cond_28
    invoke-virtual {v1, v14}, Lcom/appsflyer/AppsFlyerLib;->isPreInstalledApp(Landroid/content/Context;)Z

    move-result v6

    const-string v10, "af_preinstalled"

    .line 1898
    invoke-static {v6}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v10, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "collectFacebookAttrId"

    const/4 v10, 0x1

    .line 1900
    invoke-virtual {v4, v6, v10}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    if-eqz v6, :cond_29

    .line 1905
    :try_start_b
    invoke-virtual {v14}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    const-string v10, "com.facebook.katana"

    const/4 v11, 0x0

    invoke-virtual {v6, v10, v11}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 1906
    invoke-virtual {v1, v14}, Lcom/appsflyer/AppsFlyerLib;->getAttributionId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10
    :try_end_b
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_b .. :try_end_b} :catch_3
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    goto :goto_d

    :catchall_0
    move-exception v0

    move-object v10, v0

    move-object/from16 v11, v24

    .line 1912
    :try_start_c
    invoke-static {v11, v10}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_c
    const/4 v10, 0x0

    goto :goto_d

    :catch_3
    move-object/from16 v11, v24

    .line 1909
    invoke-static {v11}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    goto :goto_c

    :goto_d
    if-eqz v10, :cond_29

    const-string v11, "fb"

    .line 1915
    invoke-interface {v2, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1919
    :cond_29
    invoke-direct {v1, v14, v2}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/util/Map;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    .line 1922
    :try_start_d
    new-instance v10, Ljava/lang/ref/WeakReference;

    invoke-direct {v10, v14}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v10}, Lcom/appsflyer/internal/af;->valueOf(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_2a

    const-string/jumbo v11, "uid"

    .line 1924
    invoke-interface {v2, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_4
    .catchall {:try_start_d .. :try_end_d} :catchall_6

    goto :goto_e

    :catch_4
    move-exception v0

    move-object v10, v0

    .line 1926
    :try_start_e
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "ERROR: could not get uid "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11, v10}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    :cond_2a
    :goto_e
    :try_start_f
    const-string v10, "lang"

    .line 1930
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/Locale;->getDisplayLanguage()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_5
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    goto :goto_f

    :catch_5
    move-exception v0

    move-object v10, v0

    :try_start_10
    const-string v11, "Exception while collecting display language name. "

    .line 1932
    invoke-static {v11, v10}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    :goto_f
    :try_start_11
    const-string v10, "lang_code"

    .line 1936
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_6
    .catchall {:try_start_11 .. :try_end_11} :catchall_6

    goto :goto_10

    :catch_6
    move-exception v0

    move-object v10, v0

    :try_start_12
    const-string v11, "Exception while collecting display language code. "

    .line 1938
    invoke-static {v11, v10}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_6

    :goto_10
    :try_start_13
    const-string v10, "country"

    .line 1942
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_7
    .catchall {:try_start_13 .. :try_end_13} :catchall_6

    goto :goto_11

    :catch_7
    move-exception v0

    move-object v10, v0

    :try_start_14
    const-string v11, "Exception while collecting country name. "

    .line 1944
    invoke-static {v11, v10}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_11
    const-string v10, "platformextension"

    .line 1947
    iget-object v11, v1, Lcom/appsflyer/internal/ac;->onValidateInAppFailure:Lcom/appsflyer/internal/al;

    invoke-virtual {v11}, Lcom/appsflyer/internal/al;->AFInAppEventType()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1949
    invoke-static {v14, v2}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;Ljava/util/Map;)V

    .line 50054
    new-instance v10, Ljava/text/SimpleDateFormat;

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v12, v21

    invoke-direct {v10, v12, v11}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_6

    .line 1955
    :try_start_15
    invoke-virtual {v14}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v11

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v13

    const/4 v6, 0x0

    invoke-virtual {v11, v13, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v11
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_9
    .catchall {:try_start_15 .. :try_end_15} :catchall_6

    move v13, v7

    :try_start_16
    iget-wide v6, v11, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    const-string v11, "installDate"

    .line 1956
    invoke-static {v10, v6, v7}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/text/SimpleDateFormat;J)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v11, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_8
    .catchall {:try_start_16 .. :try_end_16} :catchall_6

    goto :goto_13

    :catch_8
    move-exception v0

    goto :goto_12

    :catch_9
    move-exception v0

    move v13, v7

    :goto_12
    move-object v6, v0

    :try_start_17
    const-string v7, "Exception while collecting install date. "

    .line 1958
    invoke-static {v7, v6}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_6

    .line 1962
    :goto_13
    :try_start_18
    invoke-virtual {v14}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const/4 v11, 0x0

    invoke-virtual {v6, v7, v11}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v6

    move-object/from16 v7, v20

    .line 1964
    invoke-interface {v5, v7, v11}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v15

    .line 1966
    iget v11, v6, Landroid/content/pm/PackageInfo;->versionCode:I

    if-le v11, v15, :cond_2b

    .line 1969
    iget v11, v6, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v14, v7, v11}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/lang/String;I)V

    :cond_2b
    const-string v7, "app_version_code"

    .line 1973
    iget v11, v6, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2, v7, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v7, "app_version_name"

    .line 1974
    iget-object v11, v6, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-interface {v2, v7, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_5

    move-object v11, v8

    .line 1976
    :try_start_19
    iget-wide v7, v6, Landroid/content/pm/PackageInfo;->firstInstallTime:J
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_4

    move-object v15, v3

    move-object/from16 v20, v4

    .line 1977
    :try_start_1a
    iget-wide v3, v6, Landroid/content/pm/PackageInfo;->lastUpdateTime:J

    const-string v6, "date1"
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_3

    move-object/from16 v21, v11

    .line 50055
    :try_start_1b
    new-instance v11, Ljava/text/SimpleDateFormat;
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_2

    move-object/from16 v22, v9

    :try_start_1c
    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v11, v12, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 1978
    new-instance v9, Ljava/util/Date;

    invoke-direct {v9, v7, v8}, Ljava/util/Date;-><init>(J)V

    .line 1979
    invoke-virtual {v11, v9}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    .line 1978
    invoke-interface {v2, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "date2"

    .line 50056
    new-instance v7, Ljava/text/SimpleDateFormat;

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v7, v12, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 1980
    new-instance v8, Ljava/util/Date;

    invoke-direct {v8, v3, v4}, Ljava/util/Date;-><init>(J)V

    .line 1981
    invoke-virtual {v7, v8}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    .line 1980
    invoke-interface {v2, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1982
    invoke-direct {v1, v10, v14}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/text/SimpleDateFormat;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "\u1cf5\ub139\u4767\u15a9\uabeb\u7810\u0e60\udcb3\u72e5\u072b\ud565\u6bb6\u39d6\uce00\u9c5c"

    const v6, 0xadc2

    .line 1983
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v11, v7, v9

    add-int/2addr v11, v6

    invoke-static {v4, v11}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_1

    goto :goto_17

    :catchall_1
    move-exception v0

    goto :goto_16

    :catchall_2
    move-exception v0

    goto :goto_15

    :catchall_3
    move-exception v0

    goto :goto_14

    :catchall_4
    move-exception v0

    move-object v15, v3

    move-object/from16 v20, v4

    :goto_14
    move-object/from16 v22, v9

    move-object/from16 v21, v11

    goto :goto_16

    :catchall_5
    move-exception v0

    move-object v15, v3

    move-object/from16 v20, v4

    move-object/from16 v21, v8

    :goto_15
    move-object/from16 v22, v9

    :goto_16
    move-object v3, v0

    :try_start_1d
    const-string v4, "Exception while collecting app version data "

    .line 1985
    invoke-static {v4, v3}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1988
    :goto_17
    invoke-static {v14}, Lcom/appsflyer/internal/cd;->AFKeystoreWrapper(Landroid/content/Context;)Z

    move-result v3

    iput-boolean v3, v1, Lcom/appsflyer/internal/ac;->AppsFlyerLib:Z

    .line 1992
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "didConfigureTokenRefreshService="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v4, v1, Lcom/appsflyer/internal/ac;->AppsFlyerLib:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 1993
    iget-boolean v3, v1, Lcom/appsflyer/internal/ac;->AppsFlyerLib:Z

    if-nez v3, :cond_2c

    const-string/jumbo v3, "tokenRefreshConfigured"

    .line 1994
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2c
    if-eqz v13, :cond_2f

    .line 2000
    iget-object v3, v1, Lcom/appsflyer/internal/ac;->onDeepLinking:Ljava/lang/String;

    if-eqz v3, :cond_2e

    move-object/from16 v3, v19

    .line 2001
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_2d

    const-string v3, "Skip \'af\' payload as deeplink was found by path"

    .line 2002
    invoke-static {v3}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    goto :goto_18

    .line 2004
    :cond_2d
    new-instance v4, Lorg/json/JSONObject;

    iget-object v6, v1, Lcom/appsflyer/internal/ac;->onDeepLinking:Ljava/lang/String;

    invoke-direct {v4, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v6, "isPush"

    const-string/jumbo v7, "true"

    .line 2005
    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2006
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2e
    :goto_18
    const/4 v3, 0x0

    .line 2009
    iput-object v3, v1, Lcom/appsflyer/internal/ac;->onDeepLinking:Ljava/lang/String;

    const-string v3, "open_referrer"

    move-object/from16 v4, v23

    .line 2011
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_6

    :cond_2f
    if-nez v13, :cond_31

    .line 2017
    :try_start_1e
    invoke-static {v14}, Lcom/appsflyer/internal/w;->AFKeystoreWrapper(Landroid/content/Context;)Lcom/appsflyer/internal/w;

    move-result-object v3

    .line 50057
    new-instance v4, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v4}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 50058
    invoke-virtual {v3}, Lcom/appsflyer/internal/w;->AFInAppEventParameterName()Ljava/util/List;

    move-result-object v3

    .line 50059
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v6
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_a
    .catchall {:try_start_1e .. :try_end_1e} :catchall_6

    const-string v7, "sensors"

    if-nez v6, :cond_30

    .line 50061
    :try_start_1f
    new-instance v6, Lcom/appsflyer/internal/h;

    invoke-direct {v6}, Lcom/appsflyer/internal/h;-><init>()V

    invoke-virtual {v6, v3}, Lcom/appsflyer/internal/h;->values(Ljava/util/List;)Ljava/util/Map;

    move-result-object v3

    .line 50062
    invoke-interface {v4, v7, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_19

    :cond_30
    const-string v3, "na"

    .line 50064
    invoke-interface {v4, v7, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2017
    :goto_19
    invoke-interface {v2, v4}, Ljava/util/Map;->putAll(Ljava/util/Map;)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_a
    .catchall {:try_start_1f .. :try_end_1f} :catchall_6

    goto :goto_1a

    :catch_a
    move-exception v0

    move-object v3, v0

    .line 2019
    :try_start_20
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "Unexpected exception from AFSensorManager: "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    .line 2022
    :cond_31
    :goto_1a
    invoke-static/range {v18 .. v18}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_33

    .line 2023
    invoke-static {v14, v2}, Lcom/appsflyer/internal/ab;->AFKeystoreWrapper(Landroid/content/Context;Ljava/util/Map;)Lcom/appsflyer/internal/g;

    const-string v3, "GAID_retry"

    .line 2024
    invoke-static/range {v18 .. v18}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_32

    const/4 v4, 0x1

    goto :goto_1b

    :cond_32
    const/4 v4, 0x0

    :goto_1b
    invoke-static {v4}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2027
    :cond_33
    invoke-virtual {v14}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-static {v3}, Lcom/appsflyer/internal/ab;->AFInAppEventType(Landroid/content/ContentResolver;)Lcom/appsflyer/internal/g;

    move-result-object v3

    if-eqz v3, :cond_34

    const-string v4, "amazon_aid"

    .line 50067
    iget-object v6, v3, Lcom/appsflyer/internal/g;->values:Ljava/lang/String;

    .line 2029
    invoke-interface {v2, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "amazon_aid_limit"

    .line 50068
    iget-object v3, v3, Lcom/appsflyer/internal/g;->AFKeystoreWrapper:Ljava/lang/Boolean;

    .line 2030
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2032
    :cond_34
    invoke-static {v5}, Lcom/appsflyer/internal/cd;->AFInAppEventType(Landroid/content/SharedPreferences;)Z

    move-result v3

    const-string v4, "registeredUninstall"

    .line 2033
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2034
    invoke-virtual {v1, v5, v13}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Z)I

    move-result v3

    const-string v4, "counter"

    .line 2035
    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "iaecounter"

    if-eqz v15, :cond_35

    const/4 v6, 0x1

    goto :goto_1c

    :cond_35
    const/4 v6, 0x0

    .line 2036
    :goto_1c
    invoke-direct {v1, v5, v6}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Landroid/content/SharedPreferences;Z)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v13, :cond_3c

    .line 2039
    invoke-static {v2}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v4

    .line 2040
    invoke-direct {v1, v4}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/util/Map;)V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_6

    const-string v6, "first_launch"

    const/4 v7, 0x1

    if-eq v3, v7, :cond_38

    const/4 v7, 0x2

    if-eq v3, v7, :cond_36

    :goto_1d
    const/4 v9, 0x1

    goto :goto_1e

    .line 50075
    :cond_36
    :try_start_21
    new-instance v7, Ljava/util/HashMap;

    move-object/from16 v8, v22

    iget-object v9, v8, Lcom/appsflyer/internal/cl;->AFInAppEventParameterName:Ljava/util/Map;

    invoke-direct {v7, v9}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 2060
    invoke-interface {v7}, Ljava/util/Map;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_37

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50076
    :cond_37
    iget-object v7, v8, Lcom/appsflyer/internal/cl;->valueOf:Lcom/appsflyer/internal/bv;

    invoke-interface {v7, v6}, Lcom/appsflyer/internal/bv;->AFInAppEventType(Ljava/lang/String;)V

    goto :goto_1d

    :cond_38
    move-object/from16 v7, v20

    move-object/from16 v8, v22

    const/4 v9, 0x1

    .line 50069
    iput-boolean v9, v7, Lcom/appsflyer/AppsFlyerProperties;->AFInAppEventParameterName:Z

    const-string/jumbo v7, "waitForCustomerId"

    const/4 v10, 0x0

    .line 2046
    invoke-static {v7, v10}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_39

    const-string/jumbo v7, "wait_cid"

    .line 2047
    invoke-static {v9}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2, v7, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50071
    :cond_39
    new-instance v7, Ljava/util/HashMap;

    iget-object v11, v8, Lcom/appsflyer/internal/cl;->AFKeystoreWrapper:Ljava/util/Map;

    invoke-direct {v7, v11}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 50072
    iget-object v11, v8, Lcom/appsflyer/internal/cl;->valueOf:Lcom/appsflyer/internal/bv;

    move-object/from16 v12, v17

    invoke-interface {v11, v12}, Lcom/appsflyer/internal/bv;->AFInAppEventType(Ljava/lang/String;)V

    .line 2051
    invoke-interface {v7}, Ljava/util/Map;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_3a

    invoke-interface {v4, v12, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50074
    :cond_3a
    new-instance v7, Ljava/util/HashMap;

    iget-object v8, v8, Lcom/appsflyer/internal/cl;->AFInAppEventParameterName:Ljava/util/Map;

    invoke-direct {v7, v8}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 2054
    invoke-interface {v7}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_3b

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2066
    :cond_3b
    :goto_1e
    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3d

    const-string v4, "meta"

    .line 2067
    invoke-interface {v2, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1f

    :cond_3c
    const/4 v9, 0x1

    :cond_3d
    :goto_1f
    const-string v4, "isFirstCall"

    .line 2070
    invoke-static {v5}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/SharedPreferences;)Z

    move-result v6

    if-nez v6, :cond_3e

    goto :goto_20

    :cond_3e
    const/4 v9, 0x0

    :goto_20
    invoke-static {v9}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2073
    invoke-direct {v1, v14, v13, v2, v3}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;ZLjava/util/Map;I)V

    .line 2076
    new-instance v3, Lcom/appsflyer/internal/ag;

    invoke-direct {v3}, Lcom/appsflyer/internal/ag;-><init>()V

    invoke-static {v2}, Lcom/appsflyer/internal/ag;->values(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "af_v"

    .line 2077
    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2079
    new-instance v3, Lcom/appsflyer/internal/ag;

    invoke-direct {v3}, Lcom/appsflyer/internal/ag;-><init>()V

    invoke-static {v2}, Lcom/appsflyer/internal/ag;->AFInAppEventParameterName(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "af_v2"

    .line 2080
    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2083
    invoke-static {v14}, Lcom/appsflyer/internal/ac;->onConversionDataSuccess(Landroid/content/Context;)Z

    move-result v3

    const-string v4, "ivc"

    .line 2084
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v3, v16

    .line 2094
    invoke-interface {v5, v3}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3f

    const-string v4, "istu"

    const/4 v6, 0x0

    .line 2095
    invoke-interface {v5, v3, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2097
    :cond_3f
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const-string v4, "mcc"

    .line 2098
    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget v5, v5, Landroid/content/res/Configuration;->mcc:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "mnc"

    .line 2099
    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v5

    iget v5, v5, Landroid/content/res/Configuration;->mnc:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "cell"

    .line 2100
    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "sig"

    move-object/from16 v4, v21

    .line 50078
    iget-object v5, v4, Lcom/appsflyer/internal/ax;->valueOf:Landroid/app/Application;

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    iget-object v4, v4, Lcom/appsflyer/internal/ax;->valueOf:Landroid/app/Application;

    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/appsflyer/internal/z;->AFInAppEventParameterName(Landroid/content/pm/PackageManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2101
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "last_boot_time"

    .line 50079
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    sub-long/2addr v4, v6

    .line 2102
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "disk"

    .line 50080
    new-instance v4, Landroid/os/StatFs;

    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 50083
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x12

    if-lt v5, v6, :cond_40

    .line 50084
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSizeLong()J

    move-result-wide v5

    .line 50085
    invoke-virtual {v4}, Landroid/os/StatFs;->getAvailableBlocksLong()J

    move-result-wide v7

    mul-long v7, v7, v5

    .line 50086
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockCountLong()J

    move-result-wide v9

    mul-long v9, v9, v5

    goto :goto_21

    .line 50088
    :cond_40
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockSize()I

    move-result v5

    .line 50089
    invoke-virtual {v4}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v6

    mul-int v6, v6, v5

    int-to-long v7, v6

    .line 50090
    invoke-virtual {v4}, Landroid/os/StatFs;->getBlockCount()I

    move-result v4

    mul-int v4, v4, v5

    int-to-long v9, v4

    :goto_21
    const-wide/high16 v4, 0x4000000000000000L    # 2.0

    const-wide/high16 v11, 0x4034000000000000L    # 20.0

    .line 50092
    invoke-static {v4, v5, v11, v12}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    long-to-double v6, v7

    div-double/2addr v6, v4

    double-to-long v6, v6

    long-to-double v8, v9

    div-double/2addr v8, v4

    double-to-long v4, v8

    .line 50095
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v6, "/"

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 2103
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2104
    iget-object v3, v1, Lcom/appsflyer/internal/ac;->getLevel:Lcom/appsflyer/internal/y;

    if-eqz v3, :cond_42

    .line 50096
    iget-object v3, v3, Lcom/appsflyer/internal/y;->AFInAppEventParameterName:[Ljava/lang/String;

    if-eqz v3, :cond_42

    const-string v4, "sharing_filter"

    .line 2106
    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_22

    :cond_41
    const-string v3, "AppsFlyer dev key is missing!!! Please use  AppsFlyerLib.getInstance().setAppsFlyerKey(...) to set it. "

    .line 1855
    invoke-static {v3}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    const-string v3, "AppsFlyer will not track this event."

    .line 1856
    invoke-static {v3}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_6

    const/4 v2, 0x0

    return-object v2

    :catchall_6
    move-exception v0

    move-object v3, v0

    .line 2109
    invoke-virtual {v3}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_42
    :goto_22
    return-object v2
.end method

.method public final AFInAppEventType(Landroid/content/Context;Ljava/lang/String;J)V
    .locals 2

    .line 604
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x61

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-static {p1, p2, p3, p4}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/SharedPreferences;Ljava/lang/String;J)V

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x4b

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method protected final AFInAppEventType(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/net/Uri;",
            ")V"
        }
    .end annotation

    const-string v0, "af_deeplink"

    .line 2266
    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_3

    .line 2267
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2269
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    move-result-object v4

    .line 2270
    iget-object v5, v4, Lcom/appsflyer/internal/f;->AFVersionDeclaration:Ljava/lang/String;

    if-eqz v5, :cond_2

    iget-object v5, v4, Lcom/appsflyer/internal/f;->getLevel:Ljava/util/Map;

    if-eqz v5, :cond_2

    .line 2297
    sget v5, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v5, v5, 0x19

    rem-int/lit16 v6, v5, 0x80

    sput v6, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v5, v5, 0x2

    .line 2270
    iget-object v5, v4, Lcom/appsflyer/internal/f;->AFVersionDeclaration:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 2271
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v5

    .line 2272
    sget-object v1, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v6

    .line 2273
    iget-object v1, v4, Lcom/appsflyer/internal/f;->getLevel:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    :goto_1
    if-eq v1, v3, :cond_1

    .line 2277
    invoke-virtual {v5}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2278
    invoke-virtual {v6}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->getEncodedQuery()Ljava/lang/String;

    move-result-object v4

    const-string v5, "appended_query_params"

    invoke-interface {p2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 2297
    :cond_1
    sget v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v1, 0x3

    rem-int/lit16 v7, v1, 0x80

    sput v7, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    .line 2273
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 2274
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-virtual {v5, v7, v8}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 2275
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v6, v7, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_0

    .line 2281
    :cond_2
    :goto_2
    invoke-interface {p2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2284
    :cond_3
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 2285
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, "link"

    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2286
    new-instance v1, Lcom/appsflyer/internal/aq;

    invoke-direct {v1, p3, p0, p1}, Lcom/appsflyer/internal/aq;-><init>(Landroid/net/Uri;Lcom/appsflyer/internal/ac;Landroid/content/Context;)V

    .line 2287
    iget-boolean v4, v1, Lcom/appsflyer/internal/aq;->values:Z

    const/16 v5, 0x53

    if-eqz v4, :cond_4

    const/16 v4, 0xe

    goto :goto_3

    :cond_4
    const/16 v4, 0x53

    :goto_3
    if-eq v4, v5, :cond_7

    .line 2297
    sget v4, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v4, v4, 0x15

    rem-int/lit16 v5, v4, 0x80

    sput v5, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v4, v4, 0x2

    if-nez v4, :cond_5

    const/4 v4, 0x0

    goto :goto_4

    :cond_5
    const/4 v4, 0x1

    :goto_4
    const-string v5, "isBrandedDomain"

    if-eq v4, v3, :cond_6

    .line 2288
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p2, 0x4

    :try_start_0
    div-int/2addr p2, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_5

    :catchall_0
    move-exception p1

    .line 2297
    throw p1

    .line 2288
    :cond_6
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {p2, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2291
    :cond_7
    :goto_5
    invoke-static {p1, v0, p3}, Lcom/appsflyer/internal/z;->AFInAppEventType(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)Ljava/util/Map;

    .line 2292
    invoke-virtual {v1}, Lcom/appsflyer/internal/aq;->AFInAppEventType()Z

    move-result p1

    if-eqz p1, :cond_a

    .line 2288
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/2addr p1, v3

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_8

    .line 2293
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Ljava/util/Map;)Lcom/appsflyer/internal/aq$a;

    move-result-object p1

    .line 50113
    iput-object p1, v1, Lcom/appsflyer/internal/aq;->AFKeystoreWrapper:Lcom/appsflyer/internal/aq$a;

    .line 50115
    sget-object p1, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    const/4 p2, 0x0

    :try_start_1
    invoke-super {p2}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-nez p1, :cond_9

    goto :goto_6

    :catchall_1
    move-exception p1

    .line 2288
    throw p1

    .line 2293
    :cond_8
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Ljava/util/Map;)Lcom/appsflyer/internal/aq$a;

    move-result-object p1

    .line 50113
    iput-object p1, v1, Lcom/appsflyer/internal/aq;->AFKeystoreWrapper:Lcom/appsflyer/internal/aq$a;

    .line 50115
    sget-object p1, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    if-nez p1, :cond_9

    .line 50116
    :goto_6
    new-instance p1, Lcom/appsflyer/internal/k;

    invoke-direct {p1}, Lcom/appsflyer/internal/k;-><init>()V

    sput-object p1, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 50118
    :cond_9
    sget-object p1, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 2295
    invoke-virtual {p1}, Lcom/appsflyer/internal/k;->AFInAppEventType()Ljava/util/concurrent/Executor;

    move-result-object p1

    invoke-interface {p1, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 2297
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x61

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    return-void

    :cond_a
    invoke-static {v0}, Lcom/appsflyer/internal/ao;->AFInAppEventType(Ljava/util/Map;)V

    return-void
.end method

.method public final AFKeystoreWrapper(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    const-string v0, "appsflyer_preinstall"

    .line 376
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x44

    if-eqz v1, :cond_0

    const/16 v1, 0x35

    goto :goto_0

    :cond_0
    const/16 v1, 0x44

    :goto_0
    if-eq v1, v2, :cond_1

    .line 377
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/lang/String;)V

    :cond_1
    const-string v0, "****** onReceive called *******"

    .line 379
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 381
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    const-string v0, "referrer"

    .line 383
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 384
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Play store referrer: "

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    const/4 v1, 0x0

    if-eqz p2, :cond_4

    .line 387
    invoke-static {p1, v0, p2}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v2, "AF_REFERRER"

    .line 7152
    invoke-virtual {v0, v2, p2}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 7153
    iput-object p2, v0, Lcom/appsflyer/AppsFlyerProperties;->valueOf:Ljava/lang/String;

    .line 392
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/AppsFlyerProperties;->values()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_4

    .line 395
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x4f

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const-string v2, "onReceive: isLaunchCalled"

    if-nez v0, :cond_3

    .line 393
    invoke-static {v2}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 394
    sget-object v0, Lcom/appsflyer/internal/ch;->AFInAppEventType:Lcom/appsflyer/internal/ch;

    invoke-direct {p0, p1, v0}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;Lcom/appsflyer/internal/ch;)V

    .line 395
    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;Ljava/lang/String;)V

    :try_start_0
    invoke-super {v1}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p1

    throw p1

    .line 393
    :cond_3
    invoke-static {v2}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 394
    sget-object v0, Lcom/appsflyer/internal/ch;->AFInAppEventType:Lcom/appsflyer/internal/ch;

    invoke-direct {p0, p1, v0}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;Lcom/appsflyer/internal/ch;)V

    .line 395
    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;Ljava/lang/String;)V

    :cond_4
    :goto_2
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x9

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_5

    :try_start_1
    array-length p1, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception p1

    throw p1

    :cond_5
    return-void
.end method

.method final AFKeystoreWrapper(Lcom/appsflyer/internal/i;Landroid/app/Activity;)V
    .locals 6

    .line 30058
    iget-object v0, p1, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    const/4 v1, 0x0

    const-string v2, ""

    const/4 v3, 0x1

    if-eqz p2, :cond_2

    .line 1383
    sget v4, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v4, v4, 0x23

    rem-int/lit16 v5, v4, 0x80

    sput v5, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v4, v4, 0x2

    .line 1367
    invoke-virtual {p2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    if-eqz v4, :cond_0

    const/4 v4, 0x0

    goto :goto_0

    :cond_0
    const/4 v4, 0x1

    :goto_0
    if-eqz v4, :cond_1

    goto :goto_1

    .line 1368
    :cond_1
    invoke-static {p2}, Lcom/appsflyer/internal/ap;->AFKeystoreWrapper(Landroid/app/Activity;)Landroid/net/Uri;

    move-result-object p2

    if-eqz p2, :cond_2

    .line 1383
    sget v4, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v4, v4, 0x75

    rem-int/lit16 v5, v4, 0x80

    sput v5, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v4, v4, 0x2

    .line 1370
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_2

    :cond_2
    :goto_1
    move-object p2, v2

    .line 1373
    :goto_2
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    invoke-virtual {v4}, Lcom/appsflyer/AppsFlyerProperties;->getDevKey()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_3

    const/4 v1, 0x1

    :cond_3
    if-eq v1, v3, :cond_6

    .line 1382
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/appsflyer/AppsFlyerProperties;->getReferrer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2e

    if-nez v0, :cond_4

    const/16 v3, 0x2e

    goto :goto_3

    :cond_4
    const/16 v3, 0x3a

    :goto_3
    if-eq v3, v1, :cond_5

    .line 1383
    sget v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v1, v1, 0x61

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    move-object v2, v0

    .line 30108
    :cond_5
    iput-object v2, p1, Lcom/appsflyer/internal/i;->AppsFlyer2dXConversionCallback:Ljava/lang/String;

    .line 30117
    iput-object p2, p1, Lcom/appsflyer/internal/i;->valueOf:Ljava/lang/String;

    .line 1383
    invoke-direct {p0, p1}, Lcom/appsflyer/internal/ac;->values(Lcom/appsflyer/internal/i;)V

    return-void

    :cond_6
    const-string p2, "[LogEvent/Launch] AppsFlyer\'s SDK cannot send any event without providing DevKey."

    .line 1375
    invoke-static {p2}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    .line 30095
    iget-object p1, p1, Lcom/appsflyer/internal/i;->AFInAppEventParameterName:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    if-eqz p1, :cond_7

    .line 1379
    sget p2, Lcom/appsflyer/attribution/RequestError;->NO_DEV_KEY:I

    sget-object v0, Lcom/appsflyer/internal/ba;->AFInAppEventParameterName:Ljava/lang/String;

    invoke-interface {p1, p2, v0}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    .line 1383
    :cond_7
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x61

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method public final AFKeystoreWrapper()Z
    .locals 5

    .line 634
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x65

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-string/jumbo v3, "waitForCustomerId"

    const/16 v4, 0x2d

    if-eqz v0, :cond_0

    invoke-static {v3, v1}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_1

    :cond_0
    invoke-static {v3, v2}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x48

    goto :goto_0

    :cond_1
    const/16 v0, 0x2d

    :goto_0
    if-eq v0, v4, :cond_4

    :goto_1
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventType()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_4

    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v2, v0, 0xb

    rem-int/lit16 v3, v2, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v2, v2, 0x2

    add-int/lit8 v0, v0, 0x3f

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v2, 0x1e

    if-eqz v0, :cond_2

    const/16 v4, 0x1e

    :cond_2
    if-eq v4, v2, :cond_3

    return v1

    :cond_3
    const/4 v0, 0x0

    :try_start_0
    array-length v0, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v1

    :catchall_0
    move-exception v0

    throw v0

    :cond_4
    return v2
.end method

.method public final varargs addPushNotificationDeepLinkPath([Ljava/lang/String;)V
    .locals 3

    .line 333
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x39

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    .line 331
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    .line 332
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    move-result-object v0

    iget-object v0, v0, Lcom/appsflyer/internal/f;->init:Ljava/util/List;

    .line 333
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    const/16 v2, 0x14

    if-nez v1, :cond_0

    const/16 v1, 0x14

    goto :goto_0

    :cond_0
    const/16 v1, 0x1c

    :goto_0
    if-eq v1, v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x6f

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p1, :cond_2

    const/4 p1, 0x0

    goto :goto_2

    :cond_2
    const/4 p1, 0x1

    :goto_2
    if-eq p1, v1, :cond_3

    const/16 p1, 0x35

    :try_start_0
    div-int/2addr p1, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1

    :cond_3
    return-void
.end method

.method public final anonymizeUser(Z)V
    .locals 7

    .line 1390
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x75

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v3, "deviceTrackingDisabled"

    const-string v4, "anonymizeUser"

    if-eqz v0, :cond_1

    .line 1389
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v5, v2, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-virtual {v0, v4, v5}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v5, v2, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {v0, v4, v5}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1390
    :goto_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, v3, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x4b

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    if-nez p1, :cond_2

    goto :goto_2

    :cond_2
    const/4 v1, 0x1

    :goto_2
    if-eq v1, v2, :cond_3

    const/4 p1, 0x0

    :try_start_0
    array-length p1, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1

    :cond_3
    return-void
.end method

.method public final appendParametersToDeepLinkingURL(Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 286
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x4b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 284
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    move-result-object v0

    .line 285
    iput-object p1, v0, Lcom/appsflyer/internal/f;->AFVersionDeclaration:Ljava/lang/String;

    .line 286
    iput-object p2, v0, Lcom/appsflyer/internal/f;->getLevel:Ljava/util/Map;

    const/16 p1, 0x9

    :try_start_0
    div-int/2addr p1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    throw p1

    .line 284
    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    move-result-object v0

    .line 285
    iput-object p1, v0, Lcom/appsflyer/internal/f;->AFVersionDeclaration:Ljava/lang/String;

    .line 286
    iput-object p2, v0, Lcom/appsflyer/internal/f;->getLevel:Ljava/util/Map;

    :goto_1
    return-void
.end method

.method public final enableFacebookDeferredApplinks(Z)V
    .locals 3

    .line 959
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v0, 0x55

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    iput-boolean p1, p0, Lcom/appsflyer/internal/ac;->setDebugLog:Z

    add-int/lit8 v0, v0, 0x6f

    rem-int/lit16 p1, v0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 p1, 0x6

    if-eqz v0, :cond_0

    const/4 v0, 0x6

    goto :goto_0

    :cond_0
    const/16 v0, 0x40

    :goto_0
    if-eq v0, p1, :cond_1

    return-void

    :cond_1
    const/16 p1, 0x49

    :try_start_0
    div-int/lit8 p1, p1, 0x0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1
.end method

.method public final enableLocationCollection(Z)Lcom/appsflyer/AppsFlyerLib;
    .locals 3

    .line 579
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x13

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    if-eq v0, v2, :cond_1

    .line 578
    iput-boolean p1, p0, Lcom/appsflyer/internal/ac;->AppsFlyerConversionListener:Z

    const/16 p1, 0x49

    .line 579
    :try_start_0
    div-int/2addr p1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    throw p1

    .line 578
    :cond_1
    iput-boolean p1, p0, Lcom/appsflyer/internal/ac;->AppsFlyerConversionListener:Z

    :goto_1
    return-object p0
.end method

.method public final getAppsFlyerUID(Landroid/content/Context;)Ljava/lang/String;
    .locals 5

    .line 50149
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x19

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const-string v3, "getAppsFlyerUID"

    if-eqz v0, :cond_2

    .line 2871
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v4, v2, [Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    if-eqz v1, :cond_4

    goto :goto_2

    :cond_2
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/String;

    invoke-virtual {v0, v3, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    if-nez p1, :cond_4

    .line 50149
    :goto_2
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x3

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    const/4 v0, 0x0

    if-nez p1, :cond_3

    :try_start_0
    invoke-super {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception p1

    throw p1

    :cond_3
    :goto_3
    return-object v0

    .line 2873
    :cond_4
    new-instance v0, Lcom/appsflyer/internal/aa;

    invoke-direct {v0, p1}, Lcom/appsflyer/internal/aa;-><init>(Landroid/content/Context;)V

    .line 50149
    new-instance p1, Ljava/lang/ref/WeakReference;

    iget-object v0, v0, Lcom/appsflyer/internal/aa;->AFInAppEventParameterName:Landroid/content/Context;

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {p1}, Lcom/appsflyer/internal/af;->valueOf(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final getAttributionId(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 2789
    :try_start_0
    new-instance v0, Lcom/appsflyer/internal/ae;

    invoke-direct {v0, p1}, Lcom/appsflyer/internal/ae;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/appsflyer/internal/ae;->AFInAppEventParameterName()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2792
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x13

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    return-object p1

    :catchall_0
    move-exception p1

    const-string v0, "Could not collect facebook attribution id. "

    .line 2791
    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public final getHostName()Ljava/lang/String;
    .locals 4

    .line 3168
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x5d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const-string v0, "custom_host"

    .line 3163
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    if-eq v3, v1, :cond_1

    const-string v0, "gt.nikolai-linschmann.de"

    return-object v0

    .line 3168
    :cond_1
    sget v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v1, v1, 0x3

    rem-int/lit16 v3, v1, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    add-int/lit8 v3, v3, 0x29

    rem-int/lit16 v1, v3, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v3, v3, 0x2

    const/16 v1, 0x59

    if-eqz v3, :cond_2

    const/16 v3, 0x59

    goto :goto_1

    :cond_2
    const/16 v3, 0x34

    :goto_1
    if-eq v3, v1, :cond_3

    return-object v0

    :cond_3
    const/16 v1, 0x4c

    :try_start_0
    div-int/2addr v1, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v0

    throw v0
.end method

.method public final getHostPrefix()Ljava/lang/String;
    .locals 3

    .line 3178
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x5f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const-string v1, "custom_host_prefix"

    if-nez v0, :cond_1

    .line 3173
    invoke-static {v1}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 3175
    :try_start_0
    array-length v1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v1, 0xf

    if-eqz v0, :cond_0

    const/16 v2, 0xf

    goto :goto_0

    :cond_0
    const/16 v2, 0x32

    :goto_0
    if-eq v2, v1, :cond_3

    goto :goto_2

    :catchall_0
    move-exception v0

    .line 3178
    throw v0

    .line 3173
    :cond_1
    invoke-static {v1}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    const/16 v2, 0x1a

    :goto_1
    if-eq v2, v1, :cond_3

    :goto_2
    const-string v0, ""

    return-object v0

    .line 3178
    :cond_3
    sget v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v1, 0x77

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    return-object v0
.end method

.method public final getOutOfStore(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 671
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "api_store_value"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 682
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x31

    rem-int/lit16 v2, p1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/16 v2, 0x35

    if-eqz p1, :cond_0

    const/16 p1, 0x2d

    goto :goto_0

    :cond_0
    const/16 p1, 0x35

    :goto_0
    if-eq p1, v2, :cond_1

    const/16 p1, 0x2e

    :try_start_0
    div-int/2addr p1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception p1

    throw p1

    :cond_1
    return-object v0

    :cond_2
    const-string v0, "AF_STORE"

    .line 676
    invoke-direct {p0, p1, v0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x1

    if-eqz p1, :cond_3

    const/4 v1, 0x1

    :cond_3
    if-eq v1, v0, :cond_4

    const-string p1, "No out-of-store value set"

    .line 681
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1

    .line 682
    :cond_4
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x79

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    add-int/lit8 v1, v1, 0x1b

    rem-int/lit16 v0, v1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    return-object p1
.end method

.method public final getSdkVersion()Ljava/lang/String;
    .locals 3

    .line 537
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "getSdkVersion"

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 538
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "version: 6.5.4 (build "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v1, Lcom/appsflyer/internal/ac;->valueOf:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    sget v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v1, v1, 0x9

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    return-object v0
.end method

.method public final init(Ljava/lang/String;Lcom/appsflyer/AppsFlyerConversionListener;Landroid/content/Context;)Lcom/appsflyer/AppsFlyerLib;
    .locals 10

    .line 916
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0xd

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    const/4 v1, 0x2

    rem-int/2addr v0, v1

    .line 850
    iget-boolean v0, p0, Lcom/appsflyer/internal/ac;->AppsFlyerInAppPurchaseValidatorListener:Z

    const/16 v2, 0x61

    if-eqz v0, :cond_0

    const/16 v0, 0x2e

    goto :goto_0

    :cond_0
    const/16 v0, 0x61

    :goto_0
    if-eq v0, v2, :cond_1

    return-object p0

    :cond_1
    const/4 v0, 0x1

    .line 851
    iput-boolean v0, p0, Lcom/appsflyer/internal/ac;->AppsFlyerInAppPurchaseValidatorListener:Z

    .line 854
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/appsflyer/AppsFlyerProperties;->setDevKey(Ljava/lang/String;)V

    .line 855
    invoke-static {p1}, Lcom/appsflyer/internal/ai;->AFInAppEventType(Ljava/lang/String;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz p3, :cond_8

    .line 898
    sget v5, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v5, v5, 0x71

    rem-int/lit16 v6, v5, 0x80

    sput v6, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr v5, v1

    .line 857
    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    check-cast v5, Landroid/app/Application;

    iput-object v5, p0, Lcom/appsflyer/internal/ac;->stop:Landroid/app/Application;

    .line 858
    iget-object v5, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    if-eqz p3, :cond_2

    .line 10062
    iget-object v5, v5, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    if-eqz p3, :cond_2

    .line 11018
    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    iput-object v6, v5, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 916
    sget v5, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v5, v5, 0x57

    rem-int/lit16 v6, v5, 0x80

    sput v6, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr v5, v1

    .line 859
    :cond_2
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v5

    invoke-interface {v5}, Lcom/appsflyer/internal/bg;->getLevel()Lcom/appsflyer/internal/cl;

    move-result-object v5

    .line 11072
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iput-wide v6, v5, Lcom/appsflyer/internal/cl;->AFInAppEventType:J

    .line 861
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v5

    invoke-interface {v5}, Lcom/appsflyer/internal/bg;->values()Lcom/appsflyer/internal/by;

    move-result-object v5

    invoke-virtual {v5, v3}, Lcom/appsflyer/internal/by;->values(Lcom/appsflyer/internal/bv;)V

    .line 862
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v5

    invoke-interface {v5}, Lcom/appsflyer/internal/bg;->AFLogger$LogLevel()Lcom/appsflyer/internal/de;

    move-result-object v5

    .line 864
    new-instance v6, Lcom/appsflyer/internal/cx;

    new-instance v7, Lcom/appsflyer/internal/ac$1;

    invoke-direct {v7, p0}, Lcom/appsflyer/internal/ac$1;-><init>(Lcom/appsflyer/internal/ac;)V

    invoke-direct {v6, v7}, Lcom/appsflyer/internal/cx;-><init>(Ljava/lang/Runnable;)V

    .line 884
    new-instance v7, Lcom/appsflyer/internal/ac$2;

    invoke-direct {v7, p0, v6}, Lcom/appsflyer/internal/ac$2;-><init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/cx;)V

    .line 895
    invoke-virtual {v5, v6}, Lcom/appsflyer/internal/de;->AFKeystoreWrapper(Lcom/appsflyer/internal/dd;)V

    .line 896
    new-instance v6, Lcom/appsflyer/internal/cy;

    invoke-direct {v6, v7}, Lcom/appsflyer/internal/cy;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v5, v6}, Lcom/appsflyer/internal/de;->AFKeystoreWrapper(Lcom/appsflyer/internal/dd;)V

    .line 897
    new-instance v6, Lcom/appsflyer/internal/df;

    invoke-direct {v6, v7}, Lcom/appsflyer/internal/df;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v5, v6}, Lcom/appsflyer/internal/de;->AFKeystoreWrapper(Lcom/appsflyer/internal/dd;)V

    .line 898
    invoke-virtual {v5}, Lcom/appsflyer/internal/de;->AFInAppEventType()[Lcom/appsflyer/internal/dd;

    move-result-object v5

    array-length v6, v5

    const/4 v7, 0x0

    :goto_1
    const/16 v8, 0x39

    if-ge v7, v6, :cond_3

    const/16 v9, 0x39

    goto :goto_2

    :cond_3
    const/16 v9, 0x61

    :goto_2
    if-eq v9, v8, :cond_5

    .line 902
    iget-object v2, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    invoke-virtual {v2}, Lcom/appsflyer/internal/bf;->init()Lcom/appsflyer/internal/ca;

    move-result-object v2

    invoke-virtual {v2}, Lcom/appsflyer/internal/ca;->values()Z

    .line 903
    iget-object v2, p0, Lcom/appsflyer/internal/ac;->stop:Landroid/app/Application;

    .line 12015
    sput-object v2, Lcom/appsflyer/internal/ay;->AFInAppEventParameterName:Landroid/app/Application;

    .line 904
    invoke-static {p3}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 905
    invoke-virtual {p0, v2, v4}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Z)I

    move-result v2

    const/16 v5, 0x9

    if-nez v2, :cond_4

    const/16 v2, 0xe

    goto :goto_3

    :cond_4
    const/16 v2, 0x9

    :goto_3
    if-eq v2, v5, :cond_9

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1d

    if-lt v2, v5, :cond_9

    .line 907
    new-instance v2, Lcom/appsflyer/internal/dc;

    invoke-direct {v2, p3}, Lcom/appsflyer/internal/dc;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/appsflyer/internal/ac;->setAndroidIdData:Lcom/appsflyer/internal/dc;

    .line 12056
    new-instance p3, Ljava/lang/Thread;

    iget-object v2, v2, Lcom/appsflyer/internal/dc;->AFInAppEventParameterName:Ljava/util/concurrent/FutureTask;

    invoke-direct {p3, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p3}, Ljava/lang/Thread;->start()V

    goto :goto_5

    .line 916
    :cond_5
    sget v8, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v8, v8, 0x13

    rem-int/lit16 v9, v8, 0x80

    sput v9, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr v8, v1

    if-eqz v8, :cond_6

    const/4 v8, 0x0

    goto :goto_4

    :cond_6
    const/4 v8, 0x1

    :goto_4
    if-eq v8, v0, :cond_7

    aget-object v8, v5, v7

    .line 899
    iget-object v9, p0, Lcom/appsflyer/internal/ac;->stop:Landroid/app/Application;

    invoke-virtual {v8, v9}, Lcom/appsflyer/internal/dd;->AFInAppEventParameterName(Landroid/content/Context;)V

    add-int/lit8 v7, v7, 0x2e

    goto :goto_1

    .line 898
    :cond_7
    aget-object v8, v5, v7

    .line 899
    iget-object v9, p0, Lcom/appsflyer/internal/ac;->stop:Landroid/app/Application;

    invoke-virtual {v8, v9}, Lcom/appsflyer/internal/dd;->AFInAppEventParameterName(Landroid/content/Context;)V

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_8
    const-string p3, "context is null, Google Install Referrer will be not initialized"

    .line 911
    invoke-static {p3}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    .line 913
    :cond_9
    :goto_5
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object p3

    new-array v2, v1, [Ljava/lang/String;

    aput-object p1, v2, v4

    if-nez p2, :cond_a

    const/4 p1, 0x0

    goto :goto_6

    :cond_a
    const/4 p1, 0x1

    :goto_6
    if-eq p1, v0, :cond_b

    const-string p1, "null"

    goto :goto_7

    :cond_b
    const-string p1, "conversionDataListener"

    :goto_7
    aput-object p1, v2, v0

    const-string p1, "init"

    invoke-virtual {p3, p1, v2}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    new-array p1, v1, [Ljava/lang/Object;

    const-string p3, "6.5.4"

    aput-object p3, p1, v4

    .line 914
    sget-object p3, Lcom/appsflyer/internal/ac;->valueOf:Ljava/lang/String;

    aput-object p3, p1, v0

    const-string p3, "Initializing AppsFlyer SDK: (v%s.%s)"

    invoke-static {p3, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AFInAppEventType(Ljava/lang/String;)V

    .line 915
    sput-object p2, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener;

    .line 916
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x7

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr p1, v1

    if-nez p1, :cond_c

    :try_start_0
    invoke-super {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p1

    throw p1

    :cond_c
    return-object p0
.end method

.method public final isPreInstalledApp(Landroid/content/Context;)Z
    .locals 3

    const/4 v0, 0x0

    .line 2743
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    .line 2748
    iget p1, p1, Landroid/content/pm/ApplicationInfo;->flags:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x1

    and-int/2addr p1, v1

    const/16 v2, 0x5b

    if-eqz p1, :cond_0

    const/16 p1, 0x5b

    goto :goto_0

    :cond_0
    const/16 p1, 0x5c

    :goto_0
    if-eq p1, v2, :cond_1

    goto :goto_2

    .line 2754
    :cond_1
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x61

    rem-int/lit16 v2, p1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/16 v2, 0x50

    if-eqz p1, :cond_2

    const/16 p1, 0x50

    goto :goto_1

    :cond_2
    const/16 p1, 0x31

    :goto_1
    if-eq p1, v2, :cond_3

    return v1

    :cond_3
    return v0

    :catch_0
    move-exception p1

    const-string v1, "Could not check if app is pre installed"

    .line 2752
    invoke-static {v1, p1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2754
    :goto_2
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x6d

    rem-int/lit16 v1, p1, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    return v0
.end method

.method public final isStopped()Z
    .locals 3

    .line 3034
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x3b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    iget-boolean v0, p0, Lcom/appsflyer/internal/ac;->getInstance:Z

    add-int/lit8 v1, v1, 0x7b

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    const/16 v2, 0x30

    if-eqz v1, :cond_0

    const/16 v1, 0x44

    goto :goto_0

    :cond_0
    const/16 v1, 0x30

    :goto_0
    if-eq v1, v2, :cond_1

    const/4 v1, 0x0

    :try_start_0
    array-length v1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return v0

    :catchall_0
    move-exception v0

    throw v0

    :cond_1
    return v0
.end method

.method public final logEvent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1353
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x45

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 v3, 0x0

    invoke-virtual {p0, p1, p2, p3, v3}, Lcom/appsflyer/AppsFlyerLib;->logEvent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V

    if-eq v0, v1, :cond_1

    goto :goto_1

    :cond_1
    const/16 p1, 0x10

    :try_start_0
    div-int/2addr p1, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :goto_1
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x3d

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/16 p2, 0x55

    if-eqz p1, :cond_2

    const/16 p1, 0x55

    goto :goto_2

    :cond_2
    const/16 p1, 0x1a

    :goto_2
    if-eq p1, p2, :cond_3

    return-void

    :cond_3
    :try_start_1
    array-length p1, v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1

    :catchall_1
    move-exception p1

    throw p1
.end method

.method public final logEvent(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/appsflyer/attribution/AppsFlyerRequestListener;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p3, :cond_0

    move-object v1, v0

    goto :goto_0

    .line 20040
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1, p3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 1258
    :goto_0
    iget-object p3, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    if-eqz p1, :cond_1

    .line 20062
    iget-object p3, p3, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    if-eqz p1, :cond_1

    .line 21018
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iput-object v2, p3, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 1259
    :cond_1
    new-instance p3, Lcom/appsflyer/internal/co;

    invoke-direct {p3}, Lcom/appsflyer/internal/co;-><init>()V

    if-eqz p1, :cond_2

    .line 21053
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Landroid/app/Application;

    iput-object v2, p3, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    .line 21099
    :cond_2
    iput-object p2, p3, Lcom/appsflyer/internal/i;->getLevel:Ljava/lang/String;

    .line 22089
    iput-object p4, p3, Lcom/appsflyer/internal/i;->AFInAppEventParameterName:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    if-eqz v1, :cond_4

    const-string p4, "af_touch_obj"

    .line 1263
    invoke-interface {v1, p4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 23022
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 23023
    invoke-interface {v1, p4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 23024
    instance-of v4, v3, Landroid/view/MotionEvent;

    if-eqz v4, :cond_3

    .line 23025
    check-cast v3, Landroid/view/MotionEvent;

    .line 23026
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 23027
    invoke-virtual {v3}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    const-string/jumbo v6, "x"

    invoke-interface {v4, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23028
    invoke-virtual {v3}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    const-string/jumbo v6, "y"

    invoke-interface {v4, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v5, "loc"

    .line 23029
    invoke-interface {v2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23030
    invoke-virtual {v3}, Landroid/view/MotionEvent;->getPressure()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const-string v5, "pf"

    invoke-interface {v2, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23031
    invoke-virtual {v3}, Landroid/view/MotionEvent;->getTouchMajor()F

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    const-string v4, "rad"

    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_3
    const-string v3, "error"

    const-string v4, "Parsing failed due to invalid input in \'af_touch_obj\'."

    .line 23033
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23034
    invoke-static {v4}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;)V

    :goto_1
    const-string/jumbo v3, "tch_data"

    .line 23036
    invoke-static {v3, v2}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    .line 1265
    invoke-interface {v1, p4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1266
    invoke-virtual {p3, v2}, Lcom/appsflyer/internal/i;->AFInAppEventParameterName(Ljava/util/Map;)Lcom/appsflyer/internal/i;

    .line 23062
    :cond_4
    iput-object v1, p3, Lcom/appsflyer/internal/i;->values:Ljava/util/Map;

    .line 1269
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object p4

    invoke-interface {p4}, Lcom/appsflyer/internal/bg;->AppsFlyer2dXConversionCallback()Lcom/appsflyer/internal/ak;

    move-result-object p4

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 v2, 0x1

    .line 23068
    new-instance v3, Lorg/json/JSONObject;

    iget-object v4, p3, Lcom/appsflyer/internal/i;->values:Ljava/util/Map;

    if-nez v4, :cond_5

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    goto :goto_2

    :cond_5
    iget-object v4, p3, Lcom/appsflyer/internal/i;->values:Ljava/util/Map;

    :goto_2
    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "logEvent"

    .line 1269
    invoke-virtual {p4, v2, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    if-eqz p2, :cond_6

    .line 1271
    invoke-static {p1}, Lcom/appsflyer/internal/w;->AFKeystoreWrapper(Landroid/content/Context;)Lcom/appsflyer/internal/w;

    move-result-object p2

    invoke-virtual {p2}, Lcom/appsflyer/internal/w;->AFInAppEventType()V

    goto :goto_3

    .line 1273
    :cond_6
    sget-object p2, Lcom/appsflyer/internal/ch;->AFInAppEventParameterName:Lcom/appsflyer/internal/ch;

    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;Lcom/appsflyer/internal/ch;)V

    .line 1275
    :goto_3
    instance-of p2, p1, Landroid/app/Activity;

    if-eqz p2, :cond_7

    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    :cond_7
    invoke-virtual {p0, p3, v0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Lcom/appsflyer/internal/i;Landroid/app/Activity;)V

    return-void
.end method

.method public final logLocation(Landroid/content/Context;DD)V
    .locals 6

    .line 1155
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/String;

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const-string v3, "logLocation"

    invoke-virtual {v0, v3, v2}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1156
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1157
    invoke-static {p4, p5}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p4

    const-string p5, "af_long"

    invoke-interface {v0, p5, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1158
    invoke-static {p2, p3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p2

    const-string p3, "af_lat"

    invoke-interface {v0, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "af_location_coordinates"

    .line 1159
    invoke-direct {p0, p1, p2, v0}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x41

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr p1, v1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v4, 0x1

    :goto_0
    if-eq v4, v5, :cond_1

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

.method public final logSession(Landroid/content/Context;)V
    .locals 5

    .line 1227
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x33

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const-string v3, "logSession"

    const/4 v4, 0x0

    if-eq v0, v2, :cond_1

    .line 1223
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/String;

    invoke-virtual {v0, v3, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1225
    :goto_1
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/internal/ak;->getLevel()V

    .line 1226
    sget-object v0, Lcom/appsflyer/internal/ch;->values:Lcom/appsflyer/internal/ch;

    invoke-direct {p0, p1, v0}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;Lcom/appsflyer/internal/ch;)V

    .line 1227
    invoke-direct {p0, p1, v4, v4}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_2

    .line 1223
    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/String;

    invoke-virtual {v0, v3, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1

    :goto_2
    return-void
.end method

.method public final onPause(Landroid/content/Context;)V
    .locals 3

    .line 544
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x41

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 543
    sget-object v0, Lcom/appsflyer/internal/ah;->AFInAppEventParameterName:Lcom/appsflyer/internal/ah$e;

    const/16 v1, 0x3f

    if-eqz v0, :cond_0

    const/16 v0, 0x3f

    goto :goto_0

    :cond_0
    const/16 v0, 0x32

    :goto_0
    if-eq v0, v1, :cond_1

    goto :goto_2

    .line 544
    :cond_1
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x6d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    const/4 v0, 0x1

    :goto_1
    if-eq v0, v2, :cond_3

    sget-object v0, Lcom/appsflyer/internal/ah;->AFInAppEventParameterName:Lcom/appsflyer/internal/ah$e;

    invoke-interface {v0, p1}, Lcom/appsflyer/internal/ah$e;->valueOf(Landroid/content/Context;)V

    const/16 p1, 0xd

    :try_start_0
    div-int/2addr p1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p1

    throw p1

    :cond_3
    sget-object v0, Lcom/appsflyer/internal/ah;->AFInAppEventParameterName:Lcom/appsflyer/internal/ah$e;

    invoke-interface {v0, p1}, Lcom/appsflyer/internal/ah$e;->valueOf(Landroid/content/Context;)V

    :goto_2
    return-void
.end method

.method public final performOnAppAttribution(Landroid/content/Context;Ljava/net/URI;)V
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/16 v0, 0x3f

    if-eqz p2, :cond_0

    const/16 v1, 0x3f

    goto :goto_0

    :cond_0
    const/16 v1, 0x2d

    :goto_0
    const-string v2, "\""

    if-eq v1, v0, :cond_1

    goto :goto_1

    .line 258
    :cond_1
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x31

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    :try_start_0
    invoke-super {v1}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_3

    goto :goto_1

    :catchall_0
    move-exception p1

    throw p1

    .line 253
    :cond_2
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 254
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Link is \""

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 4015
    sget-object p2, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->NETWORK:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    invoke-static {p1, p2}, Lcom/appsflyer/internal/ao;->AFInAppEventType(Ljava/lang/String;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    return-void

    :cond_3
    if-nez p1, :cond_4

    .line 256
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "Context is \""

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 5015
    sget-object p2, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->NETWORK:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    invoke-static {p1, p2}, Lcom/appsflyer/internal/ao;->AFInAppEventType(Ljava/lang/String;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    return-void

    .line 258
    :cond_4
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    move-result-object v0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 261
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p2

    .line 258
    invoke-virtual {v0, p1, v2, p2}, Lcom/appsflyer/internal/f;->AFInAppEventType(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V

    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x79

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    const/4 p2, 0x1

    if-nez p1, :cond_5

    const/4 p1, 0x1

    goto :goto_2

    :cond_5
    const/4 p1, 0x0

    :goto_2
    if-eq p1, p2, :cond_6

    return-void

    :cond_6
    :try_start_1
    array-length p1, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception p1

    throw p1
.end method

.method public final performOnDeepLinking(Landroid/content/Intent;Landroid/content/Context;)V
    .locals 5

    .line 6018
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v0, 0x21

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    if-nez p1, :cond_0

    add-int/lit8 v0, v0, 0x41

    .line 318
    rem-int/lit16 p1, v0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 303
    sget-object p1, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->DEVELOPER_ERROR:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    const-string p2, "performOnDeepLinking was called with null intent"

    invoke-static {p2, p1}, Lcom/appsflyer/internal/ao;->AFInAppEventType(Ljava/lang/String;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    return-void

    :cond_0
    if-nez p2, :cond_1

    add-int/lit8 v0, v0, 0x5f

    .line 318
    rem-int/lit16 p1, v0, 0x80

    sput p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 309
    sget-object p1, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->DEVELOPER_ERROR:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    const-string p2, "performOnDeepLinking was called with null context"

    invoke-static {p2, p1}, Lcom/appsflyer/internal/ao;->AFInAppEventType(Ljava/lang/String;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    return-void

    .line 314
    :cond_1
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    .line 316
    iget-object v0, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    const/16 v1, 0x4a

    if-eqz p2, :cond_2

    const/4 v2, 0x3

    goto :goto_0

    :cond_2
    const/16 v2, 0x4a

    :goto_0
    const/4 v3, 0x1

    if-eq v2, v1, :cond_5

    .line 318
    sget v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v1, v1, 0x71

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    .line 5062
    iget-object v0, v0, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    const/4 v1, 0x0

    if-eqz p2, :cond_3

    const/4 v2, 0x0

    goto :goto_1

    :cond_3
    const/4 v2, 0x1

    :goto_1
    if-eq v2, v3, :cond_5

    .line 318
    sget v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v2, v2, 0x43

    rem-int/lit16 v4, v2, 0x80

    sput v4, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v2, v2, 0x2

    if-eqz v2, :cond_4

    .line 6018
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iput-object v2, v0, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    const/16 v0, 0x3b

    :try_start_0
    div-int/2addr v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p1

    .line 318
    throw p1

    .line 6018
    :cond_4
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, v0, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 318
    :goto_2
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x5

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    .line 317
    :cond_5
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/bg;->getLevel()Lcom/appsflyer/internal/cl;

    move-result-object v0

    .line 318
    iget-object v1, p0, Lcom/appsflyer/internal/ac;->setOaidData:Ljava/util/concurrent/Executor;

    new-instance v2, Lcom/appsflyer/internal/ac$4;

    invoke-direct {v2, p0, p1, p2, v0}, Lcom/appsflyer/internal/ac$4;-><init>(Lcom/appsflyer/internal/ac;Landroid/content/Intent;Landroid/content/Context;Lcom/appsflyer/internal/cl;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/2addr p1, v3

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method public final registerConversionListener(Landroid/content/Context;Lcom/appsflyer/AppsFlyerConversionListener;)V
    .locals 3

    .line 1396
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x27

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/16 v0, 0x1a

    if-eqz p1, :cond_0

    const/16 p1, 0x1a

    goto :goto_0

    :cond_0
    const/16 p1, 0x11

    :goto_0
    const/4 v1, 0x0

    const-string v2, "registerConversionListener"

    if-eq p1, v0, :cond_1

    .line 1395
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/String;

    invoke-virtual {p1, v2, v0}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1396
    :goto_1
    invoke-static {p2}, Lcom/appsflyer/internal/ac;->values(Lcom/appsflyer/AppsFlyerConversionListener;)V

    goto :goto_2

    .line 1395
    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object p1

    new-array v0, v1, [Ljava/lang/String;

    invoke-virtual {p1, v2, v0}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1

    .line 1396
    :goto_2
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x49

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method public final registerValidatorListener(Landroid/content/Context;Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;)V
    .locals 3

    .line 1423
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x61

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    .line 1415
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object p1

    const/4 v0, 0x0

    new-array v1, v0, [Ljava/lang/String;

    const-string v2, "registerValidatorListener"

    invoke-virtual {p1, v2, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    const-string p1, "registerValidatorListener called"

    .line 1417
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    const/4 p1, 0x7

    if-nez p2, :cond_0

    const/4 v1, 0x7

    goto :goto_0

    :cond_0
    const/16 v1, 0xa

    :goto_0
    if-eq v1, p1, :cond_1

    .line 1423
    sput-object p2, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName:Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;

    return-void

    :cond_1
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x43

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    const/16 p2, 0x4f

    if-nez p1, :cond_2

    const/16 p1, 0x4f

    goto :goto_1

    :cond_2
    const/16 p1, 0x44

    :goto_1
    const-string v1, "registerValidatorListener null listener"

    .line 1420
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    if-eq p1, p2, :cond_3

    return-void

    :cond_3
    const/16 p1, 0x45

    :try_start_0
    div-int/2addr p1, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    .line 1423
    throw p1
.end method

.method public final sendAdRevenue(Landroid/content/Context;Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 25017
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x23

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v2, 0x0

    if-nez v0, :cond_1

    .line 1280
    iget-object v0, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    const/16 v3, 0x12

    .line 24061
    :try_start_0
    div-int/2addr v3, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v3, 0x60

    if-eqz p1, :cond_0

    const/16 v4, 0x60

    goto :goto_0

    :cond_0
    const/16 v4, 0x52

    :goto_0
    if-eq v4, v3, :cond_2

    goto :goto_3

    :catchall_0
    move-exception p1

    .line 25017
    throw p1

    .line 1280
    :cond_1
    iget-object v0, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    if-eqz p1, :cond_7

    :cond_2
    add-int/lit8 v1, v1, 0x41

    .line 1281
    rem-int/lit16 v3, v1, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_3

    const/4 v2, 0x1

    :cond_3
    if-eqz v2, :cond_4

    .line 24062
    iget-object v0, v0, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    const/4 v1, 0x0

    .line 25017
    :try_start_1
    array-length v1, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz p1, :cond_7

    goto :goto_2

    :catchall_1
    move-exception p1

    .line 1281
    throw p1

    .line 24062
    :cond_4
    iget-object v0, v0, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    const/16 v1, 0x2b

    if-eqz p1, :cond_5

    const/16 v2, 0x2b

    goto :goto_1

    :cond_5
    const/16 v2, 0x16

    :goto_1
    if-eq v2, v1, :cond_6

    goto :goto_3

    .line 25018
    :cond_6
    :goto_2
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iput-object v1, v0, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 1281
    :cond_7
    :goto_3
    new-instance v0, Lcom/appsflyer/internal/ck;

    invoke-direct {v0}, Lcom/appsflyer/internal/ck;-><init>()V

    if-eqz p1, :cond_8

    .line 25017
    sget v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v1, 0x1d

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    .line 25053
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Landroid/app/Application;

    iput-object p1, v0, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    .line 25062
    :cond_8
    iput-object p2, v0, Lcom/appsflyer/internal/i;->values:Ljava/util/Map;

    .line 1281
    invoke-direct {p0, v0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Lcom/appsflyer/internal/i;)V

    return-void
.end method

.method public final sendPushNotificationData(Landroid/app/Activity;)V
    .locals 16

    move-object/from16 v1, p0

    const-string v0, "c"

    const-string v2, "pid"

    .line 722
    sget v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v3, v3, 0x51

    rem-int/lit16 v4, v3, 0x80

    sput v4, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    const/4 v5, 0x2

    rem-int/2addr v3, v5

    const/4 v3, 0x1

    const-string v6, "sendPushNotificationData"

    const/4 v7, 0x0

    if-eqz p1, :cond_1

    add-int/lit8 v4, v4, 0x2b

    rem-int/lit16 v8, v4, 0x80

    sput v8, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr v4, v5

    if-nez v4, :cond_0

    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const/16 v8, 0x29

    :try_start_0
    div-int/2addr v8, v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_1

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v2, v0

    throw v2

    .line 719
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 720
    :goto_0
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v4

    new-array v8, v5, [Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v7

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "activity_intent_"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v3

    invoke-virtual {v4, v6, v8}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 752
    sget v3, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v3, v3, 0x27

    rem-int/lit16 v4, v3, 0x80

    sput v4, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr v3, v5

    goto :goto_1

    :cond_1
    if-eqz p1, :cond_3

    sget v4, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v4, v4, 0x7

    rem-int/lit16 v8, v4, 0x80

    sput v8, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr v4, v5

    const-string v8, "activity_intent_null"

    if-eqz v4, :cond_2

    .line 722
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v4

    new-array v9, v5, [Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v3

    aput-object v8, v9, v7

    invoke-virtual {v4, v6, v9}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v4

    new-array v9, v5, [Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v7

    aput-object v8, v9, v3

    invoke-virtual {v4, v6, v9}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1

    .line 724
    :cond_3
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v3

    const-string v4, "activity_null"

    filled-new-array {v4}, [Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v6, v4}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 727
    :goto_1
    invoke-static/range {p1 .. p1}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v1, Lcom/appsflyer/internal/ac;->onDeepLinking:Ljava/lang/String;

    if-eqz v3, :cond_e

    .line 729
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 731
    iget-object v6, v1, Lcom/appsflyer/internal/ac;->onResponse:Ljava/util/Map;

    const-string v8, ")"

    if-nez v6, :cond_4

    const-string v0, "pushes: initializing pushes history.."

    .line 732
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 733
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, v1, Lcom/appsflyer/internal/ac;->onResponse:Ljava/util/Map;

    move-wide v11, v3

    goto/16 :goto_8

    .line 736
    :cond_4
    :try_start_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v6

    const-string v9, "pushPayloadMaxAging"

    const-wide/32 v10, 0x1b7740

    invoke-virtual {v6, v9, v10, v11}, Lcom/appsflyer/AppsFlyerProperties;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    .line 737
    iget-object v6, v1, Lcom/appsflyer/internal/ac;->onResponse:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-wide v11, v3

    :goto_2
    :try_start_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_c

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Long;

    .line 739
    new-instance v14, Lorg/json/JSONObject;

    iget-object v15, v1, Lcom/appsflyer/internal/ac;->onDeepLinking:Ljava/lang/String;

    invoke-direct {v14, v15}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 740
    new-instance v15, Lorg/json/JSONObject;

    iget-object v7, v1, Lcom/appsflyer/internal/ac;->onResponse:Ljava/util/Map;

    invoke-interface {v7, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-direct {v15, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 741
    invoke-virtual {v14, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v15, v2}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 742
    invoke-virtual {v14, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 743
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "PushNotificationMeasurement: A previous payload with same PID and campaign was already acknowledged! (old: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", new: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 746
    iput-object v0, v1, Lcom/appsflyer/internal/ac;->onDeepLinking:Ljava/lang/String;

    return-void

    .line 751
    :cond_5
    invoke-virtual {v13}, Ljava/lang/Number;->longValue()J

    move-result-wide v14
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    sub-long v14, v3, v14

    cmp-long v5, v14, v9

    if-lez v5, :cond_8

    .line 757
    sget v5, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v5, v5, 0x29

    rem-int/lit16 v7, v5, 0x80

    sput v7, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    const/4 v7, 0x2

    rem-int/2addr v5, v7

    const/16 v7, 0x23

    if-eqz v5, :cond_6

    const/16 v5, 0x22

    goto :goto_3

    :cond_6
    const/16 v5, 0x23

    :goto_3
    if-eq v5, v7, :cond_7

    .line 752
    :try_start_3
    iget-object v5, v1, Lcom/appsflyer/internal/ac;->onResponse:Ljava/util/Map;

    invoke-interface {v5, v13}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v5, 0x13

    const/4 v7, 0x0

    div-int/2addr v5, v7

    goto :goto_4

    :cond_7
    const/4 v7, 0x0

    iget-object v5, v1, Lcom/appsflyer/internal/ac;->onResponse:Ljava/util/Map;

    invoke-interface {v5, v13}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    :cond_8
    const/4 v7, 0x0

    .line 756
    :goto_4
    invoke-virtual {v13}, Ljava/lang/Number;->longValue()J

    move-result-wide v14
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    cmp-long v5, v14, v11

    if-gtz v5, :cond_b

    .line 772
    sget v5, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v5, v5, 0x79

    rem-int/lit16 v14, v5, 0x80

    sput v14, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    const/4 v14, 0x2

    rem-int/2addr v5, v14

    const/16 v14, 0x37

    if-nez v5, :cond_9

    const/16 v5, 0xb

    goto :goto_5

    :cond_9
    const/16 v5, 0x37

    :goto_5
    if-eq v5, v14, :cond_a

    .line 757
    :try_start_4
    invoke-virtual {v13}, Ljava/lang/Number;->longValue()J

    move-result-wide v11

    const/4 v5, 0x0

    array-length v5, v5

    goto :goto_6

    :cond_a
    invoke-virtual {v13}, Ljava/lang/Number;->longValue()J

    move-result-wide v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :cond_b
    :goto_6
    const/4 v5, 0x2

    goto/16 :goto_2

    :catchall_1
    move-exception v0

    goto :goto_7

    :catchall_2
    move-exception v0

    move-wide v11, v3

    .line 761
    :goto_7
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v5, "Error while handling push notification measurement: "

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 766
    :cond_c
    :goto_8
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v2, "pushPayloadHistorySize"

    const/4 v5, 0x2

    invoke-virtual {v0, v2, v5}, Lcom/appsflyer/AppsFlyerProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 767
    iget-object v2, v1, Lcom/appsflyer/internal/ac;->onResponse:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    if-ne v2, v0, :cond_d

    .line 768
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "pushes: removing oldest overflowing push (oldest push:"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 769
    iget-object v0, v1, Lcom/appsflyer/internal/ac;->onResponse:Ljava/util/Map;

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 771
    :cond_d
    iget-object v0, v1, Lcom/appsflyer/internal/ac;->onResponse:Ljava/util/Map;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iget-object v3, v1, Lcom/appsflyer/internal/ac;->onDeepLinking:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 772
    invoke-virtual/range {p0 .. p1}, Lcom/appsflyer/AppsFlyerLib;->start(Landroid/content/Context;)V

    :cond_e
    return-void
.end method

.method public final setAdditionalData(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 713
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x1f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz p1, :cond_0

    .line 711
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "setAdditionalData"

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 712
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 713
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p1

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/appsflyer/AppsFlyerProperties;->setCustomData(Ljava/lang/String;)V

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x3

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    :cond_0
    return-void
.end method

.method public final setAndroidIdData(Ljava/lang/String;)V
    .locals 4

    .line 573
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x6b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x3a

    if-eqz v0, :cond_0

    const/16 v0, 0x5b

    goto :goto_0

    :cond_0
    const/16 v0, 0x3a

    :goto_0
    const-string v2, "setAndroidIdData"

    const/4 v3, 0x1

    if-eq v0, v1, :cond_1

    .line 572
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/String;

    aput-object p1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 573
    :goto_1
    iput-object p1, p0, Lcom/appsflyer/internal/ac;->init:Ljava/lang/String;

    return-void
.end method

.method public final setAppId(Ljava/lang/String;)V
    .locals 6

    .line 1132
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x31

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x41

    if-nez v0, :cond_0

    const/16 v0, 0x1d

    goto :goto_0

    :cond_0
    const/16 v0, 0x41

    :goto_0
    const-string v2, "appid"

    const/4 v3, 0x1

    const-string v4, "setAppId"

    const/4 v5, 0x0

    if-eq v0, v1, :cond_1

    .line 1131
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/String;

    aput-object p1, v1, v5

    invoke-virtual {v0, v4, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1132
    :goto_1
    invoke-static {v2, p1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 1131
    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/String;

    aput-object p1, v1, v5

    invoke-virtual {v0, v4, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1

    .line 1132
    :goto_2
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x1f

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/16 v0, 0x40

    if-eqz p1, :cond_2

    const/16 p1, 0x60

    goto :goto_3

    :cond_2
    const/16 p1, 0x40

    :goto_3
    if-eq p1, v0, :cond_3

    const/16 p1, 0x52

    :try_start_0
    div-int/2addr p1, v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1

    :cond_3
    return-void
.end method

.method public final setAppInviteOneLink(Ljava/lang/String;)V
    .locals 7

    .line 705
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x2d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x3e

    if-eqz v0, :cond_0

    const/16 v0, 0x3e

    goto :goto_0

    :cond_0
    const/16 v0, 0x4b

    :goto_0
    const-string v2, "oneLinkSlug"

    const-string v3, "setAppInviteOneLink = "

    const/4 v4, 0x0

    const/4 v5, 0x1

    const-string v6, "setAppInviteOneLink"

    if-eq v0, v1, :cond_2

    .line 698
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v1, v5, [Ljava/lang/String;

    aput-object p1, v1, v4

    invoke-virtual {v0, v6, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 699
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    const/16 v0, 0x5d

    if-eqz p1, :cond_1

    const/16 v1, 0x41

    goto :goto_1

    :cond_1
    const/16 v1, 0x5d

    :goto_1
    if-eq v1, v0, :cond_4

    goto :goto_2

    .line 698
    :cond_2
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v1, v5, [Ljava/lang/String;

    aput-object p1, v1, v4

    invoke-virtual {v0, v6, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 699
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    if-eqz p1, :cond_4

    .line 700
    :goto_2
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/16 v1, 0x37

    if-nez v0, :cond_3

    const/16 v0, 0x37

    goto :goto_3

    :cond_3
    const/16 v0, 0x3f

    :goto_3
    if-eq v0, v1, :cond_4

    goto :goto_4

    .line 701
    :cond_4
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "onelinkDomain"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->remove(Ljava/lang/String;)V

    .line 702
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "onelinkVersion"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->remove(Ljava/lang/String;)V

    .line 703
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "onelinkScheme"

    invoke-virtual {v0, v1}, Lcom/appsflyer/AppsFlyerProperties;->remove(Ljava/lang/String;)V

    .line 705
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x4f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    :goto_4
    invoke-static {v2, p1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final setCollectAndroidID(Z)V
    .locals 8

    .line 817
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x43

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const-string v3, "collectAndroidIdForceByUser"

    const-string v4, "collectAndroidId"

    const-string v5, "setCollectAndroidID"

    if-eqz v0, :cond_1

    .line 815
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v6, v2, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-virtual {v0, v5, v6}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v6, v2, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-virtual {v0, v5, v6}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 816
    :goto_1
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    .line 817
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0xb

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_2

    goto :goto_2

    :cond_2
    const/4 v1, 0x1

    :goto_2
    if-eqz v1, :cond_3

    return-void

    :cond_3
    const/4 p1, 0x0

    :try_start_0
    array-length p1, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1
.end method

.method public final setCollectIMEI(Z)V
    .locals 4

    .line 824
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x6d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 822
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "setCollectIMEI"

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 823
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "collectIMEI"

    invoke-static {v1, v0}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    .line 824
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p1

    const-string v0, "collectIMEIForceByUser"

    invoke-static {v0, p1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x5b

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method public final setCollectOaid(Z)V
    .locals 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 831
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x41

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x39

    if-nez v0, :cond_0

    const/16 v0, 0x24

    goto :goto_0

    :cond_0
    const/16 v0, 0x39

    :goto_0
    const-string v2, "collectOAID"

    const/4 v3, 0x1

    const-string v4, "setCollectOaid"

    const/4 v5, 0x0

    if-eq v0, v1, :cond_1

    .line 830
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v5

    invoke-virtual {v0, v4, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 831
    :goto_1
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 830
    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v5

    invoke-virtual {v0, v4, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1

    .line 831
    :goto_2
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x15

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/16 v0, 0x49

    if-eqz p1, :cond_2

    const/16 p1, 0x3d

    goto :goto_3

    :cond_2
    const/16 p1, 0x49

    :goto_3
    if-eq p1, v0, :cond_3

    const/16 p1, 0x5b

    :try_start_0
    div-int/2addr p1, v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1

    :cond_3
    return-void
.end method

.method public final setCurrencyCode(Ljava/lang/String;)V
    .locals 3

    .line 1150
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x1d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 1149
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "setCurrencyCode"

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1150
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "currencyCode"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x23

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/16 v0, 0x11

    if-eqz p1, :cond_0

    const/16 p1, 0x53

    goto :goto_0

    :cond_0
    const/16 p1, 0x11

    :goto_0
    if-eq p1, v0, :cond_1

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

.method public final setCustomerIdAndLogSession(Ljava/lang/String;Landroid/content/Context;)V
    .locals 8

    if-eqz p2, :cond_6

    .line 664
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x5f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    if-eq v0, v1, :cond_1

    .line 646
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper()Z

    move-result v0

    const/4 v2, 0x0

    :try_start_0
    array-length v2, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_5

    goto :goto_1

    :catchall_0
    move-exception p1

    .line 664
    throw p1

    .line 646
    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 647
    :goto_1
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLib;->setCustomerUserId(Ljava/lang/String;)V

    .line 648
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "CustomerUserId set: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " - Initializing AppsFlyer Tacking"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;Z)V

    .line 649
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/appsflyer/AppsFlyerProperties;->getReferrer(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 650
    sget-object v0, Lcom/appsflyer/internal/ch;->AFKeystoreWrapper:Lcom/appsflyer/internal/ch;

    invoke-direct {p0, p2, v0}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;Lcom/appsflyer/internal/ch;)V

    .line 652
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/AppsFlyerProperties;->getDevKey()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-nez p1, :cond_2

    .line 664
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x17

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    const-string p1, ""

    goto :goto_2

    .line 646
    :cond_2
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x4f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    :goto_2
    move-object v6, p1

    .line 658
    instance-of p1, p2, Landroid/app/Activity;

    const/4 v0, 0x5

    if-eqz p1, :cond_3

    const/16 p1, 0x29

    goto :goto_3

    :cond_3
    const/4 p1, 0x5

    :goto_3
    if-eq p1, v0, :cond_4

    .line 646
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/2addr p1, v0

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    .line 659
    move-object p1, p2

    check-cast p1, Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    :cond_4
    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p2

    .line 651
    invoke-direct/range {v1 .. v7}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 663
    :cond_5
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLib;->setCustomerUserId(Ljava/lang/String;)V

    .line 664
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string/jumbo p2, "waitForCustomerUserId is false; setting CustomerUserID: "

    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;Z)V

    :cond_6
    return-void
.end method

.method public final setCustomerUserId(Ljava/lang/String;)V
    .locals 4

    .line 1117
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x33

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    .line 1113
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v3, "setCustomerUserId"

    invoke-virtual {v0, v3, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1114
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "setCustomerUserId = "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    const-string v0, "AppUserId"

    .line 1115
    invoke-static {v0, p1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo p1, "waitForCustomerId"

    .line 1117
    invoke-static {p1, v2}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Z)V

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x4d

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method public final setDebugLog(Z)V
    .locals 2

    .line 555
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x69

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x3f

    if-nez v0, :cond_0

    const/16 v0, 0x3f

    goto :goto_0

    :cond_0
    const/16 v0, 0x3c

    :goto_0
    if-eq v0, v1, :cond_1

    if-eqz p1, :cond_3

    goto :goto_2

    :cond_1
    const/4 v0, 0x0

    :try_start_0
    invoke-super {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v0, 0x50

    if-eqz p1, :cond_2

    const/16 p1, 0x50

    goto :goto_1

    :cond_2
    const/16 p1, 0x1c

    :goto_1
    if-eq p1, v0, :cond_4

    :cond_3
    sget-object p1, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    goto :goto_3

    :cond_4
    :goto_2
    sget-object p1, Lcom/appsflyer/AFLogger$LogLevel;->DEBUG:Lcom/appsflyer/AFLogger$LogLevel;

    :goto_3
    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLib;->setLogLevel(Lcom/appsflyer/AFLogger$LogLevel;)V

    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x1f

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    return-void

    :catchall_0
    move-exception p1

    throw p1
.end method

.method public final setDisableAdvertisingIdentifiers(Z)V
    .locals 2

    .line 344
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "setDisableAdvertisingIdentifiers: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    const/16 v0, 0x51

    if-nez p1, :cond_0

    const/16 p1, 0x51

    goto :goto_0

    :cond_0
    const/4 p1, 0x6

    :goto_0
    if-eq p1, v0, :cond_1

    const/4 p1, 0x0

    .line 347
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x65

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    goto :goto_1

    :cond_1
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x67

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/4 p1, 0x1

    .line 345
    :goto_1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    sput-object p1, Lcom/appsflyer/internal/ab;->AFInAppEventType:Ljava/lang/Boolean;

    .line 346
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p1

    const-string v0, "advertiserIdEnabled"

    invoke-virtual {p1, v0}, Lcom/appsflyer/AppsFlyerProperties;->remove(Ljava/lang/String;)V

    .line 347
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p1

    const-string v0, "advertiserId"

    invoke-virtual {p1, v0}, Lcom/appsflyer/AppsFlyerProperties;->remove(Ljava/lang/String;)V

    return-void
.end method

.method public final setExtension(Ljava/lang/String;)V
    .locals 5

    .line 1138
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x57

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const-string v3, "sdkExtension"

    const-string v4, "setExtension"

    if-eq v0, v2, :cond_1

    .line 1137
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v2, v2, [Ljava/lang/String;

    aput-object p1, v2, v1

    invoke-virtual {v0, v4, v2}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1138
    :goto_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, v3, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 1137
    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v2, v2, [Ljava/lang/String;

    aput-object p1, v2, v1

    invoke-virtual {v0, v4, v2}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1

    :goto_2
    return-void
.end method

.method public final setHost(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 3157
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x2b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v0, 0x57

    if-eqz p1, :cond_0

    const/16 v1, 0x57

    goto :goto_0

    :cond_0
    const/16 v1, 0x30

    :goto_0
    if-eq v1, v0, :cond_1

    goto :goto_1

    :cond_1
    const-string v0, "custom_host_prefix"

    .line 3152
    invoke-static {v0, p1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    if-eqz p2, :cond_2

    const/4 p1, 0x0

    goto :goto_2

    :cond_2
    const/4 p1, 0x1

    :goto_2
    if-eqz p1, :cond_3

    goto :goto_3

    .line 3157
    :cond_3
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x3

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    .line 3154
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_4

    const-string p1, "custom_host"

    .line 3155
    invoke-static {p1, p2}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_4
    :goto_3
    const-string p1, "hostName cannot be null or empty"

    .line 3157
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    return-void
.end method

.method public final setImeiData(Ljava/lang/String;)V
    .locals 5

    .line 561
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x6b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 560
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "setImeiData"

    invoke-virtual {v0, v4, v2}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 561
    iput-object p1, p0, Lcom/appsflyer/internal/ac;->AppsFlyer2dXConversionCallback:Ljava/lang/String;

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x27

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_0

    const/4 v1, 0x0

    :cond_0
    if-eqz v1, :cond_1

    return-void

    :cond_1
    const/4 p1, 0x0

    :try_start_0
    invoke-super {p1}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1
.end method

.method public final setIsUpdate(Z)V
    .locals 4

    .line 1144
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x4d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 1143
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "setIsUpdate"

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1144
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    const-string v1, "IS_UPDATE"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Z)V

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x3

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/16 v0, 0x17

    if-eqz p1, :cond_0

    const/16 p1, 0x17

    goto :goto_0

    :cond_0
    const/16 p1, 0xb

    :goto_0
    if-eq p1, v0, :cond_1

    return-void

    :cond_1
    const/16 p1, 0x55

    :try_start_0
    div-int/2addr p1, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1
.end method

.method public final setLogLevel(Lcom/appsflyer/AFLogger$LogLevel;)V
    .locals 5

    .line 50192
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x17

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x3d

    if-nez v0, :cond_0

    const/16 v0, 0x23

    goto :goto_0

    :cond_0
    const/16 v0, 0x3d

    :goto_0
    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v1, :cond_2

    .line 3144
    invoke-virtual {p1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v0

    sget-object v1, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-virtual {v1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v1

    const/4 v4, 0x0

    :try_start_0
    array-length v4, v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-le v0, v1, :cond_1

    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    const/4 v0, 0x1

    :goto_1
    if-eq v0, v3, :cond_4

    goto :goto_3

    :catchall_0
    move-exception p1

    .line 50192
    throw p1

    .line 3144
    :cond_2
    invoke-virtual {p1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v0

    sget-object v1, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-virtual {v1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v1

    const/16 v4, 0x5f

    if-le v0, v1, :cond_3

    const/16 v0, 0x3b

    goto :goto_2

    :cond_3
    const/16 v0, 0x5f

    :goto_2
    if-eq v0, v4, :cond_4

    :goto_3
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x1d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v0, 0x1

    goto :goto_4

    :cond_4
    const/4 v0, 0x0

    .line 3145
    :goto_4
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v1

    new-array v3, v3, [Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v2

    const-string v0, "log"

    invoke-virtual {v1, v0, v3}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 3146
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    .line 50192
    invoke-virtual {p1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result p1

    const-string v1, "logLevel"

    invoke-virtual {v0, v1, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;I)V

    return-void
.end method

.method public final setMinTimeBetweenSessions(I)V
    .locals 5

    .line 3183
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x13

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    if-eq v0, v2, :cond_1

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v3, p1

    invoke-virtual {v0, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/appsflyer/internal/ac;->onConversionDataSuccess:J

    const/16 p1, 0x58

    :try_start_0
    div-int/2addr p1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    throw p1

    :cond_1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v3, p1

    invoke-virtual {v0, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/appsflyer/internal/ac;->onConversionDataSuccess:J

    :goto_1
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x53

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_2

    const/4 v1, 0x1

    :cond_2
    if-eqz v1, :cond_3

    const/4 p1, 0x0

    :try_start_1
    array-length p1, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception p1

    throw p1

    :cond_3
    return-void
.end method

.method public final setOaidData(Ljava/lang/String;)V
    .locals 4

    .line 567
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0xb

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x5d

    if-nez v0, :cond_0

    const/16 v0, 0x51

    goto :goto_0

    :cond_0
    const/16 v0, 0x5d

    :goto_0
    const-string v2, "setOaidData"

    const/4 v3, 0x1

    if-eq v0, v1, :cond_1

    .line 566
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/String;

    aput-object p1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 567
    :goto_1
    sput-object p1, Lcom/appsflyer/internal/ab;->AFInAppEventParameterName:Ljava/lang/String;

    goto :goto_2

    .line 566
    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    new-array v1, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_1

    :goto_2
    return-void
.end method

.method public final varargs setOneLinkCustomDomain([Ljava/lang/String;)V
    .locals 3

    .line 843
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x5

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 842
    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const-string v1, "setOneLinkCustomDomain %s"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 843
    sput-object p1, Lcom/appsflyer/internal/f;->AFLogger$LogLevel:[Ljava/lang/String;

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x59

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method public final setOutOfStore(Ljava/lang/String;)V
    .locals 5

    if-eqz p1, :cond_3

    .line 692
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x47

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const-string v3, "Store API set with value: "

    const-string v4, "api_store_value"

    .line 688
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    .line 689
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0, v4, p1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 690
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v2}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;Z)V

    .line 692
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x67

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/16 v0, 0x4c

    if-eqz p1, :cond_1

    const/16 p1, 0x2e

    goto :goto_1

    :cond_1
    const/16 p1, 0x4c

    :goto_1
    if-eq p1, v0, :cond_2

    const/16 p1, 0x3c

    :try_start_0
    div-int/2addr p1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1

    :cond_2
    return-void

    :cond_3
    const-string p1, "Cannot set setOutOfStore with null"

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;)V

    return-void
.end method

.method public final setPartnerData(Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 338
    iget-object v0, p0, Lcom/appsflyer/internal/ac;->setImeiData:Lcom/appsflyer/internal/az;

    if-nez v0, :cond_0

    new-instance v0, Lcom/appsflyer/internal/az;

    invoke-direct {v0}, Lcom/appsflyer/internal/az;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/ac;->setImeiData:Lcom/appsflyer/internal/az;

    .line 339
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/ac;->setImeiData:Lcom/appsflyer/internal/az;

    if-eqz p1, :cond_8

    .line 7019
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    :goto_0
    if-eqz v1, :cond_8

    const/16 v1, 0x4a

    if-eqz p2, :cond_2

    const/16 v3, 0x49

    goto :goto_1

    :cond_2
    const/16 v3, 0x4a

    :goto_1
    if-eq v3, v1, :cond_5

    .line 7023
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_2

    .line 7029
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Setting partner data for "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 7030
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x3e8

    if-le v1, v2, :cond_4

    const-string p2, "Partner data 1000 characters limit exceeded"

    .line 7032
    invoke-static {p2}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    .line 7033
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 7034
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "limit exceeded: "

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "error"

    invoke-interface {p2, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7035
    iget-object v0, v0, Lcom/appsflyer/internal/az;->valueOf:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 7037
    :cond_4
    iget-object v1, v0, Lcom/appsflyer/internal/az;->values:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7038
    iget-object p2, v0, Lcom/appsflyer/internal/az;->valueOf:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 7024
    :cond_5
    :goto_2
    iget-object p2, v0, Lcom/appsflyer/internal/az;->values:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    const/16 v0, 0xc

    if-nez p2, :cond_6

    const/16 v2, 0xc

    :cond_6
    if-eq v2, v0, :cond_7

    .line 7026
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "Cleared partner data for "

    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 7038
    sget p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p2, p2, 0x23

    rem-int/lit16 v0, p2, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p2, p2, 0x2

    goto :goto_3

    :cond_7
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x5

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const-string p1, "Partner data is missing or `null`"

    .line 7024
    :goto_3
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    return-void

    :cond_8
    const-string p1, "Partner ID is missing or `null`"

    .line 7020
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    return-void
.end method

.method public final setPhoneNumber(Ljava/lang/String;)V
    .locals 2

    .line 1122
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x6b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {p1}, Lcom/appsflyer/internal/ag;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/appsflyer/internal/ac;->onPause:Ljava/lang/String;

    if-eqz v0, :cond_1

    const/4 p1, 0x0

    :try_start_0
    invoke-super {p1}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    throw p1

    :cond_1
    :goto_1
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x6b

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method public final setPreinstallAttribution(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    const-string v0, "setPreinstallAttribution API called"

    .line 2563
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 2564
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const/16 v1, 0x42

    if-eqz p1, :cond_0

    const/4 v2, 0x3

    goto :goto_0

    :cond_0
    const/16 v2, 0x42

    :goto_0
    const/4 v3, 0x0

    const-string v4, "pid"

    if-eq v2, v1, :cond_3

    .line 2570
    sget v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v1, 0x17

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v2, 0x7

    if-eqz v1, :cond_1

    const/4 v1, 0x7

    goto :goto_1

    :cond_1
    const/16 v1, 0x45

    :goto_1
    if-eq v1, v2, :cond_2

    .line 2567
    :try_start_0
    invoke-virtual {v0, v4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_2

    :cond_2
    invoke-virtual {v0, v4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    array-length p1, v3
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p1

    .line 2570
    throw p1

    :cond_3
    :goto_2
    if-eqz p2, :cond_5

    .line 2573
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x49

    rem-int/lit16 v1, p1, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    const-string v1, "c"

    if-nez p1, :cond_4

    .line 2570
    :try_start_2
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    :try_start_3
    array-length p1, v3
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception p1

    .line 2573
    throw p1

    .line 2570
    :cond_4
    :try_start_4
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    goto :goto_4

    :cond_5
    :goto_3
    if-eqz p3, :cond_7

    .line 2583
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x47

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const-string p2, "af_siteid"

    if-eqz p1, :cond_6

    .line 2573
    :try_start_5
    invoke-virtual {v0, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    :try_start_6
    array-length p1, v3
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_5

    :catchall_2
    move-exception p1

    .line 2583
    throw p1

    .line 2573
    :cond_6
    :try_start_7
    invoke-virtual {v0, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_0

    goto :goto_5

    .line 2577
    :goto_4
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 2580
    :cond_7
    :goto_5
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_8

    const/4 p1, 0x1

    goto :goto_6

    :cond_8
    const/4 p1, 0x0

    :goto_6
    if-eq p1, p2, :cond_9

    const-string p1, "Cannot set preinstall attribution data without a media source"

    .line 2583
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    return-void

    .line 2567
    :cond_9
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x19

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    .line 2581
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "preInstallName"

    invoke-static {p2, p1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final varargs setResolveDeepLinkURLs([Ljava/lang/String;)V
    .locals 3

    .line 837
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x37

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 836
    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const-string v1, "setResolveDeepLinkURLs %s"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 837
    sput-object p1, Lcom/appsflyer/internal/f;->AFKeystoreWrapper:[Ljava/lang/String;

    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x21

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method public final varargs setSharingFilter([Ljava/lang/String;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 268
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x1

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, p1}, Lcom/appsflyer/AppsFlyerLib;->setSharingFilterForPartners([Ljava/lang/String;)V

    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x2f

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method public final setSharingFilterForAllPartners()V
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 274
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x6b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x39

    const/16 v2, 0x20

    if-eqz v0, :cond_0

    const/16 v0, 0x39

    goto :goto_0

    :cond_0
    const/16 v0, 0x20

    :goto_0
    const-string v3, "all"

    const/4 v4, 0x0

    if-eq v0, v1, :cond_1

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/appsflyer/AppsFlyerLib;->setSharingFilterForPartners([Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    new-array v0, v4, [Ljava/lang/String;

    aput-object v3, v0, v4

    invoke-virtual {p0, v0}, Lcom/appsflyer/AppsFlyerLib;->setSharingFilterForPartners([Ljava/lang/String;)V

    :goto_1
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x5

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    if-nez v0, :cond_2

    const/4 v0, 0x0

    goto :goto_2

    :cond_2
    const/4 v0, 0x1

    :goto_2
    if-eq v0, v1, :cond_3

    :try_start_0
    div-int/2addr v2, v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    throw v0

    :cond_3
    return-void
.end method

.method public final varargs setSharingFilterForPartners([Ljava/lang/String;)V
    .locals 1

    .line 279
    new-instance v0, Lcom/appsflyer/internal/y;

    invoke-direct {v0, p1}, Lcom/appsflyer/internal/y;-><init>([Ljava/lang/String;)V

    iput-object v0, p0, Lcom/appsflyer/internal/ac;->getLevel:Lcom/appsflyer/internal/y;

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x3

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method public final varargs setUserEmails(Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;[Ljava/lang/String;)V
    .locals 10

    .line 784
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p2

    const/4 v2, 0x1

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 785
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 786
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 787
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v1

    array-length v3, p2

    add-int/2addr v3, v2

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    const-string v3, "setUserEmails"

    invoke-virtual {v1, v3, v0}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 789
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {p1}, Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;->getValue()I

    move-result v1

    const-string/jumbo v3, "userEmailsCryptType"

    invoke-virtual {v0, v3, v1}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;I)V

    .line 790
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x0

    .line 792
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 794
    array-length v4, p2

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v4, :cond_0

    const/4 v7, 0x0

    goto :goto_1

    :cond_0
    const/4 v7, 0x1

    :goto_1
    if-eqz v7, :cond_1

    .line 808
    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 809
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1, v0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 810
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p2

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/appsflyer/AppsFlyerProperties;->setUserEmails(Ljava/lang/String;)V

    return-void

    :cond_1
    sget v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v1, 0x39

    rem-int/lit16 v7, v1, 0x80

    sput v7, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    const/4 v7, 0x2

    rem-int/2addr v1, v7

    .line 794
    aget-object v1, p2, v6

    .line 795
    sget-object v8, Lcom/appsflyer/internal/ac$9;->values:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    aget v8, v8, v9

    if-eq v8, v7, :cond_2

    .line 799
    invoke-static {v1}, Lcom/appsflyer/internal/ag;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    const-string v1, "sha256_el_arr"

    goto :goto_2

    .line 803
    :cond_2
    invoke-virtual {v3, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    const-string v1, "plain_el_arr"

    :goto_2
    add-int/lit8 v6, v6, 0x1

    .line 810
    sget v8, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v8, v8, 0x55

    rem-int/lit16 v9, v8, 0x80

    sput v9, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr v8, v7

    goto :goto_0
.end method

.method public final varargs setUserEmails([Ljava/lang/String;)V
    .locals 3

    .line 779
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x23

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x5b

    if-eqz v0, :cond_0

    const/16 v0, 0x42

    goto :goto_0

    :cond_0
    const/16 v0, 0x5b

    :goto_0
    const-string v2, "setUserEmails"

    if-eq v0, v1, :cond_1

    .line 778
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    invoke-virtual {v0, v2, p1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 779
    sget-object v0, Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;->NONE:Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;

    invoke-virtual {p0, v0, p1}, Lcom/appsflyer/AppsFlyerLib;->setUserEmails(Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;[Ljava/lang/String;)V

    const/16 p1, 0x37

    :try_start_0
    div-int/lit8 p1, p1, 0x0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    throw p1

    .line 778
    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    invoke-virtual {v0, v2, p1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 779
    sget-object v0, Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;->NONE:Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;

    invoke-virtual {p0, v0, p1}, Lcom/appsflyer/AppsFlyerLib;->setUserEmails(Lcom/appsflyer/AppsFlyerProperties$EmailsCryptType;[Ljava/lang/String;)V

    :goto_1
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x4d

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    goto :goto_2

    :cond_2
    const/16 p1, 0x32

    :goto_2
    if-eq p1, v0, :cond_3

    return-void

    :cond_3
    const/4 p1, 0x0

    :try_start_1
    invoke-super {p1}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception p1

    throw p1
.end method

.method public final start(Landroid/content/Context;)V
    .locals 3

    .line 964
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x75

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x50

    if-nez v0, :cond_0

    const/16 v0, 0x50

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    const/4 v2, 0x0

    invoke-virtual {p0, p1, v2}, Lcom/appsflyer/AppsFlyerLib;->start(Landroid/content/Context;Ljava/lang/String;)V

    if-eq v0, v1, :cond_1

    goto :goto_1

    :cond_1
    :try_start_0
    invoke-super {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :goto_1
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x23

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/16 v0, 0x17

    if-eqz p1, :cond_2

    const/16 p1, 0x4e

    goto :goto_2

    :cond_2
    const/16 p1, 0x17

    :goto_2
    if-eq p1, v0, :cond_3

    :try_start_1
    invoke-super {v2}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1

    :cond_3
    return-void

    :catchall_1
    move-exception p1

    throw p1
.end method

.method public final start(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4

    .line 969
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x4b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const/4 v3, 0x0

    invoke-virtual {p0, p1, p2, v3}, Lcom/appsflyer/AppsFlyerLib;->start(Landroid/content/Context;Ljava/lang/String;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V

    if-eq v0, v2, :cond_1

    const/16 p1, 0x5f

    :try_start_0
    div-int/2addr p1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    throw p1

    :cond_1
    :goto_1
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x4f

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method public final start(Landroid/content/Context;Ljava/lang/String;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V
    .locals 7

    .line 975
    sget-object v0, Lcom/appsflyer/internal/ah;->AFInAppEventParameterName:Lcom/appsflyer/internal/ah$e;

    if-eqz v0, :cond_0

    return-void

    .line 976
    :cond_0
    iget-boolean v0, p0, Lcom/appsflyer/internal/ac;->AppsFlyerInAppPurchaseValidatorListener:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eq v0, v2, :cond_2

    goto :goto_2

    :cond_2
    const-string v0, "ERROR: AppsFlyer SDK is not initialized! The API call \'start()\' must be called after the \'init(String, AppsFlyerConversionListener)\' API method, which should be called on the Application\'s onCreate."

    .line 977
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    if-nez p2, :cond_3

    const/4 v0, 0x1

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_5

    if-eqz p3, :cond_4

    .line 983
    sget p1, Lcom/appsflyer/attribution/RequestError;->NO_DEV_KEY:I

    sget-object p2, Lcom/appsflyer/internal/ba;->AFInAppEventParameterName:Ljava/lang/String;

    invoke-interface {p3, p1, p2}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    :cond_4
    return-void

    .line 988
    :cond_5
    :goto_2
    iget-object v0, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    const/4 v3, 0x2

    if-eqz p1, :cond_6

    .line 14062
    iget-object v0, v0, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    if-eqz p1, :cond_6

    .line 1021
    sget v4, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v4, v4, 0x7d

    rem-int/lit16 v5, v4, 0x80

    sput v5, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr v4, v3

    .line 15018
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    iput-object v4, v0, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 989
    :cond_6
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/bg;->getLevel()Lcom/appsflyer/internal/cl;

    move-result-object v0

    .line 990
    invoke-static {p1}, Lcom/appsflyer/internal/n;->AFInAppEventParameterName(Landroid/content/Context;)Lcom/appsflyer/internal/cj;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/appsflyer/internal/cl;->valueOf(Lcom/appsflyer/internal/cj;)V

    .line 991
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Landroid/app/Application;

    iput-object v4, p0, Lcom/appsflyer/internal/ac;->stop:Landroid/app/Application;

    .line 992
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v4

    new-array v5, v2, [Ljava/lang/String;

    aput-object p2, v5, v1

    const-string/jumbo v6, "start"

    invoke-virtual {v4, v6, v5}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    new-array v4, v3, [Ljava/lang/Object;

    const-string v5, "6.5.4"

    aput-object v5, v4, v1

    .line 993
    sget-object v5, Lcom/appsflyer/internal/ac;->valueOf:Ljava/lang/String;

    aput-object v5, v4, v2

    const-string v6, "Starting AppsFlyer: (v%s.%s)"

    invoke-static {v6, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 994
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "Build Number: "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 995
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    iget-object v5, p0, Lcom/appsflyer/internal/ac;->stop:Landroid/app/Application;

    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/appsflyer/AppsFlyerProperties;->loadProperties(Landroid/content/Context;)V

    .line 996
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_7

    .line 997
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/appsflyer/AppsFlyerProperties;->setDevKey(Ljava/lang/String;)V

    .line 998
    invoke-static {p2}, Lcom/appsflyer/internal/ai;->AFInAppEventType(Ljava/lang/String;)V

    goto :goto_4

    .line 1000
    :cond_7
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    invoke-virtual {v4}, Lcom/appsflyer/AppsFlyerProperties;->getDevKey()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 1021
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x21

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/2addr p1, v3

    const-string p1, "ERROR: AppsFlyer SDK is not initialized! You must provide AppsFlyer Dev-Key either in the \'init\' API method (should be called on Application\'s onCreate),or in the start() API (should be called on Activity\'s onCreate)."

    .line 1001
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    if-eqz p3, :cond_8

    const/4 v1, 0x1

    :cond_8
    if-eq v1, v2, :cond_9

    goto :goto_3

    .line 1021
    :cond_9
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x23

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr p1, v3

    if-nez p1, :cond_a

    .line 1005
    sget p1, Lcom/appsflyer/attribution/RequestError;->NO_DEV_KEY:I

    sget-object p2, Lcom/appsflyer/internal/ba;->AFInAppEventParameterName:Ljava/lang/String;

    invoke-interface {p3, p1, p2}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    :try_start_0
    invoke-super {v5}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception p1

    .line 1021
    throw p1

    .line 1005
    :cond_a
    sget p1, Lcom/appsflyer/attribution/RequestError;->NO_DEV_KEY:I

    sget-object p2, Lcom/appsflyer/internal/ba;->AFInAppEventParameterName:Ljava/lang/String;

    invoke-interface {p3, p1, p2}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    :goto_3
    return-void

    .line 1011
    :cond_b
    :goto_4
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v2

    invoke-interface {v2}, Lcom/appsflyer/internal/bg;->values()Lcom/appsflyer/internal/by;

    move-result-object v2

    invoke-virtual {v2, v5}, Lcom/appsflyer/internal/by;->values(Lcom/appsflyer/internal/bv;)V

    .line 1015
    iget-object v2, p0, Lcom/appsflyer/internal/ac;->stop:Landroid/app/Application;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/appsflyer/internal/ac;->AppsFlyer2dXConversionCallback(Landroid/content/Context;)V

    .line 1017
    iget-boolean v2, p0, Lcom/appsflyer/internal/ac;->setDebugLog:Z

    if-eqz v2, :cond_c

    .line 1018
    iget-object v2, p0, Lcom/appsflyer/internal/ac;->stop:Landroid/app/Application;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;)V

    .line 1021
    :cond_c
    new-instance v2, Lcom/appsflyer/internal/ac$5;

    invoke-direct {v2, p0, v0, p2, p3}, Lcom/appsflyer/internal/ac$5;-><init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/cl;Ljava/lang/String;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V

    iget-object p2, p0, Lcom/appsflyer/internal/ac;->setOaidData:Ljava/util/concurrent/Executor;

    invoke-static {p1, v2, p2}, Lcom/appsflyer/internal/ah;->AFKeystoreWrapper(Landroid/content/Context;Lcom/appsflyer/internal/ah$e;Ljava/util/concurrent/Executor;)V

    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x73

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/2addr p1, v3

    const/16 p2, 0x46

    if-nez p1, :cond_d

    const/16 p1, 0x46

    goto :goto_5

    :cond_d
    const/16 p1, 0x16

    :goto_5
    if-eq p1, p2, :cond_e

    return-void

    :cond_e
    const/4 p1, 0x6

    :try_start_1
    div-int/2addr p1, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-void

    :catchall_1
    move-exception p1

    throw p1
.end method

.method public final stop(ZLandroid/content/Context;)V
    .locals 5

    .line 528
    iput-boolean p1, p0, Lcom/appsflyer/internal/ac;->getInstance:Z

    .line 529
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object p1

    invoke-interface {p1}, Lcom/appsflyer/internal/bg;->AFVersionDeclaration()Lcom/appsflyer/internal/l;

    move-result-object p1

    .line 8044
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 9040
    iget-object p1, p1, Lcom/appsflyer/internal/l;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    .line 10024
    iget-object p1, p1, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 8044
    invoke-virtual {p1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p1

    const-string v1, "AFRequestCache"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 7200
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    if-eq p1, v2, :cond_3

    .line 531
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x7

    rem-int/lit16 v2, p1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    const/16 v2, 0x4e

    if-nez p1, :cond_1

    const/16 p1, 0x21

    goto :goto_1

    :cond_1
    const/16 p1, 0x4e

    :goto_1
    if-eq p1, v2, :cond_2

    .line 7201
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/16 p1, 0x24

    :try_start_2
    div-int/2addr p1, v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_3

    :catchall_0
    move-exception p1

    .line 531
    throw p1

    .line 7201
    :cond_2
    :try_start_3
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    goto :goto_3

    .line 7205
    :cond_3
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p1

    if-nez p1, :cond_4

    goto :goto_3

    .line 7209
    :cond_4
    array-length v0, p1

    :goto_2
    if-ge v1, v0, :cond_5

    aget-object v2, p1, v1

    .line 7210
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "CACHE: Found cached request"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 7211
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "CACHE: Deleting "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " from cache"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 7212
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    add-int/lit8 v1, v1, 0x1

    .line 7201
    sget v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v2, v2, 0x17

    rem-int/lit16 v3, v2, 0x80

    sput v3, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v2, v2, 0x2

    goto :goto_2

    :catch_0
    move-exception p1

    const-string v0, "CACHE: Could not cache request"

    .line 7215
    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 530
    :cond_5
    :goto_3
    iget-boolean p1, p0, Lcom/appsflyer/internal/ac;->getInstance:Z

    if-eqz p1, :cond_6

    .line 7201
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x15

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    const-string p1, "is_stop_tracking_used"

    .line 531
    invoke-static {p2, p1}, Lcom/appsflyer/internal/ac;->values(Landroid/content/Context;Ljava/lang/String;)V

    .line 7201
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x45

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    :cond_6
    return-void
.end method

.method public final subscribeForDeepLink(Lcom/appsflyer/deeplink/DeepLinkListener;)V
    .locals 5

    .line 291
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x3d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const-wide/16 v3, 0x3

    if-eq v0, v2, :cond_1

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    invoke-virtual {p0, p1, v2, v3}, Lcom/appsflyer/AppsFlyerLib;->subscribeForDeepLink(Lcom/appsflyer/deeplink/DeepLinkListener;J)V

    const/16 p1, 0x58

    :try_start_0
    div-int/2addr p1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p1

    throw p1

    :cond_1
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    invoke-virtual {p0, p1, v0, v1}, Lcom/appsflyer/AppsFlyerLib;->subscribeForDeepLink(Lcom/appsflyer/deeplink/DeepLinkListener;J)V

    :goto_1
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x5b

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method

.method public final subscribeForDeepLink(Lcom/appsflyer/deeplink/DeepLinkListener;J)V
    .locals 4

    .line 297
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x11

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 v3, 0x0

    if-eq v0, v2, :cond_1

    .line 296
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    move-result-object v0

    iput-object p1, v0, Lcom/appsflyer/internal/f;->values:Lcom/appsflyer/deeplink/DeepLinkListener;

    .line 297
    sput-wide p2, Lcom/appsflyer/internal/ar;->onInstallConversionDataLoadedNative:J

    goto :goto_1

    .line 296
    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    move-result-object v0

    iput-object p1, v0, Lcom/appsflyer/internal/f;->values:Lcom/appsflyer/deeplink/DeepLinkListener;

    .line 297
    sput-wide p2, Lcom/appsflyer/internal/ar;->onInstallConversionDataLoadedNative:J

    :try_start_0
    invoke-super {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :goto_1
    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x15

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_2

    const/4 v1, 0x1

    :cond_2
    if-eqz v1, :cond_3

    :try_start_1
    array-length p1, v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1

    :cond_3
    return-void

    :catchall_1
    move-exception p1

    throw p1
.end method

.method public final unregisterConversionListener()V
    .locals 3

    .line 1410
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x69

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 1409
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    const-string/jumbo v2, "unregisterConversionListener"

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 1410
    sput-object v0, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener;

    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x6f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    return-void
.end method

.method public final updateServerUninstallToken(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 550
    new-instance v0, Lcom/appsflyer/internal/cd;

    invoke-direct {v0, p1}, Lcom/appsflyer/internal/cd;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p2}, Lcom/appsflyer/internal/cd;->AFInAppEventParameterName(Ljava/lang/String;)V

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x1b

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    const/16 p2, 0x8

    if-eqz p1, :cond_0

    const/16 p1, 0x29

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

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

.method public final validateAndLogInAppPurchase(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    move-object v0, p1

    move-object v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    .line 2993
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v1

    const/4 v2, 0x6

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    const/4 v3, 0x1

    aput-object p3, v2, v3

    const/4 v3, 0x2

    aput-object v5, v2, v3

    const/4 v3, 0x3

    aput-object v6, v2, v3

    const/4 v3, 0x4

    aput-object v7, v2, v3

    if-nez p7, :cond_0

    const-string v3, ""

    goto :goto_0

    :cond_0
    invoke-virtual/range {p7 .. p7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_0
    const/4 v4, 0x5

    aput-object v3, v2, v4

    const-string/jumbo v3, "validateAndTrackInAppPurchase"

    invoke-virtual {v1, v3, v2}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper(Ljava/lang/String;[Ljava/lang/String;)V

    .line 2995
    invoke-virtual {p0}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v1

    if-nez v1, :cond_1

    .line 2996
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Validate in app called with parameters: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    :cond_1
    if-eqz p2, :cond_4

    if-eqz v6, :cond_4

    if-eqz p3, :cond_4

    if-eqz v7, :cond_4

    if-nez v5, :cond_2

    goto :goto_1

    .line 3003
    :cond_2
    new-instance v9, Ljava/lang/Thread;

    new-instance v10, Lcom/appsflyer/internal/ad;

    .line 3004
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 3005
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v2

    invoke-virtual {v2}, Lcom/appsflyer/AppsFlyerProperties;->getDevKey()Ljava/lang/String;

    move-result-object v2

    .line 3012
    instance-of v3, v0, Landroid/app/Activity;

    if-eqz v3, :cond_3

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    :cond_3
    move-object v0, v10

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lcom/appsflyer/internal/ad;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-direct {v9, v10}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v9}, Ljava/lang/Thread;->start()V

    goto :goto_2

    .line 2999
    :cond_4
    :goto_1
    sget-object v0, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName:Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;

    if-eqz v0, :cond_5

    const-string v1, "Please provide purchase parameters"

    .line 3000
    invoke-interface {v0, v1}, Lcom/appsflyer/AppsFlyerInAppPurchaseValidatorListener;->onValidateInAppFailure(Ljava/lang/String;)V

    :cond_5
    :goto_2
    return-void
.end method

.method public final valueOf(Landroid/content/SharedPreferences;Z)I
    .locals 2

    .line 2812
    sget v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v0, v0, 0x3

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v0, v0, 0x2

    const-string v0, "appsFlyerCount"

    invoke-static {p1, v0, p2}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Ljava/lang/String;Z)I

    move-result p1

    sget p2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p2, p2, 0x77

    rem-int/lit16 v0, p2, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p2, p2, 0x2

    const/16 v0, 0x32

    if-nez p2, :cond_0

    const/16 p2, 0x41

    goto :goto_0

    :cond_0
    const/16 p2, 0x32

    :goto_0
    if-eq p2, v0, :cond_1

    const/16 p2, 0x54

    :try_start_0
    div-int/lit8 p2, p2, 0x0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return p1

    :catchall_0
    move-exception p1

    throw p1

    :cond_1
    return p1
.end method

.method public final valueOf(Landroid/content/Context;Ljava/lang/String;)V
    .locals 12

    const-string v0, "extraReferrers"

    .line 479
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "received a new (extra) referrer: "

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 483
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 485
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const/4 v4, 0x0

    .line 486
    invoke-interface {v3, v0, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    .line 488
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 489
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    goto :goto_1

    .line 491
    :cond_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 492
    invoke-virtual {v5, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 493
    new-instance v3, Lorg/json/JSONArray;

    invoke-virtual {v5, p2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {v3, v6}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    goto :goto_0

    .line 495
    :cond_1
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    :goto_0
    move-object v11, v5

    move-object v5, v3

    move-object v3, v11

    .line 498
    :goto_1
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    int-to-long v6, v6

    const-wide/16 v8, 0x5

    cmp-long v10, v6, v8

    if-gez v10, :cond_2

    .line 499
    invoke-virtual {v5, v1, v2}, Lorg/json/JSONArray;->put(J)Lorg/json/JSONArray;

    .line 503
    :cond_2
    invoke-virtual {v3}, Lorg/json/JSONObject;->length()I

    move-result v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    int-to-long v1, v1

    const-wide/16 v6, 0x4

    const/4 v8, 0x0

    cmp-long v9, v1, v6

    if-ltz v9, :cond_3

    const/4 v1, 0x0

    goto :goto_2

    :cond_3
    const/4 v1, 0x1

    :goto_2
    if-eqz v1, :cond_4

    goto :goto_4

    .line 514
    :cond_4
    sget v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v1, v1, 0x3d

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    const/16 v2, 0x55

    if-nez v1, :cond_5

    const/16 v1, 0x55

    goto :goto_3

    :cond_5
    const/16 v1, 0x60

    :goto_3
    if-eq v1, v2, :cond_6

    .line 504
    :try_start_1
    invoke-static {v3}, Lcom/appsflyer/internal/ac;->valueOf(Lorg/json/JSONObject;)V

    goto :goto_4

    :cond_6
    invoke-static {v3}, Lcom/appsflyer/internal/ac;->valueOf(Lorg/json/JSONObject;)V

    array-length v1, v4

    .line 507
    :goto_4
    invoke-virtual {v5}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, p2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 510
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 514
    sget p1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 p1, p1, 0x69

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 p1, p1, 0x2

    const/16 p2, 0xa

    if-nez p1, :cond_7

    const/16 p1, 0x18

    goto :goto_5

    :cond_7
    const/16 p1, 0xa

    :goto_5
    if-eq p1, p2, :cond_8

    const/16 p1, 0x2f

    :try_start_2
    div-int/2addr p1, v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    throw p1

    :cond_8
    return-void

    :catchall_1
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Couldn\'t save referrer - "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ": "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :catch_0
    return-void
.end method

.method public final valueOf()[Lcom/appsflyer/internal/dd;
    .locals 3

    .line 3189
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v0, v0, 0x2d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0x1a

    if-eqz v0, :cond_0

    const/16 v0, 0x1a

    goto :goto_0

    :cond_0
    const/16 v0, 0x32

    :goto_0
    if-eq v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/bg;->AFLogger$LogLevel()Lcom/appsflyer/internal/de;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/internal/de;->AFInAppEventType()[Lcom/appsflyer/internal/dd;

    move-result-object v0

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/bg;->AFLogger$LogLevel()Lcom/appsflyer/internal/de;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/internal/de;->AFInAppEventType()[Lcom/appsflyer/internal/dd;

    move-result-object v0

    const/4 v1, 0x0

    :try_start_0
    array-length v1, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    sget v1, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    add-int/lit8 v1, v1, 0x1b

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    rem-int/lit8 v1, v1, 0x2

    return-object v0

    :catchall_0
    move-exception v0

    throw v0
.end method

.method public final values()Lcom/appsflyer/internal/bg;
    .locals 3

    .line 232
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 v1, v0, 0xb

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v1, v1, 0x2

    iget-object v1, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    add-int/lit8 v0, v0, 0xf

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    return-object v1
.end method

.method public final values(Landroid/content/Context;)Lcom/appsflyer/internal/bv;
    .locals 1

    .line 2807
    iget-object v0, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    if-eqz p1, :cond_0

    .line 50135
    iget-object v0, v0, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    if-eqz p1, :cond_0

    .line 50139
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, v0, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 2808
    :cond_0
    iget-object p1, p0, Lcom/appsflyer/internal/ac;->setCustomerUserId:Lcom/appsflyer/internal/bf;

    .line 50142
    new-instance v0, Lcom/appsflyer/internal/bc;

    .line 50143
    iget-object p1, p1, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    .line 50148
    iget-object p1, p1, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    if-eqz p1, :cond_1

    .line 50142
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/appsflyer/internal/bc;-><init>(Landroid/content/SharedPreferences;)V

    return-object v0

    .line 50145
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Context must be set via setContext method before calling this dependency."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final waitForCustomerUserId(Z)V
    .locals 3

    .line 640
    sget v0, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 v0, v0, 0x2

    .line 639
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    const-string v2, "initAfterCustomerUserID: "

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;Z)V

    const-string/jumbo v0, "waitForCustomerId"

    .line 640
    invoke-static {v0, p1}, Lcom/appsflyer/internal/ac;->values(Ljava/lang/String;Z)V

    sget p1, Lcom/appsflyer/internal/ac;->setCustomerIdAndLogSession:I

    add-int/lit8 p1, p1, 0x77

    rem-int/lit16 v0, p1, 0x80

    sput v0, Lcom/appsflyer/internal/ac;->waitForCustomerUserId:I

    rem-int/lit8 p1, p1, 0x2

    return-void
.end method
