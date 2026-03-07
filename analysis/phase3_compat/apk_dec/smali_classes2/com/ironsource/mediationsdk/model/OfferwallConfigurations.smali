.class public Lcom/ironsource/mediationsdk/model/OfferwallConfigurations;
.super Ljava/lang/Object;
.source "OfferwallConfigurations.java"


# static fields
.field private static final DEFAULT_OW_PLACEMENT_ID:I


# instance fields
.field private mDefaultOWPlacement:Lcom/ironsource/mediationsdk/model/OfferwallPlacement;

.field private mEvents:Lcom/ironsource/mediationsdk/model/ApplicationEvents;

.field private mOWPlacements:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/ironsource/mediationsdk/model/OfferwallPlacement;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/ironsource/mediationsdk/model/ApplicationEvents;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/ironsource/mediationsdk/model/OfferwallConfigurations;->mEvents:Lcom/ironsource/mediationsdk/model/ApplicationEvents;

    .line 17
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/ironsource/mediationsdk/model/OfferwallConfigurations;->mOWPlacements:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public addOfferwallPlacement(Lcom/ironsource/mediationsdk/model/OfferwallPlacement;)V
    .locals 1

    if-eqz p1, :cond_1

    .line 22
    iget-object v0, p0, Lcom/ironsource/mediationsdk/model/OfferwallConfigurations;->mOWPlacements:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    iget-object v0, p0, Lcom/ironsource/mediationsdk/model/OfferwallConfigurations;->mDefaultOWPlacement:Lcom/ironsource/mediationsdk/model/OfferwallPlacement;

    if-nez v0, :cond_0

    .line 28
    iput-object p1, p0, Lcom/ironsource/mediationsdk/model/OfferwallConfigurations;->mDefaultOWPlacement:Lcom/ironsource/mediationsdk/model/OfferwallPlacement;

    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p1}, Lcom/ironsource/mediationsdk/model/OfferwallPlacement;->getPlacementId()I

    move-result v0

    if-nez v0, :cond_1

    .line 31
    iput-object p1, p0, Lcom/ironsource/mediationsdk/model/OfferwallConfigurations;->mDefaultOWPlacement:Lcom/ironsource/mediationsdk/model/OfferwallPlacement;

    :cond_1
    :goto_0
    return-void
.end method

.method public getDefaultOfferwallPlacement()Lcom/ironsource/mediationsdk/model/OfferwallPlacement;
    .locals 4

    .line 45
    iget-object v0, p0, Lcom/ironsource/mediationsdk/model/OfferwallConfigurations;->mOWPlacements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ironsource/mediationsdk/model/OfferwallPlacement;

    .line 46
    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/model/OfferwallPlacement;->isDefault()Z

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    return-object v1

    .line 50
    :cond_1
    iget-object v0, p0, Lcom/ironsource/mediationsdk/model/OfferwallConfigurations;->mDefaultOWPlacement:Lcom/ironsource/mediationsdk/model/OfferwallPlacement;

    return-object v0
.end method

.method public getOfferWallEventsConfigurations()Lcom/ironsource/mediationsdk/model/ApplicationEvents;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/ironsource/mediationsdk/model/OfferwallConfigurations;->mEvents:Lcom/ironsource/mediationsdk/model/ApplicationEvents;

    return-object v0
.end method

.method public getOfferwallPlacement(Ljava/lang/String;)Lcom/ironsource/mediationsdk/model/OfferwallPlacement;
    .locals 3

    .line 37
    iget-object v0, p0, Lcom/ironsource/mediationsdk/model/OfferwallConfigurations;->mOWPlacements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ironsource/mediationsdk/model/OfferwallPlacement;

    .line 38
    invoke-virtual {v1}, Lcom/ironsource/mediationsdk/model/OfferwallPlacement;->getPlacementName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method
