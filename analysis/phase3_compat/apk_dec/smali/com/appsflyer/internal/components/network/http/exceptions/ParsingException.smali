.class public Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;
.super Ljava/io/IOException;
.source ""


# instance fields
.field private final AFInAppEventParameterName:Lcom/appsflyer/internal/br;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/appsflyer/internal/br<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/appsflyer/internal/br;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Throwable;",
            "Lcom/appsflyer/internal/br<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 18
    invoke-direct {p0, p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 19
    iput-object p3, p0, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;->AFInAppEventParameterName:Lcom/appsflyer/internal/br;

    return-void
.end method


# virtual methods
.method public getRawResponse()Lcom/appsflyer/internal/br;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/appsflyer/internal/br<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 24
    iget-object v0, p0, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;->AFInAppEventParameterName:Lcom/appsflyer/internal/br;

    return-object v0
.end method
