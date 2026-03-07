.class public Lcom/helpshift/support/conversations/messages/AvatarImageLoader;
.super Ljava/lang/Object;
.source "AvatarImageLoader.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getAuthorAvatarActualImage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Lcom/helpshift/util/ValuePair;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ")",
            "Lcom/helpshift/util/ValuePair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 62
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getAuthorAvatarFallbackImage()Ljava/lang/String;

    move-result-object v0

    .line 63
    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object v1, v1, Lcom/helpshift/conversation/activeconversation/message/Author;->role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    .line 65
    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->AGENT:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    if-ne v1, v2, :cond_0

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->shouldShowPersonalisedAgentAvatar()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 67
    iget-object p0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object p0, p0, Lcom/helpshift/conversation/activeconversation/message/Author;->localAvatarImagePath:Ljava/lang/String;

    goto :goto_0

    .line 69
    :cond_0
    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->BOT:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    if-ne v1, v2, :cond_1

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->shouldShowPersonalisedBotAvatar()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 71
    iget-object p0, p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object p0, p0, Lcom/helpshift/conversation/activeconversation/message/Author;->localAvatarImagePath:Ljava/lang/String;

    goto :goto_0

    .line 73
    :cond_1
    sget-object p0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->SYSTEM:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    move-object p0, v0

    .line 81
    :goto_0
    new-instance v1, Lcom/helpshift/util/ValuePair;

    invoke-direct {v1, p0, v0}, Lcom/helpshift/util/ValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1
.end method

.method private static getFallbackImageURL(Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)Ljava/lang/String;
    .locals 2

    .line 113
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    .line 114
    sget-object v1, Lcom/helpshift/support/conversations/messages/AvatarImageLoader$1;->$SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole:[I

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->ordinal()I

    move-result p0

    aget p0, v1, p0

    const/4 v1, 0x2

    if-eq p0, v1, :cond_1

    const/4 v1, 0x3

    if-eq p0, v1, :cond_0

    .line 120
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getConversationHeaderImageUrl()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 118
    :cond_0
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getAgentFallbackImageUrl()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 116
    :cond_1
    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getBotFallbackImageUrl()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getLocalFallbackImage(Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)I
    .locals 1

    .line 85
    sget-object v0, Lcom/helpshift/support/conversations/messages/AvatarImageLoader$1;->$SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole:[I

    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_2

    const/4 v0, 0x2

    if-eq p0, v0, :cond_1

    const/4 v0, 0x3

    if-eq p0, v0, :cond_0

    .line 93
    sget p0, Lcom/helpshift/R$drawable;->hs__default_support_avatar:I

    return p0

    .line 91
    :cond_0
    sget p0, Lcom/helpshift/R$drawable;->hs__default_agent_avatar:I

    return p0

    .line 89
    :cond_1
    sget p0, Lcom/helpshift/R$drawable;->hs__default_bot_avatar:I

    return p0

    .line 87
    :cond_2
    sget p0, Lcom/helpshift/R$drawable;->hs__default_support_avatar:I

    return p0
.end method

.method static loadAvatarImageAccordingToState(Landroid/content/Context;Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lcom/helpshift/views/CircleImageView;)V
    .locals 7

    .line 24
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    .line 25
    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getAvatarImageState()Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    move-result-object v1

    .line 26
    iget-object v2, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object v2, v2, Lcom/helpshift/conversation/activeconversation/message/Author;->role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    invoke-static {v2}, Lcom/helpshift/support/conversations/messages/AvatarImageLoader;->getLocalFallbackImage(Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)I

    move-result v2

    .line 27
    invoke-static {p1}, Lcom/helpshift/support/conversations/messages/AvatarImageLoader;->getAuthorAvatarActualImage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)Lcom/helpshift/util/ValuePair;

    move-result-object v3

    .line 28
    iget-object v4, v3, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    .line 29
    iget-object v3, v3, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    .line 30
    invoke-virtual {p2}, Lcom/helpshift/views/CircleImageView;->getWidth()I

    move-result v5

    if-nez v5, :cond_0

    .line 32
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    sget v6, Lcom/helpshift/R$dimen;->hs__author_avatar_size:I

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    .line 33
    :cond_0
    sget-object v6, Lcom/helpshift/support/conversations/messages/AvatarImageLoader$1;->$SwitchMap$com$helpshift$conversation$activeconversation$message$MessageDM$AvatarImageDownloadState:[I

    invoke-virtual {v1}, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->ordinal()I

    move-result v1

    aget v1, v6, v1

    const/4 v6, 0x1

    if-eq v1, v6, :cond_2

    const/4 v6, 0x2

    if-eq v1, v6, :cond_2

    const/4 v6, 0x3

    if-eq v1, v6, :cond_2

    const/4 v3, 0x4

    if-eq v1, v3, :cond_1

    goto :goto_0

    .line 52
    :cond_1
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/Author;->authorId:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getAvatarImageUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/helpshift/views/CircleImageView;->setTag(Ljava/lang/Object;)V

    .line 53
    invoke-static {}, Lcom/helpshift/support/imageloader/ImageLoader;->getInstance()Lcom/helpshift/support/imageloader/ImageLoader;

    move-result-object p1

    .line 54
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 53
    invoke-virtual {p1, v4, p2, p0, v5}, Lcom/helpshift/support/imageloader/ImageLoader;->loadImageWithoutSampling(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;I)V

    goto :goto_0

    .line 39
    :cond_2
    invoke-static {v3}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 40
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/Author;->role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    invoke-static {p1}, Lcom/helpshift/support/conversations/messages/AvatarImageLoader;->getFallbackImageURL(Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)Ljava/lang/String;

    move-result-object p1

    .line 41
    invoke-virtual {p2, p1}, Lcom/helpshift/views/CircleImageView;->setTag(Ljava/lang/Object;)V

    .line 42
    invoke-static {}, Lcom/helpshift/support/imageloader/ImageLoader;->getInstance()Lcom/helpshift/support/imageloader/ImageLoader;

    move-result-object p1

    .line 43
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    .line 44
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 42
    invoke-virtual {p1, v3, p2, p0, v5}, Lcom/helpshift/support/imageloader/ImageLoader;->loadImageWithoutSampling(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;I)V

    goto :goto_0

    .line 47
    :cond_3
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p2, p0}, Lcom/helpshift/views/CircleImageView;->setTag(Ljava/lang/Object;)V

    .line 48
    invoke-virtual {p2, v2}, Lcom/helpshift/views/CircleImageView;->setImageResource(I)V

    :goto_0
    return-void
.end method

.method public static loadConversationHeaderAvatarImage(Landroid/content/Context;Lcom/helpshift/views/CircleImageView;Ljava/lang/String;)V
    .locals 3

    .line 100
    invoke-static {p2}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 101
    invoke-virtual {p1}, Lcom/helpshift/views/CircleImageView;->getWidth()I

    move-result v0

    if-nez v0, :cond_0

    .line 102
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/helpshift/R$dimen;->hs__author_avatar_size:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/helpshift/views/CircleImageView;->getWidth()I

    move-result v0

    .line 103
    :goto_0
    invoke-static {}, Lcom/helpshift/support/imageloader/ImageLoader;->getInstance()Lcom/helpshift/support/imageloader/ImageLoader;

    move-result-object v1

    .line 104
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v2, Lcom/helpshift/R$drawable;->hs__default_support_avatar:I

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 103
    invoke-virtual {v1, p2, p1, p0, v0}, Lcom/helpshift/support/imageloader/ImageLoader;->loadImageWithoutSampling(Ljava/lang/String;Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;I)V

    goto :goto_1

    .line 108
    :cond_1
    sget p0, Lcom/helpshift/R$drawable;->hs__default_support_avatar:I

    invoke-virtual {p1, p0}, Lcom/helpshift/views/CircleImageView;->setImageResource(I)V

    :goto_1
    return-void
.end method
