.class final Lcom/google/android/gms/measurement/internal/zzfr;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzgu;

.field final synthetic zzb:Lcom/google/android/gms/measurement/internal/zzfs;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzfs;Lcom/google/android/gms/measurement/internal/zzgu;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzfr;->zzb:Lcom/google/android/gms/measurement/internal/zzfs;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzfr;->zza:Lcom/google/android/gms/measurement/internal/zzgu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzfr;->zzb:Lcom/google/android/gms/measurement/internal/zzfs;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzfr;->zza:Lcom/google/android/gms/measurement/internal/zzgu;

    .line 1
    invoke-static {v0, v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzA(Lcom/google/android/gms/measurement/internal/zzfs;Lcom/google/android/gms/measurement/internal/zzgu;)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzfr;->zzb:Lcom/google/android/gms/measurement/internal/zzfs;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzfr;->zza:Lcom/google/android/gms/measurement/internal/zzgu;

    iget-object v1, v1, Lcom/google/android/gms/measurement/internal/zzgu;->zzg:Lcom/google/android/gms/internal/measurement/zzcl;

    .line 2
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzfs;->zzH(Lcom/google/android/gms/internal/measurement/zzcl;)V

    return-void
.end method
