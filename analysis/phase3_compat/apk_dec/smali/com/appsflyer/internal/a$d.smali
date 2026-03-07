.class final Lcom/appsflyer/internal/a$d;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "d"
.end annotation


# instance fields
.field final AFInAppEventType:F

.field final AFKeystoreWrapper:Ljava/lang/String;


# direct methods
.method constructor <init>(FLjava/lang/String;)V
    .locals 0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput p1, p0, Lcom/appsflyer/internal/a$d;->AFInAppEventType:F

    .line 85
    iput-object p2, p0, Lcom/appsflyer/internal/a$d;->AFKeystoreWrapper:Ljava/lang/String;

    return-void
.end method
