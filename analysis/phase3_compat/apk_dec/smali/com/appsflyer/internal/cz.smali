.class public abstract Lcom/appsflyer/internal/cz;
.super Lcom/appsflyer/internal/dd;
.source ""


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/dd;-><init>(Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method final values(Landroid/content/Context;Lcom/appsflyer/internal/aw;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/appsflyer/internal/aw<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 16
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v0

    .line 17
    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Z)I

    move-result p1

    if-gtz p1, :cond_1

    .line 18
    invoke-virtual {p2}, Lcom/appsflyer/internal/aw;->values()Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    .line 1038
    :cond_0
    new-instance p1, Ljava/lang/Thread;

    iget-object p2, p2, Lcom/appsflyer/internal/aw;->AFInAppEventType:Ljava/util/concurrent/FutureTask;

    invoke-direct {p1, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 20
    invoke-virtual {p0}, Lcom/appsflyer/internal/dd;->values()V

    :cond_1
    :goto_0
    return-void
.end method
