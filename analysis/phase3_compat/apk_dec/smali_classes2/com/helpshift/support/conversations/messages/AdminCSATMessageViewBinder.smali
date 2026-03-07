.class public Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;
.super Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;
.source "AdminCSATMessageViewBinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/helpshift/support/conversations/messages/MessageViewDataBinder<",
        "Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;",
        "Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;",
        ">;"
    }
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field private lastMessageId:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 34
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder;-><init>(Landroid/content/Context;)V

    const-string v0, ""

    .line 31
    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->lastMessageId:Ljava/lang/String;

    .line 35
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->context:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;)Landroid/content/Context;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->context:Landroid/content/Context;

    return-object p0
.end method


# virtual methods
.method public bridge synthetic bind(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 0

    .line 26
    check-cast p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;

    check-cast p2, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->bind(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V

    return-void
.end method

.method public bind(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
    .locals 5

    .line 51
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->lastMessageId:Ljava/lang/String;

    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->serverId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 54
    :cond_0
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->serverId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->lastMessageId:Ljava/lang/String;

    .line 57
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatView:Lcom/helpshift/support/widget/AdminCSATBotView;

    invoke-virtual {v0}, Lcom/helpshift/support/widget/AdminCSATBotView;->reset()V

    .line 58
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatBotLikedText:Lcom/helpshift/views/HSTextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/views/HSTextView;->setVisibility(I)V

    .line 59
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatBotDislikeText:Lcom/helpshift/views/HSTextView;

    invoke-virtual {v0, v1}, Lcom/helpshift/views/HSTextView;->setVisibility(I)V

    .line 60
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatBotSelectedRatingText:Lcom/helpshift/views/HSTextView;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Lcom/helpshift/views/HSTextView;->setVisibility(I)V

    .line 62
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatMessageText:Lcom/helpshift/views/HSTextView;

    iget-object v3, p2, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->body:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/helpshift/views/HSTextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    iget-object v0, p2, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    .line 64
    iget-object v3, v0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->ratings:Ljava/util/List;

    .line 65
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 67
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->title:Ljava/lang/String;

    add-int/lit8 v4, v4, -0x1

    .line 68
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;

    iget-object v3, v3, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->title:Ljava/lang/String;

    .line 69
    iget-object v4, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatBotDislikeText:Lcom/helpshift/views/HSTextView;

    invoke-virtual {v4, v1}, Lcom/helpshift/views/HSTextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatBotLikedText:Lcom/helpshift/views/HSTextView;

    invoke-virtual {v1, v3}, Lcom/helpshift/views/HSTextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    :cond_1
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->sendFeedbackButton:Lcom/helpshift/views/HSButton;

    iget-object v3, v0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->sendFeedbackLabel:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/helpshift/views/HSButton;->setText(Ljava/lang/CharSequence;)V

    .line 74
    iget-object v1, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->newConversationButton:Lcom/helpshift/views/HSButton;

    iget-object v3, v0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->startNewConversationLabel:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/helpshift/views/HSButton;->setText(Ljava/lang/CharSequence;)V

    .line 76
    new-instance v1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;

    invoke-direct {v1, p0, p1, v0, p2}, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;-><init>(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V

    .line 111
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatView:Lcom/helpshift/support/widget/AdminCSATBotView;

    invoke-virtual {v0, v1}, Lcom/helpshift/support/widget/AdminCSATBotView;->setAdminCSATBotListener(Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;)V

    .line 113
    iget-object v0, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->newConversationButton:Lcom/helpshift/views/HSButton;

    new-instance v1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$2;

    invoke-direct {v1, p0, p2}, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$2;-><init>(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/views/HSButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 122
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    iget-boolean p2, p2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->showNewConversationButton:Z

    if-nez p2, :cond_2

    .line 123
    iget-object p2, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->bottomDividerLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p2, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 124
    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->newConversationButton:Lcom/helpshift/views/HSButton;

    invoke-virtual {p1, v2}, Lcom/helpshift/views/HSButton;->setVisibility(I)V

    :cond_2
    return-void
.end method

.method public bridge synthetic createViewHolder(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 26
    invoke-virtual {p0, p1}, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->createViewHolder(Landroid/view/ViewGroup;)Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public createViewHolder(Landroid/view/ViewGroup;)Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;
    .locals 3

    .line 39
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/helpshift/R$layout;->hs__admin_csat_message:I

    const/4 v2, 0x0

    .line 40
    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 43
    new-instance v0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;-><init>(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;Landroid/view/View;)V

    return-object v0
.end method
