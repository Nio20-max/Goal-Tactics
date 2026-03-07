.class public final Lcom/appsflyer/internal/as;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private final AFInAppEventParameterName:Z

.field public final AFInAppEventType:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final valueOf:Z

.field public final values:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(ZZLjava/util/List;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1023
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1024
    iput-boolean p1, p0, Lcom/appsflyer/internal/as;->valueOf:Z

    .line 1025
    iput-boolean p2, p0, Lcom/appsflyer/internal/as;->AFInAppEventParameterName:Z

    .line 1026
    iput-object p3, p0, Lcom/appsflyer/internal/as;->values:Ljava/util/List;

    .line 1027
    iput-object p4, p0, Lcom/appsflyer/internal/as;->AFInAppEventType:Ljava/util/Map;

    return-void
.end method

.method static AFInAppEventParameterName(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5

    const/4 v0, 0x0

    .line 23
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 24
    :try_start_1
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p0

    const-string v2, "disableProxy"

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lcom/appsflyer/AppsFlyerProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    const-string v2, "monitor"

    .line 25
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    if-nez p0, :cond_0

    .line 29
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object p0

    invoke-virtual {p0}, Lcom/appsflyer/internal/ak;->AFKeystoreWrapper()V

    goto :goto_0

    .line 31
    :cond_0
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object p0

    invoke-virtual {p0}, Lcom/appsflyer/internal/ak;->valueOf()V

    .line 32
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object p0

    invoke-virtual {p0}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName()V

    :goto_0
    const-string p0, "ol_id"

    .line 36
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_3

    const-string p0, "ol_scheme"

    .line 38
    invoke-virtual {v1, p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v2, "ol_domain"

    .line 39
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "ol_ver"

    .line 40
    invoke-virtual {v1, v3, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz p0, :cond_1

    .line 43
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v3

    const-string v4, "onelinkScheme"

    invoke-virtual {v3, v4, p0}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    if-eqz v2, :cond_2

    .line 46
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p0

    const-string v3, "onelinkDomain"

    invoke-virtual {p0, v3, v2}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    if-eqz v0, :cond_3

    .line 49
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object p0

    const-string v2, "onelinkVersion"

    invoke-virtual {p0, v2, v0}, Lcom/appsflyer/AppsFlyerProperties;->set(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p0

    move-object v0, v1

    goto :goto_1

    :catchall_1
    move-exception p0

    .line 54
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 55
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object p0

    invoke-virtual {p0}, Lcom/appsflyer/internal/ak;->valueOf()V

    .line 56
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object p0

    invoke-virtual {p0}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName()V

    move-object v1, v0

    :cond_3
    :goto_2
    return-object v1
.end method


# virtual methods
.method public final AFInAppEventParameterName()Z
    .locals 1

    .line 1032
    iget-boolean v0, p0, Lcom/appsflyer/internal/as;->valueOf:Z

    return v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_6

    .line 1053
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_0

    .line 1054
    :cond_1
    check-cast p1, Lcom/appsflyer/internal/as;

    .line 1055
    iget-boolean v2, p0, Lcom/appsflyer/internal/as;->valueOf:Z

    iget-boolean v3, p1, Lcom/appsflyer/internal/as;->valueOf:Z

    if-eq v2, v3, :cond_2

    return v1

    .line 1056
    :cond_2
    iget-boolean v2, p0, Lcom/appsflyer/internal/as;->AFInAppEventParameterName:Z

    iget-boolean v3, p1, Lcom/appsflyer/internal/as;->AFInAppEventParameterName:Z

    if-eq v2, v3, :cond_3

    return v1

    .line 1057
    :cond_3
    iget-object v2, p0, Lcom/appsflyer/internal/as;->values:Ljava/util/List;

    iget-object v3, p1, Lcom/appsflyer/internal/as;->values:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    return v1

    .line 1058
    :cond_4
    iget-object v2, p0, Lcom/appsflyer/internal/as;->AFInAppEventType:Ljava/util/Map;

    iget-object p1, p1, Lcom/appsflyer/internal/as;->AFInAppEventType:Ljava/util/Map;

    if-eqz v2, :cond_5

    invoke-interface {v2, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_5
    if-nez p1, :cond_6

    return v0

    :cond_6
    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 2

    .line 1063
    iget-boolean v0, p0, Lcom/appsflyer/internal/as;->valueOf:Z

    mul-int/lit8 v0, v0, 0x1f

    .line 1064
    iget-boolean v1, p0, Lcom/appsflyer/internal/as;->AFInAppEventParameterName:Z

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 1065
    iget-object v1, p0, Lcom/appsflyer/internal/as;->values:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    .line 1066
    iget-object v1, p0, Lcom/appsflyer/internal/as;->AFInAppEventType:Ljava/util/Map;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public final valueOf()Z
    .locals 1

    .line 1036
    iget-boolean v0, p0, Lcom/appsflyer/internal/as;->AFInAppEventParameterName:Z

    return v0
.end method
