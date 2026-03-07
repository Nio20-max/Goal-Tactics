.class public abstract Lcom/appsflyer/internal/i;
.super Ljava/lang/Object;
.source ""


# instance fields
.field AFInAppEventParameterName:Lcom/appsflyer/attribution/AppsFlyerRequestListener;

.field public final AFInAppEventType:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public AFKeystoreWrapper:Landroid/app/Application;

.field AFLogger$LogLevel:[B

.field AFVersionDeclaration:Ljava/lang/String;

.field AppsFlyer2dXConversionCallback:Ljava/lang/String;

.field getLevel:Ljava/lang/String;

.field init:Ljava/lang/String;

.field onDeepLinkingNative:Ljava/lang/String;

.field private final onInstallConversionDataLoadedNative:Z

.field public onInstallConversionFailureNative:I

.field valueOf:Ljava/lang/String;

.field values:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, v0, v0, v0, v0}, Lcom/appsflyer/internal/i;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;Landroid/content/Context;)V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    .line 46
    iput-object p1, p0, Lcom/appsflyer/internal/i;->getLevel:Ljava/lang/String;

    .line 47
    iput-object p2, p0, Lcom/appsflyer/internal/i;->onDeepLinkingNative:Ljava/lang/String;

    if-eqz p3, :cond_0

    .line 48
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    iput-boolean p1, p0, Lcom/appsflyer/internal/i;->onInstallConversionDataLoadedNative:Z

    if-eqz p4, :cond_1

    .line 1053
    invoke-virtual {p4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Landroid/app/Application;

    iput-object p1, p0, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    :cond_1
    return-void
.end method


# virtual methods
.method public final AFInAppEventParameterName(Ljava/util/Map;)Lcom/appsflyer/internal/i;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)",
            "Lcom/appsflyer/internal/i;"
        }
    .end annotation

    .line 153
    monitor-enter p1

    .line 154
    :try_start_0
    iget-object v0, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 155
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception v0

    monitor-exit p1

    throw v0
.end method

.method public final AFInAppEventParameterName()[B
    .locals 1

    .line 196
    iget-object v0, p0, Lcom/appsflyer/internal/i;->AFLogger$LogLevel:[B

    return-object v0
.end method

.method public AFInAppEventType(Ljava/lang/String;)Lcom/appsflyer/internal/i;
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/appsflyer/internal/i;->onDeepLinkingNative:Ljava/lang/String;

    return-object p0
.end method

.method public final AFInAppEventType()Z
    .locals 1

    .line 209
    iget-boolean v0, p0, Lcom/appsflyer/internal/i;->onInstallConversionDataLoadedNative:Z

    return v0
.end method

.method public final valueOf(I)Lcom/appsflyer/internal/i;
    .locals 4

    .line 172
    iput p1, p0, Lcom/appsflyer/internal/i;->onInstallConversionFailureNative:I

    .line 173
    iget-object v0, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    monitor-enter v0

    .line 176
    :try_start_0
    iget-object v1, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const-string v2, "counter"

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 177
    iget-object v1, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const-string v2, "counter"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    :cond_0
    iget-object v1, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const-string v2, "launch_counter"

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 180
    iget-object v1, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    const-string v2, "launch_counter"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public final valueOf()Z
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/appsflyer/internal/i;->getLevel:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/appsflyer/internal/i;->init:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected final values(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 214
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v0

    .line 1058
    iget-object v1, p0, Lcom/appsflyer/internal/i;->AFKeystoreWrapper:Landroid/app/Application;

    .line 214
    invoke-virtual {v0, v1}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 216
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    .line 217
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v1, "channel"

    .line 218
    invoke-virtual {p1, v1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    .line 219
    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    .line 220
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method

.method public final values()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 168
    iget-object v0, p0, Lcom/appsflyer/internal/i;->AFInAppEventType:Ljava/util/Map;

    return-object v0
.end method
