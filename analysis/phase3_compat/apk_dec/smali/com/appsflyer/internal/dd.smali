.class public abstract Lcom/appsflyer/internal/dd;
.super Ljava/util/Observable;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/dd$d;
    }
.end annotation


# instance fields
.field public AFInAppEventParameterName:Lcom/appsflyer/internal/dd$d;

.field public final AFInAppEventType:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final AFKeystoreWrapper:Ljava/lang/String;

.field private valueOf:J

.field final values:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/Runnable;)V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/util/Observable;-><init>()V

    .line 14
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/dd;->AFInAppEventType:Ljava/util/Map;

    .line 17
    sget-object v0, Lcom/appsflyer/internal/dd$d;->AFInAppEventType:Lcom/appsflyer/internal/dd$d;

    iput-object v0, p0, Lcom/appsflyer/internal/dd;->AFInAppEventParameterName:Lcom/appsflyer/internal/dd$d;

    .line 21
    iput-object p2, p0, Lcom/appsflyer/internal/dd;->values:Ljava/lang/Runnable;

    .line 22
    iput-object p1, p0, Lcom/appsflyer/internal/dd;->AFKeystoreWrapper:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public abstract AFInAppEventParameterName(Landroid/content/Context;)V
.end method

.method public final valueOf()V
    .locals 5

    .line 39
    iget-object v0, p0, Lcom/appsflyer/internal/dd;->AFInAppEventType:Ljava/util/Map;

    iget-object v1, p0, Lcom/appsflyer/internal/dd;->AFKeystoreWrapper:Ljava/lang/String;

    const-string v2, "source"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    iget-object v0, p0, Lcom/appsflyer/internal/dd;->AFInAppEventType:Ljava/util/Map;

    new-instance v1, Lcom/appsflyer/internal/da;

    invoke-direct {v1}, Lcom/appsflyer/internal/da;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 41
    iget-object v0, p0, Lcom/appsflyer/internal/dd;->AFInAppEventType:Ljava/util/Map;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/appsflyer/internal/dd;->valueOf:J

    sub-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "latency"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    sget-object v0, Lcom/appsflyer/internal/dd$d;->AFKeystoreWrapper:Lcom/appsflyer/internal/dd$d;

    iput-object v0, p0, Lcom/appsflyer/internal/dd;->AFInAppEventParameterName:Lcom/appsflyer/internal/dd$d;

    .line 43
    invoke-virtual {p0}, Lcom/appsflyer/internal/dd;->setChanged()V

    .line 44
    invoke-virtual {p0}, Ljava/util/Observable;->notifyObservers()V

    return-void
.end method

.method public final values()V
    .locals 2

    .line 28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/appsflyer/internal/dd;->valueOf:J

    .line 29
    sget-object v0, Lcom/appsflyer/internal/dd$d;->AFInAppEventParameterName:Lcom/appsflyer/internal/dd$d;

    iput-object v0, p0, Lcom/appsflyer/internal/dd;->AFInAppEventParameterName:Lcom/appsflyer/internal/dd$d;

    .line 30
    new-instance v0, Lcom/appsflyer/internal/dd$3;

    invoke-direct {v0, p0}, Lcom/appsflyer/internal/dd$3;-><init>(Lcom/appsflyer/internal/dd;)V

    invoke-virtual {p0, v0}, Ljava/util/Observable;->addObserver(Ljava/util/Observer;)V

    return-void
.end method
