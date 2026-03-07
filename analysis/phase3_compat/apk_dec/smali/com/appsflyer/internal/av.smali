.class public final Lcom/appsflyer/internal/av;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final AFInAppEventParameterName:Lcom/appsflyer/internal/bv;

.field public final AFInAppEventType:Lcom/appsflyer/internal/bh;

.field private AFKeystoreWrapper:Lcom/appsflyer/internal/bb;

.field private final getLevel:Lcom/appsflyer/internal/bd;

.field public final valueOf:Ljava/util/concurrent/ExecutorService;

.field values:Lcom/android/billingclient/api/BillingClient;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/bh;Lcom/appsflyer/internal/bb;Lcom/appsflyer/internal/bv;Ljava/util/concurrent/ExecutorService;Lcom/appsflyer/internal/bd;)V
    .locals 0

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lcom/appsflyer/internal/av;->AFInAppEventType:Lcom/appsflyer/internal/bh;

    .line 61
    iput-object p2, p0, Lcom/appsflyer/internal/av;->AFKeystoreWrapper:Lcom/appsflyer/internal/bb;

    .line 62
    iput-object p3, p0, Lcom/appsflyer/internal/av;->AFInAppEventParameterName:Lcom/appsflyer/internal/bv;

    .line 63
    iput-object p4, p0, Lcom/appsflyer/internal/av;->valueOf:Ljava/util/concurrent/ExecutorService;

    .line 64
    iput-object p5, p0, Lcom/appsflyer/internal/av;->getLevel:Lcom/appsflyer/internal/bd;

    return-void
.end method

.method static synthetic AFInAppEventType(Lcom/appsflyer/internal/av;ZLjava/util/List;)V
    .locals 12

    .line 1179
    iget-object v0, p0, Lcom/appsflyer/internal/av;->AFInAppEventType:Lcom/appsflyer/internal/bh;

    invoke-virtual {v0}, Lcom/appsflyer/internal/bh;->AFKeystoreWrapper()Lcom/appsflyer/internal/aj;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 1183
    iget-boolean v3, v0, Lcom/appsflyer/internal/aj;->AFInAppEventType:Z

    .line 1184
    iget-object v4, v0, Lcom/appsflyer/internal/aj;->values:Lcom/appsflyer/compat/function/Function;

    if-eqz v4, :cond_0

    .line 1185
    iget-object v4, v0, Lcom/appsflyer/internal/aj;->values:Lcom/appsflyer/compat/function/Function;

    invoke-interface {v4, p2}, Lcom/appsflyer/compat/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    goto :goto_0

    :cond_0
    move-object v4, v1

    goto :goto_0

    :cond_1
    move-object v4, v1

    const/4 v3, 0x0

    .line 1188
    :goto_0
    new-instance v5, Lcom/appsflyer/internal/as;

    invoke-direct {v5, v3, p1, p2, v4}, Lcom/appsflyer/internal/as;-><init>(ZZLjava/util/List;Ljava/util/Map;)V

    .line 1189
    iget-object p2, p0, Lcom/appsflyer/internal/av;->getLevel:Lcom/appsflyer/internal/bd;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    .line 3062
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v4

    invoke-virtual {v4}, Lcom/appsflyer/AppsFlyerLib;->getHostPrefix()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v2

    invoke-virtual {v2}, Lcom/appsflyer/AppsFlyerLib;->getHostName()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v3, v4

    const-string v2, "https://%sars.%s/api/v1/android/validate_subscription"

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 3138
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 3139
    iget-object v3, p2, Lcom/appsflyer/internal/bd;->valueOf:Lcom/appsflyer/internal/aa;

    .line 4050
    iget-object v3, v3, Lcom/appsflyer/internal/aa;->AFInAppEventParameterName:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const-string v6, "app_id"

    .line 3139
    invoke-interface {v2, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 5033
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v3

    const-string v6, "AppUserId"

    invoke-virtual {v3, v6}, Lcom/appsflyer/AppsFlyerProperties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    const-string v6, "cuid"

    .line 3141
    invoke-interface {v2, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3142
    :cond_2
    iget-object v3, p2, Lcom/appsflyer/internal/bd;->valueOf:Lcom/appsflyer/internal/aa;

    .line 5055
    iget-object v6, v3, Lcom/appsflyer/internal/aa;->AFInAppEventParameterName:Landroid/content/Context;

    .line 6050
    iget-object v3, v3, Lcom/appsflyer/internal/aa;->AFInAppEventParameterName:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 5055
    invoke-static {v6, v3}, Lcom/appsflyer/internal/z;->AFKeystoreWrapper(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "app_version_name"

    .line 3142
    invoke-interface {v2, v6, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3144
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 3145
    iget-object v6, p2, Lcom/appsflyer/internal/bd;->valueOf:Lcom/appsflyer/internal/aa;

    .line 7045
    iget-object v6, v6, Lcom/appsflyer/internal/aa;->AFInAppEventParameterName:Landroid/content/Context;

    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    invoke-static {v6, v8}, Lcom/appsflyer/internal/ab;->AFKeystoreWrapper(Landroid/content/Context;Ljava/util/Map;)Lcom/appsflyer/internal/g;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 8024
    iget-object v1, v6, Lcom/appsflyer/internal/g;->values:Ljava/lang/String;

    :cond_3
    if-eqz v1, :cond_4

    const-string v6, "advertising_id"

    .line 3146
    invoke-interface {v3, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3147
    :cond_4
    iget-object v1, p2, Lcom/appsflyer/internal/bd;->valueOf:Lcom/appsflyer/internal/aa;

    .line 8060
    new-instance v6, Ljava/lang/ref/WeakReference;

    iget-object v1, v1, Lcom/appsflyer/internal/aa;->AFInAppEventParameterName:Landroid/content/Context;

    invoke-direct {v6, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {v6}, Lcom/appsflyer/internal/af;->valueOf(Ljava/lang/ref/WeakReference;)Ljava/lang/String;

    move-result-object v1

    const-string v6, "appsflyer_id"

    .line 3147
    invoke-interface {v3, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3148
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v6, "os_version"

    invoke-interface {v3, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3149
    sget-object v1, Lcom/appsflyer/internal/ac;->AFInAppEventType:Ljava/lang/String;

    const-string v6, "sdk_version"

    invoke-interface {v3, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "device_data"

    .line 3150
    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3151
    invoke-virtual {v5}, Lcom/appsflyer/internal/as;->valueOf()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v3, "is_cached"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3152
    invoke-virtual {v5}, Lcom/appsflyer/internal/as;->AFInAppEventParameterName()Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "SANDBOX"

    goto :goto_1

    :cond_5
    const-string v1, "PRODUCTION"

    :goto_1
    const-string v3, "environment"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9046
    iget-object v1, v5, Lcom/appsflyer/internal/as;->AFInAppEventType:Ljava/util/Map;

    const-string v3, "additional_parameters"

    .line 3153
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3155
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 10041
    iget-object v3, v5, Lcom/appsflyer/internal/as;->values:Ljava/util/List;

    .line 3156
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/billingclient/api/Purchase;

    .line 3157
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 3158
    invoke-virtual {v5}, Lcom/android/billingclient/api/Purchase;->getPurchaseToken()Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "token"

    invoke-interface {v6, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3159
    invoke-virtual {v5}, Lcom/android/billingclient/api/Purchase;->getSku()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v8, "subscription_id"

    invoke-interface {v6, v8, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 3160
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_6
    const-string/jumbo v3, "subscriptions"

    .line 3162
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2061
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    .line 2062
    new-instance v1, Lcom/appsflyer/internal/z;

    .line 2066
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v10

    const/4 v11, 0x0

    const-string v9, "POST"

    move-object v6, v1

    invoke-direct/range {v6 .. v11}, Lcom/appsflyer/internal/z;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/util/Map;Z)V

    .line 2068
    new-instance v2, Lcom/appsflyer/internal/bj;

    invoke-direct {v2}, Lcom/appsflyer/internal/bj;-><init>()V

    .line 10133
    invoke-virtual {p2}, Lcom/appsflyer/internal/bd;->AFInAppEventType()Z

    move-result v3

    .line 11107
    iput-boolean v3, v1, Lcom/appsflyer/internal/z;->AFInAppEventParameterName:Z

    .line 10134
    iget-object p2, p2, Lcom/appsflyer/internal/bd;->AFInAppEventType:Lcom/appsflyer/internal/ab;

    .line 12021
    new-instance v3, Lcom/appsflyer/internal/bl;

    iget-object v5, p2, Lcom/appsflyer/internal/ab;->AFKeystoreWrapper:Ljava/util/concurrent/ExecutorService;

    iget-object p2, p2, Lcom/appsflyer/internal/ab;->valueOf:Lcom/appsflyer/internal/bm;

    invoke-direct {v3, v1, v5, p2, v2}, Lcom/appsflyer/internal/bl;-><init>(Lcom/appsflyer/internal/z;Ljava/util/concurrent/ExecutorService;Lcom/appsflyer/internal/bm;Lcom/appsflyer/internal/bq;)V

    .line 1190
    new-instance p2, Lcom/appsflyer/internal/av$3;

    invoke-direct {p2, p0, p1, v0}, Lcom/appsflyer/internal/av$3;-><init>(Lcom/appsflyer/internal/av;ZLcom/appsflyer/internal/aj;)V

    .line 12084
    iget-object p0, v3, Lcom/appsflyer/internal/bl;->valueOf:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result p0

    if-nez p0, :cond_7

    .line 12060
    iget-object p0, v3, Lcom/appsflyer/internal/bl;->AFKeystoreWrapper:Ljava/util/concurrent/ExecutorService;

    new-instance p1, Lcom/appsflyer/internal/bl$3;

    invoke-direct {p1, v3, p2}, Lcom/appsflyer/internal/bl$3;-><init>(Lcom/appsflyer/internal/bl;Lcom/appsflyer/internal/bi;)V

    invoke-interface {p0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    return-void

    .line 12085
    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Http call is already executed"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 14041
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/av;->values:Lcom/android/billingclient/api/BillingClient;

    if-nez v0, :cond_0

    .line 15041
    iget-object v0, p0, Lcom/appsflyer/internal/av;->AFKeystoreWrapper:Lcom/appsflyer/internal/bb;

    .line 13076
    new-instance v1, Lcom/appsflyer/internal/at;

    invoke-direct {v1, p0}, Lcom/appsflyer/internal/at;-><init>(Lcom/appsflyer/internal/av;)V

    .line 16017
    iget-object v0, v0, Lcom/appsflyer/internal/bb;->AFInAppEventParameterName:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/billingclient/api/BillingClient;->newBuilder(Landroid/content/Context;)Lcom/android/billingclient/api/BillingClient$Builder;

    move-result-object v0

    .line 16018
    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingClient$Builder;->setListener(Lcom/android/billingclient/api/PurchasesUpdatedListener;)Lcom/android/billingclient/api/BillingClient$Builder;

    move-result-object v0

    .line 16019
    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingClient$Builder;->enablePendingPurchases()Lcom/android/billingclient/api/BillingClient$Builder;

    move-result-object v0

    .line 16020
    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingClient$Builder;->build()Lcom/android/billingclient/api/BillingClient;

    move-result-object v0

    .line 16041
    iput-object v0, p0, Lcom/appsflyer/internal/av;->values:Lcom/android/billingclient/api/BillingClient;

    .line 13082
    new-instance v1, Lcom/appsflyer/internal/au;

    invoke-direct {v1, p0}, Lcom/appsflyer/internal/au;-><init>(Lcom/appsflyer/internal/av;)V

    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingClient;->startConnection(Lcom/android/billingclient/api/BillingClientStateListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    .line 18222
    instance-of v1, v0, Ljava/lang/NoSuchMethodError;

    if-nez v1, :cond_1

    instance-of v1, v0, Ljava/lang/NoClassDefFoundError;

    if-eqz v1, :cond_2

    :cond_1
    const-string v1, "It seems your app uses different Play Billing library version than the SDK. Please use v.3.0.3"

    .line 18223
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AppsFlyer2dXConversionCallback(Ljava/lang/String;)V

    :cond_2
    const-string v1, "Failed to setup Play billing"

    .line 13095
    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
