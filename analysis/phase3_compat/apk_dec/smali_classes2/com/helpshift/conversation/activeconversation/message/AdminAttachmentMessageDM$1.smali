.class Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$1;
.super Ljava/lang/Object;
.source "AdminAttachmentMessageDM.java"

# interfaces
.implements Lcom/helpshift/downloader/SupportDownloadStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->handleClick(Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;)V
    .locals 0

    .line 102
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/String;I)V
    .locals 0

    .line 105
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    sget-object p2, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;->DOWNLOAD_NOT_STARTED:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;)V

    return-void
.end method

.method public onProgressChange(Ljava/lang/String;I)V
    .locals 0

    .line 118
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    iput p2, p1, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->downloadProgress:I

    .line 119
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->notifyUpdated()V

    return-void
.end method

.method public onSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 110
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    invoke-static {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->access$003(Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;Ljava/lang/String;)Ljava/lang/String;

    .line 111
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p1

    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    .line 112
    invoke-interface {p1, p2}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 113
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    sget-object p2, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;->DOWNLOADED:Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;

    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM$AdminGenericAttachmentState;)V

    return-void
.end method
