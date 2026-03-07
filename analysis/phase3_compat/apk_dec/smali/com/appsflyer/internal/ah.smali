.class public final Lcom/appsflyer/internal/ah;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/ah$e;
    }
.end annotation


# static fields
.field public static AFInAppEventParameterName:Lcom/appsflyer/internal/ah$e; = null

.field public static valueOf:J = 0x1f4L


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static AFKeystoreWrapper(Landroid/content/Context;Lcom/appsflyer/internal/ah$e;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 23
    sput-object p1, Lcom/appsflyer/internal/ah;->AFInAppEventParameterName:Lcom/appsflyer/internal/ah$e;

    .line 24
    new-instance p1, Lcom/appsflyer/internal/ah$4;

    invoke-direct {p1, p2}, Lcom/appsflyer/internal/ah$4;-><init>(Ljava/util/concurrent/Executor;)V

    .line 99
    instance-of p2, p0, Landroid/app/Activity;

    if-eqz p2, :cond_0

    move-object p2, p0

    check-cast p2, Landroid/app/Activity;

    invoke-interface {p1, p2}, Landroid/app/Application$ActivityLifecycleCallbacks;->onActivityResumed(Landroid/app/Activity;)V

    .line 100
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Landroid/app/Application;

    .line 101
    invoke-virtual {p0, p1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method
