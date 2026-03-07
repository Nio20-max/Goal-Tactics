.class Lcom/helpshift/conversation/viewmodel/MessageListVM$5;
.super Lcom/helpshift/common/domain/F;
.source "MessageListVM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/viewmodel/MessageListVM;->prependMessagesInternal(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/viewmodel/MessageListVM;

.field final synthetic val$newMessageList:Ljava/util/List;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/viewmodel/MessageListVM;Ljava/util/List;)V
    .locals 0

    .line 1115
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->this$0:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    iput-object p2, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->val$newMessageList:Ljava/util/List;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 5

    .line 1119
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->val$newMessageList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1121
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->this$0:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    iget-object v1, v1, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-static {v1}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 1122
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->this$0:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    iget-object v1, v1, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 1124
    :goto_0
    iget-object v3, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->this$0:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    iget-object v3, v3, Lcom/helpshift/conversation/viewmodel/MessageListVM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 1125
    invoke-virtual {v3}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v3

    const-string v4, "showConversationInfoScreen"

    invoke-virtual {v3, v4}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    .line 1127
    iget-object v4, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->this$0:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-static {v4, v0, v1, v2, v3}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->access$500(Lcom/helpshift/conversation/viewmodel/MessageListVM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/conversation/activeconversation/message/MessageDM;ZZ)Ljava/util/List;

    move-result-object v0

    .line 1131
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->val$newMessageList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 1134
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->val$newMessageList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 1135
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->this$0:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    iget-object v1, v1, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    iget-object v3, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->val$newMessageList:Ljava/util/List;

    invoke-interface {v1, v2, v3}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 1137
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->this$0:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    iget-object v1, v1, Lcom/helpshift/conversation/viewmodel/MessageListVM;->messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

    if-eqz v1, :cond_1

    .line 1138
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->this$0:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    iget-object v1, v1, Lcom/helpshift/conversation/viewmodel/MessageListVM;->messageListVMCallback:Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;

    invoke-interface {v1, v2, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVMCallback;->appendMessages(II)V

    .line 1145
    :cond_1
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->this$0:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->checkAndUpdateGroupByDate(I)Z

    move-result v1

    .line 1146
    iget-object v3, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->this$0:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    iget-object v4, v3, Lcom/helpshift/conversation/viewmodel/MessageListVM;->uiMessageDMs:Ljava/util/List;

    add-int/lit8 v0, v0, 0x1

    .line 1147
    invoke-virtual {v3, v4, v2, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->checkAndUpdateGroupByTime(Ljava/util/List;II)Lcom/helpshift/util/ValuePair;

    move-result-object v0

    if-eqz v1, :cond_2

    .line 1153
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->this$0:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->notifyMessageListVMRefreshAll()V

    goto :goto_1

    :cond_2
    if-eqz v0, :cond_3

    .line 1156
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/MessageListVM$5;->this$0:Lcom/helpshift/conversation/viewmodel/MessageListVM;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/viewmodel/MessageListVM;->notifyMessageListUpdate(Lcom/helpshift/util/ValuePair;)V

    :cond_3
    :goto_1
    return-void
.end method
