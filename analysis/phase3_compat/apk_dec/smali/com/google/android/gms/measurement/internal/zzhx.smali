.class public final synthetic Lcom/google/android/gms/measurement/internal/zzhx;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/measurement/internal/zzhy;

.field public final synthetic zzb:I

.field public final synthetic zzc:Ljava/lang/Exception;

.field public final synthetic zzd:[B

.field public final synthetic zze:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/measurement/internal/zzhy;ILjava/lang/Exception;[BLjava/util/Map;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzhx;->zza:Lcom/google/android/gms/measurement/internal/zzhy;

    iput p2, p0, Lcom/google/android/gms/measurement/internal/zzhx;->zzb:I

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzhx;->zzc:Ljava/lang/Exception;

    iput-object p4, p0, Lcom/google/android/gms/measurement/internal/zzhx;->zzd:[B

    iput-object p5, p0, Lcom/google/android/gms/measurement/internal/zzhx;->zze:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzhx;->zza:Lcom/google/android/gms/measurement/internal/zzhy;

    iget v1, p0, Lcom/google/android/gms/measurement/internal/zzhx;->zzb:I

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzhx;->zzc:Ljava/lang/Exception;

    iget-object v3, p0, Lcom/google/android/gms/measurement/internal/zzhx;->zzd:[B

    iget-object v4, p0, Lcom/google/android/gms/measurement/internal/zzhx;->zze:Ljava/util/Map;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/gms/measurement/internal/zzhy;->zza(ILjava/lang/Exception;[BLjava/util/Map;)V

    return-void
.end method
