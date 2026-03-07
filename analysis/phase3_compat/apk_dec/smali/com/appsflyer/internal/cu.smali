.class public final Lcom/appsflyer/internal/cu;
.super Lcom/appsflyer/internal/ct;
.source ""


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 12
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v1, "af_purchase"

    invoke-direct {p0, v1, v0, p1}, Lcom/appsflyer/internal/ct;-><init>(Ljava/lang/String;Ljava/lang/Boolean;Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final AFInAppEventType(Ljava/lang/String;)Lcom/appsflyer/internal/i;
    .locals 0

    .line 17
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/cu;->values(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-super {p0, p1}, Lcom/appsflyer/internal/ct;->AFInAppEventType(Ljava/lang/String;)Lcom/appsflyer/internal/i;

    move-result-object p1

    return-object p1
.end method
