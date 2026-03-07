.class Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$1;
.super Ljava/lang/Object;
.source "UserAttachmentMessageDM.java"

# interfaces
.implements Lcom/helpshift/downloader/SupportDownloadStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->handleClick(Lcom/helpshift/conversation/viewmodel/ConversationVMCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/String;I)V
    .locals 0

    .line 73
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    sget-object p2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->DOWNLOAD_NOT_STARTED:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    return-void
.end method

.method public onProgressChange(Ljava/lang/String;I)V
    .locals 0

    .line 86
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    iput p2, p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->progressPercentage:I

    .line 87
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->notifyUpdated()V

    return-void
.end method

.method public onSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 78
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->filePath:Ljava/lang/String;

    .line 79
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p1

    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    .line 80
    invoke-interface {p1, p2}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 81
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    sget-object p2, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;->SENT:Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;

    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM$UserGenericAttachmentState;)V

    return-void
.end method
