.class public Lcom/ironsource/sdk/service/Connectivity/BroadcastReceiverStrategy;
.super Ljava/lang/Object;
.source "BroadcastReceiverStrategy.java"

# interfaces
.implements Lcom/ironsource/sdk/service/Connectivity/IConnectivity;


# instance fields
.field private mConnectionReceiver:Landroid/content/BroadcastReceiver;

.field private final mNetworkState:Lcom/ironsource/sdk/service/Connectivity/IConnectivityStatus;


# direct methods
.method public constructor <init>(Lcom/ironsource/sdk/service/Connectivity/IConnectivityStatus;)V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Lcom/ironsource/sdk/service/Connectivity/BroadcastReceiverStrategy$1;

    invoke-direct {v0, p0}, Lcom/ironsource/sdk/service/Connectivity/BroadcastReceiverStrategy$1;-><init>(Lcom/ironsource/sdk/service/Connectivity/BroadcastReceiverStrategy;)V

    iput-object v0, p0, Lcom/ironsource/sdk/service/Connectivity/BroadcastReceiverStrategy;->mConnectionReceiver:Landroid/content/BroadcastReceiver;

    .line 24
    iput-object p1, p0, Lcom/ironsource/sdk/service/Connectivity/BroadcastReceiverStrategy;->mNetworkState:Lcom/ironsource/sdk/service/Connectivity/IConnectivityStatus;

    return-void
.end method

.method static synthetic access$000(Lcom/ironsource/sdk/service/Connectivity/BroadcastReceiverStrategy;)Lcom/ironsource/sdk/service/Connectivity/IConnectivityStatus;
    .locals 0

    .line 19
    iget-object p0, p0, Lcom/ironsource/sdk/service/Connectivity/BroadcastReceiverStrategy;->mNetworkState:Lcom/ironsource/sdk/service/Connectivity/IConnectivityStatus;

    return-object p0
.end method


# virtual methods
.method public getConnectivityInfo(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 0

    .line 69
    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    return-object p1
.end method

.method public release()V
    .locals 1

    const/4 v0, 0x0

    .line 74
    iput-object v0, p0, Lcom/ironsource/sdk/service/Connectivity/BroadcastReceiverStrategy;->mConnectionReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method public startListenToNetworkChanges(Landroid/content/Context;)V
    .locals 3

    .line 45
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/sdk/service/Connectivity/BroadcastReceiverStrategy;->mConnectionReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 48
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public stopListenToNetworkChanges(Landroid/content/Context;)V
    .locals 4

    .line 56
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/sdk/service/Connectivity/BroadcastReceiverStrategy;->mConnectionReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "unregisterConnectionReceiver - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ContentValues"

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    new-instance v0, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;

    invoke-direct {v0}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;-><init>()V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://www.supersonicads.com/mobile/sdk5/log?method="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p1

    const/4 v3, 0x0

    aget-object p1, p1, v3

    invoke-virtual {p1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v3

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/utils/IronSourceAsyncHttpRequestTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :catch_1
    :goto_0
    return-void
.end method
