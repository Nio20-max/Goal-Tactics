.class public final Lcom/appsflyer/internal/bd;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static AFInAppEventParameterName:Ljava/lang/String; = "https://%smonitorsdk.%s/remote-debug?app_id="

.field public static AFKeystoreWrapper:Ljava/lang/String; = "https://cdn-testsettings.appsflyersdk.com/android/v1/%s/settings"

.field public static values:Ljava/lang/String; = "https://cdn-settings.appsflyersdk.com/android/v1/%s/settings"


# instance fields
.field public final AFInAppEventType:Lcom/appsflyer/internal/ab;

.field private final AFLogger$LogLevel:Lcom/appsflyer/AppsFlyerProperties;

.field public final valueOf:Lcom/appsflyer/internal/aa;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/appsflyer/internal/ab;Lcom/appsflyer/internal/aa;Lcom/appsflyer/AppsFlyerProperties;)V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/appsflyer/internal/bd;->AFInAppEventType:Lcom/appsflyer/internal/ab;

    .line 52
    iput-object p2, p0, Lcom/appsflyer/internal/bd;->valueOf:Lcom/appsflyer/internal/aa;

    .line 53
    iput-object p3, p0, Lcom/appsflyer/internal/bd;->AFLogger$LogLevel:Lcom/appsflyer/AppsFlyerProperties;

    return-void
.end method


# virtual methods
.method public final AFInAppEventType()Z
    .locals 3

    .line 169
    iget-object v0, p0, Lcom/appsflyer/internal/bd;->AFLogger$LogLevel:Lcom/appsflyer/AppsFlyerProperties;

    const-string v1, "http_cache"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    return v2

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final AFKeystoreWrapper(Ljava/util/Map;)Lcom/appsflyer/internal/bl;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/appsflyer/internal/bl<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 76
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/appsflyer/internal/bd;->AFInAppEventParameterName:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    .line 1062
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    move-result-object v3

    invoke-virtual {v3}, Lcom/appsflyer/AppsFlyerLib;->getHostPrefix()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v3

    invoke-virtual {v3}, Lcom/appsflyer/AppsFlyerLib;->getHostName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/appsflyer/internal/bd;->valueOf:Lcom/appsflyer/internal/aa;

    .line 2050
    iget-object v1, v1, Lcom/appsflyer/internal/aa;->AFInAppEventParameterName:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 77
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v4

    .line 78
    new-instance p1, Lcom/appsflyer/internal/z;

    .line 82
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v6

    const-string v5, "POST"

    const/4 v7, 0x0

    move-object v2, p1

    invoke-direct/range {v2 .. v7}, Lcom/appsflyer/internal/z;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/util/Map;Z)V

    .line 84
    new-instance v0, Lcom/appsflyer/internal/bj;

    invoke-direct {v0}, Lcom/appsflyer/internal/bj;-><init>()V

    .line 2133
    invoke-virtual {p0}, Lcom/appsflyer/internal/bd;->AFInAppEventType()Z

    move-result v1

    .line 3107
    iput-boolean v1, p1, Lcom/appsflyer/internal/z;->AFInAppEventParameterName:Z

    .line 2134
    iget-object v1, p0, Lcom/appsflyer/internal/bd;->AFInAppEventType:Lcom/appsflyer/internal/ab;

    .line 4021
    new-instance v2, Lcom/appsflyer/internal/bl;

    iget-object v3, v1, Lcom/appsflyer/internal/ab;->AFKeystoreWrapper:Ljava/util/concurrent/ExecutorService;

    iget-object v1, v1, Lcom/appsflyer/internal/ab;->valueOf:Lcom/appsflyer/internal/bm;

    invoke-direct {v2, p1, v3, v1, v0}, Lcom/appsflyer/internal/bl;-><init>(Lcom/appsflyer/internal/z;Ljava/util/concurrent/ExecutorService;Lcom/appsflyer/internal/bm;Lcom/appsflyer/internal/bq;)V

    return-object v2
.end method
