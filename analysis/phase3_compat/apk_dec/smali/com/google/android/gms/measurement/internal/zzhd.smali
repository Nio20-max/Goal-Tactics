.class final Lcom/google/android/gms/measurement/internal/zzhd;
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

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzhd;->zzb:Lcom/google/android/gms/measurement/internal/zzhv;

    iput-wide p2, p0, Lcom/google/android/gms/measurement/internal/zzhd;->zza:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzhd;->zzb:Lcom/google/android/gms/measurement/internal/zzhv;

    iget-wide v1, p0, Lcom/google/android/gms/measurement/internal/zzhd;->zza:J

    const/4 v3, 0x1

    .line 1
    invoke-virtual {v0, v1, v2, v3}, Lcom/google/android/gms/measurement/internal/zzhv;->zzK(JZ)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzhd;->zzb:Lcom/google/android/gms/measurement/internal/zzhv;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zze;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzt()Lcom/google/android/gms/measurement/internal/zzjj;

    move-result-object v0

    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 3
    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzjj;->zzu(Ljava/util/concurrent/atomic/AtomicReference;)V

    return-void
.end method
