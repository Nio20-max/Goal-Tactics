.class Lcom/google/android/gms/measurement/internal/zzkc;
.super Lcom/google/android/gms/measurement/internal/zzgl;
.source "com.google.android.gms:play-services-measurement@@19.0.1"

# interfaces
.implements Lcom/google/android/gms/measurement/internal/zzgn;


# instance fields
.field protected final zzf:Lcom/google/android/gms/measurement/internal/zzkn;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzkn;)V
    .locals 1

    invoke-virtual {p1}, Lcom/google/android/gms/measurement/internal/zzkn;->zzq()Lcom/google/android/gms/measurement/internal/zzfs;

    move-result-object v0

    .line 1
    invoke-direct {p0, v0}, Lcom/google/android/gms/measurement/internal/zzgl;-><init>(Lcom/google/android/gms/measurement/internal/zzfs;)V

    .line 2
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzkc;->zzf:Lcom/google/android/gms/measurement/internal/zzkn;

    return-void
.end method
