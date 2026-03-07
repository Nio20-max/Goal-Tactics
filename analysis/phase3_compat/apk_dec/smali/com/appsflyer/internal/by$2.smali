.class final Lcom/appsflyer/internal/by$2;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/by;->values(Lcom/appsflyer/internal/bv;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic AFKeystoreWrapper:Lcom/appsflyer/internal/bs;

.field private synthetic valueOf:Lcom/appsflyer/internal/by;

.field private synthetic values:Lcom/appsflyer/internal/bv;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/by;Lcom/appsflyer/internal/bs;Lcom/appsflyer/internal/bv;)V
    .locals 0

    .line 82
    iput-object p1, p0, Lcom/appsflyer/internal/by$2;->valueOf:Lcom/appsflyer/internal/by;

    iput-object p2, p0, Lcom/appsflyer/internal/by$2;->AFKeystoreWrapper:Lcom/appsflyer/internal/bs;

    iput-object p3, p0, Lcom/appsflyer/internal/by$2;->values:Lcom/appsflyer/internal/bv;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 86
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/by$2;->AFKeystoreWrapper:Lcom/appsflyer/internal/bs;

    invoke-virtual {v0}, Lcom/appsflyer/internal/bn;->AFInAppEventParameterName()Lcom/appsflyer/internal/bo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    iget-object v0, p0, Lcom/appsflyer/internal/by$2;->AFKeystoreWrapper:Lcom/appsflyer/internal/bs;

    .line 4075
    iget-object v0, v0, Lcom/appsflyer/internal/bs;->AFKeystoreWrapper:Lcom/appsflyer/internal/bu;

    .line 96
    sget-object v1, Lcom/appsflyer/internal/bu;->valueOf:Lcom/appsflyer/internal/bu;

    if-eq v0, v1, :cond_0

    .line 97
    iget-object v1, p0, Lcom/appsflyer/internal/by$2;->valueOf:Lcom/appsflyer/internal/by;

    iget-object v2, p0, Lcom/appsflyer/internal/by$2;->AFKeystoreWrapper:Lcom/appsflyer/internal/bs;

    .line 4113
    iget-object v2, v2, Lcom/appsflyer/internal/bs;->valueOf:Lcom/appsflyer/internal/ap;

    .line 5111
    iget-object v3, v1, Lcom/appsflyer/internal/by;->AFInAppEventParameterName:Ljava/lang/Object;

    monitor-enter v3

    .line 5112
    :try_start_1
    iput-object v2, v1, Lcom/appsflyer/internal/by;->values:Lcom/appsflyer/internal/ap;

    .line 5113
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v3

    throw v0

    :cond_0
    :goto_0
    if-nez v0, :cond_1

    const-string v0, "CFG: update RC returned null result, something went wrong!"

    .line 101
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    .line 102
    sget-object v0, Lcom/appsflyer/internal/bu;->AFInAppEventType:Lcom/appsflyer/internal/bu;

    .line 104
    :cond_1
    iget-object v0, p0, Lcom/appsflyer/internal/by$2;->valueOf:Lcom/appsflyer/internal/by;

    .line 6135
    iget-object v0, v0, Lcom/appsflyer/internal/by;->AFInAppEventParameterName:Ljava/lang/Object;

    monitor-enter v0

    .line 6137
    monitor-exit v0

    return-void

    .line 89
    :catch_0
    sget-object v0, Lcom/appsflyer/internal/bu;->AFInAppEventType:Lcom/appsflyer/internal/bu;

    .line 90
    iget-object v0, p0, Lcom/appsflyer/internal/by$2;->valueOf:Lcom/appsflyer/internal/by;

    iget-object v1, p0, Lcom/appsflyer/internal/by$2;->AFKeystoreWrapper:Lcom/appsflyer/internal/bs;

    .line 1113
    iget-object v1, v1, Lcom/appsflyer/internal/bs;->valueOf:Lcom/appsflyer/internal/ap;

    .line 2111
    iget-object v2, v0, Lcom/appsflyer/internal/by;->AFInAppEventParameterName:Ljava/lang/Object;

    monitor-enter v2

    .line 2112
    :try_start_2
    iput-object v1, v0, Lcom/appsflyer/internal/by;->values:Lcom/appsflyer/internal/ap;

    .line 2113
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 91
    iget-object v0, p0, Lcom/appsflyer/internal/by$2;->valueOf:Lcom/appsflyer/internal/by;

    .line 3135
    iget-object v0, v0, Lcom/appsflyer/internal/by;->AFInAppEventParameterName:Ljava/lang/Object;

    monitor-enter v0

    .line 3137
    monitor-exit v0

    return-void

    :catchall_1
    move-exception v0

    .line 2113
    monitor-exit v2

    throw v0
.end method
