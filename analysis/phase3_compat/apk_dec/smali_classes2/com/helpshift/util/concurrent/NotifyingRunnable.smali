.class public Lcom/helpshift/util/concurrent/NotifyingRunnable;
.super Ljava/lang/Object;
.source "NotifyingRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_NotiRunnable"


# instance fields
.field private isFinished:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final runnable:Ljava/lang/Runnable;

.field private final syncLock:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Runnable;)V
    .locals 2

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/helpshift/util/concurrent/NotifyingRunnable;->syncLock:Ljava/lang/Object;

    .line 11
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/helpshift/util/concurrent/NotifyingRunnable;->isFinished:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 14
    iput-object p1, p0, Lcom/helpshift/util/concurrent/NotifyingRunnable;->runnable:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 36
    iget-object v0, p0, Lcom/helpshift/util/concurrent/NotifyingRunnable;->syncLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    .line 38
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/util/concurrent/NotifyingRunnable;->runnable:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    :try_start_1
    iget-object v2, p0, Lcom/helpshift/util/concurrent/NotifyingRunnable;->isFinished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 42
    iget-object v1, p0, Lcom/helpshift/util/concurrent/NotifyingRunnable;->syncLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 44
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v2

    .line 41
    iget-object v3, p0, Lcom/helpshift/util/concurrent/NotifyingRunnable;->isFinished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 42
    iget-object v1, p0, Lcom/helpshift/util/concurrent/NotifyingRunnable;->syncLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 43
    throw v2

    :catchall_1
    move-exception v1

    .line 44
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v1
.end method

.method public waitForCompletion()V
    .locals 4

    .line 19
    iget-object v0, p0, Lcom/helpshift/util/concurrent/NotifyingRunnable;->syncLock:Ljava/lang/Object;

    monitor-enter v0

    .line 23
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/util/concurrent/NotifyingRunnable;->isFinished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_0

    .line 24
    iget-object v1, p0, Lcom/helpshift/util/concurrent/NotifyingRunnable;->syncLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "Helpshift_NotiRunnable"

    const-string v3, "Exception in NotifyingRunnable"

    .line 28
    invoke-static {v2, v3, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 29
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 31
    :cond_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
