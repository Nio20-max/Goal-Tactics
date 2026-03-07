.class Lcom/helpshift/campaigns/adapters/CampaignListAdapter$1;
.super Ljava/lang/Object;
.source "CampaignListAdapter.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->onBindViewHolder(Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

.field final synthetic val$holder:Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/adapters/CampaignListAdapter;Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$1;->this$0:Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

    iput-object p2, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$1;->val$holder:Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 82
    iget-object p1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$1;->this$0:Lcom/helpshift/campaigns/adapters/CampaignListAdapter;

    iget-object v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$1;->val$holder:Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->getAdapterPosition()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->setMenuItemPosition(I)V

    const/4 p1, 0x0

    return p1
.end method
