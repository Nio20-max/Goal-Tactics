.class final Lcom/google/android/gms/measurement/internal/zzif;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic zza:Lcom/google/android/gms/measurement/internal/zzij;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzij;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzif;->zza:Lcom/google/android/gms/measurement/internal/zzij;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzif;->zza:Lcom/google/android/gms/measurement/internal/zzij;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzij;->zzh(Lcom/google/android/gms/measurement/internal/zzij;)Lcom/google/android/gms/measurement/internal/zzic;

    move-result-object v1

    iput-object v1, v0, Lcom/google/android/gms/measurement/internal/zzij;->zza:Lcom/google/android/gms/measurement/internal/zzic;

    return-void
.end method
