.class abstract Lcom/google/android/gms/internal/measurement/zzku;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-base@@19.0.1"


# static fields
.field private static final zza:Lcom/google/android/gms/internal/measurement/zzku;

.field private static final zzb:Lcom/google/android/gms/internal/measurement/zzku;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/gms/internal/measurement/zzkq;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/measurement/zzkq;-><init>(Lcom/google/android/gms/internal/measurement/zzkp;)V

    sput-object v0, Lcom/google/android/gms/internal/measurement/zzku;->zza:Lcom/google/android/gms/internal/measurement/zzku;

    new-instance v0, Lcom/google/android/gms/internal/measurement/zzks;

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/measurement/zzks;-><init>(Lcom/google/android/gms/internal/measurement/zzkr;)V

    sput-object v0, Lcom/google/android/gms/internal/measurement/zzku;->zzb:Lcom/google/android/gms/internal/measurement/zzku;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/gms/internal/measurement/zzkt;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static zzc()Lcom/google/android/gms/internal/measurement/zzku;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/measurement/zzku;->zza:Lcom/google/android/gms/internal/measurement/zzku;

    return-object v0
.end method

.method static zzd()Lcom/google/android/gms/internal/measurement/zzku;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/measurement/zzku;->zzb:Lcom/google/android/gms/internal/measurement/zzku;

    return-object v0
.end method


# virtual methods
.method abstract zza(Ljava/lang/Object;J)V
.end method

.method abstract zzb(Ljava/lang/Object;Ljava/lang/Object;J)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L:Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "J)V"
        }
    .end annotation
.end method
