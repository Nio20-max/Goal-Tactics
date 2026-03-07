.class final Lcom/google/android/gms/measurement/internal/zziu;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzat;

.field final synthetic zzb:Ljava/lang/String;

.field final synthetic zzc:Lcom/google/android/gms/internal/measurement/zzcf;

.field final synthetic zzd:Lcom/google/android/gms/measurement/internal/zzjj;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzjj;Lcom/google/android/gms/measurement/internal/zzat;Ljava/lang/String;Lcom/google/android/gms/internal/measurement/zzcf;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzd:Lcom/google/android/gms/measurement/internal/zzjj;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zziu;->zza:Lcom/google/android/gms/measurement/internal/zzat;

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzb:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzc:Lcom/google/android/gms/internal/measurement/zzcf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzd:Lcom/google/android/gms/measurement/internal/zzjj;

    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzjj;->zzh(Lcom/google/android/gms/measurement/internal/zzjj;)Lcom/google/android/gms/measurement/internal/zzdz;

    move-result-object v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzd:Lcom/google/android/gms/measurement/internal/zzjj;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v1

    .line 2
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v1

    const-string v2, "Discarding data. Failed to send event to service to bundle"

    .line 3
    invoke-virtual {v1, v2}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzd:Lcom/google/android/gms/measurement/internal/zzjj;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 4
    :goto_0
    invoke-virtual {v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzc:Lcom/google/android/gms/internal/measurement/zzcf;

    .line 5
    invoke-virtual {v1, v2, v0}, Lcom/google/android/gms/measurement/internal/zzku;->zzR(Lcom/google/android/gms/internal/measurement/zzcf;[B)V

    return-void

    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zziu;->zza:Lcom/google/android/gms/measurement/internal/zzat;

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzb:Ljava/lang/String;

    .line 6
    invoke-interface {v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzdz;->zzu(Lcom/google/android/gms/measurement/internal/zzat;Ljava/lang/String;)[B

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzd:Lcom/google/android/gms/measurement/internal/zzjj;

    .line 7
    invoke-static {v1}, Lcom/google/android/gms/measurement/internal/zzjj;->zzp(Lcom/google/android/gms/measurement/internal/zzjj;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzd:Lcom/google/android/gms/measurement/internal/zzjj;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    .line 5
    :try_start_2
    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzd:Lcom/google/android/gms/measurement/internal/zzjj;

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 8
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v2

    .line 9
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzei;->zzd()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v2

    const-string v3, "Failed to send event to the service to bundle"

    invoke-virtual {v2, v3, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzd:Lcom/google/android/gms/measurement/internal/zzjj;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    goto :goto_0

    .line 5
    :goto_1
    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzd:Lcom/google/android/gms/measurement/internal/zzjj;

    iget-object v2, v2, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 4
    invoke-virtual {v2}, Lcom/google/android/gms/measurement/internal/zzfs;->zzv()Lcom/google/android/gms/measurement/internal/zzku;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zziu;->zzc:Lcom/google/android/gms/internal/measurement/zzcf;

    .line 5
    invoke-virtual {v2, v3, v0}, Lcom/google/android/gms/measurement/internal/zzku;->zzR(Lcom/google/android/gms/internal/measurement/zzcf;[B)V

    .line 10
    throw v1
.end method
