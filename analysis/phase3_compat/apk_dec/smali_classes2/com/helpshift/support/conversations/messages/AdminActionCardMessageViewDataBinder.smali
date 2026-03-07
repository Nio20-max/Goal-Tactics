.class public Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;
.super Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;
.source "AdminActionCardMessageViewDataBinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/helpshift/support/conversations/messages/MessageViewDataBinder<",
        "Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;",
        "Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic bind(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 0

    .line 17
    check-cast p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;

    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;->bind(Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V

    return-void
.end method

.method public bind(Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V
    .locals 8

    .line 34
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->isActionCardTitleVisible()Z

    move-result v0

    .line 37
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->actionCardImage:Landroid/widget/ImageView;

    sget v2, Lcom/helpshift/R$drawable;->hs__placeholder_image:I

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 39
    sget-object v1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$2;->$SwitchMap$com$helpshift$conversation$activeconversation$message$AdminActionCardMessageDM$ActionCardImageState:[I

    iget-object v2, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->state:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    invoke-virtual {v2}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v1, v3, :cond_1

    const/4 v4, 0x2

    if-eq v1, v4, :cond_2

    const/4 v4, 0x3

    if-eq v1, v4, :cond_0

    :goto_0
    const/4 v3, 0x0

    goto :goto_1

    :cond_0
    const/4 v2, 0x1

    goto :goto_1

    .line 42
    :cond_1
    invoke-static {}, Lcom/helpshift/support/imageloader/ImageLoader;->getInstance()Lcom/helpshift/support/imageloader/ImageLoader;

    move-result-object v1

    iget-object v4, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v4, v4, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->filePath:Ljava/lang/String;

    iget-object v5, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->actionCardImage:Landroid/widget/ImageView;

    iget-object v6, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;->context:Landroid/content/Context;

    .line 43
    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lcom/helpshift/R$drawable;->hs__placeholder_image:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 42
    invoke-virtual {v1, v4, v5, v6}, Lcom/helpshift/support/imageloader/ImageLoader;->load(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    :cond_2
    const/4 v2, 0x1

    goto :goto_0

    .line 53
    :goto_1
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->imageViewContainer:Landroid/view/View;

    invoke-virtual {p0, v1, v2}, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;->setViewVisibility(Landroid/view/View;Z)V

    .line 54
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->actionTitle:Landroid/widget/TextView;

    invoke-virtual {p0, v1, v0}, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;->setViewVisibility(Landroid/view/View;Z)V

    .line 55
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->separator:Landroid/view/View;

    invoke-virtual {p0, v1, v0}, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;->setViewVisibility(Landroid/view/View;Z)V

    .line 56
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->progress:Landroid/widget/ProgressBar;

    invoke-virtual {p0, v1, v3}, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;->setViewVisibility(Landroid/view/View;Z)V

    .line 58
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->actionButton:Landroid/widget/TextView;

    new-instance v2, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$1;

    invoke-direct {v2, p0, p2}, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$1;-><init>(Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz v0, :cond_3

    .line 66
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->actionTitle:Landroid/widget/TextView;

    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->actionTitle:Landroid/widget/TextView;

    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 69
    :cond_3
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->getUiViewState()Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    move-result-object v0

    .line 70
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->dateText:Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->getSubText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v0, v2}, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;->setAdminMessageSubText(Landroid/widget/TextView;Lcom/helpshift/conversation/activeconversation/message/UIViewState;Ljava/lang/String;)V

    .line 71
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->actionButton:Landroid/widget/TextView;

    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->action:Lcom/helpshift/conversation/activeconversation/model/Action;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/model/Action;->actionTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 72
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->actionButton:Landroid/widget/TextView;

    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->action:Lcom/helpshift/conversation/activeconversation/model/Action;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/model/Action;->actionTitle:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 73
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->messageContainer:Landroid/view/View;

    invoke-virtual {p0, p2}, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;->getAdminMessageContentDesciption(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 74
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->shouldShowAvatar()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 75
    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->actionCardView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;->setAdminMessageLayoutMarginForAvatar(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_4
    return-void
.end method

.method public bridge synthetic createViewHolder(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 17
    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;->createViewHolder(Landroid/view/ViewGroup;)Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public createViewHolder(Landroid/view/ViewGroup;)Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;
    .locals 3

    .line 26
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;->context:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/helpshift/R$layout;->hs__msg_admin_action_card:I

    const/4 v2, 0x0

    .line 27
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 28
    new-instance v0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;-><init>(Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;Landroid/view/View;)V

    return-object v0
.end method
