.class final Lcom/google/android/gms/internal/measurement/zzlk;
.super Ljava/lang/Object;
.source "com.google.android.gms:play-services-measurement-base@@19.0.1"

# interfaces
.implements Lcom/google/android/gms/internal/measurement/zzlr;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/internal/measurement/zzlr<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final zza:Lcom/google/android/gms/internal/measurement/zzlg;

.field private final zzb:Lcom/google/android/gms/internal/measurement/zzmi;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/measurement/zzmi<",
            "**>;"
        }
    .end annotation
.end field

.field private final zzc:Z

.field private final zzd:Lcom/google/android/gms/internal/measurement/zzjm;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/measurement/zzjm<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/android/gms/internal/measurement/zzmi;Lcom/google/android/gms/internal/measurement/zzjm;Lcom/google/android/gms/internal/measurement/zzlg;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/internal/measurement/zzmi<",
            "**>;",
            "Lcom/google/android/gms/internal/measurement/zzjm<",
            "*>;",
            "Lcom/google/android/gms/internal/measurement/zzlg;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzb:Lcom/google/android/gms/internal/measurement/zzmi;

    .line 1
    invoke-virtual {p2, p3}, Lcom/google/android/gms/internal/measurement/zzjm;->zzc(Lcom/google/android/gms/internal/measurement/zzlg;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzc:Z

    iput-object p2, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzd:Lcom/google/android/gms/internal/measurement/zzjm;

    iput-object p3, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zza:Lcom/google/android/gms/internal/measurement/zzlg;

    return-void
.end method

.method static zzc(Lcom/google/android/gms/internal/measurement/zzmi;Lcom/google/android/gms/internal/measurement/zzjm;Lcom/google/android/gms/internal/measurement/zzlg;)Lcom/google/android/gms/internal/measurement/zzlk;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/gms/internal/measurement/zzmi<",
            "**>;",
            "Lcom/google/android/gms/internal/measurement/zzjm<",
            "*>;",
            "Lcom/google/android/gms/internal/measurement/zzlg;",
            ")",
            "Lcom/google/android/gms/internal/measurement/zzlk<",
            "TT;>;"
        }
    .end annotation

    new-instance v0, Lcom/google/android/gms/internal/measurement/zzlk;

    .line 1
    invoke-direct {v0, p0, p1, p2}, Lcom/google/android/gms/internal/measurement/zzlk;-><init>(Lcom/google/android/gms/internal/measurement/zzmi;Lcom/google/android/gms/internal/measurement/zzjm;Lcom/google/android/gms/internal/measurement/zzlg;)V

    return-object v0
.end method


# virtual methods
.method public final zza(Ljava/lang/Object;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzb:Lcom/google/android/gms/internal/measurement/zzmi;

    .line 1
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/measurement/zzmi;->zzc(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 2
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/measurement/zzmi;->zzb(Ljava/lang/Object;)I

    move-result v0

    iget-boolean v1, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzc:Z

    if-nez v1, :cond_0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzd:Lcom/google/android/gms/internal/measurement/zzjm;

    .line 3
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/measurement/zzjm;->zza(Ljava/lang/Object;)Lcom/google/android/gms/internal/measurement/zzjq;

    const/4 p1, 0x0

    throw p1
.end method

.method public final zzb(Ljava/lang/Object;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)I"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzb:Lcom/google/android/gms/internal/measurement/zzmi;

    .line 1
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/measurement/zzmi;->zzc(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget-boolean v1, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzc:Z

    if-nez v1, :cond_0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzd:Lcom/google/android/gms/internal/measurement/zzjm;

    .line 2
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/measurement/zzjm;->zza(Ljava/lang/Object;)Lcom/google/android/gms/internal/measurement/zzjq;

    const/4 p1, 0x0

    .line 3
    throw p1
.end method

.method public final zze()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zza:Lcom/google/android/gms/internal/measurement/zzlg;

    .line 1
    invoke-interface {v0}, Lcom/google/android/gms/internal/measurement/zzlg;->zzbC()Lcom/google/android/gms/internal/measurement/zzlf;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/android/gms/internal/measurement/zzlf;->zzaC()Lcom/google/android/gms/internal/measurement/zzlg;

    move-result-object v0

    return-object v0
.end method

.method public final zzf(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzb:Lcom/google/android/gms/internal/measurement/zzmi;

    .line 1
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/measurement/zzmi;->zzg(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzd:Lcom/google/android/gms/internal/measurement/zzjm;

    .line 2
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/measurement/zzjm;->zzb(Ljava/lang/Object;)V

    return-void
.end method

.method public final zzg(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzb:Lcom/google/android/gms/internal/measurement/zzmi;

    .line 1
    invoke-static {v0, p1, p2}, Lcom/google/android/gms/internal/measurement/zzlt;->zzF(Lcom/google/android/gms/internal/measurement/zzmi;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzc:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzd:Lcom/google/android/gms/internal/measurement/zzjm;

    .line 2
    invoke-static {v0, p1, p2}, Lcom/google/android/gms/internal/measurement/zzlt;->zzE(Lcom/google/android/gms/internal/measurement/zzjm;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public final zzh(Ljava/lang/Object;[BIILcom/google/android/gms/internal/measurement/zzik;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[BII",
            "Lcom/google/android/gms/internal/measurement/zzik;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object p2, p1

    check-cast p2, Lcom/google/android/gms/internal/measurement/zzjz;

    iget-object p3, p2, Lcom/google/android/gms/internal/measurement/zzjz;->zzc:Lcom/google/android/gms/internal/measurement/zzmj;

    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzmj;->zzc()Lcom/google/android/gms/internal/measurement/zzmj;

    move-result-object p4

    if-eq p3, p4, :cond_0

    goto :goto_0

    .line 4
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzmj;->zze()Lcom/google/android/gms/internal/measurement/zzmj;

    move-result-object p3

    .line 2
    iput-object p3, p2, Lcom/google/android/gms/internal/measurement/zzjz;->zzc:Lcom/google/android/gms/internal/measurement/zzmj;

    .line 3
    :goto_0
    check-cast p1, Lcom/google/android/gms/internal/measurement/zzjw;

    const/4 p1, 0x0

    .line 4
    throw p1
.end method

.method public final zzi(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzb:Lcom/google/android/gms/internal/measurement/zzmi;

    .line 1
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/measurement/zzmi;->zzc(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzb:Lcom/google/android/gms/internal/measurement/zzmi;

    .line 2
    invoke-virtual {v1, p2}, Lcom/google/android/gms/internal/measurement/zzmi;->zzc(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 3
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-boolean v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzc:Z

    if-nez v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzd:Lcom/google/android/gms/internal/measurement/zzjm;

    .line 4
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/measurement/zzjm;->zza(Ljava/lang/Object;)Lcom/google/android/gms/internal/measurement/zzjq;

    iget-object p1, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzd:Lcom/google/android/gms/internal/measurement/zzjm;

    .line 5
    invoke-virtual {p1, p2}, Lcom/google/android/gms/internal/measurement/zzjm;->zza(Ljava/lang/Object;)Lcom/google/android/gms/internal/measurement/zzjq;

    const/4 p1, 0x0

    .line 6
    throw p1
.end method

.method public final zzj(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzd:Lcom/google/android/gms/internal/measurement/zzjm;

    .line 1
    invoke-virtual {v0, p1}, Lcom/google/android/gms/internal/measurement/zzjm;->zza(Ljava/lang/Object;)Lcom/google/android/gms/internal/measurement/zzjq;

    const/4 p1, 0x0

    .line 2
    throw p1
.end method

.method public final zzm(Ljava/lang/Object;Lcom/google/android/gms/internal/measurement/zzjh;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/google/android/gms/internal/measurement/zzjh;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object p2, p0, Lcom/google/android/gms/internal/measurement/zzlk;->zzd:Lcom/google/android/gms/internal/measurement/zzjm;

    .line 1
    invoke-virtual {p2, p1}, Lcom/google/android/gms/internal/measurement/zzjm;->zza(Ljava/lang/Object;)Lcom/google/android/gms/internal/measurement/zzjq;

    const/4 p1, 0x0

    .line 2
    throw p1
.end method
