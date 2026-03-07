.class public final Lcom/appsflyer/internal/bh;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private valueOf:Lcom/appsflyer/internal/aj;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final declared-synchronized AFKeystoreWrapper()Lcom/appsflyer/internal/aj;
    .locals 1

    monitor-enter p0

    .line 14
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bh;->valueOf:Lcom/appsflyer/internal/aj;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
