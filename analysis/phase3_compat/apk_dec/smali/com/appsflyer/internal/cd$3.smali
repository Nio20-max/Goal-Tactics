.class final Lcom/appsflyer/internal/cd$3;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/cd;->AFKeystoreWrapper(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic AFInAppEventType:Lcom/appsflyer/internal/cd;

.field private synthetic values:Lcom/appsflyer/internal/ac;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/cd;Lcom/appsflyer/internal/ac;)V
    .locals 0

    .line 216
    iput-object p1, p0, Lcom/appsflyer/internal/cd$3;->AFInAppEventType:Lcom/appsflyer/internal/cd;

    iput-object p2, p0, Lcom/appsflyer/internal/cd$3;->values:Lcom/appsflyer/internal/ac;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 220
    :try_start_0
    new-instance v0, Lcom/appsflyer/internal/an$c;

    iget-object v1, p0, Lcom/appsflyer/internal/cd$3;->AFInAppEventType:Lcom/appsflyer/internal/cd;

    iget-object v2, p0, Lcom/appsflyer/internal/cd$3;->values:Lcom/appsflyer/internal/ac;

    .line 221
    invoke-virtual {v2}, Lcom/appsflyer/AppsFlyerLib;->isStopped()Z

    move-result v2

    .line 1030
    iput-boolean v2, v1, Lcom/appsflyer/internal/cm;->onConversionDataSuccess:Z

    .line 221
    invoke-direct {v0, v1}, Lcom/appsflyer/internal/an$c;-><init>(Lcom/appsflyer/internal/cm;)V

    invoke-virtual {v0}, Lcom/appsflyer/internal/an$c;->values()Ljava/net/HttpURLConnection;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 223
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/appsflyer/internal/cd$3;->AFInAppEventType:Lcom/appsflyer/internal/cd;

    invoke-static {v1}, Lcom/appsflyer/internal/cd;->valueOf(Lcom/appsflyer/internal/cd;)V

    .line 224
    :cond_0
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    .line 227
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
