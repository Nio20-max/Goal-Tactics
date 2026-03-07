.class public Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;
.super Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;
.source "UserResponseCSATMessageViewDataBinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/helpshift/support/conversations/messages/MessageViewDataBinder<",
        "Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;",
        "Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic bind(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 0

    .line 20
    check-cast p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;

    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->bind(Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;)V

    return-void
.end method

.method public bind(Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;)V
    .locals 9

    .line 43
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->getState()Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    move-result-object v0

    .line 44
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->messageText:Landroid/widget/TextView;

    iget-object v2, p2, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->body:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->escapeHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    iget-object v1, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->context:Landroid/content/Context;

    const v2, 0x1010038

    invoke-static {v1, v2}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v1

    .line 52
    sget-object v2, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$1;->$SwitchMap$com$helpshift$conversation$activeconversation$message$UserMessageState:[I

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->ordinal()I

    move-result v0

    aget v0, v2, v0

    const-string v2, ""

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/high16 v5, 0x3f000000    # 0.5f

    if-eq v0, v3, :cond_3

    const/4 v6, 0x2

    if-eq v0, v6, :cond_2

    const/4 v6, 0x3

    if-eq v0, v6, :cond_1

    const/4 v6, 0x4

    if-eq v0, v6, :cond_0

    move-object v0, v2

    const/4 v5, 0x1

    const/high16 v6, 0x3f000000    # 0.5f

    goto :goto_3

    .line 72
    :cond_0
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->getSubText()Ljava/lang/String;

    move-result-object v2

    .line 73
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->context:Landroid/content/Context;

    sget v5, Lcom/helpshift/R$string;->hs__user_sent_message_voice_over:I

    new-array v6, v3, [Ljava/lang/Object;

    .line 74
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->getAccessbilityMessageTime()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v5, 0x1

    const/high16 v6, 0x3f800000    # 1.0f

    goto :goto_2

    .line 66
    :cond_1
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$string;->hs__sending_msg:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 67
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->context:Landroid/content/Context;

    sget v3, Lcom/helpshift/R$string;->hs__user_sending_message_voice_over:I

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v5, 0x0

    goto :goto_1

    .line 60
    :cond_2
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$string;->hs__sending_fail_msg:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 61
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$string;->hs__user_failed_message_voice_over:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 62
    iget-object v1, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->context:Landroid/content/Context;

    sget v6, Lcom/helpshift/R$attr;->hs__errorTextColor:I

    invoke-static {v1, v6}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v1

    const/4 v3, 0x0

    const/4 v4, 0x1

    goto :goto_0

    .line 54
    :cond_3
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$string;->hs__sending_fail_msg:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 55
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$string;->hs__user_failed_message_voice_over:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 56
    iget-object v1, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->context:Landroid/content/Context;

    sget v6, Lcom/helpshift/R$attr;->hs__errorTextColor:I

    invoke-static {v1, v6}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v1

    :goto_0
    const/4 v5, 0x1

    :goto_1
    const/high16 v6, 0x3f000000    # 0.5f

    :goto_2
    move-object v8, v2

    move-object v2, v0

    move-object v0, v8

    .line 78
    :goto_3
    iget-object v7, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    invoke-virtual {v7, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 79
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->messageBubble:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v6}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    const/4 v1, 0x0

    if-eqz v3, :cond_4

    .line 83
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->messageText:Landroid/widget/TextView;

    invoke-virtual {p0, v2, v1}, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->linkify(Landroid/widget/TextView;Lcom/helpshift/util/HSLinkify$LinkClickListener;)V

    .line 85
    :cond_4
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->messageText:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 86
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    invoke-virtual {p0, v2, v4}, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->setViewVisibility(Landroid/view/View;Z)V

    .line 87
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->getUiViewState()Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    move-result-object v2

    .line 88
    iget-object v3, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->messageBubble:Landroid/widget/RelativeLayout;

    invoke-virtual {p0, v3, v2}, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->setUserMessageContainerBackground(Landroid/view/View;Lcom/helpshift/conversation/activeconversation/message/UIViewState;)V

    .line 89
    iget-object v3, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    invoke-virtual {p0, v3, v2, v0}, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->setUserMessageSubText(Landroid/widget/TextView;Lcom/helpshift/conversation/activeconversation/message/UIViewState;Ljava/lang/String;)V

    if-eqz v4, :cond_5

    .line 91
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_4

    .line 94
    :cond_5
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 97
    :goto_4
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->context:Landroid/content/Context;

    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->ratingBar:Landroid/widget/RatingBar;

    invoke-virtual {v1}, Landroid/widget/RatingBar;->getProgressDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    sget v2, Lcom/helpshift/R$attr;->hs__chatBubbleUserText:I

    invoke-static {v0, v1, v2}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 98
    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->ratingBar:Landroid/widget/RatingBar;

    iget p2, p2, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->rating:I

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/widget/RatingBar;->setRating(F)V

    return-void
.end method

.method public bridge synthetic createViewHolder(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 20
    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->createViewHolder(Landroid/view/ViewGroup;)Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public createViewHolder(Landroid/view/ViewGroup;)Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;
    .locals 3

    .line 30
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/helpshift/R$layout;->hs__msg_csat_user_rsp:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 33
    new-instance v0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;-><init>(Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;Landroid/view/View;)V

    .line 36
    iget-object p1, v0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->messageBubble:Landroid/widget/RelativeLayout;

    invoke-virtual {p1}, Landroid/widget/RelativeLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->setUserMessageLayoutMargin(Landroid/view/ViewGroup$LayoutParams;)V

    .line 37
    invoke-virtual {v0}, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->setListeners()V

    return-object v0
.end method
