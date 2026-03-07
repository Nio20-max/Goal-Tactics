.class public Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;
.super Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;
.source "UserMessageViewDataBinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/helpshift/support/conversations/messages/MessageViewDataBinder<",
        "Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;",
        "Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;",
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
    check-cast p1, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;

    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->bind(Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;)V

    return-void
.end method

.method public bind(Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;)V
    .locals 9

    .line 40
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getState()Lcom/helpshift/conversation/activeconversation/message/UserMessageState;

    move-result-object v0

    .line 41
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;->messageText:Landroid/widget/TextView;

    iget-object v2, p2, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->body:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->escapeHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 47
    iget-object v1, p0, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->context:Landroid/content/Context;

    const v2, 0x1010038

    invoke-static {v1, v2}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v1

    .line 49
    sget-object v2, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$1;->$SwitchMap$com$helpshift$conversation$activeconversation$message$UserMessageState:[I

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

    .line 69
    :cond_0
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getSubText()Ljava/lang/String;

    move-result-object v2

    .line 70
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->context:Landroid/content/Context;

    sget v5, Lcom/helpshift/R$string;->hs__user_sent_message_voice_over:I

    new-array v6, v3, [Ljava/lang/Object;

    .line 71
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getAccessbilityMessageTime()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    invoke-virtual {v0, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v5, 0x1

    const/high16 v6, 0x3f800000    # 1.0f

    goto :goto_2

    .line 63
    :cond_1
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$string;->hs__sending_msg:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 64
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->context:Landroid/content/Context;

    sget v3, Lcom/helpshift/R$string;->hs__user_sending_message_voice_over:I

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v5, 0x0

    goto :goto_1

    .line 57
    :cond_2
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$string;->hs__sending_fail_msg:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 58
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$string;->hs__user_failed_message_voice_over:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 59
    iget-object v1, p0, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->context:Landroid/content/Context;

    sget v6, Lcom/helpshift/R$attr;->hs__errorTextColor:I

    invoke-static {v1, v6}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v1

    const/4 v3, 0x0

    const/4 v4, 0x1

    goto :goto_0

    .line 51
    :cond_3
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$string;->hs__sending_fail_msg:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 52
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->context:Landroid/content/Context;

    sget v1, Lcom/helpshift/R$string;->hs__user_failed_message_voice_over:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->context:Landroid/content/Context;

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

    .line 75
    :goto_3
    iget-object v7, p1, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    invoke-virtual {v7, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 76
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;->messageBubble:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v6}, Landroid/widget/FrameLayout;->setAlpha(F)V

    const/4 v1, 0x0

    if-eqz v3, :cond_4

    .line 80
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;->messageText:Landroid/widget/TextView;

    invoke-virtual {p0, v2, v1}, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->linkify(Landroid/widget/TextView;Lcom/helpshift/util/HSLinkify$LinkClickListener;)V

    .line 82
    :cond_4
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;->messageText:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 83
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    invoke-virtual {p0, v2, v4}, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->setViewVisibility(Landroid/view/View;Z)V

    .line 84
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->getUiViewState()Lcom/helpshift/conversation/activeconversation/message/UIViewState;

    move-result-object p2

    .line 85
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;->messageBubble:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v2, p2}, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->setUserMessageContainerBackground(Landroid/view/View;Lcom/helpshift/conversation/activeconversation/message/UIViewState;)V

    .line 86
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    invoke-virtual {p0, v2, p2, v0}, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->setUserMessageSubText(Landroid/widget/TextView;Lcom/helpshift/conversation/activeconversation/message/UIViewState;Ljava/lang/String;)V

    if-eqz v4, :cond_5

    .line 88
    iget-object p2, p1, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_4

    .line 91
    :cond_5
    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_4
    return-void
.end method

.method public bridge synthetic createViewHolder(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 17
    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->createViewHolder(Landroid/view/ViewGroup;)Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public createViewHolder(Landroid/view/ViewGroup;)Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;
    .locals 3

    .line 27
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/helpshift/R$layout;->hs__msg_txt_user:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 30
    new-instance v0, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;-><init>(Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;Landroid/view/View;)V

    .line 33
    iget-object p1, v0, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;->messageBubble:Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder;->setUserMessageLayoutMargin(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    invoke-virtual {v0}, Lcom/helpshift/support/conversations/messages/UserMessageViewDataBinder$ViewHolder;->setListeners()V

    return-object v0
.end method
