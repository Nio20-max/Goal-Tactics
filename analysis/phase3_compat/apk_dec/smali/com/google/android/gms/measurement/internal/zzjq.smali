.class final Lcom/google/android/gms/measurement/internal/zzjq;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:J

.field final synthetic zzb:Lcom/google/android/gms/measurement/internal/zzjy;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzjy;J)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjq;->zzb:Lcom/google/android/gms/measurement/internal/zzjy;

    iput-wide p2, p0, Lcom/google/android/gms/measurement/internal/zzjq;->zza:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjq;->zzb:Lcom/google/android/gms/measurement/internal/zzjy;

    iget-wide v1, p0, Lcom/google/android/gms/measurement/internal/zzjq;->zza:J

    .line 1
    invoke-static {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzjy;->zzl(Lcom/google/android/gms/measurement/internal/zzjy;J)V

    return-void
.end method
