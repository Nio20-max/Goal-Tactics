.class final Lcom/appsflyer/internal/ah$4;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/ah;->AFKeystoreWrapper(Landroid/content/Context;Lcom/appsflyer/internal/ah$e;Ljava/util/concurrent/Executor;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field AFInAppEventParameterName:Z

.field private synthetic AFKeystoreWrapper:Ljava/util/concurrent/Executor;

.field valueOf:Z


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/appsflyer/internal/ah$4;->AFKeystoreWrapper:Ljava/util/concurrent/Executor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Lcom/appsflyer/internal/ah$4;->AFInAppEventParameterName:Z

    return-void
.end method


# virtual methods
.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1

    .line 75
    iget-object p2, p0, Lcom/appsflyer/internal/ah$4;->AFKeystoreWrapper:Ljava/util/concurrent/Executor;

    new-instance v0, Lcom/appsflyer/internal/ah$4$3;

    invoke-direct {v0, p1}, Lcom/appsflyer/internal/ah$4$3;-><init>(Landroid/app/Activity;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .locals 2

    .line 47
    iget-object v0, p0, Lcom/appsflyer/internal/ah$4;->AFKeystoreWrapper:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/appsflyer/internal/ah$4$5;

    invoke-direct {v1, p0, p1}, Lcom/appsflyer/internal/ah$4$5;-><init>(Lcom/appsflyer/internal/ah$4;Landroid/app/Activity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .locals 2

    .line 30
    iget-object v0, p0, Lcom/appsflyer/internal/ah$4;->AFKeystoreWrapper:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/appsflyer/internal/ah$4$1;

    invoke-direct {v1, p0, p1}, Lcom/appsflyer/internal/ah$4$1;-><init>(Lcom/appsflyer/internal/ah$4;Landroid/app/Activity;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method
