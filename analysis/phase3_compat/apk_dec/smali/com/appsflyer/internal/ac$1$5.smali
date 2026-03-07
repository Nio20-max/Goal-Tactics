.class final Lcom/appsflyer/internal/ac$1$5;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/ac$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic values:Lcom/appsflyer/internal/ac$1;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/ac$1;)V
    .locals 0

    .line 868
    iput-object p1, p0, Lcom/appsflyer/internal/ac$1$5;->values:Lcom/appsflyer/internal/ac$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 872
    :try_start_0
    new-instance v0, Lcom/appsflyer/internal/ci;

    invoke-direct {v0}, Lcom/appsflyer/internal/ci;-><init>()V

    iget-object v1, p0, Lcom/appsflyer/internal/ac$1$5;->values:Lcom/appsflyer/internal/ac$1;

    iget-object v1, v1, Lcom/appsflyer/internal/ac$1;->AFInAppEventParameterName:Lcom/appsflyer/internal/ac;

    invoke-static {v1}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Lcom/appsflyer/internal/ac;)Landroid/app/Application;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1053
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Landroid/app/Application;

    iput-object v1, v0, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    .line 873
    :cond_0
    iget-object v1, p0, Lcom/appsflyer/internal/ac$1$5;->values:Lcom/appsflyer/internal/ac$1;

    iget-object v1, v1, Lcom/appsflyer/internal/ac$1;->AFInAppEventParameterName:Lcom/appsflyer/internal/ac;

    iget-object v2, p0, Lcom/appsflyer/internal/ac$1$5;->values:Lcom/appsflyer/internal/ac$1;

    iget-object v2, v2, Lcom/appsflyer/internal/ac$1;->AFInAppEventParameterName:Lcom/appsflyer/internal/ac;

    invoke-static {v2}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Lcom/appsflyer/internal/ac;)Landroid/app/Application;

    move-result-object v2

    invoke-static {v2}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;Landroid/content/SharedPreferences;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 874
    iget-object v1, p0, Lcom/appsflyer/internal/ac$1$5;->values:Lcom/appsflyer/internal/ac$1;

    iget-object v1, v1, Lcom/appsflyer/internal/ac$1;->AFInAppEventParameterName:Lcom/appsflyer/internal/ac;

    invoke-static {v1, v0}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    .line 876
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
