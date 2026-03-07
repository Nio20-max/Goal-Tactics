.class public final Lcom/google/android/gms/internal/measurement/zzmn;
.super Ljava/util/AbstractList;
.source "com.google.android.gms:play-services-measurement-base@@19.0.1"

# interfaces
.implements Ljava/util/RandomAccess;
.implements Lcom/google/android/gms/internal/measurement/zzko;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractList<",
        "Ljava/lang/String;",
        ">;",
        "Ljava/util/RandomAccess;",
        "Lcom/google/android/gms/internal/measurement/zzko;"
    }
.end annotation


# instance fields
.field private final zza:Lcom/google/android/gms/internal/measurement/zzko;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/measurement/zzko;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/measurement/zzmn;->zza:Lcom/google/android/gms/internal/measurement/zzko;

    return-void
.end method

.method static bridge synthetic zza(Lcom/google/android/gms/internal/measurement/zzmn;)Lcom/google/android/gms/internal/measurement/zzko;
    .locals 0

    iget-object p0, p0, Lcom/google/android/gms/internal/measurement/zzmn;->zza:Lcom/google/android/gms/internal/measurement/zzko;

    return-object p0
.end method


# virtual methods
.method public final bridge synthetic get(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzmn;->zza:Lcom/google/android/gms/internal/measurement/zzko;

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzkn;

    .line 1
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/measurement/zzkn;->zzg(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/measurement/zzmm;

    .line 1
    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/measurement/zzmm;-><init>(Lcom/google/android/gms/internal/measurement/zzmn;)V

    return-object v0
.end method

.method public final listIterator(I)Ljava/util/ListIterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ListIterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/measurement/zzml;

    .line 1
    invoke-direct {v0, p0, p1}, Lcom/google/android/gms/internal/measurement/zzml;-><init>(Lcom/google/android/gms/internal/measurement/zzmn;I)V

    return-object v0
.end method

.method public final size()I
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzmn;->zza:Lcom/google/android/gms/internal/measurement/zzko;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/internal/measurement/zzko;->size()I

    move-result v0

    return v0
.end method

.method public final zze()Lcom/google/android/gms/internal/measurement/zzko;
    .locals 0

    return-object p0
.end method

.method public final zzf(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzmn;->zza:Lcom/google/android/gms/internal/measurement/zzko;

    .line 1
    invoke-interface {v0, p1}, Lcom/google/android/gms/internal/measurement/zzko;->zzf(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final zzh()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzmn;->zza:Lcom/google/android/gms/internal/measurement/zzko;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/internal/measurement/zzko;->zzh()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final zzi(Lcom/google/android/gms/internal/measurement/zziy;)V
    .locals 0

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    .line 1
    invoke-direct {p1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p1
.end method
