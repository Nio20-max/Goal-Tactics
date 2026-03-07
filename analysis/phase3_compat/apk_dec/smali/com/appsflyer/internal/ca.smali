.class public final Lcom/appsflyer/internal/ca;
.super Ljava/lang/Object;
.source ""


# instance fields
.field public final AFInAppEventType:Lcom/appsflyer/internal/be;

.field private valueOf:Z

.field values:Ljava/util/Map;
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
.method public constructor <init>(Lcom/appsflyer/internal/be;)V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 21
    iput-boolean v0, p0, Lcom/appsflyer/internal/ca;->valueOf:Z

    .line 26
    iput-object p1, p0, Lcom/appsflyer/internal/ca;->AFInAppEventType:Lcom/appsflyer/internal/be;

    return-void
.end method

.method private valueOf()Z
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/appsflyer/internal/ca;->values:Ljava/util/Map;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public final AFInAppEventParameterName()Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 58
    invoke-direct {p0}, Lcom/appsflyer/internal/ca;->valueOf()Z

    move-result v1

    const-string v2, "lvl"

    if-eqz v1, :cond_0

    .line 59
    iget-object v1, p0, Lcom/appsflyer/internal/ca;->values:Ljava/util/Map;

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 60
    :cond_0
    iget-boolean v1, p0, Lcom/appsflyer/internal/ca;->valueOf:Z

    if-eqz v1, :cond_1

    .line 61
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/appsflyer/internal/ca;->values:Ljava/util/Map;

    const-string v3, "error"

    const-string v4, "operation timed out."

    .line 62
    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    iget-object v1, p0, Lcom/appsflyer/internal/ca;->values:Ljava/util/Map;

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    :goto_0
    return-object v0
.end method

.method public final AFInAppEventType()Z
    .locals 1

    .line 73
    iget-boolean v0, p0, Lcom/appsflyer/internal/ca;->valueOf:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/appsflyer/internal/ca;->valueOf()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final values()Z
    .locals 13

    const-string v0, "com.appsflyer.lvl.AppsFlyerLVL"

    const/4 v1, 0x0

    .line 90
    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 91
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 92
    new-instance v4, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v4}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v4, p0, Lcom/appsflyer/internal/ca;->values:Ljava/util/Map;

    .line 93
    iget-object v4, p0, Lcom/appsflyer/internal/ca;->AFInAppEventType:Lcom/appsflyer/internal/be;

    .line 1024
    iget-object v4, v4, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 93
    new-instance v5, Lcom/appsflyer/internal/ca$2;

    invoke-direct {v5, p0, v2, v3}, Lcom/appsflyer/internal/ca$2;-><init>(Lcom/appsflyer/internal/ca;J)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4

    const/4 v6, 0x1

    .line 2019
    :try_start_1
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v7, "com.appsflyer.lvl.AppsFlyerLVL$resultListener"

    .line 2020
    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const-string v8, "checkLicense"

    const/4 v9, 0x3

    new-array v10, v9, [Ljava/lang/Class;

    .line 2022
    sget-object v11, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v11, v10, v1

    const-class v11, Landroid/content/Context;

    aput-object v11, v10, v6

    const/4 v11, 0x2

    aput-object v7, v10, v11

    invoke-virtual {v0, v8, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 2024
    new-instance v8, Lcom/appsflyer/internal/bz$2;

    invoke-direct {v8, v5}, Lcom/appsflyer/internal/bz$2;-><init>(Lcom/appsflyer/internal/bz$c;)V

    .line 2071
    invoke-virtual {v7}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v10

    new-array v12, v6, [Ljava/lang/Class;

    aput-object v7, v12, v1

    invoke-static {v10, v12, v8}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v7

    const/4 v8, 0x0

    new-array v9, v9, [Ljava/lang/Object;

    .line 2072
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v9, v1

    aput-object v4, v9, v6

    aput-object v7, v9, v11

    invoke-virtual {v0, v8, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 2088
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v5, v2, v0}, Lcom/appsflyer/internal/bz$c;->AFKeystoreWrapper(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    :catch_1
    move-exception v0

    .line 2084
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v5, v2, v0}, Lcom/appsflyer/internal/bz$c;->AFKeystoreWrapper(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    :catch_2
    move-exception v0

    .line 2080
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v5, v2, v0}, Lcom/appsflyer/internal/bz$c;->AFKeystoreWrapper(Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    :catch_3
    move-exception v0

    .line 2076
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v5, v2, v0}, Lcom/appsflyer/internal/bz$c;->AFKeystoreWrapper(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 115
    :goto_0
    iput-boolean v6, p0, Lcom/appsflyer/internal/ca;->valueOf:Z
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_4

    goto :goto_1

    .line 117
    :catch_4
    iput-boolean v1, p0, Lcom/appsflyer/internal/ca;->valueOf:Z

    .line 119
    :goto_1
    iget-boolean v0, p0, Lcom/appsflyer/internal/ca;->valueOf:Z

    return v0
.end method
