.class public Lcom/helpshift/common/domain/Domain;
.super Ljava/lang/Object;
.source "Domain.java"


# instance fields
.field private analyticsEventDM:Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

.field private attachmentFileManagerDM:Lcom/helpshift/common/domain/AttachmentFileManagerDM;

.field private attachmentUploadThreader:Lcom/helpshift/common/domain/Threader;

.field private authenticationFailureDM:Lcom/helpshift/account/AuthenticationFailureDM;

.field private autoRetryFailedEventDM:Lcom/helpshift/common/AutoRetryFailedEventDM;

.field private configFetchDM:Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;

.field private conversationInboxManagerDM:Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;

.field private cryptoDM:Lcom/helpshift/crypto/CryptoDM;

.field private customIssueFieldDM:Lcom/helpshift/cif/CustomIssueFieldDM;

.field private delayedThreader:Lcom/helpshift/common/domain/DelayedThreader;

.field private errorReportsDM:Lcom/helpshift/logger/ErrorReportsDM;

.field private faqsDM:Lcom/helpshift/faq/FaqsDM;

.field private hsBlockReason:Lcom/helpshift/common/HSBlockReason;

.field private localeProviderDM:Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;

.field private metaDataDM:Lcom/helpshift/meta/MetaDataDM;

.field private parallelThreader:Lcom/helpshift/common/domain/Threader;

.field private final platform:Lcom/helpshift/common/platform/Platform;

.field private sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

.field private serialThreader:Lcom/helpshift/common/domain/Threader;

.field private smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

.field private uiThreadDelegateDecorator:Lcom/helpshift/delegate/UIThreadDelegateDecorator;

.field private userManagerDM:Lcom/helpshift/account/domainmodel/UserManagerDM;

.field private webSocketAuthDM:Lcom/helpshift/auth/domainmodel/WebSocketAuthDM;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/Platform;)V
    .locals 4

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lcom/helpshift/common/domain/Domain;->platform:Lcom/helpshift/common/platform/Platform;

    .line 65
    new-instance v0, Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    invoke-direct {v0, p0}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;-><init>(Lcom/helpshift/common/domain/Domain;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->uiThreadDelegateDecorator:Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    .line 67
    new-instance v0, Lcom/helpshift/common/poller/HttpBackoff$Builder;

    invoke-direct {v0}, Lcom/helpshift/common/poller/HttpBackoff$Builder;-><init>()V

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x5

    .line 68
    invoke-static {v2, v3, v1}, Lcom/helpshift/common/poller/Delay;->of(JLjava/util/concurrent/TimeUnit;)Lcom/helpshift/common/poller/Delay;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->setBaseInterval(Lcom/helpshift/common/poller/Delay;)Lcom/helpshift/common/poller/HttpBackoff$Builder;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x3c

    .line 69
    invoke-static {v2, v3, v1}, Lcom/helpshift/common/poller/Delay;->of(JLjava/util/concurrent/TimeUnit;)Lcom/helpshift/common/poller/Delay;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->setMaxInterval(Lcom/helpshift/common/poller/Delay;)Lcom/helpshift/common/poller/HttpBackoff$Builder;

    move-result-object v0

    const/16 v1, 0xa

    .line 70
    invoke-virtual {v0, v1}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->setMaxAttempts(I)Lcom/helpshift/common/poller/HttpBackoff$Builder;

    move-result-object v0

    const v1, 0x3dcccccd    # 0.1f

    .line 71
    invoke-virtual {v0, v1}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->setRandomness(F)Lcom/helpshift/common/poller/HttpBackoff$Builder;

    move-result-object v0

    const/high16 v1, 0x40000000    # 2.0f

    .line 72
    invoke-virtual {v0, v1}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->setMultiplier(F)Lcom/helpshift/common/poller/HttpBackoff$Builder;

    move-result-object v0

    sget-object v1, Lcom/helpshift/common/poller/HttpBackoff$RetryPolicy;->FAILURE:Lcom/helpshift/common/poller/HttpBackoff$RetryPolicy;

    .line 73
    invoke-virtual {v0, v1}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->setRetryPolicy(Lcom/helpshift/common/poller/HttpBackoff$RetryPolicy;)Lcom/helpshift/common/poller/HttpBackoff$Builder;

    move-result-object v0

    .line 74
    invoke-virtual {v0}, Lcom/helpshift/common/poller/HttpBackoff$Builder;->build()Lcom/helpshift/common/poller/HttpBackoff;

    move-result-object v0

    .line 76
    new-instance v1, Lcom/helpshift/common/AutoRetryFailedEventDM;

    invoke-direct {v1, p0, p1, v0}, Lcom/helpshift/common/AutoRetryFailedEventDM;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/poller/HttpBackoff;)V

    iput-object v1, p0, Lcom/helpshift/common/domain/Domain;->autoRetryFailedEventDM:Lcom/helpshift/common/AutoRetryFailedEventDM;

    .line 77
    new-instance v0, Lcom/helpshift/account/domainmodel/UserManagerDM;

    invoke-direct {v0, p1, p0}, Lcom/helpshift/account/domainmodel/UserManagerDM;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->userManagerDM:Lcom/helpshift/account/domainmodel/UserManagerDM;

    .line 78
    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserManagerDM;->init()V

    .line 80
    new-instance v0, Lcom/helpshift/common/domain/HSThreadFactory;

    const-string v1, "core-s"

    invoke-direct {v0, v1}, Lcom/helpshift/common/domain/HSThreadFactory;-><init>(Ljava/lang/String;)V

    .line 81
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 82
    new-instance v1, Lcom/helpshift/common/domain/BackgroundThreader;

    invoke-direct {v1, v0}, Lcom/helpshift/common/domain/BackgroundThreader;-><init>(Ljava/util/concurrent/ExecutorService;)V

    iput-object v1, p0, Lcom/helpshift/common/domain/Domain;->serialThreader:Lcom/helpshift/common/domain/Threader;

    .line 84
    new-instance v0, Lcom/helpshift/common/domain/HSThreadFactory;

    const-string v1, "core-at"

    invoke-direct {v0, v1}, Lcom/helpshift/common/domain/HSThreadFactory;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 85
    new-instance v1, Lcom/helpshift/common/domain/BackgroundThreader;

    invoke-direct {v1, v0}, Lcom/helpshift/common/domain/BackgroundThreader;-><init>(Ljava/util/concurrent/ExecutorService;)V

    iput-object v1, p0, Lcom/helpshift/common/domain/Domain;->attachmentUploadThreader:Lcom/helpshift/common/domain/Threader;

    .line 87
    new-instance v0, Lcom/helpshift/common/domain/HSThreadFactory;

    const-string v1, "core-p"

    invoke-direct {v0, v1}, Lcom/helpshift/common/domain/HSThreadFactory;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 88
    new-instance v1, Lcom/helpshift/common/domain/BackgroundThreader;

    invoke-direct {v1, v0}, Lcom/helpshift/common/domain/BackgroundThreader;-><init>(Ljava/util/concurrent/ExecutorService;)V

    iput-object v1, p0, Lcom/helpshift/common/domain/Domain;->parallelThreader:Lcom/helpshift/common/domain/Threader;

    .line 90
    new-instance v0, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    .line 91
    new-instance v0, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;

    invoke-direct {v0, p1, p0}, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->configFetchDM:Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;

    .line 93
    new-instance v0, Lcom/helpshift/meta/MetaDataDM;

    iget-object v1, p0, Lcom/helpshift/common/domain/Domain;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-direct {v0, p0, p1, v1}, Lcom/helpshift/meta/MetaDataDM;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->metaDataDM:Lcom/helpshift/meta/MetaDataDM;

    .line 94
    new-instance v0, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->analyticsEventDM:Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    .line 95
    new-instance v0, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;

    iget-object v1, p0, Lcom/helpshift/common/domain/Domain;->userManagerDM:Lcom/helpshift/account/domainmodel/UserManagerDM;

    invoke-direct {v0, p1, p0, v1}, Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/account/domainmodel/UserManagerDM;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->conversationInboxManagerDM:Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;

    .line 96
    new-instance v0, Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;

    iget-object v1, p0, Lcom/helpshift/common/domain/Domain;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-direct {v0, v1, p1}, Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;-><init>(Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;Lcom/helpshift/common/platform/Platform;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->localeProviderDM:Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;

    .line 97
    new-instance p1, Lcom/helpshift/account/AuthenticationFailureDM;

    invoke-direct {p1, p0}, Lcom/helpshift/account/AuthenticationFailureDM;-><init>(Lcom/helpshift/common/domain/Domain;)V

    iput-object p1, p0, Lcom/helpshift/common/domain/Domain;->authenticationFailureDM:Lcom/helpshift/account/AuthenticationFailureDM;

    return-void
.end method

.method private declared-synchronized getDelayedThreader()Lcom/helpshift/common/domain/DelayedThreader;
    .locals 3

    monitor-enter p0

    .line 113
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->delayedThreader:Lcom/helpshift/common/domain/DelayedThreader;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 114
    new-instance v1, Lcom/helpshift/common/domain/HSThreadFactory;

    const-string v2, "core-d"

    invoke-direct {v1, v2}, Lcom/helpshift/common/domain/HSThreadFactory;-><init>(Ljava/lang/String;)V

    .line 115
    invoke-static {v0, v1}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    .line 116
    new-instance v1, Lcom/helpshift/common/domain/BackgroundDelayedThreader;

    invoke-direct {v1, v0}, Lcom/helpshift/common/domain/BackgroundDelayedThreader;-><init>(Ljava/util/concurrent/ScheduledExecutorService;)V

    iput-object v1, p0, Lcom/helpshift/common/domain/Domain;->delayedThreader:Lcom/helpshift/common/domain/DelayedThreader;

    .line 118
    :cond_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->delayedThreader:Lcom/helpshift/common/domain/DelayedThreader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public blockPublicAPI(Lcom/helpshift/common/HSBlockReason;)V
    .locals 0

    .line 257
    iput-object p1, p0, Lcom/helpshift/common/domain/Domain;->hsBlockReason:Lcom/helpshift/common/HSBlockReason;

    return-void
.end method

.method public getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;
    .locals 1

    .line 138
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->analyticsEventDM:Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    return-object v0
.end method

.method public declared-synchronized getAttachmentFileManagerDM()Lcom/helpshift/common/domain/AttachmentFileManagerDM;
    .locals 2

    monitor-enter p0

    .line 193
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->attachmentFileManagerDM:Lcom/helpshift/common/domain/AttachmentFileManagerDM;

    if-nez v0, :cond_0

    .line 194
    new-instance v0, Lcom/helpshift/common/domain/AttachmentFileManagerDM;

    iget-object v1, p0, Lcom/helpshift/common/domain/Domain;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v0, p0, v1}, Lcom/helpshift/common/domain/AttachmentFileManagerDM;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->attachmentFileManagerDM:Lcom/helpshift/common/domain/AttachmentFileManagerDM;

    .line 196
    :cond_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->attachmentFileManagerDM:Lcom/helpshift/common/domain/AttachmentFileManagerDM;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getAttachmentUploadThreader()Lcom/helpshift/common/domain/Threader;
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->attachmentUploadThreader:Lcom/helpshift/common/domain/Threader;

    return-object v0
.end method

.method public getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;
    .locals 1

    .line 234
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->authenticationFailureDM:Lcom/helpshift/account/AuthenticationFailureDM;

    return-object v0
.end method

.method public getAutoRetryFailedEventDM()Lcom/helpshift/common/AutoRetryFailedEventDM;
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->autoRetryFailedEventDM:Lcom/helpshift/common/AutoRetryFailedEventDM;

    return-object v0
.end method

.method public getConfigFetchDM()Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->configFetchDM:Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;

    return-object v0
.end method

.method public getConversationInboxManagerDM()Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->conversationInboxManagerDM:Lcom/helpshift/conversation/domainmodel/ConversationInboxManagerDM;

    return-object v0
.end method

.method public declared-synchronized getCryptoDM()Lcom/helpshift/crypto/CryptoDM;
    .locals 1

    monitor-enter p0

    .line 165
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->cryptoDM:Lcom/helpshift/crypto/CryptoDM;

    if-nez v0, :cond_0

    .line 166
    new-instance v0, Lcom/helpshift/crypto/CryptoDM;

    invoke-direct {v0}, Lcom/helpshift/crypto/CryptoDM;-><init>()V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->cryptoDM:Lcom/helpshift/crypto/CryptoDM;

    .line 168
    :cond_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->cryptoDM:Lcom/helpshift/crypto/CryptoDM;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getCustomIssueFieldDM()Lcom/helpshift/cif/CustomIssueFieldDM;
    .locals 2

    monitor-enter p0

    .line 157
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->customIssueFieldDM:Lcom/helpshift/cif/CustomIssueFieldDM;

    if-nez v0, :cond_0

    .line 158
    new-instance v0, Lcom/helpshift/cif/CustomIssueFieldDM;

    iget-object v1, p0, Lcom/helpshift/common/domain/Domain;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v0, p0, v1}, Lcom/helpshift/cif/CustomIssueFieldDM;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->customIssueFieldDM:Lcom/helpshift/cif/CustomIssueFieldDM;

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->customIssueFieldDM:Lcom/helpshift/cif/CustomIssueFieldDM;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->uiThreadDelegateDecorator:Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    return-object v0
.end method

.method public declared-synchronized getErrorReportsDM()Lcom/helpshift/logger/ErrorReportsDM;
    .locals 2

    monitor-enter p0

    .line 239
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->errorReportsDM:Lcom/helpshift/logger/ErrorReportsDM;

    if-nez v0, :cond_0

    .line 240
    new-instance v0, Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v1, p0, Lcom/helpshift/common/domain/Domain;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v0, v1, p0}, Lcom/helpshift/logger/ErrorReportsDM;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->errorReportsDM:Lcom/helpshift/logger/ErrorReportsDM;

    .line 242
    :cond_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->errorReportsDM:Lcom/helpshift/logger/ErrorReportsDM;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getFaqsDM()Lcom/helpshift/faq/FaqsDM;
    .locals 2

    monitor-enter p0

    .line 173
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->faqsDM:Lcom/helpshift/faq/FaqsDM;

    if-nez v0, :cond_0

    .line 174
    new-instance v0, Lcom/helpshift/faq/FaqsDM;

    iget-object v1, p0, Lcom/helpshift/common/domain/Domain;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v0, p0, v1}, Lcom/helpshift/faq/FaqsDM;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->faqsDM:Lcom/helpshift/faq/FaqsDM;

    .line 176
    :cond_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->faqsDM:Lcom/helpshift/faq/FaqsDM;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getLocaleProviderDM()Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->localeProviderDM:Lcom/helpshift/localeprovider/domainmodel/LocaleProviderDM;

    return-object v0
.end method

.method public getMetaDataDM()Lcom/helpshift/meta/MetaDataDM;
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->metaDataDM:Lcom/helpshift/meta/MetaDataDM;

    return-object v0
.end method

.method public getParallelThreader()Lcom/helpshift/common/domain/Threader;
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->parallelThreader:Lcom/helpshift/common/domain/Threader;

    return-object v0
.end method

.method public getReasonForBlockAPI()Lcom/helpshift/common/HSBlockReason;
    .locals 1

    .line 253
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->hsBlockReason:Lcom/helpshift/common/HSBlockReason;

    return-object v0
.end method

.method public getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    return-object v0
.end method

.method public getSerialThreader()Lcom/helpshift/common/domain/Threader;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->serialThreader:Lcom/helpshift/common/domain/Threader;

    return-object v0
.end method

.method public declared-synchronized getSmartIntentDM()Lcom/helpshift/conversation/smartintent/SmartIntentDM;
    .locals 2

    monitor-enter p0

    .line 246
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    if-nez v0, :cond_0

    .line 247
    new-instance v0, Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    iget-object v1, p0, Lcom/helpshift/common/domain/Domain;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v0, v1, p0}, Lcom/helpshift/conversation/smartintent/SmartIntentDM;-><init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->smartIntentDM:Lcom/helpshift/conversation/smartintent/SmartIntentDM;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getUserManagerDM()Lcom/helpshift/account/domainmodel/UserManagerDM;
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->userManagerDM:Lcom/helpshift/account/domainmodel/UserManagerDM;

    return-object v0
.end method

.method public declared-synchronized getWebSocketAuthDM()Lcom/helpshift/auth/domainmodel/WebSocketAuthDM;
    .locals 2

    monitor-enter p0

    .line 181
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->webSocketAuthDM:Lcom/helpshift/auth/domainmodel/WebSocketAuthDM;

    if-nez v0, :cond_0

    .line 182
    new-instance v0, Lcom/helpshift/auth/domainmodel/WebSocketAuthDM;

    iget-object v1, p0, Lcom/helpshift/common/domain/Domain;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v0, p0, v1}, Lcom/helpshift/auth/domainmodel/WebSocketAuthDM;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    iput-object v0, p0, Lcom/helpshift/common/domain/Domain;->webSocketAuthDM:Lcom/helpshift/auth/domainmodel/WebSocketAuthDM;

    .line 184
    :cond_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->webSocketAuthDM:Lcom/helpshift/auth/domainmodel/WebSocketAuthDM;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public runDelayed(Lcom/helpshift/common/domain/F;J)V
    .locals 1

    .line 217
    invoke-direct {p0}, Lcom/helpshift/common/domain/Domain;->getDelayedThreader()Lcom/helpshift/common/domain/DelayedThreader;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/helpshift/common/domain/DelayedThreader;->thread(Lcom/helpshift/common/domain/F;J)Lcom/helpshift/common/domain/F;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/common/domain/F;->f()V

    return-void
.end method

.method public runDelayedInParallel(Lcom/helpshift/common/domain/F;J)V
    .locals 1

    .line 221
    new-instance v0, Lcom/helpshift/common/domain/Domain$1;

    invoke-direct {v0, p0, p1}, Lcom/helpshift/common/domain/Domain$1;-><init>(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/domain/F;)V

    invoke-virtual {p0, v0, p2, p3}, Lcom/helpshift/common/domain/Domain;->runDelayed(Lcom/helpshift/common/domain/F;J)V

    return-void
.end method

.method public runOnUI(Lcom/helpshift/common/domain/F;)V
    .locals 1

    .line 208
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->isCurrentThreadUIThread()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 209
    invoke-virtual {p1}, Lcom/helpshift/common/domain/F;->f()V

    goto :goto_0

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getUIThreader()Lcom/helpshift/common/domain/Threader;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/helpshift/common/domain/Threader;->thread(Lcom/helpshift/common/domain/F;)Lcom/helpshift/common/domain/F;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/common/domain/F;->f()V

    :goto_0
    return-void
.end method

.method public runParallel(Lcom/helpshift/common/domain/F;)V
    .locals 1

    .line 204
    invoke-virtual {p0}, Lcom/helpshift/common/domain/Domain;->getParallelThreader()Lcom/helpshift/common/domain/Threader;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/helpshift/common/domain/Threader;->thread(Lcom/helpshift/common/domain/F;)Lcom/helpshift/common/domain/F;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/common/domain/F;->f()V

    return-void
.end method

.method public runSerial(Lcom/helpshift/common/domain/F;)V
    .locals 1

    .line 200
    invoke-virtual {p0}, Lcom/helpshift/common/domain/Domain;->getSerialThreader()Lcom/helpshift/common/domain/Threader;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/helpshift/common/domain/Threader;->thread(Lcom/helpshift/common/domain/F;)Lcom/helpshift/common/domain/F;

    move-result-object p1

    invoke-virtual {p1}, Lcom/helpshift/common/domain/F;->f()V

    return-void
.end method

.method public setDelegate(Lcom/helpshift/delegate/RootDelegate;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 147
    iget-object v0, p0, Lcom/helpshift/common/domain/Domain;->uiThreadDelegateDecorator:Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    invoke-virtual {v0, p1}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->setDelegate(Lcom/helpshift/delegate/RootDelegate;)V

    :cond_0
    return-void
.end method
