.class public final Lcom/google/android/gms/measurement/internal/zzjy;
.super Lcom/google/android/gms/measurement/internal/zzf;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"


# instance fields
.field protected final zza:Lcom/google/android/gms/measurement/internal/zzjx;

.field protected final zzb:Lcom/google/android/gms/measurement/internal/zzjw;

.field protected final zzc:Lcom/google/android/gms/measurement/internal/zzju;

.field private zzd:Landroid/os/Handler;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzfs;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzf;-><init>(Lcom/google/android/gms/measurement/internal/zzfs;)V

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzjx;

    .line 2
    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzjx;-><init>(Lcom/google/android/gms/measurement/internal/zzjy;)V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjy;->zza:Lcom/google/android/gms/measurement/internal/zzjx;

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzjw;

    .line 3
    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzjw;-><init>(Lcom/google/android/gms/measurement/internal/zzjy;)V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjy;->zzb:Lcom/google/android/gms/measurement/internal/zzjw;

    new-instance p1, Lcom/google/android/gms/measurement/internal/zzju;

    .line 4
    invoke-direct {p1, p0}, Lcom/google/android/gms/measurement/internal/zzju;-><init>(Lcom/google/android/gms/measurement/internal/zzjy;)V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjy;->zzc:Lcom/google/android/gms/measurement/internal/zzju;

    return-void
.end method

.method static bridge synthetic zzh(Lcom/google/android/gms/measurement/internal/zzjy;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/zzjy;->zzd:Landroid/os/Handler;

    return-object p0
.end method

.method static bridge synthetic zzi(Lcom/google/android/gms/measurement/internal/zzjy;)V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzjy;->zzm()V

    return-void
.end method

.method static bridge synthetic zzj(Lcom/google/android/gms/measurement/internal/zzjy;J)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzjy;->zzm()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "Activity paused, time"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjy;->zzc:Lcom/google/android/gms/measurement/internal/zzju;

    .line 5
    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzju;->zza(J)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaf;->zzu()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/zzjy;->zzb:Lcom/google/android/gms/measurement/internal/zzjw;

    .line 8
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzjw;->zzb(J)V

    :cond_0
    return-void
.end method

.method static bridge synthetic zzl(Lcom/google/android/gms/measurement/internal/zzjy;J)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    .line 2
    invoke-direct {p0}, Lcom/google/android/gms/measurement/internal/zzjy;->zzm()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "Activity resumed, time"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaf;->zzu()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzm()Lcom/google/android/gms/measurement/internal/zzex;

    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzex;->zzl:Lcom/google/android/gms/measurement/internal/zzer;

    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzer;->zzb()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjy;->zzb:Lcom/google/android/gms/measurement/internal/zzjw;

    .line 9
    invoke-virtual {v0, p1, p2}, Lcom/google/android/gms/measurement/internal/zzjw;->zzc(J)V

    :cond_1
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjy;->zzc:Lcom/google/android/gms/measurement/internal/zzju;

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzju;->zzb()V

    iget-object p0, p0, Lcom/google/android/gms/measurement/internal/zzjy;->zza:Lcom/google/android/gms/measurement/internal/zzjx;

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjx;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    .line 11
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjx;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzjy;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 12
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzJ()Z

    move-result p1

    if-nez p1, :cond_2

    return-void

    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjx;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 13
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object p1

    .line 14
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide p1

    const/4 v0, 0x0

    .line 15
    invoke-virtual {p0, p1, p2, v0}, Lcom/google/android/gms/measurement/internal/zzjx;->zzb(JZ)V

    return-void
.end method

.method private final zzm()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjy;->zzd:Landroid/os/Handler;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/measurement/zzby;

    .line 2
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/measurement/zzby;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjy;->zzd:Landroid/os/Handler;

    :cond_0
    return-void
.end method


# virtual methods
.method protected final zzf()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
