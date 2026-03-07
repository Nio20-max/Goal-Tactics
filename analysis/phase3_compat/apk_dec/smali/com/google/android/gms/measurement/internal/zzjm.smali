.class public final synthetic Lcom/google/android/gms/measurement/internal/zzjm;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/measurement/internal/zzjp;

.field public final synthetic zzb:Lcom/google/android/gms/measurement/internal/zzei;

.field public final synthetic zzc:Landroid/app/job/JobParameters;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/measurement/internal/zzjp;Lcom/google/android/gms/measurement/internal/zzei;Landroid/app/job/JobParameters;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzjm;->zza:Lcom/google/android/gms/measurement/internal/zzjp;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzjm;->zzb:Lcom/google/android/gms/measurement/internal/zzei;

    iput-object p3, p0, Lcom/google/android/gms/measurement/internal/zzjm;->zzc:Landroid/app/job/JobParameters;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzjm;->zza:Lcom/google/android/gms/measurement/internal/zzjp;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzjm;->zzb:Lcom/google/android/gms/measurement/internal/zzei;

    iget-object v2, p0, Lcom/google/android/gms/measurement/internal/zzjm;->zzc:Landroid/app/job/JobParameters;

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/measurement/internal/zzjp;->zzd(Lcom/google/android/gms/measurement/internal/zzei;Landroid/app/job/JobParameters;)V

    return-void
.end method
