.class public final Lcom/appsflyer/internal/bf;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/appsflyer/internal/bg;


# instance fields
.field private AFInAppEventParameterName:Lcom/appsflyer/internal/av;

.field private AFInAppEventType:Lcom/appsflyer/internal/bh;

.field public final AFKeystoreWrapper:Lcom/appsflyer/internal/be;

.field private AFLogger$LogLevel:Lcom/appsflyer/internal/ab;

.field private AFVersionDeclaration:Lcom/appsflyer/internal/by;

.field private AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/cl;

.field private getLevel:Lcom/appsflyer/internal/aa;

.field private init:Lcom/appsflyer/internal/ai;

.field private onAppOpenAttributionNative:Lcom/appsflyer/internal/de;

.field private onInstallConversionDataLoadedNative:Lcom/appsflyer/internal/ca;

.field private onInstallConversionFailureNative:Lcom/appsflyer/internal/l;

.field private valueOf:Ljava/util/concurrent/ExecutorService;

.field private final values:I


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1e

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    long-to-int v1, v0

    iput v1, p0, Lcom/appsflyer/internal/bf;->values:I

    .line 50
    new-instance v0, Lcom/appsflyer/internal/be;

    invoke-direct {v0}, Lcom/appsflyer/internal/be;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    return-void
.end method

.method private declared-synchronized onAppOpenAttributionNative()Lcom/appsflyer/internal/ab;
    .locals 3

    monitor-enter p0

    .line 76
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->AFLogger$LogLevel:Lcom/appsflyer/internal/ab;

    if-nez v0, :cond_0

    .line 77
    new-instance v0, Lcom/appsflyer/internal/ab;

    .line 1084
    new-instance v1, Lcom/appsflyer/internal/bm;

    iget v2, p0, Lcom/appsflyer/internal/bf;->values:I

    invoke-direct {v1, v2}, Lcom/appsflyer/internal/bm;-><init>(I)V

    .line 77
    invoke-direct {p0}, Lcom/appsflyer/internal/bf;->onDeepLinkingNative()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/appsflyer/internal/ab;-><init>(Lcom/appsflyer/internal/bm;Ljava/util/concurrent/ExecutorService;)V

    iput-object v0, p0, Lcom/appsflyer/internal/bf;->AFLogger$LogLevel:Lcom/appsflyer/internal/ab;

    .line 79
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->AFLogger$LogLevel:Lcom/appsflyer/internal/ab;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized onAttributionFailureNative()Lcom/appsflyer/internal/be;
    .locals 1

    monitor-enter p0

    .line 223
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized onDeepLinkingNative()Ljava/util/concurrent/ExecutorService;
    .locals 1

    monitor-enter p0

    .line 89
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->valueOf:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_0

    .line 90
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/internal/bf;->valueOf:Ljava/util/concurrent/ExecutorService;

    .line 92
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->valueOf:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized onInstallConversionDataLoadedNative()Lcom/appsflyer/internal/bh;
    .locals 1

    monitor-enter p0

    .line 115
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->AFInAppEventType:Lcom/appsflyer/internal/bh;

    if-nez v0, :cond_0

    .line 116
    new-instance v0, Lcom/appsflyer/internal/bh;

    invoke-direct {v0}, Lcom/appsflyer/internal/bh;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/bf;->AFInAppEventType:Lcom/appsflyer/internal/bh;

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->AFInAppEventType:Lcom/appsflyer/internal/bh;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized onInstallConversionFailureNative()Lcom/appsflyer/internal/ai;
    .locals 8

    monitor-enter p0

    .line 177
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->init:Lcom/appsflyer/internal/ai;

    if-nez v0, :cond_0

    .line 188
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v2, 0x0

    const/4 v3, 0x4

    const-wide/16 v4, 0xb4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v7}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    invoke-direct/range {v1 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    .line 193
    new-instance v0, Lcom/appsflyer/internal/ai;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/appsflyer/internal/ai;-><init>(B)V

    iput-object v0, p0, Lcom/appsflyer/internal/bf;->init:Lcom/appsflyer/internal/ai;

    .line 195
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->init:Lcom/appsflyer/internal/ai;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public final AFInAppEventParameterName()Lcom/appsflyer/internal/bv;
    .locals 2

    .line 110
    new-instance v0, Lcom/appsflyer/internal/bc;

    .line 2139
    iget-object v1, p0, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    .line 3024
    iget-object v1, v1, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    if-eqz v1, :cond_0

    .line 110
    invoke-static {v1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/appsflyer/internal/bc;-><init>(Landroid/content/SharedPreferences;)V

    return-object v0

    .line 2141
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Context must be set via setContext method before calling this dependency."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final declared-synchronized AFInAppEventType()Lcom/appsflyer/internal/aa;
    .locals 2

    monitor-enter p0

    .line 102
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->getLevel:Lcom/appsflyer/internal/aa;

    if-nez v0, :cond_1

    .line 103
    new-instance v0, Lcom/appsflyer/internal/aa;

    .line 1139
    iget-object v1, p0, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    .line 2024
    iget-object v1, v1, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    if-eqz v1, :cond_0

    .line 103
    invoke-direct {v0, v1}, Lcom/appsflyer/internal/aa;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/appsflyer/internal/bf;->getLevel:Lcom/appsflyer/internal/aa;

    goto :goto_0

    .line 1141
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Context must be set via setContext method before calling this dependency."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 105
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->getLevel:Lcom/appsflyer/internal/aa;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized AFKeystoreWrapper()Lcom/appsflyer/internal/av;
    .locals 9

    monitor-enter p0

    .line 123
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->AFInAppEventParameterName:Lcom/appsflyer/internal/av;

    if-nez v0, :cond_1

    .line 124
    new-instance v0, Lcom/appsflyer/internal/av;

    .line 125
    invoke-direct {p0}, Lcom/appsflyer/internal/bf;->onInstallConversionDataLoadedNative()Lcom/appsflyer/internal/bh;

    move-result-object v2

    .line 3097
    new-instance v3, Lcom/appsflyer/internal/bb;

    .line 3139
    iget-object v1, p0, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    .line 4024
    iget-object v1, v1, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    if-eqz v1, :cond_0

    .line 3097
    invoke-direct {v3, v1}, Lcom/appsflyer/internal/bb;-><init>(Landroid/content/Context;)V

    .line 127
    invoke-virtual {p0}, Lcom/appsflyer/internal/bf;->AFInAppEventParameterName()Lcom/appsflyer/internal/bv;

    move-result-object v4

    .line 128
    invoke-direct {p0}, Lcom/appsflyer/internal/bf;->onDeepLinkingNative()Ljava/util/concurrent/ExecutorService;

    move-result-object v5

    .line 4068
    new-instance v6, Lcom/appsflyer/internal/bd;

    .line 4069
    invoke-direct {p0}, Lcom/appsflyer/internal/bf;->onAppOpenAttributionNative()Lcom/appsflyer/internal/ab;

    move-result-object v1

    .line 4070
    invoke-virtual {p0}, Lcom/appsflyer/internal/bf;->AFInAppEventType()Lcom/appsflyer/internal/aa;

    move-result-object v7

    .line 4071
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v8

    invoke-direct {v6, v1, v7, v8}, Lcom/appsflyer/internal/bd;-><init>(Lcom/appsflyer/internal/ab;Lcom/appsflyer/internal/aa;Lcom/appsflyer/AppsFlyerProperties;)V

    move-object v1, v0

    .line 129
    invoke-direct/range {v1 .. v6}, Lcom/appsflyer/internal/av;-><init>(Lcom/appsflyer/internal/bh;Lcom/appsflyer/internal/bb;Lcom/appsflyer/internal/bv;Ljava/util/concurrent/ExecutorService;Lcom/appsflyer/internal/bd;)V

    iput-object v0, p0, Lcom/appsflyer/internal/bf;->AFInAppEventParameterName:Lcom/appsflyer/internal/av;

    goto :goto_0

    .line 3141
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Context must be set via setContext method before calling this dependency."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->AFInAppEventParameterName:Lcom/appsflyer/internal/av;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized AFLogger$LogLevel()Lcom/appsflyer/internal/de;
    .locals 1

    monitor-enter p0

    .line 206
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->onAppOpenAttributionNative:Lcom/appsflyer/internal/de;

    if-nez v0, :cond_0

    .line 207
    new-instance v0, Lcom/appsflyer/internal/de;

    invoke-direct {v0}, Lcom/appsflyer/internal/de;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/bf;->onAppOpenAttributionNative:Lcom/appsflyer/internal/de;

    .line 209
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->onAppOpenAttributionNative:Lcom/appsflyer/internal/de;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized AFVersionDeclaration()Lcom/appsflyer/internal/l;
    .locals 2

    monitor-enter p0

    .line 229
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->onInstallConversionFailureNative:Lcom/appsflyer/internal/l;

    if-nez v0, :cond_0

    .line 230
    new-instance v0, Lcom/appsflyer/internal/l;

    invoke-direct {p0}, Lcom/appsflyer/internal/bf;->onAttributionFailureNative()Lcom/appsflyer/internal/be;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/appsflyer/internal/l;-><init>(Lcom/appsflyer/internal/be;)V

    iput-object v0, p0, Lcom/appsflyer/internal/bf;->onInstallConversionFailureNative:Lcom/appsflyer/internal/l;

    .line 232
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->onInstallConversionFailureNative:Lcom/appsflyer/internal/l;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized AppsFlyer2dXConversionCallback()Lcom/appsflyer/internal/ak;
    .locals 1

    monitor-enter p0

    .line 201
    :try_start_0
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized getLevel()Lcom/appsflyer/internal/cl;
    .locals 2

    monitor-enter p0

    .line 169
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/cl;

    if-nez v0, :cond_0

    .line 170
    new-instance v0, Lcom/appsflyer/internal/cl;

    invoke-virtual {p0}, Lcom/appsflyer/internal/bf;->AFInAppEventParameterName()Lcom/appsflyer/internal/bv;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/appsflyer/internal/cl;-><init>(Lcom/appsflyer/internal/bv;)V

    iput-object v0, p0, Lcom/appsflyer/internal/bf;->AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/cl;

    .line 172
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/cl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized init()Lcom/appsflyer/internal/ca;
    .locals 2

    monitor-enter p0

    .line 214
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->onInstallConversionDataLoadedNative:Lcom/appsflyer/internal/ca;

    if-nez v0, :cond_0

    .line 215
    new-instance v0, Lcom/appsflyer/internal/ca;

    invoke-direct {p0}, Lcom/appsflyer/internal/bf;->onAttributionFailureNative()Lcom/appsflyer/internal/be;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/appsflyer/internal/ca;-><init>(Lcom/appsflyer/internal/be;)V

    iput-object v0, p0, Lcom/appsflyer/internal/bf;->onInstallConversionDataLoadedNative:Lcom/appsflyer/internal/ca;

    .line 217
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->onInstallConversionDataLoadedNative:Lcom/appsflyer/internal/ca;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final valueOf()Lcom/appsflyer/internal/bd;
    .locals 4

    .line 68
    new-instance v0, Lcom/appsflyer/internal/bd;

    .line 69
    invoke-direct {p0}, Lcom/appsflyer/internal/bf;->onAppOpenAttributionNative()Lcom/appsflyer/internal/ab;

    move-result-object v1

    .line 70
    invoke-virtual {p0}, Lcom/appsflyer/internal/bf;->AFInAppEventType()Lcom/appsflyer/internal/aa;

    move-result-object v2

    .line 71
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/appsflyer/internal/bd;-><init>(Lcom/appsflyer/internal/ab;Lcom/appsflyer/internal/aa;Lcom/appsflyer/AppsFlyerProperties;)V

    return-object v0
.end method

.method public final declared-synchronized values()Lcom/appsflyer/internal/by;
    .locals 11

    monitor-enter p0

    .line 148
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->AFVersionDeclaration:Lcom/appsflyer/internal/by;

    if-nez v0, :cond_0

    .line 149
    new-instance v5, Lcom/appsflyer/internal/bx;

    invoke-virtual {p0}, Lcom/appsflyer/internal/bf;->AFInAppEventParameterName()Lcom/appsflyer/internal/bv;

    move-result-object v0

    invoke-direct {v5, v0}, Lcom/appsflyer/internal/bx;-><init>(Lcom/appsflyer/internal/bv;)V

    .line 150
    new-instance v7, Lcom/appsflyer/internal/cb;

    invoke-virtual {p0}, Lcom/appsflyer/internal/bf;->AFInAppEventType()Lcom/appsflyer/internal/aa;

    move-result-object v0

    invoke-direct {v7, v0, v5}, Lcom/appsflyer/internal/cb;-><init>(Lcom/appsflyer/internal/aa;Lcom/appsflyer/internal/bx;)V

    .line 152
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v8

    .line 153
    new-instance v0, Lcom/appsflyer/internal/by;

    new-instance v2, Lcom/appsflyer/internal/bw;

    invoke-direct {v2}, Lcom/appsflyer/internal/bw;-><init>()V

    .line 155
    invoke-virtual {p0}, Lcom/appsflyer/internal/bf;->AFInAppEventType()Lcom/appsflyer/internal/aa;

    move-result-object v3

    .line 156
    invoke-virtual {p0}, Lcom/appsflyer/internal/bf;->init()Lcom/appsflyer/internal/ca;

    move-result-object v4

    .line 5068
    new-instance v6, Lcom/appsflyer/internal/bd;

    .line 5069
    invoke-direct {p0}, Lcom/appsflyer/internal/bf;->onAppOpenAttributionNative()Lcom/appsflyer/internal/ab;

    move-result-object v1

    .line 5070
    invoke-virtual {p0}, Lcom/appsflyer/internal/bf;->AFInAppEventType()Lcom/appsflyer/internal/aa;

    move-result-object v9

    .line 5071
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v10

    invoke-direct {v6, v1, v9, v10}, Lcom/appsflyer/internal/bd;-><init>(Lcom/appsflyer/internal/ab;Lcom/appsflyer/internal/aa;Lcom/appsflyer/AppsFlyerProperties;)V

    .line 161
    invoke-direct {p0}, Lcom/appsflyer/internal/bf;->onInstallConversionFailureNative()Lcom/appsflyer/internal/ai;

    move-result-object v9

    move-object v1, v0

    invoke-direct/range {v1 .. v9}, Lcom/appsflyer/internal/by;-><init>(Lcom/appsflyer/internal/bw;Lcom/appsflyer/internal/aa;Lcom/appsflyer/internal/ca;Lcom/appsflyer/internal/bx;Lcom/appsflyer/internal/bd;Lcom/appsflyer/internal/cb;Ljava/util/concurrent/Executor;Lcom/appsflyer/internal/ai;)V

    iput-object v0, p0, Lcom/appsflyer/internal/bf;->AFVersionDeclaration:Lcom/appsflyer/internal/by;

    .line 164
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/bf;->AFVersionDeclaration:Lcom/appsflyer/internal/by;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
