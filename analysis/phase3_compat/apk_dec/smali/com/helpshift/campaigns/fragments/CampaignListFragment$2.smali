.class Lcom/helpshift/campaigns/fragments/CampaignListFragment$2;
.super Lcom/google/android/material/snackbar/Snackbar$Callback;
.source "CampaignListFragment.java"


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


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/fragments/CampaignListFragment;)V
    .locals 0

    .line 190
    iput-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$2;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    invoke-direct {p0}, Lcom/google/android/material/snackbar/Snackbar$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismissed(Lcom/google/android/material/snackbar/Snackbar;I)V
    .locals 0

    .line 193
    invoke-super {p0, p1, p2}, Lcom/google/android/material/snackbar/Snackbar$Callback;->onDismissed(Lcom/google/android/material/snackbar/Snackbar;I)V

    const/4 p1, 0x1

    if-eq p2, p1, :cond_0

    const/4 p1, 0x4

    if-eq p2, p1, :cond_0

    .line 196
    iget-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignListFragment$2;->this$0:Lcom/helpshift/campaigns/fragments/CampaignListFragment;

    iget-object p1, p1, Lcom/helpshift/campaigns/fragments/CampaignListFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {p1}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->undoTimedOut()V

    :cond_0
    return-void
.end method

.method public bridge synthetic onDismissed(Ljava/lang/Object;I)V
    .locals 0

    .line 190
    check-cast p1, Lcom/google/android/material/snackbar/Snackbar;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/campaigns/fragments/CampaignListFragment$2;->onDismissed(Lcom/google/android/material/snackbar/Snackbar;I)V

    return-void
.end method
