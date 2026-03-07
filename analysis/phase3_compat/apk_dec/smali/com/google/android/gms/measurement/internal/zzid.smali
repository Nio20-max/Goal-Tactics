.class final Lcom/google/android/gms/measurement/internal/zzid;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Landroid/os/Bundle;

.field final synthetic zzb:Lcom/google/android/gms/measurement/internal/zzic;

.field final synthetic zzc:Lcom/google/android/gms/measurement/internal/zzic;

.field final synthetic zzd:J

.field final synthetic zze:Lcom/google/android/gms/measurement/internal/zzij;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzij;Landroid/os/Bundle;Lcom/google/android/gms/measurement/internal/zzic;Lcom/google/android/gms/measurement/internal/zzic;J)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzid;->zze:Lcom/google/android/gms/measurement/internal/zzij;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzid;->zza:Landroid/os/Bundle;

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzid;->zzb:Lcom/google/android/gms/measurement/internal/zzic;

    iput-object p4, p0, Lcom/google/android/gms/measurement/internal/zzid;->zzc:Lcom/google/android/gms/measurement/internal/zzic;

    iput-wide p5, p0, Lcom/google/android/gms/measurement/internal/zzid;->zzd:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzid;->zze:Lcom/google/android/gms/measurement/internal/zzij;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzid;->zza:Landroid/os/Bundle;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzid;->zzb:Lcom/google/android/gms/measurement/internal/zzic;

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzid;->zzc:Lcom/google/android/gms/measurement/internal/zzic;

    iget-wide v4, p0, Lcom/google/android/gms/measurement/internal/zzid;->zzd:J

    .line 1
    invoke-static/range {v0 .. v5}, Lcom/google/android/gms/measurement/internal/zzij;->zzp(Lcom/google/android/gms/measurement/internal/zzij;Landroid/os/Bundle;Lcom/google/android/gms/measurement/internal/zzic;Lcom/google/android/gms/measurement/internal/zzic;J)V

    return-void
.end method
