.class public final synthetic Lcom/google/android/gms/measurement/internal/zzjs;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/measurement/internal/zzjt;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/measurement/internal/zzjt;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjs;->zza:Lcom/google/android/gms/measurement/internal/zzjt;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjs;->zza:Lcom/google/android/gms/measurement/internal/zzjt;

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzjt;->zzc:Lcom/google/android/gms/measurement/internal/zzju;

    iget-wide v5, v0, Lcom/google/android/gms/measurement/internal/zzjt;->zza:J

    iget-wide v2, v0, Lcom/google/android/gms/measurement/internal/zzjt;->zzb:J

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v4, "Application going to the background"

    invoke-virtual {v0, v4}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzm()Lcom/google/android/gms/measurement/internal/zzex;

    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzex;->zzl:Lcom/google/android/gms/measurement/internal/zzer;

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Lcom/google/android/gms/measurement/internal/zzer;->zza(Z)V

    new-instance v7, Landroid/os/Bundle;

    .line 6
    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 7
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    .line 8
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzaf;->zzu()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzjy;->zzb:Lcom/google/android/gms/measurement/internal/zzjw;

    .line 9
    invoke-virtual {v0, v2, v3}, Lcom/google/android/gms/measurement/internal/zzjw;->zzb(J)V

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 10
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    move-result-object v0

    const/4 v8, 0x0

    .line 11
    sget-object v9, Lcom/google/android/gms/measurement/internal/zzdw;->zzag:Lcom/google/android/gms/measurement/internal/zzdv;

    invoke-virtual {v0, v8, v9}, Lcom/google/android/gms/measurement/internal/zzaf;->zzs(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzdv;)Z

    move-result v0

    const/4 v8, 0x0

    if-eqz v0, :cond_0

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzjy;->zzb:Lcom/google/android/gms/measurement/internal/zzjw;

    iget-wide v9, v0, Lcom/google/android/gms/measurement/internal/zzjw;->zzb:J

    iput-wide v2, v0, Lcom/google/android/gms/measurement/internal/zzjw;->zzb:J

    sub-long v9, v2, v9

    const-string v0, "_et"

    .line 12
    invoke-virtual {v7, v0, v9, v10}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zze;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 13
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzs()Lcom/google/android/gms/measurement/internal/zzij;

    move-result-object v0

    .line 14
    invoke-virtual {v0, v4}, Lcom/google/android/gms/measurement/internal/zzij;->zzj(Z)Lcom/google/android/gms/measurement/internal/zzic;

    move-result-object v0

    .line 15
    invoke-static {v0, v7, v4}, Lcom/google/android/gms/measurement/internal/zzku;->zzJ(Lcom/google/android/gms/measurement/internal/zzic;Landroid/os/Bundle;Z)V

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzjy;->zzb:Lcom/google/android/gms/measurement/internal/zzjw;

    .line 16
    invoke-virtual {v0, v8, v4, v2, v3}, Lcom/google/android/gms/measurement/internal/zzjw;->zzd(ZZJ)Z

    :cond_1
    iget-object v0, v1, Lcom/google/android/gms/measurement/internal/zzju;->zza:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zze;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 17
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzq()Lcom/google/android/gms/measurement/internal/zzhv;

    move-result-object v2

    const-string v3, "auto"

    const-string v4, "_ab"

    .line 18
    invoke-virtual/range {v2 .. v7}, Lcom/google/android/gms/measurement/internal/zzhv;->zzG(Ljava/lang/String;Ljava/lang/String;JLandroid/os/Bundle;)V

    return-void
.end method
