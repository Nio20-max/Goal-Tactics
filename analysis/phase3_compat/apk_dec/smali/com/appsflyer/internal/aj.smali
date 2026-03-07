.class public final Lcom/appsflyer/internal/aj;
.super Ljava/lang/Object;
.source ""


# instance fields
.field public final AFInAppEventParameterName:Lcom/appsflyer/compat/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/appsflyer/compat/function/Consumer<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final AFInAppEventType:Z

.field public final AFKeystoreWrapper:Lcom/appsflyer/compat/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/appsflyer/compat/function/Consumer<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final values:Lcom/appsflyer/compat/function/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/appsflyer/compat/function/Function<",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_8

    .line 1035
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_2

    .line 1036
    :cond_1
    check-cast p1, Lcom/appsflyer/internal/aj;

    .line 1037
    iget-boolean v2, p0, Lcom/appsflyer/internal/aj;->AFInAppEventType:Z

    iget-boolean v3, p1, Lcom/appsflyer/internal/aj;->AFInAppEventType:Z

    if-eq v2, v3, :cond_2

    return v1

    .line 1038
    :cond_2
    iget-object v2, p0, Lcom/appsflyer/internal/aj;->values:Lcom/appsflyer/compat/function/Function;

    if-eqz v2, :cond_3

    iget-object v3, p1, Lcom/appsflyer/internal/aj;->values:Lcom/appsflyer/compat/function/Function;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    goto :goto_0

    :cond_3
    iget-object v2, p1, Lcom/appsflyer/internal/aj;->values:Lcom/appsflyer/compat/function/Function;

    if-eqz v2, :cond_4

    :goto_0
    return v1

    .line 1040
    :cond_4
    iget-object v2, p0, Lcom/appsflyer/internal/aj;->AFKeystoreWrapper:Lcom/appsflyer/compat/function/Consumer;

    if-eqz v2, :cond_5

    iget-object v3, p1, Lcom/appsflyer/internal/aj;->AFKeystoreWrapper:Lcom/appsflyer/compat/function/Consumer;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    goto :goto_1

    :cond_5
    iget-object v2, p1, Lcom/appsflyer/internal/aj;->AFKeystoreWrapper:Lcom/appsflyer/compat/function/Consumer;

    if-eqz v2, :cond_6

    :goto_1
    return v1

    .line 1041
    :cond_6
    iget-object v2, p0, Lcom/appsflyer/internal/aj;->AFInAppEventParameterName:Lcom/appsflyer/compat/function/Consumer;

    iget-object p1, p1, Lcom/appsflyer/internal/aj;->AFInAppEventParameterName:Lcom/appsflyer/compat/function/Consumer;

    if-eqz v2, :cond_7

    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_7
    if-nez p1, :cond_8

    return v0

    :cond_8
    :goto_2
    return v1
.end method

.method public final hashCode()I
    .locals 3

    .line 1046
    iget-object v0, p0, Lcom/appsflyer/internal/aj;->values:Lcom/appsflyer/compat/function/Function;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    .line 1047
    iget-object v2, p0, Lcom/appsflyer/internal/aj;->AFKeystoreWrapper:Lcom/appsflyer/compat/function/Consumer;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 1048
    iget-object v2, p0, Lcom/appsflyer/internal/aj;->AFInAppEventParameterName:Lcom/appsflyer/compat/function/Consumer;

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 1049
    iget-boolean v1, p0, Lcom/appsflyer/internal/aj;->AFInAppEventType:Z

    add-int/2addr v0, v1

    return v0
.end method
