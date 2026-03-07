.class final Lcom/google/android/gms/measurement/internal/zzfv;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzab;

.field final synthetic zzb:Lcom/google/android/gms/measurement/internal/zzgk;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzgk;Lcom/google/android/gms/measurement/internal/zzab;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzfv;->zzb:Lcom/google/android/gms/measurement/internal/zzgk;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzfv;->zza:Lcom/google/android/gms/measurement/internal/zzab;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzfv;->zzb:Lcom/google/android/gms/measurement/internal/zzgk;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzc(Lcom/google/android/gms/measurement/internal/zzgk;)Lcom/google/android/gms/measurement/internal/zzkn;

    move-result-object v0

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzA()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzfv;->zza:Lcom/google/android/gms/measurement/internal/zzab;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzab;->zzc:Lcom/google/android/gms/measurement/internal/zzkq;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkq;->zza()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzfv;->zzb:Lcom/google/android/gms/measurement/internal/zzgk;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzc(Lcom/google/android/gms/measurement/internal/zzgk;)Lcom/google/android/gms/measurement/internal/zzkn;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzfv;->zza:Lcom/google/android/gms/measurement/internal/zzab;

    .line 3
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzM(Lcom/google/android/gms/measurement/internal/zzab;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzfv;->zzb:Lcom/google/android/gms/measurement/internal/zzgk;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzc(Lcom/google/android/gms/measurement/internal/zzgk;)Lcom/google/android/gms/measurement/internal/zzkn;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzfv;->zza:Lcom/google/android/gms/measurement/internal/zzab;

    .line 4
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzR(Lcom/google/android/gms/measurement/internal/zzab;)V

    return-void
.end method
