.class final Lcom/google/android/gms/measurement/internal/zzjv;
.super Lcom/google/android/gms/measurement/internal/zzam;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzjw;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzjw;Lcom/google/android/gms/measurement/internal/zzgn;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjv;->zza:Lcom/google/android/gms/measurement/internal/zzjw;

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/gms/measurement/internal/zzam;-><init>(Lcom/google/android/gms/measurement/internal/zzgn;)V

    return-void
.end method


# virtual methods
.method public final zzc()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjv;->zza:Lcom/google/android/gms/measurement/internal/zzjw;

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    .line 1
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 2
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v1

    .line 3
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    move-result-wide v1

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Lcom/google/android/gms/measurement/internal/zzjw;->zzd(ZZJ)Z

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zze;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 4
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v1

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    .line 6
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzd;->zzf(J)V

    return-void
.end method
