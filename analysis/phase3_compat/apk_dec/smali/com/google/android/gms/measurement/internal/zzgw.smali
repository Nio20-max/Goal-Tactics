.class public final synthetic Lcom/google/android/gms/measurement/internal/zzgw;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-impl@@19.0.1"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic zza:Lcom/google/android/gms/measurement/internal/zzhv;

.field public final synthetic zzb:Landroid/os/Bundle;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/gms/measurement/internal/zzhv;Landroid/os/Bundle;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzgw;->zza:Lcom/google/android/gms/measurement/internal/zzhv;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgw;->zzb:Landroid/os/Bundle;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgw;->zza:Lcom/google/android/gms/measurement/internal/zzhv;

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzgw;->zzb:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzhv;->zzB(Landroid/os/Bundle;)V

    return-void
.end method
