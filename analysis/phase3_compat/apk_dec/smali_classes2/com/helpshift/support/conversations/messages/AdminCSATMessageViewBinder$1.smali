.class Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;
.super Ljava/lang/Object;
.source "AdminCSATMessageViewBinder.java"

# interfaces
.implements Lcom/helpshift/support/widget/AdminCSATBotView$AdminCSATBotViewListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->bind(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

.field final synthetic val$csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

.field final synthetic val$messageDM:Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

.field final synthetic val$viewHolder:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    iput-object p2, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->val$viewHolder:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;

    iput-object p3, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->val$csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    iput-object p4, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->val$messageDM:Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCSATSurveyRequested()V
    .locals 2

    .line 105
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    if-eqz v0, :cond_0

    .line 106
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    iget-object v1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->val$messageDM:Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->serverId:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->onCSATSurveyRequestedFromBot(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onRatingChanged(I)V
    .locals 4

    .line 79
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->val$viewHolder:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->sendFeedbackButton:Lcom/helpshift/views/HSButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/views/HSButton;->setVisibility(I)V

    .line 80
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->val$viewHolder:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatBotLikedText:Lcom/helpshift/views/HSTextView;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Lcom/helpshift/views/HSTextView;->setVisibility(I)V

    .line 81
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->val$viewHolder:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatBotDislikeText:Lcom/helpshift/views/HSTextView;

    invoke-virtual {v0, v2}, Lcom/helpshift/views/HSTextView;->setVisibility(I)V

    .line 83
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->val$csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->ratings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;

    .line 84
    iget v3, v2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->value:I

    if-ne p1, v3, :cond_0

    .line 85
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->val$viewHolder:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatBotSelectedRatingText:Lcom/helpshift/views/HSTextView;

    iget-object v0, v2, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/helpshift/views/HSTextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    :cond_1
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->val$viewHolder:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatBotSelectedRatingText:Lcom/helpshift/views/HSTextView;

    invoke-virtual {p1, v1}, Lcom/helpshift/views/HSTextView;->setVisibility(I)V

    .line 91
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    if-eqz p1, :cond_2

    .line 92
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->val$messageDM:Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    iget-object v0, v0, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->serverId:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->onCSATSurveyStartedFromBot(Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public sendCSATSurvey(I)V
    .locals 2

    .line 98
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    iget-object v1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$1;->val$messageDM:Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    invoke-interface {v0, p1, v1}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->onSendFeedbackClick(ILcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V

    :cond_0
    return-void
.end method
