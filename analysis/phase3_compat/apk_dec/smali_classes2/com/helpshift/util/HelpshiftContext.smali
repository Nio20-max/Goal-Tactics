.class public Lcom/helpshift/util/HelpshiftContext;
.super Ljava/lang/Object;
.source "HelpshiftContext.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_Context"

.field private static campaignAppLifeCycleListener:Lcom/helpshift/app/CampaignAppLifeCycleListener;

.field private static context:Landroid/content/Context;

.field private static coreApi:Lcom/helpshift/CoreApi;

.field public static installAPICalled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public static installCallSuccessful:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static final lock:Ljava/lang/Object;

.field private static platform:Lcom/helpshift/common/platform/Platform;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 20
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/helpshift/util/HelpshiftContext;->lock:Ljava/lang/Object;

    .line 24
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/helpshift/util/HelpshiftContext;->installCallSuccessful:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 25
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/helpshift/util/HelpshiftContext;->installAPICalled:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getApplicationContext()Landroid/content/Context;
    .locals 1

    .line 32
    sget-object v0, Lcom/helpshift/util/HelpshiftContext;->context:Landroid/content/Context;

    return-object v0
.end method

.method public static getCampaignAppLifeCycleListener()Lcom/helpshift/app/CampaignAppLifeCycleListener;
    .locals 1

    .line 48
    sget-object v0, Lcom/helpshift/util/HelpshiftContext;->campaignAppLifeCycleListener:Lcom/helpshift/app/CampaignAppLifeCycleListener;

    return-object v0
.end method

.method public static getCoreApi()Lcom/helpshift/CoreApi;
    .locals 1

    .line 74
    sget-object v0, Lcom/helpshift/util/HelpshiftContext;->coreApi:Lcom/helpshift/CoreApi;

    return-object v0
.end method

.method public static getPlatform()Lcom/helpshift/common/platform/Platform;
    .locals 1

    .line 70
    sget-object v0, Lcom/helpshift/util/HelpshiftContext;->platform:Lcom/helpshift/common/platform/Platform;

    return-object v0
.end method

.method public static initializeCore(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 61
    sget-object v0, Lcom/helpshift/util/HelpshiftContext;->platform:Lcom/helpshift/common/platform/Platform;

    if-nez v0, :cond_0

    .line 62
    new-instance v0, Lcom/helpshift/common/platform/AndroidPlatform;

    sget-object v1, Lcom/helpshift/util/HelpshiftContext;->context:Landroid/content/Context;

    invoke-direct {v0, v1, p0, p1, p2}, Lcom/helpshift/common/platform/AndroidPlatform;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/helpshift/util/HelpshiftContext;->platform:Lcom/helpshift/common/platform/Platform;

    .line 64
    :cond_0
    sget-object p0, Lcom/helpshift/util/HelpshiftContext;->coreApi:Lcom/helpshift/CoreApi;

    if-nez p0, :cond_1

    .line 65
    new-instance p0, Lcom/helpshift/JavaCore;

    sget-object p1, Lcom/helpshift/util/HelpshiftContext;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {p0, p1}, Lcom/helpshift/JavaCore;-><init>(Lcom/helpshift/common/platform/Platform;)V

    sput-object p0, Lcom/helpshift/util/HelpshiftContext;->coreApi:Lcom/helpshift/CoreApi;

    :cond_1
    return-void
.end method

.method public static setApplicationContext(Landroid/content/Context;)V
    .locals 2

    .line 36
    sget-object v0, Lcom/helpshift/util/HelpshiftContext;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 37
    :try_start_0
    sget-object v1, Lcom/helpshift/util/HelpshiftContext;->context:Landroid/content/Context;

    if-nez v1, :cond_0

    .line 38
    sput-object p0, Lcom/helpshift/util/HelpshiftContext;->context:Landroid/content/Context;

    .line 40
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public static setCampaignAppLifeCycleListener(Lcom/helpshift/app/CampaignAppLifeCycleListener;)V
    .locals 1

    .line 55
    sget-object v0, Lcom/helpshift/util/HelpshiftContext;->campaignAppLifeCycleListener:Lcom/helpshift/app/CampaignAppLifeCycleListener;

    if-nez v0, :cond_0

    .line 56
    sput-object p0, Lcom/helpshift/util/HelpshiftContext;->campaignAppLifeCycleListener:Lcom/helpshift/app/CampaignAppLifeCycleListener;

    :cond_0
    return-void
.end method

.method public static verifyInstall()Z
    .locals 4

    .line 78
    sget-object v0, Lcom/helpshift/util/HelpshiftContext;->installAPICalled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "Helpshift_Context"

    if-nez v0, :cond_3

    .line 81
    sget-object v0, Lcom/helpshift/util/HelpshiftContext;->context:Landroid/content/Context;

    const-string v3, "com.helpshift.Core.install() method not called with valid arguments"

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 86
    :cond_0
    sget-object v0, Lcom/helpshift/util/HelpshiftContext;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/helpshift/util/ApplicationUtil;->isApplicationDebuggable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 91
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 88
    :cond_1
    new-instance v0, Lcom/helpshift/exceptions/HelpshiftInitializationException;

    invoke-direct {v0, v3}, Lcom/helpshift/exceptions/HelpshiftInitializationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_2
    :goto_0
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 96
    :cond_3
    sget-object v0, Lcom/helpshift/util/HelpshiftContext;->coreApi:Lcom/helpshift/CoreApi;

    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getDomain()Lcom/helpshift/common/domain/Domain;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 98
    sget-object v0, Lcom/helpshift/util/HelpshiftContext;->coreApi:Lcom/helpshift/CoreApi;

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getDomain()Lcom/helpshift/common/domain/Domain;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getReasonForBlockAPI()Lcom/helpshift/common/HSBlockReason;

    move-result-object v0

    sget-object v3, Lcom/helpshift/common/HSBlockReason;->FETCH_ACTIVE_USER_ERROR:Lcom/helpshift/common/HSBlockReason;

    if-ne v0, v3, :cond_4

    const-string v0, "ConversationInboxManagerDM Error in fetching active user from DB"

    .line 100
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_4
    const/4 v0, 0x1

    return v0
.end method
