.class public final Lcom/appsflyer/internal/ck;
.super Lcom/appsflyer/internal/i;
.source ""


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 8
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const/4 v1, 0x0

    invoke-direct {p0, v1, v1, v0, v1}, Lcom/appsflyer/internal/i;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final AFInAppEventType(Ljava/lang/String;)Lcom/appsflyer/internal/i;
    .locals 0

    .line 13
    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/ck;->values(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-super {p0, p1}, Lcom/appsflyer/internal/i;->AFInAppEventType(Ljava/lang/String;)Lcom/appsflyer/internal/i;

    move-result-object p1

    return-object p1
.end method
