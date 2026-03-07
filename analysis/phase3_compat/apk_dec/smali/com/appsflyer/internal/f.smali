.class public final Lcom/appsflyer/internal/f;
.super Ljava/lang/Object;
.source ""


# static fields
.field static volatile AFInAppEventParameterName:Z

.field static final AFInAppEventType:I

.field static AFKeystoreWrapper:[Ljava/lang/String;

.field static AFLogger$LogLevel:[Ljava/lang/String;

.field private static AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/f;

.field public static valueOf:Landroid/content/Intent;


# instance fields
.field public AFVersionDeclaration:Ljava/lang/String;

.field public getLevel:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public init:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public values:Lcom/appsflyer/deeplink/DeepLinkListener;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 35
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    long-to-int v1, v0

    sput v1, Lcom/appsflyer/internal/f;->AFInAppEventType:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/appsflyer/internal/f;->init:Ljava/util/List;

    return-void
.end method

.method private AFInAppEventParameterName(Ljava/lang/Object;Ljava/util/Iterator;)Landroid/net/Uri;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/net/Uri;"
        }
    .end annotation

    .line 254
    :goto_0
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_0

    return-object v1

    .line 257
    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_2

    .line 258
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 259
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_1

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_1

    return-object p1

    :cond_1
    return-object v1

    .line 267
    :cond_2
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 268
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    return-object v1
.end method

.method static AFKeystoreWrapper(Landroid/content/Intent;)Landroid/net/Uri;
    .locals 2

    if-eqz p0, :cond_0

    .line 285
    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.VIEW"

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 286
    invoke-virtual {p0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static valueOf()Lcom/appsflyer/internal/f;
    .locals 1

    .line 52
    sget-object v0, Lcom/appsflyer/internal/f;->AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/f;

    if-nez v0, :cond_0

    .line 53
    new-instance v0, Lcom/appsflyer/internal/f;

    invoke-direct {v0}, Lcom/appsflyer/internal/f;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/f;->AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/f;

    .line 55
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/f;->AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/f;

    return-object v0
.end method

.method static synthetic valueOf(Ljava/lang/String;)Z
    .locals 0

    .line 34
    invoke-static {p0}, Lcom/appsflyer/internal/f;->values(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private values(Landroid/content/Intent;Landroid/content/Context;Ljava/util/Map;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    const-string v0, "android.intent.action.VIEW"

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    .line 4285
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 4286
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object v2, v1

    .line 177
    :goto_0
    sget-object v3, Lcom/appsflyer/internal/f;->valueOf:Landroid/content/Intent;

    if-eqz v3, :cond_1

    .line 5285
    invoke-virtual {v3}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 5286
    invoke-virtual {v3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    goto :goto_1

    :cond_1
    move-object v0, v1

    .line 6221
    :goto_1
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 6222
    iget-object v4, p0, Lcom/appsflyer/internal/f;->init:Ljava/util/List;

    if-eqz v4, :cond_7

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_7

    if-nez v3, :cond_2

    goto :goto_4

    .line 6225
    :cond_2
    iget-object v4, p0, Lcom/appsflyer/internal/f;->init:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    if-nez v5, :cond_4

    :goto_2
    move-object v6, v1

    goto :goto_3

    .line 6241
    :cond_4
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .line 6242
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_5

    goto :goto_2

    .line 6245
    :cond_5
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v3, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_6

    goto :goto_2

    .line 6249
    :cond_6
    invoke-direct {p0, v7, v6}, Lcom/appsflyer/internal/f;->AFInAppEventParameterName(Ljava/lang/Object;Ljava/util/Iterator;)Landroid/net/Uri;

    move-result-object v6

    :goto_3
    if-eqz v6, :cond_3

    .line 6228
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "Found deeplink in push payload at "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 6229
    invoke-static {p3}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    iget-object v3, p0, Lcom/appsflyer/internal/f;->init:Ljava/util/List;

    const-string v4, "payloadKey"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v6

    :cond_7
    :goto_4
    const/4 v3, 0x1

    const-string v4, " w/af_consumed"

    const/4 v5, 0x0

    const-string v6, "af_consumed"

    if-eqz v2, :cond_9

    .line 180
    invoke-virtual {p1, v6}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    .line 181
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v6, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 182
    invoke-virtual {p0, p2, p3, v2}, Lcom/appsflyer/internal/f;->AFInAppEventType(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V

    return v3

    .line 185
    :cond_8
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "skipping re-use of previously consumed deep link: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 186
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 185
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    return v5

    :cond_9
    if-eqz v0, :cond_b

    .line 192
    sget-object p1, Lcom/appsflyer/internal/f;->valueOf:Landroid/content/Intent;

    invoke-virtual {p1, v6}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_a

    .line 193
    sget-object p1, Lcom/appsflyer/internal/f;->valueOf:Landroid/content/Intent;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p1, v6, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 194
    invoke-virtual {p0, p2, p3, v0}, Lcom/appsflyer/internal/f;->AFInAppEventType(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V

    return v3

    .line 197
    :cond_a
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "skipping re-use of previously consumed trampoline deep link: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 198
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 197
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    return v5

    :cond_b
    if-eqz v1, :cond_d

    .line 203
    invoke-virtual {p1, v6}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    .line 204
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {p1, v6, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 205
    invoke-virtual {p0, p2, p3, v1}, Lcom/appsflyer/internal/f;->AFInAppEventType(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V

    return v3

    .line 208
    :cond_c
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "skipping re-use of previously consumed deep link from push: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 209
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    .line 208
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    return v5

    :cond_d
    const-string p1, "No deep link detected"

    .line 214
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    return v5
.end method

.method private static values(Ljava/lang/String;)Z
    .locals 3

    .line 76
    sget-object v0, Lcom/appsflyer/internal/f;->AFKeystoreWrapper:[Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const-string v0, "af_tranid="

    .line 80
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    .line 84
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Validate if link "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " belongs to ESP domains: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Lcom/appsflyer/internal/f;->AFKeystoreWrapper:[Ljava/lang/String;

    .line 85
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 84
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    .line 87
    :try_start_0
    sget-object v0, Lcom/appsflyer/internal/f;->AFKeystoreWrapper:[Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    return v1
.end method


# virtual methods
.method final AFInAppEventType(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/net/Uri;",
            ")V"
        }
    .end annotation

    .line 99
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/internal/f;->values(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    .line 104
    sput-boolean v0, Lcom/appsflyer/internal/f;->AFInAppEventParameterName:Z

    .line 4046
    sget-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    if-nez v0, :cond_0

    .line 4047
    new-instance v0, Lcom/appsflyer/internal/k;

    invoke-direct {v0}, Lcom/appsflyer/internal/k;-><init>()V

    sput-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 4049
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/k;->values:Lcom/appsflyer/internal/k;

    .line 4053
    iget-object v1, v0, Lcom/appsflyer/internal/k;->valueOf:Ljava/util/concurrent/ScheduledExecutorService;

    if-nez v1, :cond_1

    .line 4054
    iget-object v1, v0, Lcom/appsflyer/internal/k;->AFInAppEventType:Ljava/util/concurrent/ThreadFactory;

    invoke-static {v1}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v1

    iput-object v1, v0, Lcom/appsflyer/internal/k;->valueOf:Ljava/util/concurrent/ScheduledExecutorService;

    .line 4056
    :cond_1
    iget-object v0, v0, Lcom/appsflyer/internal/k;->valueOf:Ljava/util/concurrent/ScheduledExecutorService;

    .line 105
    new-instance v1, Lcom/appsflyer/internal/f$4;

    invoke-direct {v1, p0, p3, p2, p1}, Lcom/appsflyer/internal/f$4;-><init>(Lcom/appsflyer/internal/f;Landroid/net/Uri;Ljava/util/Map;Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 165
    :cond_2
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;Ljava/util/Map;Landroid/net/Uri;)V

    :goto_0
    const/4 p1, 0x0

    .line 168
    sput-object p1, Lcom/appsflyer/internal/f;->valueOf:Landroid/content/Intent;

    return-void
.end method

.method final valueOf(Ljava/util/Map;Lcom/appsflyer/internal/cl;Landroid/content/Intent;Lcom/appsflyer/internal/bv;Landroid/content/Context;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/appsflyer/internal/cl;",
            "Landroid/content/Intent;",
            "Lcom/appsflyer/internal/bv;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 63
    invoke-static {p5}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 64
    invoke-direct {p0, p3, p5, p1}, Lcom/appsflyer/internal/f;->values(Landroid/content/Intent;Landroid/content/Context;Ljava/util/Map;)Z

    move-result p1

    const-string p3, "ddl_sent"

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/appsflyer/internal/f;->values:Lcom/appsflyer/deeplink/DeepLinkListener;

    if-eqz p1, :cond_1

    .line 66
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Z)I

    move-result p1

    if-nez p1, :cond_1

    .line 67
    invoke-interface {v0, p3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_1

    .line 68
    new-instance p1, Lcom/appsflyer/internal/ar;

    invoke-direct {p1, p5, p2}, Lcom/appsflyer/internal/ar;-><init>(Landroid/content/Context;Lcom/appsflyer/internal/cl;)V

    const-string p2, "[DDL] start"

    .line 1068
    invoke-static {p2}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 1069
    new-instance p2, Ljava/util/concurrent/FutureTask;

    new-instance p5, Lcom/appsflyer/internal/ar$4;

    invoke-direct {p5, p1}, Lcom/appsflyer/internal/ar$4;-><init>(Lcom/appsflyer/internal/ar;)V

    invoke-direct {p2, p5}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 1078
    new-instance p5, Ljava/lang/Thread;

    invoke-direct {p5, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {p5}, Ljava/lang/Thread;->start()V

    const/4 p5, 0x0

    .line 1080
    :try_start_0
    sget-wide v0, Lcom/appsflyer/internal/ar;->onInstallConversionDataLoadedNative:J

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v0, v1, v2}, Ljava/util/concurrent/FutureTask;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/appsflyer/deeplink/DeepLinkResult;

    .line 1097
    iget-object v0, p1, Lcom/appsflyer/internal/ar;->onAppOpenAttributionNative:Lcom/appsflyer/internal/cl;

    sget-wide v1, Lcom/appsflyer/internal/ar;->onInstallConversionDataLoadedNative:J

    invoke-virtual {v0, p2, v1, v2}, Lcom/appsflyer/internal/cl;->AFInAppEventType(Lcom/appsflyer/deeplink/DeepLinkResult;J)V

    .line 1098
    invoke-static {p2}, Lcom/appsflyer/internal/ao;->AFInAppEventType(Lcom/appsflyer/deeplink/DeepLinkResult;)V
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 1090
    :catch_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "[DDL] Timeout, didn\'t manage to find deferred deep link after "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p1, Lcom/appsflyer/internal/ar;->onAttributionFailureNative:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " attempt(s) within "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-wide v0, Lcom/appsflyer/internal/ar;->onInstallConversionDataLoadedNative:J

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " milliseconds"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 1092
    new-instance p2, Lcom/appsflyer/deeplink/DeepLinkResult;

    sget-object v0, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->TIMEOUT:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    invoke-direct {p2, p5, v0}, Lcom/appsflyer/deeplink/DeepLinkResult;-><init>(Lcom/appsflyer/deeplink/DeepLink;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 3097
    iget-object p1, p1, Lcom/appsflyer/internal/ar;->onAppOpenAttributionNative:Lcom/appsflyer/internal/cl;

    sget-wide v0, Lcom/appsflyer/internal/ar;->onInstallConversionDataLoadedNative:J

    invoke-virtual {p1, p2, v0, v1}, Lcom/appsflyer/internal/cl;->AFInAppEventType(Lcom/appsflyer/deeplink/DeepLinkResult;J)V

    .line 3098
    invoke-static {p2}, Lcom/appsflyer/internal/ao;->AFInAppEventType(Lcom/appsflyer/deeplink/DeepLinkResult;)V

    goto :goto_2

    :catch_1
    move-exception p2

    goto :goto_0

    :catch_2
    move-exception p2

    :goto_0
    const-string v0, "[DDL] Error occurred"

    .line 1083
    invoke-static {v0, p2}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1084
    new-instance v0, Lcom/appsflyer/deeplink/DeepLinkResult;

    .line 1085
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    instance-of p2, p2, Ljava/io/IOException;

    if-eqz p2, :cond_0

    .line 1086
    sget-object p2, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->NETWORK:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    goto :goto_1

    .line 1087
    :cond_0
    sget-object p2, Lcom/appsflyer/deeplink/DeepLinkResult$Error;->UNEXPECTED:Lcom/appsflyer/deeplink/DeepLinkResult$Error;

    :goto_1
    invoke-direct {v0, p5, p2}, Lcom/appsflyer/deeplink/DeepLinkResult;-><init>(Lcom/appsflyer/deeplink/DeepLink;Lcom/appsflyer/deeplink/DeepLinkResult$Error;)V

    .line 2097
    iget-object p1, p1, Lcom/appsflyer/internal/ar;->onAppOpenAttributionNative:Lcom/appsflyer/internal/cl;

    sget-wide v1, Lcom/appsflyer/internal/ar;->onInstallConversionDataLoadedNative:J

    invoke-virtual {p1, v0, v1, v2}, Lcom/appsflyer/internal/cl;->AFInAppEventType(Lcom/appsflyer/deeplink/DeepLinkResult;J)V

    .line 2098
    invoke-static {v0}, Lcom/appsflyer/internal/ao;->AFInAppEventType(Lcom/appsflyer/deeplink/DeepLinkResult;)V

    :cond_1
    :goto_2
    const/4 p1, 0x1

    .line 70
    invoke-interface {p4, p3, p1}, Lcom/appsflyer/internal/bv;->AFInAppEventType(Ljava/lang/String;Z)V

    return-void
.end method
