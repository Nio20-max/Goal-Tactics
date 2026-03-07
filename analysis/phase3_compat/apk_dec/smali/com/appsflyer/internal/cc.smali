.class public final Lcom/appsflyer/internal/cc;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static valueOf:Ljava/lang/String; = "https://%sgcdsdk.%s/install_data/v4.0/"

.field private static final values:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final AFInAppEventParameterName:Ljava/util/concurrent/ScheduledExecutorService;

.field private final AFInAppEventType:Landroid/app/Application;

.field private final AFKeystoreWrapper:Ljava/lang/String;

.field private final AFLogger$LogLevel:Lcom/appsflyer/internal/ac;

.field private final AFVersionDeclaration:I

.field private final AppsFlyer2dXConversionCallback:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const-string v0, "googleplay"

    const-string v1, "playstore"

    const-string v2, "googleplaystore"

    .line 34
    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/internal/cc;->values:Ljava/util/List;

    return-void
.end method

.method constructor <init>(Lcom/appsflyer/internal/ac;Landroid/app/Application;Ljava/lang/String;)V
    .locals 2

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1046
    sget-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    if-nez v0, :cond_0

    .line 1047
    new-instance v0, Lcom/appsflyer/internal/k;

    invoke-direct {v0}, Lcom/appsflyer/internal/k;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 1049
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 40
    invoke-virtual {v0}, Lcom/appsflyer/internal/k;->AFKeystoreWrapper()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/internal/cc;->AFInAppEventParameterName:Ljava/util/concurrent/ScheduledExecutorService;

    .line 41
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/appsflyer/internal/cc;->AppsFlyer2dXConversionCallback:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 48
    iput-object p1, p0, Lcom/appsflyer/internal/cc;->AFLogger$LogLevel:Lcom/appsflyer/internal/ac;

    .line 49
    iput-object p2, p0, Lcom/appsflyer/internal/cc;->AFInAppEventType:Landroid/app/Application;

    .line 50
    iput-object p3, p0, Lcom/appsflyer/internal/cc;->AFKeystoreWrapper:Ljava/lang/String;

    .line 51
    iput v1, p0, Lcom/appsflyer/internal/cc;->AFVersionDeclaration:I

    return-void
.end method

.method private constructor <init>(Lcom/appsflyer/internal/cc;)V
    .locals 2

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2046
    sget-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    if-nez v0, :cond_0

    .line 2047
    new-instance v0, Lcom/appsflyer/internal/k;

    invoke-direct {v0}, Lcom/appsflyer/internal/k;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 2049
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 40
    invoke-virtual {v0}, Lcom/appsflyer/internal/k;->AFKeystoreWrapper()Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/internal/cc;->AFInAppEventParameterName:Ljava/util/concurrent/ScheduledExecutorService;

    .line 41
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/appsflyer/internal/cc;->AppsFlyer2dXConversionCallback:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 55
    iget-object v0, p1, Lcom/appsflyer/internal/cc;->AFLogger$LogLevel:Lcom/appsflyer/internal/ac;

    iput-object v0, p0, Lcom/appsflyer/internal/cc;->AFLogger$LogLevel:Lcom/appsflyer/internal/ac;

    .line 56
    iget-object v0, p1, Lcom/appsflyer/internal/cc;->AFInAppEventType:Landroid/app/Application;

    iput-object v0, p0, Lcom/appsflyer/internal/cc;->AFInAppEventType:Landroid/app/Application;

    .line 57
    iget-object v0, p1, Lcom/appsflyer/internal/cc;->AFKeystoreWrapper:Ljava/lang/String;

    iput-object v0, p0, Lcom/appsflyer/internal/cc;->AFKeystoreWrapper:Ljava/lang/String;

    .line 58
    iget p1, p1, Lcom/appsflyer/internal/cc;->AFVersionDeclaration:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/appsflyer/internal/cc;->AFVersionDeclaration:I

    return-void
.end method

.method public static AFInAppEventParameterName(Ljava/lang/String;)V
    .locals 2

    .line 73
    sget-object v0, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener;

    if-eqz v0, :cond_0

    .line 74
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "[GCD-A02] Calling onConversionFailure with:\n"

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 75
    sget-object v0, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener;

    invoke-interface {v0, p0}, Lcom/appsflyer/AppsFlyerConversionListener;->onConversionDataFail(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method static values(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[GCD-A02] Calling onConversionDataSuccess with:\n"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 69
    sget-object v0, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener;

    invoke-interface {v0, p0}, Lcom/appsflyer/AppsFlyerConversionListener;->onConversionDataSuccess(Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 19

    move-object/from16 v1, p0

    const-string v0, "is_first_launch"

    const-string v2, "af_siteid"

    .line 81
    iget-object v3, v1, Lcom/appsflyer/internal/cc;->AFKeystoreWrapper:Ljava/lang/String;

    if-eqz v3, :cond_15

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_0

    goto/16 :goto_c

    .line 88
    :cond_0
    iget-object v3, v1, Lcom/appsflyer/internal/cc;->AFLogger$LogLevel:Lcom/appsflyer/internal/ac;

    invoke-virtual {v3}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v0, "[GCD-E03] \'isStopTracking\' enabled"

    .line 89
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    const-string v0, "\'isStopTracking\' enabled"

    .line 90
    invoke-static {v0}, Lcom/appsflyer/internal/cc;->AFInAppEventParameterName(Ljava/lang/String;)V

    return-void

    .line 94
    :cond_1
    iget-object v3, v1, Lcom/appsflyer/internal/cc;->AppsFlyer2dXConversionCallback:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    const/4 v3, 0x0

    const-wide/16 v4, 0xa

    const/4 v6, 0x2

    .line 98
    :try_start_0
    iget-object v7, v1, Lcom/appsflyer/internal/cc;->AFInAppEventType:Landroid/app/Application;

    if-nez v7, :cond_2

    const-string v0, "[GCD-E06] Context null"

    .line 99
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    const-string v0, "Context null"

    .line 100
    invoke-static {v0}, Lcom/appsflyer/internal/cc;->AFInAppEventParameterName(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 207
    iget-object v0, v1, Lcom/appsflyer/internal/cc;->AppsFlyer2dXConversionCallback:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    return-void

    .line 103
    :cond_2
    :try_start_1
    iget-object v8, v1, Lcom/appsflyer/internal/cc;->AFLogger$LogLevel:Lcom/appsflyer/internal/ac;

    .line 104
    invoke-virtual {v8, v7}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    .line 103
    invoke-virtual {v8, v7, v9}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    const-string v8, ""

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eqz v7, :cond_4

    .line 107
    :try_start_2
    sget-object v11, Lcom/appsflyer/internal/cc;->values:Ljava/util/List;

    invoke-virtual {v7}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_3

    const-string v11, "-"

    .line 108
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    :cond_3
    const-string v11, "AF detected using redundant Google-Play channel for attribution - %s. Using without channel postfix."

    new-array v12, v9, [Ljava/lang/Object;

    aput-object v7, v12, v10

    .line 110
    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    :cond_4
    move-object v7, v8

    .line 115
    :goto_0
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v12, Lcom/appsflyer/internal/cc;->valueOf:Ljava/lang/String;

    new-array v13, v6, [Ljava/lang/Object;

    .line 2062
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v14

    invoke-virtual {v14}, Lcom/appsflyer/AppsFlyerLib;->getHostPrefix()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v13, v10

    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v14

    invoke-virtual {v14}, Lcom/appsflyer/AppsFlyerLib;->getHostName()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v13, v9

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    .line 115
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v12, v1, Lcom/appsflyer/internal/cc;->AFInAppEventType:Landroid/app/Application;

    .line 116
    invoke-virtual {v12}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "?devkey="

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, v1, Lcom/appsflyer/internal/cc;->AFKeystoreWrapper:Ljava/lang/String;

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "&device_id="

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v7, Ljava/lang/ref/WeakReference;

    iget-object v12, v1, Lcom/appsflyer/internal/cc;->AFInAppEventType:Landroid/app/Application;

    invoke-direct {v7, v12}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 119
    invoke-static {v7}, Lcom/appsflyer/internal/af;->valueOf(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    .line 121
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v11

    invoke-virtual {v11, v7, v8}, Lcom/appsflyer/internal/ak;->AFInAppEventType(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "[GCD-B01] URL: "

    .line 122
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/appsflyer/internal/ai;->AFKeystoreWrapper(Ljava/lang/String;)V

    .line 123
    iget-object v8, v1, Lcom/appsflyer/internal/cc;->AFLogger$LogLevel:Lcom/appsflyer/internal/ac;

    invoke-virtual {v8}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v8

    invoke-interface {v8}, Lcom/appsflyer/internal/bg;->getLevel()Lcom/appsflyer/internal/cl;

    move-result-object v8

    .line 2190
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    iput-wide v11, v8, Lcom/appsflyer/internal/cl;->getLevel:J

    .line 125
    new-instance v11, Ljava/net/URL;

    invoke-direct {v11, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v11

    check-cast v11, Ljava/net/HttpURLConnection;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    :try_start_3
    const-string v3, "GET"

    .line 126
    invoke-virtual {v11, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v3, 0x2710

    .line 127
    invoke-virtual {v11, v3}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    const-string v3, "Connection"

    const-string v12, "close"

    .line 128
    invoke-virtual {v11, v3, v12}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    invoke-virtual {v11}, Ljava/net/URLConnection;->connect()V

    .line 130
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v3

    .line 131
    invoke-static {v11}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v12

    .line 132
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v13

    invoke-virtual {v13, v7, v3, v12}, Lcom/appsflyer/internal/ak;->values(Ljava/lang/String;ILjava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    const/16 v7, 0xc8

    const/16 v13, 0x194

    if-eq v3, v7, :cond_8

    if-ne v3, v13, :cond_5

    goto :goto_2

    :cond_5
    const/16 v0, 0x193

    if-eq v3, v0, :cond_6

    const/16 v0, 0x1f4

    if-lt v3, v0, :cond_7

    .line 193
    :cond_6
    :try_start_4
    iget v0, v1, Lcom/appsflyer/internal/cc;->AFVersionDeclaration:I

    if-ge v0, v6, :cond_7

    .line 195
    new-instance v0, Lcom/appsflyer/internal/cc;

    invoke-direct {v0, v1}, Lcom/appsflyer/internal/cc;-><init>(Lcom/appsflyer/internal/cc;)V

    .line 3217
    iget-object v2, v0, Lcom/appsflyer/internal/cc;->AFInAppEventParameterName:Ljava/util/concurrent/ScheduledExecutorService;

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {v2, v0, v4, v5, v3}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    goto :goto_1

    :cond_7
    const-string v0, "Error connection to server: "

    .line 197
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/internal/cc;->AFInAppEventParameterName(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :goto_1
    move-object/from16 v16, v11

    goto/16 :goto_7

    :catchall_0
    move-exception v0

    move-object v3, v11

    goto/16 :goto_9

    .line 136
    :cond_8
    :goto_2
    :try_start_5
    iget v7, v1, Lcom/appsflyer/internal/cc;->AFVersionDeclaration:I

    .line 2194
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 2195
    iget-wide v4, v8, Lcom/appsflyer/internal/cl;->getLevel:J

    const-wide/16 v16, 0x0

    cmp-long v18, v4, v16

    if-eqz v18, :cond_9

    .line 2196
    iget-object v4, v8, Lcom/appsflyer/internal/cl;->values:Ljava/util/Map;

    const-string v5, "net"
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-object/from16 v16, v11

    :try_start_6
    iget-wide v10, v8, Lcom/appsflyer/internal/cl;->getLevel:J

    sub-long/2addr v14, v10

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-interface {v4, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :cond_9
    move-object/from16 v16, v11

    const-string v4, "Metrics: gcdStart ts is missing"

    .line 2198
    invoke-static {v4}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 2200
    :goto_3
    iget-object v4, v8, Lcom/appsflyer/internal/cl;->values:Ljava/util/Map;

    const-string v5, "retries"

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v4, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "gcd"

    .line 2201
    iget-object v5, v8, Lcom/appsflyer/internal/cl;->values:Ljava/util/Map;

    .line 2215
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, v5}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 2216
    iget-object v5, v8, Lcom/appsflyer/internal/cl;->valueOf:Lcom/appsflyer/internal/bv;

    invoke-virtual {v7}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v4, v7}, Lcom/appsflyer/internal/bv;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;)V

    const-string v4, "Attribution data: "

    .line 137
    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/appsflyer/internal/ai;->AFKeystoreWrapper(Ljava/lang/String;)V

    .line 138
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_11

    .line 139
    invoke-static {v12}, Lcom/appsflyer/internal/cg;->values(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    const-string v5, "iscache"

    .line 140
    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    if-ne v3, v13, :cond_a

    const-string v3, "error_reason"

    .line 143
    invoke-interface {v4, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v3, "status_code"

    .line 144
    invoke-interface {v4, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "af_status"

    const-string v7, "Organic"

    .line 145
    invoke-interface {v4, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "af_message"

    const-string v7, "organic install"

    .line 146
    invoke-interface {v4, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a
    if-eqz v5, :cond_b

    .line 148
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_b

    .line 150
    iget-object v3, v1, Lcom/appsflyer/internal/cc;->AFLogger$LogLevel:Lcom/appsflyer/internal/ac;

    iget-object v5, v1, Lcom/appsflyer/internal/cc;->AFInAppEventType:Landroid/app/Application;

    const-string v7, "appsflyerConversionDataCacheExpiration"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    invoke-virtual {v3, v5, v7, v10, v11}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;Ljava/lang/String;J)V

    .line 152
    :cond_b
    invoke-interface {v4, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    const-string v5, "[Invite] Detected App-Invite via channel: "

    const-string v7, "af_channel"

    if-eqz v3, :cond_d

    .line 153
    :try_start_7
    invoke-interface {v4, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 155
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    goto :goto_4

    :cond_c
    const-string v3, "[CrossPromotion] App was installed via %s\'s Cross Promotion"

    new-array v8, v9, [Ljava/lang/Object;

    .line 160
    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    const/4 v11, 0x0

    aput-object v10, v8, v11

    .line 158
    invoke-static {v3, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 163
    :cond_d
    :goto_4
    invoke-interface {v4, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 164
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 168
    :cond_e
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v4, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v4}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    const-string v3, "attributionId"

    if-eqz v2, :cond_f

    .line 172
    :try_start_8
    iget-object v5, v1, Lcom/appsflyer/internal/cc;->AFInAppEventType:Landroid/app/Application;

    invoke-static {v5, v3, v2}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    .line 174
    :cond_f
    iget-object v2, v1, Lcom/appsflyer/internal/cc;->AFInAppEventType:Landroid/app/Application;

    invoke-static {v2, v3, v12}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    :goto_5
    sget-object v2, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener;

    if-eqz v2, :cond_11

    .line 177
    iget-object v2, v1, Lcom/appsflyer/internal/cc;->AppsFlyer2dXConversionCallback:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    if-gt v2, v9, :cond_11

    .line 180
    :try_start_9
    iget-object v2, v1, Lcom/appsflyer/internal/cc;->AFInAppEventType:Landroid/app/Application;

    invoke-static {v2}, Lcom/appsflyer/internal/cg;->AFInAppEventParameterName(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v2

    .line 181
    iget-object v3, v1, Lcom/appsflyer/internal/cc;->AFInAppEventType:Landroid/app/Application;

    invoke-static {v3}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const-string v5, "sixtyDayConversionData"

    const/4 v7, 0x0

    .line 182
    invoke-interface {v3, v5, v7}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_10

    .line 183
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_9
    .catch Lcom/appsflyer/internal/ce; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :cond_10
    move-object v4, v2

    goto :goto_6

    :catch_0
    move-exception v0

    :try_start_a
    const-string v2, "Exception while trying to fetch attribution data. "

    .line 186
    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3068
    :goto_6
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "[GCD-A02] Calling onConversionDataSuccess with:\n"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 3069
    sget-object v0, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener;

    invoke-interface {v0, v4}, Lcom/appsflyer/AppsFlyerConversionListener;->onConversionDataSuccess(Ljava/util/Map;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 207
    :cond_11
    :goto_7
    iget-object v0, v1, Lcom/appsflyer/internal/cc;->AppsFlyer2dXConversionCallback:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    if-eqz v16, :cond_13

    .line 209
    invoke-virtual/range {v16 .. v16}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_b

    :catchall_1
    move-exception v0

    goto :goto_8

    :catchall_2
    move-exception v0

    move-object/from16 v16, v11

    :goto_8
    move-object/from16 v3, v16

    goto :goto_9

    :catchall_3
    move-exception v0

    .line 200
    :goto_9
    :try_start_b
    iget v2, v1, Lcom/appsflyer/internal/cc;->AFVersionDeclaration:I

    if-ge v2, v6, :cond_12

    .line 201
    new-instance v2, Lcom/appsflyer/internal/cc;

    invoke-direct {v2, v1}, Lcom/appsflyer/internal/cc;-><init>(Lcom/appsflyer/internal/cc;)V

    .line 4217
    iget-object v4, v2, Lcom/appsflyer/internal/cc;->AFInAppEventParameterName:Ljava/util/concurrent/ScheduledExecutorService;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v6, 0xa

    invoke-static {v4, v2, v6, v7, v5}, Lcom/appsflyer/internal/ac;->valueOf(Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)V

    goto :goto_a

    .line 203
    :cond_12
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/appsflyer/internal/cc;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 205
    :goto_a
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 207
    iget-object v0, v1, Lcom/appsflyer/internal/cc;->AppsFlyer2dXConversionCallback:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    if-eqz v3, :cond_13

    .line 209
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 212
    :cond_13
    :goto_b
    iget-object v0, v1, Lcom/appsflyer/internal/cc;->AFInAppEventParameterName:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    const-string v0, "[GCD-A03] Server retrieving attempt finished"

    .line 213
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    return-void

    :catchall_4
    move-exception v0

    .line 207
    iget-object v2, v1, Lcom/appsflyer/internal/cc;->AppsFlyer2dXConversionCallback:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    if-eqz v3, :cond_14

    .line 209
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 211
    :cond_14
    throw v0

    :cond_15
    :goto_c
    const-string v0, "[GCD-E05] AppsFlyer dev key is missing"

    .line 82
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    const-string v0, "AppsFlyer dev key is missing"

    .line 83
    invoke-static {v0}, Lcom/appsflyer/internal/cc;->AFInAppEventParameterName(Ljava/lang/String;)V

    return-void
.end method
