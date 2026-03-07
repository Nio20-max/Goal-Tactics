.class final Lcom/appsflyer/internal/ac$4;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/appsflyer/internal/ac;->performOnDeepLinking(Landroid/content/Intent;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private synthetic AFInAppEventParameterName:Landroid/content/Intent;

.field private synthetic AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

.field private synthetic valueOf:Landroid/content/Context;

.field private synthetic values:Lcom/appsflyer/internal/cl;


# direct methods
.method constructor <init>(Lcom/appsflyer/internal/ac;Landroid/content/Intent;Landroid/content/Context;Lcom/appsflyer/internal/cl;)V
    .locals 0

    .line 318
    iput-object p1, p0, Lcom/appsflyer/internal/ac$4;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    iput-object p2, p0, Lcom/appsflyer/internal/ac$4;->AFInAppEventParameterName:Landroid/content/Intent;

    iput-object p3, p0, Lcom/appsflyer/internal/ac$4;->valueOf:Landroid/content/Context;

    iput-object p4, p0, Lcom/appsflyer/internal/ac$4;->values:Lcom/appsflyer/internal/cl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 321
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    iget-object v3, p0, Lcom/appsflyer/internal/ac$4;->AFInAppEventParameterName:Landroid/content/Intent;

    iget-object v5, p0, Lcom/appsflyer/internal/ac$4;->valueOf:Landroid/content/Context;

    iget-object v2, p0, Lcom/appsflyer/internal/ac$4;->values:Lcom/appsflyer/internal/cl;

    iget-object v0, p0, Lcom/appsflyer/internal/ac$4;->AFKeystoreWrapper:Lcom/appsflyer/internal/ac;

    .line 324
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->values(Lcom/appsflyer/internal/ac;)Lcom/appsflyer/internal/bf;

    move-result-object v0

    .line 1110
    new-instance v4, Lcom/appsflyer/internal/bc;

    .line 1139
    iget-object v0, v0, Lcom/appsflyer/internal/bf;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    .line 2024
    iget-object v0, v0, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    if-eqz v0, :cond_2

    .line 1110
    invoke-static {v0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-direct {v4, v0}, Lcom/appsflyer/internal/bc;-><init>(Landroid/content/SharedPreferences;)V

    .line 2295
    invoke-static {v3}, Lcom/appsflyer/internal/f;->AFKeystoreWrapper(Landroid/content/Intent;)Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 2296
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 2297
    :goto_0
    invoke-static {v5}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v7, "ddl_sent"

    .line 2298
    invoke-interface {v6, v7, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    if-nez v0, :cond_1

    const/4 v0, 0x0

    const-string v1, "No direct deep link"

    .line 2300
    invoke-static {v1, v0}, Lcom/appsflyer/internal/ao;->AFInAppEventType(Ljava/lang/String;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    return-void

    .line 2302
    :cond_1
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual/range {v0 .. v5}, Lcom/appsflyer/internal/f;->valueOf(Ljava/util/Map;Lcom/appsflyer/internal/cl;Landroid/content/Intent;Lcom/appsflyer/internal/bv;Landroid/content/Context;)V

    return-void

    .line 1141
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Context must be set via setContext method before calling this dependency."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
