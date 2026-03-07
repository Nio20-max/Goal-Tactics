.class final Lcom/android/billingclient/api/zzaf;
.super Ljava/lang/Object;
.source "com.android.billingclient:billing@@4.0.0"

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field final synthetic zza:Lcom/android/billingclient/api/BillingClientImpl;

.field private final zzb:Ljava/lang/Object;

.field private zzc:Z

.field private zzd:Lcom/android/billingclient/api/BillingClientStateListener;


# direct methods
.method synthetic constructor <init>(Lcom/android/billingclient/api/BillingClientImpl;Lcom/android/billingclient/api/BillingClientStateListener;Lcom/android/billingclient/api/zzy;)V
    .locals 0

    iput-object p1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/billingclient/api/zzaf;->zzb:Ljava/lang/Object;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/billingclient/api/zzaf;->zzc:Z

    iput-object p2, p0, Lcom/android/billingclient/api/zzaf;->zzd:Lcom/android/billingclient/api/BillingClientStateListener;

    return-void
.end method

.method private final zzd(Lcom/android/billingclient/api/BillingResult;)V
    .locals 2

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zzb:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/billingclient/api/zzaf;->zzd:Lcom/android/billingclient/api/BillingClientStateListener;

    if-eqz v1, :cond_0

    .line 1
    invoke-interface {v1, p1}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingSetupFinished(Lcom/android/billingclient/api/BillingResult;)V

    .line 2
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 6

    const-string p1, "BillingClient"

    const-string v0, "Billing service connected."

    .line 1
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/internal/play_billing/zzc;->zzn(Landroid/os/IBinder;)Lcom/google/android/gms/internal/play_billing/zzd;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/billingclient/api/BillingClientImpl;->zzm(Lcom/android/billingclient/api/BillingClientImpl;Lcom/google/android/gms/internal/play_billing/zzd;)Lcom/google/android/gms/internal/play_billing/zzd;

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    new-instance v1, Lcom/android/billingclient/api/zzae;

    .line 3
    invoke-direct {v1, p0}, Lcom/android/billingclient/api/zzae;-><init>(Lcom/android/billingclient/api/zzaf;)V

    new-instance v4, Lcom/android/billingclient/api/zzad;

    invoke-direct {v4, p0}, Lcom/android/billingclient/api/zzad;-><init>(Lcom/android/billingclient/api/zzaf;)V

    iget-object p1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 4
    invoke-static {p1}, Lcom/android/billingclient/api/BillingClientImpl;->zzh(Lcom/android/billingclient/api/BillingClientImpl;)Landroid/os/Handler;

    move-result-object v5

    const-wide/16 v2, 0x7530

    .line 5
    invoke-static/range {v0 .. v5}, Lcom/android/billingclient/api/BillingClientImpl;->zzr(Lcom/android/billingclient/api/BillingClientImpl;Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    move-result-object p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 6
    invoke-static {p1}, Lcom/android/billingclient/api/BillingClientImpl;->zzj(Lcom/android/billingclient/api/BillingClientImpl;)Lcom/android/billingclient/api/BillingResult;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/android/billingclient/api/zzaf;->zzd(Lcom/android/billingclient/api/BillingResult;)V

    :cond_0
    return-void
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    const-string p1, "BillingClient"

    const-string v0, "Billing service disconnected."

    .line 1
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    const/4 v0, 0x0

    .line 2
    invoke-static {p1, v0}, Lcom/android/billingclient/api/BillingClientImpl;->zzm(Lcom/android/billingclient/api/BillingClientImpl;Lcom/google/android/gms/internal/play_billing/zzd;)Lcom/google/android/gms/internal/play_billing/zzd;

    iget-object p1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    const/4 v0, 0x0

    .line 3
    invoke-static {p1, v0}, Lcom/android/billingclient/api/BillingClientImpl;->zzc(Lcom/android/billingclient/api/BillingClientImpl;I)I

    iget-object p1, p0, Lcom/android/billingclient/api/zzaf;->zzb:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zzd:Lcom/android/billingclient/api/BillingClientStateListener;

    if-eqz v0, :cond_0

    .line 4
    invoke-interface {v0}, Lcom/android/billingclient/api/BillingClientStateListener;->onBillingServiceDisconnected()V

    .line 5
    :cond_0
    monitor-exit p1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public final synthetic zza()Ljava/lang/Object;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zzb:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/android/billingclient/api/zzaf;->zzc:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 1
    monitor-exit v0

    return-object v2

    .line 2
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x3

    const/4 v1, 0x0

    :try_start_1
    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zzd(Lcom/android/billingclient/api/BillingClientImpl;)Landroid/content/Context;

    move-result-object v3

    .line 3
    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    const/16 v4, 0x10

    const/16 v5, 0x10

    const/4 v6, 0x3

    :goto_0
    if-lt v5, v0, :cond_2

    :try_start_2
    iget-object v7, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 4
    invoke-static {v7}, Lcom/android/billingclient/api/BillingClientImpl;->zzl(Lcom/android/billingclient/api/BillingClientImpl;)Lcom/google/android/gms/internal/play_billing/zzd;

    move-result-object v7

    const-string/jumbo v8, "subs"

    invoke-interface {v7, v5, v3, v8}, Lcom/google/android/gms/internal/play_billing/zzd;->zzb(ILjava/lang/String;Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v5, v5, -0x1

    goto :goto_0

    :catch_0
    move v0, v6

    goto/16 :goto_e

    :cond_2
    const/4 v5, 0x0

    :goto_1
    iget-object v7, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    const/4 v8, 0x5

    const/4 v9, 0x1

    if-lt v5, v8, :cond_3

    const/4 v8, 0x1

    goto :goto_2

    :cond_3
    const/4 v8, 0x0

    .line 5
    :goto_2
    invoke-static {v7, v8}, Lcom/android/billingclient/api/BillingClientImpl;->zzC(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v7, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    if-lt v5, v0, :cond_4

    const/4 v8, 0x1

    goto :goto_3

    :cond_4
    const/4 v8, 0x0

    .line 6
    :goto_3
    invoke-static {v7, v8}, Lcom/android/billingclient/api/BillingClientImpl;->zzt(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    if-ge v5, v0, :cond_5

    const-string v5, "BillingClient"

    const-string v7, "In-app billing API does not support subscription on this device."

    .line 7
    invoke-static {v5, v7}, Lcom/google/android/gms/internal/play_billing/zza;->zzj(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    const/16 v5, 0x10

    :goto_4
    if-lt v5, v0, :cond_7

    iget-object v7, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 8
    invoke-static {v7}, Lcom/android/billingclient/api/BillingClientImpl;->zzl(Lcom/android/billingclient/api/BillingClientImpl;)Lcom/google/android/gms/internal/play_billing/zzd;

    move-result-object v7

    const-string v8, "inapp"

    invoke-interface {v7, v5, v3, v8}, Lcom/google/android/gms/internal/play_billing/zzd;->zzb(ILjava/lang/String;Ljava/lang/String;)I

    move-result v6

    if-nez v6, :cond_6

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 9
    invoke-static {v3, v5}, Lcom/android/billingclient/api/BillingClientImpl;->zzb(Lcom/android/billingclient/api/BillingClientImpl;I)I

    goto :goto_5

    :cond_6
    add-int/lit8 v5, v5, -0x1

    goto :goto_4

    :cond_7
    :goto_5
    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v5

    if-lt v5, v4, :cond_8

    const/4 v4, 0x1

    goto :goto_6

    :cond_8
    const/4 v4, 0x0

    .line 10
    :goto_6
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzu(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/16 v5, 0xf

    if-lt v4, v5, :cond_9

    const/4 v4, 0x1

    goto :goto_7

    :cond_9
    const/4 v4, 0x0

    .line 11
    :goto_7
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzv(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/16 v5, 0xe

    if-lt v4, v5, :cond_a

    const/4 v4, 0x1

    goto :goto_8

    :cond_a
    const/4 v4, 0x0

    .line 12
    :goto_8
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzw(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/16 v5, 0xc

    if-lt v4, v5, :cond_b

    const/4 v4, 0x1

    goto :goto_9

    :cond_b
    const/4 v4, 0x0

    .line 13
    :goto_9
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzx(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/16 v5, 0xa

    if-lt v4, v5, :cond_c

    const/4 v4, 0x1

    goto :goto_a

    :cond_c
    const/4 v4, 0x0

    .line 14
    :goto_a
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzy(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/16 v5, 0x9

    if-lt v4, v5, :cond_d

    const/4 v4, 0x1

    goto :goto_b

    :cond_d
    const/4 v4, 0x0

    .line 15
    :goto_b
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzz(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/16 v5, 0x8

    if-lt v4, v5, :cond_e

    const/4 v4, 0x1

    goto :goto_c

    :cond_e
    const/4 v4, 0x0

    .line 16
    :goto_c
    invoke-static {v3, v4}, Lcom/android/billingclient/api/BillingClientImpl;->zzA(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v4

    const/4 v5, 0x6

    if-lt v4, v5, :cond_f

    goto :goto_d

    :cond_f
    const/4 v9, 0x0

    .line 17
    :goto_d
    invoke-static {v3, v9}, Lcom/android/billingclient/api/BillingClientImpl;->zzB(Lcom/android/billingclient/api/BillingClientImpl;Z)Z

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    invoke-static {v3}, Lcom/android/billingclient/api/BillingClientImpl;->zza(Lcom/android/billingclient/api/BillingClientImpl;)I

    move-result v3

    if-ge v3, v0, :cond_10

    const-string v0, "BillingClient"

    const-string v3, "In-app billing API version 3 is not supported on this device."

    .line 18
    invoke-static {v0, v3}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    :cond_10
    if-nez v6, :cond_11

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    const/4 v3, 0x2

    .line 19
    invoke-static {v0, v3}, Lcom/android/billingclient/api/BillingClientImpl;->zzc(Lcom/android/billingclient/api/BillingClientImpl;I)I

    goto :goto_f

    .line 26
    :cond_11
    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 20
    invoke-static {v0, v1}, Lcom/android/billingclient/api/BillingClientImpl;->zzc(Lcom/android/billingclient/api/BillingClientImpl;I)I

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 21
    invoke-static {v0, v2}, Lcom/android/billingclient/api/BillingClientImpl;->zzm(Lcom/android/billingclient/api/BillingClientImpl;Lcom/google/android/gms/internal/play_billing/zzd;)Lcom/google/android/gms/internal/play_billing/zzd;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_f

    :catch_1
    :goto_e
    const-string v3, "BillingClient"

    const-string v4, "Exception while checking if billing is supported; try to reconnect"

    .line 22
    invoke-static {v3, v4}, Lcom/google/android/gms/internal/play_billing/zza;->zzk(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 23
    invoke-static {v3, v1}, Lcom/android/billingclient/api/BillingClientImpl;->zzc(Lcom/android/billingclient/api/BillingClientImpl;I)I

    iget-object v1, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    .line 24
    invoke-static {v1, v2}, Lcom/android/billingclient/api/BillingClientImpl;->zzm(Lcom/android/billingclient/api/BillingClientImpl;Lcom/google/android/gms/internal/play_billing/zzd;)Lcom/google/android/gms/internal/play_billing/zzd;

    move v6, v0

    :goto_f
    if-nez v6, :cond_12

    .line 25
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzp:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, v0}, Lcom/android/billingclient/api/zzaf;->zzd(Lcom/android/billingclient/api/BillingResult;)V

    goto :goto_10

    .line 26
    :cond_12
    sget-object v0, Lcom/android/billingclient/api/zzak;->zza:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, v0}, Lcom/android/billingclient/api/zzaf;->zzd(Lcom/android/billingclient/api/BillingResult;)V

    :goto_10
    return-object v2

    :catchall_0
    move-exception v1

    .line 2
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method public final synthetic zzb()V
    .locals 2

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    const/4 v1, 0x0

    .line 1
    invoke-static {v0, v1}, Lcom/android/billingclient/api/BillingClientImpl;->zzc(Lcom/android/billingclient/api/BillingClientImpl;I)I

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zza:Lcom/android/billingclient/api/BillingClientImpl;

    const/4 v1, 0x0

    .line 2
    invoke-static {v0, v1}, Lcom/android/billingclient/api/BillingClientImpl;->zzm(Lcom/android/billingclient/api/BillingClientImpl;Lcom/google/android/gms/internal/play_billing/zzd;)Lcom/google/android/gms/internal/play_billing/zzd;

    .line 3
    sget-object v0, Lcom/android/billingclient/api/zzak;->zzr:Lcom/android/billingclient/api/BillingResult;

    invoke-direct {p0, v0}, Lcom/android/billingclient/api/zzaf;->zzd(Lcom/android/billingclient/api/BillingResult;)V

    return-void
.end method

.method final zzc()V
    .locals 2

    iget-object v0, p0, Lcom/android/billingclient/api/zzaf;->zzb:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iput-object v1, p0, Lcom/android/billingclient/api/zzaf;->zzd:Lcom/android/billingclient/api/BillingClientStateListener;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/billingclient/api/zzaf;->zzc:Z

    .line 1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
