.class public final Lcom/appsflyer/internal/bl;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ResponseBody:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final AFInAppEventParameterName:Lcom/appsflyer/internal/bq;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/appsflyer/internal/bq<",
            "TResponseBody;>;"
        }
    .end annotation
.end field

.field final AFInAppEventType:Lcom/appsflyer/internal/z;

.field public final AFKeystoreWrapper:Ljava/util/concurrent/ExecutorService;

.field public final valueOf:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final values:Lcom/appsflyer/internal/bm;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/z;Ljava/util/concurrent/ExecutorService;Lcom/appsflyer/internal/bm;Lcom/appsflyer/internal/bq;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/appsflyer/internal/z;",
            "Ljava/util/concurrent/ExecutorService;",
            "Lcom/appsflyer/internal/bm;",
            "Lcom/appsflyer/internal/bq<",
            "TResponseBody;>;)V"
        }
    .end annotation

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/appsflyer/internal/bl;->valueOf:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 24
    iput-object p1, p0, Lcom/appsflyer/internal/bl;->AFInAppEventType:Lcom/appsflyer/internal/z;

    .line 25
    iput-object p2, p0, Lcom/appsflyer/internal/bl;->AFKeystoreWrapper:Ljava/util/concurrent/ExecutorService;

    .line 26
    iput-object p3, p0, Lcom/appsflyer/internal/bl;->values:Lcom/appsflyer/internal/bm;

    .line 27
    iput-object p4, p0, Lcom/appsflyer/internal/bl;->AFInAppEventParameterName:Lcom/appsflyer/internal/bq;

    return-void
.end method


# virtual methods
.method public final AFKeystoreWrapper()Lcom/appsflyer/internal/br;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/appsflyer/internal/br<",
            "TResponseBody;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1084
    iget-object v0, p0, Lcom/appsflyer/internal/bl;->valueOf:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 45
    iget-object v0, p0, Lcom/appsflyer/internal/bl;->values:Lcom/appsflyer/internal/bm;

    iget-object v1, p0, Lcom/appsflyer/internal/bl;->AFInAppEventType:Lcom/appsflyer/internal/z;

    invoke-virtual {v0, v1}, Lcom/appsflyer/internal/bm;->AFInAppEventType(Lcom/appsflyer/internal/z;)Lcom/appsflyer/internal/br;

    move-result-object v0

    .line 47
    :try_start_0
    iget-object v1, p0, Lcom/appsflyer/internal/bl;->AFInAppEventParameterName:Lcom/appsflyer/internal/bq;

    .line 2046
    iget-object v2, v0, Lcom/appsflyer/internal/br;->valueOf:Ljava/lang/Object;

    .line 47
    check-cast v2, Ljava/lang/String;

    invoke-interface {v1, v2}, Lcom/appsflyer/internal/bq;->values(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 3034
    new-instance v1, Lcom/appsflyer/internal/br;

    iget v5, v0, Lcom/appsflyer/internal/br;->values:I

    iget-boolean v6, v0, Lcom/appsflyer/internal/br;->AFKeystoreWrapper:Z

    iget-object v7, v0, Lcom/appsflyer/internal/br;->AFInAppEventParameterName:Ljava/util/Map;

    iget-object v8, v0, Lcom/appsflyer/internal/br;->AFInAppEventType:Lcom/appsflyer/internal/bk;

    move-object v3, v1

    invoke-direct/range {v3 .. v8}, Lcom/appsflyer/internal/br;-><init>(Ljava/lang/Object;IZLjava/util/Map;Lcom/appsflyer/internal/bk;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    .line 49
    new-instance v2, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1, v0}, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/appsflyer/internal/br;)V

    throw v2

    .line 1085
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Http call is already executed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
