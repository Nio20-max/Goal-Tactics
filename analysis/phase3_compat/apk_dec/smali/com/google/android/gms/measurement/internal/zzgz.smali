.class final Lcom/google/android/gms/measurement/internal/zzgz;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:J

.field final synthetic zzb:Lcom/google/android/gms/measurement/internal/zzhv;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzhv;J)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzgz;->zzb:Lcom/google/android/gms/measurement/internal/zzhv;

    iput-wide p2, p0, Lcom/google/android/gms/measurement/internal/zzgz;->zza:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgz;->zzb:Lcom/google/android/gms/measurement/internal/zzhv;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzm()Lcom/google/android/gms/measurement/internal/zzex;

    move-result-object v0

    .line 2
    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzex;->zzf:Lcom/google/android/gms/measurement/internal/zzet;

    iget-wide v1, p0, Lcom/google/android/gms/measurement/internal/zzgz;->zza:J

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzet;->zzb(J)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgz;->zzb:Lcom/google/android/gms/measurement/internal/zzhv;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 4
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzc()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/gms/measurement/internal/zzgz;->zza:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "Session timeout duration set"

    invoke-virtual {v0, v2, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zzb(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
