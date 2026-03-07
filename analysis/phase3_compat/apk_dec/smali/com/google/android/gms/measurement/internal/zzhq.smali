.class final Lcom/google/android/gms/measurement/internal/zzhq;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzag;

.field final synthetic zzb:I

.field final synthetic zzc:J

.field final synthetic zzd:Z

.field final synthetic zze:Lcom/google/android/gms/measurement/internal/zzhv;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzhv;Lcom/google/android/gms/measurement/internal/zzag;IJZ)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzhq;->zze:Lcom/google/android/gms/measurement/internal/zzhv;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzhq;->zza:Lcom/google/android/gms/measurement/internal/zzag;

    iput p3, p0, Lcom/google/android/gms/measurement/internal/zzhq;->zzb:I

    iput-wide p4, p0, Lcom/google/android/gms/measurement/internal/zzhq;->zzc:J

    iput-boolean p6, p0, Lcom/google/android/gms/measurement/internal/zzhq;->zzd:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzhq;->zze:Lcom/google/android/gms/measurement/internal/zzhv;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzhq;->zza:Lcom/google/android/gms/measurement/internal/zzag;

    .line 1
    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzhv;->zzU(Lcom/google/android/gms/measurement/internal/zzag;)V

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzhq;->zze:Lcom/google/android/gms/measurement/internal/zzhv;

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzhq;->zza:Lcom/google/android/gms/measurement/internal/zzag;

    iget v4, p0, Lcom/google/android/gms/measurement/internal/zzhq;->zzb:I

    iget-wide v5, p0, Lcom/google/android/gms/measurement/internal/zzhq;->zzc:J

    iget-boolean v8, p0, Lcom/google/android/gms/measurement/internal/zzhq;->zzd:Z

    const/4 v7, 0x0

    .line 2
    invoke-static/range {v2 .. v8}, Lcom/google/android/gms/measurement/internal/zzhv;->zzv(Lcom/google/android/gms/measurement/internal/zzhv;Lcom/google/android/gms/measurement/internal/zzag;IJZZ)V

    return-void
.end method
