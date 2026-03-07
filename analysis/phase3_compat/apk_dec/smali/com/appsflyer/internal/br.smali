.class public Lcom/appsflyer/internal/br;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Body:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final AFInAppEventParameterName:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public final AFInAppEventType:Lcom/appsflyer/internal/bk;

.field final AFKeystoreWrapper:Z

.field public final valueOf:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TBody;"
        }
    .end annotation
.end field

.field public final values:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;IZLjava/util/Map;Lcom/appsflyer/internal/bk;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TBody;IZ",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;",
            "Lcom/appsflyer/internal/bk;",
            ")V"
        }
    .end annotation

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/appsflyer/internal/br;->valueOf:Ljava/lang/Object;

    .line 24
    iput p2, p0, Lcom/appsflyer/internal/br;->values:I

    .line 25
    iput-boolean p3, p0, Lcom/appsflyer/internal/br;->AFKeystoreWrapper:Z

    .line 26
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1, p4}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object p1, p0, Lcom/appsflyer/internal/br;->AFInAppEventParameterName:Ljava/util/Map;

    .line 27
    iput-object p5, p0, Lcom/appsflyer/internal/br;->AFInAppEventType:Lcom/appsflyer/internal/bk;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_6

    .line 96
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    goto :goto_0

    .line 98
    :cond_1
    check-cast p1, Lcom/appsflyer/internal/br;

    .line 100
    iget v1, p0, Lcom/appsflyer/internal/br;->values:I

    iget v2, p1, Lcom/appsflyer/internal/br;->values:I

    if-eq v1, v2, :cond_2

    return v0

    .line 101
    :cond_2
    iget-boolean v1, p0, Lcom/appsflyer/internal/br;->AFKeystoreWrapper:Z

    iget-boolean v2, p1, Lcom/appsflyer/internal/br;->AFKeystoreWrapper:Z

    if-eq v1, v2, :cond_3

    return v0

    .line 102
    :cond_3
    iget-object v1, p0, Lcom/appsflyer/internal/br;->valueOf:Ljava/lang/Object;

    iget-object v2, p1, Lcom/appsflyer/internal/br;->valueOf:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v0

    .line 103
    :cond_4
    iget-object v1, p0, Lcom/appsflyer/internal/br;->AFInAppEventParameterName:Ljava/util/Map;

    iget-object v2, p1, Lcom/appsflyer/internal/br;->AFInAppEventParameterName:Ljava/util/Map;

    invoke-interface {v1, v2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v0

    .line 104
    :cond_5
    iget-object v0, p0, Lcom/appsflyer/internal/br;->AFInAppEventType:Lcom/appsflyer/internal/bk;

    iget-object p1, p1, Lcom/appsflyer/internal/br;->AFInAppEventType:Lcom/appsflyer/internal/bk;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_6
    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 2

    .line 109
    iget-object v0, p0, Lcom/appsflyer/internal/br;->valueOf:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    .line 110
    iget v1, p0, Lcom/appsflyer/internal/br;->values:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 111
    iget-boolean v1, p0, Lcom/appsflyer/internal/br;->AFKeystoreWrapper:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 112
    iget-object v1, p0, Lcom/appsflyer/internal/br;->AFInAppEventParameterName:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 113
    iget-object v1, p0, Lcom/appsflyer/internal/br;->AFInAppEventType:Lcom/appsflyer/internal/bk;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public final values()Z
    .locals 1

    .line 54
    iget-boolean v0, p0, Lcom/appsflyer/internal/br;->AFKeystoreWrapper:Z

    return v0
.end method
