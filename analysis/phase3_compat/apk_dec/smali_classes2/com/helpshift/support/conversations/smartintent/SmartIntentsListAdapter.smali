.class public Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SmartIntentsListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;,
        Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SearchResultViewHolder;,
        Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$RootIntentViewHolder;,
        Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private callback:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;

.field private intentUIModels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;",
            ">;",
            "Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;",
            ")V"
        }
    .end annotation

    .line 33
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->intentUIModels:Ljava/util/List;

    .line 35
    iput-object p2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->callback:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;

    return-void
.end method


# virtual methods
.method public getItem(I)Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->intentUIModels:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;

    return-object p1
.end method

.method public getItemCount()I
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->intentUIModels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 87
    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->getItem(I)Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;->getType()Lcom/helpshift/conversation/smartintent/SmartIntentType;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/conversation/smartintent/SmartIntentType;->ordinal()I

    move-result p1

    return p1
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 26
    check-cast p1, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->onBindViewHolder(Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;I)V
    .locals 1

    .line 62
    invoke-virtual {p0, p2}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->getItem(I)Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;

    move-result-object p2

    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->callback:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;

    invoke-virtual {p1, p2, v0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;->bind(Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 26
    invoke-virtual {p0, p1, p2}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;
    .locals 3

    .line 41
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 42
    sget-object v1, Lcom/helpshift/conversation/smartintent/SmartIntentType;->ROOT_INTENT:Lcom/helpshift/conversation/smartintent/SmartIntentType;

    invoke-virtual {v1}, Lcom/helpshift/conversation/smartintent/SmartIntentType;->ordinal()I

    move-result v1

    const/4 v2, 0x0

    if-ne p2, v1, :cond_0

    .line 43
    new-instance p2, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$RootIntentViewHolder;

    sget v1, Lcom/helpshift/R$layout;->hs__list_item_smart_intent:I

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$RootIntentViewHolder;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;Landroid/view/View;)V

    return-object p2

    .line 46
    :cond_0
    sget-object v1, Lcom/helpshift/conversation/smartintent/SmartIntentType;->LEAF_INTENT:Lcom/helpshift/conversation/smartintent/SmartIntentType;

    invoke-virtual {v1}, Lcom/helpshift/conversation/smartintent/SmartIntentType;->ordinal()I

    move-result v1

    if-ne p2, v1, :cond_1

    .line 47
    new-instance p2, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;

    sget v1, Lcom/helpshift/R$layout;->hs__list_item_leaf_intent:I

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;Landroid/view/View;)V

    return-object p2

    .line 50
    :cond_1
    sget-object v1, Lcom/helpshift/conversation/smartintent/SmartIntentType;->SEARCH_INTENT:Lcom/helpshift/conversation/smartintent/SmartIntentType;

    invoke-virtual {v1}, Lcom/helpshift/conversation/smartintent/SmartIntentType;->ordinal()I

    move-result v1

    if-ne p2, v1, :cond_2

    .line 51
    new-instance p2, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SearchResultViewHolder;

    sget v1, Lcom/helpshift/R$layout;->hs__list_item_search_intent:I

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p0, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SearchResultViewHolder;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;Landroid/view/View;)V

    return-object p2

    .line 55
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown smart intent type : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public updateIntentUIModels(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;",
            ">;)V"
        }
    .end annotation

    .line 71
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->intentUIModels:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 72
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->intentUIModels:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 73
    invoke-virtual {p0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;->notifyDataSetChanged()V

    return-void
.end method
