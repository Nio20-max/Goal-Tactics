.class final Lcom/appsflyer/internal/dd$3;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/util/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/dd;->values()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic values:Lcom/appsflyer/internal/dd;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/dd;)V
    .locals 0

    .line 30
    iput-object p1, p0, Lcom/appsflyer/internal/dd$3;->values:Lcom/appsflyer/internal/dd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final update(Ljava/util/Observable;Ljava/lang/Object;)V
    .locals 0

    .line 33
    iget-object p1, p0, Lcom/appsflyer/internal/dd$3;->values:Lcom/appsflyer/internal/dd;

    .line 1013
    iget-object p1, p1, Lcom/appsflyer/internal/dd;->values:Ljava/lang/Runnable;

    .line 33
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method
