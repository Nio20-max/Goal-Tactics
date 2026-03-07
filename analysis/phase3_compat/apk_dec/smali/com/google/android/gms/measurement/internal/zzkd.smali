.class abstract Lcom/google/android/gms/measurement/internal/zzkd;
.super Lcom/google/android/gms/measurement/internal/zzkc;
.source "com.google.android.gms:play-services-measurement@@19.0.1"


# instance fields
.field private zza:Z


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzkn;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/google/android/gms/measurement/internal/zzkc;-><init>(Lcom/google/android/gms/measurement/internal/zzkn;)V

    iget-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkd;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 2
    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzL()V

    return-void
.end method


# virtual methods
.method protected final zzY()V
    .locals 2

    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkd;->zzaa()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not initialized"

    .line 1
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final zzZ()V
    .locals 2

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzkd;->zza:Z

    if-nez v0, :cond_0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/gms/measurement/internal/zzkd;->zzb()Z

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzkd;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    .line 3
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzG()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzkd;->zza:Z

    return-void

    .line 0
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Can\'t initialize twice"

    .line 1
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method final zzaa()Z
    .locals 1

    iget-boolean v0, p0, Lcom/google/android/gms/measurement/internal/zzkd;->zza:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected abstract zzb()Z
.end method
