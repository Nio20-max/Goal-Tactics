.class Lcom/helpshift/campaigns/fragments/CampaignListFragment$3;
.super Ljava/lang/Object;
.source "CampaignListFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/fragments/CampaignListFragment;->removeItem(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/fragments/CampaignListFragment;I)V
    .locals 0

    .line 182
    iput-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$3;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    iput p2, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$3;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 185
    iget-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$3;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    iget-object p1, p1, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {p1}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->undoDeletedCampaign()V

    .line 186
    iget-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$3;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    iget-object p1, p1, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->adapter:Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

    iget v0, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$3;->val$position:I

    invoke-virtual {p1, v0}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->notifyItemInserted(I)V

    .line 187
    iget-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$3;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    invoke-virtual {p1}, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->updateEmptyView()V

    return-void
.end method
