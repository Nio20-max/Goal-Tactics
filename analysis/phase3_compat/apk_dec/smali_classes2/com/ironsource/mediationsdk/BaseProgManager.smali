.class public abstract Lcom/ironsource/mediationsdk/BaseProgManager;
.super Ljava/lang/Object;
.source "BaseProgManager.java"


# instance fields
.field private impressionDataListener:Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;


# direct methods
.method public constructor <init>(Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/ironsource/mediationsdk/BaseProgManager;->impressionDataListener:Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;

    return-void
.end method


# virtual methods
.method protected reportImpressionDataToPublisher(Lcom/ironsource/mediationsdk/AuctionResponseItem;Ljava/lang/String;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 29
    iget-object v0, p0, Lcom/ironsource/mediationsdk/BaseProgManager;->impressionDataListener:Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;

    if-eqz v0, :cond_0

    .line 30
    invoke-virtual {p1, p2}, Lcom/ironsource/mediationsdk/AuctionResponseItem;->getImpressionData(Ljava/lang/String;)Lcom/ironsource/mediationsdk/impressionData/ImpressionData;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 32
    sget-object p2, Lcom/ironsource/mediationsdk/logger/IronLog;->CALLBACK:Lcom/ironsource/mediationsdk/logger/IronLog;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onImpressionSuccess: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/ironsource/mediationsdk/logger/IronLog;->info(Ljava/lang/String;)V

    .line 33
    iget-object p2, p0, Lcom/ironsource/mediationsdk/BaseProgManager;->impressionDataListener:Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;

    invoke-interface {p2, p1}, Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;->onImpressionSuccess(Lcom/ironsource/mediationsdk/impressionData/ImpressionData;)V

    goto :goto_0

    .line 37
    :cond_0
    sget-object p1, Lcom/ironsource/mediationsdk/logger/IronLog;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronLog;

    const-string p2, "no auctionResponseItem or listener"

    invoke-virtual {p1, p2}, Lcom/ironsource/mediationsdk/logger/IronLog;->verbose(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setImpressionDataListener(Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;)V
    .locals 0

    .line 22
    iput-object p1, p0, Lcom/ironsource/mediationsdk/BaseProgManager;->impressionDataListener:Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;

    return-void
.end method
