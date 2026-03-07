.class public Lcom/google/android/gms/internal/measurement/zzjv;
.super Lcom/google/android/gms/internal/measurement/zzig;
.source "com.google.android.gms:play-services-measurement-base@@19.0.1"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<MessageType:",
        "Lcom/google/android/gms/internal/measurement/zzjz<",
        "TMessageType;TBuilderType;>;BuilderType:",
        "Lcom/google/android/gms/internal/measurement/zzjv<",
        "TMessageType;TBuilderType;>;>",
        "Lcom/google/android/gms/internal/measurement/zzig<",
        "TMessageType;TBuilderType;>;"
    }
.end annotation


# instance fields
.field protected zza:Lcom/google/android/gms/internal/measurement/zzjz;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TMessageType;"
        }
    .end annotation
.end field

.field protected zzb:Z

.field private final zzc:Lcom/google/android/gms/internal/measurement/zzjz;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TMessageType;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>(Lcom/google/android/gms/internal/measurement/zzjz;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TMessageType;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/android/gms/internal/measurement/zzig;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zzc:Lcom/google/android/gms/internal/measurement/zzjz;

    const/4 v0, 0x4

    const/4 v1, 0x0

    .line 1
    invoke-virtual {p1, v0, v1, v1}, Lcom/google/android/gms/internal/measurement/zzjz;->zzl(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/android/gms/internal/measurement/zzjz;

    iput-object p1, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zza:Lcom/google/android/gms/internal/measurement/zzjz;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zzb:Z

    return-void
.end method

.method private static final zza(Lcom/google/android/gms/internal/measurement/zzjz;Lcom/google/android/gms/internal/measurement/zzjz;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TMessageType;TMessageType;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzlo;->zza()Lcom/google/android/gms/internal/measurement/zzlo;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 1
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/measurement/zzlo;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/measurement/zzlr;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lcom/google/android/gms/internal/measurement/zzlr;->zzg(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzjv;->zzax()Lcom/google/android/gms/internal/measurement/zzjv;

    move-result-object v0

    return-object v0
.end method

.method public final zzaA()Lcom/google/android/gms/internal/measurement/zzjz;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TMessageType;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaB()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 3
    invoke-virtual {v0, v1, v2, v2}, Lcom/google/android/gms/internal/measurement/zzjz;->zzl(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 4
    check-cast v3, Ljava/lang/Byte;

    invoke-virtual {v3}, Ljava/lang/Byte;->byteValue()B

    move-result v3

    if-ne v3, v1, :cond_0

    goto :goto_1

    :cond_0
    if-nez v3, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    .line 5
    :cond_1
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzlo;->zza()Lcom/google/android/gms/internal/measurement/zzlo;

    move-result-object v3

    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    .line 5
    invoke-virtual {v3, v4}, Lcom/google/android/gms/internal/measurement/zzlo;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/measurement/zzlr;

    move-result-object v3

    invoke-interface {v3, v0}, Lcom/google/android/gms/internal/measurement/zzlr;->zzj(Ljava/lang/Object;)Z

    move-result v3

    if-eq v1, v3, :cond_2

    move-object v1, v2

    goto :goto_0

    :cond_2
    move-object v1, v0

    :goto_0
    const/4 v4, 0x2

    .line 3
    invoke-virtual {v0, v4, v1, v2}, Lcom/google/android/gms/internal/measurement/zzjz;->zzl(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move v1, v3

    :goto_1
    if-eqz v1, :cond_3

    return-object v0

    .line 4
    :cond_3
    new-instance v1, Lcom/google/android/gms/internal/measurement/zzmh;

    .line 6
    invoke-direct {v1, v0}, Lcom/google/android/gms/internal/measurement/zzmh;-><init>(Lcom/google/android/gms/internal/measurement/zzlg;)V

    .line 7
    throw v1
.end method

.method public zzaB()Lcom/google/android/gms/internal/measurement/zzjz;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TMessageType;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zzb:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zza:Lcom/google/android/gms/internal/measurement/zzjz;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zza:Lcom/google/android/gms/internal/measurement/zzjz;

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzlo;->zza()Lcom/google/android/gms/internal/measurement/zzlo;

    move-result-object v1

    .line 2
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    .line 1
    invoke-virtual {v1, v2}, Lcom/google/android/gms/internal/measurement/zzlo;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/measurement/zzlr;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/google/android/gms/internal/measurement/zzlr;->zzf(Ljava/lang/Object;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zzb:Z

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zza:Lcom/google/android/gms/internal/measurement/zzjz;

    return-object v0
.end method

.method public bridge synthetic zzaC()Lcom/google/android/gms/internal/measurement/zzlg;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaB()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v0

    return-object v0
.end method

.method protected zzaE()V
    .locals 3

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zza:Lcom/google/android/gms/internal/measurement/zzjz;

    const/4 v1, 0x4

    const/4 v2, 0x0

    .line 1
    invoke-virtual {v0, v1, v2, v2}, Lcom/google/android/gms/internal/measurement/zzjz;->zzl(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/measurement/zzjz;

    iget-object v1, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zza:Lcom/google/android/gms/internal/measurement/zzjz;

    .line 2
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/measurement/zzjv;->zza(Lcom/google/android/gms/internal/measurement/zzjz;Lcom/google/android/gms/internal/measurement/zzjz;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zza:Lcom/google/android/gms/internal/measurement/zzjz;

    return-void
.end method

.method public final bridge synthetic zzaq()Lcom/google/android/gms/internal/measurement/zzig;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzjv;->zzax()Lcom/google/android/gms/internal/measurement/zzjv;

    move-result-object v0

    return-object v0
.end method

.method protected final bridge synthetic zzar(Lcom/google/android/gms/internal/measurement/zzih;)Lcom/google/android/gms/internal/measurement/zzig;
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/gms/internal/measurement/zzjz;

    .line 2
    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/measurement/zzjv;->zzay(Lcom/google/android/gms/internal/measurement/zzjz;)Lcom/google/android/gms/internal/measurement/zzjv;

    return-object p0
.end method

.method public final bridge synthetic zzas([BII)Lcom/google/android/gms/internal/measurement/zzig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/measurement/zzkj;
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzjl;->zza()Lcom/google/android/gms/internal/measurement/zzjl;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p3, p2}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaz([BIILcom/google/android/gms/internal/measurement/zzjl;)Lcom/google/android/gms/internal/measurement/zzjv;

    return-object p0
.end method

.method public final bridge synthetic zzat([BIILcom/google/android/gms/internal/measurement/zzjl;)Lcom/google/android/gms/internal/measurement/zzig;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/measurement/zzkj;
        }
    .end annotation

    const/4 p2, 0x0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaz([BIILcom/google/android/gms/internal/measurement/zzjl;)Lcom/google/android/gms/internal/measurement/zzjv;

    return-object p0
.end method

.method public final zzax()Lcom/google/android/gms/internal/measurement/zzjv;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TBuilderType;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zzc:Lcom/google/android/gms/internal/measurement/zzjz;

    const/4 v1, 0x5

    const/4 v2, 0x0

    .line 1
    invoke-virtual {v0, v1, v2, v2}, Lcom/google/android/gms/internal/measurement/zzjz;->zzl(ILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2
    check-cast v0, Lcom/google/android/gms/internal/measurement/zzjv;

    .line 3
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaB()Lcom/google/android/gms/internal/measurement/zzjz;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/measurement/zzjv;->zzay(Lcom/google/android/gms/internal/measurement/zzjz;)Lcom/google/android/gms/internal/measurement/zzjv;

    return-object v0
.end method

.method public final zzay(Lcom/google/android/gms/internal/measurement/zzjz;)Lcom/google/android/gms/internal/measurement/zzjv;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TMessageType;)TBuilderType;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zzb:Z

    if-eqz v0, :cond_0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaE()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zzb:Z

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zza:Lcom/google/android/gms/internal/measurement/zzjz;

    .line 2
    invoke-static {v0, p1}, Lcom/google/android/gms/internal/measurement/zzjv;->zza(Lcom/google/android/gms/internal/measurement/zzjz;Lcom/google/android/gms/internal/measurement/zzjz;)V

    return-object p0
.end method

.method public final zzaz([BIILcom/google/android/gms/internal/measurement/zzjl;)Lcom/google/android/gms/internal/measurement/zzjv;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([BII",
            "Lcom/google/android/gms/internal/measurement/zzjl;",
            ")TBuilderType;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/measurement/zzkj;
        }
    .end annotation

    iget-boolean p2, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zzb:Z

    if-eqz p2, :cond_0

    .line 1
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/zzjv;->zzaE()V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zzb:Z

    .line 2
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzlo;->zza()Lcom/google/android/gms/internal/measurement/zzlo;

    move-result-object p2

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zza:Lcom/google/android/gms/internal/measurement/zzjz;

    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 2
    invoke-virtual {p2, v0}, Lcom/google/android/gms/internal/measurement/zzlo;->zzb(Ljava/lang/Class;)Lcom/google/android/gms/internal/measurement/zzlr;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zza:Lcom/google/android/gms/internal/measurement/zzjz;

    new-instance v6, Lcom/google/android/gms/internal/measurement/zzik;

    invoke-direct {v6, p4}, Lcom/google/android/gms/internal/measurement/zzik;-><init>(Lcom/google/android/gms/internal/measurement/zzjl;)V

    const/4 v4, 0x0

    move-object v3, p1

    move v5, p3

    invoke-interface/range {v1 .. v6}, Lcom/google/android/gms/internal/measurement/zzlr;->zzh(Ljava/lang/Object;[BIILcom/google/android/gms/internal/measurement/zzik;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/measurement/zzkj; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p1

    new-instance p2, Ljava/lang/RuntimeException;

    const-string p3, "Reading from byte array should not throw IOException."

    .line 4
    invoke-direct {p2, p3, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    .line 5
    :catch_1
    invoke-static {}, Lcom/google/android/gms/internal/measurement/zzkj;->zzf()Lcom/google/android/gms/internal/measurement/zzkj;

    move-result-object p1

    throw p1

    :catch_2
    move-exception p1

    .line 6
    throw p1
.end method

.method public final bridge synthetic zzbL()Lcom/google/android/gms/internal/measurement/zzlg;
    .locals 1

    iget-object v0, p0, Lcom/google/android/gms/internal/measurement/zzjv;->zzc:Lcom/google/android/gms/internal/measurement/zzjz;

    return-object v0
.end method
