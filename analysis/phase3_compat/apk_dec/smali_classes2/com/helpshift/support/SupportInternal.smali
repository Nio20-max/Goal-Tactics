.class public final Lcom/helpshift/support/SupportInternal;
.super Ljava/lang/Object;
.source "SupportInternal.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/SupportInternal$EnableContactUs;,
        Lcom/helpshift/support/SupportInternal$RateAlert;
    }
.end annotation


# static fields
.field public static final CONVERSATION_FLOW:Ljava/lang/String; = "conversationFlow"

.field public static final CustomMetadataKey:Ljava/lang/String; = "hs-custom-metadata"

.field public static final DYNAMIC_FORM_FLOW:Ljava/lang/String; = "dynamicFormFlow"

.field public static final FAQS_FLOW:Ljava/lang/String; = "faqsFlow"

.field public static final FAQ_SECTION_FLOW:Ljava/lang/String; = "faqSectionFlow"

.field public static final SINGLE_FAQ_FLOW:Ljava/lang/String; = "singleFaqFlow"

.field public static final TAG:Ljava/lang/String; = "Helpshift_SupportInter"

.field private static context:Landroid/content/Context;

.field private static data:Lcom/helpshift/support/HSApiData;

.field private static storage:Lcom/helpshift/support/HSStorage;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cleanConfig(Ljava/util/HashMap;)Landroid/os/Bundle;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Landroid/os/Bundle;"
        }
    .end annotation

    const-string v0, "conversationPrefillText"

    const-string v1, "toolbarId"

    .line 1024
    new-instance v2, Ljava/util/HashMap;

    invoke-static {}, Lcom/helpshift/support/util/ConfigUtil;->getDefaultApiConfig()Ljava/util/Map;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 1025
    invoke-virtual {v2, p0}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 1027
    invoke-static {v2}, Lcom/helpshift/support/ContactUsFilter;->setConfig(Ljava/util/HashMap;)V

    .line 1028
    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 1029
    invoke-static {v2}, Lcom/helpshift/support/SupportInternal;->createMetadataCallback(Ljava/util/HashMap;)V

    .line 1030
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 1032
    new-instance v4, Lcom/helpshift/configuration/dto/RootApiConfig$RootApiConfigBuilder;

    invoke-direct {v4}, Lcom/helpshift/configuration/dto/RootApiConfig$RootApiConfigBuilder;-><init>()V

    invoke-virtual {v4, v2}, Lcom/helpshift/configuration/dto/RootApiConfig$RootApiConfigBuilder;->applyMap(Ljava/util/Map;)Lcom/helpshift/configuration/dto/RootApiConfig$RootApiConfigBuilder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/helpshift/configuration/dto/RootApiConfig$RootApiConfigBuilder;->build()Lcom/helpshift/configuration/dto/RootApiConfig;

    move-result-object v4

    .line 1033
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v5

    invoke-interface {v5, v4}, Lcom/helpshift/CoreApi;->updateApiConfig(Lcom/helpshift/configuration/dto/RootApiConfig;)V

    .line 1036
    invoke-static {v2}, Lcom/helpshift/support/SupportInternal;->updateCustomIssueFieldData(Ljava/util/Map;)V

    .line 1042
    :try_start_0
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1045
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "null"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "hs-custom-metadata"

    .line 1049
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "dropMeta"

    const/4 v4, 0x1

    .line 1050
    invoke-virtual {p0, v0, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1055
    :cond_0
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1056
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Helpshift_SupportInter"

    const-string v4, "JSON exception while parsing config : "

    .line 1060
    invoke-static {v1, v4, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    const/4 v0, 0x0

    const-string v1, "showSearchOnNewConversation"

    .line 1064
    invoke-virtual {v3, v1, v0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 1063
    invoke-virtual {p0, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "withTagsMatching"

    .line 1067
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/helpshift/support/SupportInternal;->cleanFaqTagFilter(Ljava/lang/Object;)Lcom/helpshift/support/FaqTagFilter;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    const-string v0, "customContactUsFlows"

    .line 1073
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 1074
    invoke-static {v0}, Lcom/helpshift/support/flows/CustomContactUsFlowListHolder;->setFlowList(Ljava/util/List;)V

    return-object p0
.end method

.method private static cleanFaqTagFilter(Ljava/lang/Object;)Lcom/helpshift/support/FaqTagFilter;
    .locals 6

    const-string v0, "not"

    const-string v1, "or"

    const-string v2, "and"

    const/4 v3, 0x0

    if-nez p0, :cond_0

    return-object v3

    .line 1101
    :cond_0
    :try_start_0
    check-cast p0, Ljava/util/Map;

    const-string v4, "operator"

    .line 1103
    invoke-interface {p0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 1104
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 1105
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "tags"

    .line 1106
    invoke-interface {p0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    check-cast p0, [Ljava/lang/String;

    if-eqz p0, :cond_3

    .line 1108
    array-length v5, p0

    if-lez v5, :cond_3

    .line 1109
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1110
    new-instance v0, Lcom/helpshift/support/FaqTagFilter;

    invoke-direct {v0, v2, p0}, Lcom/helpshift/support/FaqTagFilter;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    return-object v0

    .line 1112
    :cond_1
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1113
    new-instance v0, Lcom/helpshift/support/FaqTagFilter;

    invoke-direct {v0, v1, p0}, Lcom/helpshift/support/FaqTagFilter;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    return-object v0

    .line 1115
    :cond_2
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1116
    new-instance v1, Lcom/helpshift/support/FaqTagFilter;

    invoke-direct {v1, v0, p0}, Lcom/helpshift/support/FaqTagFilter;-><init>(Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception p0

    const-string v0, "Helpshift_SupportInter"

    const-string v1, "Invalid FaqTagFilter object in config"

    .line 1122
    invoke-static {v0, v1, p0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    return-object v3
.end method

.method public static clearAnonymousUser()Z
    .locals 1

    .line 1302
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->clearAnonymousUser()Z

    move-result v0

    return v0
.end method

.method public static clearBreadCrumbs()V
    .locals 1

    .line 508
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getMetaDataDM()Lcom/helpshift/meta/MetaDataDM;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/meta/MetaDataDM;->clearBreadCrumbs()V

    return-void
.end method

.method private static createMetadataCallback(Ljava/util/HashMap;)V
    .locals 1

    const-string v0, "hs-custom-metadata"

    .line 871
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 872
    new-instance v0, Lcom/helpshift/support/SupportInternal$3;

    invoke-direct {v0, p0}, Lcom/helpshift/support/SupportInternal$3;-><init>(Ljava/util/HashMap;)V

    .line 883
    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->setMetadataCallback(Lcom/helpshift/support/Callable;)V

    :cond_0
    return-void
.end method

.method public static getConversationFragment(Landroid/app/Activity;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/helpshift/support/fragments/SupportFragment;"
        }
    .end annotation

    .line 1347
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    const/4 p1, 0x1

    new-array v1, p1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    const-string v2, "Config"

    .line 1349
    invoke-static {v2, v0}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromMap(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "Helpshift_SupportInter"

    const-string v4, "Get Conversation fragment : "

    invoke-static {v2, v4, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    .line 1350
    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->removeShowConversationUnsupportedConfigs(Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->cleanConfig(Ljava/util/HashMap;)Landroid/os/Bundle;

    move-result-object v0

    .line 1351
    invoke-static {p0}, Lcom/helpshift/util/ActivityUtil;->isFullScreen(Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    const-string v2, "showInFullScreen"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "support_mode"

    .line 1352
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "decomp"

    .line 1353
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1354
    invoke-static {p0}, Lcom/helpshift/util/ActivityUtil;->isFullScreen(Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "isRoot"

    .line 1355
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "search_performed"

    .line 1356
    invoke-virtual {v0, p0, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "is_embedded"

    .line 1357
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1358
    invoke-static {v0}, Lcom/helpshift/support/fragments/SupportFragment;->newInstance(Landroid/os/Bundle;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getDynamicFormFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/helpshift/support/fragments/SupportFragment;"
        }
    .end annotation

    .line 1396
    invoke-static {p2}, Lcom/helpshift/support/flows/DynamicFormFlowListHolder;->setFlowList(Ljava/util/List;)V

    .line 1397
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2, p3}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    const/4 p3, 0x1

    new-array v0, p3, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    const-string v1, "Config"

    .line 1399
    invoke-static {v1, p2}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromMap(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "Helpshift_SupportInter"

    const-string v2, "Get dynamic flow fragment : "

    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    .line 1400
    invoke-static {p2}, Lcom/helpshift/support/SupportInternal;->cleanConfig(Ljava/util/HashMap;)Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "support_mode"

    const/4 v1, 0x4

    .line 1401
    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1402
    invoke-static {p0}, Lcom/helpshift/util/ActivityUtil;->isFullScreen(Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    const-string v0, "showInFullScreen"

    invoke-virtual {p2, v0, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1403
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string p1, "flow_title"

    invoke-virtual {p2, p1, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "decomp"

    .line 1404
    invoke-virtual {p2, p0, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "is_embedded"

    .line 1405
    invoke-virtual {p2, p0, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1406
    invoke-static {p2}, Lcom/helpshift/support/fragments/SupportFragment;->newInstance(Landroid/os/Bundle;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getFAQSectionFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/helpshift/support/fragments/SupportFragment;"
        }
    .end annotation

    .line 1363
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 1365
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Get FAQ section fragment : Publish Id : "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x1

    new-array v2, v1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    const-string v3, "Config"

    .line 1366
    invoke-static {v3, v0}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromMap(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "Helpshift_SupportInter"

    .line 1365
    invoke-static {v3, p2, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    .line 1367
    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->removeFAQFlowUnsupportedConfigs(Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object p2

    invoke-static {p2}, Lcom/helpshift/support/SupportInternal;->cleanConfig(Ljava/util/HashMap;)Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "support_mode"

    const/4 v2, 0x2

    .line 1368
    invoke-virtual {p2, v0, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "sectionPublishId"

    .line 1369
    invoke-virtual {p2, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1370
    invoke-static {p0}, Lcom/helpshift/util/ActivityUtil;->isFullScreen(Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    const-string p1, "showInFullScreen"

    invoke-virtual {p2, p1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "decomp"

    .line 1371
    invoke-virtual {p2, p0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "isRoot"

    .line 1372
    invoke-virtual {p2, p0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "is_embedded"

    .line 1373
    invoke-virtual {p2, p0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1374
    invoke-static {p2}, Lcom/helpshift/support/fragments/SupportFragment;->newInstance(Landroid/os/Bundle;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getFAQsFragment(Landroid/app/Activity;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/helpshift/support/fragments/SupportFragment;"
        }
    .end annotation

    .line 1337
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    const/4 p1, 0x1

    new-array v1, p1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    const-string v2, "Config"

    .line 1339
    invoke-static {v2, v0}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromMap(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "Helpshift_SupportInter"

    const-string v3, "Get FAQ fragment : "

    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    .line 1340
    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->removeFAQFlowUnsupportedConfigs(Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->cleanConfig(Ljava/util/HashMap;)Landroid/os/Bundle;

    move-result-object v0

    .line 1341
    invoke-static {p0}, Lcom/helpshift/util/ActivityUtil;->isFullScreen(Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    const-string v1, "showInFullScreen"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "is_embedded"

    .line 1342
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1343
    invoke-static {v0}, Lcom/helpshift/support/fragments/SupportFragment;->newInstance(Landroid/os/Bundle;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method private static getIssueId(Landroid/content/Intent;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    .line 1193
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 1198
    :cond_0
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p0

    const-string v1, "issue"

    .line 1199
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p1, "issue_id"

    .line 1200
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const-string v1, "preissue"

    .line 1202
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "preissue_id"

    .line 1203
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_2
    :goto_0
    return-object v0
.end method

.method private static getIssueType(Landroid/content/Intent;)Ljava/lang/String;
    .locals 1

    if-eqz p0, :cond_1

    .line 1210
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 1214
    :cond_0
    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p0

    const-string v0, "issue_type"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getNotificationCount()Ljava/lang/Integer;
    .locals 1

    .line 318
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getNotificationCountSync()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public static getNotificationCount(Landroid/os/Handler;Landroid/os/Handler;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    .line 350
    :cond_0
    sget-object v0, Lcom/helpshift/support/SupportInternal;->data:Lcom/helpshift/support/HSApiData;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/helpshift/support/SupportInternal;->storage:Lcom/helpshift/support/HSStorage;

    if-nez v0, :cond_3

    .line 351
    :cond_1
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :cond_2

    return-void

    .line 354
    :cond_2
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->init(Landroid/content/Context;)V

    .line 357
    :cond_3
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    new-instance v1, Lcom/helpshift/support/SupportInternal$1;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/support/SupportInternal$1;-><init>(Landroid/os/Handler;Landroid/os/Handler;)V

    .line 358
    invoke-interface {v0, v1}, Lcom/helpshift/CoreApi;->getNotificationCountAsync(Lcom/helpshift/util/FetchDataFromThread;)V

    return-void
.end method

.method public static getSingleFAQFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/helpshift/support/fragments/SupportFragment;"
        }
    .end annotation

    .line 1379
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 1381
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Get single FAQ fragment : Publish Id : "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x1

    new-array v2, v1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    const-string v3, "Config"

    .line 1382
    invoke-static {v3, v0}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromMap(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "Helpshift_SupportInter"

    .line 1381
    invoke-static {v3, p2, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    .line 1383
    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->removeFAQFlowUnsupportedConfigs(Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object p2

    invoke-static {p2}, Lcom/helpshift/support/SupportInternal;->cleanConfig(Ljava/util/HashMap;)Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "support_mode"

    const/4 v2, 0x3

    .line 1384
    invoke-virtual {p2, v0, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "questionPublishId"

    .line 1385
    invoke-virtual {p2, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1386
    invoke-static {p0}, Lcom/helpshift/util/ActivityUtil;->isFullScreen(Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    const-string p1, "showInFullScreen"

    invoke-virtual {p2, p1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "decomp"

    .line 1387
    invoke-virtual {p2, p0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "isRoot"

    .line 1388
    invoke-virtual {p2, p0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "is_embedded"

    .line 1389
    invoke-virtual {p2, p0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1390
    invoke-static {p2}, Lcom/helpshift/support/fragments/SupportFragment;->newInstance(Landroid/os/Bundle;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static handlePush(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    .line 1174
    invoke-static {p0}, Lcom/helpshift/support/SupportInternal;->init(Landroid/content/Context;)V

    .line 1176
    invoke-static {p1}, Lcom/helpshift/support/SupportInternal;->getIssueType(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p0

    .line 1177
    invoke-static {p1, p0}, Lcom/helpshift/support/SupportInternal;->getIssueId(Landroid/content/Intent;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p0, "Helpshift_SupportInter"

    const-string p1, "Unknown issuetype/issueId in push payload"

    .line 1180
    invoke-static {p0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v1, 0x0

    .line 1185
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_1

    const-string v2, "app_name"

    .line 1186
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1187
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1189
    :cond_1
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1, p0, v0, v1}, Lcom/helpshift/CoreApi;->handlePushNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static init(Landroid/app/Application;)V
    .locals 0

    .line 101
    invoke-virtual {p0}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/helpshift/support/SupportInternal;->initialize(Landroid/content/Context;)V

    return-void
.end method

.method private static init(Landroid/content/Context;)V
    .locals 0

    .line 105
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/helpshift/support/SupportInternal;->initialize(Landroid/content/Context;)V

    return-void
.end method

.method private static initialize(Landroid/content/Context;)V
    .locals 1

    .line 109
    sget-object v0, Lcom/helpshift/support/SupportInternal;->context:Landroid/content/Context;

    if-nez v0, :cond_0

    .line 110
    new-instance v0, Lcom/helpshift/support/HSApiData;

    invoke-direct {v0, p0}, Lcom/helpshift/support/HSApiData;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/helpshift/support/SupportInternal;->data:Lcom/helpshift/support/HSApiData;

    .line 111
    iget-object v0, v0, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    sput-object v0, Lcom/helpshift/support/SupportInternal;->storage:Lcom/helpshift/support/HSStorage;

    .line 112
    invoke-static {p0}, Lcom/helpshift/support/ContactUsFilter;->init(Landroid/content/Context;)V

    .line 113
    sput-object p0, Lcom/helpshift/support/SupportInternal;->context:Landroid/content/Context;

    :cond_0
    return-void
.end method

.method public static install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 174
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, p1, p2, p3, v0}, Lcom/helpshift/support/SupportInternal;->install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 231
    invoke-static {p0}, Lcom/helpshift/support/SupportInternal;->init(Landroid/app/Application;)V

    .line 234
    new-instance p1, Lcom/helpshift/support/providers/SupportDataProvider;

    invoke-direct {p1}, Lcom/helpshift/support/providers/SupportDataProvider;-><init>()V

    invoke-static {p1}, Lcom/helpshift/providers/CrossModuleDataProvider;->setSupportDataProvider(Lcom/helpshift/providers/ISupportDataProvider;)V

    .line 236
    invoke-static {}, Lcom/helpshift/support/util/ConfigUtil;->getDefaultInstallConfig()Ljava/util/Map;

    move-result-object p1

    check-cast p1, Ljava/util/HashMap;

    if-eqz p4, :cond_0

    .line 238
    invoke-virtual {p1, p4}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 241
    :cond_0
    invoke-virtual {p0}, Landroid/app/Application;->getPackageName()Ljava/lang/String;

    move-result-object p2

    .line 242
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object p3

    iget-object p3, p3, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    const-string p4, "notificationIcon"

    .line 243
    invoke-virtual {p1, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 244
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 245
    check-cast v0, Ljava/lang/String;

    const-string v1, "drawable"

    invoke-static {p0, v0, v1, p2}, Lcom/helpshift/util/ApplicationUtil;->getResourceIdFromName(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 246
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, p4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    const-string p4, "notificationSound"

    .line 249
    invoke-virtual {p1, p4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 250
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 251
    check-cast v0, Ljava/lang/String;

    const-string v1, "raw"

    invoke-static {p0, v0, v1, p2}, Lcom/helpshift/util/ApplicationUtil;->getResourceIdFromName(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    .line 252
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p4, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    :cond_2
    new-instance p2, Lcom/helpshift/configuration/dto/RootInstallConfig$RootInstallConfigBuilder;

    invoke-direct {p2}, Lcom/helpshift/configuration/dto/RootInstallConfig$RootInstallConfigBuilder;-><init>()V

    invoke-virtual {p2, p1}, Lcom/helpshift/configuration/dto/RootInstallConfig$RootInstallConfigBuilder;->applyMap(Ljava/util/Map;)Lcom/helpshift/configuration/dto/RootInstallConfig$RootInstallConfigBuilder;

    move-result-object p2

    invoke-virtual {p2}, Lcom/helpshift/configuration/dto/RootInstallConfig$RootInstallConfigBuilder;->build()Lcom/helpshift/configuration/dto/RootInstallConfig;

    move-result-object p2

    .line 258
    sget-object p4, Lcom/helpshift/support/SupportInternal;->context:Landroid/content/Context;

    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v0

    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/CoreApi;->getDomain()Lcom/helpshift/common/domain/Domain;

    move-result-object v1

    sget-object v2, Lcom/helpshift/support/SupportInternal;->data:Lcom/helpshift/support/HSApiData;

    sget-object v3, Lcom/helpshift/support/SupportInternal;->storage:Lcom/helpshift/support/HSStorage;

    invoke-static {p4, v0, v1, v2, v3}, Lcom/helpshift/support/SupportMigrator;->migrate(Landroid/content/Context;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/support/HSApiData;Lcom/helpshift/support/HSStorage;)V

    .line 260
    iget-object p4, p2, Lcom/helpshift/configuration/dto/RootInstallConfig;->fontPath:Ljava/lang/String;

    invoke-virtual {p3, p4}, Lcom/helpshift/model/AppInfoModel;->setFontPath(Ljava/lang/String;)V

    .line 263
    invoke-virtual {p3}, Lcom/helpshift/model/AppInfoModel;->getFontPath()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Lcom/helpshift/views/FontApplier;->setFontPath(Ljava/lang/String;)V

    .line 265
    const-class p4, Ljava/lang/Integer;

    const/4 v0, 0x0

    const-string v1, "screenOrientation"

    invoke-static {p1, v1, p4, v0}, Lcom/helpshift/util/MapUtil;->getValue(Ljava/util/Map;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-nez p1, :cond_3

    const/4 p1, -0x1

    goto :goto_0

    .line 266
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    .line 267
    invoke-virtual {p3, p1}, Lcom/helpshift/model/AppInfoModel;->setScreenOrientation(Ljava/lang/Integer;)V

    .line 269
    iget-object p1, p2, Lcom/helpshift/configuration/dto/RootInstallConfig;->disableAnimations:Ljava/lang/Boolean;

    const/4 p4, 0x0

    if-nez p1, :cond_4

    const/4 p1, 0x0

    goto :goto_1

    .line 270
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    :goto_1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    .line 271
    invoke-virtual {p3, p1}, Lcom/helpshift/model/AppInfoModel;->setDisableAnimations(Ljava/lang/Boolean;)V

    .line 273
    sget-object p1, Lcom/helpshift/support/SupportInternal;->context:Landroid/content/Context;

    invoke-static {p1}, Lcom/helpshift/util/ApplicationUtil;->getApplicationVersion(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 275
    sget-object p3, Lcom/helpshift/support/SupportInternal;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {p3}, Lcom/helpshift/support/HSStorage;->getApplicationVersion()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-nez p3, :cond_5

    .line 276
    sget-object p3, Lcom/helpshift/support/SupportInternal;->data:Lcom/helpshift/support/HSApiData;

    invoke-virtual {p3}, Lcom/helpshift/support/HSApiData;->resetReviewCounter()V

    .line 277
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p3

    invoke-interface {p3}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object p3

    invoke-virtual {p3, p4}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->setAppReviewed(Z)V

    .line 278
    sget-object p3, Lcom/helpshift/support/SupportInternal;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {p3, p1}, Lcom/helpshift/support/HSStorage;->setApplicationVersion(Ljava/lang/String;)V

    .line 281
    :cond_5
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/helpshift/CoreApi;->updateInstallConfig(Lcom/helpshift/configuration/dto/RootInstallConfig;)V

    const-string p1, "__hs__db_error_reports"

    .line 283
    invoke-virtual {p0, p1}, Landroid/app/Application;->deleteDatabase(Ljava/lang/String;)Z

    .line 285
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p0

    invoke-interface {p0}, Lcom/helpshift/CoreApi;->updateConversationExpiryProperties()V

    .line 287
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p0

    invoke-interface {p0}, Lcom/helpshift/CoreApi;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object p0

    invoke-virtual {p0}, Lcom/helpshift/account/domainmodel/UserManagerDM;->getActiveUser()Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object p0

    if-nez p0, :cond_6

    const-string p0, "Helpshift_SupportInter"

    const-string p1, "Active user null"

    .line 288
    invoke-static {p0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p0

    invoke-interface {p0}, Lcom/helpshift/CoreApi;->getDomain()Lcom/helpshift/common/domain/Domain;

    move-result-object p0

    sget-object p1, Lcom/helpshift/common/HSBlockReason;->FETCH_ACTIVE_USER_ERROR:Lcom/helpshift/common/HSBlockReason;

    invoke-virtual {p0, p1}, Lcom/helpshift/common/domain/Domain;->blockPublicAPI(Lcom/helpshift/common/HSBlockReason;)V

    :cond_6
    return-void
.end method

.method public static isConversationActive()Z
    .locals 1

    .line 305
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->isActiveConversationActionable()Z

    move-result v0

    return v0
.end method

.method private static isValidPublishId(Ljava/lang/String;)Z
    .locals 1

    if-eqz p0, :cond_0

    .line 1020
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const-string v0, "\\d+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static leaveBreadCrumb(Ljava/lang/String;)V
    .locals 1

    if-eqz p0, :cond_0

    .line 490
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 491
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getMetaDataDM()Lcom/helpshift/meta/MetaDataDM;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/helpshift/meta/MetaDataDM;->pushBreadCrumb(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static login(Lcom/helpshift/HelpshiftUser;)Z
    .locals 1

    .line 1289
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/helpshift/CoreApi;->login(Lcom/helpshift/HelpshiftUser;)Z

    move-result p0

    return p0
.end method

.method public static logout()Z
    .locals 1

    .line 1298
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->logout()Z

    move-result v0

    return v0
.end method

.method public static preInstall(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 6

    .line 134
    sget-object v5, Lcom/helpshift/support/db/SupportDBNameRepo;->dbNames:Ljava/util/Map;

    const-string v1, "HSJsonData"

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-static/range {v0 .. v5}, Lcom/helpshift/util/SDKSanityCheck;->checkInstallCredsSanity(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 141
    invoke-virtual {p0}, Landroid/app/Application;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/util/HelpshiftContext;->setApplicationContext(Landroid/content/Context;)V

    .line 142
    invoke-static {p1, p2, p3}, Lcom/helpshift/util/HelpshiftContext;->initializeCore(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p4, :cond_0

    const-string p1, "manualLifecycleTracking"

    .line 146
    invoke-interface {p4, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 147
    invoke-interface {p4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 150
    :goto_0
    new-instance p2, Lcom/helpshift/support/SupportAppLifeCycleListener;

    invoke-direct {p2}, Lcom/helpshift/support/SupportAppLifeCycleListener;-><init>()V

    .line 151
    invoke-static {}, Lcom/helpshift/applifecycle/HSAppLifeCycleController;->getInstance()Lcom/helpshift/applifecycle/HSAppLifeCycleController;

    move-result-object p3

    .line 152
    invoke-virtual {p3, p0, p1}, Lcom/helpshift/applifecycle/HSAppLifeCycleController;->init(Landroid/app/Application;Z)V

    .line 153
    invoke-virtual {p3, p2}, Lcom/helpshift/applifecycle/HSAppLifeCycleController;->registerAppLifeCycleListener(Lcom/helpshift/applifecycle/HSAppLifeCycleListener;)V

    return-void
.end method

.method public static registerDeviceToken(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 468
    invoke-static {p0}, Lcom/helpshift/support/SupportInternal;->init(Landroid/content/Context;)V

    if-eqz p1, :cond_0

    .line 470
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/helpshift/CoreApi;->setPushToken(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p0, "Helpshift_SupportInter"

    const-string p1, "Device Token is null"

    .line 473
    invoke-static {p0, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public static removeFAQFlowUnsupportedConfigs(Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1006
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    const-string p0, "conversationPrefillText"

    .line 1007
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public static removeShowConversationUnsupportedConfigs(Ljava/util/HashMap;)Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1013
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    const-string p0, "enableContactUs"

    .line 1014
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "customContactUsFlows"

    .line 1015
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public static setDelegate(Lcom/helpshift/delegate/RootDelegate;)V
    .locals 1

    .line 1282
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0, p0}, Lcom/helpshift/CoreApi;->setDelegateListener(Lcom/helpshift/delegate/RootDelegate;)V

    return-void
.end method

.method public static setMetadataCallback(Lcom/helpshift/support/Callable;)V
    .locals 1

    .line 853
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getMetaDataDM()Lcom/helpshift/meta/MetaDataDM;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/helpshift/meta/MetaDataDM;->setCustomMetaDataCallable(Lcom/helpshift/meta/RootMetaDataCallable;)V

    return-void
.end method

.method public static setMetadataCallback(Lcom/helpshift/support/MetadataCallable;)V
    .locals 1

    .line 857
    new-instance v0, Lcom/helpshift/support/SupportInternal$2;

    invoke-direct {v0, p0}, Lcom/helpshift/support/SupportInternal$2;-><init>(Lcom/helpshift/support/MetadataCallable;)V

    .line 867
    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->setMetadataCallback(Lcom/helpshift/support/Callable;)V

    return-void
.end method

.method public static setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string v0, ""

    if-eqz p0, :cond_1

    .line 404
    invoke-static {p0}, Lcom/helpshift/util/HSPattern;->hasOnlySpecialCharacters(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 408
    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_1
    :goto_0
    move-object p0, v0

    .line 411
    :goto_1
    invoke-static {p1}, Lcom/helpshift/util/HSPattern;->isValidEmail(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    goto :goto_2

    .line 415
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 418
    :goto_2
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1, p0, v0}, Lcom/helpshift/CoreApi;->setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static setSDKLanguage(Ljava/lang/String;)V
    .locals 1

    .line 1329
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->setSdkLanguage(Ljava/lang/String;)V

    return-void
.end method

.method public static setTheme(I)V
    .locals 1

    .line 1333
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v0, p0}, Lcom/helpshift/model/SdkInfoModel;->setTheme(I)V

    return-void
.end method

.method public static setUserIdentifier(Ljava/lang/String;)V
    .locals 1

    if-eqz p0, :cond_0

    .line 433
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/helpshift/account/domainmodel/UserManagerDM;->setUserMetaIdentifier(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static showAlertToRateApp(Ljava/lang/String;Lcom/helpshift/support/AlertToRateAppListener;)V
    .locals 2

    .line 1254
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1255
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1256
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1259
    :cond_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p1, :cond_1

    const/4 p0, 0x3

    .line 1261
    invoke-interface {p1, p0}, Lcom/helpshift/support/AlertToRateAppListener;->onAction(I)V

    :cond_1
    return-void

    .line 1266
    :cond_2
    invoke-static {p1}, Lcom/helpshift/support/HSReviewFragment;->setAlertToRateAppListener(Lcom/helpshift/support/AlertToRateAppListener;)V

    .line 1268
    new-instance p1, Landroid/content/Intent;

    sget-object v0, Lcom/helpshift/support/SupportInternal;->context:Landroid/content/Context;

    const-class v1, Lcom/helpshift/support/HSReview;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v0, 0x0

    const-string v1, "disableReview"

    .line 1269
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1270
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v0, "rurl"

    invoke-virtual {p1, v0, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 p0, 0x10000000

    .line 1271
    invoke-virtual {p1, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1272
    sget-object p0, Lcom/helpshift/support/SupportInternal;->context:Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static showConversation(Landroid/app/Activity;Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "updateMetaData"

    const-string v1, ""

    .line 585
    invoke-static {v0, v1}, Lcom/helpshift/PluginEventBridge;->sendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 587
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    const/4 p1, 0x1

    new-array v1, p1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    const-string v2, "Config"

    .line 589
    invoke-static {v2, v0}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromMap(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "Helpshift_SupportInter"

    const-string v4, "Show conversation : "

    invoke-static {v2, v4, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    .line 590
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/helpshift/support/activities/ParentActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "support_mode"

    .line 591
    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "decomp"

    .line 592
    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 593
    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->removeShowConversationUnsupportedConfigs(Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->cleanConfig(Ljava/util/HashMap;)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 594
    invoke-static {p0}, Lcom/helpshift/util/ActivityUtil;->isFullScreen(Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object v0

    const-string v2, "showInFullScreen"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string v0, "isRoot"

    .line 595
    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "search_performed"

    .line 596
    invoke-virtual {v1, p1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 597
    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static showDynamicForm(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;)V"
        }
    .end annotation

    const-string v0, "Helpshift_SupportInter"

    const-string v1, "Show dynamic form"

    .line 992
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "updateMetaData"

    const-string v1, ""

    .line 994
    invoke-static {v0, v1}, Lcom/helpshift/PluginEventBridge;->sendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 996
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/helpshift/support/activities/ParentActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 997
    invoke-static {p2}, Lcom/helpshift/support/flows/DynamicFormFlowListHolder;->setFlowList(Ljava/util/List;)V

    .line 998
    invoke-static {p0}, Lcom/helpshift/util/ActivityUtil;->isFullScreen(Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object p2

    const-string v1, "showInFullScreen"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string p2, "support_mode"

    const/4 v1, 0x4

    .line 999
    invoke-virtual {v0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p2, "decomp"

    const/4 v1, 0x1

    .line 1000
    invoke-virtual {v0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1001
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string p2, "flow_title"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1002
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static showFAQSection(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 1

    .line 621
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/helpshift/support/SupportInternal;->showFAQSection(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static showFAQSection(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 720
    invoke-static {p1}, Lcom/helpshift/support/SupportInternal;->isValidPublishId(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    .line 723
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 725
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Show FAQ section : Publish Id : "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x1

    new-array v2, v1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    const/4 v3, 0x0

    const-string v4, "Config"

    .line 726
    invoke-static {v4, v0}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromMap(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v4

    aput-object v4, v2, v3

    const-string v3, "Helpshift_SupportInter"

    .line 725
    invoke-static {v3, p2, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    const-string p2, "updateMetaData"

    const-string v2, ""

    .line 728
    invoke-static {p2, v2}, Lcom/helpshift/PluginEventBridge;->sendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 730
    new-instance p2, Landroid/content/Intent;

    const-class v2, Lcom/helpshift/support/activities/ParentActivity;

    invoke-direct {p2, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v2, 0x2

    const-string v3, "support_mode"

    .line 731
    invoke-virtual {p2, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 732
    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->removeFAQFlowUnsupportedConfigs(Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->cleanConfig(Ljava/util/HashMap;)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const-string v0, "sectionPublishId"

    .line 733
    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 734
    invoke-static {p0}, Lcom/helpshift/util/ActivityUtil;->isFullScreen(Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object p1

    const-string v0, "showInFullScreen"

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string p1, "decomp"

    .line 735
    invoke-virtual {p2, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "isRoot"

    .line 736
    invoke-virtual {p2, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 737
    invoke-virtual {p0, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static showFAQs(Landroid/app/Activity;Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 977
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    const/4 p1, 0x1

    new-array v1, p1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    const-string v2, "Config"

    .line 979
    invoke-static {v2, v0}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromMap(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "Helpshift_SupportInter"

    const-string v4, "Show FAQs : "

    invoke-static {v2, v4, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    const-string v1, "updateMetaData"

    const-string v2, ""

    .line 981
    invoke-static {v1, v2}, Lcom/helpshift/PluginEventBridge;->sendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 983
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/helpshift/support/activities/ParentActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 984
    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->removeFAQFlowUnsupportedConfigs(Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->cleanConfig(Ljava/util/HashMap;)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 985
    invoke-static {p0}, Lcom/helpshift/util/ActivityUtil;->isFullScreen(Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object v0

    const-string v2, "showInFullScreen"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string v0, "decomp"

    .line 986
    invoke-virtual {v1, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v0, "isRoot"

    .line 987
    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 988
    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static showSingleFAQ(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 808
    invoke-static {p1}, Lcom/helpshift/support/SupportInternal;->isValidPublishId(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    .line 812
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 814
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Show single FAQ : Publish Id : "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x1

    new-array v2, v1, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    const/4 v3, 0x0

    const-string v4, "Config"

    .line 815
    invoke-static {v4, v0}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromMap(Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v4

    aput-object v4, v2, v3

    const-string v3, "Helpshift_SupportInter"

    .line 814
    invoke-static {v3, p2, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    const-string p2, "updateMetaData"

    const-string v2, ""

    .line 817
    invoke-static {p2, v2}, Lcom/helpshift/PluginEventBridge;->sendMessage(Ljava/lang/String;Ljava/lang/String;)V

    .line 819
    new-instance p2, Landroid/content/Intent;

    const-class v2, Lcom/helpshift/support/activities/ParentActivity;

    invoke-direct {p2, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v2, 0x3

    const-string v3, "support_mode"

    .line 820
    invoke-virtual {p2, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 821
    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->removeFAQFlowUnsupportedConfigs(Ljava/util/HashMap;)Ljava/util/HashMap;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/support/SupportInternal;->cleanConfig(Ljava/util/HashMap;)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    const-string v0, "questionPublishId"

    .line 822
    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 823
    invoke-static {p0}, Lcom/helpshift/util/ActivityUtil;->isFullScreen(Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object p1

    const-string v0, "showInFullScreen"

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string p1, "decomp"

    .line 824
    invoke-virtual {p2, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "isRoot"

    .line 825
    invoke-virtual {p2, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 826
    invoke-virtual {p0, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method private static updateCustomIssueFieldData(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "hs-custom-issue-field"

    .line 1081
    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1082
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 1083
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 1085
    :try_start_0
    check-cast p0, Ljava/util/Map;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "Helpshift_SupportInter"

    const-string v1, "Exception while parsing CIF data : "

    .line 1088
    invoke-static {v0, v1, p0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    const/4 p0, 0x0

    .line 1092
    :goto_0
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getCustomIssueFieldDM()Lcom/helpshift/cif/CustomIssueFieldDM;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/helpshift/cif/CustomIssueFieldDM;->setCustomIssueFieldData(Ljava/util/Map;)V

    return-void
.end method
