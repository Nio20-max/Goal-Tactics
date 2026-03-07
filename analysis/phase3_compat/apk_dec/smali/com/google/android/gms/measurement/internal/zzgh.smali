.class final Lcom/google/android/gms/measurement/internal/zzgh;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement@@19.0.1"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/util/List<",
        "Lcom/google/android/gms/measurement/internal/zzks;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic zza:Ljava/lang/String;

.field final synthetic zzb:Lcom/google/android/gms/measurement/internal/zzgk;


# direct methods
.method constructor <init>(Lcom/google/android/gms/measurement/internal/zzgk;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/google/android/gms/measurement/internal/zzgh;->zzb:Lcom/google/android/gms/measurement/internal/zzgk;

    iput-object p2, p0, Lcom/google/android/gms/measurement/internal/zzgh;->zza:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic call()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgh;->zzb:Lcom/google/android/gms/measurement/internal/zzgk;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzc(Lcom/google/android/gms/measurement/internal/zzgk;)Lcom/google/android/gms/measurement/internal/zzkn;

    move-result-object v0

    .line 1
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzA()V

    iget-object v0, p0, Lcom/google/android/gms/measurement/internal/zzgh;->zzb:Lcom/google/android/gms/measurement/internal/zzgk;

    invoke-static {v0}, Lcom/google/android/gms/measurement/internal/zzgk;->zzc(Lcom/google/android/gms/measurement/internal/zzgk;)Lcom/google/android/gms/measurement/internal/zzkn;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Lcom/google/android/gms/measurement/internal/zzkn;->zzi()Lcom/google/android/gms/measurement/internal/zzaj;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/measurement/internal/zzgh;->zza:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/measurement/internal/zzaj;->zzu(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
