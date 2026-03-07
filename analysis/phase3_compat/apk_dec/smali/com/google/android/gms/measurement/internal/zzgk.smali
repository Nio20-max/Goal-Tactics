.class public final Lcom/google/android/gms/measurement/internal/zzgk;
.super Lcom/google/android/gms/measurement/internal/zzdy;
.source "com.google.android.gms:play-services-measurement@@19.0.1"


# instance fields
.field private final zza:Lcom/google/android/gms/measurement/internal/zzkn;

.field private zzb:Ljava/lang/Boolean;

.field private zzc:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/zzkn;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzdy;-><init>()V

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zzc:Ljava/lang/String;

    return-void
.end method

.method private final zzA(Ljava/lang/String;Z)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_3

    :try_start_0
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zzb:Ljava/lang/Boolean;

    if-nez p2, :cond_2

    const-string p2, "com.google.android.gms"

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zzc:Ljava/lang/String;

    .line 2
    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 3
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzau()Landroid/content/Context;

    move-result-object p2

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    .line 4
    invoke-static {p2, v2}, Lcom/google/android/gms/common/util/UidVerifier;->isGooglePlayServicesUid(Landroid/content/Context;I)Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 5
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzau()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/google/android/gms/common/GoogleSignatureVerifier;->getInstance(Landroid/content/Context;)Lcom/google/android/gms/common/GoogleSignatureVerifier;

    move-result-object p2

    .line 6
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    invoke-virtual {p2, v2}, Lcom/google/android/gms/common/GoogleSignatureVerifier;->isUidGoogleSigned(I)Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p2, 0x1

    .line 2
    :goto_1
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zzb:Ljava/lang/Boolean;

    :cond_2
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zzb:Ljava/lang/Boolean;

    .line 7
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_5

    :cond_3
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zzc:Ljava/lang/String;

    if-nez p2, :cond_4

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 8
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzau()Landroid/content/Context;

    move-result-object p2

    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v2

    .line 9
    invoke-static {p2, v2, p1}, Lcom/google/android/gms/common/GooglePlayServicesUtilLight;->uidHasPackageName(Landroid/content/Context;ILjava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_4

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zzc:Ljava/lang/String;

    :cond_4
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zzc:Ljava/lang/String;

    .line 10
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    :cond_5
    return-void

    :cond_6
    new-instance p2, Ljava/lang/SecurityException;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v0

    const-string v0, "Unknown calling package name \'%s\'."

    .line 11
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p2

    .line 17
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v1, "Measurement Service called with invalid calling package. appId"

    .line 14
    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 15
    throw p2

    .line 11
    :cond_7
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 16
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p1

    const-string p2, "Measurement Service called without app package"

    invoke-virtual {p1, p2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    new-instance p1, Ljava/lang/SecurityException;

    .line 17
    invoke-direct {p1, p2}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final zzB(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzA()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 2
    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzD(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    return-void
.end method

.method static bridge synthetic zzc(Lcom/google/android/gms/measurement/internal/zzgk;)Lcom/google/android/gms/measurement/internal/zzkn;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    return-object p0
.end method

.method static bridge synthetic zzv(Lcom/google/android/gms/measurement/internal/zzgk;Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzgk;->zzB(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    return-void
.end method

.method private final zzz(Lcom/google/android/gms/measurement/internal/zzp;Z)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object p2, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 3
    iget-object p2, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const/4 v0, 0x0

    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzA(Ljava/lang/String;Z)V

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 4
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object p2

    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzb:Ljava/lang/String;

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzq:Ljava/lang/String;

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzu:Ljava/lang/String;

    .line 5
    invoke-virtual {p2, v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzku;->zzW(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method


# virtual methods
.method final zzb(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)Lcom/google/android/gms/measurement/internal/zzat;
    .locals 8

    .line 1
    iget-object p2, p1, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    const-string v0, "_cmp"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    iget-object p2, p1, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    if-eqz p2, :cond_2

    .line 2
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzar;->zza()I

    move-result p2

    if-nez p2, :cond_0

    goto :goto_0

    .line 3
    :cond_0
    iget-object p2, p1, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    const-string v0, "_cis"

    invoke-virtual {p2, v0}, Lcom/google/android/gms/measurement/internal/zzar;->zzg(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "referrer broadcast"

    .line 4
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "referrer API"

    .line 5
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_2

    :cond_1
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 6
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzi()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p2

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzat;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Event has been filtered "

    invoke-virtual {p2, v1, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p2, Lcom/google/android/gms/measurement/internal/zzat;

    .line 7
    iget-object v4, p1, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    iget-object v5, p1, Lcom/google/android/gms/measurement/internal/zzat;->zzc:Ljava/lang/String;

    iget-wide v6, p1, Lcom/google/android/gms/measurement/internal/zzat;->zzd:J

    const-string v3, "_cmpx"

    move-object v2, p2

    invoke-direct/range {v2 .. v7}, Lcom/google/android/gms/measurement/internal/zzat;-><init>(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzar;Ljava/lang/String;J)V

    return-object p2

    :cond_2
    :goto_0
    return-object p1
.end method

.method public final zzd(Lcom/google/android/gms/measurement/internal/zzp;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzz(Lcom/google/android/gms/measurement/internal/zzp;Z)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 2
    invoke-virtual {v0, p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzx(Lcom/google/android/gms/measurement/internal/zzp;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final zze(Lcom/google/android/gms/measurement/internal/zzp;Z)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/measurement/internal/zzp;",
            "Z)",
            "Ljava/util/List<",
            "Lcom/google/android/gms/measurement/internal/zzkq;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzz(Lcom/google/android/gms/measurement/internal/zzp;Z)V

    .line 2
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 4
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/measurement/internal/zzgh;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/measurement/internal/zzgh;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Ljava/lang/String;)V

    .line 5
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzfp;->zzh(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v0

    .line 6
    :try_start_0
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/android/gms/measurement/internal/zzks;

    if-nez p2, :cond_1

    .line 9
    iget-object v3, v2, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    invoke-static {v3}, Lcom/google/android/gms/measurement/internal/zzku;->zzag(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 10
    :cond_1
    new-instance v3, Lcom/google/android/gms/measurement/internal/zzkq;

    invoke-direct {v3, v2}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Lcom/google/android/gms/measurement/internal/zzks;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_2
    return-object v1

    :catch_0
    move-exception p2

    goto :goto_1

    :catch_1
    move-exception p2

    :goto_1
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 11
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v1, "Failed to get user properties. appId"

    .line 13
    invoke-virtual {v0, v1, p1, p2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public final zzf(Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzp;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/google/android/gms/measurement/internal/zzp;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/android/gms/measurement/internal/zzab;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p3, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzz(Lcom/google/android/gms/measurement/internal/zzp;Z)V

    .line 2
    iget-object p3, p3, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    .line 3
    invoke-static {p3}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzfy;

    invoke-direct {v1, p0, p3, p1, p2}, Lcom/google/android/gms/measurement/internal/zzfy;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzfp;->zzh(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p1

    .line 6
    :try_start_0
    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    :goto_0
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 7
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p2

    const-string p3, "Failed to get conditional user properties"

    invoke-virtual {p2, p3, p1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 8
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public final zzg(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/android/gms/measurement/internal/zzab;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzA(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzfz;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/android/gms/measurement/internal/zzfz;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzfp;->zzh(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p1

    .line 4
    :try_start_0
    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    :goto_0
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 5
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p2

    .line 6
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p2

    const-string p3, "Failed to get conditional user properties as"

    .line 7
    invoke-virtual {p2, p3, p1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 8
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public final zzh(Ljava/lang/String;Ljava/lang/String;ZLcom/google/android/gms/measurement/internal/zzp;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Lcom/google/android/gms/measurement/internal/zzp;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/android/gms/measurement/internal/zzkq;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p4, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzz(Lcom/google/android/gms/measurement/internal/zzp;Z)V

    .line 2
    iget-object v0, p4, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    .line 3
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 4
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v1

    new-instance v2, Lcom/google/android/gms/measurement/internal/zzfw;

    invoke-direct {v2, p0, v0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzfw;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzfp;->zzh(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p1

    .line 6
    :try_start_0
    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    new-instance p2, Ljava/util/ArrayList;

    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 8
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzks;

    if-nez p3, :cond_1

    .line 9
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzku;->zzag(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 10
    :cond_1
    new-instance v1, Lcom/google/android/gms/measurement/internal/zzkq;

    invoke-direct {v1, v0}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Lcom/google/android/gms/measurement/internal/zzks;)V

    invoke-interface {p2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_2
    return-object p2

    :catch_0
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    :goto_1
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 11
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p2

    .line 12
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p2

    iget-object p3, p4, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {p3}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p3

    const-string p4, "Failed to query user properties. appId"

    .line 13
    invoke-virtual {p2, p4, p3, p1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public final zzi(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Lcom/google/android/gms/measurement/internal/zzkq;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzA(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/measurement/internal/zzfx;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/google/android/gms/measurement/internal/zzfx;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzfp;->zzh(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p2

    .line 4
    :try_start_0
    invoke-interface {p2}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    new-instance p3, Ljava/util/ArrayList;

    .line 5
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p3, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 6
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/measurement/internal/zzks;

    if-nez p4, :cond_1

    .line 7
    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzks;->zzc:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzku;->zzag(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 8
    :cond_1
    new-instance v1, Lcom/google/android/gms/measurement/internal/zzkq;

    invoke-direct {v1, v0}, Lcom/google/android/gms/measurement/internal/zzkq;-><init>(Lcom/google/android/gms/measurement/internal/zzks;)V

    invoke-interface {p3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_2
    return-object p3

    :catch_0
    move-exception p2

    goto :goto_1

    :catch_1
    move-exception p2

    :goto_1
    iget-object p3, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 9
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p3

    .line 10
    invoke-virtual {p3}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p3

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string p4, "Failed to get user properties as. appId"

    .line 11
    invoke-virtual {p3, p4, p1, p2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public final zzj(Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzz(Lcom/google/android/gms/measurement/internal/zzp;Z)V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzgi;

    .line 2
    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/measurement/internal/zzgi;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Lcom/google/android/gms/measurement/internal/zzp;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzy(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final zzk(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzz(Lcom/google/android/gms/measurement/internal/zzp;Z)V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzgd;

    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzgd;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzy(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final zzl(Lcom/google/android/gms/measurement/internal/zzat;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    const/4 p3, 0x1

    .line 3
    invoke-direct {p0, p2, p3}, Lcom/google/android/gms/measurement/internal/zzgk;->zzA(Ljava/lang/String;Z)V

    new-instance p3, Lcom/google/android/gms/measurement/internal/zzge;

    .line 4
    invoke-direct {p3, p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzge;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Lcom/google/android/gms/measurement/internal/zzat;Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Lcom/google/android/gms/measurement/internal/zzgk;->zzy(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final zzm(Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/measurement/internal/zzgk;->zzA(Ljava/lang/String;Z)V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzga;

    .line 3
    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/measurement/internal/zzga;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Lcom/google/android/gms/measurement/internal/zzp;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzy(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final zzn(Lcom/google/android/gms/measurement/internal/zzab;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzz(Lcom/google/android/gms/measurement/internal/zzp;Z)V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzab;

    .line 4
    invoke-direct {v0, p1}, Lcom/google/android/gms/measurement/internal/zzab;-><init>(Lcom/google/android/gms/measurement/internal/zzab;)V

    .line 5
    iget-object p1, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    iput-object p1, v0, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzfu;

    .line 6
    invoke-direct {p1, p0, v0, p2}, Lcom/google/android/gms/measurement/internal/zzfu;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Lcom/google/android/gms/measurement/internal/zzab;Lcom/google/android/gms/measurement/internal/zzp;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/measurement/internal/zzgk;->zzy(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final zzo(Lcom/google/android/gms/measurement/internal/zzab;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzab;->zza:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/measurement/internal/zzgk;->zzA(Ljava/lang/String;Z)V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzab;

    .line 5
    invoke-direct {v0, p1}, Lcom/google/android/gms/measurement/internal/zzab;-><init>(Lcom/google/android/gms/measurement/internal/zzab;)V

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzfv;

    .line 6
    invoke-direct {p1, p0, v0}, Lcom/google/android/gms/measurement/internal/zzfv;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Lcom/google/android/gms/measurement/internal/zzab;)V

    invoke-virtual {p0, p1}, Lcom/google/android/gms/measurement/internal/zzgk;->zzy(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final zzp(Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzp;->zzv:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzgc;

    .line 3
    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/measurement/internal/zzgc;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Lcom/google/android/gms/measurement/internal/zzp;)V

    .line 4
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzfp;->zzs()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 6
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 7
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/google/android/gms/measurement/internal/zzfp;->zzq(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final zzq(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8

    new-instance v7, Lcom/google/android/gms/measurement/internal/zzgj;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p4

    move-object v3, p5

    move-object v4, p3

    move-wide v5, p1

    .line 1
    invoke-direct/range {v0 .. v6}, Lcom/google/android/gms/measurement/internal/zzgj;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    invoke-virtual {p0, v7}, Lcom/google/android/gms/measurement/internal/zzgk;->zzy(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final zzr(Landroid/os/Bundle;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzz(Lcom/google/android/gms/measurement/internal/zzp;Z)V

    .line 2
    iget-object p2, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    .line 3
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzft;

    .line 4
    invoke-direct {v0, p0, p2, p1}, Lcom/google/android/gms/measurement/internal/zzft;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzy(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final zzs(Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzz(Lcom/google/android/gms/measurement/internal/zzp;Z)V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzgb;

    .line 2
    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/measurement/internal/zzgb;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Lcom/google/android/gms/measurement/internal/zzp;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzy(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final zzt(Lcom/google/android/gms/measurement/internal/zzkq;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzz(Lcom/google/android/gms/measurement/internal/zzp;Z)V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzgg;

    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzgg;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Lcom/google/android/gms/measurement/internal/zzkq;Lcom/google/android/gms/measurement/internal/zzp;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzy(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final zzu(Lcom/google/android/gms/measurement/internal/zzat;Ljava/lang/String;)[B
    .locals 11

    .line 1
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    .line 3
    invoke-direct {p0, p2, v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzA(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 6
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v1

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzed;->zzc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Log and bundle. event"

    .line 7
    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 8
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->nanoTime()J

    move-result-wide v0

    const-wide/32 v2, 0xf4240

    div-long/2addr v0, v2

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 9
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v4

    new-instance v5, Lcom/google/android/gms/measurement/internal/zzgf;

    invoke-direct {v5, p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzgf;-><init>(Lcom/google/android/gms/measurement/internal/zzgk;Lcom/google/android/gms/measurement/internal/zzat;Ljava/lang/String;)V

    .line 10
    invoke-virtual {v4, v5}, Lcom/google/android/gms/measurement/internal/zzfp;->zzi(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v4

    .line 11
    :try_start_0
    invoke-interface {v4}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [B

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 12
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v4

    .line 13
    invoke-virtual {v4}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v4

    const-string v5, "Log and bundle returned null. appId"

    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 14
    invoke-virtual {v4, v5, v6}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v4, 0x0

    new-array v4, v4, [B

    :cond_0
    iget-object v5, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 15
    invoke-virtual {v5}, Lcom/google/android/gms/measurement/internal/zzkn;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v5

    invoke-interface {v5}, Lcom/google/android/gms/common/util/Clock;->nanoTime()J

    move-result-wide v5

    iget-object v7, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 16
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v7

    .line 17
    invoke-virtual {v7}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v7

    const-string v8, "Log and bundle processed. event, size, time_ms"

    iget-object v9, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 18
    invoke-virtual {v9}, Lcom/google/android/gms/measurement/internal/zzkn;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v9

    iget-object v10, p1, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lcom/google/android/gms/measurement/internal/zzed;->zzc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    array-length v10, v4

    .line 19
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    div-long/2addr v5, v2

    sub-long/2addr v5, v0

    .line 20
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    .line 21
    invoke-virtual {v7, v8, v9, v10, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 22
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    .line 23
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    invoke-static {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 24
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v2

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    invoke-virtual {v2, p1}, Lcom/google/android/gms/measurement/internal/zzed;->zzc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v2, "Failed to log and bundle. appId, event, error"

    .line 25
    invoke-virtual {v1, v2, p2, p1, v0}, Lcom/google/android/gms/measurement/internal/zzeg;->zzd(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method final zzw(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V
    .locals 7

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzo()Lcom/google/android/gms/measurement/internal/zzfj;

    move-result-object v0

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzfj;->zzl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 2
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzgk;->zzB(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const-string v2, "EES config found for"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzo()Lcom/google/android/gms/measurement/internal/zzfj;

    move-result-object v0

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzpl;->zzc()Z

    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 6
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v2

    .line 5
    sget-object v3, Lcom/google/android/gms/measurement/internal/zzdw;->zzav:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 7
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 32
    :cond_1
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzfj;->zza:Landroidx/collection/LruCache;

    .line 8
    invoke-virtual {v0, v1}, Landroidx/collection/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/google/android/gms/internal/measurement/zzc;

    :cond_2
    :goto_0
    if-eqz v4, :cond_7

    .line 9
    :try_start_0
    iget-object v0, p1, Lcom/google/android/gms/measurement/internal/zzat;->zzb:Lcom/google/android/gms/measurement/internal/zzar;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzar;->zzc()Landroid/os/Bundle;

    move-result-object v0

    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzkp;->zzt(Landroid/os/Bundle;Z)Ljava/util/Map;

    move-result-object v0

    .line 11
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzgp;->zza(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    .line 12
    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    :cond_3
    new-instance v2, Lcom/google/android/gms/internal/measurement/zzaa;

    .line 13
    iget-wide v5, p1, Lcom/google/android/gms/measurement/internal/zzat;->zzd:J

    invoke-direct {v2, v1, v5, v6, v0}, Lcom/google/android/gms/internal/measurement/zzaa;-><init>(Ljava/lang/String;JLjava/util/Map;)V

    .line 14
    invoke-virtual {v4, v2}, Lcom/google/android/gms/internal/measurement/zzc;->zze(Lcom/google/android/gms/internal/measurement/zzaa;)Z

    move-result v0
    :try_end_0
    .catch Lcom/google/android/gms/internal/measurement/zzd; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v0, :cond_4

    goto/16 :goto_3

    .line 20
    :cond_4
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzc;->zzg()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 21
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    const-string v1, "EES edited event"

    invoke-virtual {v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzc;->zza()Lcom/google/android/gms/internal/measurement/zzab;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzab;->zzb()Lcom/google/android/gms/internal/measurement/zzaa;

    move-result-object p1

    .line 22
    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzkp;->zzi(Lcom/google/android/gms/internal/measurement/zzaa;)Lcom/google/android/gms/measurement/internal/zzat;

    move-result-object p1

    .line 23
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzgk;->zzB(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    goto :goto_1

    .line 24
    :cond_5
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzgk;->zzB(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    .line 25
    :goto_1
    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzc;->zzf()Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-virtual {v4}, Lcom/google/android/gms/internal/measurement/zzc;->zza()Lcom/google/android/gms/internal/measurement/zzab;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/gms/internal/measurement/zzab;->zzc()Ljava/util/List;

    move-result-object p1

    .line 26
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzaa;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 27
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    .line 28
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    .line 29
    invoke-virtual {v0}, Lcom/google/android/gms/internal/measurement/zzaa;->zzd()Ljava/lang/String;

    move-result-object v2

    const-string v3, "EES logging created event"

    invoke-virtual {v1, v3, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 30
    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzkp;->zzi(Lcom/google/android/gms/internal/measurement/zzaa;)Lcom/google/android/gms/measurement/internal/zzat;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/google/android/gms/measurement/internal/zzgk;->zzB(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    goto :goto_2

    :cond_6
    return-void

    .line 8
    :catch_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/zzp;->zzb:Ljava/lang/String;

    iget-object v2, p1, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    const-string v3, "EES error. appId, eventName"

    .line 17
    invoke-virtual {v0, v3, v1, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    :goto_3
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzat;->zza:Ljava/lang/String;

    const-string v2, "EES was not applied to event"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzgk;->zzB(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    return-void

    .line 24
    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 31
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    iget-object v1, p2, Lcom/google/android/gms/measurement/internal/zzp;->zza:Ljava/lang/String;

    const-string v2, "EES not loaded for"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzgk;->zzB(Lcom/google/android/gms/measurement/internal/zzat;Lcom/google/android/gms/measurement/internal/zzp;)V

    return-void
.end method

.method public final synthetic zzx(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 12

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkd;->zzY()V

    new-instance v11, Lcom/google/android/gms/measurement/internal/zzao;

    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzaj;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    const-string v3, ""

    const-string v5, "dep"

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    move-object v1, v11

    move-object v4, p1

    move-object v10, p2

    .line 2
    invoke-direct/range {v1 .. v10}, Lcom/google/android/gms/measurement/internal/zzao;-><init>(Lcom/google/android/gms/measurement/internal/zzfs;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLandroid/os/Bundle;)V

    iget-object p2, v0, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 3
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzkn;->zzu()Lcom/google/android/gms/measurement/internal/zzkp;

    move-result-object p2

    .line 4
    invoke-virtual {p2, v11}, Lcom/google/android/gms/measurement/internal/zzkp;->zzj(Lcom/google/android/gms/measurement/internal/zzao;)Lcom/google/android/gms/internal/measurement/zzfo;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/android/gms/internal/measurement/zzih;->zzbs()[B

    move-result-object p2

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 5
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    .line 6
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    iget-object v2, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 7
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzj()Lcom/google/android/gms/measurement/internal/zzed;

    move-result-object v2

    .line 8
    invoke-virtual {v2, p1}, Lcom/google/android/gms/measurement/internal/zzed;->zzc(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    array-length v3, p2

    .line 9
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "Saving default event parameters, appId, data size"

    .line 10
    invoke-virtual {v1, v4, v2, v3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Landroid/content/ContentValues;

    .line 11
    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "app_id"

    .line 12
    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "parameters"

    .line 13
    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 1
    :try_start_0
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaj;->zzh()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p2

    const-string v2, "default_event_params"

    const/4 v3, 0x0

    const/4 v4, 0x5

    .line 14
    invoke-virtual {p2, v2, v3, v1, v4}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v1

    const-wide/16 v3, -0x1

    cmp-long p2, v1, v3

    if-nez p2, :cond_0

    iget-object p2, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 15
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p2

    .line 16
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p2

    const-string v1, "Failed to insert default event parameters (got -1). appId"

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 17
    invoke-virtual {p2, v1, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception p2

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzn(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    const-string v1, "Error storing default event parameters. appId"

    .line 20
    invoke-virtual {v0, v1, p1, p2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzc(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method final zzy(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfp;->zzs()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgk;->zza:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/gms/measurement/internal/zzfp;->zzp(Ljava/lang/Runnable;)V

    return-void
.end method
