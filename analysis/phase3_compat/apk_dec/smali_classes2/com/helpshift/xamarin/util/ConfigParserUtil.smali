.class public Lcom/helpshift/xamarin/util/ConfigParserUtil;
.super Ljava/lang/Object;
.source "ConfigParserUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ConfigParserUtil"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static buildApiConfig(Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)Lcom/helpshift/support/ApiConfig;
    .locals 2

    if-eqz p0, :cond_0

    .line 296
    new-instance v0, Lcom/helpshift/support/ApiConfig$Builder;

    invoke-direct {v0}, Lcom/helpshift/support/ApiConfig$Builder;-><init>()V

    iget-object v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->enableContactUs:Lcom/helpshift/xamarin/support/HsEnableContactUs;

    .line 297
    invoke-static {v1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->convertHsEnableContactUsValueToNativeValue(Lcom/helpshift/xamarin/support/HsEnableContactUs;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setEnableContactUs(Ljava/lang/Integer;)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->gotoConversationAfterContactUs:Z

    .line 298
    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setGotoConversationAfterContactUs(Z)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->requireEmail:Z

    .line 299
    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setRequireEmail(Z)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->hideNameAndEmail:Z

    .line 300
    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setHideNameAndEmail(Z)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->conversationPrefillText:Ljava/lang/String;

    .line 301
    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setConversationPrefillText(Ljava/lang/String;)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->enableFullPrivacy:Z

    .line 302
    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setEnableFullPrivacy(Z)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->showSearchOnNewConversation:Z

    .line 303
    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setShowSearchOnNewConversation(Z)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->showConversationResolutionQuestion:Z

    .line 304
    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setShowConversationResolutionQuestion(Z)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->customContactUsFlows:Ljava/util/List;

    .line 305
    invoke-static {v1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildFlows(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setCustomContactUsFlows(Ljava/util/List;)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->withTagsMatching:Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;

    .line 306
    invoke-static {v1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildFaqTagFilter(Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;)Lcom/helpshift/support/FaqTagFilter;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setWithTagsMatching(Lcom/helpshift/support/FaqTagFilter;)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->showConversationInfoScreen:Z

    .line 307
    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setShowConversationInfoScreen(Z)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->enableTypingIndicator:Z

    .line 308
    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setEnableTypingIndicator(Z)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->customIssueFieldsJson:Ljava/lang/String;

    .line 309
    invoke-static {v1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildCustomIssueFields(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setCustomIssueFields(Ljava/util/Map;)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->extrasJson:Ljava/lang/String;

    .line 310
    invoke-static {v1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildExtras(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/support/ApiConfig$Builder;->setExtras(Ljava/util/Map;)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object v0

    iget-object p0, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->customMetadata:Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;

    .line 311
    invoke-static {p0}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildMetadata(Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;)Lcom/helpshift/support/Metadata;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/helpshift/support/ApiConfig$Builder;->setCustomMetadata(Lcom/helpshift/support/Metadata;)Lcom/helpshift/support/ApiConfig$Builder;

    move-result-object p0

    .line 312
    invoke-virtual {p0}, Lcom/helpshift/support/ApiConfig$Builder;->build()Lcom/helpshift/support/ApiConfig;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static buildCustomIssueFields(Ljava/lang/String;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 223
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/helpshift/util/HSJSONUtils;->toMap(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object p0

    invoke-static {p0}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->convertObjectToStringArray(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 225
    sget-object v0, Lcom/helpshift/xamarin/util/ConfigParserUtil;->TAG:Ljava/lang/String;

    const-string v1, "buildCustomIssueFields"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method private static buildExtras(Ljava/lang/String;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 232
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/helpshift/util/HSJSONUtils;->toMap(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 234
    sget-object v0, Lcom/helpshift/xamarin/util/ConfigParserUtil;->TAG:Ljava/lang/String;

    const-string v1, "buildExtras"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method private static buildFaqTagFilter(Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;)Lcom/helpshift/support/FaqTagFilter;
    .locals 2

    if-eqz p0, :cond_0

    .line 194
    new-instance v0, Lcom/helpshift/support/FaqTagFilter;

    iget-object v1, p0, Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;->operator:Ljava/lang/String;

    iget-object p0, p0, Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;->tags:[Ljava/lang/String;

    invoke-direct {v0, v1, p0}, Lcom/helpshift/support/FaqTagFilter;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    return-object v0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static buildFlows(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/xamarin/flows/Flow;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;"
        }
    .end annotation

    .line 240
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p0, :cond_5

    .line 241
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_5

    .line 242
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/xamarin/flows/Flow;

    .line 243
    instance-of v2, v1, Lcom/helpshift/xamarin/flows/HelpshiftDynamicFormFlow;

    if-eqz v2, :cond_1

    .line 244
    new-instance v2, Lcom/helpshift/support/flows/DynamicFormFlow;

    invoke-interface {v1}, Lcom/helpshift/xamarin/flows/Flow;->getLabel()Ljava/lang/String;

    move-result-object v3

    check-cast v1, Lcom/helpshift/xamarin/flows/HelpshiftDynamicFormFlow;

    .line 245
    invoke-virtual {v1}, Lcom/helpshift/xamarin/flows/HelpshiftDynamicFormFlow;->getFlows()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildFlows(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Lcom/helpshift/support/flows/DynamicFormFlow;-><init>(Ljava/lang/String;Ljava/util/List;)V

    .line 244
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 246
    :cond_1
    instance-of v2, v1, Lcom/helpshift/xamarin/flows/HelpshiftFAQsFlow;

    if-eqz v2, :cond_2

    .line 247
    new-instance v2, Lcom/helpshift/support/flows/FAQsFlow;

    invoke-interface {v1}, Lcom/helpshift/xamarin/flows/Flow;->getLabel()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1}, Lcom/helpshift/xamarin/flows/Flow;->getApiConfig()Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;

    move-result-object v1

    invoke-static {v1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildApiConfig(Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)Lcom/helpshift/support/ApiConfig;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Lcom/helpshift/support/flows/FAQsFlow;-><init>(Ljava/lang/String;Lcom/helpshift/support/ApiConfig;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 248
    :cond_2
    instance-of v2, v1, Lcom/helpshift/xamarin/flows/HelpshiftFAQSectionFlow;

    if-eqz v2, :cond_3

    .line 249
    check-cast v1, Lcom/helpshift/xamarin/flows/HelpshiftFAQSectionFlow;

    .line 250
    new-instance v2, Lcom/helpshift/support/flows/FAQSectionFlow;

    invoke-virtual {v1}, Lcom/helpshift/xamarin/flows/HelpshiftFAQSectionFlow;->getLabel()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/helpshift/xamarin/flows/HelpshiftFAQSectionFlow;->getSectionPublishId()Ljava/lang/String;

    move-result-object v4

    .line 251
    invoke-virtual {v1}, Lcom/helpshift/xamarin/flows/HelpshiftFAQSectionFlow;->getApiConfig()Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;

    move-result-object v1

    invoke-static {v1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildApiConfig(Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)Lcom/helpshift/support/ApiConfig;

    move-result-object v1

    invoke-direct {v2, v3, v4, v1}, Lcom/helpshift/support/flows/FAQSectionFlow;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/support/ApiConfig;)V

    .line 250
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 252
    :cond_3
    instance-of v2, v1, Lcom/helpshift/xamarin/flows/HelpshiftSingleFaqFlow;

    if-eqz v2, :cond_4

    .line 253
    check-cast v1, Lcom/helpshift/xamarin/flows/HelpshiftSingleFaqFlow;

    .line 254
    new-instance v2, Lcom/helpshift/support/flows/SingleFAQFlow;

    invoke-virtual {v1}, Lcom/helpshift/xamarin/flows/HelpshiftSingleFaqFlow;->getLabel()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/helpshift/xamarin/flows/HelpshiftSingleFaqFlow;->getFaqPublishId()Ljava/lang/String;

    move-result-object v4

    .line 255
    invoke-virtual {v1}, Lcom/helpshift/xamarin/flows/HelpshiftSingleFaqFlow;->getApiConfig()Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;

    move-result-object v1

    invoke-static {v1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildApiConfig(Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)Lcom/helpshift/support/ApiConfig;

    move-result-object v1

    invoke-direct {v2, v3, v4, v1}, Lcom/helpshift/support/flows/SingleFAQFlow;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/support/ApiConfig;)V

    .line 254
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 256
    :cond_4
    instance-of v2, v1, Lcom/helpshift/xamarin/flows/HelpshiftConversationFlow;

    if-eqz v2, :cond_0

    .line 257
    new-instance v2, Lcom/helpshift/support/flows/ConversationFlow;

    invoke-interface {v1}, Lcom/helpshift/xamarin/flows/Flow;->getLabel()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1}, Lcom/helpshift/xamarin/flows/Flow;->getApiConfig()Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;

    move-result-object v1

    invoke-static {v1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildApiConfig(Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)Lcom/helpshift/support/ApiConfig;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Lcom/helpshift/support/flows/ConversationFlow;-><init>(Ljava/lang/String;Lcom/helpshift/support/ApiConfig;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_5
    return-object v0
.end method

.method public static buildMetadata(Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;)Lcom/helpshift/support/Metadata;
    .locals 4

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    .line 203
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;->metadataJson:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/helpshift/util/HSJSONUtils;->toMap(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v1

    .line 204
    iget-object p0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;->issueTags:[Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v2, "hs-tags"

    if-eqz p0, :cond_0

    .line 205
    :try_start_1
    array-length v3, p0

    if-nez v3, :cond_1

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 206
    :cond_0
    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 207
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_1

    .line 208
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p0

    new-array p0, p0, [Ljava/lang/String;

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    .line 211
    :cond_1
    new-instance v2, Lcom/helpshift/support/Metadata;

    invoke-direct {v2, v1, p0}, Lcom/helpshift/support/Metadata;-><init>(Ljava/util/Map;[Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v2

    :catch_0
    move-exception p0

    .line 213
    sget-object v1, Lcom/helpshift/xamarin/util/ConfigParserUtil;->TAG:Ljava/lang/String;

    const-string v2, "buildMetadata"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    return-object v0
.end method

.method private static convertHsEnableContactUsValueToNativeValue(Lcom/helpshift/xamarin/support/HsEnableContactUs;)Ljava/lang/Integer;
    .locals 1

    if-nez p0, :cond_0

    .line 271
    sget-object p0, Lcom/helpshift/support/Support$EnableContactUs;->ALWAYS:Ljava/lang/Integer;

    return-object p0

    .line 275
    :cond_0
    sget-object v0, Lcom/helpshift/xamarin/util/ConfigParserUtil$1;->$SwitchMap$com$helpshift$xamarin$support$HsEnableContactUs:[I

    invoke-virtual {p0}, Lcom/helpshift/xamarin/support/HsEnableContactUs;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_4

    const/4 v0, 0x2

    if-eq p0, v0, :cond_3

    const/4 v0, 0x3

    if-eq p0, v0, :cond_2

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    .line 289
    sget-object p0, Lcom/helpshift/support/Support$EnableContactUs;->ALWAYS:Ljava/lang/Integer;

    goto :goto_0

    .line 286
    :cond_1
    sget-object p0, Lcom/helpshift/support/Support$EnableContactUs;->NEVER:Ljava/lang/Integer;

    goto :goto_0

    .line 283
    :cond_2
    sget-object p0, Lcom/helpshift/support/Support$EnableContactUs;->AFTER_MARKING_ANSWER_UNHELPFUL:Ljava/lang/Integer;

    goto :goto_0

    .line 280
    :cond_3
    sget-object p0, Lcom/helpshift/support/Support$EnableContactUs;->AFTER_VIEWING_FAQS:Ljava/lang/Integer;

    goto :goto_0

    .line 277
    :cond_4
    sget-object p0, Lcom/helpshift/support/Support$EnableContactUs;->ALWAYS:Ljava/lang/Integer;

    :goto_0
    return-object p0
.end method

.method private static convertObjectToStringArray(Ljava/util/Map;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 180
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-eqz p0, :cond_1

    .line 181
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 182
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 183
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/util/List;

    if-eqz v2, :cond_0

    .line 184
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 185
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static parseConfigDictionary(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 48
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 49
    invoke-static {v0}, Lcom/helpshift/util/HSJSONUtils;->toMap(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object p1

    .line 50
    invoke-static {p0, p1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->parseConfigDictionary(Landroid/content/Context;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public static parseConfigDictionary(Landroid/content/Context;Ljava/util/Map;)Ljava/util/Map;
    .locals 6

    if-nez p1, :cond_0

    .line 61
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-object p0

    :cond_0
    const-string v0, "enableContactUs"

    .line 64
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 65
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "yes"

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 66
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "always"

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    .line 68
    :cond_1
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "no"

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 69
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "never"

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 71
    :cond_2
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "after_viewing_faqs"

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 72
    sget-object v1, Lcom/helpshift/support/Support$EnableContactUs;->AFTER_VIEWING_FAQS:Ljava/lang/Integer;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 73
    :cond_3
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "after_marking_answer_unhelpful"

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 74
    sget-object v1, Lcom/helpshift/support/Support$EnableContactUs;->AFTER_MARKING_ANSWER_UNHELPFUL:Ljava/lang/Integer;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 70
    :cond_4
    :goto_0
    sget-object v1, Lcom/helpshift/support/Support$EnableContactUs;->NEVER:Ljava/lang/Integer;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 67
    :cond_5
    :goto_1
    sget-object v1, Lcom/helpshift/support/Support$EnableContactUs;->ALWAYS:Ljava/lang/Integer;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    :cond_6
    :goto_2
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    const-string v1, "enableInAppNotification"

    .line 79
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "requireEmail"

    .line 80
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "hideNameAndEmail"

    .line 81
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "enableFullPrivacy"

    .line 82
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "showSearchOnNewConversation"

    .line 83
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "gotoConversationAfterContactUs"

    .line 84
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "showConversationResolutionQuestion"

    .line 85
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "enableDefaultFallbackLanguage"

    .line 86
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "showConversationInfoScreen"

    .line 87
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const-string v1, "enableTypingIndicator"

    .line 88
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 89
    invoke-static {v0, p1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->replaceWithBoolean(Ljava/util/HashSet;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    const-string v0, "hs-custom-metadata"

    .line 91
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    check-cast v1, Ljava/util/HashMap;

    if-eqz v1, :cond_8

    const-string v2, "hs-tags"

    .line 93
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    if-eqz v3, :cond_7

    .line 94
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_7

    .line 95
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    check-cast v3, [Ljava/lang/String;

    .line 96
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    :cond_7
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    :cond_8
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "hs-custom-issue-field"

    .line 103
    invoke-interface {p1, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    if-eqz v2, :cond_a

    .line 105
    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v3

    if-lez v3, :cond_a

    .line 106
    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_9
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 107
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_9

    .line 108
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 112
    :cond_a
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v2

    if-lez v2, :cond_b

    .line 113
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b
    const-string v0, "withTagsMatching"

    .line 116
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    check-cast v1, Ljava/util/HashMap;

    if-eqz v1, :cond_d

    const-string v2, "tags"

    .line 118
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    if-eqz v3, :cond_c

    .line 119
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_c

    .line 120
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    check-cast v3, [Ljava/lang/String;

    .line 121
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    :cond_c
    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_d
    const-string v0, "customContactUsFlows"

    .line 126
    invoke-static {p0, p1, v0}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->parseFlowListForKey(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_e

    .line 128
    invoke-interface {p1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_e
    return-object p1
.end method

.method public static parseFlowList(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)",
            "Ljava/util/List;"
        }
    .end annotation

    .line 151
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    const-string v2, "type"

    .line 152
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const-string v3, "dynamicFormFlow"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "data"

    .line 153
    invoke-static {p0, v1, v2}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->parseFlowListForKey(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;)Ljava/util/List;

    goto :goto_0

    :cond_0
    const-string v2, "config"

    .line 155
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/HashMap;

    .line 156
    invoke-static {p0, v3}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->parseConfigDictionary(Landroid/content/Context;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v3

    .line 157
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 160
    :cond_1
    invoke-static {p0, p1}, Lcom/helpshift/support/util/DynamicFormUtil;->toFlowList(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method private static parseFlowListForKey(Landroid/content/Context;Ljava/util/Map;Ljava/lang/String;)Ljava/util/List;
    .locals 2

    const/4 v0, 0x0

    .line 138
    :try_start_0
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 140
    sget-object p2, Lcom/helpshift/xamarin/util/ConfigParserUtil;->TAG:Ljava/lang/String;

    const-string v1, "parseFlowListForKey"

    invoke-static {p2, v1, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object p1, v0

    :goto_0
    if-eqz p1, :cond_0

    .line 144
    invoke-static {p0, p1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->parseFlowList(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_0
    return-object v0
.end method

.method public static replaceWithBoolean(Ljava/util/HashSet;Ljava/util/Map;)Ljava/util/Map;
    .locals 4

    .line 164
    invoke-virtual {p0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 165
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 166
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 167
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 168
    instance-of v2, v1, Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 169
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "yes"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    .line 170
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 171
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "no"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    .line 172
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    return-object p1
.end method
