.class final Lcom/google/android/gms/measurement/internal/zziv;
.super Lcom/google/android/gms/measurement/internal/zzam;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzjj;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzjj;Lcom/google/android/gms/measurement/internal/zzgn;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zziv;->zza:Lcom/google/android/gms/measurement/internal/zzjj;

    .line 1
    invoke-direct {p0, p2}, Lcom/google/android/gms/measurement/internal/zzam;-><init>(Lcom/google/android/gms/measurement/internal/zzgn;)V

    return-void
.end method


# virtual methods
.method public final zzc()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zziv;->zza:Lcom/google/android/gms/measurement/internal/zzjj;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zzgl;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzay()Lcom/google/android/gms/measurement/internal/zzei;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzei;->zzk()Lcom/google/android/gms/measurement/internal/zzeg;

    move-result-object v0

    const-string v1, "Tasks have been queued for a long time"

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzeg;->zza(Ljava/lang/String;)V

    return-void
.end method
