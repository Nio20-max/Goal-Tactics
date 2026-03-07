.class final Lcom/appsflyer/internal/ar$1;
.super Ljava/util/HashMap;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/ar;->valueOf(Lcom/appsflyer/internal/g;)Ljava/util/Map;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private synthetic values:Lcom/appsflyer/internal/g;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/g;)V
    .locals 1

    .line 109
    iput-object p1, p0, Lcom/appsflyer/internal/ar$1;->values:Lcom/appsflyer/internal/g;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo p1, "type"

    const-string/jumbo v0, "unhashed"

    .line 110
    invoke-virtual {p0, p1, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    iget-object p1, p0, Lcom/appsflyer/internal/ar$1;->values:Lcom/appsflyer/internal/g;

    .line 1024
    iget-object p1, p1, Lcom/appsflyer/internal/g;->values:Ljava/lang/String;

    const-string/jumbo v0, "value"

    .line 111
    invoke-virtual {p0, v0, p1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
