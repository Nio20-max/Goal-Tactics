.class public Lcom/helpshift/support/storage/SupportKeyValueDBStorage;
.super Ljava/lang/Object;
.source "SupportKeyValueDBStorage.java"

# interfaces
.implements Lcom/helpshift/common/platform/KVStore;


# instance fields
.field private storage:Lcom/helpshift/storage/KeyValueStorage;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/helpshift/support/storage/SupportRetryKeyValueDBStorage;

    invoke-direct {v0, p1}, Lcom/helpshift/support/storage/SupportRetryKeyValueDBStorage;-><init>(Landroid/content/Context;)V

    .line 24
    new-instance p1, Lcom/helpshift/storage/CachedKeyValueStorage;

    .line 25
    invoke-direct {p0}, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->getCacheWhitelistKeys()Ljava/util/Set;

    move-result-object v1

    invoke-direct {p1, v0, v1}, Lcom/helpshift/storage/CachedKeyValueStorage;-><init>(Lcom/helpshift/storage/KeyValueStorage;Ljava/util/Set;)V

    iput-object p1, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    return-void
.end method

.method private getCacheWhitelistKeys()Ljava/util/Set;
    .locals 42
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 30
    new-instance v0, Ljava/util/HashSet;

    const-string v1, "sdkLanguage"

    const-string v2, "disableInAppConversation"

    const-string v3, "debugLogLimit"

    const-string v4, "enableTypingIndicatorAgent"

    const-string v5, "enableTypingIndicator"

    const-string v6, "fullPrivacy"

    const-string v7, "showConversationInfoScreen"

    const-string v8, "runtimeVersion"

    const-string v9, "sdkType"

    const-string v10, "disableAppLaunchEvent"

    const-string v11, "pluginVersion"

    const-string v12, "profileFormEnable"

    const-string v13, "requireNameAndEmail"

    const-string v14, "requireEmail"

    const-string v15, "hideNameAndEmail"

    const-string v16, "gotoConversationAfterContactUs"

    const-string v17, "showSearchOnNewConversation"

    const-string v18, "supportNotificationChannelId"

    const-string v19, "notificationIconId"

    const-string v20, "notificationLargeIconId"

    const-string v21, "app_reviewed"

    const-string v22, "defaultFallbackLanguageEnable"

    const-string v23, "conversationGreetingMessage"

    const-string v24, "conversationalIssueFiling"

    const-string v25, "showConversationResolutionQuestion"

    const-string v26, "showConversationResolutionQuestionAgent"

    const-string v27, "allowUserAttachments"

    const-string v28, "server_time_delta"

    const-string v29, "disableHelpshiftBrandingAgent"

    const-string v30, "disableHelpshiftBranding"

    const-string v31, "periodicReviewEnabled"

    const-string v32, "periodicReviewInterval"

    const-string v33, "periodicReviewType"

    const-string v34, "customerSatisfactionSurvey"

    const-string v35, "showConversationHistoryAgent"

    const-string v36, "enableDefaultConversationalFiling"

    const-string v37, "avatarTemplateUrl"

    const-string v38, "headerImageLocalPath"

    const-string v39, "agentFallbackImageLocalPath"

    const-string v40, "botFallbackImageLocalPath"

    const-string v41, "headerText"

    filled-new-array/range {v1 .. v41}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method private setOrRemoveKeyInternal(Ljava/lang/String;Ljava/io/Serializable;)V
    .locals 1

    if-nez p2, :cond_0

    .line 213
    iget-object p2, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {p2, p1}, Lcom/helpshift/storage/KeyValueStorage;->removeKey(Ljava/lang/String;)V

    goto :goto_0

    .line 216
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1, p2}, Lcom/helpshift/storage/KeyValueStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    :goto_0
    return-void
.end method


# virtual methods
.method public getBoolean(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 106
    :cond_0
    check-cast p1, Ljava/lang/Boolean;

    return-object p1
.end method

.method public getBoolean(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p2

    .line 115
    :cond_0
    check-cast p1, Ljava/lang/Boolean;

    return-object p1
.end method

.method public getFloat(Ljava/lang/String;)Ljava/lang/Float;
    .locals 1

    .line 138
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 142
    :cond_0
    check-cast p1, Ljava/lang/Float;

    return-object p1
.end method

.method public getFloat(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p2

    .line 151
    :cond_0
    check-cast p1, Ljava/lang/Float;

    return-object p1
.end method

.method public getInt(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 124
    :cond_0
    check-cast p1, Ljava/lang/Integer;

    return-object p1
.end method

.method public getInt(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p2

    .line 133
    :cond_0
    check-cast p1, Ljava/lang/Integer;

    return-object p1
.end method

.method public getLong(Ljava/lang/String;)Ljava/lang/Long;
    .locals 1

    .line 156
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 160
    :cond_0
    check-cast p1, Ljava/lang/Long;

    return-object p1
.end method

.method public getLong(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p2

    .line 169
    :cond_0
    check-cast p1, Ljava/lang/Long;

    return-object p1
.end method

.method public getSerializable(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 174
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 178
    :cond_0
    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p2

    .line 187
    :cond_0
    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public removeAllKeys()V
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0}, Lcom/helpshift/storage/KeyValueStorage;->removeAllKeys()V

    return-void
.end method

.method public setBoolean(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->setOrRemoveKeyInternal(Ljava/lang/String;Ljava/io/Serializable;)V

    return-void
.end method

.method public setFloat(Ljava/lang/String;Ljava/lang/Float;)V
    .locals 0

    .line 87
    invoke-direct {p0, p1, p2}, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->setOrRemoveKeyInternal(Ljava/lang/String;Ljava/io/Serializable;)V

    return-void
.end method

.method public setInt(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .line 82
    invoke-direct {p0, p1, p2}, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->setOrRemoveKeyInternal(Ljava/lang/String;Ljava/io/Serializable;)V

    return-void
.end method

.method public setKeyValues(Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/io/Serializable;",
            ">;)V"
        }
    .end annotation

    .line 208
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    invoke-interface {v0, p1}, Lcom/helpshift/storage/KeyValueStorage;->setKeyValues(Ljava/util/Map;)Z

    return-void
.end method

.method public setLong(Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0

    .line 92
    invoke-direct {p0, p1, p2}, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->setOrRemoveKeyInternal(Ljava/lang/String;Ljava/io/Serializable;)V

    return-void
.end method

.method public setSerializable(Ljava/lang/String;Ljava/io/Serializable;)V
    .locals 0

    .line 192
    invoke-direct {p0, p1, p2}, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->setOrRemoveKeyInternal(Ljava/lang/String;Ljava/io/Serializable;)V

    return-void
.end method

.method public setString(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 97
    invoke-direct {p0, p1, p2}, Lcom/helpshift/support/storage/SupportKeyValueDBStorage;->setOrRemoveKeyInternal(Ljava/lang/String;Ljava/io/Serializable;)V

    return-void
.end method
