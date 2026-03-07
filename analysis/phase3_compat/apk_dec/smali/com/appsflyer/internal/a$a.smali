.class final Lcom/appsflyer/internal/a$a;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# static fields
.field static final valueOf:Lcom/appsflyer/internal/a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 98
    new-instance v0, Lcom/appsflyer/internal/a;

    invoke-direct {v0}, Lcom/appsflyer/internal/a;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/a$a;->valueOf:Lcom/appsflyer/internal/a;

    return-void
.end method
