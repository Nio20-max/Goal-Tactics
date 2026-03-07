.class final Lcom/google/android/gms/measurement/internal/zzie;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzic;

.field final synthetic zzb:Lcom/google/android/gms/measurement/internal/zzic;

.field final synthetic zzc:J

.field final synthetic zzd:Z

.field final synthetic zze:Lcom/google/android/gms/measurement/internal/zzij;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzij;Lcom/google/android/gms/measurement/internal/zzic;Lcom/google/android/gms/measurement/internal/zzic;JZ)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzie;->zze:Lcom/google/android/gms/measurement/internal/zzij;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzie;->zza:Lcom/google/android/gms/measurement/internal/zzic;

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzb:Lcom/google/android/gms/measurement/internal/zzic;

    iput-wide p4, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzc:J

    iput-boolean p6, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzd:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzie;->zze:Lcom/google/android/gms/measurement/internal/zzij;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzie;->zza:Lcom/google/android/gms/measurement/internal/zzic;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzb:Lcom/google/android/gms/measurement/internal/zzic;

    iget-wide v3, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzc:J

    iget-boolean v5, p0, Lcom/google/android/gms/measurement/internal/zzie;->zzd:Z

    const/4 v6, 0x0

    .line 1
    invoke-static/range {v0 .. v6}, Lcom/google/android/gms/measurement/internal/zzij;->zzo(Lcom/google/android/gms/measurement/internal/zzij;Lcom/google/android/gms/measurement/internal/zzic;Lcom/google/android/gms/measurement/internal/zzic;JZLandroid/os/Bundle;)V

    return-void
.end method
