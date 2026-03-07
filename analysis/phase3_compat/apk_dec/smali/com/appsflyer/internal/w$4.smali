.class final Lcom/appsflyer/internal/w$4;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic values:Lcom/appsflyer/internal/w;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/w;)V
    .locals 0

    .line 58
    iput-object p1, p0, Lcom/appsflyer/internal/w$4;->values:Lcom/appsflyer/internal/w;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 61
    iget-object v0, p0, Lcom/appsflyer/internal/w$4;->values:Lcom/appsflyer/internal/w;

    iget-object v0, v0, Lcom/appsflyer/internal/w;->AFInAppEventType:Ljava/lang/Object;

    monitor-enter v0

    .line 62
    :try_start_0
    iget-object v1, p0, Lcom/appsflyer/internal/w$4;->values:Lcom/appsflyer/internal/w;

    .line 1219
    iget-object v2, v1, Lcom/appsflyer/internal/w;->AppsFlyer2dXConversionCallback:Ljava/util/concurrent/Executor;

    new-instance v3, Lcom/appsflyer/internal/w$10;

    invoke-direct {v3, v1}, Lcom/appsflyer/internal/w$10;-><init>(Lcom/appsflyer/internal/w;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 63
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
