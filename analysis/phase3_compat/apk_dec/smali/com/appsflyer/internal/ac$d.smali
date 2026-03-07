.class final Lcom/appsflyer/internal/ac$d;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/ac;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "d"
.end annotation


# instance fields
.field private final AFInAppEventType:Lcom/appsflyer/internal/i;

.field private synthetic AFKeystoreWrapper:Lcom/appsflyer/internal/ac;


# direct methods
.method private constructor <init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;)V
    .locals 0

    .line 3208
    iput-object p1, p0, Lcom/appsflyer/internal/ac$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3209
    iput-object p2, p0, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    return-void
.end method

.method synthetic constructor <init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;B)V
    .locals 0

    .line 3205
    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/ac$d;-><init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;)V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 16

    move-object/from16 v1, p0

    .line 3213
    iget-object v0, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    invoke-virtual {v0}, Lcom/appsflyer/internal/i;->valueOf()Z

    move-result v0

    .line 3215
    iget-object v2, v1, Lcom/appsflyer/internal/ac$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    invoke-virtual {v2}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 3216
    iget-object v0, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    .line 4095
    iget-object v0, v0, Lcom/appsflyer/internal/i;->AFInAppEventParameterName:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    if-eqz v0, :cond_0

    .line 3218
    sget v2, Lcom/appsflyer/attribution/RequestError;->STOP_TRACKING:I

    sget-object v3, Lcom/appsflyer/internal/ba;->values:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    :cond_0
    return-void

    .line 3233
    :cond_1
    iget-object v2, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    invoke-virtual {v2}, Lcom/appsflyer/internal/i;->values()Ljava/util/Map;

    move-result-object v2

    .line 3234
    iget-object v3, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    .line 5081
    iget-object v3, v3, Lcom/appsflyer/internal/i;->onDeepLinkingNative:Ljava/lang/String;

    .line 3235
    iget-object v4, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    .line 5187
    iget v4, v4, Lcom/appsflyer/internal/i;->onInstallConversionFailureNative:I

    .line 3236
    iget-object v5, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    .line 6058
    iget-object v9, v5, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    const/4 v5, 0x0

    new-array v6, v5, [B

    const/4 v7, 0x1

    const/4 v8, 0x2

    if-eqz v0, :cond_a

    if-gt v4, v8, :cond_a

    .line 3240
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 3241
    iget-object v10, v1, Lcom/appsflyer/internal/ac$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    invoke-virtual {v10}, Lcom/appsflyer/internal/ac;->valueOf()[Lcom/appsflyer/internal/dd;

    move-result-object v10

    array-length v11, v10

    const/4 v12, 0x0

    :goto_0
    if-ge v12, v11, :cond_6

    aget-object v13, v10, v12

    .line 3242
    instance-of v14, v13, Lcom/appsflyer/internal/cx;

    .line 3243
    sget-object v15, Lcom/appsflyer/internal/ac$9;->AFKeystoreWrapper:[I

    .line 7048
    iget-object v5, v13, Lcom/appsflyer/internal/dd;->AFInAppEventParameterName:Lcom/appsflyer/internal/dd$d;

    .line 3243
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    aget v5, v15, v5

    if-eq v5, v7, :cond_3

    if-eq v5, v8, :cond_2

    goto :goto_1

    :cond_2
    if-ne v4, v8, :cond_5

    if-nez v14, :cond_5

    .line 3256
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    const-string v14, "source"

    .line 7052
    iget-object v13, v13, Lcom/appsflyer/internal/dd;->AFKeystoreWrapper:Ljava/lang/String;

    .line 3257
    invoke-interface {v5, v14, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v13, "response"

    const-string v14, "TIMEOUT"

    .line 3258
    invoke-interface {v5, v13, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3259
    new-instance v13, Lcom/appsflyer/internal/da;

    invoke-direct {v13}, Lcom/appsflyer/internal/da;-><init>()V

    invoke-interface {v5, v13}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 3260
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    if-eqz v14, :cond_4

    const-string v5, "rfr"

    .line 3246
    move-object v14, v13

    check-cast v14, Lcom/appsflyer/internal/cx;

    iget-object v14, v14, Lcom/appsflyer/internal/cx;->valueOf:Ljava/util/Map;

    invoke-interface {v2, v5, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3247
    invoke-static {v9}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 3248
    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v14, "newGPReferrerSent"

    .line 3249
    invoke-interface {v5, v14, v7}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    .line 3250
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 3252
    :cond_4
    iget-object v5, v13, Lcom/appsflyer/internal/dd;->AFInAppEventType:Ljava/util/Map;

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5
    :goto_1
    add-int/lit8 v12, v12, 0x1

    const/4 v5, 0x0

    goto :goto_0

    .line 3265
    :cond_6
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_7

    const-string v4, "referrers"

    invoke-interface {v2, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3266
    :cond_7
    iget-object v0, v1, Lcom/appsflyer/internal/ac$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Lcom/appsflyer/internal/ac;)Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_8

    const-string v0, "fb_ddl"

    .line 3267
    iget-object v4, v1, Lcom/appsflyer/internal/ac$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    invoke-static {v4}, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper(Lcom/appsflyer/internal/ac;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v2, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3269
    :cond_8
    iget-object v0, v1, Lcom/appsflyer/internal/ac$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    invoke-static {v0}, Lcom/appsflyer/internal/ac;->valueOf(Lcom/appsflyer/internal/ac;)Lcom/appsflyer/internal/dc;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 3270
    iget-object v0, v1, Lcom/appsflyer/internal/ac$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    invoke-static {v0}, Lcom/appsflyer/internal/ac;->valueOf(Lcom/appsflyer/internal/ac;)Lcom/appsflyer/internal/dc;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/internal/dc;->AFKeystoreWrapper()Z

    move-result v0

    if-eqz v0, :cond_9

    .line 3271
    iget-object v0, v1, Lcom/appsflyer/internal/ac$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    invoke-static {v0}, Lcom/appsflyer/internal/ac;->valueOf(Lcom/appsflyer/internal/ac;)Lcom/appsflyer/internal/dc;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/internal/dc;->values()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 3272
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_a

    const-string v4, "preload_id"

    .line 3273
    invoke-interface {v2, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_9
    const-string v0, "preload_id"

    const-string/jumbo v4, "timeout"

    .line 3276
    invoke-static {v4}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v2, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3280
    :cond_a
    :goto_2
    iget-object v0, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    instance-of v0, v0, Lcom/appsflyer/internal/ck;

    if-nez v0, :cond_b

    .line 3281
    iget-object v0, v1, Lcom/appsflyer/internal/ac$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    invoke-static {v0}, Lcom/appsflyer/internal/ac;->values(Lcom/appsflyer/internal/ac;)Lcom/appsflyer/internal/bf;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/internal/bf;->init()Lcom/appsflyer/internal/ca;

    move-result-object v0

    .line 8051
    new-instance v4, Lcom/appsflyer/internal/d$d;

    iget-object v5, v0, Lcom/appsflyer/internal/ca;->AFInAppEventType:Lcom/appsflyer/internal/be;

    .line 9024
    iget-object v5, v5, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 8051
    invoke-direct {v4, v2, v5}, Lcom/appsflyer/internal/d$d;-><init>(Ljava/util/Map;Landroid/content/Context;)V

    .line 3282
    invoke-interface {v2, v4}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 3283
    invoke-virtual {v0}, Lcom/appsflyer/internal/ca;->AFInAppEventParameterName()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 3286
    :cond_b
    :try_start_0
    iget-object v0, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    instance-of v0, v0, Lcom/appsflyer/internal/ck;

    if-eqz v0, :cond_c

    const-string v0, "af_key"

    .line 3287
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_3

    :cond_c
    const-string v0, "appsflyerKey"

    .line 3288
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 3290
    :goto_3
    iget-object v4, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    .line 9129
    iput-object v0, v4, Lcom/appsflyer/internal/i;->AFVersionDeclaration:Ljava/lang/String;

    .line 3291
    monitor-enter v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 3292
    :try_start_1
    iget-object v4, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    new-array v5, v8, [Ljava/lang/Object;

    aput-object v0, v5, v7

    const/4 v0, 0x0

    aput-object v4, v5, v0

    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    move-result v4

    shr-int/lit8 v4, v4, 0x10

    add-int/lit8 v4, v4, 0x18

    invoke-static {v0, v0}, Landroid/view/KeyEvent;->getDeadChar(II)I

    move-result v10

    add-int/lit8 v10, v10, 0x30

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v11

    const-wide/16 v13, 0x0

    cmp-long v0, v11, v13

    add-int/lit16 v0, v0, 0x3774

    int-to-char v0, v0

    invoke-static {v4, v10, v0}, Lcom/appsflyer/internal/e;->AFInAppEventParameterName(IIC)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    const-string v4, "AFInAppEventType"

    new-array v8, v8, [Ljava/lang/Class;

    const-class v10, Lcom/appsflyer/internal/i;

    const/4 v11, 0x0

    aput-object v10, v8, v11

    const-class v10, Ljava/lang/String;

    aput-object v10, v8, v7

    invoke-virtual {v0, v4, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, [B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 3293
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 3294
    :try_start_4
    iget-object v0, v1, Lcom/appsflyer/internal/ac$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    iget-object v2, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    .line 9191
    iput-object v4, v2, Lcom/appsflyer/internal/i;->AFLogger$LogLevel:[B

    .line 3294
    invoke-static {v0, v2}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    return-void

    :catch_0
    move-exception v0

    move-object v12, v0

    move-object v6, v4

    goto :goto_5

    :catchall_0
    move-exception v0

    move-object v6, v4

    goto :goto_4

    :catchall_1
    move-exception v0

    .line 3292
    :try_start_5
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_d

    throw v4

    :cond_d
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception v0

    .line 3293
    :goto_4
    :try_start_6
    monitor-exit v2

    throw v0
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    :catchall_3
    move-exception v0

    .line 3316
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3317
    iget-object v2, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    .line 11095
    iget-object v2, v2, Lcom/appsflyer/internal/i;->AFInAppEventParameterName:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    if-eqz v2, :cond_e

    .line 3319
    sget v3, Lcom/appsflyer/attribution/RequestError;->NETWORK_FAILURE:I

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v3, v0}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    :cond_e
    return-void

    :catch_1
    move-exception v0

    move-object v12, v0

    :goto_5
    const-string v0, "Exception while sending request to server. "

    .line 3297
    invoke-static {v0, v12}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    if-eqz v6, :cond_f

    if-eqz v9, :cond_f

    const-string v0, "&isCachedRequest=true&timeincache="

    .line 3298
    invoke-virtual {v3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_f

    .line 3299
    iget-object v0, v1, Lcom/appsflyer/internal/ac$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    invoke-virtual {v0}, Lcom/appsflyer/internal/ac;->values()Lcom/appsflyer/internal/bg;

    move-result-object v0

    invoke-interface {v0}, Lcom/appsflyer/internal/bg;->AFVersionDeclaration()Lcom/appsflyer/internal/l;

    move-result-object v0

    new-instance v2, Lcom/appsflyer/internal/n;

    const-string v4, "6.5.4"

    invoke-direct {v2, v3, v6, v4}, Lcom/appsflyer/internal/n;-><init>(Ljava/lang/String;[BLjava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/appsflyer/internal/l;->AFInAppEventParameterName(Lcom/appsflyer/internal/n;)Ljava/lang/String;

    .line 3300
    invoke-virtual {v12}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v12}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 3302
    :cond_f
    iget-object v0, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    .line 10095
    iget-object v0, v0, Lcom/appsflyer/internal/i;->AFInAppEventParameterName:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

    if-eqz v0, :cond_10

    .line 3304
    sget v2, Lcom/appsflyer/attribution/RequestError;->NETWORK_FAILURE:I

    invoke-virtual {v12}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/appsflyer/attribution/AppsFlyerRequestListener;->onError(ILjava/lang/String;)V

    .line 3306
    :cond_10
    iget-object v6, v1, Lcom/appsflyer/internal/ac$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    iget-object v7, v1, Lcom/appsflyer/internal/ac$d;->AFInAppEventType:Lcom/appsflyer/internal/i;

    .line 10136
    iget-object v8, v7, Lcom/appsflyer/internal/i;->AFVersionDeclaration:Ljava/lang/String;

    .line 3311
    invoke-static {v9}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v10

    const/4 v11, 0x0

    .line 3306
    invoke-static/range {v6 .. v12}, Lcom/appsflyer/internal/cg;->AFInAppEventType(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;Ljava/lang/String;Landroid/content/Context;Landroid/content/SharedPreferences;Ljava/lang/Integer;Ljava/lang/Throwable;)V

    return-void
.end method
