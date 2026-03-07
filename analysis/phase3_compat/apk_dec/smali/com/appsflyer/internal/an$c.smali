.class public Lcom/appsflyer/internal/an$c;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/an;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field private final AFKeystoreWrapper:Lcom/appsflyer/internal/cm;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/appsflyer/internal/cm;)V
    .locals 0

    .line 1020
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1021
    iput-object p1, p0, Lcom/appsflyer/internal/an$c;->AFKeystoreWrapper:Lcom/appsflyer/internal/cm;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 4028
    invoke-virtual {p0}, Lcom/appsflyer/internal/an$c;->values()Ljava/net/HttpURLConnection;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 4029
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_0
    return-void
.end method

.method public values()Ljava/net/HttpURLConnection;
    .locals 17

    move-object/from16 v1, p0

    const-string v2, ""

    .line 1035
    iget-object v0, v1, Lcom/appsflyer/internal/an$c;->AFKeystoreWrapper:Lcom/appsflyer/internal/cm;

    .line 2081
    iget-object v3, v0, Lcom/appsflyer/internal/i;->onDeepLinkingNative:Ljava/lang/String;

    .line 1036
    iget-object v0, v1, Lcom/appsflyer/internal/an$c;->AFKeystoreWrapper:Lcom/appsflyer/internal/cm;

    .line 3047
    invoke-virtual {v0}, Lcom/appsflyer/internal/i;->values()Ljava/util/Map;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/internal/n;->AFInAppEventType(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1037
    iget-object v4, v1, Lcom/appsflyer/internal/an$c;->AFKeystoreWrapper:Lcom/appsflyer/internal/cm;

    invoke-virtual {v4}, Lcom/appsflyer/internal/cm;->AFLogger$LogLevel()Z

    move-result v4

    .line 1038
    iget-object v5, v1, Lcom/appsflyer/internal/an$c;->AFKeystoreWrapper:Lcom/appsflyer/internal/cm;

    invoke-virtual {v5}, Lcom/appsflyer/internal/cm;->AppsFlyer2dXConversionCallback()Z

    move-result v5

    .line 1039
    iget-object v6, v1, Lcom/appsflyer/internal/an$c;->AFKeystoreWrapper:Lcom/appsflyer/internal/cm;

    invoke-virtual {v6}, Lcom/appsflyer/internal/cm;->getLevel()Z

    move-result v6

    .line 1040
    iget-object v7, v1, Lcom/appsflyer/internal/an$c;->AFKeystoreWrapper:Lcom/appsflyer/internal/cm;

    invoke-virtual {v7}, Lcom/appsflyer/internal/i;->AFInAppEventType()Z

    move-result v7

    .line 1044
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    const/4 v9, 0x0

    if-eqz v4, :cond_0

    return-object v9

    :cond_0
    const/4 v4, 0x0

    const/4 v10, 0x1

    .line 1050
    :try_start_0
    new-instance v11, Ljava/net/URL;

    invoke-direct {v11, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    if-eqz v6, :cond_2

    .line 1052
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v12

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13, v0}, Lcom/appsflyer/internal/ak;->AFInAppEventType(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "UTF-8"

    .line 1053
    invoke-virtual {v0, v12}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v12

    array-length v12, v12

    .line 1054
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "call = "

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v14, "; size = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, " byte"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-le v12, v10, :cond_1

    const-string v12, "s"

    goto :goto_0

    :cond_1
    move-object v12, v2

    :goto_0
    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, "; body = "

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/internal/ai;->AFKeystoreWrapper(Ljava/lang/String;)V

    :cond_2
    const-string v0, "AppsFlyer"

    .line 1058
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    .line 1059
    invoke-virtual {v11}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Ljava/net/HttpURLConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    const/16 v0, 0x7530

    .line 1060
    :try_start_1
    invoke-virtual {v12, v0}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 1061
    invoke-virtual {v12, v0}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    const-string v0, "POST"

    .line 1062
    invoke-virtual {v12, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 1063
    invoke-virtual {v12, v10}, Ljava/net/URLConnection;->setDoInput(Z)V

    .line 1064
    invoke-virtual {v12, v10}, Ljava/net/URLConnection;->setDoOutput(Z)V

    const-string v0, "Content-Type"

    if-eqz v7, :cond_3

    const-string v13, "application/octet-stream"

    goto :goto_1

    :cond_3
    const-string v13, "application/json"

    .line 1065
    :goto_1
    invoke-virtual {v12, v0, v13}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1067
    invoke-virtual {v12}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    if-eqz v7, :cond_6

    .line 1068
    iget-object v7, v1, Lcom/appsflyer/internal/an$c;->AFKeystoreWrapper:Lcom/appsflyer/internal/cm;

    .line 3136
    iget-object v7, v7, Lcom/appsflyer/internal/i;->AFVersionDeclaration:Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    :try_start_2
    new-array v13, v10, [Ljava/lang/Object;

    aput-object v7, v13, v4

    .line 1068
    invoke-static {}, Landroid/view/ViewConfiguration;->getKeyRepeatDelay()I

    move-result v7

    shr-int/lit8 v7, v7, 0x10

    add-int/lit8 v7, v7, 0x18

    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollDefaultDelay()I

    move-result v14

    shr-int/lit8 v14, v14, 0x10

    add-int/lit8 v14, v14, 0x18

    const/4 v15, 0x0

    invoke-static {v15, v15}, Landroid/graphics/PointF;->length(FF)F

    move-result v16

    cmpl-float v15, v16, v15

    int-to-char v15, v15

    invoke-static {v7, v14, v15}, Lcom/appsflyer/internal/e;->AFInAppEventParameterName(IIC)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Class;

    const-string v14, "AFInAppEventParameterName"

    new-array v15, v10, [Ljava/lang/Class;

    const-class v16, Ljava/lang/String;

    aput-object v16, v15, v4

    invoke-virtual {v7, v14, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    invoke-virtual {v7, v9, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :try_start_3
    new-array v9, v10, [Ljava/lang/Object;

    aput-object v8, v9, v4

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v8

    shr-int/lit8 v8, v8, 0x10

    rsub-int/lit8 v8, v8, 0x18

    invoke-static {v2}, Landroid/os/Process;->getGidForName(Ljava/lang/String;)I

    move-result v13

    rsub-int/lit8 v13, v13, 0x17

    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    move-result v14

    shr-int/lit8 v14, v14, 0x10

    int-to-char v14, v14

    invoke-static {v8, v13, v14}, Lcom/appsflyer/internal/e;->AFInAppEventParameterName(IIC)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Class;

    const-string/jumbo v13, "values"

    new-array v14, v10, [Ljava/lang/Class;

    const-class v15, [B

    aput-object v15, v14, v4

    invoke-virtual {v8, v13, v14}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-virtual {v8, v7, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object v8, v7

    check-cast v8, [B
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception v0

    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_4

    throw v4

    :cond_4
    throw v0

    :catchall_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_5

    throw v4

    :cond_5
    throw v0

    :cond_6
    :goto_2
    invoke-virtual {v0, v8}, Ljava/io/OutputStream;->write([B)V

    .line 1069
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 1070
    invoke-virtual {v12}, Ljava/net/URLConnection;->connect()V

    .line 1072
    invoke-virtual {v12}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    if-eqz v5, :cond_7

    .line 1074
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    invoke-static {v12}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v2

    :cond_7
    if-eqz v6, :cond_8

    .line 1077
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v5

    invoke-virtual {v11}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v0, v2}, Lcom/appsflyer/internal/ak;->values(Ljava/lang/String;ILjava/lang/String;)V

    :cond_8
    const/16 v5, 0xc8

    if-ne v0, v5, :cond_9

    const-string v0, "Status 200 ok"

    .line 1081
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_4

    :catchall_2
    move-exception v0

    move-object v9, v12

    goto :goto_3

    :catchall_3
    move-exception v0

    .line 1086
    :goto_3
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "Error while calling "

    invoke-virtual {v4, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object v12, v9

    :cond_9
    const/4 v4, 0x1

    .line 1089
    :goto_4
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "Connection "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v4, :cond_a

    const-string v3, "error"

    goto :goto_5

    :cond_a
    const-string v3, "call succeeded"

    :goto_5
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    return-object v12
.end method
