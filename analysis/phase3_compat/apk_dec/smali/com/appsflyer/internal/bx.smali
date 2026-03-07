.class public final Lcom/appsflyer/internal/bx;
.super Ljava/lang/Object;
.source ""


# static fields
.field public static final AFInAppEventParameterName:Ljava/nio/charset/Charset;


# instance fields
.field public AFInAppEventType:J

.field public final AFKeystoreWrapper:Lcom/appsflyer/internal/bv;

.field public valueOf:J

.field public values:Lcom/appsflyer/internal/ao;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "UTF-8"

    .line 23
    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/appsflyer/internal/bx;->AFInAppEventParameterName:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>(Lcom/appsflyer/internal/bv;)V
    .locals 2

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/appsflyer/internal/bx;->AFKeystoreWrapper:Lcom/appsflyer/internal/bv;

    .line 34
    invoke-direct {p0}, Lcom/appsflyer/internal/bx;->values()Lcom/appsflyer/internal/ao;

    move-result-object v0

    iput-object v0, p0, Lcom/appsflyer/internal/bx;->values:Lcom/appsflyer/internal/ao;

    const-string v0, "af_rc_timestamp"

    .line 35
    invoke-interface {p1, v0}, Lcom/appsflyer/internal/bv;->AFKeystoreWrapper(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/appsflyer/internal/bx;->AFInAppEventType:J

    const-string v0, "af_rc_max_age"

    .line 36
    invoke-interface {p1, v0}, Lcom/appsflyer/internal/bv;->AFKeystoreWrapper(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/appsflyer/internal/bx;->valueOf:J

    return-void
.end method

.method private values()Lcom/appsflyer/internal/ao;
    .locals 4

    .line 75
    iget-object v0, p0, Lcom/appsflyer/internal/bx;->AFKeystoreWrapper:Lcom/appsflyer/internal/bv;

    const-string v1, "af_remote_config"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/appsflyer/internal/bv;->AFInAppEventType(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "CFG: No configuration found in cache"

    .line 77
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    return-object v2

    .line 81
    :cond_0
    :try_start_0
    new-instance v1, Ljava/lang/String;

    const/4 v3, 0x2

    invoke-static {v0, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    sget-object v3, Lcom/appsflyer/internal/bx;->AFInAppEventParameterName:Ljava/nio/charset/Charset;

    invoke-direct {v1, v0, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    .line 82
    new-instance v0, Lcom/appsflyer/internal/ao;

    invoke-direct {v0, v1}, Lcom/appsflyer/internal/ao;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "CFG: Error reading malformed configuration from cache, requires fetching from remote again"

    .line 84
    invoke-static {v1, v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v2
.end method
