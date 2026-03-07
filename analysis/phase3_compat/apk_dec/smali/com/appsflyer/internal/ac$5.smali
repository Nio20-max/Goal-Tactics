.class final Lcom/appsflyer/internal/ac$5;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/appsflyer/internal/ah$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/ac;->start(Landroid/content/Context;Ljava/lang/String;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic AFInAppEventParameterName:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

.field private synthetic AFInAppEventType:Ljava/lang/String;

.field private synthetic valueOf:Lcom/appsflyer/internal/ac;

.field private synthetic values:Lcom/appsflyer/internal/cl;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/cl;Ljava/lang/String;Lcom/appsflyer/attribution/AppsFlyerRequestListener;)V
    .locals 0

    .line 1021
    iput-object p1, p0, Lcom/appsflyer/internal/ac$5;->valueOf:Lcom/appsflyer/internal/ac;

    iput-object p2, p0, Lcom/appsflyer/internal/ac$5;->values:Lcom/appsflyer/internal/cl;

    iput-object p3, p0, Lcom/appsflyer/internal/ac$5;->AFInAppEventType:Ljava/lang/String;

    iput-object p4, p0, Lcom/appsflyer/internal/ac$5;->AFInAppEventParameterName:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final valueOf(Landroid/app/Activity;)V
    .locals 7

    .line 1023
    iget-object v0, p0, Lcom/appsflyer/internal/ac$5;->values:Lcom/appsflyer/internal/cl;

    invoke-virtual {v0}, Lcom/appsflyer/internal/cl;->AFKeystoreWrapper()V

    .line 1024
    iget-object v0, p0, Lcom/appsflyer/internal/ac$5;->valueOf:Lcom/appsflyer/internal/ac;

    invoke-virtual {v0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/bg;->values()Lcom/appsflyer/internal/by;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/appsflyer/internal/by;->values(Lcom/appsflyer/internal/bv;)V

    .line 1028
    iget-object v0, p0, Lcom/appsflyer/internal/ac$5;->valueOf:Lcom/appsflyer/internal/ac;

    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Z)I

    move-result v0

    const-string v1, "onBecameForeground"

    .line 1029
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 1031
    invoke-static {p1}, Lcom/appsflyer/internal/w;->AFKeystoreWrapper(Landroid/content/Context;)Lcom/appsflyer/internal/w;

    move-result-object v0

    .line 1150
    iget-object v1, v0, Lcom/appsflyer/internal/w;->AFKeystoreWrapper:Landroid/os/Handler;

    iget-object v2, v0, Lcom/appsflyer/internal/w;->getLevel:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1152
    iget-object v1, v0, Lcom/appsflyer/internal/w;->AFKeystoreWrapper:Landroid/os/Handler;

    iget-object v0, v0, Lcom/appsflyer/internal/w;->AFInAppEventParameterName:Ljava/lang/Runnable;

    invoke-virtual {v1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 1032
    :cond_0
    new-instance v0, Lcom/appsflyer/internal/cp;

    invoke-direct {v0}, Lcom/appsflyer/internal/cp;-><init>()V

    .line 1033
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    move-result-object v1

    .line 1034
    invoke-virtual {v0}, Lcom/appsflyer/internal/i;->values()Ljava/util/Map;

    move-result-object v2

    iget-object v3, p0, Lcom/appsflyer/internal/ac$5;->values:Lcom/appsflyer/internal/cl;

    .line 1036
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    iget-object v5, p0, Lcom/appsflyer/internal/ac$5;->valueOf:Lcom/appsflyer/internal/ac;

    .line 1037
    invoke-virtual {v5}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v5

    invoke-interface {v5}, Lcom/appsflyer/internal/bg;->AFInAppEventParameterName()Lcom/appsflyer/internal/bv;

    move-result-object v5

    .line 1038
    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v6

    .line 1033
    invoke-virtual/range {v1 .. v6}, Lcom/appsflyer/internal/f;->valueOf(Ljava/util/Map;Lcom/appsflyer/internal/cl;Landroid/content/Intent;Lcom/appsflyer/internal/bv;Landroid/content/Context;)V

    .line 1039
    iget-object v1, p0, Lcom/appsflyer/internal/ac$5;->valueOf:Lcom/appsflyer/internal/ac;

    if-eqz p1, :cond_1

    .line 2053
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Landroid/app/Application;

    iput-object v2, v0, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    .line 1039
    :cond_1
    iget-object v2, p0, Lcom/appsflyer/internal/ac$5;->AFInAppEventType:Ljava/lang/String;

    .line 2129
    iput-object v2, v0, Lcom/appsflyer/internal/i;->AFVersionDeclaration:Ljava/lang/String;

    .line 1040
    iget-object v2, p0, Lcom/appsflyer/internal/ac$5;->AFInAppEventParameterName:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 3089
    iput-object v2, v0, Lcom/appsflyer/internal/i;->AFInAppEventParameterName:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    .line 1039
    invoke-virtual {v1, v0, p1}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Lcom/appsflyer/internal/i;Landroid/app/Activity;)V

    return-void
.end method

.method public final valueOf(Landroid/content/Context;)V
    .locals 8

    const-string v0, "onBecameBackground"

    .line 1045
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 1046
    iget-object v0, p0, Lcom/appsflyer/internal/ac$5;->values:Lcom/appsflyer/internal/cl;

    .line 4088
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 4089
    iget-wide v3, v0, Lcom/appsflyer/internal/cl;->AppsFlyer2dXConversionCallback:J

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-eqz v7, :cond_1

    .line 4090
    iget-wide v3, v0, Lcom/appsflyer/internal/cl;->AppsFlyer2dXConversionCallback:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x3e8

    cmp-long v7, v1, v5

    if-lez v7, :cond_0

    cmp-long v5, v1, v3

    if-gez v5, :cond_0

    move-wide v1, v3

    .line 4095
    :cond_0
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v1, v2}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/appsflyer/internal/cl;->onDeepLinkingNative:J

    .line 4096
    iget-object v1, v0, Lcom/appsflyer/internal/cl;->valueOf:Lcom/appsflyer/internal/bv;

    iget-wide v2, v0, Lcom/appsflyer/internal/cl;->onDeepLinkingNative:J

    const-string v0, "prev_session_dur"

    invoke-interface {v1, v0, v2, v3}, Lcom/appsflyer/internal/bv;->AFKeystoreWrapper(Ljava/lang/String;J)V

    goto :goto_0

    :cond_1
    const-string v0, "Metrics: fg ts is missing"

    .line 4098
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    :goto_0
    const-string v0, "callStatsBackground background call"

    .line 1047
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 1048
    iget-object v0, p0, Lcom/appsflyer/internal/ac$5;->valueOf:Lcom/appsflyer/internal/ac;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/lang/ref/WeakReference;)V

    .line 1049
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    .line 1050
    invoke-virtual {v0}, Lcom/appsflyer/internal/ak;->AFVersionDeclaration()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1051
    invoke-virtual {v0}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName()V

    if-eqz p1, :cond_2

    .line 1052
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v1

    invoke-virtual {v1}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v1

    if-nez v1, :cond_2

    .line 1053
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 1054
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 1055
    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/internal/ak;->AFInAppEventType(Ljava/lang/String;Landroid/content/pm/PackageManager;)V

    .line 1057
    :cond_2
    invoke-virtual {v0}, Lcom/appsflyer/internal/ak;->values()V

    goto :goto_1

    :cond_3
    const-string v0, "RD status is OFF"

    .line 1059
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 5046
    :goto_1
    sget-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    if-nez v0, :cond_4

    .line 5047
    new-instance v0, Lcom/appsflyer/internal/k;

    invoke-direct {v0}, Lcom/appsflyer/internal/k;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 5049
    :cond_4
    sget-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 5096
    :try_start_0
    iget-object v1, v0, Lcom/appsflyer/internal/k;->AFKeystoreWrapper:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-static {v1}, Lcom/appsflyer/internal/k;->valueOf(Ljava/util/concurrent/ExecutorService;)V

    .line 5098
    iget-object v1, v0, Lcom/appsflyer/internal/k;->AFInAppEventParameterName:Ljava/util/concurrent/Executor;

    instance-of v1, v1, Ljava/util/concurrent/ThreadPoolExecutor;

    if-eqz v1, :cond_5

    .line 5099
    iget-object v0, v0, Lcom/appsflyer/internal/k;->AFInAppEventParameterName:Ljava/util/concurrent/Executor;

    check-cast v0, Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-static {v0}, Lcom/appsflyer/internal/k;->valueOf(Ljava/util/concurrent/ExecutorService;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    const-string v1, "failed to stop Executors"

    .line 5102
    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1062
    :cond_5
    :goto_2
    invoke-static {p1}, Lcom/appsflyer/internal/w;->AFKeystoreWrapper(Landroid/content/Context;)Lcom/appsflyer/internal/w;

    move-result-object p1

    .line 5183
    iget-object v0, p1, Lcom/appsflyer/internal/w;->AFKeystoreWrapper:Landroid/os/Handler;

    iget-object p1, p1, Lcom/appsflyer/internal/w;->getLevel:Ljava/lang/Runnable;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
