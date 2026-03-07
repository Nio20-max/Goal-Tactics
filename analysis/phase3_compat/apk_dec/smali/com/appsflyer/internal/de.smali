.class public final Lcom/appsflyer/internal/de;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private final AFInAppEventType:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/appsflyer/internal/dd;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/de;->AFInAppEventType:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final declared-synchronized AFInAppEventType()[Lcom/appsflyer/internal/dd;
    .locals 2

    monitor-enter p0

    .line 24
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/de;->AFInAppEventType:Ljava/util/List;

    const/4 v1, 0x0

    new-array v1, v1, [Lcom/appsflyer/internal/dd;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/appsflyer/internal/dd;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized AFKeystoreWrapper(Lcom/appsflyer/internal/dd;)V
    .locals 1

    monitor-enter p0

    .line 19
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/de;->AFInAppEventType:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
