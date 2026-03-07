.class public Lcom/helpshift/campaigns/network/InboxNetworkManager;
.super Ljava/lang/Object;
.source "InboxNetworkManager.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field private dataProvider:Lcom/helpshift/network/NetworkDataProvider;

.field private requestQueue:Lcom/helpshift/network/request/RequestQueue;


# direct methods
.method public constructor <init>(Lcom/helpshift/campaigns/controllers/InboxSyncController;Lcom/helpshift/network/request/RequestQueue;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/helpshift/campaigns/network/InboxNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    .line 21
    iput-object p2, p0, Lcom/helpshift/campaigns/network/InboxNetworkManager;->requestQueue:Lcom/helpshift/network/request/RequestQueue;

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 26
    invoke-virtual {p0}, Lcom/helpshift/campaigns/network/InboxNetworkManager;->fetchCampaigns()Ljava/util/concurrent/Future;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 32
    :cond_0
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    .line 33
    instance-of v1, v0, Lcom/helpshift/network/errors/NetworkError;

    if-nez v1, :cond_1

    return-object v0

    .line 34
    :cond_1
    check-cast v0, Lcom/helpshift/network/errors/NetworkError;

    throw v0
.end method

.method public fetchCampaigns()Ljava/util/concurrent/Future;
    .locals 2

    .line 46
    iget-object v0, p0, Lcom/helpshift/campaigns/network/InboxNetworkManager;->dataProvider:Lcom/helpshift/network/NetworkDataProvider;

    invoke-interface {v0}, Lcom/helpshift/network/NetworkDataProvider;->getRequest()Lcom/helpshift/network/request/Request;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 48
    iget-object v1, p0, Lcom/helpshift/campaigns/network/InboxNetworkManager;->requestQueue:Lcom/helpshift/network/request/RequestQueue;

    invoke-virtual {v1, v0}, Lcom/helpshift/network/request/RequestQueue;->add(Lcom/helpshift/network/request/Request;)Ljava/util/concurrent/Future;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method
