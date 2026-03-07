.class public Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "CampaignListAdapter.java"

# interfaces
.implements Landroid/view/View$OnCreateContextMenuListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/campaigns/adapters/CampaignListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# instance fields
.field body:Landroid/widget/TextView;

.field date:Landroid/widget/TextView;

.field icon:Landroid/widget/ImageView;

.field private presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

.field title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/widget/RelativeLayout;Lcom/helpshift/campaigns/presenters/CampaignListPresenter;)V
    .locals 1

    .line 127
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 128
    sget v0, Lcom/helpshift/R$id;->campaign_title:I

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->title:Landroid/widget/TextView;

    .line 129
    sget v0, Lcom/helpshift/R$id;->campaign_body:I

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->body:Landroid/widget/TextView;

    .line 130
    sget v0, Lcom/helpshift/R$id;->campaign_time:I

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->date:Landroid/widget/TextView;

    .line 131
    sget v0, Lcom/helpshift/R$id;->campaign_icon:I

    invoke-virtual {p1, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    .line 132
    invoke-virtual {p1, p0}, Landroid/widget/RelativeLayout;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    .line 133
    iput-object p2, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    return-void
.end method


# virtual methods
.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 1

    .line 138
    sget p2, Lcom/helpshift/R$id;->delete_campaign:I

    sget p3, Lcom/helpshift/R$string;->hs__cam_delete:I

    const/4 v0, 0x0

    invoke-interface {p1, v0, p2, v0, p3}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    .line 139
    iget-object p2, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {p0}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->getAdapterPosition()I

    move-result p3

    invoke-virtual {p2, p3}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getReadStatus(I)Z

    move-result p2

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {p0}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->getAdapterPosition()I

    move-result p3

    invoke-virtual {p2, p3}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getSeenStatus(I)Z

    move-result p2

    if-nez p2, :cond_0

    .line 140
    sget p2, Lcom/helpshift/R$id;->mark_campaign_as_read:I

    sget p3, Lcom/helpshift/R$string;->hs__cam_mark_as_read:I

    invoke-interface {p1, v0, p2, v0, p3}, Landroid/view/ContextMenu;->add(IIII)Landroid/view/MenuItem;

    :cond_0
    return-void
.end method
