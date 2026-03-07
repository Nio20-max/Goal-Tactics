.class Lcom/helpshift/campaigns/fragments/CampaignListFragment$1;
.super Ljava/lang/Object;
.source "CampaignListFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/fragments/CampaignListFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
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

    .line 65
    iput-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$1;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 68
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 69
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$1;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    iget-object v0, v0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->searchMenuItem:Landroid/view/MenuItem;

    invoke-static {v0}, Lcom/helpshift/views/HSMenuItemCompat;->isActionViewExpanded(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$1;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    iget-object v0, v0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->setCampaignClickedFromSearchResult(Z)V

    .line 71
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$1;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    iget-object v0, v0, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0, v1}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->setRetainSearchState(Z)V

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$1;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->getCampaignListFragmentListener()Lcom/helpshift/campaigns/listeners/CampaignListFragmentListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/listeners/CampaignListFragmentListener;->onCampaignClicked(Ljava/lang/String;)V

    return-void
.end method
