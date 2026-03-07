.class final Lcom/appsflyer/internal/au;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/android/billingclient/api/BillingClientStateListener;


# instance fields
.field private synthetic AFKeystoreWrapper:Lcom/appsflyer/internal/av;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/av;)V
    .locals 0

    .line 82
    iput-object p1, p0, Lcom/appsflyer/internal/au;->AFKeystoreWrapper:Lcom/appsflyer/internal/av;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onBillingServiceDisconnected()V
    .locals 0

    return-void
.end method

.method public final onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V
    .locals 3

    .line 85
    iget-object v0, p0, Lcom/appsflyer/internal/au;->AFKeystoreWrapper:Lcom/appsflyer/internal/av;

    .line 1152
    iget-object v1, v0, Lcom/appsflyer/internal/av;->valueOf:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/appsflyer/internal/av$2;

    invoke-direct {v2, v0, p1}, Lcom/appsflyer/internal/av$2;-><init>(Lcom/appsflyer/internal/av;Lcom/android/billingclient/api/BillingResult;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void
.end method
