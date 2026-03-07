.class final Lcom/google/android/gms/measurement/internal/zzjw;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"


# instance fields
.field protected zza:J

.field protected zzb:J

.field final synthetic zzc:Lcom/google/android/gms/measurement/internal/zzjy;

.field private final zzd:Lcom/google/android/gms/measurement/internal/zzam;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/measurement/internal/zzjy;)V
    .locals 2

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/android/gms/measurement/internal/zzjv;

    iget-object v1, p1, Lcom/google/android/gms/measurement/internal/zzjy;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-direct {v0, p0, v1}, Lcom/google/android/gms/measurement/internal/zzjv;-><init>(Lcom/google/android/gms/measurement/internal/zzjw;Lcom/google/android/gms/measurement/internal/zzgn;)V

    iput-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzd:Lcom/google/android/gms/measurement/internal/zzam;

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object p1

    .line 3
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zza:J

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzb:J

    return-void
.end method


# virtual methods
.method final zza()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzd:Lcom/google/android/gms/measurement/internal/zzam;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzb()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zza:J

    iput-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzb:J

    return-void
.end method

.method final zzb(J)V
    .locals 0

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzd:Lcom/google/android/gms/measurement/internal/zzam;

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzb()V

    return-void
.end method

.method final zzc(J)V
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzd:Lcom/google/android/gms/measurement/internal/zzam;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzam;->zzb()V

    iput-wide p1, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zza:J

    iput-wide p1, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzb:J

    return-void
.end method

.method public final zzd(ZZJ)Z
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzf;->zza()V

    .line 3
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzoh;->zzc()Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    .line 5
    sget-object v1, Lcom/google/android/gms/measurement/internal/zzdw;->zzaj:Lcom/google/android/gms/measurement/internal/zzdv;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzjy;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 9
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzJ()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzm()Lcom/google/android/gms/measurement/internal/zzex;

    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzex;->zzj:Lcom/google/android/gms/measurement/internal/zzet;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 12
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    goto :goto_0

    .line 33
    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzm()Lcom/google/android/gms/measurement/internal/zzex;

    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzex;->zzj:Lcom/google/android/gms/measurement/internal/zzet;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 8
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzav()Lcom/google/android/gms/common/util/Clock;

    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    .line 11
    :cond_1
    :goto_0
    iget-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zza:J

    sub-long v0, p3, v0

    if-nez p1, :cond_3

    const-wide/16 v3, 0x3e8

    cmp-long p1, v0, v3

    if-ltz p1, :cond_2

    goto :goto_1

    .line 30
    :cond_2
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 31
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p1

    .line 32
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p1

    .line 33
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    const-string p3, "Screen exposed for less than 1000 ms. Event not sent. time"

    invoke-virtual {p1, p3, p2}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    return p1

    :cond_3
    :goto_1
    if-nez p2, :cond_4

    .line 11
    iget-wide v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzb:J

    sub-long v0, p3, v0

    iput-wide p3, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzb:J

    :cond_4
    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object p1, p1, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 13
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzei;->zzj()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object p1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string v4, "Recording user engagement, ms"

    invoke-virtual {p1, v4, v3}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Landroid/os/Bundle;

    .line 15
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v3, "_et"

    .line 16
    invoke-virtual {p1, v3, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 17
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaf;->zzu()Z

    move-result v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zze;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 19
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzs()Lcom/google/android/gms/measurement/internal/zzij;

    move-result-object v1

    const/4 v3, 0x1

    xor-int/2addr v0, v3

    .line 20
    invoke-virtual {v1, v0}, Lcom/google/android/gms/measurement/internal/zzij;->zzj(Z)Lcom/google/android/gms/measurement/internal/zzic;

    move-result-object v0

    .line 21
    invoke-static {v0, p1, v3}, Lcom/google/android/gms/measurement/internal/zzku;->zzJ(Lcom/google/android/gms/measurement/internal/zzic;Landroid/os/Bundle;Z)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 22
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/measurement/internal/zzdw;->zzT:Lcom/google/android/gms/measurement/internal/zzdv;

    .line 23
    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v0

    if-nez v0, :cond_5

    if-eqz p2, :cond_5

    const-wide/16 v0, 0x1

    const-string v4, "_fr"

    .line 24
    invoke-virtual {p1, v4, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 25
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    sget-object v1, Lcom/google/android/gms/measurement/internal/zzdw;->zzT:Lcom/google/android/gms/measurement/internal/zzdv;

    .line 26
    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v0

    if-eqz v0, :cond_6

    if-nez p2, :cond_7

    :cond_6
    iget-object p2, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzc:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object p2, p2, Lcom/google/android/gms/measurement/internal/zze;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 27
    invoke-virtual {p2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzq()Lcom/google/android/gms/measurement/internal/zzhv;

    move-result-object p2

    const-string v0, "auto"

    const-string v1, "_e"

    .line 28
    invoke-virtual {p2, v0, v1, p1}, Lcom/google/android/gms/measurement/internal/zzhv;->zzF(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_7
    iput-wide p3, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zza:J

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzd:Lcom/google/android/gms/measurement/internal/zzam;

    .line 29
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzam;->zzb()V

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjw;->zzd:Lcom/google/android/gms/measurement/internal/zzam;

    const-wide/32 p2, 0x36ee80

    .line 30
    invoke-virtual {p1, p2, p3}, Lcom/google/android/gms/measurement/internal/zzam;->zzd(J)V

    return v3
.end method
