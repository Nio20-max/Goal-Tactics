.class Lcom/android/billingclient/api/BillingClientImpl;
.super Lcom/android/billingclient/api/BillingClient;
.source "com.android.billingclient:billing@@4.0.0"


# instance fields
.field private volatile zza:I

.field private final zzb:Ljava/lang/String;

.field private final zzc:Landroid/os/Handler;

.field private volatile zzd:Lcom/android/billingclient/api/zzh;

.field private zze:Landroid/content/Context;

.field private zzf:Landroid/content/Context;

.field private volatile zzg:Lcom/google/android/gms/internal/play_billing/zzd;

.field private volatile zzh:Lcom/android/billingclient/api/zzaf;

.field private zzi:Z

.field private zzj:Z

.field private zzk:I

.field private zzl:Z

.field private zzm:Z

.field private zzn:Z

.field private zzo:Z

.field private zzp:Z

.field private zzq:Z

.field private zzr:Z

.field private zzs:Z

.field private zzt:Z

.field private zzu:Ljava/util/concurrent/ExecutorService;


# direct methods
.method private constructor <init>(Landroid/app/Activity;ZLjava/lang/String;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v3, Lcom/android/billingclient/api/zzah;

    invoke-direct {v3}, Lcom/android/billingclient/api/zzah;-><init>()V

    const/4 v5, 0x0

    move-object v0, p0

    move v2, p2

    move-object v4, p3

    .line 2
    invoke-direct/range {v0 .. v5}, Lcom/android/billingclient/api/BillingClientImpl;-><init>(Landroid/content/Context;ZLcom/android/billingclient/api/PurchasesUpdatedListener;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;ZLcom/android/billingclient/api/PurchasesUpdatedListener;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClient;-><init>()V

    const/4 p5, 0x0

    iput p5, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    new-instance v0, Landroid/os/Handler;

    .line 3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzc:Landroid/os/Handler;

    iput p5, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzk:I

    iput-object p4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzb:Ljava/lang/String;

    .line 4
    invoke-direct {p0, p1, p3, p2}, Lcom/android/billingclient/api/BillingClientImpl;->initialize(Landroid/content/Context;Lcom/android/billingclient/api/PurchasesUpdatedListener;Z)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 3

    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClient;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    new-instance v1, Landroid/os/Handler;

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzc:Landroid/os/Handler;

    iput v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzk:I

    iput-object p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzb:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Ljava/lang/String;ZLandroid/content/Context;Lcom/android/billingclient/api/PurchasesUpdatedListener;)V
    .locals 6

    :try_start_0
    const-string p1, "com.android.billingclient.ktx.BuildConfig"

    .line 6
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const-string v0, "VERSION_NAME"

    .line 7
    invoke-virtual {p1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 v0, 0x0

    .line 8
    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "4.0.0"

    :goto_0
    move-object v4, p1

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p3

    move v2, p2

    move-object v3, p4

    .line 9
    invoke-direct/range {v0 .. v5}, Lcom/android/billingclient/api/BillingClientImpl;-><init>(Landroid/content/Context;ZLcom/android/billingclient/api/PurchasesUpdatedListener;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private initialize(Landroid/content/Context;Lcom/android/billingclient/api/PurchasesUpdatedListener;Z)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    new-instance v1, Lcom/android/billingclient/api/zzh;

    .line 2
    invoke-direct {v1, v0, p2}, Lcom/android/billingclient/api/zzh;-><init>(Landroid/content/Context;Lcom/android/billingclient/api/PurchasesUpdatedListener;)V

    iput-object v1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzd:Lcom/android/billingclient/api/zzh;

    iput-object p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zze:Landroid/content/Context;

    iput-boolean p3, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzt:Z

    return-void
.end method

.method private launchBillingFlowCpp(Landroid/app/Activity;Lcom/android/billingclient/api/BillingFlowParams;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/billingclient/api/BillingClientImpl;->launchBillingFlow(Landroid/app/Activity;Lcom/android/billingclient/api/BillingFlowParams;)Lcom/android/billingclient/api/BillingResult;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/billingclient/api/BillingResult;->getResponseCode()I

    move-result p1

    return p1
.end method

.method private launchPriceChangeConfirmationFlow(Landroid/app/Activity;Lcom/android/billingclient/api/PriceChangeFlowParams;J)V
    .locals 1

    new-instance v0, Lcom/android/billingclient/api/zzah;

    .line 1
    invoke-direct {v0, p3, p4}, Lcom/android/billingclient/api/zzah;-><init>(J)V

    invoke-virtual {p0, p1, p2, v0}, Lcom/android/billingclient/api/BillingClientImpl;->launchPriceChangeConfirmationFlow(Landroid/app/Activity;Lcom/android/billingclient/api/PriceChangeFlowParams;Lcom/android/billingclient/api/PriceChangeConfirmationListener;)V

    return-void
.end method

.method private startConnection(J)V
    .locals 6

    new-instance v0, Lcom/android/billingclient/api/zzah;

    .line 1
    invoke-direct {v0, p1, p2}, Lcom/android/billingclient/api/zzah;-><init>(J)V

    .line 2
    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingClientImpl;->isReady()Z

    move-result p1

    const-string p2, "BillingClient"

    if-eqz p1, :cond_0

    const-string p1, "Service connection is valid. No need to re-initialize."

    .line 3
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {v0, p1}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V

    return-void

    :cond_0
    iget p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    const-string p1, "Client is already in the process of connecting to billing service."

    .line 5
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzd:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {v0, p1}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V

    return-void

    :cond_1
    iget p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    const/4 v2, 0x3

    if-ne p1, v2, :cond_2

    const-string p1, "Client was already closed and can\'t be reused. Please create another instance."

    .line 7
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {v0, p1}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V

    return-void

    :cond_2
    iput v1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    iget-object p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzd:Lcom/android/billingclient/api/zzh;

    .line 9
    invoke-virtual {p1}, Lcom/android/billingclient/api/zzh;->zzd()V

    const-string p1, "Starting in-app billing setup."

    .line 10
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/android/billingclient/api/zzaf;

    const/4 v2, 0x0

    .line 11
    invoke-direct {p1, p0, v0, v2}, Lcom/android/billingclient/api/zzaf;-><init>(Lcom/android/billingclient/api/BillingClientImpl;Lcom/android/billingclient/api/BillingClientStateListener;Lcom/android/billingclient/api/zzy;)V

    iput-object p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzh:Lcom/android/billingclient/api/zzaf;

    new-instance p1, Landroid/content/Intent;

    const-string v2, "com.android.vending.billing.InAppBillingService.BIND"

    .line 12
    invoke-direct {p1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.android.vending"

    .line 13
    invoke-virtual {p1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v3, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 14
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, p1, v4}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_5

    .line 15
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_5

    .line 16
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    .line 17
    iget-object v5, v3, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    if-eqz v5, :cond_5

    .line 18
    iget-object v5, v3, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v5, v5, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    .line 19
    iget-object v3, v3, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v3, v3, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    .line 20
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    if-eqz v3, :cond_4

    new-instance v2, Landroid/content/ComponentName;

    .line 22
    invoke-direct {v2, v5, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Landroid/content/Intent;

    .line 23
    invoke-direct {v3, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 24
    invoke-virtual {v3, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzb:Ljava/lang/String;

    const-string v2, "playBillingLibraryVersion"

    .line 25
    invoke-virtual {v3, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzh:Lcom/android/billingclient/api/zzaf;

    .line 26
    invoke-virtual {p1, v3, v2, v1}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "Service was bonded successfully."

    .line 27
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    const-string p1, "Connection to Billing service is blocked."

    .line 28
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    const-string p1, "The device doesn\'t have valid Play Store."

    .line 21
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    :cond_5
    :goto_0
    iput v4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    const-string p1, "Billing service unavailable on device."

    .line 29
    invoke-static {p2, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzc:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {v0, p1}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V

    return-void
.end method

.method static synthetic zzA(Lcom/android/billingclient/api/BillingClientImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzm:Z

    return p1
.end method

.method static synthetic zzB(Lcom/android/billingclient/api/BillingClientImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzl:Z

    return p1
.end method

.method static synthetic zzC(Lcom/android/billingclient/api/BillingClientImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzj:Z

    return p1
.end method

.method private final zzD()Landroid/os/Handler;
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzc:Landroid/os/Handler;

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    :goto_0
    return-object v0
.end method

.method private final zzE(Lcom/android/billingclient/api/BillingResult;)Lcom/android/billingclient/api/BillingResult;
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzc:Landroid/os/Handler;

    new-instance v1, Lcom/android/billingclient/api/zzq;

    .line 2
    invoke-direct {v1, p0, p1}, Lcom/android/billingclient/api/zzq;-><init>(Lcom/android/billingclient/api/BillingClientImpl;Lcom/android/billingclient/api/BillingResult;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-object p1
.end method

.method private final zzF()Lcom/android/billingclient/api/BillingResult;
    .locals 2

    iget v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 2
    :cond_0
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzl:Lcom/android/billingclient/api/BillingResult;

    goto :goto_1

    .line 1
    :cond_1
    :goto_0
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    :goto_1
    return-object v0
.end method

.method private final zzG(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult;
    .locals 6

    new-instance v1, Lcom/android/billingclient/api/zzn;

    .line 1
    invoke-direct {v1, p0, p1}, Lcom/android/billingclient/api/zzn;-><init>(Lcom/android/billingclient/api/BillingClientImpl;Ljava/lang/String;)V

    .line 2
    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClientImpl;->zzD()Landroid/os/Handler;

    move-result-object v5

    const-wide/16 v2, 0x1388

    const/4 v4, 0x0

    move-object v0, p0

    .line 3
    invoke-direct/range {v0 .. v5}, Lcom/android/billingclient/api/BillingClientImpl;->zzH(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    move-result-object p1

    const-wide/16 v0, 0x1388

    :try_start_0
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 4
    invoke-interface {p1, v0, v1, v2}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-nez p1, :cond_0

    .line 5
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    goto :goto_0

    .line 6
    :cond_0
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzi:Lcom/android/billingclient/api/BillingResult;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-object p1

    :catch_0
    const-string p1, "BillingClient"

    const-string v0, "Exception while checking if billing is supported; try to reconnect"

    .line 7
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    return-object p1
.end method

.method private final zzH(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Callable<",
            "TT;>;J",
            "Ljava/lang/Runnable;",
            "Landroid/os/Handler;",
            ")",
            "Ljava/util/concurrent/Future<",
            "TT;>;"
        }
    .end annotation

    long-to-double p2, p2

    const-wide v0, 0x3fee666666666666L    # 0.95

    mul-double p2, p2, v0

    double-to-long p2, p2

    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzu:Ljava/util/concurrent/ExecutorService;

    if-nez v0, :cond_0

    .line 1
    sget v0, Lcom/google/android/gms/internal/play_billing/zza;->zza:I

    new-instance v1, Lcom/android/billingclient/api/zzac;

    invoke-direct {v1, p0}, Lcom/android/billingclient/api/zzac;-><init>(Lcom/android/billingclient/api/BillingClientImpl;)V

    .line 2
    invoke-static {v0, v1}, Ljava/util/concurrent/Executors;->newFixedThreadPool(ILjava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzu:Ljava/util/concurrent/ExecutorService;

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzu:Ljava/util/concurrent/ExecutorService;

    .line 3
    invoke-interface {v0, p1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    new-instance v0, Lcom/android/billingclient/api/zzw;

    .line 5
    invoke-direct {v0, p1, p4}, Lcom/android/billingclient/api/zzw;-><init>(Ljava/util/concurrent/Future;Ljava/lang/Runnable;)V

    invoke-virtual {p5, v0, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-object p1

    :catch_0
    move-exception p1

    .line 4
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    new-instance p3, Ljava/lang/StringBuilder;

    add-int/lit8 p2, p2, 0x1c

    invoke-direct {p3, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p2, "Async task throws exception "

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "BillingClient"

    invoke-static {p2, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method private final zzI(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/PriceChangeConfirmationListener;)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzc:Landroid/os/Handler;

    new-instance v1, Lcom/android/billingclient/api/zzs;

    .line 2
    invoke-direct {v1, p2, p1}, Lcom/android/billingclient/api/zzs;-><init>(Lcom/android/billingclient/api/PriceChangeConfirmationListener;Lcom/android/billingclient/api/BillingResult;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic zza(Lcom/android/billingclient/api/BillingClientImpl;)I
    .locals 0

    iget p0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzk:I

    return p0
.end method

.method static synthetic zzb(Lcom/android/billingclient/api/BillingClientImpl;I)I
    .locals 0

    iput p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzk:I

    return p1
.end method

.method static synthetic zzc(Lcom/android/billingclient/api/BillingClientImpl;I)I
    .locals 0

    iput p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    return p1
.end method

.method static synthetic zzd(Lcom/android/billingclient/api/BillingClientImpl;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic zzh(Lcom/android/billingclient/api/BillingClientImpl;)Landroid/os/Handler;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClientImpl;->zzD()Landroid/os/Handler;

    move-result-object p0

    return-object p0
.end method

.method static synthetic zzi(Lcom/android/billingclient/api/BillingClientImpl;Ljava/lang/String;)Lcom/android/billingclient/api/zzag;
    .locals 14

    .line 1
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const-string v2, "Querying purchase history, item type: "

    if-eqz v1, :cond_0

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 21
    :cond_0
    new-instance v0, Ljava/lang/String;

    .line 1
    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    const-string v1, "BillingClient"

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    .line 2
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-boolean v2, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzn:Z

    iget-boolean v3, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzt:Z

    iget-object v4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzb:Ljava/lang/String;

    .line 3
    invoke-static {v2, v3, v4}, Lcom/google/android/gms/internal/play_billing/zza;->zzf(ZZLjava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    const/4 v3, 0x0

    move-object v9, v3

    :cond_1
    iget-boolean v4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzl:Z

    if-nez v4, :cond_2

    const-string p0, "getPurchaseHistory is not supported on current device"

    .line 23
    invoke-static {v1, p0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lcom/android/billingclient/api/zzag;

    .line 24
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzj:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, p1, v3}, Lcom/android/billingclient/api/zzag;-><init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    goto/16 :goto_4

    :cond_2
    :try_start_0
    iget-object v5, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    const/4 v6, 0x6

    iget-object v4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 4
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    move-object v8, p1

    move-object v10, v2

    .line 5
    invoke-interface/range {v5 .. v10}, Lcom/google/android/gms/internal/play_billing/zzd;->zzh(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v4
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1

    const-string v5, "getPurchaseHistory()"

    .line 6
    invoke-static {v4, v1, v5}, Lcom/android/billingclient/api/zzam;->zza(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult;

    move-result-object v5

    .line 7
    sget-object v6, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    if-eq v5, v6, :cond_3

    new-instance p0, Lcom/android/billingclient/api/zzag;

    .line 27
    invoke-direct {p0, v5, v3}, Lcom/android/billingclient/api/zzag;-><init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    goto/16 :goto_4

    :cond_3
    const-string v5, "INAPP_PURCHASE_ITEM_LIST"

    .line 8
    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    const-string v6, "INAPP_PURCHASE_DATA_LIST"

    .line 9
    invoke-virtual {v4, v6}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    const-string v7, "INAPP_DATA_SIGNATURE_LIST"

    .line 10
    invoke-virtual {v4, v7}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    const/4 v8, 0x0

    .line 11
    :goto_1
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v8, v9, :cond_6

    .line 12
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 13
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 14
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 15
    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "Purchase record found for sku : "

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v13

    if-eqz v13, :cond_4

    invoke-virtual {v12, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    goto :goto_2

    .line 19
    :cond_4
    new-instance v11, Ljava/lang/String;

    .line 15
    invoke-direct {v11, v12}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_2
    invoke-static {v1, v11}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_1
    new-instance v11, Lcom/android/billingclient/api/PurchaseHistoryRecord;

    .line 16
    invoke-direct {v11, v9, v10}, Lcom/android/billingclient/api/PurchaseHistoryRecord;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 17
    invoke-virtual {v11}, Lcom/android/billingclient/api/PurchaseHistoryRecord;->getPurchaseToken()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_5

    const-string v9, "BUG: empty/null token!"

    .line 18
    invoke-static {v1, v9}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    :cond_5
    invoke-interface {v0, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :catch_0
    move-exception p0

    .line 28
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    new-instance v0, Ljava/lang/StringBuilder;

    add-int/lit8 p1, p1, 0x30

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p1, "Got an exception trying to decode the purchase: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lcom/android/billingclient/api/zzag;

    sget-object p1, Lcom/android/billingclient/api/zzak;->zzl:Lcom/android/billingclient/api/BillingResult;

    .line 29
    invoke-direct {p0, p1, v3}, Lcom/android/billingclient/api/zzag;-><init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    goto :goto_4

    :cond_6
    const-string v5, "INAPP_CONTINUATION_TOKEN"

    .line 20
    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 21
    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Continuation token: "

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_7

    invoke-virtual {v5, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_3

    .line 30
    :cond_7
    new-instance v4, Ljava/lang/String;

    .line 21
    invoke-direct {v4, v5}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_3
    invoke-static {v1, v4}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    new-instance p0, Lcom/android/billingclient/api/zzag;

    sget-object p1, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    .line 30
    invoke-direct {p0, p1, v0}, Lcom/android/billingclient/api/zzag;-><init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    goto :goto_4

    :catch_1
    move-exception p0

    .line 25
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    new-instance v0, Ljava/lang/StringBuilder;

    add-int/lit8 p1, p1, 0x40

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p1, "Got exception trying to get purchase history: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "; try to reconnect"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lcom/android/billingclient/api/zzag;

    .line 26
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, p1, v3}, Lcom/android/billingclient/api/zzag;-><init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    :goto_4
    return-object p0
.end method

.method static synthetic zzj(Lcom/android/billingclient/api/BillingClientImpl;)Lcom/android/billingclient/api/BillingResult;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClientImpl;->zzF()Lcom/android/billingclient/api/BillingResult;

    move-result-object p0

    return-object p0
.end method

.method static synthetic zzk(Lcom/android/billingclient/api/BillingClientImpl;Ljava/lang/String;)Lcom/android/billingclient/api/Purchase$PurchasesResult;
    .locals 14

    .line 1
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const-string v2, "Querying owned items, item type: "

    if-eqz v1, :cond_0

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 7
    :cond_0
    new-instance v0, Ljava/lang/String;

    .line 1
    invoke-direct {v0, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_0
    const-string v1, "BillingClient"

    invoke-static {v1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    .line 2
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-boolean v2, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzn:Z

    iget-boolean v3, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzt:Z

    iget-object v4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzb:Ljava/lang/String;

    .line 3
    invoke-static {v2, v3, v4}, Lcom/google/android/gms/internal/play_billing/zza;->zzf(ZZLjava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    const/4 v3, 0x0

    move-object v9, v3

    :cond_1
    :try_start_0
    iget-boolean v4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzn:Z

    if-eqz v4, :cond_2

    iget-object v5, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    const/16 v6, 0x9

    iget-object v4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 4
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    move-object v8, p1

    move-object v10, v2

    .line 5
    invoke-interface/range {v5 .. v10}, Lcom/google/android/gms/internal/play_billing/zzd;->zzj(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v4

    goto :goto_1

    .line 23
    :cond_2
    iget-object v4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    const/4 v5, 0x3

    iget-object v6, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 6
    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    .line 7
    invoke-interface {v4, v5, v6, p1, v9}, Lcom/google/android/gms/internal/play_billing/zzd;->zzi(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :goto_1
    const-string v5, "getPurchase()"

    .line 8
    invoke-static {v4, v1, v5}, Lcom/android/billingclient/api/zzam;->zza(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult;

    move-result-object v5

    .line 9
    sget-object v6, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    if-eq v5, v6, :cond_3

    new-instance p0, Lcom/android/billingclient/api/Purchase$PurchasesResult;

    .line 27
    invoke-direct {p0, v5, v3}, Lcom/android/billingclient/api/Purchase$PurchasesResult;-><init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    goto/16 :goto_5

    :cond_3
    const-string v5, "INAPP_PURCHASE_ITEM_LIST"

    .line 10
    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v5

    const-string v6, "INAPP_PURCHASE_DATA_LIST"

    .line 11
    invoke-virtual {v4, v6}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    const-string v7, "INAPP_DATA_SIGNATURE_LIST"

    .line 12
    invoke-virtual {v4, v7}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v7

    const/4 v8, 0x0

    .line 13
    :goto_2
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v8, v9, :cond_6

    .line 14
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 15
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 16
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 17
    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "Sku is owned: "

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v13

    if-eqz v13, :cond_4

    invoke-virtual {v12, v11}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    goto :goto_3

    .line 21
    :cond_4
    new-instance v11, Ljava/lang/String;

    .line 17
    invoke-direct {v11, v12}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_3
    invoke-static {v1, v11}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_1
    new-instance v11, Lcom/android/billingclient/api/Purchase;

    .line 18
    invoke-direct {v11, v9, v10}, Lcom/android/billingclient/api/Purchase;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 19
    invoke-virtual {v11}, Lcom/android/billingclient/api/Purchase;->getPurchaseToken()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_5

    const-string v9, "BUG: empty/null token!"

    .line 20
    invoke-static {v1, v9}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    :cond_5
    invoke-interface {v0, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    :catch_0
    move-exception p0

    .line 28
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    new-instance v0, Ljava/lang/StringBuilder;

    add-int/lit8 p1, p1, 0x30

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p1, "Got an exception trying to decode the purchase: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lcom/android/billingclient/api/Purchase$PurchasesResult;

    sget-object p1, Lcom/android/billingclient/api/zzak;->zzl:Lcom/android/billingclient/api/BillingResult;

    .line 29
    invoke-direct {p0, p1, v3}, Lcom/android/billingclient/api/Purchase$PurchasesResult;-><init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    goto :goto_5

    :cond_6
    const-string v5, "INAPP_CONTINUATION_TOKEN"

    .line 22
    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 23
    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Continuation token: "

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_7

    invoke-virtual {v5, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_4

    .line 30
    :cond_7
    new-instance v4, Ljava/lang/String;

    .line 23
    invoke-direct {v4, v5}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_4
    invoke-static {v1, v4}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    new-instance p0, Lcom/android/billingclient/api/Purchase$PurchasesResult;

    sget-object p1, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    .line 30
    invoke-direct {p0, p1, v0}, Lcom/android/billingclient/api/Purchase$PurchasesResult;-><init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    goto :goto_5

    :catch_1
    move-exception p0

    .line 25
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    new-instance v0, Ljava/lang/StringBuilder;

    add-int/lit8 p1, p1, 0x39

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p1, "Got exception trying to get purchases: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "; try to reconnect"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lcom/android/billingclient/api/Purchase$PurchasesResult;

    .line 26
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, p1, v3}, Lcom/android/billingclient/api/Purchase$PurchasesResult;-><init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    :goto_5
    return-object p0
.end method

.method static synthetic zzl(Lcom/android/billingclient/api/BillingClientImpl;)Lcom/google/android/gms/internal/play_billing/zzd;
    .locals 0

    iget-object p0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    return-object p0
.end method

.method static synthetic zzm(Lcom/android/billingclient/api/BillingClientImpl;Lcom/google/android/gms/internal/play_billing/zzd;)Lcom/google/android/gms/internal/play_billing/zzd;
    .locals 0

    iput-object p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    return-object p1
.end method

.method static synthetic zzr(Lcom/android/billingclient/api/BillingClientImpl;Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;
    .locals 6

    const-wide/16 v2, 0x7530

    move-object v0, p0

    move-object v1, p1

    move-object v4, p4

    move-object v5, p5

    .line 1
    invoke-direct/range {v0 .. v5}, Lcom/android/billingclient/api/BillingClientImpl;->zzH(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    move-result-object p0

    return-object p0
.end method

.method static synthetic zzt(Lcom/android/billingclient/api/BillingClientImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzi:Z

    return p1
.end method

.method static synthetic zzu(Lcom/android/billingclient/api/BillingClientImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzs:Z

    return p1
.end method

.method static synthetic zzv(Lcom/android/billingclient/api/BillingClientImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzr:Z

    return p1
.end method

.method static synthetic zzw(Lcom/android/billingclient/api/BillingClientImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzq:Z

    return p1
.end method

.method static synthetic zzx(Lcom/android/billingclient/api/BillingClientImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzp:Z

    return p1
.end method

.method static synthetic zzy(Lcom/android/billingclient/api/BillingClientImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzo:Z

    return p1
.end method

.method static synthetic zzz(Lcom/android/billingclient/api/BillingClientImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzn:Z

    return p1
.end method


# virtual methods
.method public final acknowledgePurchase(Lcom/android/billingclient/api/AcknowledgePurchaseParams;Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingClientImpl;->isReady()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {p2, p1}, Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;->onAcknowledgePurchaseResponse(Lcom/android/billingclient/api/BillingResult;)V

    return-void

    .line 3
    :cond_0
    invoke-virtual {p1}, Lcom/android/billingclient/api/AcknowledgePurchaseParams;->getPurchaseToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "BillingClient"

    const-string v0, "Please provide a valid purchase token."

    .line 4
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzk:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {p2, p1}, Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;->onAcknowledgePurchaseResponse(Lcom/android/billingclient/api/BillingResult;)V

    return-void

    :cond_1
    iget-boolean v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzn:Z

    if-nez v0, :cond_2

    .line 6
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzb:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {p2, p1}, Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;->onAcknowledgePurchaseResponse(Lcom/android/billingclient/api/BillingResult;)V

    return-void

    :cond_2
    new-instance v1, Lcom/android/billingclient/api/zzk;

    .line 7
    invoke-direct {v1, p0, p1, p2}, Lcom/android/billingclient/api/zzk;-><init>(Lcom/android/billingclient/api/BillingClientImpl;Lcom/android/billingclient/api/AcknowledgePurchaseParams;Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;)V

    new-instance v4, Lcom/android/billingclient/api/zzj;

    invoke-direct {v4, p2}, Lcom/android/billingclient/api/zzj;-><init>(Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;)V

    const-wide/16 v2, 0x7530

    .line 8
    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClientImpl;->zzD()Landroid/os/Handler;

    move-result-object v5

    move-object v0, p0

    .line 9
    invoke-direct/range {v0 .. v5}, Lcom/android/billingclient/api/BillingClientImpl;->zzH(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    move-result-object p1

    if-nez p1, :cond_3

    .line 10
    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClientImpl;->zzF()Lcom/android/billingclient/api/BillingResult;

    move-result-object p1

    invoke-interface {p2, p1}, Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;->onAcknowledgePurchaseResponse(Lcom/android/billingclient/api/BillingResult;)V

    :cond_3
    return-void
.end method

.method public final consumeAsync(Lcom/android/billingclient/api/ConsumeParams;Lcom/android/billingclient/api/ConsumeResponseListener;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingClientImpl;->isReady()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    .line 3
    invoke-virtual {p1}, Lcom/android/billingclient/api/ConsumeParams;->getPurchaseToken()Ljava/lang/String;

    move-result-object p1

    .line 2
    invoke-interface {p2, v0, p1}, Lcom/android/billingclient/api/ConsumeResponseListener;->onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v2, Lcom/android/billingclient/api/zzl;

    .line 4
    invoke-direct {v2, p0, p1, p2}, Lcom/android/billingclient/api/zzl;-><init>(Lcom/android/billingclient/api/BillingClientImpl;Lcom/android/billingclient/api/ConsumeParams;Lcom/android/billingclient/api/ConsumeResponseListener;)V

    new-instance v5, Lcom/android/billingclient/api/zzr;

    invoke-direct {v5, p2, p1}, Lcom/android/billingclient/api/zzr;-><init>(Lcom/android/billingclient/api/ConsumeResponseListener;Lcom/android/billingclient/api/ConsumeParams;)V

    const-wide/16 v3, 0x7530

    .line 5
    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClientImpl;->zzD()Landroid/os/Handler;

    move-result-object v6

    move-object v1, p0

    .line 6
    invoke-direct/range {v1 .. v6}, Lcom/android/billingclient/api/BillingClientImpl;->zzH(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    move-result-object v0

    if-nez v0, :cond_1

    .line 7
    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClientImpl;->zzF()Lcom/android/billingclient/api/BillingResult;

    move-result-object v0

    invoke-virtual {p1}, Lcom/android/billingclient/api/ConsumeParams;->getPurchaseToken()Ljava/lang/String;

    move-result-object p1

    .line 8
    invoke-interface {p2, v0, p1}, Lcom/android/billingclient/api/ConsumeResponseListener;->onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public final endConnection()V
    .locals 5

    const-string v0, "BillingClient"

    const/4 v1, 0x3

    const/4 v2, 0x0

    :try_start_0
    iput-object v2, p0, Lcom/android/billingclient/api/BillingClientImpl;->zze:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzd:Lcom/android/billingclient/api/zzh;

    .line 1
    invoke-virtual {v3}, Lcom/android/billingclient/api/zzh;->zzc()V

    iget-object v3, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzh:Lcom/android/billingclient/api/zzaf;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzh:Lcom/android/billingclient/api/zzaf;

    .line 2
    invoke-virtual {v3}, Lcom/android/billingclient/api/zzaf;->zzc()V

    :cond_0
    iget-object v3, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzh:Lcom/android/billingclient/api/zzaf;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    if-eqz v3, :cond_1

    const-string v3, "Unbinding from service."

    .line 3
    invoke-static {v0, v3}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzh:Lcom/android/billingclient/api/zzaf;

    .line 4
    invoke-virtual {v3, v4}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    iput-object v2, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzh:Lcom/android/billingclient/api/zzaf;

    :cond_1
    iput-object v2, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    iget-object v3, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzu:Ljava/util/concurrent/ExecutorService;

    if-eqz v3, :cond_2

    .line 5
    invoke-interface {v3}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    iput-object v2, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzu:Ljava/util/concurrent/ExecutorService;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    iput v1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception v2

    .line 6
    :try_start_1
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, 0x30

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v3, "There was an exception while ending connection: "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 7
    iput v1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    return-void

    .line 6
    :goto_0
    iput v1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    .line 7
    throw v0
.end method

.method public final getConnectionState()I
    .locals 1

    iget v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    return v0
.end method

.method public final isFeatureSupported(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingClientImpl;->isReady()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    return-object p1

    .line 3
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string/jumbo v0, "subscriptions"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    goto :goto_1

    :sswitch_1
    const-string/jumbo v0, "subscriptionsOnVr"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x3

    goto :goto_1

    :sswitch_2
    const-string v0, "inAppItemsOnVr"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    goto :goto_1

    :sswitch_3
    const-string v0, "priceChangeConfirmation"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x4

    goto :goto_1

    :sswitch_4
    const-string v0, "eee"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x9

    goto :goto_1

    :sswitch_5
    const-string v0, "ddd"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x7

    goto :goto_1

    :sswitch_6
    const-string v0, "ccc"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/16 v0, 0x8

    goto :goto_1

    :sswitch_7
    const-string v0, "bbb"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x5

    goto :goto_1

    :sswitch_8
    const-string v0, "aaa"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x6

    goto :goto_1

    :sswitch_9
    const-string/jumbo v0, "subscriptionsUpdate"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, -0x1

    :goto_1
    packed-switch v0, :pswitch_data_0

    .line 14
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Unsupported feature: "

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_9

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_9

    :pswitch_0
    iget-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzs:Z

    if-eqz p1, :cond_2

    .line 4
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    goto :goto_2

    :cond_2
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzi:Lcom/android/billingclient/api/BillingResult;

    :goto_2
    return-object p1

    :pswitch_1
    iget-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzq:Z

    if-eqz p1, :cond_3

    .line 5
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    goto :goto_3

    :cond_3
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzi:Lcom/android/billingclient/api/BillingResult;

    :goto_3
    return-object p1

    :pswitch_2
    iget-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzr:Z

    if-eqz p1, :cond_4

    .line 6
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    goto :goto_4

    :cond_4
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzi:Lcom/android/billingclient/api/BillingResult;

    :goto_4
    return-object p1

    :pswitch_3
    iget-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzp:Z

    if-eqz p1, :cond_5

    .line 7
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    goto :goto_5

    :cond_5
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzi:Lcom/android/billingclient/api/BillingResult;

    :goto_5
    return-object p1

    :pswitch_4
    iget-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzm:Z

    if-eqz p1, :cond_6

    .line 8
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    goto :goto_6

    :cond_6
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzi:Lcom/android/billingclient/api/BillingResult;

    :goto_6
    return-object p1

    :pswitch_5
    const-string/jumbo p1, "subs"

    .line 9
    invoke-direct {p0, p1}, Lcom/android/billingclient/api/BillingClientImpl;->zzG(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult;

    move-result-object p1

    return-object p1

    :pswitch_6
    const-string p1, "inapp"

    .line 10
    invoke-direct {p0, p1}, Lcom/android/billingclient/api/BillingClientImpl;->zzG(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult;

    move-result-object p1

    return-object p1

    :pswitch_7
    iget-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzj:Z

    if-eqz p1, :cond_7

    .line 11
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    goto :goto_7

    .line 12
    :cond_7
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzi:Lcom/android/billingclient/api/BillingResult;

    :goto_7
    return-object p1

    :pswitch_8
    iget-boolean p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzi:Z

    if-eqz p1, :cond_8

    .line 13
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    goto :goto_8

    :cond_8
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzi:Lcom/android/billingclient/api/BillingResult;

    :goto_8
    return-object p1

    .line 15
    :cond_9
    new-instance p1, Ljava/lang/String;

    .line 14
    invoke-direct {p1, v0}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    :goto_9
    const-string v0, "BillingClient"

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzv:Lcom/android/billingclient/api/BillingResult;

    return-object p1

    :sswitch_data_0
    .sparse-switch
        -0x1928a0a1 -> :sswitch_9
        0x17841 -> :sswitch_8
        0x17c22 -> :sswitch_7
        0x18003 -> :sswitch_6
        0x183e4 -> :sswitch_5
        0x187c5 -> :sswitch_4
        0xc5ff92e -> :sswitch_3
        0x116ae57f -> :sswitch_2
        0x48aff111 -> :sswitch_1
        0x7674caf6 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final isReady()Z
    .locals 2

    iget v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzh:Lcom/android/billingclient/api/zzaf;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final launchBillingFlow(Landroid/app/Activity;Lcom/android/billingclient/api/BillingFlowParams;)Lcom/android/billingclient/api/BillingResult;
    .locals 28

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    const-string v0, "proxyPackageVersion"

    const-string v9, "BUY_INTENT"

    const-string v10, "; try to reconnect"

    .line 1
    invoke-virtual/range {p0 .. p0}, Lcom/android/billingclient/api/BillingClientImpl;->isReady()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {v7, v0}, Lcom/android/billingclient/api/BillingClientImpl;->zzE(Lcom/android/billingclient/api/BillingResult;)Lcom/android/billingclient/api/BillingResult;

    return-object v0

    .line 3
    :cond_0
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/BillingFlowParams;->zzj()Ljava/util/ArrayList;

    move-result-object v1

    const/4 v2, 0x0

    .line 4
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/billingclient/api/SkuDetails;

    .line 5
    invoke-virtual {v3}, Lcom/android/billingclient/api/SkuDetails;->getType()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "subs"

    .line 6
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-string v11, "BillingClient"

    if-eqz v5, :cond_2

    iget-boolean v5, v7, Lcom/android/billingclient/api/BillingClientImpl;->zzi:Z

    if-eqz v5, :cond_1

    goto :goto_0

    :cond_1
    const-string v0, "Current client doesn\'t support subscriptions."

    .line 91
    invoke-static {v11, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzs:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {v7, v0}, Lcom/android/billingclient/api/BillingClientImpl;->zzE(Lcom/android/billingclient/api/BillingResult;)Lcom/android/billingclient/api/BillingResult;

    return-object v0

    .line 7
    :cond_2
    :goto_0
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/BillingFlowParams;->zzm()Z

    move-result v5

    if-eqz v5, :cond_4

    iget-boolean v5, v7, Lcom/android/billingclient/api/BillingClientImpl;->zzl:Z

    if-eqz v5, :cond_3

    goto :goto_1

    :cond_3
    const-string v0, "Current client doesn\'t support extra params for buy intent."

    .line 89
    invoke-static {v11, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzh:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {v7, v0}, Lcom/android/billingclient/api/BillingClientImpl;->zzE(Lcom/android/billingclient/api/BillingResult;)Lcom/android/billingclient/api/BillingResult;

    return-object v0

    .line 8
    :cond_4
    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_6

    iget-boolean v5, v7, Lcom/android/billingclient/api/BillingClientImpl;->zzs:Z

    if-eqz v5, :cond_5

    goto :goto_2

    :cond_5
    const-string v0, "Current client doesn\'t support multi-item purchases."

    .line 87
    invoke-static {v11, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzu:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {v7, v0}, Lcom/android/billingclient/api/BillingClientImpl;->zzE(Lcom/android/billingclient/api/BillingResult;)Lcom/android/billingclient/api/BillingResult;

    return-object v0

    :cond_6
    :goto_2
    const-string v5, ""

    move-object v13, v5

    const/4 v12, 0x0

    .line 9
    :goto_3
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-ge v12, v14, :cond_8

    .line 10
    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v16

    new-instance v2, Ljava/lang/StringBuilder;

    add-int v15, v15, v16

    invoke-direct {v2, v15}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 11
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    if-ge v12, v13, :cond_7

    .line 12
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v13, ", "

    invoke-virtual {v2, v13}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_7
    move-object v13, v2

    add-int/lit8 v12, v12, 0x1

    const/4 v2, 0x0

    goto :goto_3

    .line 13
    :cond_8
    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    new-instance v14, Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x29

    add-int/2addr v2, v12

    invoke-direct {v14, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "Constructing buy intent for "

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", item type: "

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v11, v2}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v2, v7, Lcom/android/billingclient/api/BillingClientImpl;->zzl:Z

    if-eqz v2, :cond_1a

    iget-boolean v2, v7, Lcom/android/billingclient/api/BillingClientImpl;->zzn:Z

    iget-boolean v12, v7, Lcom/android/billingclient/api/BillingClientImpl;->zzt:Z

    iget-object v14, v7, Lcom/android/billingclient/api/BillingClientImpl;->zzb:Ljava/lang/String;

    move-object/from16 v15, p2

    .line 14
    invoke-static {v15, v2, v12, v14}, Lcom/google/android/gms/internal/play_billing/zza;->zze(Lcom/android/billingclient/api/BillingFlowParams;ZZLjava/lang/String;)Landroid/os/Bundle;

    move-result-object v12

    new-instance v2, Ljava/util/ArrayList;

    .line 15
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v14, Ljava/util/ArrayList;

    .line 16
    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    new-instance v6, Ljava/util/ArrayList;

    .line 17
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v17, v5

    new-instance v5, Ljava/util/ArrayList;

    .line 18
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v15, Ljava/util/ArrayList;

    .line 19
    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v18, v10

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v10

    move-object/from16 v19, v13

    const/4 v13, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    :goto_4
    if-ge v13, v10, :cond_b

    invoke-interface {v1, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v24

    .line 20
    check-cast v24, Lcom/android/billingclient/api/SkuDetails;

    .line 21
    invoke-virtual/range {v24 .. v24}, Lcom/android/billingclient/api/SkuDetails;->zze()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->isEmpty()Z

    move-result v25

    if-nez v25, :cond_9

    move/from16 v25, v10

    .line 22
    invoke-virtual/range {v24 .. v24}, Lcom/android/billingclient/api/SkuDetails;->zze()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_9
    move/from16 v25, v10

    .line 23
    :goto_5
    invoke-virtual/range {v24 .. v24}, Lcom/android/billingclient/api/SkuDetails;->getOriginalJson()Ljava/lang/String;

    move-result-object v10

    move-object/from16 v26, v9

    .line 24
    :try_start_0
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v10, "offer_id_token"

    .line 25
    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_6

    :catch_0
    move-object/from16 v9, v17

    .line 26
    :goto_6
    invoke-virtual/range {v24 .. v24}, Lcom/android/billingclient/api/SkuDetails;->zzb()Ljava/lang/String;

    move-result-object v10

    .line 27
    invoke-virtual/range {v24 .. v24}, Lcom/android/billingclient/api/SkuDetails;->zza()I

    move-result v27

    .line 28
    invoke-virtual/range {v24 .. v24}, Lcom/android/billingclient/api/SkuDetails;->zzd()Ljava/lang/String;

    move-result-object v8

    .line 29
    invoke-virtual {v14, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    const/16 v16, 0x1

    xor-int/lit8 v9, v9, 0x1

    or-int v20, v20, v9

    .line 31
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 32
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    xor-int/lit8 v9, v9, 0x1

    or-int v21, v21, v9

    .line 33
    invoke-static/range {v27 .. v27}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eqz v27, :cond_a

    const/4 v9, 0x1

    goto :goto_7

    :cond_a
    const/4 v9, 0x0

    :goto_7
    or-int v22, v22, v9

    .line 34
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    xor-int/lit8 v9, v9, 0x1

    or-int v23, v23, v9

    .line 35
    invoke-virtual {v15, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v8, p1

    move/from16 v10, v25

    move-object/from16 v9, v26

    goto :goto_4

    :cond_b
    move-object/from16 v26, v9

    .line 36
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_c

    const-string v8, "skuDetailsTokens"

    .line 37
    invoke-virtual {v12, v8, v2}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_c
    if-eqz v20, :cond_e

    iget-boolean v2, v7, Lcom/android/billingclient/api/BillingClientImpl;->zzq:Z

    if-nez v2, :cond_d

    .line 38
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzi:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {v7, v0}, Lcom/android/billingclient/api/BillingClientImpl;->zzE(Lcom/android/billingclient/api/BillingResult;)Lcom/android/billingclient/api/BillingResult;

    return-object v0

    :cond_d
    const-string v2, "SKU_OFFER_ID_TOKEN_LIST"

    .line 39
    invoke-virtual {v12, v2, v14}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_e
    if-eqz v21, :cond_f

    const-string v2, "SKU_OFFER_ID_LIST"

    .line 40
    invoke-virtual {v12, v2, v6}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_f
    if-eqz v22, :cond_10

    const-string v2, "SKU_OFFER_TYPE_LIST"

    .line 41
    invoke-virtual {v12, v2, v5}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_10
    if-eqz v23, :cond_11

    const-string v2, "SKU_SERIALIZED_DOCID_LIST"

    .line 42
    invoke-virtual {v12, v2, v15}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 43
    :cond_11
    invoke-virtual {v3}, Lcom/android/billingclient/api/SkuDetails;->zzc()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_12

    .line 44
    invoke-virtual {v3}, Lcom/android/billingclient/api/SkuDetails;->zzc()Ljava/lang/String;

    move-result-object v2

    const-string v5, "skuPackageName"

    .line 45
    invoke-virtual {v12, v5, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x1

    goto :goto_8

    :cond_12
    const/4 v2, 0x0

    :goto_8
    const/4 v5, 0x0

    .line 46
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_13

    const-string v6, "accountName"

    .line 47
    invoke-virtual {v12, v6, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    :cond_13
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x1

    if-le v5, v6, :cond_15

    new-instance v5, Ljava/util/ArrayList;

    .line 49
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-direct {v5, v8}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v8, Ljava/util/ArrayList;

    .line 50
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 51
    :goto_9
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v6, v9, :cond_14

    .line 52
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/billingclient/api/SkuDetails;

    invoke-virtual {v9}, Lcom/android/billingclient/api/SkuDetails;->getSku()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/billingclient/api/SkuDetails;

    invoke-virtual {v9}, Lcom/android/billingclient/api/SkuDetails;->getType()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_9

    :cond_14
    const-string v1, "additionalSkus"

    .line 54
    invoke-virtual {v12, v1, v5}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string v1, "additionalSkuTypes"

    .line 55
    invoke-virtual {v12, v1, v8}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 56
    :cond_15
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v5, "PROXY_PACKAGE"

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_16

    .line 57
    invoke-virtual/range {p1 .. p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v5, "proxyPackage"

    .line 58
    invoke-virtual {v12, v5, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_1
    iget-object v5, v7, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 59
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    const/4 v6, 0x0

    .line 60
    invoke-virtual {v5, v1, v6}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 61
    invoke-virtual {v12, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_a

    :catch_1
    const-string v1, "package not found"

    .line 62
    invoke-virtual {v12, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    :cond_16
    :goto_a
    iget-boolean v0, v7, Lcom/android/billingclient/api/BillingClientImpl;->zzr:Z

    if-eqz v0, :cond_17

    if-eqz v2, :cond_17

    const/16 v0, 0xf

    const/16 v2, 0xf

    goto :goto_b

    .line 86
    :cond_17
    iget-boolean v0, v7, Lcom/android/billingclient/api/BillingClientImpl;->zzn:Z

    if-eqz v0, :cond_18

    const/16 v0, 0x9

    const/16 v2, 0x9

    goto :goto_b

    .line 63
    :cond_18
    invoke-virtual/range {p2 .. p2}, Lcom/android/billingclient/api/BillingFlowParams;->getVrPurchaseFlow()Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 v0, 0x7

    const/4 v2, 0x7

    goto :goto_b

    :cond_19
    const/4 v0, 0x6

    const/4 v2, 0x6

    .line 61
    :goto_b
    new-instance v8, Lcom/android/billingclient/api/zzx;

    move-object v0, v8

    move-object/from16 v1, p0

    move-object/from16 v5, p2

    move-object v6, v12

    .line 64
    invoke-direct/range {v0 .. v6}, Lcom/android/billingclient/api/zzx;-><init>(Lcom/android/billingclient/api/BillingClientImpl;ILcom/android/billingclient/api/SkuDetails;Ljava/lang/String;Lcom/android/billingclient/api/BillingFlowParams;Landroid/os/Bundle;)V

    const-wide/16 v2, 0x1388

    const/4 v4, 0x0

    iget-object v5, v7, Lcom/android/billingclient/api/BillingClientImpl;->zzc:Landroid/os/Handler;

    move-object/from16 v0, p0

    move-object v1, v8

    .line 65
    invoke-direct/range {v0 .. v5}, Lcom/android/billingclient/api/BillingClientImpl;->zzH(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    move-result-object v0

    goto :goto_c

    :cond_1a
    move-object/from16 v26, v9

    move-object/from16 v18, v10

    move-object/from16 v19, v13

    .line 63
    new-instance v1, Lcom/android/billingclient/api/zzm;

    .line 66
    invoke-direct {v1, v7, v3, v4}, Lcom/android/billingclient/api/zzm;-><init>(Lcom/android/billingclient/api/BillingClientImpl;Lcom/android/billingclient/api/SkuDetails;Ljava/lang/String;)V

    const-wide/16 v2, 0x1388

    const/4 v4, 0x0

    iget-object v5, v7, Lcom/android/billingclient/api/BillingClientImpl;->zzc:Landroid/os/Handler;

    move-object/from16 v0, p0

    .line 67
    invoke-direct/range {v0 .. v5}, Lcom/android/billingclient/api/BillingClientImpl;->zzH(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    move-result-object v0

    :goto_c
    const-wide/16 v1, 0x1388

    .line 65
    :try_start_2
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 68
    invoke-interface {v0, v1, v2, v3}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Bundle;

    .line 69
    invoke-static {v0, v11}, Lcom/google/android/gms/internal/play_billing/zza;->zza(Landroid/os/Bundle;Ljava/lang/String;)I

    move-result v1

    .line 70
    invoke-static {v0, v11}, Lcom/google/android/gms/internal/play_billing/zza;->zzh(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v1, :cond_1b

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v3, 0x34

    .line 71
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v3, "Unable to buy item, Error response code: "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v11, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()Lcom/android/billingclient/api/BillingResult$Builder;

    move-result-object v0

    .line 72
    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/BillingResult$Builder;->setResponseCode(I)Lcom/android/billingclient/api/BillingResult$Builder;

    .line 73
    invoke-virtual {v0, v2}, Lcom/android/billingclient/api/BillingResult$Builder;->setDebugMessage(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult$Builder;

    .line 74
    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingResult$Builder;->build()Lcom/android/billingclient/api/BillingResult;

    move-result-object v0

    .line 75
    invoke-direct {v7, v0}, Lcom/android/billingclient/api/BillingClientImpl;->zzE(Lcom/android/billingclient/api/BillingResult;)Lcom/android/billingclient/api/BillingResult;

    return-object v0

    :cond_1b
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/android/billingclient/api/ProxyBillingActivity;

    move-object/from16 v3, p1

    .line 76
    invoke-direct {v1, v3, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    move-object/from16 v2, v26

    .line 77
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    .line 78
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 79
    invoke-virtual {v3, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 86
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    return-object v0

    .line 80
    :catch_2
    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x45

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v0, "Exception while launching billing flow: ; for sku: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v13, v19

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v0, v18

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 81
    invoke-static {v11, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {v7, v0}, Lcom/android/billingclient/api/BillingClientImpl;->zzE(Lcom/android/billingclient/api/BillingResult;)Lcom/android/billingclient/api/BillingResult;

    return-object v0

    :catch_3
    move-object/from16 v0, v18

    move-object/from16 v13, v19

    .line 83
    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x44

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v1, "Time out while launching billing flow: ; for sku: "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 84
    invoke-static {v11, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzr:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {v7, v0}, Lcom/android/billingclient/api/BillingClientImpl;->zzE(Lcom/android/billingclient/api/BillingResult;)Lcom/android/billingclient/api/BillingResult;

    return-object v0
.end method

.method public final launchPriceChangeConfirmationFlow(Landroid/app/Activity;Lcom/android/billingclient/api/PriceChangeFlowParams;Lcom/android/billingclient/api/PriceChangeConfirmationListener;)V
    .locals 12

    const-string v0, "SUBS_MANAGEMENT_INTENT"

    const-string v1, "; try to reconnect"

    .line 2
    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingClientImpl;->isReady()Z

    move-result v2

    if-nez v2, :cond_0

    .line 3
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, p1, p3}, Lcom/android/billingclient/api/BillingClientImpl;->zzI(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/PriceChangeConfirmationListener;)V

    return-void

    :cond_0
    const-string v2, "Please fix the input params. priceChangeFlowParams must contain valid sku."

    const-string v3, "BillingClient"

    if-eqz p2, :cond_5

    .line 4
    invoke-virtual {p2}, Lcom/android/billingclient/api/PriceChangeFlowParams;->getSkuDetails()Lcom/android/billingclient/api/SkuDetails;

    move-result-object v4

    if-nez v4, :cond_1

    goto/16 :goto_0

    .line 7
    :cond_1
    invoke-virtual {p2}, Lcom/android/billingclient/api/PriceChangeFlowParams;->getSkuDetails()Lcom/android/billingclient/api/SkuDetails;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/billingclient/api/SkuDetails;->getSku()Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_2

    .line 8
    invoke-static {v3, v2}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzn:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, p1, p3}, Lcom/android/billingclient/api/BillingClientImpl;->zzI(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/PriceChangeConfirmationListener;)V

    return-void

    :cond_2
    iget-boolean v2, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzm:Z

    if-nez v2, :cond_3

    const-string p1, "Current client doesn\'t support price change confirmation flow."

    .line 10
    invoke-static {v3, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzi:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, p1, p3}, Lcom/android/billingclient/api/BillingClientImpl;->zzI(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/PriceChangeConfirmationListener;)V

    return-void

    :cond_3
    new-instance v2, Landroid/os/Bundle;

    .line 12
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    iget-object v4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzb:Ljava/lang/String;

    const-string v5, "playBillingLibraryVersion"

    .line 13
    invoke-virtual {v2, v5, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v4, 0x1

    const-string/jumbo v5, "subs_price_change"

    .line 14
    invoke-virtual {v2, v5, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    new-instance v7, Lcom/android/billingclient/api/zzo;

    .line 15
    invoke-direct {v7, p0, p2, v2}, Lcom/android/billingclient/api/zzo;-><init>(Lcom/android/billingclient/api/BillingClientImpl;Ljava/lang/String;Landroid/os/Bundle;)V

    const-wide/16 v8, 0x1388

    const/4 v10, 0x0

    iget-object v11, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzc:Landroid/os/Handler;

    move-object v6, p0

    .line 16
    invoke-direct/range {v6 .. v11}, Lcom/android/billingclient/api/BillingClientImpl;->zzH(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    move-result-object v2

    const-wide/16 v4, 0x1388

    :try_start_0
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 17
    invoke-interface {v2, v4, v5, v6}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    .line 18
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/play_billing/zza;->zza(Landroid/os/Bundle;Ljava/lang/String;)I

    move-result v4

    .line 19
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/play_billing/zza;->zzh(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()Lcom/android/billingclient/api/BillingResult$Builder;

    move-result-object v6

    .line 20
    invoke-virtual {v6, v4}, Lcom/android/billingclient/api/BillingResult$Builder;->setResponseCode(I)Lcom/android/billingclient/api/BillingResult$Builder;

    .line 21
    invoke-virtual {v6, v5}, Lcom/android/billingclient/api/BillingResult$Builder;->setDebugMessage(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult$Builder;

    .line 22
    invoke-virtual {v6}, Lcom/android/billingclient/api/BillingResult$Builder;->build()Lcom/android/billingclient/api/BillingResult;

    move-result-object v5

    if-eqz v4, :cond_4

    new-instance p1, Ljava/lang/StringBuilder;

    const/16 v0, 0x44

    .line 23
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v0, "Unable to launch price change flow, error response code: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    invoke-direct {p0, v5, p3}, Lcom/android/billingclient/api/BillingClientImpl;->zzI(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/PriceChangeConfirmationListener;)V

    return-void

    .line 25
    :cond_4
    new-instance v4, Lcom/android/billingclient/api/zzy;

    iget-object v5, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzc:Landroid/os/Handler;

    invoke-direct {v4, p0, v5, p3}, Lcom/android/billingclient/api/zzy;-><init>(Lcom/android/billingclient/api/BillingClientImpl;Landroid/os/Handler;Lcom/android/billingclient/api/PriceChangeConfirmationListener;)V

    new-instance v5, Landroid/content/Intent;

    const-class v6, Lcom/android/billingclient/api/ProxyBillingActivity;

    .line 26
    invoke-direct {v5, p1, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 27
    invoke-virtual {v2, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/app/PendingIntent;

    .line 28
    invoke-virtual {v5, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v0, "result_receiver"

    .line 29
    invoke-virtual {v5, v0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 30
    invoke-virtual {p1, v5}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 31
    :catch_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    new-instance v0, Ljava/lang/StringBuilder;

    add-int/lit8 p1, p1, 0x4e

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p1, "Exception caught while launching Price Change Flow for sku: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 32
    invoke-static {v3, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, p1, p3}, Lcom/android/billingclient/api/BillingClientImpl;->zzI(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/PriceChangeConfirmationListener;)V

    return-void

    .line 34
    :catch_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p1

    new-instance v0, Ljava/lang/StringBuilder;

    add-int/lit8 p1, p1, 0x46

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string p1, "Time out while launching Price Change Flow for sku: "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 35
    invoke-static {v3, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzr:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, p1, p3}, Lcom/android/billingclient/api/BillingClientImpl;->zzI(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/PriceChangeConfirmationListener;)V

    return-void

    .line 5
    :cond_5
    :goto_0
    invoke-static {v3, v2}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzn:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, p1, p3}, Lcom/android/billingclient/api/BillingClientImpl;->zzI(Lcom/android/billingclient/api/BillingResult;Lcom/android/billingclient/api/PriceChangeConfirmationListener;)V

    return-void
.end method

.method public final queryPurchaseHistoryAsync(Ljava/lang/String;Lcom/android/billingclient/api/PurchaseHistoryResponseListener;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingClientImpl;->isReady()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {p2, p1, v1}, Lcom/android/billingclient/api/PurchaseHistoryResponseListener;->onPurchaseHistoryResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-void

    :cond_0
    new-instance v3, Lcom/android/billingclient/api/zzab;

    .line 3
    invoke-direct {v3, p0, p1, p2}, Lcom/android/billingclient/api/zzab;-><init>(Lcom/android/billingclient/api/BillingClientImpl;Ljava/lang/String;Lcom/android/billingclient/api/PurchaseHistoryResponseListener;)V

    new-instance v6, Lcom/android/billingclient/api/zzt;

    invoke-direct {v6, p2}, Lcom/android/billingclient/api/zzt;-><init>(Lcom/android/billingclient/api/PurchaseHistoryResponseListener;)V

    const-wide/16 v4, 0x7530

    .line 4
    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClientImpl;->zzD()Landroid/os/Handler;

    move-result-object v7

    move-object v2, p0

    .line 5
    invoke-direct/range {v2 .. v7}, Lcom/android/billingclient/api/BillingClientImpl;->zzH(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    move-result-object p1

    if-nez p1, :cond_1

    .line 6
    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClientImpl;->zzF()Lcom/android/billingclient/api/BillingResult;

    move-result-object p1

    .line 7
    invoke-interface {p2, p1, v1}, Lcom/android/billingclient/api/PurchaseHistoryResponseListener;->onPurchaseHistoryResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    :cond_1
    return-void
.end method

.method public final queryPurchases(Ljava/lang/String;)Lcom/android/billingclient/api/Purchase$PurchasesResult;
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingClientImpl;->isReady()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    new-instance p1, Lcom/android/billingclient/api/Purchase$PurchasesResult;

    .line 2
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p1, v0, v1}, Lcom/android/billingclient/api/Purchase$PurchasesResult;-><init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-object p1

    .line 3
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "BillingClient"

    const-string v0, "Please provide a valid SKU type."

    .line 4
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/android/billingclient/api/Purchase$PurchasesResult;

    .line 5
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzg:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p1, v0, v1}, Lcom/android/billingclient/api/Purchase$PurchasesResult;-><init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-object p1

    :cond_1
    new-instance v3, Lcom/android/billingclient/api/zzz;

    .line 6
    invoke-direct {v3, p0, p1}, Lcom/android/billingclient/api/zzz;-><init>(Lcom/android/billingclient/api/BillingClientImpl;Ljava/lang/String;)V

    const-wide/16 v4, 0x1388

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzc:Landroid/os/Handler;

    move-object v2, p0

    .line 7
    invoke-direct/range {v2 .. v7}, Lcom/android/billingclient/api/BillingClientImpl;->zzH(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    move-result-object p1

    const-wide/16 v2, 0x1388

    :try_start_0
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 8
    invoke-interface {p1, v2, v3, v0}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/billingclient/api/Purchase$PurchasesResult;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 10
    :catch_0
    new-instance p1, Lcom/android/billingclient/api/Purchase$PurchasesResult;

    .line 9
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzl:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p1, v0, v1}, Lcom/android/billingclient/api/Purchase$PurchasesResult;-><init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-object p1

    .line 8
    :catch_1
    new-instance p1, Lcom/android/billingclient/api/Purchase$PurchasesResult;

    .line 10
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzr:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p1, v0, v1}, Lcom/android/billingclient/api/Purchase$PurchasesResult;-><init>(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-object p1
.end method

.method public queryPurchasesAsync(Ljava/lang/String;Lcom/android/billingclient/api/PurchasesResponseListener;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingClientImpl;->isReady()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzp;->zzg()Lcom/google/android/gms/internal/play_billing/zzp;

    move-result-object v0

    .line 2
    invoke-interface {p2, p1, v0}, Lcom/android/billingclient/api/PurchasesResponseListener;->onQueryPurchasesResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-void

    .line 4
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "BillingClient"

    const-string v0, "Please provide a valid SKU type."

    .line 5
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzg:Lcom/android/billingclient/api/BillingResult;

    .line 7
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzp;->zzg()Lcom/google/android/gms/internal/play_billing/zzp;

    move-result-object v0

    .line 6
    invoke-interface {p2, p1, v0}, Lcom/android/billingclient/api/PurchasesResponseListener;->onQueryPurchasesResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-void

    :cond_1
    new-instance v2, Lcom/android/billingclient/api/zzaa;

    .line 8
    invoke-direct {v2, p0, p1, p2}, Lcom/android/billingclient/api/zzaa;-><init>(Lcom/android/billingclient/api/BillingClientImpl;Ljava/lang/String;Lcom/android/billingclient/api/PurchasesResponseListener;)V

    new-instance v5, Lcom/android/billingclient/api/zzu;

    invoke-direct {v5, p2}, Lcom/android/billingclient/api/zzu;-><init>(Lcom/android/billingclient/api/PurchasesResponseListener;)V

    const-wide/16 v3, 0x7530

    .line 9
    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClientImpl;->zzD()Landroid/os/Handler;

    move-result-object v6

    move-object v1, p0

    .line 10
    invoke-direct/range {v1 .. v6}, Lcom/android/billingclient/api/BillingClientImpl;->zzH(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    move-result-object p1

    if-nez p1, :cond_2

    .line 11
    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClientImpl;->zzF()Lcom/android/billingclient/api/BillingResult;

    move-result-object p1

    invoke-static {}, Lcom/google/android/gms/internal/play_billing/zzp;->zzg()Lcom/google/android/gms/internal/play_billing/zzp;

    move-result-object v0

    .line 12
    invoke-interface {p2, p1, v0}, Lcom/android/billingclient/api/PurchasesResponseListener;->onQueryPurchasesResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    :cond_2
    return-void
.end method

.method public final querySkuDetailsAsync(Lcom/android/billingclient/api/SkuDetailsParams;Lcom/android/billingclient/api/SkuDetailsResponseListener;)V
    .locals 12

    .line 1
    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingClientImpl;->isReady()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 2
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {p2, p1, v1}, Lcom/android/billingclient/api/SkuDetailsResponseListener;->onSkuDetailsResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-void

    .line 3
    :cond_0
    invoke-virtual {p1}, Lcom/android/billingclient/api/SkuDetailsParams;->getSkuType()Ljava/lang/String;

    move-result-object v4

    .line 4
    invoke-virtual {p1}, Lcom/android/billingclient/api/SkuDetailsParams;->getSkusList()Ljava/util/List;

    move-result-object p1

    .line 5
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v2, "BillingClient"

    if-eqz v0, :cond_1

    const-string p1, "Please fix the input params. SKU type can\'t be empty."

    .line 6
    invoke-static {v2, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzg:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {p2, p1, v1}, Lcom/android/billingclient/api/SkuDetailsResponseListener;->onSkuDetailsResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-void

    :cond_1
    if-eqz p1, :cond_4

    new-instance v5, Ljava/util/ArrayList;

    .line 8
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 9
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v2, Lcom/android/billingclient/api/zzap;

    invoke-direct {v2, v1}, Lcom/android/billingclient/api/zzap;-><init>(Lcom/android/billingclient/api/zzao;)V

    .line 10
    invoke-virtual {v2, v0}, Lcom/android/billingclient/api/zzap;->zza(Ljava/lang/String;)Lcom/android/billingclient/api/zzap;

    invoke-virtual {v2}, Lcom/android/billingclient/api/zzap;->zzb()Lcom/android/billingclient/api/zzaq;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    new-instance p1, Lcom/android/billingclient/api/zzp;

    const/4 v6, 0x0

    move-object v2, p1

    move-object v3, p0

    move-object v7, p2

    .line 11
    invoke-direct/range {v2 .. v7}, Lcom/android/billingclient/api/zzp;-><init>(Lcom/android/billingclient/api/BillingClientImpl;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/android/billingclient/api/SkuDetailsResponseListener;)V

    new-instance v10, Lcom/android/billingclient/api/zzv;

    invoke-direct {v10, p2}, Lcom/android/billingclient/api/zzv;-><init>(Lcom/android/billingclient/api/SkuDetailsResponseListener;)V

    const-wide/16 v8, 0x7530

    .line 12
    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClientImpl;->zzD()Landroid/os/Handler;

    move-result-object v11

    move-object v6, p0

    move-object v7, p1

    .line 13
    invoke-direct/range {v6 .. v11}, Lcom/android/billingclient/api/BillingClientImpl;->zzH(Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    move-result-object p1

    if-nez p1, :cond_3

    .line 14
    invoke-direct {p0}, Lcom/android/billingclient/api/BillingClientImpl;->zzF()Lcom/android/billingclient/api/BillingResult;

    move-result-object p1

    .line 15
    invoke-interface {p2, p1, v1}, Lcom/android/billingclient/api/SkuDetailsResponseListener;->onSkuDetailsResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    :cond_3
    return-void

    :cond_4
    const-string p1, "Please fix the input params. The list of SKUs can\'t be empty - set SKU list or SkuWithOffer list."

    .line 16
    invoke-static {v2, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzf:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {p2, p1, v1}, Lcom/android/billingclient/api/SkuDetailsResponseListener;->onSkuDetailsResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-void
.end method

.method public final startConnection(Lcom/android/billingclient/api/BillingClientStateListener;)V
    .locals 7

    .line 31
    invoke-virtual {p0}, Lcom/android/billingclient/api/BillingClientImpl;->isReady()Z

    move-result v0

    const-string v1, "BillingClient"

    if-eqz v0, :cond_0

    const-string v0, "Service connection is valid. No need to re-initialize."

    .line 32
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {p1, v0}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V

    return-void

    :cond_0
    iget v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    const-string v0, "Client is already in the process of connecting to billing service."

    .line 34
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzd:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {p1, v0}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V

    return-void

    :cond_1
    iget v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    const/4 v3, 0x3

    if-ne v0, v3, :cond_2

    const-string v0, "Client was already closed and can\'t be reused. Please create another instance."

    .line 36
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {p1, v0}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V

    return-void

    :cond_2
    iput v2, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzd:Lcom/android/billingclient/api/zzh;

    .line 38
    invoke-virtual {v0}, Lcom/android/billingclient/api/zzh;->zzd()V

    const-string v0, "Starting in-app billing setup."

    .line 39
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/android/billingclient/api/zzaf;

    const/4 v3, 0x0

    .line 40
    invoke-direct {v0, p0, p1, v3}, Lcom/android/billingclient/api/zzaf;-><init>(Lcom/android/billingclient/api/BillingClientImpl;Lcom/android/billingclient/api/BillingClientStateListener;Lcom/android/billingclient/api/zzy;)V

    iput-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzh:Lcom/android/billingclient/api/zzaf;

    new-instance v0, Landroid/content/Intent;

    const-string v3, "com.android.vending.billing.InAppBillingService.BIND"

    .line 41
    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v3, "com.android.vending"

    .line 42
    invoke-virtual {v0, v3}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 43
    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 44
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_5

    .line 45
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ResolveInfo;

    .line 46
    iget-object v6, v4, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    if-eqz v6, :cond_5

    .line 47
    iget-object v6, v4, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v6, v6, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    .line 48
    iget-object v4, v4, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v4, v4, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    .line 49
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    if-eqz v4, :cond_4

    new-instance v3, Landroid/content/ComponentName;

    .line 51
    invoke-direct {v3, v6, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v4, Landroid/content/Intent;

    .line 52
    invoke-direct {v4, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    .line 53
    invoke-virtual {v4, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzb:Ljava/lang/String;

    const-string v3, "playBillingLibraryVersion"

    .line 54
    invoke-virtual {v4, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzh:Lcom/android/billingclient/api/zzaf;

    .line 55
    invoke-virtual {v0, v4, v3, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p1, "Service was bonded successfully."

    .line 56
    invoke-static {v1, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    const-string v0, "Connection to Billing service is blocked."

    .line 57
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    const-string v0, "The device doesn\'t have valid Play Store."

    .line 50
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    :cond_5
    :goto_0
    iput v5, p0, Lcom/android/billingclient/api/BillingClientImpl;->zza:I

    const-string v0, "Billing service unavailable on device."

    .line 58
    invoke-static {v1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzc:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {p1, v0}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V

    return-void
.end method

.method public final synthetic zze(ILcom/android/billingclient/api/SkuDetails;Ljava/lang/String;Lcom/android/billingclient/api/BillingFlowParams;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    iget-object p4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 1
    invoke-virtual {p4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 2
    invoke-virtual {p2}, Lcom/android/billingclient/api/SkuDetails;->getSku()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    move v1, p1

    move-object v4, p3

    move-object v6, p5

    .line 3
    invoke-interface/range {v0 .. v6}, Lcom/google/android/gms/internal/play_billing/zzd;->zzg(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p1

    return-object p1
.end method

.method public final synthetic zzf(Lcom/android/billingclient/api/SkuDetails;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    iget-object v1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 1
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 2
    invoke-virtual {p1}, Lcom/android/billingclient/api/SkuDetails;->getSku()Ljava/lang/String;

    move-result-object v3

    const/4 v1, 0x3

    const/4 v5, 0x0

    move-object v4, p2

    .line 3
    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/play_billing/zzd;->zzf(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    return-object p1
.end method

.method public final synthetic zzg(Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    iget-object v1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 1
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/16 v1, 0x8

    const-string/jumbo v4, "subs"

    move-object v3, p1

    move-object v5, p2

    .line 2
    invoke-interface/range {v0 .. v5}, Lcom/google/android/gms/internal/play_billing/zzd;->zzm(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p1

    return-object p1
.end method

.method public final synthetic zzn(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    iget-object v1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 1
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/os/Bundle;

    .line 2
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v3, "vr"

    const/4 v4, 0x1

    .line 3
    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const/4 v3, 0x7

    .line 4
    invoke-interface {v0, v3, v1, p1, v2}, Lcom/google/android/gms/internal/play_billing/zzd;->zzc(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method public final synthetic zzo(Lcom/android/billingclient/api/AcknowledgePurchaseParams;Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "BillingClient"

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    const/16 v3, 0x9

    iget-object v4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 1
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    .line 2
    invoke-virtual {p1}, Lcom/android/billingclient/api/AcknowledgePurchaseParams;->getPurchaseToken()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzb:Ljava/lang/String;

    .line 3
    invoke-static {p1, v6}, Lcom/google/android/gms/internal/play_billing/zza;->zzb(Lcom/android/billingclient/api/AcknowledgePurchaseParams;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    .line 4
    invoke-interface {v2, v3, v4, v5, p1}, Lcom/google/android/gms/internal/play_billing/zzd;->zzd(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zza(Landroid/os/Bundle;Ljava/lang/String;)I

    move-result v2

    .line 8
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzh(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()Lcom/android/billingclient/api/BillingResult$Builder;

    move-result-object v0

    .line 9
    invoke-virtual {v0, v2}, Lcom/android/billingclient/api/BillingResult$Builder;->setResponseCode(I)Lcom/android/billingclient/api/BillingResult$Builder;

    .line 10
    invoke-virtual {v0, p1}, Lcom/android/billingclient/api/BillingResult$Builder;->setDebugMessage(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult$Builder;

    .line 11
    invoke-virtual {v0}, Lcom/android/billingclient/api/BillingResult$Builder;->build()Lcom/android/billingclient/api/BillingResult;

    move-result-object p1

    .line 12
    invoke-interface {p2, p1}, Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;->onAcknowledgePurchaseResponse(Lcom/android/billingclient/api/BillingResult;)V

    return-object v1

    :catch_0
    move-exception p1

    .line 5
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x20

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "Error acknowledge purchase; ex: "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {p2, p1}, Lcom/android/billingclient/api/AcknowledgePurchaseResponseListener;->onAcknowledgePurchaseResponse(Lcom/android/billingclient/api/BillingResult;)V

    return-object v1
.end method

.method public final synthetic zzp(Lcom/android/billingclient/api/ConsumeParams;Lcom/android/billingclient/api/ConsumeResponseListener;)Ljava/lang/Object;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "BillingClient"

    .line 1
    invoke-virtual {p1}, Lcom/android/billingclient/api/ConsumeParams;->getPurchaseToken()Ljava/lang/String;

    move-result-object v1

    :try_start_0
    const-string v2, "Consuming purchase with token: "

    .line 2
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 9
    :cond_0
    new-instance v3, Ljava/lang/String;

    .line 2
    invoke-direct {v3, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    move-object v2, v3

    :goto_0
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v2, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzn:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    const/16 v3, 0x9

    iget-object v4, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 3
    invoke-virtual {v4}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    iget-boolean v5, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzn:Z

    iget-object v6, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzb:Ljava/lang/String;

    .line 4
    invoke-static {p1, v5, v6}, Lcom/google/android/gms/internal/play_billing/zza;->zzc(Lcom/android/billingclient/api/ConsumeParams;ZLjava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    .line 5
    invoke-interface {v2, v3, v4, v1, p1}, Lcom/google/android/gms/internal/play_billing/zzd;->zze(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p1

    const-string v2, "RESPONSE_CODE"

    .line 6
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 7
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzh(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    .line 16
    :cond_1
    iget-object p1, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 8
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 9
    invoke-interface {p1, v2, v3, v1}, Lcom/google/android/gms/internal/play_billing/zzd;->zza(ILjava/lang/String;Ljava/lang/String;)I

    move-result v2

    const-string p1, ""

    .line 7
    :goto_1
    invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()Lcom/android/billingclient/api/BillingResult$Builder;

    move-result-object v3

    .line 10
    invoke-virtual {v3, v2}, Lcom/android/billingclient/api/BillingResult$Builder;->setResponseCode(I)Lcom/android/billingclient/api/BillingResult$Builder;

    .line 11
    invoke-virtual {v3, p1}, Lcom/android/billingclient/api/BillingResult$Builder;->setDebugMessage(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult$Builder;

    .line 12
    invoke-virtual {v3}, Lcom/android/billingclient/api/BillingResult$Builder;->build()Lcom/android/billingclient/api/BillingResult;

    move-result-object p1

    if-nez v2, :cond_2

    const-string v2, "Successfully consumed purchase."

    .line 13
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    invoke-interface {p2, p1, v1}, Lcom/android/billingclient/api/ConsumeResponseListener;->onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V

    goto :goto_2

    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x3f

    .line 15
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v4, "Error consuming purchase with token. Response code: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    invoke-interface {p2, p1, v1}, Lcom/android/billingclient/api/ConsumeResponseListener;->onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p1

    .line 17
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1e

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v2, "Error consuming purchase; ex: "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    sget-object p1, Lcom/android/billingclient/api/zzak;->zzq:Lcom/android/billingclient/api/BillingResult;

    invoke-interface {p2, p1, v1}, Lcom/android/billingclient/api/ConsumeResponseListener;->onConsumeResponse(Lcom/android/billingclient/api/BillingResult;Ljava/lang/String;)V

    :goto_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public final synthetic zzq(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Lcom/android/billingclient/api/SkuDetailsResponseListener;)Ljava/lang/Object;
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v1, p0

    const-string v2, "BillingClient"

    new-instance v0, Ljava/util/ArrayList;

    .line 1
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v3

    const/4 v5, 0x0

    :goto_0
    const/4 v6, 0x6

    const/4 v7, 0x4

    const-string v8, "Item is unavailable for purchase."

    const/4 v9, 0x0

    if-ge v5, v3, :cond_8

    add-int/lit8 v10, v5, 0x14

    if-le v10, v3, :cond_0

    move v11, v3

    goto :goto_1

    :cond_0
    move v11, v10

    :goto_1
    new-instance v12, Ljava/util/ArrayList;

    move-object/from16 v13, p2

    .line 3
    invoke-interface {v13, v5, v11}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v5

    invoke-direct {v12, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v5, Ljava/util/ArrayList;

    .line 4
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v11

    const/4 v14, 0x0

    :goto_2
    if-ge v14, v11, :cond_1

    invoke-interface {v12, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    .line 5
    check-cast v15, Lcom/android/billingclient/api/zzaq;

    .line 6
    invoke-virtual {v15}, Lcom/android/billingclient/api/zzaq;->zza()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v5, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v14, v14, 0x1

    goto :goto_2

    :cond_1
    new-instance v11, Landroid/os/Bundle;

    .line 7
    invoke-direct {v11}, Landroid/os/Bundle;-><init>()V

    const-string v14, "ITEM_ID_LIST"

    .line 8
    invoke-virtual {v11, v14, v5}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    iget-object v5, v1, Lcom/android/billingclient/api/BillingClientImpl;->zzb:Ljava/lang/String;

    const-string v14, "playBillingLibraryVersion"

    .line 9
    invoke-virtual {v11, v14, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    iget-boolean v5, v1, Lcom/android/billingclient/api/BillingClientImpl;->zzo:Z

    if-eqz v5, :cond_2

    iget-object v15, v1, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    const/16 v16, 0xa

    iget-object v5, v1, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 10
    invoke-virtual {v5}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v17

    iget v5, v1, Lcom/android/billingclient/api/BillingClientImpl;->zzk:I

    iget-boolean v14, v1, Lcom/android/billingclient/api/BillingClientImpl;->zzt:Z

    iget-object v4, v1, Lcom/android/billingclient/api/BillingClientImpl;->zzb:Ljava/lang/String;

    .line 11
    invoke-static {v5, v14, v4, v9, v12}, Lcom/google/android/gms/internal/play_billing/zza;->zzd(IZLjava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)Landroid/os/Bundle;

    move-result-object v20

    move-object/from16 v18, p1

    move-object/from16 v19, v11

    .line 12
    invoke-interface/range {v15 .. v20}, Lcom/google/android/gms/internal/play_billing/zzd;->zzl(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v4

    move-object/from16 v14, p1

    goto :goto_3

    .line 21
    :cond_2
    iget-object v4, v1, Lcom/android/billingclient/api/BillingClientImpl;->zzg:Lcom/google/android/gms/internal/play_billing/zzd;

    const/4 v5, 0x3

    iget-object v12, v1, Lcom/android/billingclient/api/BillingClientImpl;->zzf:Landroid/content/Context;

    .line 13
    invoke-virtual {v12}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v14, p1

    .line 14
    invoke-interface {v4, v5, v12, v14, v11}, Lcom/google/android/gms/internal/play_billing/zzd;->zzk(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :goto_3
    if-nez v4, :cond_3

    const-string v0, "querySkuDetailsAsync got null sku details list"

    .line 23
    invoke-static {v2, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    :goto_4
    move-object v0, v9

    const/4 v4, 0x4

    goto/16 :goto_7

    :cond_3
    const-string v5, "DETAILS_LIST"

    .line 15
    invoke-virtual {v4, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_5

    .line 24
    invoke-static {v4, v2}, Lcom/google/android/gms/internal/play_billing/zza;->zza(Landroid/os/Bundle;Ljava/lang/String;)I

    move-result v3

    .line 25
    invoke-static {v4, v2}, Lcom/google/android/gms/internal/play_billing/zza;->zzh(Landroid/os/Bundle;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v3, :cond_4

    new-instance v4, Ljava/lang/StringBuilder;

    const/16 v5, 0x32

    .line 26
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v5, "getSkuDetails() failed. Response code: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 27
    invoke-static {v2, v4}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    move v4, v3

    goto/16 :goto_7

    :cond_4
    const-string v3, "getSkuDetails() returned a bundle with neither an error nor a detail list."

    .line 28
    invoke-static {v2, v3}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    :goto_5
    const/4 v4, 0x6

    goto/16 :goto_7

    .line 16
    :cond_5
    invoke-virtual {v4, v5}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    if-nez v4, :cond_6

    const-string v0, "querySkuDetailsAsync got null response list"

    .line 30
    invoke-static {v2, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    :cond_6
    const/4 v5, 0x0

    .line 17
    :goto_6
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v5, v7, :cond_7

    .line 18
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    :try_start_1
    new-instance v8, Lcom/android/billingclient/api/SkuDetails;

    .line 19
    invoke-direct {v8, v7}, Lcom/android/billingclient/api/SkuDetails;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 20
    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    new-instance v12, Ljava/lang/StringBuilder;

    add-int/lit8 v11, v11, 0x11

    invoke-direct {v12, v11}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v11, "Got sku details: "

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v7}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    invoke-interface {v0, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    :catch_0
    const-string v0, "Got a JSON exception trying to decode SkuDetails."

    .line 29
    invoke-static {v2, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "Error trying to decode SkuDetails."

    move-object v0, v9

    goto :goto_5

    :cond_7
    move v5, v10

    goto/16 :goto_0

    :catch_1
    move-exception v0

    .line 22
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x3f

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    const-string v3, "querySkuDetailsAsync got a remote exception (try to reconnect)."

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v4, -0x1

    const-string v8, "Service connection is disconnected."

    move-object v0, v9

    goto :goto_7

    :cond_8
    const-string v8, ""

    const/4 v4, 0x0

    .line 23
    :goto_7
    invoke-static {}, Lcom/android/billingclient/api/BillingResult;->newBuilder()Lcom/android/billingclient/api/BillingResult$Builder;

    move-result-object v2

    .line 31
    invoke-virtual {v2, v4}, Lcom/android/billingclient/api/BillingResult$Builder;->setResponseCode(I)Lcom/android/billingclient/api/BillingResult$Builder;

    .line 32
    invoke-virtual {v2, v8}, Lcom/android/billingclient/api/BillingResult$Builder;->setDebugMessage(Ljava/lang/String;)Lcom/android/billingclient/api/BillingResult$Builder;

    .line 33
    invoke-virtual {v2}, Lcom/android/billingclient/api/BillingResult$Builder;->build()Lcom/android/billingclient/api/BillingResult;

    move-result-object v2

    move-object/from16 v3, p4

    .line 34
    invoke-interface {v3, v2, v0}, Lcom/android/billingclient/api/SkuDetailsResponseListener;->onSkuDetailsResponse(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-object v9
.end method

.method public final synthetic zzs(Lcom/android/billingclient/api/BillingResult;)V
    .locals 2

    iget-object v0, p0, Lcom/android/billingclient/api/BillingClientImpl;->zzd:Lcom/android/billingclient/api/zzh;

    .line 1
    invoke-virtual {v0}, Lcom/android/billingclient/api/zzh;->zzb()Lcom/android/billingclient/api/PurchasesUpdatedListener;

    move-result-object v0

    const/4 v1, 0x0

    .line 2
    invoke-interface {v0, p1, v1}, Lcom/android/billingclient/api/PurchasesUpdatedListener;->onPurchasesUpdated(Lcom/android/billingclient/api/BillingResult;Ljava/util/List;)V

    return-void
.end method
