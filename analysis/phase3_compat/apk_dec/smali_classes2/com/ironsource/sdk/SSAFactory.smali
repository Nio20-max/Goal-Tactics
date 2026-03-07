.class public Lcom/ironsource/sdk/SSAFactory;
.super Ljava/lang/Object;
.source "SSAFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAdvertiserInstance()Lcom/ironsource/sdk/SSAAdvertiser;
    .locals 1

    .line 29
    invoke-static {}, Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;->getInstance()Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;

    move-result-object v0

    return-object v0
.end method

.method public static getPublisherInstance(Landroid/app/Activity;)Lcom/ironsource/sdk/SSAPublisher;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 12
    invoke-static {p0}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getInstance(Landroid/app/Activity;)Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    move-result-object p0

    return-object p0
.end method

.method public static getPublisherTestInstance(Landroid/app/Activity;)Lcom/ironsource/sdk/SSAPublisher;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$DebugMode;->MODE_2:Lcom/ironsource/sdk/data/SSAEnums$DebugMode;

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAEnums$DebugMode;->getValue()I

    move-result v0

    invoke-static {p0, v0}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getInstance(Landroid/app/Activity;I)Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    move-result-object p0

    return-object p0
.end method

.method public static getPublisherTestInstance(Landroid/app/Activity;I)Lcom/ironsource/sdk/SSAPublisher;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    invoke-static {p0, p1}, Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;->getInstance(Landroid/app/Activity;I)Lcom/ironsource/sdk/agent/IronSourceAdsPublisherAgent;

    move-result-object p0

    return-object p0
.end method
