.class Lcom/helpshift/conversation/activeconversation/ConversationManager$6;
.super Lcom/helpshift/common/domain/F;
.source "ConversationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/activeconversation/ConversationManager;->clearRedactedAttachmentsResources(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/activeconversation/ConversationManager;

.field final synthetic val$redactedAttachments:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/activeconversation/ConversationManager;Ljava/util/List;)V
    .locals 0

    .line 779
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$6;->this$0:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$6;->val$redactedAttachments:Ljava/util/List;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 4

    .line 782
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/ConversationManager$6;->val$redactedAttachments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 784
    :try_start_0
    instance-of v2, v1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 785
    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;

    .line 786
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->filePath:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/FileUtil;->deleteFile(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 787
    iput-object v3, v1, Lcom/helpshift/conversation/activeconversation/message/AttachmentMessageDM;->filePath:Ljava/lang/String;

    goto :goto_0

    .line 790
    :cond_1
    instance-of v2, v1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    if-eqz v2, :cond_0

    .line 791
    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    .line 792
    iget-object v2, v1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iget-object v2, v2, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->filePath:Ljava/lang/String;

    invoke-static {v2}, Lcom/helpshift/util/FileUtil;->deleteFile(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 793
    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->actionCard:Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    iput-object v3, v1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->filePath:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "Helpshift_ConvManager"

    const-string v3, "Exception while deleting redacted AttachmentMessageDM file"

    .line 798
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_2
    return-void
.end method
