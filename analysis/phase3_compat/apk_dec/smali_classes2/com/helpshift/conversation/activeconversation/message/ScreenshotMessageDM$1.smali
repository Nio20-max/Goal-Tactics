.class Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM$1;
.super Lcom/helpshift/common/domain/F;
.source "ScreenshotMessageDM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->uploadImage(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;ZLcom/helpshift/util/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

.field final synthetic val$callback:Lcom/helpshift/util/Callback;

.field final synthetic val$conversationServerInfo:Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;

.field final synthetic val$userDM:Lcom/helpshift/account/domainmodel/UserDM;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/util/Callback;)V
    .locals 0

    .line 86
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM$1;->val$conversationServerInfo:Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;

    iput-object p4, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM$1;->val$callback:Lcom/helpshift/util/Callback;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 4

    .line 89
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM$1;->this$0:Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM$1;->val$conversationServerInfo:Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;

    iget-object v3, p0, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM$1;->val$callback:Lcom/helpshift/util/Callback;

    invoke-static {v0, v1, v2, v3}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->access$000(Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/util/Callback;)V

    return-void
.end method
