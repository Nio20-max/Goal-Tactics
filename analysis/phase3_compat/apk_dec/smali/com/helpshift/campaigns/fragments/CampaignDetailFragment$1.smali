.class Lcom/helpshift/campaigns/fragments/CampaignDetailFragment$1;
.super Ljava/lang/Object;
.source "CampaignDetailFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->invalidateUiElements()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;

.field final synthetic val$buttonIndex:I


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;I)V
    .locals 0

    .line 211
    iput-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment$1;->this$0:Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;

    iput p2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment$1;->val$buttonIndex:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 214
    iget-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment$1;->this$0:Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;

    iget-object p1, p1, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    iget v0, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment$1;->val$buttonIndex:I

    iget-object v1, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment$1;->this$0:Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->buttonClicked(ILandroid/app/Activity;)V

    return-void
.end method
