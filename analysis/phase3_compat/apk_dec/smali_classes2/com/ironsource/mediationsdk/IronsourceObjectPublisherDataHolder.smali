.class public Lcom/ironsource/mediationsdk/IronsourceObjectPublisherDataHolder;
.super Ljava/lang/Object;
.source "IronsourceObjectPublisherDataHolder.java"


# instance fields
.field private impressionDataListener:Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getImpressionDataListener()Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/ironsource/mediationsdk/IronsourceObjectPublisherDataHolder;->impressionDataListener:Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;

    return-object v0
.end method

.method public setImpressionDataListener(Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;)V
    .locals 0

    .line 17
    iput-object p1, p0, Lcom/ironsource/mediationsdk/IronsourceObjectPublisherDataHolder;->impressionDataListener:Lcom/ironsource/mediationsdk/impressionData/ImpressionDataListener;

    return-void
.end method
