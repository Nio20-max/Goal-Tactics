.class final Lcom/google/android/gms/measurement/internal/zzju;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzjy;

.field private zzb:Lcom/google/android/gms/measurement/internal/zzjt;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzjy;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method final zza(J)V
    .locals 7

    new-instance v6, Lcom/google/android/gms/measurement/internal/zzjt;

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v0

    .line 2
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v2

    move-object v0, v6

    move-object v1, p0

    move-wide v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/zzjt;-><init>(Lcom/google/android/gms/measurement/internal/zzju;JJ)V

    iput-object v6, p0, Lcom/google/android/gms/measurement/internal/zzju;->zzb:Lcom/google/android/gms/measurement/internal/zzjt;

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    invoke-static {p1}, Lcom/google/android/gms/measurement/internal/zzjy;->zzh(Lcom/google/android/gms/measurement/internal/zzjy;)Landroid/os/Handler;

    move-result-object p1

    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzju;->zzb:Lcom/google/android/gms/measurement/internal/zzjt;

    const-wide/16 v0, 0x7d0

    .line 3
    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method final zzb()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzju;->zzb:Lcom/google/android/gms/measurement/internal/zzjt;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzjy;->zzh(Lcom/google/android/gms/measurement/internal/zzjy;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzju;->zzb:Lcom/google/android/gms/measurement/internal/zzjt;

    .line 2
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzm()Lcom/google/android/gms/measurement/internal/zzex;

    move-result-object v0

    .line 4
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzex;->zzl:Lcom/google/android/gms/measurement/internal/zzer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzer;->zza(Z)V

    return-void
.end method
