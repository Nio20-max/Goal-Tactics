.class Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$2;
.super Ljava/lang/Object;
.source "AdminCSATMessageViewBinder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

.field final synthetic val$messageDM:Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$2;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    iput-object p2, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$2;->val$messageDM:Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 116
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$2;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    if-eqz p1, :cond_0

    .line 117
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$2;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$2;->val$messageDM:Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    invoke-interface {p1, v0}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->onStartNewConversationButtonClickFromCSATBot(Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V

    :cond_0
    return-void
.end method
