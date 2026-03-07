.class final Lcom/google/android/gms/measurement/internal/zzhi;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Ljava/util/concurrent/atomic/AtomicReference;

.field final synthetic zzb:Ljava/lang/String;

.field final synthetic zzc:Ljava/lang/String;

.field final synthetic zzd:Z

.field final synthetic zze:Lcom/google/android/gms/measurement/internal/zzhv;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzhv;Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzhi;->zze:Lcom/google/android/gms/measurement/internal/zzhv;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzhi;->zza:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p4, p0, Lcom/google/android/gms/measurement/internal/zzhi;->zzb:Ljava/lang/String;

    iput-object p5, p0, Lcom/google/android/gms/measurement/internal/zzhi;->zzc:Ljava/lang/String;

    iput-boolean p6, p0, Lcom/google/android/gms/measurement/internal/zzhi;->zzd:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzhi;->zze:Lcom/google/android/gms/measurement/internal/zzhv;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzhv;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzt()Lcom/google/android/gms/measurement/internal/zzjj;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzhi;->zza:Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzhi;->zzb:Ljava/lang/String;

    iget-object v5, p0, Lcom/google/android/gms/measurement/internal/zzhi;->zzc:Ljava/lang/String;

    iget-boolean v6, p0, Lcom/google/android/gms/measurement/internal/zzhi;->zzd:Z

    const/4 v3, 0x0

    .line 2
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/gms/measurement/internal/zzjj;->zzz(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method
