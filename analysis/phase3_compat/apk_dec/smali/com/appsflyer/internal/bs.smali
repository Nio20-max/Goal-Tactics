.class public final Lcom/appsflyer/internal/bs;
.super Lcom/appsflyer/internal/bn;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/appsflyer/internal/bn<",
        "Lcom/appsflyer/internal/bu;",
        ">;"
    }
.end annotation


# instance fields
.field private final AFInAppEventParameterName:Lcom/appsflyer/internal/bw;

.field private final AFInAppEventType:Lcom/appsflyer/internal/aa;

.field public AFKeystoreWrapper:Lcom/appsflyer/internal/bu;

.field private final AFLogger$LogLevel:Lcom/appsflyer/internal/bd;

.field private final AFVersionDeclaration:Ljava/lang/String;

.field private final getLevel:Lcom/appsflyer/internal/cb;

.field public valueOf:Lcom/appsflyer/internal/ap;

.field private final values:Lcom/appsflyer/internal/bx;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/bw;Lcom/appsflyer/internal/aa;Lcom/appsflyer/internal/ca;Lcom/appsflyer/internal/bx;Lcom/appsflyer/internal/bd;Lcom/appsflyer/internal/cb;Ljava/lang/String;)V
    .locals 2

    .line 60
    sget-object p3, Lcom/appsflyer/internal/bt;->AFKeystoreWrapper:Lcom/appsflyer/internal/bt;

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/appsflyer/internal/bt;

    const-string v1, "UpdateRemoteConfiguration"

    invoke-direct {p0, p3, v0, v1}, Lcom/appsflyer/internal/bn;-><init>(Lcom/appsflyer/internal/bt;[Lcom/appsflyer/internal/bt;Ljava/lang/String;)V

    const/4 p3, 0x0

    .line 46
    iput-object p3, p0, Lcom/appsflyer/internal/bs;->AFKeystoreWrapper:Lcom/appsflyer/internal/bu;

    .line 61
    iput-object p1, p0, Lcom/appsflyer/internal/bs;->AFInAppEventParameterName:Lcom/appsflyer/internal/bw;

    .line 62
    iput-object p2, p0, Lcom/appsflyer/internal/bs;->AFInAppEventType:Lcom/appsflyer/internal/aa;

    .line 64
    iput-object p4, p0, Lcom/appsflyer/internal/bs;->values:Lcom/appsflyer/internal/bx;

    .line 65
    iput-object p5, p0, Lcom/appsflyer/internal/bs;->AFLogger$LogLevel:Lcom/appsflyer/internal/bd;

    .line 66
    iput-object p6, p0, Lcom/appsflyer/internal/bs;->getLevel:Lcom/appsflyer/internal/cb;

    .line 67
    iput-object p7, p0, Lcom/appsflyer/internal/bs;->AFVersionDeclaration:Ljava/lang/String;

    return-void
.end method

.method private AFInAppEventType(Ljava/lang/String;JLcom/appsflyer/internal/br;Lcom/appsflyer/internal/ao;Lcom/appsflyer/internal/cw;Ljava/lang/Throwable;)V
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Lcom/appsflyer/internal/br<",
            "*>;",
            "Lcom/appsflyer/internal/ao;",
            "Lcom/appsflyer/internal/cw;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p4

    move-object/from16 v1, p5

    move-object/from16 v2, p7

    if-eqz v0, :cond_0

    .line 14059
    iget-object v3, v0, Lcom/appsflyer/internal/br;->AFInAppEventType:Lcom/appsflyer/internal/bk;

    .line 218
    iget-wide v3, v3, Lcom/appsflyer/internal/bk;->AFKeystoreWrapper:J

    .line 15050
    iget v0, v0, Lcom/appsflyer/internal/br;->values:I

    move v12, v0

    goto :goto_0

    :cond_0
    const-wide/16 v3, 0x0

    const/4 v0, 0x0

    const/4 v12, 0x0

    .line 222
    :goto_0
    instance-of v0, v2, Lcom/appsflyer/internal/components/network/http/exceptions/HttpException;

    if-eqz v0, :cond_1

    .line 224
    invoke-virtual/range {p7 .. p7}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 225
    check-cast v2, Lcom/appsflyer/internal/components/network/http/exceptions/HttpException;

    invoke-virtual {v2}, Lcom/appsflyer/internal/components/network/http/exceptions/HttpException;->getMetrics()Lcom/appsflyer/internal/bk;

    move-result-object v2

    iget-wide v2, v2, Lcom/appsflyer/internal/bk;->AFKeystoreWrapper:J

    move-object v14, v0

    move-wide v8, v2

    goto :goto_1

    :cond_1
    move-object v14, v2

    move-wide v8, v3

    :goto_1
    if-eqz v1, :cond_2

    .line 16041
    iget-object v0, v1, Lcom/appsflyer/internal/ao;->valueOf:Ljava/lang/String;

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    :goto_2
    move-object v6, v0

    .line 232
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long v10, v0, p2

    .line 234
    new-instance v0, Lcom/appsflyer/internal/ap;

    move-object v5, v0

    move-object/from16 v7, p1

    move-object/from16 v13, p6

    invoke-direct/range {v5 .. v14}, Lcom/appsflyer/internal/ap;-><init>(Ljava/lang/String;Ljava/lang/String;JJILcom/appsflyer/internal/cw;Ljava/lang/Throwable;)V

    move-object v1, p0

    iput-object v0, v1, Lcom/appsflyer/internal/bs;->valueOf:Lcom/appsflyer/internal/ap;

    return-void
.end method

.method private AFKeystoreWrapper()Lcom/appsflyer/internal/bu;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/InterruptedIOException;
        }
    .end annotation

    move-object/from16 v9, p0

    const-string v0, " seconds"

    .line 117
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 118
    iget-object v1, v9, Lcom/appsflyer/internal/bs;->AFVersionDeclaration:Ljava/lang/String;

    .line 2034
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v2

    invoke-virtual {v2}, Lcom/appsflyer/AppsFlyerProperties;->getDevKey()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    const-string v6, "CFG: Dev key is not set, SDK is not started."

    if-eqz v2, :cond_2

    .line 1249
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_0

    goto :goto_0

    :cond_0
    if-nez v1, :cond_1

    const-string v1, "CFG: Can\'t create CDN token, domain or version is not provided."

    .line 1254
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/String;

    const-string v8, "appsflyersdk.com"

    aput-object v8, v7, v5

    aput-object v1, v7, v4

    .line 1258
    iget-object v1, v9, Lcom/appsflyer/internal/bs;->AFInAppEventType:Lcom/appsflyer/internal/aa;

    .line 2050
    iget-object v1, v1, Lcom/appsflyer/internal/aa;->AFInAppEventParameterName:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v3

    .line 1258
    invoke-static {v7}, Lcom/appsflyer/internal/ag;->AFInAppEventParameterName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1259
    invoke-static {v1, v2}, Lcom/appsflyer/internal/ag;->valueOf(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object v13, v1

    goto :goto_2

    .line 1250
    :cond_2
    :goto_0
    invoke-static {v6}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    :goto_1
    const/4 v13, 0x0

    :goto_2
    if-nez v13, :cond_3

    const-string v0, "CFG: can\'t create CDN token, skipping fetch config"

    .line 121
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    .line 122
    sget-object v0, Lcom/appsflyer/internal/bu;->AFInAppEventType:Lcom/appsflyer/internal/bu;

    return-object v0

    .line 125
    :cond_3
    :try_start_0
    iget-object v1, v9, Lcom/appsflyer/internal/bs;->getLevel:Lcom/appsflyer/internal/cb;

    invoke-virtual {v1}, Lcom/appsflyer/internal/cb;->AFInAppEventParameterName()Z

    move-result v1

    if-eqz v1, :cond_d

    const-string v1, "CFG: Cached config is expired, updating..."

    .line 126
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 127
    iget-object v1, v9, Lcom/appsflyer/internal/bs;->getLevel:Lcom/appsflyer/internal/cb;

    invoke-virtual {v1}, Lcom/appsflyer/internal/cb;->AFInAppEventType()Z

    move-result v1

    .line 2166
    iget-object v2, v9, Lcom/appsflyer/internal/bs;->AFLogger$LogLevel:Lcom/appsflyer/internal/bd;

    if-eqz v1, :cond_4

    .line 3089
    sget-object v1, Lcom/appsflyer/internal/bd;->AFKeystoreWrapper:Ljava/lang/String;

    goto :goto_3

    :cond_4
    sget-object v1, Lcom/appsflyer/internal/bd;->values:Ljava/lang/String;

    :goto_3
    new-array v4, v4, [Ljava/lang/Object;

    aput-object v13, v4, v5

    .line 3090
    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 3091
    new-instance v4, Lcom/appsflyer/internal/z;

    const-string v5, "GET"

    invoke-direct {v4, v1, v5}, Lcom/appsflyer/internal/z;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v1, 0x1f4

    .line 4080
    iput v1, v4, Lcom/appsflyer/internal/z;->valueOf:I

    .line 3096
    new-instance v1, Lcom/appsflyer/internal/bp;

    invoke-direct {v1}, Lcom/appsflyer/internal/bp;-><init>()V

    .line 4133
    invoke-virtual {v2}, Lcom/appsflyer/internal/bd;->AFInAppEventType()Z

    move-result v5

    .line 5107
    iput-boolean v5, v4, Lcom/appsflyer/internal/z;->AFInAppEventParameterName:Z

    .line 4134
    iget-object v2, v2, Lcom/appsflyer/internal/bd;->AFInAppEventType:Lcom/appsflyer/internal/ab;

    .line 6021
    new-instance v5, Lcom/appsflyer/internal/bl;

    iget-object v7, v2, Lcom/appsflyer/internal/ab;->AFKeystoreWrapper:Ljava/util/concurrent/ExecutorService;

    iget-object v2, v2, Lcom/appsflyer/internal/ab;->valueOf:Lcom/appsflyer/internal/bm;

    invoke-direct {v5, v4, v7, v2, v1}, Lcom/appsflyer/internal/bl;-><init>(Lcom/appsflyer/internal/z;Ljava/util/concurrent/ExecutorService;Lcom/appsflyer/internal/bm;Lcom/appsflyer/internal/bq;)V

    .line 2166
    invoke-virtual {v5}, Lcom/appsflyer/internal/bl;->AFKeystoreWrapper()Lcom/appsflyer/internal/br;

    move-result-object v14

    .line 2168
    invoke-virtual {v14}, Lcom/appsflyer/internal/br;->values()Z

    move-result v1

    if-eqz v1, :cond_c

    .line 6046
    iget-object v1, v14, Lcom/appsflyer/internal/br;->valueOf:Ljava/lang/Object;

    .line 2169
    check-cast v1, Lcom/appsflyer/internal/ao;

    const-string/jumbo v2, "x-amz-meta-af-auth-v1"

    .line 7064
    iget-object v4, v14, Lcom/appsflyer/internal/br;->AFInAppEventParameterName:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_5
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-eqz v5, :cond_5

    .line 7070
    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 7071
    iget-object v2, v14, Lcom/appsflyer/internal/br;->AFInAppEventParameterName:Ljava/util/Map;

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    goto :goto_4

    :cond_6
    const/4 v2, 0x0

    :goto_4
    if-eqz v2, :cond_8

    .line 6080
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_8

    .line 6081
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 6082
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6083
    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    const-string v5, ", "

    .line 6084
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 6086
    :cond_7
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_6

    :cond_8
    const/4 v2, 0x0

    .line 8034
    :goto_6
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v4

    invoke-virtual {v4}, Lcom/appsflyer/AppsFlyerProperties;->getDevKey()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_b

    .line 2172
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_9

    goto/16 :goto_7

    .line 2176
    :cond_9
    iget-object v5, v9, Lcom/appsflyer/internal/bs;->AFInAppEventParameterName:Lcom/appsflyer/internal/bw;

    invoke-virtual {v5, v1, v2, v13, v4}, Lcom/appsflyer/internal/bw;->AFKeystoreWrapper(Lcom/appsflyer/internal/ao;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/internal/ay;

    move-result-object v2

    .line 2178
    invoke-virtual {v2}, Lcom/appsflyer/internal/ay;->AFInAppEventParameterName()Z

    move-result v4

    if-eqz v4, :cond_a

    .line 2179
    iget-object v4, v9, Lcom/appsflyer/internal/bs;->getLevel:Lcom/appsflyer/internal/cb;

    invoke-virtual {v4}, Lcom/appsflyer/internal/cb;->valueOf()J

    move-result-wide v4

    .line 2180
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "CFG: using max-age fallback: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    .line 2181
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 2182
    iget-object v8, v9, Lcom/appsflyer/internal/bs;->values:Lcom/appsflyer/internal/bx;

    .line 9046
    iget-object v15, v1, Lcom/appsflyer/internal/ao;->AFInAppEventParameterName:Ljava/lang/String;

    .line 8091
    sget-object v12, Lcom/appsflyer/internal/bx;->AFInAppEventParameterName:Ljava/nio/charset/Charset;

    invoke-virtual {v15, v12}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v12

    .line 8092
    invoke-static {v12, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v3

    .line 8093
    iget-object v12, v8, Lcom/appsflyer/internal/bx;->AFKeystoreWrapper:Lcom/appsflyer/internal/bv;

    const-string v15, "af_remote_config"

    invoke-interface {v12, v15, v3}, Lcom/appsflyer/internal/bv;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;)V

    .line 8046
    iget-object v3, v8, Lcom/appsflyer/internal/bx;->AFKeystoreWrapper:Lcom/appsflyer/internal/bv;

    const-string v12, "af_rc_timestamp"

    invoke-interface {v3, v12, v6, v7}, Lcom/appsflyer/internal/bv;->AFKeystoreWrapper(Ljava/lang/String;J)V

    .line 8047
    iget-object v3, v8, Lcom/appsflyer/internal/bx;->AFKeystoreWrapper:Lcom/appsflyer/internal/bv;

    const-string v12, "af_rc_max_age"

    invoke-interface {v3, v12, v4, v5}, Lcom/appsflyer/internal/bv;->AFKeystoreWrapper(Ljava/lang/String;J)V

    .line 8048
    iput-object v1, v8, Lcom/appsflyer/internal/bx;->values:Lcom/appsflyer/internal/ao;

    .line 8049
    iput-wide v6, v8, Lcom/appsflyer/internal/bx;->AFInAppEventType:J

    .line 8050
    iput-wide v4, v8, Lcom/appsflyer/internal/bx;->valueOf:J

    .line 2183
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "CFG: Config successfully updated, timeToLive: "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 10024
    iget-object v7, v2, Lcom/appsflyer/internal/ay;->AFInAppEventType:Lcom/appsflyer/internal/cw;

    .line 11046
    iget-object v0, v14, Lcom/appsflyer/internal/br;->valueOf:Ljava/lang/Object;

    .line 10203
    move-object v6, v0

    check-cast v6, Lcom/appsflyer/internal/ao;

    const/4 v8, 0x0

    move-object/from16 v1, p0

    move-object v2, v13

    move-wide v3, v10

    move-object v5, v14

    .line 10205
    invoke-direct/range {v1 .. v8}, Lcom/appsflyer/internal/bs;->AFInAppEventType(Ljava/lang/String;JLcom/appsflyer/internal/br;Lcom/appsflyer/internal/ao;Lcom/appsflyer/internal/cw;Ljava/lang/Throwable;)V

    .line 2185
    sget-object v0, Lcom/appsflyer/internal/bu;->AFKeystoreWrapper:Lcom/appsflyer/internal/bu;

    return-object v0

    .line 12024
    :cond_a
    iget-object v7, v2, Lcom/appsflyer/internal/ay;->AFInAppEventType:Lcom/appsflyer/internal/cw;

    .line 13046
    iget-object v0, v14, Lcom/appsflyer/internal/br;->valueOf:Ljava/lang/Object;

    .line 12203
    move-object v6, v0

    check-cast v6, Lcom/appsflyer/internal/ao;

    const/4 v8, 0x0

    move-object/from16 v1, p0

    move-object v2, v13

    move-wide v3, v10

    move-object v5, v14

    .line 12205
    invoke-direct/range {v1 .. v8}, Lcom/appsflyer/internal/bs;->AFInAppEventType(Ljava/lang/String;JLcom/appsflyer/internal/br;Lcom/appsflyer/internal/ao;Lcom/appsflyer/internal/cw;Ljava/lang/Throwable;)V

    const-string v0, "CFG: fetched config is not valid (MITM?) refuse to use it."

    .line 2188
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    .line 2189
    sget-object v0, Lcom/appsflyer/internal/bu;->AFInAppEventType:Lcom/appsflyer/internal/bu;

    return-object v0

    .line 2173
    :cond_b
    :goto_7
    invoke-static {v6}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    .line 2174
    sget-object v0, Lcom/appsflyer/internal/bu;->AFInAppEventType:Lcom/appsflyer/internal/bu;

    return-object v0

    :cond_c
    const/4 v7, 0x0

    .line 14046
    iget-object v0, v14, Lcom/appsflyer/internal/br;->valueOf:Ljava/lang/Object;

    .line 13203
    move-object v6, v0

    check-cast v6, Lcom/appsflyer/internal/ao;

    const/4 v8, 0x0

    move-object/from16 v1, p0

    move-object v2, v13

    move-wide v3, v10

    move-object v5, v14

    .line 13205
    invoke-direct/range {v1 .. v8}, Lcom/appsflyer/internal/bs;->AFInAppEventType(Ljava/lang/String;JLcom/appsflyer/internal/br;Lcom/appsflyer/internal/ao;Lcom/appsflyer/internal/cw;Ljava/lang/Throwable;)V

    .line 2193
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CFG: failed to fetch remote config from CDN with status code: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14050
    iget v1, v14, Lcom/appsflyer/internal/br;->values:I

    .line 2193
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    .line 2194
    sget-object v0, Lcom/appsflyer/internal/bu;->AFInAppEventType:Lcom/appsflyer/internal/bu;

    return-object v0

    :cond_d
    const-string v0, "CFG: active config is valid, skipping fetch"

    .line 130
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 131
    sget-object v0, Lcom/appsflyer/internal/bu;->valueOf:Lcom/appsflyer/internal/bu;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v0

    .line 148
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "CFG: failed to update remote config: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v1, p0

    move-object v2, v13

    move-wide v3, v10

    move-object v8, v0

    .line 149
    invoke-direct/range {v1 .. v8}, Lcom/appsflyer/internal/bs;->AFInAppEventType(Ljava/lang/String;JLcom/appsflyer/internal/br;Lcom/appsflyer/internal/ao;Lcom/appsflyer/internal/cw;Ljava/lang/Throwable;)V

    .line 150
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Ljava/lang/InterruptedException;

    if-nez v1, :cond_e

    .line 153
    sget-object v0, Lcom/appsflyer/internal/bu;->AFInAppEventType:Lcom/appsflyer/internal/bu;

    return-object v0

    .line 151
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    check-cast v0, Ljava/lang/InterruptedException;

    throw v0

    :catch_0
    move-exception v0

    .line 134
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "CFG: failed to fetch remote config: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 137
    instance-of v1, v0, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;

    if-eqz v1, :cond_f

    .line 138
    move-object v1, v0

    check-cast v1, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;

    invoke-virtual {v1}, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;->getRawResponse()Lcom/appsflyer/internal/br;

    move-result-object v1

    move-object v5, v1

    goto :goto_8

    :cond_f
    const/4 v5, 0x0

    :goto_8
    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v1, p0

    move-object v2, v13

    move-wide v3, v10

    move-object v8, v0

    .line 140
    invoke-direct/range {v1 .. v8}, Lcom/appsflyer/internal/bs;->AFInAppEventType(Ljava/lang/String;JLcom/appsflyer/internal/br;Lcom/appsflyer/internal/ao;Lcom/appsflyer/internal/cw;Ljava/lang/Throwable;)V

    .line 142
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    instance-of v1, v1, Ljava/io/InterruptedIOException;

    if-nez v1, :cond_10

    .line 145
    sget-object v0, Lcom/appsflyer/internal/bu;->AFInAppEventType:Lcom/appsflyer/internal/bu;

    return-object v0

    .line 143
    :cond_10
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    check-cast v0, Ljava/io/InterruptedIOException;

    throw v0
.end method


# virtual methods
.method public final values()Lcom/appsflyer/internal/bo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 82
    :try_start_0
    invoke-direct {p0}, Lcom/appsflyer/internal/bs;->AFKeystoreWrapper()Lcom/appsflyer/internal/bu;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/internal/bs;->AFKeystoreWrapper:Lcom/appsflyer/internal/bu;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    sget-object v1, Lcom/appsflyer/internal/bu;->AFInAppEventType:Lcom/appsflyer/internal/bu;

    if-ne v0, v1, :cond_0

    .line 88
    sget-object v0, Lcom/appsflyer/internal/bo;->AFInAppEventParameterName:Lcom/appsflyer/internal/bo;

    return-object v0

    .line 90
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/bo;->AFKeystoreWrapper:Lcom/appsflyer/internal/bo;

    return-object v0

    .line 84
    :catch_0
    sget-object v0, Lcom/appsflyer/internal/bu;->AFInAppEventType:Lcom/appsflyer/internal/bu;

    iput-object v0, p0, Lcom/appsflyer/internal/bs;->AFKeystoreWrapper:Lcom/appsflyer/internal/bu;

    .line 85
    sget-object v0, Lcom/appsflyer/internal/bo;->valueOf:Lcom/appsflyer/internal/bo;

    return-object v0
.end method
