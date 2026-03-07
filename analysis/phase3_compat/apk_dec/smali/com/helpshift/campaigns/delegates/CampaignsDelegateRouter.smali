.class public Lcom/helpshift/campaigns/delegates/CampaignsDelegateRouter;
.super Ljava/lang/Object;
.source "CampaignsDelegateRouter.java"


# static fields
.field private static delegate:Lcom/helpshift/campaigns/Campaigns$Delegate;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static sessionBegan()V
    .locals 1

    .line 18
    sget-object v0, Lcom/helpshift/campaigns/delegates/CampaignsDelegateRouter;->delegate:Lcom/helpshift/campaigns/Campaigns$Delegate;

    if-eqz v0, :cond_0

    .line 19
    invoke-interface {v0}, Lcom/helpshift/campaigns/Campaigns$Delegate;->sessionBegan()V

    :cond_0
    return-void
.end method

.method public static sessionEnded()V
    .locals 1

    .line 24
    sget-object v0, Lcom/helpshift/campaigns/delegates/CampaignsDelegateRouter;->delegate:Lcom/helpshift/campaigns/Campaigns$Delegate;

    if-eqz v0, :cond_0

    .line 25
    invoke-interface {v0}, Lcom/helpshift/campaigns/Campaigns$Delegate;->sessionEnded()V

    :cond_0
    return-void
.end method

.method public static setDelegate(Lcom/helpshift/campaigns/Campaigns$Delegate;)V
    .locals 0

    .line 14
    sput-object p0, Lcom/helpshift/campaigns/delegates/CampaignsDelegateRouter;->delegate:Lcom/helpshift/campaigns/Campaigns$Delegate;

    return-void
.end method
