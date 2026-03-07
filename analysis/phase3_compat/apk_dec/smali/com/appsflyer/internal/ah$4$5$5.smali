.class final Lcom/appsflyer/internal/ah$4$5$5;
.super Ljava/util/TimerTask;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/ah$4$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic AFInAppEventType:Landroid/content/Context;

.field private synthetic AFKeystoreWrapper:Lcom/appsflyer/internal/ah$4$5;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/ah$4$5;Landroid/content/Context;)V
    .locals 0

    .line 53
    iput-object p1, p0, Lcom/appsflyer/internal/ah$4$5$5;->AFKeystoreWrapper:Lcom/appsflyer/internal/ah$4$5;

    iput-object p2, p0, Lcom/appsflyer/internal/ah$4$5$5;->AFInAppEventType:Landroid/content/Context;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 56
    iget-object v0, p0, Lcom/appsflyer/internal/ah$4$5$5;->AFKeystoreWrapper:Lcom/appsflyer/internal/ah$4$5;

    iget-object v0, v0, Lcom/appsflyer/internal/ah$4$5;->AFInAppEventParameterName:Lcom/appsflyer/internal/ah$4;

    iget-boolean v0, v0, Lcom/appsflyer/internal/ah$4;->valueOf:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/appsflyer/internal/ah$4$5$5;->AFKeystoreWrapper:Lcom/appsflyer/internal/ah$4$5;

    iget-object v0, v0, Lcom/appsflyer/internal/ah$4$5;->AFInAppEventParameterName:Lcom/appsflyer/internal/ah$4;

    iget-boolean v0, v0, Lcom/appsflyer/internal/ah$4;->AFInAppEventParameterName:Z

    if-eqz v0, :cond_0

    .line 57
    iget-object v0, p0, Lcom/appsflyer/internal/ah$4$5$5;->AFKeystoreWrapper:Lcom/appsflyer/internal/ah$4$5;

    iget-object v0, v0, Lcom/appsflyer/internal/ah$4$5;->AFInAppEventParameterName:Lcom/appsflyer/internal/ah$4;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/appsflyer/internal/ah$4;->valueOf:Z

    .line 59
    :try_start_0
    sget-object v0, Lcom/appsflyer/internal/ah;->AFInAppEventParameterName:Lcom/appsflyer/internal/ah$e;

    iget-object v1, p0, Lcom/appsflyer/internal/ah$4$5$5;->AFInAppEventType:Landroid/content/Context;

    invoke-interface {v0, v1}, Lcom/appsflyer/internal/ah$e;->valueOf(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    const-string v1, "Listener threw exception! "

    .line 61
    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method
