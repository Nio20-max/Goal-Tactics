.class public Lcom/helpshift/campaigns/adapters/CampaignListAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "CampaignListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private menuItemPosition:I

.field private onClickListener:Landroid/view/View$OnClickListener;

.field private presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;


# direct methods
.method public constructor <init>(Lcom/helpshift/campaigns/presenters/CampaignListPresenter;Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    .line 31
    iput-object p2, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->onClickListener:Landroid/view/View$OnClickListener;

    const/4 p1, -0x1

    .line 32
    iput p1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->menuItemPosition:I

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getCountOfCampaigns()I

    move-result v0

    return v0
.end method

.method public getMenuItemPosition()I
    .locals 1

    .line 111
    iget v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->menuItemPosition:I

    return v0
.end method

.method public markCampaignAsRead(I)V
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0, p1}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->markCampaignAsRead(I)V

    .line 107
    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->notifyItemChanged(I)V

    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 23
    check-cast p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->onBindViewHolder(Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;I)V
    .locals 4

    .line 48
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->title:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v1, p2}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getTitle(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->body:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v1, p2}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getBody(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    iget-object v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0, p2}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getIconImage(I)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "default"

    .line 51
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "bitmap"

    .line 52
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 55
    iget-object v2, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    if-nez v1, :cond_0

    .line 57
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$attr;->hs__inboxIconBackgroundColor:I

    invoke-static {v1, v2}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v1

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    goto :goto_0

    .line 60
    :cond_0
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->icon:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$attr;->hs__inboxIconBackgroundColor:I

    .line 61
    invoke-static {v1, v2}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v1

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/widget/ImageView;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 64
    :goto_0
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->date:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v1, p2}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getTimestamp(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/helpshift/util/TimeUtil;->getSinceText(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    iget-object v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0, p2}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getReadStatus(I)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0, p2}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getSeenStatus(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 67
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->title:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$attr;->hs__inboxTitleUnreadTextColor:I

    invoke-static {v1, v2}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->title:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->title:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 69
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->date:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->context:Landroid/content/Context;

    sget v3, Lcom/helpshift/R$attr;->hs__inboxTimeStampUnreadTextColor:I

    invoke-static {v1, v3}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 70
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->date:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->date:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    goto :goto_1

    .line 73
    :cond_1
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->title:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$attr;->hs__inboxTitleTextColor:I

    invoke-static {v1, v2}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 74
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->title:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->title:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 75
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->date:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->context:Landroid/content/Context;

    sget v3, Lcom/helpshift/R$attr;->hs__inboxTimeStampTextColor:I

    invoke-static {v1, v3}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 76
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->date:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->date:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 79
    :goto_1
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->itemView:Landroid/view/View;

    new-instance v1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$1;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$1;-><init>(Lcom/helpshift/campaigns/adapters/CampaignListAdapter;Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 86
    iget-object p1, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->itemView:Landroid/view/View;

    iget-object v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0, p2}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->getCampaignId(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;
    .locals 2

    .line 37
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->context:Landroid/content/Context;

    .line 39
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lcom/helpshift/R$layout;->hs__campaign_recycler_view_item:I

    const/4 v1, 0x0

    .line 40
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    .line 41
    iget-object p2, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->onClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, p2}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    new-instance p2, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;

    iget-object v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-direct {p2, p1, v0}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;-><init>(Landroid/widget/RelativeLayout;Lcom/helpshift/campaigns/presenters/CampaignListPresenter;)V

    return-object p2
.end method

.method public bridge synthetic onViewRecycled(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .line 23
    check-cast p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;

    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->onViewRecycled(Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;)V

    return-void
.end method

.method public onViewRecycled(Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;)V
    .locals 2

    .line 96
    iget-object v0, p1, Lcom/helpshift/campaigns/adapters/CampaignListAdapter$ViewHolder;->itemView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 97
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewRecycled(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    return-void
.end method

.method public removeItem(IZ)V
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->presenter:Lcom/helpshift/campaigns/presenters/CampaignListPresenter;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/campaigns/presenters/CampaignListPresenter;->deleteRow(IZ)V

    .line 102
    invoke-virtual {p0, p1}, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->notifyItemRemoved(I)V

    return-void
.end method

.method public setMenuItemPosition(I)V
    .locals 0

    .line 115
    iput p1, p0, Lcom/helpshift/campaigns/adapters/CampaignListAdapter;->menuItemPosition:I

    return-void
.end method
