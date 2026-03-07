.class Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$1;
.super Ljava/lang/Object;
.source "AdminActionCardMessageViewDataBinder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;->bind(Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;

.field final synthetic val$message:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V
    .locals 0

    .line 58
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$1;->this$0:Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;

    iput-object p2, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$1;->val$message:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 61
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$1;->this$0:Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$1;->val$message:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    invoke-interface {p1, v0}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->onActionCardClicked(Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;)V

    return-void
.end method
