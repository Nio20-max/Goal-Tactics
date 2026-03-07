.class final Lcom/google/android/gms/measurement/internal/zzig;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:J

.field final synthetic zzb:Lcom/google/android/gms/measurement/internal/zzij;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzij;J)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzig;->zzb:Lcom/google/android/gms/measurement/internal/zzij;

    iput-wide p2, p0, Lcom/google/android/gms/measurement/internal/zzig;->zza:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzig;->zzb:Lcom/google/android/gms/measurement/internal/zzij;

    iget-object v0, v0, Lcom/google/android/gms/measurement/internal/zze;->zzs:Lcom/google/android/gms/measurement/internal/zzfs;

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzfs;->zzd()Lcom/google/android/gms/measurement/internal/zzd;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/gms/measurement/internal/zzig;->zza:J

    .line 2
    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzd;->zzf(J)V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzig;->zzb:Lcom/google/android/gms/measurement/internal/zzij;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/google/android/gms/measurement/internal/zzij;->zza:Lcom/google/android/gms/measurement/internal/zzic;

    return-void
.end method
