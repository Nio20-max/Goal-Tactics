.class final Lcom/appsflyer/internal/ac$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/ac;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "b"
.end annotation


# instance fields
.field private synthetic AFInAppEventType:Lcom/appsflyer/internal/ac;

.field private final values:Lcom/appsflyer/internal/i;


# direct methods
.method private constructor <init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;)V
    .locals 0

    .line 3195
    iput-object p1, p0, Lcom/appsflyer/internal/ac$b;->AFInAppEventType:Lcom/appsflyer/internal/ac;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3196
    iput-object p2, p0, Lcom/appsflyer/internal/ac$b;->values:Lcom/appsflyer/internal/i;

    return-void
.end method

.method synthetic constructor <init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;B)V
    .locals 0

    .line 3192
    invoke-direct {p0, p1, p2}, Lcom/appsflyer/internal/ac$b;-><init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;)V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 3200
    iget-object v0, p0, Lcom/appsflyer/internal/ac$b;->AFInAppEventType:Lcom/appsflyer/internal/ac;

    iget-object v1, p0, Lcom/appsflyer/internal/ac$b;->values:Lcom/appsflyer/internal/i;

    invoke-static {v0, v1}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;)V

    return-void
.end method
