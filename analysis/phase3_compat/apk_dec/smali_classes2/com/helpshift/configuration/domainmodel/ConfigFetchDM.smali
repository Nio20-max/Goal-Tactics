.class public Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;
.super Ljava/lang/Object;
.source "ConfigFetchDM.java"

# interfaces
.implements Lcom/helpshift/common/AutoRetriableDM;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_CnfgFtch"


# instance fields
.field private domain:Lcom/helpshift/common/domain/Domain;

.field private final isInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private listener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/helpshift/util/Callback<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation
.end field

.field private platform:Lcom/helpshift/common/platform/Platform;

.field private responseParser:Lcom/helpshift/common/platform/network/ResponseParser;

.field private sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 48
    iput-object p2, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 49
    invoke-virtual {p2}, Lcom/helpshift/common/domain/Domain;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object p2

    iput-object p2, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 50
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getResponseParser()Lcom/helpshift/common/platform/network/ResponseParser;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->responseParser:Lcom/helpshift/common/platform/network/ResponseParser;

    .line 51
    iget-object p1, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getAutoRetryFailedEventDM()Lcom/helpshift/common/AutoRetryFailedEventDM;

    move-result-object p1

    sget-object p2, Lcom/helpshift/common/AutoRetryFailedEventDM$EventType;->CONFIG:Lcom/helpshift/common/AutoRetryFailedEventDM$EventType;

    invoke-virtual {p1, p2, p0}, Lcom/helpshift/common/AutoRetryFailedEventDM;->register(Lcom/helpshift/common/AutoRetryFailedEventDM$EventType;Lcom/helpshift/common/AutoRetriableDM;)V

    .line 52
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->isInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->fetchServerConfigInternal()V

    return-void
.end method

.method static synthetic access$100(Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;)Lcom/helpshift/common/domain/Domain;
    .locals 0

    .line 34
    iget-object p0, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->domain:Lcom/helpshift/common/domain/Domain;

    return-object p0
.end method

.method static synthetic access$200(Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;Z)V
    .locals 0

    .line 34
    invoke-direct {p0, p1}, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->callListener(Z)V

    return-void
.end method

.method private callListener(Z)V
    .locals 2

    .line 163
    iget-object v0, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->listener:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/util/Callback;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_1

    .line 168
    invoke-interface {v0, v1}, Lcom/helpshift/util/Callback;->onSuccess(Ljava/lang/Object;)V

    goto :goto_0

    .line 171
    :cond_1
    invoke-interface {v0, v1}, Lcom/helpshift/util/Callback;->onFailure(Ljava/lang/Object;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private fetchServerConfigInternal()V
    .locals 8

    .line 96
    iget-object v0, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->isInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const-string v0, "Helpshift_CnfgFtch"

    const-string v2, "Fetching config."

    .line 98
    invoke-static {v0, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    iget-object v2, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v2}, Lcom/helpshift/common/domain/Domain;->getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;

    move-result-object v2

    .line 101
    invoke-virtual {v2}, Lcom/helpshift/account/domainmodel/UserManagerDM;->getActiveUser()Lcom/helpshift/account/domainmodel/UserDM;

    move-result-object v3

    .line 104
    sget-object v4, Lcom/helpshift/common/domain/network/NetworkConstants;->SUPPORT_CONFIG_ROUTE:Ljava/lang/String;

    .line 105
    new-instance v5, Lcom/helpshift/common/domain/network/GETNetwork;

    iget-object v6, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v7, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v5, v4, v6, v7}, Lcom/helpshift/common/domain/network/GETNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 106
    new-instance v6, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;

    invoke-direct {v6, v5}, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 107
    new-instance v5, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;

    iget-object v7, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v5, v6, v7}, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 108
    new-instance v6, Lcom/helpshift/common/domain/network/ETagNetwork;

    iget-object v7, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v6, v5, v7, v4}, Lcom/helpshift/common/domain/network/ETagNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;Ljava/lang/String;)V

    .line 109
    new-instance v4, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {v4, v6}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 110
    new-instance v5, Lcom/helpshift/common/platform/network/RequestData;

    invoke-static {v3}, Lcom/helpshift/common/domain/network/NetworkDataRequestUtil;->getUserRequestData(Lcom/helpshift/account/domainmodel/UserDM;)Ljava/util/HashMap;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Ljava/util/Map;)V

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 112
    :try_start_0
    invoke-interface {v4, v5}, Lcom/helpshift/common/domain/network/Network;->makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;

    move-result-object v4

    const-string v5, "SDK config fetched successfully"

    .line 114
    invoke-static {v0, v5}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    iget-object v5, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->responseParser:Lcom/helpshift/common/platform/network/ResponseParser;

    iget-object v4, v4, Lcom/helpshift/common/platform/network/Response;->responseString:Ljava/lang/String;

    invoke-interface {v5, v4}, Lcom/helpshift/common/platform/network/ResponseParser;->parseConfigResponse(Ljava/lang/String;)Lcom/helpshift/configuration/response/RootServerConfig;

    move-result-object v7

    .line 117
    iget-object v4, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v4, v7}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->updateServerConfig(Lcom/helpshift/configuration/response/RootServerConfig;)V

    .line 118
    iget-object v4, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v4, v3, v7, v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->updateUserConfig(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/configuration/response/RootServerConfig;Lcom/helpshift/account/domainmodel/UserManagerDM;)V

    .line 119
    iget-object v2, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v2}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->updateLastSuccessfulConfigFetchTime()V

    const-string v2, "SDK config data updated successfully"

    .line 121
    invoke-static {v0, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    invoke-direct {p0, v1}, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->callListener(Z)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v2

    .line 127
    :try_start_1
    iget-object v4, v2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    instance-of v4, v4, Lcom/helpshift/common/exception/NetworkException;

    if-eqz v4, :cond_0

    iget-object v4, v2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    check-cast v4, Lcom/helpshift/common/exception/NetworkException;

    iget v4, v4, Lcom/helpshift/common/exception/NetworkException;->serverStatusCode:I

    sget-object v5, Lcom/helpshift/common/domain/network/NetworkErrorCodes;->CONTENT_UNCHANGED:Ljava/lang/Integer;

    .line 129
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-ne v4, v5, :cond_0

    const-string v2, "SDK config fetched successfully, content unchanged"

    .line 130
    invoke-static {v0, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    iget-object v0, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->updateLastSuccessfulConfigFetchTime()V

    .line 132
    invoke-direct {p0, v1}, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->callListener(Z)V

    goto :goto_0

    .line 134
    :cond_0
    iget-object v0, v2, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    sget-object v1, Lcom/helpshift/common/exception/NetworkException;->NON_RETRIABLE:Lcom/helpshift/common/exception/NetworkException;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-ne v0, v1, :cond_2

    .line 139
    :goto_0
    iget-object v0, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->isInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    if-eqz v7, :cond_1

    .line 144
    new-instance v0, Lcom/helpshift/redaction/RedactionAgent;

    iget-object v1, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v2, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-direct {v0, v1, v2}, Lcom/helpshift/redaction/RedactionAgent;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V

    .line 145
    iget-object v1, v7, Lcom/helpshift/configuration/response/RootServerConfig;->profileCreatedAt:Ljava/lang/Long;

    iget-object v2, v7, Lcom/helpshift/configuration/response/RootServerConfig;->lastRedactionAt:Ljava/lang/Long;

    invoke-virtual {v0, v3, v1, v2}, Lcom/helpshift/redaction/RedactionAgent;->checkAndUpdateRedactionState(Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/Long;Ljava/lang/Long;)V

    :cond_1
    return-void

    .line 135
    :cond_2
    :try_start_2
    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 139
    :goto_1
    iget-object v1, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->isInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 140
    throw v0
.end method


# virtual methods
.method public fetchServerConfig(Z)V
    .locals 2

    .line 65
    iget-object v0, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->isInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "Helpshift_CnfgFtch"

    const-string v0, "Config fetch already in progress, skipping."

    .line 66
    invoke-static {p1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 70
    :cond_0
    iget-object v0, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM$1;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM$1;-><init>(Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;Z)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runParallel(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public isFetchInProgress()Z
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->isInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public sendFailedApiCalls(Lcom/helpshift/common/AutoRetryFailedEventDM$EventType;)V
    .locals 1

    .line 153
    sget-object v0, Lcom/helpshift/common/AutoRetryFailedEventDM$EventType;->CONFIG:Lcom/helpshift/common/AutoRetryFailedEventDM$EventType;

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->isInProgress:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 154
    invoke-interface {p1}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object p1

    sget-object v0, Lcom/helpshift/common/domain/network/NetworkConstants;->SUPPORT_CONFIG_ROUTE:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->getETag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 155
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Retrying failed api call for config: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->listener:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Helpshift_CnfgFtch"

    invoke-static {v0, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    invoke-direct {p0}, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->fetchServerConfigInternal()V

    :cond_0
    return-void
.end method

.method public setListener(Lcom/helpshift/util/Callback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/util/Callback<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 56
    :cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    move-object p1, v0

    :goto_0
    iput-object p1, p0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->listener:Ljava/lang/ref/WeakReference;

    return-void
.end method
