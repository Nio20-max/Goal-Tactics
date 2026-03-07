.class public Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;
.super Ljava/lang/Object;
.source "AgentTypingMessageDataBinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder$ViewHolder;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public bind(Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder$ViewHolder;Z)V
    .locals 3

    if-eqz p2, :cond_0

    .line 35
    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder$ViewHolder;->typingContainer:Landroid/widget/LinearLayout;

    .line 36
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 37
    iget-object p2, p0, Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;->context:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v0, Lcom/helpshift/R$dimen;->hs__author_avatar_size:I

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    float-to-int p2, p2

    .line 38
    iget v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    :cond_0
    return-void
.end method

.method public createViewHolder(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 3

    .line 24
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/helpshift/R$layout;->hs__msg_agent_typing:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 25
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$id;->agent_typing_container:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 26
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 25
    invoke-static {v0, v1}, Lcom/helpshift/support/util/Styles;->setAdminChatBubbleColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    .line 27
    new-instance v0, Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder$ViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder$ViewHolder;-><init>(Lcom/helpshift/support/conversations/messages/AgentTypingMessageDataBinder;Landroid/view/View;)V

    return-object v0
.end method
