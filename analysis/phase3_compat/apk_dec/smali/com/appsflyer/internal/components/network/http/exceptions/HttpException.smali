.class public Lcom/appsflyer/internal/components/network/http/exceptions/HttpException;
.super Ljava/io/IOException;
.source ""


# instance fields
.field private final valueOf:Lcom/appsflyer/internal/bk;


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;Lcom/appsflyer/internal/bk;)V
    .locals 1

    .line 20
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 21
    iput-object p2, p0, Lcom/appsflyer/internal/components/network/http/exceptions/HttpException;->valueOf:Lcom/appsflyer/internal/bk;

    return-void
.end method


# virtual methods
.method public getMetrics()Lcom/appsflyer/internal/bk;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/appsflyer/internal/components/network/http/exceptions/HttpException;->valueOf:Lcom/appsflyer/internal/bk;

    return-object v0
.end method
