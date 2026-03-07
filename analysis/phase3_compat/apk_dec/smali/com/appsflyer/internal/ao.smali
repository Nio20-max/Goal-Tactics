.class public final Lcom/appsflyer/internal/ao;
.super Ljava/lang/Object;
.source ""


# instance fields
.field public final AFInAppEventParameterName:Ljava/lang/String;

.field private final AFInAppEventType:Z

.field public final AFKeystoreWrapper:Lcom/appsflyer/internal/cs;

.field public final valueOf:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 2017
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 2023
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "ver"

    .line 2024
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/appsflyer/internal/ao;->valueOf:Ljava/lang/String;

    const-string/jumbo v2, "test_mode"

    .line 2025
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/appsflyer/internal/ao;->AFInAppEventType:Z

    .line 2026
    iput-object p1, p0, Lcom/appsflyer/internal/ao;->AFInAppEventParameterName:Ljava/lang/String;

    const-string p1, "default"

    .line 2027
    invoke-virtual {v1, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2028
    sget-object p1, Lcom/appsflyer/internal/cs;->valueOf:Lcom/appsflyer/internal/cs;

    goto :goto_0

    .line 2029
    :cond_0
    sget-object p1, Lcom/appsflyer/internal/cs;->values:Lcom/appsflyer/internal/cs;

    :goto_0
    iput-object p1, p0, Lcom/appsflyer/internal/ao;->AFKeystoreWrapper:Lcom/appsflyer/internal/cs;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    .line 2031
    :catch_0
    new-instance p1, Lorg/json/JSONException;

    const-string v0, "Failed to parse remote configuration JSON"

    invoke-direct {p1, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 2020
    :cond_1
    new-instance p1, Lorg/json/JSONException;

    const-string v0, "Failed to parse remote configuration JSON: originalJson is null"

    invoke-direct {p1, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static AFInAppEventType(Lcom/appsflyer/deeplink/DeepLinkResult;)V
    .locals 2

    .line 43
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    move-result-object v0

    iget-object v0, v0, Lcom/appsflyer/internal/f;->values:Lcom/appsflyer/deeplink/DeepLinkListener;

    if-eqz v0, :cond_0

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[DDL] Calling onDeepLinking with:\n"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 46
    :try_start_0
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    move-result-object v0

    iget-object v0, v0, Lcom/appsflyer/internal/f;->values:Lcom/appsflyer/deeplink/DeepLinkListener;

    invoke-interface {v0, p0}, Lcom/appsflyer/deeplink/DeepLinkListener;->onDeepLinking(Lcom/appsflyer/deeplink/DeepLinkResult;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    :cond_0
    const-string p0, "[DDL] skipping, no callback registered"

    .line 51
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    return-void
.end method

.method public static AFInAppEventType(Ljava/lang/String;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V
    .locals 1

    .line 19
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    move-result-object v0

    iget-object v0, v0, Lcom/appsflyer/internal/f;->values:Lcom/appsflyer/deeplink/DeepLinkListener;

    if-eqz v0, :cond_0

    .line 20
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "[DDL] Error occurred: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 21
    new-instance p0, Lcom/appsflyer/deeplink/DeepLinkResult;

    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/appsflyer/deeplink/DeepLinkResult;-><init>(Lcom/appsflyer/deeplink/DeepLink;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    invoke-static {p0}, Lcom/appsflyer/internal/ao;->AFInAppEventType(Lcom/appsflyer/deeplink/DeepLinkResult;)V

    return-void

    .line 22
    :cond_0
    invoke-static {p0}, Lcom/appsflyer/internal/ao;->AFKeystoreWrapper(Ljava/lang/String;)V

    return-void
.end method

.method public static AFInAppEventType(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 26
    invoke-static {}, Lcom/appsflyer/internal/f;->valueOf()Lcom/appsflyer/internal/f;

    move-result-object v0

    iget-object v0, v0, Lcom/appsflyer/internal/f;->values:Lcom/appsflyer/deeplink/DeepLinkListener;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 30
    :try_start_0
    invoke-static {p0}, Lcom/appsflyer/deeplink/DeepLink;->valueOf(Ljava/util/Map;)Lcom/appsflyer/deeplink/DeepLink;

    move-result-object p0

    .line 1139
    iget-object v1, p0, Lcom/appsflyer/deeplink/DeepLink;->valueOf:Lorg/json/JSONObject;

    const-string v2, "is_deferred"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    new-instance v1, Lcom/appsflyer/deeplink/DeepLinkResult;

    invoke-direct {v1, p0, v0}, Lcom/appsflyer/deeplink/DeepLinkResult;-><init>(Lcom/appsflyer/deeplink/DeepLink;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    :goto_0
    invoke-static {v1}, Lcom/appsflyer/internal/ao;->AFInAppEventType(Lcom/appsflyer/deeplink/DeepLinkResult;)V

    return-void

    :catchall_0
    move-exception p0

    goto :goto_1

    :catch_0
    move-exception p0

    :try_start_1
    const-string v1, "[DDL] Error occurred"

    .line 32
    invoke-static {v1, p0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 33
    sget-object p0, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->UNEXPECTED:Lcom/appsflyer/deeplink/DeepLinkResult$Error;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    new-instance v1, Lcom/appsflyer/deeplink/DeepLinkResult;

    invoke-direct {v1, v0, p0}, Lcom/appsflyer/deeplink/DeepLinkResult;-><init>(Lcom/appsflyer/deeplink/DeepLink;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    goto :goto_0

    :goto_1
    new-instance v1, Lcom/appsflyer/deeplink/DeepLinkResult;

    invoke-direct {v1, v0, v0}, Lcom/appsflyer/deeplink/DeepLinkResult;-><init>(Lcom/appsflyer/deeplink/DeepLink;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    invoke-static {v1}, Lcom/appsflyer/internal/ao;->AFInAppEventType(Lcom/appsflyer/deeplink/DeepLinkResult;)V

    .line 36
    throw p0

    .line 38
    :cond_0
    invoke-static {p0}, Lcom/appsflyer/internal/ao;->AFKeystoreWrapper(Ljava/util/Map;)V

    return-void
.end method

.method private static AFKeystoreWrapper(Ljava/lang/String;)V
    .locals 2

    .line 67
    sget-object v0, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener;

    if-eqz v0, :cond_0

    :try_start_0
    const-string v0, "Calling onAppOpenAttributionFailure with: "

    .line 69
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 70
    sget-object v0, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener;

    invoke-interface {v0, p0}, Lcom/appsflyer/AppsFlyerConversionListener;->onAttributionFailure(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 72
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method private static AFKeystoreWrapper(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 56
    sget-object v0, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener;

    if-eqz v0, :cond_0

    .line 58
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Calling onAppOpenAttribution with:\n"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 59
    sget-object v0, Lcom/appsflyer/internal/ac;->AFKeystoreWrapper:Lcom/appsflyer/AppsFlyerConversionListener;

    invoke-interface {v0, p0}, Lcom/appsflyer/AppsFlyerConversionListener;->onAppOpenAttribution(Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 61
    invoke-virtual {p0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    if-ne p0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_4

    .line 2057
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_1

    goto :goto_0

    .line 2059
    :cond_1
    check-cast p1, Lcom/appsflyer/internal/ao;

    .line 2061
    iget-boolean v1, p0, Lcom/appsflyer/internal/ao;->AFInAppEventType:Z

    iget-boolean v2, p1, Lcom/appsflyer/internal/ao;->AFInAppEventType:Z

    if-eq v1, v2, :cond_2

    return v0

    .line 2062
    :cond_2
    iget-object v1, p0, Lcom/appsflyer/internal/ao;->valueOf:Ljava/lang/String;

    iget-object v2, p1, Lcom/appsflyer/internal/ao;->valueOf:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    return v0

    .line 2063
    :cond_3
    iget-object v0, p0, Lcom/appsflyer/internal/ao;->AFInAppEventParameterName:Ljava/lang/String;

    iget-object p1, p1, Lcom/appsflyer/internal/ao;->AFInAppEventParameterName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_4
    :goto_0
    return v0
.end method

.method public final hashCode()I
    .locals 2

    .line 2068
    iget-boolean v0, p0, Lcom/appsflyer/internal/ao;->AFInAppEventType:Z

    mul-int/lit8 v0, v0, 0x1f

    .line 2069
    iget-object v1, p0, Lcom/appsflyer/internal/ao;->valueOf:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 2070
    iget-object v1, p0, Lcom/appsflyer/internal/ao;->AFInAppEventParameterName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
