.class final Lcom/appsflyer/internal/av$3;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/appsflyer/internal/bi;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/av;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/appsflyer/internal/bi<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private synthetic AFInAppEventType:Lcom/appsflyer/internal/aj;

.field private synthetic valueOf:Z

.field private synthetic values:Lcom/appsflyer/internal/av;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/av;ZLcom/appsflyer/internal/aj;)V
    .locals 0

    .line 191
    iput-object p1, p0, Lcom/appsflyer/internal/av$3;->values:Lcom/appsflyer/internal/av;

    iput-boolean p2, p0, Lcom/appsflyer/internal/av$3;->valueOf:Z

    iput-object p3, p0, Lcom/appsflyer/internal/av$3;->AFInAppEventType:Lcom/appsflyer/internal/aj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final values(Lcom/appsflyer/internal/br;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/br<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 194
    invoke-virtual {p1}, Lcom/appsflyer/internal/br;->values()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 196
    iget-boolean v0, p0, Lcom/appsflyer/internal/av$3;->valueOf:Z

    if-eqz v0, :cond_0

    .line 197
    iget-object v0, p0, Lcom/appsflyer/internal/av$3;->values:Lcom/appsflyer/internal/av;

    .line 1041
    iget-object v0, v0, Lcom/appsflyer/internal/av;->AFInAppEventParameterName:Lcom/appsflyer/internal/bv;

    const/4 v1, 0x1

    const-string v2, "ars_history_sent"

    .line 198
    invoke-interface {v0, v2, v1}, Lcom/appsflyer/internal/bv;->AFInAppEventType(Ljava/lang/String;Z)V

    .line 201
    :cond_0
    iget-object v0, p0, Lcom/appsflyer/internal/av$3;->AFInAppEventType:Lcom/appsflyer/internal/aj;

    if-eqz v0, :cond_2

    iget-object v0, v0, Lcom/appsflyer/internal/aj;->AFKeystoreWrapper:Lcom/appsflyer/compat/function/Consumer;

    if-eqz v0, :cond_2

    .line 202
    iget-object v0, p0, Lcom/appsflyer/internal/av$3;->AFInAppEventType:Lcom/appsflyer/internal/aj;

    iget-object v0, v0, Lcom/appsflyer/internal/aj;->AFKeystoreWrapper:Lcom/appsflyer/compat/function/Consumer;

    .line 1046
    iget-object p1, p1, Lcom/appsflyer/internal/br;->valueOf:Ljava/lang/Object;

    .line 202
    invoke-interface {v0, p1}, Lcom/appsflyer/compat/function/Consumer;->accept(Ljava/lang/Object;)V

    return-void

    .line 205
    :cond_1
    iget-object v0, p0, Lcom/appsflyer/internal/av$3;->AFInAppEventType:Lcom/appsflyer/internal/aj;

    if-eqz v0, :cond_2

    iget-object v0, v0, Lcom/appsflyer/internal/aj;->AFInAppEventParameterName:Lcom/appsflyer/compat/function/Consumer;

    if-eqz v0, :cond_2

    .line 206
    iget-object v0, p0, Lcom/appsflyer/internal/av$3;->AFInAppEventType:Lcom/appsflyer/internal/aj;

    iget-object v0, v0, Lcom/appsflyer/internal/aj;->AFInAppEventParameterName:Lcom/appsflyer/compat/function/Consumer;

    .line 2046
    iget-object p1, p1, Lcom/appsflyer/internal/br;->valueOf:Ljava/lang/Object;

    .line 206
    invoke-interface {v0, p1}, Lcom/appsflyer/compat/function/Consumer;->accept(Ljava/lang/Object;)V

    :cond_2
    return-void
.end method

.method public final values(Ljava/lang/Throwable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .line 213
    iget-object v0, p0, Lcom/appsflyer/internal/av$3;->AFInAppEventType:Lcom/appsflyer/internal/aj;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/appsflyer/internal/aj;->AFInAppEventParameterName:Lcom/appsflyer/compat/function/Consumer;

    if-eqz v0, :cond_0

    .line 214
    iget-object v0, p0, Lcom/appsflyer/internal/av$3;->AFInAppEventType:Lcom/appsflyer/internal/aj;

    iget-object v0, v0, Lcom/appsflyer/internal/aj;->AFInAppEventParameterName:Lcom/appsflyer/compat/function/Consumer;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/appsflyer/compat/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 216
    :cond_0
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/Throwable;)V

    return-void
.end method
