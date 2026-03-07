.class final Lcom/google/android/gms/measurement/internal/zzgj;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Ljava/lang/String;

.field final synthetic zzb:Ljava/lang/String;

.field final synthetic zzc:Ljava/lang/String;

.field final synthetic zzd:J

.field final synthetic zze:Lcom/google/android/gms/measurement/internal/zzgk;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzgk;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzgj;->zze:Lcom/google/android/gms/measurement/internal/zzgk;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgj;->zza:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzgj;->zzb:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/measurement/internal/zzgj;->zzc:Ljava/lang/String;

    iput-wide p5, p0, Lcom/google/android/gms/measurement/internal/zzgj;->zzd:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgj;->zza:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgj;->zze:Lcom/google/android/gms/measurement/internal/zzgk;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzc(Lcom/google/android/gms/measurement/internal/zzgk;)Lcom/google/android/gms/measurement/internal/zzkn;

    move-result-object v0

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzq()Lcom/google/android/gms/measurement/internal/zzfs;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzs()Lcom/google/android/gms/measurement/internal/zzij;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzgj;->zzb:Ljava/lang/String;

    const/4 v2, 0x0

    .line 3
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzij;->zzy(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzic;)V

    return-void

    :cond_0
    new-instance v1, Lcom/google/android/gms/measurement/internal/zzic;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzgj;->zzc:Ljava/lang/String;

    iget-wide v3, p0, Lcom/google/android/gms/measurement/internal/zzgj;->zzd:J

    .line 4
    invoke-direct {v1, v2, v0, v3, v4}, Lcom/google/android/gms/measurement/internal/zzic;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgj;->zze:Lcom/google/android/gms/measurement/internal/zzgk;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzc(Lcom/google/android/gms/measurement/internal/zzgk;)Lcom/google/android/gms/measurement/internal/zzkn;

    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzq()Lcom/google/android/gms/measurement/internal/zzfs;

    move-result-object v0

    .line 6
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzs()Lcom/google/android/gms/measurement/internal/zzij;

    move-result-object v0

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzgj;->zzb:Ljava/lang/String;

    .line 7
    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzij;->zzy(Ljava/lang/String;Lcom/google/android/gms/measurement/internal/zzic;)V

    return-void
.end method
