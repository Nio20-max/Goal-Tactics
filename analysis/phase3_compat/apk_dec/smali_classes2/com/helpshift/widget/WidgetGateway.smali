.class public Lcom/helpshift/widget/WidgetGateway;
.super Ljava/lang/Object;
.source "WidgetGateway.java"


# instance fields
.field private final config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

.field private final conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;


# direct methods
.method public constructor <init>(Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;Lcom/helpshift/conversation/domainmodel/ConversationController;)V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 44
    iput-object p2, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    return-void
.end method

.method private getVisibilityForNewConversationAttachImageButton(Lcom/helpshift/widget/MutableImageAttachmentViewState;)Z
    .locals 2

    .line 192
    invoke-virtual {p0}, Lcom/helpshift/widget/WidgetGateway;->getDefaultVisibilityForAttachImageButtonNewConversation()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 193
    invoke-virtual {p1}, Lcom/helpshift/widget/MutableImageAttachmentViewState;->getImagePath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 194
    iget-object p1, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {p1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->isCreateConversationInProgress()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method private isEmailRequired()Z
    .locals 4

    .line 277
    iget-object v0, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v1, "fullPrivacy"

    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 281
    :cond_0
    iget-object v0, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v2, "requireNameAndEmail"

    invoke-virtual {v0, v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    return v2

    .line 286
    :cond_1
    iget-object v0, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v3, "profileFormEnable"

    invoke-virtual {v0, v3}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v3, "requireEmail"

    invoke-virtual {v0, v3}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    return v2

    :cond_2
    return v1
.end method

.method private isProfileFormVisible(Lcom/helpshift/widget/TextViewState;Lcom/helpshift/widget/TextViewState;)Z
    .locals 6

    .line 317
    iget-object v0, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v1, "fullPrivacy"

    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 321
    :cond_0
    iget-object v0, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v2, "profileFormEnable"

    invoke-virtual {v0, v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 322
    iget-object v2, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v3, "hideNameAndEmail"

    invoke-virtual {v2, v3}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    .line 323
    invoke-virtual {p1}, Lcom/helpshift/widget/TextViewState;->getText()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    const/4 v3, 0x1

    if-lez p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 324
    :goto_0
    invoke-virtual {p2}, Lcom/helpshift/widget/TextViewState;->getText()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    if-lez p2, :cond_2

    const/4 p2, 0x1

    goto :goto_1

    :cond_2
    const/4 p2, 0x0

    .line 325
    :goto_1
    iget-object v4, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v5, "requireNameAndEmail"

    invoke-virtual {v4, v5}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    if-eqz v2, :cond_5

    if-eqz p1, :cond_3

    if-nez p2, :cond_4

    :cond_3
    const/4 v1, 0x1

    :cond_4
    return v1

    :cond_5
    if-eqz v0, :cond_8

    if-eqz v2, :cond_7

    .line 331
    iget-object v0, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v2, "requireEmail"

    .line 333
    invoke-virtual {v0, v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    if-eqz p2, :cond_7

    :cond_6
    if-nez p1, :cond_8

    :cond_7
    const/4 v1, 0x1

    :cond_8
    return v1
.end method


# virtual methods
.method public getDefaultVisibilityForAttachImageButton(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z
    .locals 0

    .line 205
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/helpshift/widget/WidgetGateway;->getDefaultVisibilityForAttachImageButtonNewConversation()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public getDefaultVisibilityForAttachImageButtonNewConversation()Z
    .locals 2

    .line 209
    iget-object v0, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v1, "fullPrivacy"

    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v1, "allowUserAttachments"

    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getDefaultVisibilityForConversationInfoButtonWidget(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z
    .locals 1

    .line 87
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isInPreIssueMode()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v0, "showConversationInfoScreen"

    invoke-virtual {p1, v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public makeAttachImageButtonViewState(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/widget/MutableBaseViewState;
    .locals 1

    .line 171
    new-instance v0, Lcom/helpshift/widget/MutableBaseViewState;

    invoke-direct {v0}, Lcom/helpshift/widget/MutableBaseViewState;-><init>()V

    .line 172
    invoke-virtual {p0, p1}, Lcom/helpshift/widget/WidgetGateway;->getDefaultVisibilityForAttachImageButton(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    return-object v0
.end method

.method public makeConfirmationBoxViewState(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Lcom/helpshift/widget/MutableBaseViewState;
    .locals 1

    .line 148
    new-instance v0, Lcom/helpshift/widget/MutableBaseViewState;

    invoke-direct {v0}, Lcom/helpshift/widget/MutableBaseViewState;-><init>()V

    .line 149
    invoke-virtual {p0, v0, p1}, Lcom/helpshift/widget/WidgetGateway;->updateConfirmationBoxViewState(Lcom/helpshift/widget/MutableBaseViewState;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V

    return-object v0
.end method

.method public makeConversationFooterViewState(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)Lcom/helpshift/widget/MutableConversationFooterViewState;
    .locals 1

    .line 92
    new-instance v0, Lcom/helpshift/widget/MutableConversationFooterViewState;

    invoke-direct {v0}, Lcom/helpshift/widget/MutableConversationFooterViewState;-><init>()V

    .line 93
    invoke-virtual {p0, v0, p1, p2}, Lcom/helpshift/widget/WidgetGateway;->updateConversationFooterViewState(Lcom/helpshift/widget/MutableConversationFooterViewState;Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    return-object v0
.end method

.method public makeDescriptionViewState()Lcom/helpshift/widget/MutableTextViewState;
    .locals 10

    .line 214
    new-instance v0, Lcom/helpshift/widget/MutableTextViewState;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/helpshift/widget/MutableTextViewState;-><init>(Z)V

    .line 219
    iget-object v2, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v2}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getConversationArchivalPrefillText()Ljava/lang/String;

    move-result-object v2

    .line 220
    iget-object v3, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v4, "conversationPrefillText"

    invoke-virtual {v3, v4}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 222
    iget-object v4, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v4}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getConversationDetail()Lcom/helpshift/conversation/dto/ConversationDetailDTO;

    move-result-object v4

    const-string v5, ""

    if-eqz v4, :cond_1

    .line 223
    iget v6, v4, Lcom/helpshift/conversation/dto/ConversationDetailDTO;->type:I

    if-ne v6, v1, :cond_1

    .line 225
    iget-object v1, v4, Lcom/helpshift/conversation/dto/ConversationDetailDTO;->title:Ljava/lang/String;

    .line 226
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    iget-wide v8, v4, Lcom/helpshift/conversation/dto/ConversationDetailDTO;->timestamp:J

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x0

    cmp-long v4, v6, v8

    if-ltz v4, :cond_0

    .line 228
    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    .line 229
    invoke-virtual {v4, v6, v7}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v6

    const-wide/16 v8, 0x1c20

    cmp-long v4, v6, v8

    if-lez v4, :cond_2

    .line 230
    :cond_0
    iget-object v1, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    const/4 v4, 0x0

    invoke-virtual {v1, v5, v4}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveDescriptionDetail(Ljava/lang/String;I)V

    :cond_1
    move-object v1, v5

    .line 235
    :cond_2
    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    move-object v2, v1

    goto :goto_0

    .line 238
    :cond_3
    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 240
    iget-object v1, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    const/4 v3, 0x3

    invoke-virtual {v1, v2, v3}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveDescriptionDetail(Ljava/lang/String;I)V

    goto :goto_0

    .line 242
    :cond_4
    invoke-static {v3}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 244
    iget-object v1, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    const/4 v2, 0x2

    invoke-virtual {v1, v3, v2}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveDescriptionDetail(Ljava/lang/String;I)V

    move-object v2, v3

    goto :goto_0

    :cond_5
    move-object v2, v5

    .line 247
    :goto_0
    invoke-virtual {v0, v2}, Lcom/helpshift/widget/MutableTextViewState;->setText(Ljava/lang/String;)V

    return-object v0
.end method

.method public makeEmailViewState()Lcom/helpshift/widget/MutableTextViewState;
    .locals 2

    .line 269
    new-instance v0, Lcom/helpshift/widget/MutableTextViewState;

    invoke-direct {p0}, Lcom/helpshift/widget/WidgetGateway;->isEmailRequired()Z

    move-result v1

    invoke-direct {v0, v1}, Lcom/helpshift/widget/MutableTextViewState;-><init>(Z)V

    .line 270
    iget-object v1, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldCreateConversationAnonymously()Z

    move-result v1

    if-nez v1, :cond_0

    .line 271
    iget-object v1, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getEmail()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableTextViewState;->setText(Ljava/lang/String;)V

    :cond_0
    return-object v0
.end method

.method public makeImageAttachmentWidget()Lcom/helpshift/widget/MutableImageAttachmentViewState;
    .locals 3

    .line 294
    new-instance v0, Lcom/helpshift/widget/MutableImageAttachmentViewState;

    invoke-direct {v0}, Lcom/helpshift/widget/MutableImageAttachmentViewState;-><init>()V

    .line 295
    iget-object v1, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string v2, "fullPrivacy"

    invoke-virtual {v1, v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    .line 296
    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableImageAttachmentViewState;->setAttachmentPickerFile(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    .line 297
    invoke-virtual {p0, v0}, Lcom/helpshift/widget/WidgetGateway;->save(Lcom/helpshift/widget/MutableImageAttachmentViewState;)V

    goto :goto_0

    .line 300
    :cond_0
    iget-object v1, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getImageAttachmentDraft()Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableImageAttachmentViewState;->setAttachmentPickerFile(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    .line 301
    iget-object v1, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->isCreateConversationInProgress()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableImageAttachmentViewState;->setClickable(Z)V

    :goto_0
    return-object v0
.end method

.method public makeNameViewState()Lcom/helpshift/widget/MutableTextViewState;
    .locals 2

    .line 256
    new-instance v0, Lcom/helpshift/widget/MutableTextViewState;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/helpshift/widget/MutableTextViewState;-><init>(Z)V

    .line 258
    iget-object v1, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldCreateConversationAnonymously()Z

    move-result v1

    if-nez v1, :cond_0

    .line 259
    iget-object v1, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, "Anonymous"

    .line 264
    :goto_0
    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableTextViewState;->setText(Ljava/lang/String;)V

    return-object v0
.end method

.method public makeNewConversationAttachImageButtonViewState(Lcom/helpshift/widget/MutableImageAttachmentViewState;)Lcom/helpshift/widget/MutableBaseViewState;
    .locals 1

    .line 178
    new-instance v0, Lcom/helpshift/widget/MutableBaseViewState;

    invoke-direct {v0}, Lcom/helpshift/widget/MutableBaseViewState;-><init>()V

    .line 179
    invoke-direct {p0, p1}, Lcom/helpshift/widget/WidgetGateway;->getVisibilityForNewConversationAttachImageButton(Lcom/helpshift/widget/MutableImageAttachmentViewState;)Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    return-object v0
.end method

.method public makeProfileFormViewState(Lcom/helpshift/widget/TextViewState;Lcom/helpshift/widget/TextViewState;)Lcom/helpshift/widget/MutableBaseViewState;
    .locals 1

    .line 311
    new-instance v0, Lcom/helpshift/widget/MutableBaseViewState;

    invoke-direct {v0}, Lcom/helpshift/widget/MutableBaseViewState;-><init>()V

    .line 312
    invoke-direct {p0, p1, p2}, Lcom/helpshift/widget/WidgetGateway;->isProfileFormVisible(Lcom/helpshift/widget/TextViewState;Lcom/helpshift/widget/TextViewState;)Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    return-object v0
.end method

.method public makeProgressBarViewState()Lcom/helpshift/widget/MutableBaseViewState;
    .locals 2

    .line 338
    new-instance v0, Lcom/helpshift/widget/MutableBaseViewState;

    invoke-direct {v0}, Lcom/helpshift/widget/MutableBaseViewState;-><init>()V

    .line 339
    iget-object v1, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->isCreateConversationInProgress()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    return-object v0
.end method

.method public makeReplyBoxViewState(Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)Lcom/helpshift/widget/MutableReplyBoxViewState;
    .locals 1

    .line 59
    new-instance v0, Lcom/helpshift/widget/MutableReplyBoxViewState;

    invoke-direct {v0}, Lcom/helpshift/widget/MutableReplyBoxViewState;-><init>()V

    .line 60
    invoke-virtual {p0, v0, p1, p2}, Lcom/helpshift/widget/WidgetGateway;->updateReplyBoxWidget(Lcom/helpshift/widget/MutableReplyBoxViewState;Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V

    return-object v0
.end method

.method public makeReplyFieldViewState()Lcom/helpshift/widget/MutableReplyFieldViewState;
    .locals 1

    .line 54
    new-instance v0, Lcom/helpshift/widget/MutableReplyFieldViewState;

    invoke-direct {v0}, Lcom/helpshift/widget/MutableReplyFieldViewState;-><init>()V

    return-object v0
.end method

.method public makeScrollJumperViewState()Lcom/helpshift/widget/MutableScrollJumperViewState;
    .locals 2

    .line 83
    new-instance v0, Lcom/helpshift/widget/MutableScrollJumperViewState;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lcom/helpshift/widget/MutableScrollJumperViewState;-><init>(ZZ)V

    return-object v0
.end method

.method public makeStartConversationButtonViewState()Lcom/helpshift/widget/MutableBaseViewState;
    .locals 2

    .line 48
    new-instance v0, Lcom/helpshift/widget/MutableBaseViewState;

    invoke-direct {v0}, Lcom/helpshift/widget/MutableBaseViewState;-><init>()V

    .line 49
    iget-object v1, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->isCreateConversationInProgress()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    return-object v0
.end method

.method public save(Lcom/helpshift/widget/MutableImageAttachmentViewState;)V
    .locals 1

    .line 307
    iget-object v0, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {p1}, Lcom/helpshift/widget/MutableImageAttachmentViewState;->getAttachmentPickerFile()Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveImageAttachmentDraft(Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V

    return-void
.end method

.method public save(Lcom/helpshift/widget/MutableTextViewState;)V
    .locals 2

    .line 252
    iget-object v0, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-virtual {p1}, Lcom/helpshift/widget/MutableTextViewState;->getText()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/helpshift/conversation/domainmodel/ConversationController;->saveDescriptionDetail(Ljava/lang/String;I)V

    return-void
.end method

.method public updateConfirmationBoxViewState(Lcom/helpshift/widget/MutableBaseViewState;Lcom/helpshift/conversation/activeconversation/model/Conversation;)V
    .locals 1

    .line 162
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    if-nez v0, :cond_0

    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    if-nez v0, :cond_0

    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p2, v0, :cond_0

    iget-object p2, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 164
    invoke-virtual {p2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldShowConversationResolutionQuestion()Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 167
    :goto_0
    invoke-virtual {p1, p2}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    return-void
.end method

.method public updateConversationFooterViewState(Lcom/helpshift/widget/MutableConversationFooterViewState;Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V
    .locals 3

    .line 100
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->NONE:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    .line 102
    iget-boolean v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    if-eqz v1, :cond_0

    .line 103
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->REDACTED_STATE:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    goto/16 :goto_1

    .line 105
    :cond_0
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_ACCEPTED:Lcom/helpshift/conversation/dto/IssueState;

    if-eq v1, v2, :cond_9

    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_EXPIRED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v1, v2, :cond_1

    goto :goto_0

    .line 114
    :cond_1
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v1, v2, :cond_2

    .line 115
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->REJECTED_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    goto :goto_1

    .line 117
    :cond_2
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->ARCHIVED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v1, v2, :cond_3

    .line 118
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->ARCHIVAL_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    goto :goto_1

    .line 120
    :cond_3
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REQUESTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v1, v2, :cond_4

    iget-object v1, p0, Lcom/helpshift/widget/WidgetGateway;->config:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 121
    invoke-virtual {v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->shouldShowConversationResolutionQuestion()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-boolean v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    if-nez v1, :cond_4

    .line 123
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->CONVERSATION_ENDED_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    goto :goto_1

    .line 125
    :cond_4
    iget-object v1, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v2, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne v1, v2, :cond_7

    if-eqz p3, :cond_5

    .line 127
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->NONE:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    goto :goto_1

    .line 130
    :cond_5
    iget-object p3, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    iget-object p3, p3, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p3, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldShowCSATInFooter(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result p2

    if-eqz p2, :cond_6

    .line 131
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->CSAT_RATING:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    goto :goto_1

    .line 134
    :cond_6
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->START_NEW_CONVERSATION:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    goto :goto_1

    .line 138
    :cond_7
    iget-object p3, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v1, Lcom/helpshift/conversation/dto/IssueState;->CLOSED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p3, v1, :cond_8

    .line 139
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->START_NEW_CONVERSATION:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    goto :goto_1

    .line 141
    :cond_8
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object p3, Lcom/helpshift/conversation/dto/IssueState;->AUTHOR_MISMATCH:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p2, p3, :cond_b

    .line 142
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->AUTHOR_MISMATCH:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    goto :goto_1

    .line 107
    :cond_9
    :goto_0
    iget-object p3, p0, Lcom/helpshift/widget/WidgetGateway;->conversationController:Lcom/helpshift/conversation/domainmodel/ConversationController;

    iget-object p3, p3, Lcom/helpshift/conversation/domainmodel/ConversationController;->conversationManager:Lcom/helpshift/conversation/activeconversation/ConversationManager;

    invoke-virtual {p3, p2}, Lcom/helpshift/conversation/activeconversation/ConversationManager;->shouldShowCSATInFooter(Lcom/helpshift/conversation/activeconversation/model/Conversation;)Z

    move-result p2

    if-eqz p2, :cond_a

    .line 108
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->CSAT_RATING:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    goto :goto_1

    .line 111
    :cond_a
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;->START_NEW_CONVERSATION:Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;

    .line 144
    :cond_b
    :goto_1
    invoke-virtual {p1, v0}, Lcom/helpshift/widget/MutableConversationFooterViewState;->setState(Lcom/helpshift/conversation/activeconversation/message/ConversationFooterState;)V

    return-void
.end method

.method public updateReplyBoxWidget(Lcom/helpshift/widget/MutableReplyBoxViewState;Lcom/helpshift/conversation/activeconversation/model/Conversation;Z)V
    .locals 3

    .line 69
    iget-boolean v0, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 72
    :cond_1
    invoke-virtual {p2}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isIssueInProgress()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 75
    :cond_2
    iget-object p2, p2, Lcom/helpshift/conversation/activeconversation/model/Conversation;->state:Lcom/helpshift/conversation/dto/IssueState;

    sget-object v0, Lcom/helpshift/conversation/dto/IssueState;->RESOLUTION_REJECTED:Lcom/helpshift/conversation/dto/IssueState;

    if-ne p2, v0, :cond_0

    if-eqz p3, :cond_0

    .line 79
    :goto_0
    invoke-virtual {p1, v1}, Lcom/helpshift/widget/MutableReplyBoxViewState;->setVisible(Z)V

    return-void
.end method
