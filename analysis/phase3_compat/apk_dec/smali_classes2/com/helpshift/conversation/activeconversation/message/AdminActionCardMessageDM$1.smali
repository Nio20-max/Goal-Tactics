.class Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$1;
.super Ljava/lang/Object;
.source "AdminActionCardMessageDM.java"

# interfaces
.implements Lcom/helpshift/downloader/SupportDownloadStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->downloadImageInternal(Lcom/helpshift/common/platform/Platform;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

.field final synthetic val$platform:Lcom/helpshift/common/platform/Platform;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;Lcom/helpshift/common/platform/Platform;)V
    .locals 0

    .line 84
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$1;->val$platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/String;I)V
    .locals 1

    .line 87
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;->DOWNLOAD_NOT_STARTED:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;)V

    .line 89
    sget-object p1, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->NOT_RETRIABLE_STATUS_CODES:Ljava/util/Set;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 90
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$1;->val$platform:Lcom/helpshift/common/platform/Platform;

    invoke-virtual {p1, p2}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->downloadImage(Lcom/helpshift/common/platform/Platform;)V

    :cond_0
    return-void
.end method

.method public onProgressChange(Ljava/lang/String;I)V
    .locals 0

    return-void
.end method

.method public onSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 96
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    sget-object p3, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;->IMAGE_DOWNLOADED:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;

    invoke-virtual {p1, p3}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->setState(Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$ActionCardImageState;)V

    .line 97
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->filePath:Ljava/lang/String;

    .line 98
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$1;->val$platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getConversationDAO()Lcom/helpshift/conversation/dao/ConversationDAO;

    move-result-object p1

    iget-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    invoke-interface {p1, p2}, Lcom/helpshift/conversation/dao/ConversationDAO;->insertOrUpdateMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    return-void
.end method
