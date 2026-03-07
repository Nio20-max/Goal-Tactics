.class public final Lcom/appsflyer/internal/g;
.super Ljava/lang/Object;
.source ""


# instance fields
.field AFInAppEventParameterName:Ljava/lang/Boolean;

.field public final AFKeystoreWrapper:Ljava/lang/Boolean;

.field public final values:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0

    .line 1010
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1011
    iput-object p1, p0, Lcom/appsflyer/internal/g;->values:Ljava/lang/String;

    .line 1012
    iput-object p2, p0, Lcom/appsflyer/internal/g;->AFKeystoreWrapper:Ljava/lang/Boolean;

    return-void
.end method
