.class Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$2;
.super Ljava/lang/Object;
.source "RequestScreenshotMessageDataBinder.java"

# interfaces
.implements Lcom/helpshift/util/HSLinkify$LinkClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;->bind(Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;

.field final synthetic val$message:Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;)V
    .locals 0

    .line 59
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$2;->this$0:Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;

    iput-object p2, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$2;->val$message:Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLinkClickFailed()V
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$2;->this$0:Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$2;->this$0:Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    invoke-interface {v0}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->onAdminMessageLinkClickFailed()V

    :cond_0
    return-void
.end method

.method public onLinkClicked(Ljava/lang/String;)V
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$2;->this$0:Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    if-eqz v0, :cond_0

    .line 63
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$2;->this$0:Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    iget-object v1, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$2;->val$message:Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    invoke-interface {v0, p1, v1}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->onAdminMessageLinkClicked(Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    :cond_0
    return-void
.end method
