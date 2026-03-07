.class Lcom/helpshift/campaigns/fragments/CampaignDetailFragment$2;
.super Ljava/lang/Object;
.source "CampaignDetailFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->dataChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;)V
    .locals 0

    .line 230
    iput-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment$2;->this$0:Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 233
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment$2;->this$0:Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->invalidateUiElements()V

    return-void
.end method
