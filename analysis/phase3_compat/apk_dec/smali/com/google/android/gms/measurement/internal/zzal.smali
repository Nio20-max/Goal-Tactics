.class final Lcom/google/android/gms/measurement/internal/zzal;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzgn;

.field final synthetic zzb:Lcom/google/android/gms/measurement/internal/zzam;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzam;Lcom/google/android/gms/measurement/internal/zzgn;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzal;->zzb:Lcom/google/android/gms/measurement/internal/zzam;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzal;->zza:Lcom/google/android/gms/measurement/internal/zzgn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzal;->zza:Lcom/google/android/gms/measurement/internal/zzgn;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/measurement/internal/zzgn;->zzaw()Lcom/google/android/gms/measurement/internal/zzaa;

    invoke-static {}, Lcom/google/android/gms/measurement/internal/zzaa;->zza()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzal;->zza:Lcom/google/android/gms/measurement/internal/zzgn;

    .line 2
    invoke-interface {v0}, Lcom/google/android/gms/measurement/internal/zzgn;->zzaz()Lcom/google/android/gms/measurement/internal/zzfp;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/android/gms/measurement/internal/zzfp;->zzp(Ljava/lang/Runnable;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzal;->zzb:Lcom/google/android/gms/measurement/internal/zzam;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zze()Z

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzal;->zzb:Lcom/google/android/gms/measurement/internal/zzam;

    const-wide/16 v2, 0x0

    .line 4
    invoke-static {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzam;->zza(Lcom/google/android/gms/measurement/internal/zzam;J)V

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzal;->zzb:Lcom/google/android/gms/measurement/internal/zzam;

    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzc()V

    :cond_1
    return-void
.end method
