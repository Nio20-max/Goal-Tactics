.class final Lcom/appsflyer/internal/ac$2;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/ac;->init(Ljava/lang/String;Lcom/appsflyer/AppsFlyerConversionListener;Landroid/content/Context;)Lcom/appsflyer/AppsFlyerLib;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic AFInAppEventType:Lcom/appsflyer/internal/ac;

.field private synthetic valueOf:Lcom/appsflyer/internal/cx;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/cx;)V
    .locals 0

    .line 884
    iput-object p1, p0, Lcom/appsflyer/internal/ac$2;->AFInAppEventType:Lcom/appsflyer/internal/ac;

    iput-object p2, p0, Lcom/appsflyer/internal/ac$2;->valueOf:Lcom/appsflyer/internal/cx;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 887
    iget-object v0, p0, Lcom/appsflyer/internal/ac$2;->AFInAppEventType:Lcom/appsflyer/internal/ac;

    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Lcom/appsflyer/internal/ac;)Landroid/app/Application;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 888
    iget-object v1, p0, Lcom/appsflyer/internal/ac$2;->AFInAppEventType:Lcom/appsflyer/internal/ac;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Z)I

    move-result v1

    const-string v3, "newGPReferrerSent"

    .line 889
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 890
    iget-object v3, p0, Lcom/appsflyer/internal/ac$2;->valueOf:Lcom/appsflyer/internal/cx;

    .line 1048
    iget-object v3, v3, Lcom/appsflyer/internal/dd;->AFInAppEventParameterName:Lcom/appsflyer/internal/dd$d;

    .line 890
    sget-object v4, Lcom/appsflyer/internal/dd$d;->AFInAppEventType:Lcom/appsflyer/internal/dd$d;

    const/4 v5, 0x1

    if-ne v3, v4, :cond_0

    const/4 v2, 0x1

    :cond_0
    if-ne v1, v5, :cond_3

    if-nez v2, :cond_1

    if-eqz v0, :cond_3

    .line 892
    :cond_1
    iget-object v0, p0, Lcom/appsflyer/internal/ac$2;->AFInAppEventType:Lcom/appsflyer/internal/ac;

    new-instance v1, Lcom/appsflyer/internal/ci;

    invoke-direct {v1}, Lcom/appsflyer/internal/ci;-><init>()V

    iget-object v2, p0, Lcom/appsflyer/internal/ac$2;->AFInAppEventType:Lcom/appsflyer/internal/ac;

    invoke-static {v2}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Lcom/appsflyer/internal/ac;)Landroid/app/Application;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 1053
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Landroid/app/Application;

    iput-object v2, v1, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    .line 892
    :cond_2
    invoke-static {v0, v1}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Lcom/appsflyer/internal/ac;Lcom/appsflyer/internal/i;)V

    :cond_3
    return-void
.end method
