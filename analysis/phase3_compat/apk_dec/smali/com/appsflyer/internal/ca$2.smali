.class final Lcom/appsflyer/internal/ca$2;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Lcom/appsflyer/internal/bz$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/ca;->values()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic AFInAppEventType:Lcom/appsflyer/internal/ca;

.field private synthetic AFKeystoreWrapper:J


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/ca;J)V
    .locals 0

    .line 93
    iput-object p1, p0, Lcom/appsflyer/internal/ca$2;->AFInAppEventType:Lcom/appsflyer/internal/ca;

    iput-wide p2, p0, Lcom/appsflyer/internal/ca$2;->AFKeystoreWrapper:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final AFKeystoreWrapper(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 3

    .line 107
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "unknown"

    .line 111
    :cond_0
    iget-object v1, p0, Lcom/appsflyer/internal/ca$2;->AFInAppEventType:Lcom/appsflyer/internal/ca;

    .line 4015
    iget-object v1, v1, Lcom/appsflyer/internal/ca;->values:Ljava/util/Map;

    const-string v2, "error"

    .line 111
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    invoke-static {p1, p2}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final values(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 96
    iget-object v0, p0, Lcom/appsflyer/internal/ca$2;->AFInAppEventType:Lcom/appsflyer/internal/ca;

    .line 1015
    iget-object v0, v0, Lcom/appsflyer/internal/ca;->values:Ljava/util/Map;

    const-string v1, "signedData"

    .line 96
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    iget-object p1, p0, Lcom/appsflyer/internal/ca$2;->AFInAppEventType:Lcom/appsflyer/internal/ca;

    .line 2015
    iget-object p1, p1, Lcom/appsflyer/internal/ca;->values:Ljava/util/Map;

    const-string v0, "signature"

    .line 97
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iget-wide v0, p0, Lcom/appsflyer/internal/ca$2;->AFKeystoreWrapper:J

    sub-long/2addr p1, v0

    .line 100
    iget-object v0, p0, Lcom/appsflyer/internal/ca$2;->AFInAppEventType:Lcom/appsflyer/internal/ca;

    .line 3015
    iget-object v0, v0, Lcom/appsflyer/internal/ca;->values:Ljava/util/Map;

    .line 100
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string/jumbo p2, "ttr"

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "Successfully retrieved Google LVL data."

    .line 102
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    return-void
.end method
