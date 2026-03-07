.class final Lcom/appsflyer/internal/av$5;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/android/billingclient/api/SkuDetailsResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/av;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic AFInAppEventParameterName:Ljava/util/List;

.field private synthetic AFInAppEventType:Lcom/appsflyer/internal/av;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/av;Ljava/util/List;)V
    .locals 0

    .line 121
    iput-object p1, p0, Lcom/appsflyer/internal/av$5;->AFInAppEventType:Lcom/appsflyer/internal/av;

    iput-object p2, p0, Lcom/appsflyer/internal/av$5;->AFInAppEventParameterName:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onSkuDetailsResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/billingclient/api/BillingResult;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/SkuDetails;",
            ">;)V"
        }
    .end annotation

    .line 125
    :try_start_0
    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    if-nez p1, :cond_5

    if-nez p2, :cond_0

    goto :goto_2

    .line 128
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 129
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/billingclient/api/SkuDetails;

    .line 130
    invoke-virtual {v0}, Lcom/android/billingclient/api/SkuDetails;->getSku()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 132
    :cond_1
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 133
    iget-object v0, p0, Lcom/appsflyer/internal/av$5;->AFInAppEventParameterName:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/billingclient/api/Purchase;

    .line 134
    invoke-virtual {v1}, Lcom/android/billingclient/api/Purchase;->getSku()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 135
    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 137
    :cond_3
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_4

    return-void

    .line 138
    :cond_4
    iget-object p1, p0, Lcom/appsflyer/internal/av$5;->AFInAppEventType:Lcom/appsflyer/internal/av;

    const/4 v0, 0x0

    invoke-static {p1, v0, p2}, Lcom/appsflyer/internal/av;->AFInAppEventType(Lcom/appsflyer/internal/av;ZLjava/util/List;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_5
    :goto_2
    return-void

    :catchall_0
    move-exception p1

    .line 1222
    instance-of p2, p1, Ljava/lang/NoSuchMethodError;

    if-nez p2, :cond_6

    instance-of p2, p1, Ljava/lang/NoClassDefFoundError;

    if-eqz p2, :cond_7

    :cond_6
    const-string p2, "It seems your app uses different Play Billing library version than the SDK. Please use v.3.0.3"

    .line 1223
    invoke-static {p2}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    :cond_7
    const-string p2, "Failed to log new purchase"

    .line 141
    invoke-static {p2, p1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
