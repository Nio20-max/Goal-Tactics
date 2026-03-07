.class public Lcom/helpshift/support/Support;
.super Ljava/lang/Object;
.source "Support.java"

# interfaces
.implements Lcom/helpshift/Core$ApiProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/Support$EnableContactUs;,
        Lcom/helpshift/support/Support$RateAlert;,
        Lcom/helpshift/support/Support$LazyHolder;,
        Lcom/helpshift/support/Support$Delegate;
    }
.end annotation


# static fields
.field public static final CONVERSATION_FLOW:Ljava/lang/String; = "conversationFlow"

.field public static final CustomIssueFieldKey:Ljava/lang/String; = "hs-custom-issue-field"

.field public static final CustomMetadataKey:Ljava/lang/String; = "hs-custom-metadata"

.field public static final DYNAMIC_FORM_FLOW:Ljava/lang/String; = "dynamicFormFlow"

.field public static final FAQS_FLOW:Ljava/lang/String; = "faqsFlow"

.field public static final FAQ_SECTION_FLOW:Ljava/lang/String; = "faqSectionFlow"

.field public static final SINGLE_FAQ_FLOW:Ljava/lang/String; = "singleFaqFlow"

.field public static final TAG:Ljava/lang/String; = "HelpShiftDebug"

.field public static final TagsKey:Ljava/lang/String; = "hs-tags"

.field public static final UserAcceptedTheSolution:Ljava/lang/String; = "User accepted the solution"

.field public static final UserRejectedTheSolution:Ljava/lang/String; = "User rejected the solution"

.field public static final UserReviewedTheApp:Ljava/lang/String; = "User reviewed the app"

.field public static final UserSentScreenShot:Ljava/lang/String; = "User sent a screenshot"

.field public static final libraryVersion:Ljava/lang/String; = "7.11.1"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/helpshift/support/Support$1;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Lcom/helpshift/support/Support;-><init>()V

    return-void
.end method

.method public static clearBreadCrumbs()V
    .locals 2

    .line 236
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 239
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 240
    new-instance v1, Lcom/helpshift/support/Support$4;

    invoke-direct {v1}, Lcom/helpshift/support/Support$4;-><init>()V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static getConversationFragment(Landroid/app/Activity;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1

    .line 1143
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, v0}, Lcom/helpshift/support/Support;->getConversationFragment(Landroid/app/Activity;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getConversationFragment(Landroid/app/Activity;Lcom/helpshift/support/ApiConfig;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 0

    .line 1178
    invoke-static {p1}, Lcom/helpshift/support/util/ConfigUtil;->validateAndConvertToMap(Lcom/helpshift/support/ApiConfig;)Ljava/util/Map;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/helpshift/support/Support;->getConversationFragment(Landroid/app/Activity;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getConversationFragment(Landroid/app/Activity;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1159
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1162
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 1163
    invoke-interface {v0}, Lcom/helpshift/util/concurrent/ApiExecutor;->awaitForSyncExecution()V

    .line 1164
    invoke-static {p0, p1}, Lcom/helpshift/support/SupportInternal;->getConversationFragment(Landroid/app/Activity;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getDynamicFormFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;)",
            "Lcom/helpshift/support/fragments/SupportFragment;"
        }
    .end annotation

    .line 1326
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, p1, p2, v0}, Lcom/helpshift/support/Support;->getDynamicFormFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getDynamicFormFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;Lcom/helpshift/support/ApiConfig;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;",
            "Lcom/helpshift/support/ApiConfig;",
            ")",
            "Lcom/helpshift/support/fragments/SupportFragment;"
        }
    .end annotation

    .line 1395
    invoke-static {p3}, Lcom/helpshift/support/util/ConfigUtil;->validateAndConvertToMap(Lcom/helpshift/support/ApiConfig;)Ljava/util/Map;

    move-result-object p3

    invoke-static {p0, p1, p2, p3}, Lcom/helpshift/support/Support;->getDynamicFormFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method private static getDynamicFormFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1
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

    .line 1401
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1404
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 1405
    invoke-interface {v0}, Lcom/helpshift/util/concurrent/ApiExecutor;->awaitForSyncExecution()V

    .line 1406
    invoke-static {p0, p1, p2, p3}, Lcom/helpshift/support/SupportInternal;->getDynamicFormFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getDynamicFormFragment(Landroid/app/Activity;Ljava/util/List;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;)",
            "Lcom/helpshift/support/fragments/SupportFragment;"
        }
    .end annotation

    .line 1305
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, ""

    invoke-static {p0, v1, p1, v0}, Lcom/helpshift/support/Support;->getDynamicFormFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getDynamicFormFragment(Landroid/app/Activity;Ljava/util/List;Lcom/helpshift/support/ApiConfig;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;",
            "Lcom/helpshift/support/ApiConfig;",
            ")",
            "Lcom/helpshift/support/fragments/SupportFragment;"
        }
    .end annotation

    .line 1372
    invoke-static {p2}, Lcom/helpshift/support/util/ConfigUtil;->validateAndConvertToMap(Lcom/helpshift/support/ApiConfig;)Ljava/util/Map;

    move-result-object p2

    const-string v0, ""

    invoke-static {p0, v0, p1, p2}, Lcom/helpshift/support/Support;->getDynamicFormFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getDynamicFormFragment(Landroid/app/Activity;Ljava/util/List;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-string v0, ""

    .line 1350
    invoke-static {p0, v0, p1, p2}, Lcom/helpshift/support/Support;->getDynamicFormFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getFAQSectionFragment(Landroid/app/Activity;Ljava/lang/String;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1

    .line 1192
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/helpshift/support/Support;->getFAQSectionFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getFAQSectionFragment(Landroid/app/Activity;Ljava/lang/String;Lcom/helpshift/support/ApiConfig;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 0

    .line 1232
    invoke-static {p2}, Lcom/helpshift/support/util/ConfigUtil;->validateAndConvertToMap(Lcom/helpshift/support/ApiConfig;)Ljava/util/Map;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/helpshift/support/Support;->getFAQSectionFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getFAQSectionFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1210
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1213
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 1214
    invoke-interface {v0}, Lcom/helpshift/util/concurrent/ApiExecutor;->awaitForSyncExecution()V

    .line 1215
    invoke-static {p0, p1, p2}, Lcom/helpshift/support/SupportInternal;->getFAQSectionFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getFAQsFragment(Landroid/app/Activity;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1

    .line 1097
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, v0}, Lcom/helpshift/support/Support;->getFAQsFragment(Landroid/app/Activity;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getFAQsFragment(Landroid/app/Activity;Lcom/helpshift/support/ApiConfig;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 0

    .line 1131
    invoke-static {p1}, Lcom/helpshift/support/util/ConfigUtil;->validateAndConvertToMap(Lcom/helpshift/support/ApiConfig;)Ljava/util/Map;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/helpshift/support/Support;->getFAQsFragment(Landroid/app/Activity;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getFAQsFragment(Landroid/app/Activity;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1113
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1116
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 1117
    invoke-interface {v0}, Lcom/helpshift/util/concurrent/ApiExecutor;->awaitForSyncExecution()V

    .line 1118
    invoke-static {p0, p1}, Lcom/helpshift/support/SupportInternal;->getFAQsFragment(Landroid/app/Activity;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getInstance()Lcom/helpshift/support/Support;
    .locals 1

    .line 117
    sget-object v0, Lcom/helpshift/support/Support$LazyHolder;->INSTANCE:Lcom/helpshift/support/Support;

    return-object v0
.end method

.method public static getNotificationCount()Ljava/lang/Integer;
    .locals 1

    .line 130
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, -0x1

    .line 131
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    .line 133
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 134
    invoke-interface {v0}, Lcom/helpshift/util/concurrent/ApiExecutor;->awaitForSyncExecution()V

    .line 135
    invoke-static {}, Lcom/helpshift/support/SupportInternal;->getNotificationCount()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public static getNotificationCount(Landroid/os/Handler;Landroid/os/Handler;)V
    .locals 2

    .line 164
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 167
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 168
    new-instance v1, Lcom/helpshift/support/Support$1;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/support/Support$1;-><init>(Landroid/os/Handler;Landroid/os/Handler;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static getSingleFAQFragment(Landroid/app/Activity;Ljava/lang/String;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1

    .line 1246
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/helpshift/support/Support;->getSingleFAQFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getSingleFAQFragment(Landroid/app/Activity;Ljava/lang/String;Lcom/helpshift/support/ApiConfig;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 0

    .line 1285
    invoke-static {p2}, Lcom/helpshift/support/util/ConfigUtil;->validateAndConvertToMap(Lcom/helpshift/support/ApiConfig;)Ljava/util/Map;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/helpshift/support/Support;->getSingleFAQFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getSingleFAQFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;
    .locals 1
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1264
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 1267
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 1268
    invoke-interface {v0}, Lcom/helpshift/util/concurrent/ApiExecutor;->awaitForSyncExecution()V

    .line 1269
    invoke-static {p0, p1, p2}, Lcom/helpshift/support/SupportInternal;->getSingleFAQFragment(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)Lcom/helpshift/support/fragments/SupportFragment;

    move-result-object p0

    return-object p0
.end method

.method public static isConversationActive()Z
    .locals 1

    .line 260
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 263
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 264
    invoke-interface {v0}, Lcom/helpshift/util/concurrent/ApiExecutor;->awaitForSyncExecution()V

    .line 265
    invoke-static {}, Lcom/helpshift/support/SupportInternal;->isConversationActive()Z

    move-result v0

    return v0
.end method

.method public static leaveBreadCrumb(Ljava/lang/String;)V
    .locals 2

    .line 211
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 214
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 215
    new-instance v1, Lcom/helpshift/support/Support$3;

    invoke-direct {v1, p0}, Lcom/helpshift/support/Support$3;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setDelegate(Lcom/helpshift/support/Support$Delegate;)V
    .locals 2

    .line 996
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 999
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 1000
    new-instance v1, Lcom/helpshift/support/Support$12;

    invoke-direct {v1, p0}, Lcom/helpshift/support/Support$12;-><init>(Lcom/helpshift/support/Support$Delegate;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setMetadataCallback(Lcom/helpshift/support/Callable;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 896
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 899
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 900
    new-instance v1, Lcom/helpshift/support/Support$9;

    invoke-direct {v1, p0}, Lcom/helpshift/support/Support$9;-><init>(Lcom/helpshift/support/Callable;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setMetadataCallback(Lcom/helpshift/support/MetadataCallable;)V
    .locals 2

    .line 929
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 932
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 933
    new-instance v1, Lcom/helpshift/support/Support$10;

    invoke-direct {v1, p0}, Lcom/helpshift/support/Support$10;-><init>(Lcom/helpshift/support/MetadataCallable;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setSDKLanguage(Ljava/lang/String;)V
    .locals 2

    .line 1032
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1035
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 1036
    new-instance v1, Lcom/helpshift/support/Support$13;

    invoke-direct {v1, p0}, Lcom/helpshift/support/Support$13;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static setUserIdentifier(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 187
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 190
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 191
    new-instance v1, Lcom/helpshift/support/Support$2;

    invoke-direct {v1, p0}, Lcom/helpshift/support/Support$2;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static showAlertToRateApp(Ljava/lang/String;Lcom/helpshift/support/AlertToRateAppListener;)V
    .locals 2

    .line 978
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 981
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 982
    new-instance v1, Lcom/helpshift/support/Support$11;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/support/Support$11;-><init>(Ljava/lang/String;Lcom/helpshift/support/AlertToRateAppListener;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static showConversation(Landroid/app/Activity;)V
    .locals 1

    .line 285
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, v0}, Lcom/helpshift/support/Support;->showConversation(Landroid/app/Activity;Ljava/util/Map;)V

    return-void
.end method

.method public static showConversation(Landroid/app/Activity;Lcom/helpshift/support/ApiConfig;)V
    .locals 0

    .line 405
    invoke-static {p1}, Lcom/helpshift/support/util/ConfigUtil;->validateAndConvertToMap(Lcom/helpshift/support/ApiConfig;)Ljava/util/Map;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/helpshift/support/Support;->showConversation(Landroid/app/Activity;Ljava/util/Map;)V

    return-void
.end method

.method public static showConversation(Landroid/app/Activity;Ljava/util/Map;)V
    .locals 2
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 356
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 359
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 360
    new-instance v1, Lcom/helpshift/support/Support$5;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/support/Support$5;-><init>(Landroid/app/Activity;Ljava/util/Map;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runOnUiThread(Ljava/lang/Runnable;)V

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

    .line 1076
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1079
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 1080
    new-instance v1, Lcom/helpshift/support/Support$14;

    invoke-direct {v1, p0, p1, p2}, Lcom/helpshift/support/Support$14;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static showDynamicForm(Landroid/app/Activity;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Lcom/helpshift/support/flows/Flow;",
            ">;)V"
        }
    .end annotation

    const-string v0, ""

    .line 1057
    invoke-static {p0, v0, p1}, Lcom/helpshift/support/Support;->showDynamicForm(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static showFAQSection(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 1

    .line 431
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/helpshift/support/Support;->showFAQSection(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static showFAQSection(Landroid/app/Activity;Ljava/lang/String;Lcom/helpshift/support/ApiConfig;)V
    .locals 1

    .line 569
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 572
    :cond_0
    invoke-static {p2}, Lcom/helpshift/support/util/ConfigUtil;->validateAndConvertToMap(Lcom/helpshift/support/ApiConfig;)Ljava/util/Map;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/helpshift/support/Support;->showFAQSection(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static showFAQSection(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 514
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 517
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 518
    new-instance v1, Lcom/helpshift/support/Support$6;

    invoke-direct {v1, p0, p1, p2}, Lcom/helpshift/support/Support$6;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static showFAQs(Landroid/app/Activity;)V
    .locals 1

    .line 742
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, v0}, Lcom/helpshift/support/Support;->showFAQs(Landroid/app/Activity;Ljava/util/Map;)V

    return-void
.end method

.method public static showFAQs(Landroid/app/Activity;Lcom/helpshift/support/ApiConfig;)V
    .locals 0

    .line 868
    invoke-static {p1}, Lcom/helpshift/support/util/ConfigUtil;->validateAndConvertToMap(Lcom/helpshift/support/ApiConfig;)Ljava/util/Map;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/helpshift/support/Support;->showFAQs(Landroid/app/Activity;Ljava/util/Map;)V

    return-void
.end method

.method public static showFAQs(Landroid/app/Activity;Ljava/util/Map;)V
    .locals 2
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 819
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 822
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 823
    new-instance v1, Lcom/helpshift/support/Support$8;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/support/Support$8;-><init>(Landroid/app/Activity;Ljava/util/Map;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static showSingleFAQ(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 1

    .line 595
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/helpshift/support/Support;->showSingleFAQ(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static showSingleFAQ(Landroid/app/Activity;Ljava/lang/String;Lcom/helpshift/support/ApiConfig;)V
    .locals 0

    .line 722
    invoke-static {p2}, Lcom/helpshift/support/util/ConfigUtil;->validateAndConvertToMap(Lcom/helpshift/support/ApiConfig;)Ljava/util/Map;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/helpshift/support/Support;->showSingleFAQ(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static showSingleFAQ(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V
    .locals 2
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

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 668
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 671
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 672
    new-instance v1, Lcom/helpshift/support/Support$7;

    invoke-direct {v1, p0, p1, p2}, Lcom/helpshift/support/Support$7;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public _clearAnonymousUser()Z
    .locals 1

    .line 1486
    invoke-static {}, Lcom/helpshift/support/SupportInternal;->clearAnonymousUser()Z

    move-result v0

    return v0
.end method

.method public _getActionExecutor()Lcom/helpshift/executors/ActionExecutor;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public _handlePush(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1462
    invoke-static {p1, p2}, Lcom/helpshift/support/SupportInternal;->handlePush(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public _install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1426
    invoke-static {p1, p2, p3, p4}, Lcom/helpshift/support/SupportInternal;->install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public _install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
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

    .line 1438
    invoke-static {p1, p2, p3, p4, p5}, Lcom/helpshift/support/SupportInternal;->install(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public _login(Lcom/helpshift/HelpshiftUser;)Z
    .locals 0

    .line 1470
    invoke-static {p1}, Lcom/helpshift/support/SupportInternal;->login(Lcom/helpshift/HelpshiftUser;)Z

    move-result p1

    return p1
.end method

.method public _logout()Z
    .locals 1

    .line 1478
    invoke-static {}, Lcom/helpshift/support/SupportInternal;->logout()Z

    move-result v0

    return v0
.end method

.method public _preInstall(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
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

    .line 1415
    invoke-static {p1, p2, p3, p4, p5}, Lcom/helpshift/support/SupportInternal;->preInstall(Landroid/app/Application;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public _registerDeviceToken(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1454
    invoke-static {p1, p2}, Lcom/helpshift/support/SupportInternal;->registerDeviceToken(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public _setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1446
    invoke-static {p1, p2}, Lcom/helpshift/support/SupportInternal;->setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public _setSDKLanguage(Ljava/lang/String;)V
    .locals 0

    .line 1502
    invoke-static {p1}, Lcom/helpshift/support/Support;->setSDKLanguage(Ljava/lang/String;)V

    return-void
.end method

.method public _setTheme(I)V
    .locals 2

    .line 1507
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1510
    :cond_0
    invoke-static {}, Lcom/helpshift/util/concurrent/ApiExecutorFactory;->getHandlerExecutor()Lcom/helpshift/util/concurrent/ApiExecutor;

    move-result-object v0

    .line 1511
    new-instance v1, Lcom/helpshift/support/Support$15;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/support/Support$15;-><init>(Lcom/helpshift/support/Support;I)V

    invoke-interface {v0, v1}, Lcom/helpshift/util/concurrent/ApiExecutor;->runAsync(Ljava/lang/Runnable;)V

    return-void
.end method
