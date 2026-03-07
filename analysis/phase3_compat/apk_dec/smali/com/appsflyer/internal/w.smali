.class public final Lcom/appsflyer/internal/w;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static final AFLogger$LogLevel:Ljava/util/BitSet;

.field private static final AFVersionDeclaration:Landroid/os/Handler;

.field private static volatile init:Lcom/appsflyer/internal/w;


# instance fields
.field final AFInAppEventParameterName:Ljava/lang/Runnable;

.field final AFInAppEventType:Ljava/lang/Object;

.field final AFKeystoreWrapper:Landroid/os/Handler;

.field final AppsFlyer2dXConversionCallback:Ljava/util/concurrent/Executor;

.field final getLevel:Ljava/lang/Runnable;

.field private final onAppOpenAttribution:Ljava/lang/Runnable;

.field private final onAppOpenAttributionNative:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/appsflyer/internal/x;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private onAttributionFailureNative:I

.field private final onDeepLinkingNative:Landroid/hardware/SensorManager;

.field private onInstallConversionDataLoadedNative:Z

.field private final onInstallConversionFailureNative:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/appsflyer/internal/x;",
            "Lcom/appsflyer/internal/x;",
            ">;"
        }
    .end annotation
.end field

.field private onResponseNative:J

.field valueOf:Z

.field final values:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 29
    new-instance v0, Ljava/util/BitSet;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ljava/util/BitSet;-><init>(I)V

    sput-object v0, Lcom/appsflyer/internal/w;->AFLogger$LogLevel:Ljava/util/BitSet;

    .line 30
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/appsflyer/internal/w;->AFVersionDeclaration:Landroid/os/Handler;

    const/4 v1, 0x1

    .line 35
    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    const/4 v1, 0x2

    .line 36
    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    const/4 v1, 0x4

    .line 37
    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    return-void
.end method

.method private constructor <init>(Landroid/hardware/SensorManager;Landroid/os/Handler;)V
    .locals 3

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/w;->AFInAppEventType:Ljava/lang/Object;

    .line 42
    new-instance v0, Ljava/util/HashMap;

    sget-object v1, Lcom/appsflyer/internal/w;->AFLogger$LogLevel:Ljava/util/BitSet;

    invoke-virtual {v1}, Ljava/util/BitSet;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lcom/appsflyer/internal/w;->onInstallConversionFailureNative:Ljava/util/Map;

    .line 43
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Ljava/util/BitSet;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    iput-object v0, p0, Lcom/appsflyer/internal/w;->onAppOpenAttributionNative:Ljava/util/Map;

    .line 47
    new-instance v0, Lcom/appsflyer/internal/w$3;

    invoke-direct {v0, p0}, Lcom/appsflyer/internal/w$3;-><init>(Lcom/appsflyer/internal/w;)V

    iput-object v0, p0, Lcom/appsflyer/internal/w;->AFInAppEventParameterName:Ljava/lang/Runnable;

    .line 58
    new-instance v0, Lcom/appsflyer/internal/w$4;

    invoke-direct {v0, p0}, Lcom/appsflyer/internal/w$4;-><init>(Lcom/appsflyer/internal/w;)V

    iput-object v0, p0, Lcom/appsflyer/internal/w;->values:Ljava/lang/Runnable;

    .line 66
    new-instance v0, Lcom/appsflyer/internal/w$1;

    invoke-direct {v0, p0}, Lcom/appsflyer/internal/w$1;-><init>(Lcom/appsflyer/internal/w;)V

    iput-object v0, p0, Lcom/appsflyer/internal/w;->getLevel:Ljava/lang/Runnable;

    const/4 v0, 0x1

    .line 81
    iput v0, p0, Lcom/appsflyer/internal/w;->onAttributionFailureNative:I

    const-wide/16 v0, 0x0

    .line 82
    iput-wide v0, p0, Lcom/appsflyer/internal/w;->onResponseNative:J

    .line 83
    new-instance v0, Lcom/appsflyer/internal/w$5;

    invoke-direct {v0, p0}, Lcom/appsflyer/internal/w$5;-><init>(Lcom/appsflyer/internal/w;)V

    iput-object v0, p0, Lcom/appsflyer/internal/w;->onAppOpenAttribution:Ljava/lang/Runnable;

    .line 95
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/internal/w;->AppsFlyer2dXConversionCallback:Ljava/util/concurrent/Executor;

    .line 98
    iput-object p1, p0, Lcom/appsflyer/internal/w;->onDeepLinkingNative:Landroid/hardware/SensorManager;

    .line 99
    iput-object p2, p0, Lcom/appsflyer/internal/w;->AFKeystoreWrapper:Landroid/os/Handler;

    return-void
.end method

.method static synthetic AFInAppEventParameterName(Lcom/appsflyer/internal/w;)Landroid/hardware/SensorManager;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/appsflyer/internal/w;->onDeepLinkingNative:Landroid/hardware/SensorManager;

    return-object p0
.end method

.method static synthetic AFInAppEventType(Lcom/appsflyer/internal/w;)Ljava/util/concurrent/Executor;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/appsflyer/internal/w;->AppsFlyer2dXConversionCallback:Ljava/util/concurrent/Executor;

    return-object p0
.end method

.method static synthetic AFInAppEventType(I)Z
    .locals 0

    .line 25
    invoke-static {p0}, Lcom/appsflyer/internal/w;->AFKeystoreWrapper(I)Z

    move-result p0

    return p0
.end method

.method static AFKeystoreWrapper(Landroid/content/Context;)Lcom/appsflyer/internal/w;
    .locals 1

    .line 106
    sget-object v0, Lcom/appsflyer/internal/w;->init:Lcom/appsflyer/internal/w;

    if-eqz v0, :cond_0

    .line 107
    sget-object p0, Lcom/appsflyer/internal/w;->init:Lcom/appsflyer/internal/w;

    return-object p0

    .line 110
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "sensor"

    .line 111
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/hardware/SensorManager;

    .line 112
    sget-object v0, Lcom/appsflyer/internal/w;->AFVersionDeclaration:Landroid/os/Handler;

    invoke-static {p0, v0}, Lcom/appsflyer/internal/w;->AFKeystoreWrapper(Landroid/hardware/SensorManager;Landroid/os/Handler;)Lcom/appsflyer/internal/w;

    move-result-object p0

    return-object p0
.end method

.method private static AFKeystoreWrapper(Landroid/hardware/SensorManager;Landroid/os/Handler;)Lcom/appsflyer/internal/w;
    .locals 2

    .line 121
    sget-object v0, Lcom/appsflyer/internal/w;->init:Lcom/appsflyer/internal/w;

    if-nez v0, :cond_1

    .line 122
    const-class v0, Lcom/appsflyer/internal/w;

    monitor-enter v0

    .line 123
    :try_start_0
    sget-object v1, Lcom/appsflyer/internal/w;->init:Lcom/appsflyer/internal/w;

    if-nez v1, :cond_0

    .line 1132
    new-instance v1, Lcom/appsflyer/internal/w;

    invoke-direct {v1, p0, p1}, Lcom/appsflyer/internal/w;-><init>(Landroid/hardware/SensorManager;Landroid/os/Handler;)V

    .line 124
    sput-object v1, Lcom/appsflyer/internal/w;->init:Lcom/appsflyer/internal/w;

    .line 126
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0

    .line 128
    :cond_1
    :goto_0
    sget-object p0, Lcom/appsflyer/internal/w;->init:Lcom/appsflyer/internal/w;

    return-object p0
.end method

.method static synthetic AFKeystoreWrapper(Lcom/appsflyer/internal/w;)Ljava/util/Map;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/appsflyer/internal/w;->onInstallConversionFailureNative:Ljava/util/Map;

    return-object p0
.end method

.method private static AFKeystoreWrapper(I)Z
    .locals 1

    if-ltz p0, :cond_0

    .line 142
    sget-object v0, Lcom/appsflyer/internal/w;->AFLogger$LogLevel:Ljava/util/BitSet;

    invoke-virtual {v0, p0}, Ljava/util/BitSet;->get(I)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method static synthetic AppsFlyer2dXConversionCallback(Lcom/appsflyer/internal/w;)Ljava/util/Map;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/appsflyer/internal/w;->onAppOpenAttributionNative:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic valueOf(Lcom/appsflyer/internal/w;)Ljava/lang/Runnable;
    .locals 0

    .line 25
    iget-object p0, p0, Lcom/appsflyer/internal/w;->onAppOpenAttribution:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic valueOf(Lcom/appsflyer/internal/w;Z)Z
    .locals 0

    .line 25
    iput-boolean p1, p0, Lcom/appsflyer/internal/w;->onInstallConversionDataLoadedNative:Z

    return p1
.end method

.method static synthetic values(Lcom/appsflyer/internal/w;)I
    .locals 0

    .line 25
    iget p0, p0, Lcom/appsflyer/internal/w;->onAttributionFailureNative:I

    return p0
.end method

.method static synthetic values(Lcom/appsflyer/internal/w;I)I
    .locals 0

    .line 25
    iput p1, p0, Lcom/appsflyer/internal/w;->onAttributionFailureNative:I

    return p1
.end method

.method private values()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 264
    iget-object v0, p0, Lcom/appsflyer/internal/w;->AFInAppEventType:Ljava/lang/Object;

    monitor-enter v0

    .line 266
    :try_start_0
    iget-object v1, p0, Lcom/appsflyer/internal/w;->onInstallConversionFailureNative:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/appsflyer/internal/w;->onInstallConversionDataLoadedNative:Z

    if-eqz v1, :cond_0

    .line 267
    iget-object v1, p0, Lcom/appsflyer/internal/w;->onInstallConversionFailureNative:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/appsflyer/internal/x;

    .line 268
    iget-object v3, p0, Lcom/appsflyer/internal/w;->onAppOpenAttributionNative:Ljava/util/Map;

    const/4 v4, 0x0

    .line 1139
    invoke-virtual {v2, v3, v4}, Lcom/appsflyer/internal/x;->AFKeystoreWrapper(Ljava/util/Map;Z)V

    goto :goto_0

    .line 271
    :cond_0
    iget-object v1, p0, Lcom/appsflyer/internal/w;->onAppOpenAttributionNative:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 272
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    .line 274
    :cond_1
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    iget-object v2, p0, Lcom/appsflyer/internal/w;->onAppOpenAttributionNative:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v1

    :catchall_0
    move-exception v1

    .line 275
    monitor-exit v0

    throw v1
.end method


# virtual methods
.method final AFInAppEventParameterName()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 246
    iget-object v0, p0, Lcom/appsflyer/internal/w;->onInstallConversionFailureNative:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/appsflyer/internal/x;

    .line 247
    iget-object v2, p0, Lcom/appsflyer/internal/w;->onAppOpenAttributionNative:Ljava/util/Map;

    const/4 v3, 0x1

    .line 1135
    invoke-virtual {v1, v2, v3}, Lcom/appsflyer/internal/x;->AFKeystoreWrapper(Ljava/util/Map;Z)V

    goto :goto_0

    .line 250
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/w;->onAppOpenAttributionNative:Ljava/util/Map;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    .line 254
    :cond_1
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    iget-object v1, p0, Lcom/appsflyer/internal/w;->onAppOpenAttributionNative:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0

    .line 251
    :cond_2
    :goto_1
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method final AFInAppEventType()V
    .locals 7

    .line 161
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 162
    iget-wide v2, p0, Lcom/appsflyer/internal/w;->onResponseNative:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-eqz v6, :cond_0

    .line 163
    iget v4, p0, Lcom/appsflyer/internal/w;->onAttributionFailureNative:I

    add-int/lit8 v4, v4, 0x1

    iput v4, p0, Lcom/appsflyer/internal/w;->onAttributionFailureNative:I

    sub-long/2addr v2, v0

    const-wide/16 v4, 0x1f4

    cmp-long v6, v2, v4

    if-gez v6, :cond_1

    .line 166
    iget-object v2, p0, Lcom/appsflyer/internal/w;->AFKeystoreWrapper:Landroid/os/Handler;

    iget-object v3, p0, Lcom/appsflyer/internal/w;->values:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 167
    iget-object v2, p0, Lcom/appsflyer/internal/w;->AFKeystoreWrapper:Landroid/os/Handler;

    iget-object v3, p0, Lcom/appsflyer/internal/w;->AFInAppEventParameterName:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 171
    :cond_0
    iget-object v2, p0, Lcom/appsflyer/internal/w;->AFKeystoreWrapper:Landroid/os/Handler;

    iget-object v3, p0, Lcom/appsflyer/internal/w;->getLevel:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 173
    iget-object v2, p0, Lcom/appsflyer/internal/w;->AFKeystoreWrapper:Landroid/os/Handler;

    iget-object v3, p0, Lcom/appsflyer/internal/w;->AFInAppEventParameterName:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 175
    :cond_1
    :goto_0
    iput-wide v0, p0, Lcom/appsflyer/internal/w;->onResponseNative:J

    return-void
.end method

.method final AFKeystoreWrapper()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 312
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 313
    invoke-direct {p0}, Lcom/appsflyer/internal/w;->values()Ljava/util/List;

    move-result-object v1

    .line 315
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    const-string v3, "sensors"

    if-nez v2, :cond_0

    .line 316
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 319
    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/w;->AFInAppEventParameterName()Ljava/util/List;

    move-result-object v1

    .line 320
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 321
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    :goto_0
    return-object v0
.end method
