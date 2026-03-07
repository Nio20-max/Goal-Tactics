.class public final synthetic Lcom/google/android/gms/measurement/internal/zzgv;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/measurement/internal/zzhv;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/measurement/internal/zzhv;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzgv;->zza:Lcom/google/android/gms/measurement/internal/zzhv;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgv;->zza:Lcom/google/android/gms/measurement/internal/zzhv;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzgl;->zzg()V

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 2
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzm()Lcom/google/android/gms/measurement/internal/zzex;

    move-result-object v1

    .line 3
    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzex;->zzm:Lcom/google/android/gms/measurement/internal/zzer;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzer;->zzb()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 4
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzm()Lcom/google/android/gms/measurement/internal/zzex;

    move-result-object v1

    .line 5
    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzex;->zzn:Lcom/google/android/gms/measurement/internal/zzet;

    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzet;->zza()J

    move-result-wide v1

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 6
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzm()Lcom/google/android/gms/measurement/internal/zzex;

    move-result-object v3

    .line 7
    iget-object v3, v3, Lcom/google/android/gms/measurement/internal/zzex;->zzn:Lcom/google/android/gms/measurement/internal/zzet;

    const-wide/16 v4, 0x1

    add-long/2addr v4, v1

    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    iget-object v3, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 8
    invoke-virtual {v3}, Lcom/google/android/gms/measurement/internal/zzfs;->zzf()Lcom/google/android/gms/measurement/internal/zzaf;

    const-wide/16 v3, 0x5

    cmp-long v5, v1, v3

    if-ltz v5, :cond_0

    iget-object v1, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 9
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    .line 10
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v2, "Permanently failed to retrieve Deferred Deep Link. Reached maximum retries."

    .line 11
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 12
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzm()Lcom/google/android/gms/measurement/internal/zzex;

    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzex;->zzm:Lcom/google/android/gms/measurement/internal/zzer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzer;->zza(Z)V

    return-void

    :cond_0
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzhv;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 14
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzE()V

    return-void

    :cond_1
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 15
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v1, "Deferred Deep Link already retrieved. Not fetching again."

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    return-void
.end method
