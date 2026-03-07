.class public Lcom/helpshift/support/SupportAppLifeCycleListener;
.super Ljava/lang/Object;
.source "SupportAppLifeCycleListener.java"

# interfaces
.implements Lcom/helpshift/applifecycle/HSAppLifeCycleListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "SupLifeCycleListnr"


# instance fields
.field data:Lcom/helpshift/support/HSApiData;

.field storage:Lcom/helpshift/support/HSStorage;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Lcom/helpshift/support/SupportAppLifeCycleListener;->data:Lcom/helpshift/support/HSApiData;

    .line 35
    iput-object v0, p0, Lcom/helpshift/support/SupportAppLifeCycleListener;->storage:Lcom/helpshift/support/HSStorage;

    return-void
.end method

.method private tryFetchingServerConfig(Landroid/content/Context;)V
    .locals 7

    .line 105
    :try_start_0
    invoke-static {p1}, Lcom/helpshift/util/ApplicationUtil;->isApplicationDebuggable(Landroid/content/Context;)Z

    move-result p1

    .line 106
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    .line 107
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object v1

    .line 108
    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getDomain()Lcom/helpshift/common/domain/Domain;

    move-result-object v2

    invoke-virtual {v2}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v2

    .line 109
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/16 v5, 0x3e8

    div-long/2addr v3, v5

    if-nez p1, :cond_0

    .line 110
    sget-object p1, Lcom/helpshift/common/domain/network/NetworkConstants;->SUPPORT_CONFIG_ROUTE:Ljava/lang/String;

    .line 111
    invoke-interface {v1, p1}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->getETag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 112
    invoke-virtual {v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getLastSuccessfulConfigFetchTime()Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    sub-long/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->abs(J)J

    move-result-wide v3

    .line 113
    invoke-virtual {v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getPeriodicFetchInterval()J

    move-result-wide v1

    cmp-long p1, v3, v1

    if-ltz p1, :cond_1

    .line 115
    :cond_0
    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getConfigFetchDM()Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->fetchServerConfig(Z)V

    .line 117
    :cond_1
    invoke-interface {v0}, Lcom/helpshift/CoreApi;->refreshPoller()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "SupLifeCycleListnr"

    const-string v1, "Exception while fetching config"

    .line 120
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public onAppBackground(Landroid/content/Context;)V
    .locals 0

    .line 95
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    const/4 p1, 0x0

    .line 98
    invoke-static {p1}, Lcom/helpshift/app/AppLifeCycleStateHolder;->setAppInForeground(Z)V

    .line 99
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/CoreApi;->getConversationInboxPoller()Lcom/helpshift/conversation/ConversationInboxPoller;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/conversation/ConversationInboxPoller;->stop()V

    .line 100
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/CoreApi;->sendRequestIdsForSuccessfulApiCalls()V

    return-void
.end method

.method public onAppForeground(Landroid/content/Context;)V
    .locals 7

    .line 45
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->verifyInstall()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 48
    invoke-static {v0}, Lcom/helpshift/app/AppLifeCycleStateHolder;->setAppInForeground(Z)V

    .line 49
    iget-object v1, p0, Lcom/helpshift/support/SupportAppLifeCycleListener;->data:Lcom/helpshift/support/HSApiData;

    if-nez v1, :cond_1

    .line 50
    new-instance v1, Lcom/helpshift/support/HSApiData;

    invoke-direct {v1, p1}, Lcom/helpshift/support/HSApiData;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/helpshift/support/SupportAppLifeCycleListener;->data:Lcom/helpshift/support/HSApiData;

    .line 51
    iget-object v1, v1, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    iput-object v1, p0, Lcom/helpshift/support/SupportAppLifeCycleListener;->storage:Lcom/helpshift/support/HSStorage;

    .line 54
    :cond_1
    iget-object v1, p0, Lcom/helpshift/support/SupportAppLifeCycleListener;->data:Lcom/helpshift/support/HSApiData;

    invoke-virtual {v1}, Lcom/helpshift/support/HSApiData;->updateReviewCounter()V

    .line 55
    iget-object v1, p0, Lcom/helpshift/support/SupportAppLifeCycleListener;->data:Lcom/helpshift/support/HSApiData;

    invoke-virtual {v1}, Lcom/helpshift/support/HSApiData;->shouldShowReviewPopup()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 56
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/helpshift/support/HSReview;

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v2, 0x10000000

    .line 57
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 58
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 60
    :cond_2
    invoke-direct {p0, p1}, Lcom/helpshift/support/SupportAppLifeCycleListener;->tryFetchingServerConfig(Landroid/content/Context;)V

    .line 61
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/CoreApi;->sendFailedApiCalls()V

    .line 62
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/CoreApi;->sendAppStartEvent()V

    .line 65
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/CoreApi;->resetPreIssueConversations()V

    .line 67
    invoke-static {p1}, Lcom/helpshift/util/HelpshiftConnectionUtil;->isOnline(Landroid/content/Context;)Z

    move-result p1

    .line 69
    monitor-enter p0

    if-eqz p1, :cond_4

    .line 71
    :try_start_0
    invoke-static {}, Lcom/helpshift/static_classes/ErrorReporting;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 72
    iget-object p1, p0, Lcom/helpshift/support/SupportAppLifeCycleListener;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {p1}, Lcom/helpshift/support/HSStorage;->getLastErrorReportedTime()J

    move-result-wide v1

    .line 73
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object p1

    invoke-static {p1}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeInMillis(Lcom/helpshift/common/platform/Platform;)J

    move-result-wide v3

    sub-long v1, v3, v1

    const-wide/32 v5, 0x5265c00

    cmp-long p1, v1, v5

    if-lez p1, :cond_3

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_4

    .line 77
    invoke-static {}, Lcom/helpshift/util/HSLogger;->getAll()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 78
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 79
    iget-object v0, p0, Lcom/helpshift/support/SupportAppLifeCycleListener;->storage:Lcom/helpshift/support/HSStorage;

    invoke-virtual {v0, v3, v4}, Lcom/helpshift/support/HSStorage;->setLastErrorReportedTime(J)V

    .line 80
    iget-object v0, p0, Lcom/helpshift/support/SupportAppLifeCycleListener;->data:Lcom/helpshift/support/HSApiData;

    invoke-virtual {v0, p1}, Lcom/helpshift/support/HSApiData;->sendErrorReports(Ljava/util/List;)V

    .line 84
    :cond_4
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
