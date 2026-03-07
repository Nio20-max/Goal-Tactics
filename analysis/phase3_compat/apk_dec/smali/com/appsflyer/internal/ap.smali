.class public final Lcom/appsflyer/internal/ap;
.super Ljava/lang/Object;
.source ""


# instance fields
.field private AFInAppEventParameterName:J

.field private AFInAppEventType:I

.field private AFKeystoreWrapper:Ljava/lang/String;

.field private AFLogger$LogLevel:Lcom/appsflyer/internal/cw;

.field private AppsFlyer2dXConversionCallback:Ljava/lang/Throwable;

.field private valueOf:J

.field private values:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJILcom/appsflyer/internal/cw;Ljava/lang/Throwable;)V
    .locals 0

    .line 1055
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1056
    iput-object p1, p0, Lcom/appsflyer/internal/ap;->values:Ljava/lang/String;

    .line 1057
    iput-object p2, p0, Lcom/appsflyer/internal/ap;->AFKeystoreWrapper:Ljava/lang/String;

    .line 1058
    iput-wide p3, p0, Lcom/appsflyer/internal/ap;->valueOf:J

    .line 1059
    iput-wide p5, p0, Lcom/appsflyer/internal/ap;->AFInAppEventParameterName:J

    .line 1060
    iput p7, p0, Lcom/appsflyer/internal/ap;->AFInAppEventType:I

    .line 1061
    iput-object p8, p0, Lcom/appsflyer/internal/ap;->AFLogger$LogLevel:Lcom/appsflyer/internal/cw;

    .line 1062
    iput-object p9, p0, Lcom/appsflyer/internal/ap;->AppsFlyer2dXConversionCallback:Ljava/lang/Throwable;

    return-void
.end method

.method public static AFKeystoreWrapper(Landroid/app/Activity;)Landroid/net/Uri;
    .locals 2

    .line 29
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x16

    if-lt v0, v1, :cond_0

    .line 30
    invoke-virtual {p0}, Landroid/app/Activity;->getReferrer()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    .line 32
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "android.intent.extra.REFERRER"

    .line 33
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    if-eqz v0, :cond_1

    return-object v0

    :cond_1
    const-string v0, "android.intent.extra.REFERRER_NAME"

    .line 37
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 39
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final AFKeystoreWrapper()Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1066
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 1067
    iget-object v1, p0, Lcom/appsflyer/internal/ap;->AFKeystoreWrapper:Ljava/lang/String;

    const-string v2, "cdn_token"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1068
    iget-object v1, p0, Lcom/appsflyer/internal/ap;->values:Ljava/lang/String;

    if-eqz v1, :cond_0

    const-string v2, "c_ver"

    .line 1069
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1071
    :cond_0
    iget-wide v1, p0, Lcom/appsflyer/internal/ap;->valueOf:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_1

    .line 1072
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "latency"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1074
    :cond_1
    iget-wide v1, p0, Lcom/appsflyer/internal/ap;->AFInAppEventParameterName:J

    cmp-long v5, v1, v3

    if-lez v5, :cond_2

    .line 1075
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-string v2, "delay"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1077
    :cond_2
    iget v1, p0, Lcom/appsflyer/internal/ap;->AFInAppEventType:I

    if-lez v1, :cond_3

    .line 1078
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "res_code"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1080
    :cond_3
    iget-object v1, p0, Lcom/appsflyer/internal/ap;->AppsFlyer2dXConversionCallback:Ljava/lang/Throwable;

    if-eqz v1, :cond_4

    .line 1081
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/appsflyer/internal/ap;->AppsFlyer2dXConversionCallback:Ljava/lang/Throwable;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/appsflyer/internal/ap;->AppsFlyer2dXConversionCallback:Ljava/lang/Throwable;

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "error"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1083
    :cond_4
    iget-object v1, p0, Lcom/appsflyer/internal/ap;->AFLogger$LogLevel:Lcom/appsflyer/internal/cw;

    if-eqz v1, :cond_5

    .line 1084
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "sig"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_5
    return-object v0
.end method
