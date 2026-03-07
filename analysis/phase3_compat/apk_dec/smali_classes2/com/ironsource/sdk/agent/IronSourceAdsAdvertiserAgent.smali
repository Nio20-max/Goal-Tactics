.class public Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;
.super Ljava/lang/Object;
.source "IronSourceAdsAdvertiserAgent.java"

# interfaces
.implements Lcom/ironsource/sdk/SSAAdvertiser;


# static fields
.field private static final TAG:Ljava/lang/String; = "IronSourceAdsAdvertiserAgent"

.field static sInstance:Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;
    .locals 2

    const-class v0, Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;

    monitor-enter v0

    .line 22
    :try_start_0
    sget-object v1, Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;->sInstance:Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;

    if-nez v1, :cond_0

    .line 23
    new-instance v1, Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;

    invoke-direct {v1}, Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;-><init>()V

    sput-object v1, Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;->sInstance:Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;

    .line 25
    :cond_0
    sget-object v1, Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;->sInstance:Lcom/ironsource/sdk/agent/IronSourceAdsAdvertiserAgent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public reportAppStarted(Landroid/content/Context;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method
