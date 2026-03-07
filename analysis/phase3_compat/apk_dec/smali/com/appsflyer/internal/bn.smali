.class public abstract Lcom/appsflyer/internal/bn;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Comparable;
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Result:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/appsflyer/internal/bn<",
        "*>;>;",
        "Ljava/util/concurrent/Callable<",
        "Lcom/appsflyer/internal/bo;",
        ">;"
    }
.end annotation


# static fields
.field private static final valueOf:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final AFInAppEventParameterName:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/appsflyer/internal/bt;",
            ">;"
        }
    .end annotation
.end field

.field private final AFInAppEventType:I

.field private final AFKeystoreWrapper:Ljava/lang/String;

.field private final values:Lcom/appsflyer/internal/bt;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/bn;->valueOf:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public constructor <init>(Lcom/appsflyer/internal/bt;[Lcom/appsflyer/internal/bt;Ljava/lang/String;)V
    .locals 2

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/bn;->AFInAppEventParameterName:Ljava/util/Set;

    .line 30
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 38
    sget-object v1, Lcom/appsflyer/internal/bn;->valueOf:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v1

    iput v1, p0, Lcom/appsflyer/internal/bn;->AFInAppEventType:I

    .line 63
    iput-object p1, p0, Lcom/appsflyer/internal/bn;->values:Lcom/appsflyer/internal/bt;

    .line 64
    invoke-static {v0, p2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 66
    iput-object p3, p0, Lcom/appsflyer/internal/bn;->AFKeystoreWrapper:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final AFInAppEventParameterName()Lcom/appsflyer/internal/bo;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "AppsFlyer"

    .line 185
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    .line 189
    :try_start_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/bn;->values()Lcom/appsflyer/internal/bo;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception v0

    .line 194
    :try_start_1
    sget-object v1, Lcom/appsflyer/internal/bo;->AFInAppEventParameterName:Lcom/appsflyer/internal/bo;

    .line 196
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v0

    .line 200
    throw v0
.end method

.method public synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 21
    invoke-virtual {p0}, Lcom/appsflyer/internal/bn;->AFInAppEventParameterName()Lcom/appsflyer/internal/bo;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 2

    .line 21
    check-cast p1, Lcom/appsflyer/internal/bn;

    .line 1262
    iget-object v0, p0, Lcom/appsflyer/internal/bn;->values:Lcom/appsflyer/internal/bt;

    iget v0, v0, Lcom/appsflyer/internal/bt;->valueOf:I

    iget-object v1, p1, Lcom/appsflyer/internal/bn;->values:Lcom/appsflyer/internal/bt;

    iget v1, v1, Lcom/appsflyer/internal/bt;->valueOf:I

    sub-int/2addr v0, v1

    if-nez v0, :cond_0

    .line 1265
    iget v0, p0, Lcom/appsflyer/internal/bn;->AFInAppEventType:I

    iget p1, p1, Lcom/appsflyer/internal/bn;->AFInAppEventType:I

    sub-int/2addr v0, p1

    :cond_0
    return v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_3

    .line 273
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    goto :goto_0

    .line 275
    :cond_1
    check-cast p1, Lcom/appsflyer/internal/bn;

    .line 278
    iget-object v1, p0, Lcom/appsflyer/internal/bn;->values:Lcom/appsflyer/internal/bt;

    iget-object v2, p1, Lcom/appsflyer/internal/bn;->values:Lcom/appsflyer/internal/bt;

    if-eq v1, v2, :cond_2

    return v0

    .line 279
    :cond_2
    iget-object v0, p0, Lcom/appsflyer/internal/bn;->AFKeystoreWrapper:Ljava/lang/String;

    iget-object p1, p1, Lcom/appsflyer/internal/bn;->AFKeystoreWrapper:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_3
    :goto_0
    return v0
.end method

.method public final hashCode()I
    .locals 2

    .line 284
    iget-object v0, p0, Lcom/appsflyer/internal/bn;->values:Lcom/appsflyer/internal/bt;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 285
    iget-object v1, p0, Lcom/appsflyer/internal/bn;->AFKeystoreWrapper:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 292
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/appsflyer/internal/bn;->values:Lcom/appsflyer/internal/bt;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/appsflyer/internal/bn;->AFKeystoreWrapper:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 294
    iget v2, p0, Lcom/appsflyer/internal/bn;->AFInAppEventType:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/appsflyer/internal/bn;->AFKeystoreWrapper:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 295
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/appsflyer/internal/bn;->AFInAppEventType:I

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method protected abstract values()Lcom/appsflyer/internal/bo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
