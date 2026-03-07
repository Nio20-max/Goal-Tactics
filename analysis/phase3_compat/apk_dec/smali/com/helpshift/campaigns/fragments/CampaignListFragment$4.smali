.class Lcom/helpshift/campaigns/fragments/CampaignListFragment$4;
.super Ljava/lang/Object;
.source "CampaignListFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/fragments/CampaignListFragment;->dataChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/fragments/CampaignListFragment;)V
    .locals 0

    .line 234
    iput-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$4;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 237
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$4;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    iget-object v0, v0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->adapter:Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->notifyDataSetChanged()V

    .line 238
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$4;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->updateEmptyView()V

    return-void
.end method
