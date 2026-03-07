.class final Lcom/appsflyer/internal/aa$e;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/aa;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "e"
.end annotation


# instance fields
.field final AFInAppEventParameterName:Ljava/lang/String;

.field private final valueOf:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p1, p0, Lcom/appsflyer/internal/aa$e;->AFInAppEventParameterName:Ljava/lang/String;

    .line 50
    iput-boolean p2, p0, Lcom/appsflyer/internal/aa$e;->valueOf:Z

    return-void
.end method


# virtual methods
.method final AFKeystoreWrapper()Z
    .locals 1

    .line 58
    iget-boolean v0, p0, Lcom/appsflyer/internal/aa$e;->valueOf:Z

    return v0
.end method
