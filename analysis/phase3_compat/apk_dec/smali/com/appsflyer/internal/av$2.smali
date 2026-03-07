.class final Lcom/appsflyer/internal/av$2;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/av;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic AFKeystoreWrapper:Lcom/android/billingclient/api/BillingResult;

.field private synthetic valueOf:Lcom/appsflyer/internal/av;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/av;Lcom/android/billingclient/api/BillingResult;)V
    .locals 0

    .line 152
    iput-object p1, p0, Lcom/appsflyer/internal/av$2;->valueOf:Lcom/appsflyer/internal/av;

    iput-object p2, p0, Lcom/appsflyer/internal/av$2;->AFKeystoreWrapper:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 156
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/av$2;->AFKeystoreWrapper:Lcom/android/billingclient/api/BillingResult;

    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 158
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/av$2;->valueOf:Lcom/appsflyer/internal/av;

    .line 1041
    iget-object v0, v0, Lcom/appsflyer/internal/av;->AFInAppEventParameterName:Lcom/appsflyer/internal/bv;

    const-string v1, "ars_history_sent"

    .line 158
    invoke-interface {v0, v1}, Lcom/appsflyer/internal/bv;->AFInAppEventParameterName(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    .line 161
    :cond_1
    iget-object v0, p0, Lcom/appsflyer/internal/av$2;->valueOf:Lcom/appsflyer/internal/av;

    .line 2041
    iget-object v0, v0, Lcom/appsflyer/internal/av;->values:Lcom/android/billingclient/api/BillingClient;

    const-string/jumbo v1, "subs"

    .line 161
    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingClient;->queryPurchases(Ljava/lang/String;)Lcom/android/billingclient/api/Purchase$PurchasesResult;

    move-result-object v0

    .line 162
    invoke-virtual {v0}, Lcom/android/billingclient/api/Purchase$PurchasesResult;->getPurchasesList()Ljava/util/List;

    move-result-object v1

    .line 163
    invoke-virtual {v0}, Lcom/android/billingclient/api/Purchase$PurchasesResult;->getResponseCode()I

    move-result v0

    if-nez v0, :cond_3

    if-eqz v1, :cond_3

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    .line 167
    :cond_2
    iget-object v0, p0, Lcom/appsflyer/internal/av$2;->valueOf:Lcom/appsflyer/internal/av;

    const/4 v2, 0x1

    invoke-static {v0, v2, v1}, Lcom/appsflyer/internal/av;->AFInAppEventType(Lcom/appsflyer/internal/av;ZLjava/util/List;)V

    return-void

    :cond_3
    :goto_0
    const-string v0, "Failed to query purchases history"

    .line 164
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 3222
    instance-of v1, v0, Ljava/lang/NoSuchMethodError;

    if-nez v1, :cond_4

    instance-of v1, v0, Ljava/lang/NoClassDefFoundError;

    if-eqz v1, :cond_5

    :cond_4
    const-string v1, "It seems your app uses different Play Billing library version than the SDK. Please use v.3.0.3"

    .line 3223
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    :cond_5
    const-string v1, "Failed to log purchases history"

    .line 170
    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
