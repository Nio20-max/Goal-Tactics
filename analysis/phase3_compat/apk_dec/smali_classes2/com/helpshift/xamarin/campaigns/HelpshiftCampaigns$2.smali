.class final Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$2;
.super Ljava/lang/Object;
.source "HelpshiftCampaigns.java"

# interfaces
.implements Lcom/helpshift/campaigns/Campaigns$Delegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns;->setCampaignsDelegate(Lcom/helpshift/xamarin/campaigns/HelpshiftCampaignsDelegate;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 223
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public sessionBegan()V
    .locals 1

    .line 226
    invoke-static {}, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns;->access$000()Lcom/helpshift/xamarin/campaigns/HelpshiftCampaignsDelegate;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaignsDelegate;->sessionBegan()V

    return-void
.end method

.method public sessionEnded()V
    .locals 1

    .line 231
    invoke-static {}, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns;->access$000()Lcom/helpshift/xamarin/campaigns/HelpshiftCampaignsDelegate;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaignsDelegate;->sessionEnded()V

    return-void
.end method
