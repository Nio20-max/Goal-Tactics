.class public final Lcom/appsflyer/internal/by;
.super Ljava/lang/Object;
.source ""


# instance fields
.field final AFInAppEventParameterName:Ljava/lang/Object;

.field private final AFInAppEventType:Lcom/appsflyer/internal/ca;

.field private final AFKeystoreWrapper:Lcom/appsflyer/internal/bw;

.field private final AFVersionDeclaration:Lcom/appsflyer/internal/bd;

.field private final AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/cb;

.field private final getLevel:Lcom/appsflyer/internal/bx;

.field private final init:Ljava/util/concurrent/Executor;

.field private final valueOf:Lcom/appsflyer/internal/aa;

.field values:Lcom/appsflyer/internal/ap;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/bw;Lcom/appsflyer/internal/aa;Lcom/appsflyer/internal/ca;Lcom/appsflyer/internal/bx;Lcom/appsflyer/internal/bd;Lcom/appsflyer/internal/cb;Ljava/util/concurrent/Executor;Lcom/appsflyer/internal/ai;)V
    .locals 1

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/by;->AFInAppEventParameterName:Ljava/lang/Object;

    .line 58
    iput-object p1, p0, Lcom/appsflyer/internal/by;->AFKeystoreWrapper:Lcom/appsflyer/internal/bw;

    .line 59
    iput-object p2, p0, Lcom/appsflyer/internal/by;->valueOf:Lcom/appsflyer/internal/aa;

    .line 60
    iput-object p3, p0, Lcom/appsflyer/internal/by;->AFInAppEventType:Lcom/appsflyer/internal/ca;

    .line 61
    iput-object p4, p0, Lcom/appsflyer/internal/by;->getLevel:Lcom/appsflyer/internal/bx;

    .line 62
    iput-object p5, p0, Lcom/appsflyer/internal/by;->AFVersionDeclaration:Lcom/appsflyer/internal/bd;

    .line 63
    iput-object p6, p0, Lcom/appsflyer/internal/by;->AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/cb;

    .line 65
    iput-object p7, p0, Lcom/appsflyer/internal/by;->init:Ljava/util/concurrent/Executor;

    .line 1135
    iget-object p1, p8, Lcom/appsflyer/internal/ai;->AFKeystoreWrapper:Ljava/util/List;

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final AFKeystoreWrapper()Lcom/appsflyer/internal/ap;
    .locals 3

    .line 118
    iget-object v0, p0, Lcom/appsflyer/internal/by;->AFInAppEventParameterName:Ljava/lang/Object;

    monitor-enter v0

    .line 119
    :try_start_0
    iget-object v1, p0, Lcom/appsflyer/internal/by;->values:Lcom/appsflyer/internal/ap;

    const/4 v2, 0x0

    .line 120
    iput-object v2, p0, Lcom/appsflyer/internal/by;->values:Lcom/appsflyer/internal/ap;

    .line 121
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v1

    :catchall_0
    move-exception v1

    .line 122
    monitor-exit v0

    throw v1
.end method

.method public final values(Lcom/appsflyer/internal/bv;)V
    .locals 9

    .line 77
    new-instance v8, Lcom/appsflyer/internal/bs;

    iget-object v1, p0, Lcom/appsflyer/internal/by;->AFKeystoreWrapper:Lcom/appsflyer/internal/bw;

    iget-object v2, p0, Lcom/appsflyer/internal/by;->valueOf:Lcom/appsflyer/internal/aa;

    iget-object v3, p0, Lcom/appsflyer/internal/by;->AFInAppEventType:Lcom/appsflyer/internal/ca;

    iget-object v4, p0, Lcom/appsflyer/internal/by;->getLevel:Lcom/appsflyer/internal/bx;

    iget-object v5, p0, Lcom/appsflyer/internal/by;->AFVersionDeclaration:Lcom/appsflyer/internal/bd;

    iget-object v6, p0, Lcom/appsflyer/internal/by;->AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/cb;

    const-string/jumbo v7, "v1"

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Lcom/appsflyer/internal/bs;-><init>(Lcom/appsflyer/internal/bw;Lcom/appsflyer/internal/aa;Lcom/appsflyer/internal/ca;Lcom/appsflyer/internal/bx;Lcom/appsflyer/internal/bd;Lcom/appsflyer/internal/cb;Ljava/lang/String;)V

    .line 82
    iget-object v0, p0, Lcom/appsflyer/internal/by;->init:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/appsflyer/internal/by$2;

    invoke-direct {v1, p0, v8, p1}, Lcom/appsflyer/internal/by$2;-><init>(Lcom/appsflyer/internal/by;Lcom/appsflyer/internal/bs;Lcom/appsflyer/internal/bv;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
