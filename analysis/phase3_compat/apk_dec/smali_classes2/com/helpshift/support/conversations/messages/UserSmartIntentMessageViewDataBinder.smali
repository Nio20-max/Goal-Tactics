.class public Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;
.super Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;
.source "UserSmartIntentMessageViewDataBinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/helpshift/support/conversations/messages/MessageViewDataBinder<",
        "Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;",
        "Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic bind(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 0

    .line 18
    check-cast p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;

    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->bind(Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;)V

    return-void
.end method

.method public bind(Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;)V
    .locals 9

    .line 41
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->getState()Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    move-result-object v0

    .line 43
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->intentLabels:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-lt v1, v2, :cond_0

    .line 44
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->rootLabelText:Landroid/widget/TextView;

    iget-object v5, p2, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->intentLabels:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->leafLabelText:Landroid/widget/TextView;

    iget-object v5, p2, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->intentLabels:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    const/high16 v1, 0x3f000000    # 0.5f

    .line 52
    iget-object v5, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->context:Landroid/content/Context;

    const v6, 0x1010038

    invoke-static {v5, v6}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v5

    .line 54
    sget-object v6, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$1;->$SwitchMap$com$helpshift$conversation$activeconversation$message$UserMessageState:[I

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/UserMessageState;->ordinal()I

    move-result v0

    aget v0, v6, v0

    const-string v6, ""

    if-eq v0, v4, :cond_4

    if-eq v0, v2, :cond_3

    const/4 v2, 0x3

    if-eq v0, v2, :cond_2

    const/4 v2, 0x4

    if-eq v0, v2, :cond_1

    move-object v0, v6

    const/4 v3, 0x1

    const/4 v4, 0x0

    goto :goto_3

    .line 72
    :cond_1
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->getSubText()Ljava/lang/String;

    move-result-object v6

    .line 73
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$string;->hs__user_sent_message_voice_over:I

    new-array v2, v4, [Ljava/lang/Object;

    .line 74
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->getAccessbilityMessageTime()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_0

    .line 67
    :cond_2
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$string;->hs__sending_msg:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 68
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$string;->hs__user_sending_message_voice_over:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 62
    :cond_3
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$string;->hs__sending_fail_msg:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 63
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$string;->hs__user_failed_message_voice_over:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 64
    iget-object v2, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v3, Lcom/helpshift/R$attr;->hs__errorTextColor:I

    invoke-static {v2, v3}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v5

    const/4 v3, 0x1

    goto :goto_2

    .line 56
    :cond_4
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$string;->hs__sending_fail_msg:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 57
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$string;->hs__user_failed_message_voice_over:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 58
    iget-object v2, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->context:Landroid/content/Context;

    sget v5, Lcom/helpshift/R$attr;->hs__errorTextColor:I

    invoke-static {v2, v5}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v5

    :goto_0
    const/4 v3, 0x1

    :goto_1
    const/4 v4, 0x0

    :goto_2
    move-object v8, v6

    move-object v6, v0

    move-object v0, v8

    .line 78
    :goto_3
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    invoke-virtual {v2, v6}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 79
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->messageBubble:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v1}, Landroid/widget/FrameLayout;->setAlpha(F)V

    .line 82
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->rootLabelText:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 83
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->leafLabelText:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 84
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    invoke-virtual {p0, v1, v4}, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->setViewVisibility(Landroid/view/View;Z)V

    .line 85
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->getUiViewState()Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    move-result-object p2

    .line 86
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->messageBubble:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v1, p2}, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->setUserMessageContainerBackground(Landroid/view/View;Lcom/helpshift/conversation/activeconversation/message/UIViewState;)V

    .line 87
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    invoke-virtual {p0, v1, p2, v0}, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->setUserMessageSubText(Landroid/widget/TextView;Lcom/helpshift/conversation/activeconversation/message/UIViewState;Ljava/lang/String;)V

    if-eqz v4, :cond_5

    .line 89
    iget-object p2, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_4

    .line 92
    :cond_5
    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_4
    return-void
.end method

.method public bridge synthetic createViewHolder(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 18
    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->createViewHolder(Landroid/view/ViewGroup;)Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public createViewHolder(Landroid/view/ViewGroup;)Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;
    .locals 3

    .line 28
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/helpshift/R$layout;->hs__msg_smart_intent_txt_user:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 31
    new-instance v0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;-><init>(Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;Landroid/view/View;)V

    .line 34
    iget-object p1, v0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->messageBubble:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->setUserMessageLayoutMargin(Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    invoke-virtual {v0}, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->setListeners()V

    return-object v0
.end method
