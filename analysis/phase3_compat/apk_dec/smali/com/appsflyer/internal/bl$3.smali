.class public final Lcom/appsflyer/internal/bl$3;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/bl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field private synthetic AFInAppEventParameterName:Lcom/appsflyer/internal/bi;

.field private synthetic AFInAppEventType:Lcom/appsflyer/internal/bl;


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/bl;Lcom/appsflyer/internal/bi;)V
    .locals 0

    .line 60
    iput-object p1, p0, Lcom/appsflyer/internal/bl$3;->AFInAppEventType:Lcom/appsflyer/internal/bl;

    iput-object p2, p0, Lcom/appsflyer/internal/bl$3;->AFInAppEventParameterName:Lcom/appsflyer/internal/bi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 64
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/bl$3;->AFInAppEventType:Lcom/appsflyer/internal/bl;

    .line 1013
    iget-object v0, v0, Lcom/appsflyer/internal/bl;->values:Lcom/appsflyer/internal/bm;

    .line 64
    iget-object v1, p0, Lcom/appsflyer/internal/bl$3;->AFInAppEventType:Lcom/appsflyer/internal/bl;

    .line 2013
    iget-object v1, v1, Lcom/appsflyer/internal/bl;->AFInAppEventType:Lcom/appsflyer/internal/z;

    .line 64
    invoke-virtual {v0, v1}, Lcom/appsflyer/internal/bm;->AFInAppEventType(Lcom/appsflyer/internal/z;)Lcom/appsflyer/internal/br;

    move-result-object v0

    .line 65
    iget-object v1, p0, Lcom/appsflyer/internal/bl$3;->AFInAppEventParameterName:Lcom/appsflyer/internal/bi;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v1, :cond_0

    .line 67
    :try_start_1
    iget-object v1, p0, Lcom/appsflyer/internal/bl$3;->AFInAppEventType:Lcom/appsflyer/internal/bl;

    .line 3013
    iget-object v1, v1, Lcom/appsflyer/internal/bl;->AFInAppEventParameterName:Lcom/appsflyer/internal/bq;

    .line 3046
    iget-object v2, v0, Lcom/appsflyer/internal/br;->valueOf:Ljava/lang/Object;

    .line 67
    check-cast v2, Ljava/lang/String;

    invoke-interface {v1, v2}, Lcom/appsflyer/internal/bq;->values(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 4034
    new-instance v1, Lcom/appsflyer/internal/br;

    iget v5, v0, Lcom/appsflyer/internal/br;->values:I

    iget-boolean v6, v0, Lcom/appsflyer/internal/br;->AFKeystoreWrapper:Z

    iget-object v7, v0, Lcom/appsflyer/internal/br;->AFInAppEventParameterName:Ljava/util/Map;

    iget-object v8, v0, Lcom/appsflyer/internal/br;->AFInAppEventType:Lcom/appsflyer/internal/bk;

    move-object v3, v1

    invoke-direct/range {v3 .. v8}, Lcom/appsflyer/internal/br;-><init>(Ljava/lang/Object;IZLjava/util/Map;Lcom/appsflyer/internal/bk;)V

    .line 68
    iget-object v2, p0, Lcom/appsflyer/internal/bl$3;->AFInAppEventParameterName:Lcom/appsflyer/internal/bi;

    invoke-interface {v2, v1}, Lcom/appsflyer/internal/bi;->values(Lcom/appsflyer/internal/br;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    return-void

    :catch_0
    move-exception v1

    .line 70
    :try_start_2
    iget-object v2, p0, Lcom/appsflyer/internal/bl$3;->AFInAppEventParameterName:Lcom/appsflyer/internal/bi;

    new-instance v3, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1, v0}, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/appsflyer/internal/br;)V

    invoke-interface {v2, v3}, Lcom/appsflyer/internal/bi;->values(Ljava/lang/Throwable;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    :cond_0
    return-void

    :catch_1
    move-exception v0

    .line 74
    iget-object v1, p0, Lcom/appsflyer/internal/bl$3;->AFInAppEventParameterName:Lcom/appsflyer/internal/bi;

    if-eqz v1, :cond_1

    .line 75
    invoke-interface {v1, v0}, Lcom/appsflyer/internal/bi;->values(Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method
