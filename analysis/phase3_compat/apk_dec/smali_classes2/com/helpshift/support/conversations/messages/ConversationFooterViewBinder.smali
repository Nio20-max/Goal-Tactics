.class public Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;
.super Ljava/lang/Object;
.source "ConversationFooterViewBinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;,
        Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field footerClickListener:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public bind(Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V
    .locals 8

    .line 41
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/helpshift/R$string;->hs__conversation_end_msg:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 42
    sget-object v1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$1;->$SwitchMap$com$helpshift$conversation$activeconversation$message$ConversationFooterState:[I

    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->ordinal()I

    move-result p2

    aget p2, v1, p2

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch p2, :pswitch_data_0

    :goto_0
    const/4 p2, 0x1

    :goto_1
    const/4 v3, 0x0

    :goto_2
    const/4 v4, 0x0

    :goto_3
    const/4 v5, 0x0

    :goto_4
    const/4 v6, 0x0

    goto :goto_7

    :pswitch_0
    const/4 p2, 0x0

    goto :goto_6

    .line 69
    :pswitch_1
    iget-object p2, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->context:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v0, Lcom/helpshift/R$string;->hs__conversation_rejected_status:I

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    :pswitch_2
    const/4 p2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    goto :goto_7

    :pswitch_3
    const/4 p2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    goto :goto_4

    .line 55
    :pswitch_4
    iget-object p2, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->context:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v0, Lcom/helpshift/R$string;->hs__confirmation_footer_msg:I

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 p2, 0x1

    const/4 v3, 0x1

    const/4 v4, 0x1

    goto :goto_3

    :goto_5
    :pswitch_5
    const/4 p2, 0x1

    :goto_6
    const/4 v3, 0x1

    goto :goto_2

    .line 48
    :pswitch_6
    iget-object p2, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->context:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v0, Lcom/helpshift/R$string;->hs__confirmation_footer_msg:I

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :pswitch_7
    const/4 p2, 0x0

    const/4 v1, 0x0

    goto :goto_1

    :goto_7
    const/16 v7, 0x8

    if-eqz v1, :cond_5

    .line 79
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->conversationFooter:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    if-eqz p2, :cond_0

    .line 82
    iget-object p2, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->footerMessage:Landroid/widget/TextView;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    iget-object p2, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->footerMessage:Landroid/widget/TextView;

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_8

    .line 86
    :cond_0
    iget-object p2, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->footerMessage:Landroid/widget/TextView;

    invoke-virtual {p2, v7}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_8
    const/4 p2, 0x0

    if-eqz v3, :cond_1

    .line 90
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->newConversationBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 91
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->newConversationButton:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_9

    .line 94
    :cond_1
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->newConversationBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v7}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 95
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->newConversationBox:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_9
    if-eqz v4, :cond_2

    .line 99
    iget-object p2, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->csatView:Lcom/helpshift/support/widget/CSATView;

    invoke-virtual {p2, v2}, Lcom/helpshift/support/widget/CSATView;->setVisibility(I)V

    .line 100
    iget-object p2, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->csatView:Lcom/helpshift/support/widget/CSATView;

    invoke-virtual {p2, p1}, Lcom/helpshift/support/widget/CSATView;->setCSATListener(Lcom/helpshift/support/widget/CSATView$CSATListener;)V

    goto :goto_a

    .line 103
    :cond_2
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->csatView:Lcom/helpshift/support/widget/CSATView;

    invoke-virtual {v0}, Lcom/helpshift/support/widget/CSATView;->hideCSATDialog()V

    .line 104
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->csatView:Lcom/helpshift/support/widget/CSATView;

    invoke-virtual {v0, v7}, Lcom/helpshift/support/widget/CSATView;->setVisibility(I)V

    .line 105
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->csatView:Lcom/helpshift/support/widget/CSATView;

    invoke-virtual {v0, p2}, Lcom/helpshift/support/widget/CSATView;->setCSATListener(Lcom/helpshift/support/widget/CSATView$CSATListener;)V

    :goto_a
    if-eqz v5, :cond_3

    .line 109
    iget-object p2, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->newConversationReason:Landroid/widget/TextView;

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 110
    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->newConversationReason:Landroid/widget/TextView;

    sget p2, Lcom/helpshift/R$string;->hs__issue_archival_message:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_b

    :cond_3
    if-eqz v6, :cond_4

    .line 113
    iget-object p2, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->newConversationReason:Landroid/widget/TextView;

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 114
    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->newConversationReason:Landroid/widget/TextView;

    sget p2, Lcom/helpshift/R$string;->hs__new_conversation_footer_generic_reason:I

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_b

    .line 117
    :cond_4
    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->newConversationReason:Landroid/widget/TextView;

    invoke-virtual {p1, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_b

    .line 121
    :cond_5
    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->conversationFooter:Landroid/view/View;

    invoke-virtual {p1, v7}, Landroid/view/View;->setVisibility(I)V

    :goto_b
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public createViewHolder(Landroid/view/ViewGroup;)Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;
    .locals 3

    .line 26
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/helpshift/R$layout;->hs__messages_list_footer:I

    const/4 v2, 0x0

    .line 27
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 30
    new-instance v0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;-><init>(Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;Landroid/view/View;)V

    return-object v0
.end method

.method public setConversationFooterClickListener(Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;)V
    .locals 0

    .line 126
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->footerClickListener:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;

    return-void
.end method
