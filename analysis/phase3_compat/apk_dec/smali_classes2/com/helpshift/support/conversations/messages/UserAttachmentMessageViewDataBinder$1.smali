.class Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$1;
.super Ljava/lang/Object;
.source "UserAttachmentMessageViewDataBinder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->bind(Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;

.field final synthetic val$message:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V
    .locals 0

    .line 155
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$1;->this$0:Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;

    iput-object p2, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$1;->val$message:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 158
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$1;->this$0:Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$1;->val$message:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    invoke-interface {p1, v0}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->onUserAttachmentMessageClicked(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V

    return-void
.end method
