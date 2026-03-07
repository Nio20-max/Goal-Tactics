.class public Lcom/appsflyer/internal/cx;
.super Lcom/appsflyer/internal/dd;
.source ""


# instance fields
.field public final valueOf:Ljava/util/Map;
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
.method public constructor <init>(Ljava/lang/Runnable;)V
    .locals 1

    const-string v0, "google"

    .line 38
    invoke-direct {p0, v0, p1}, Lcom/appsflyer/internal/dd;-><init>(Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 35
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/internal/cx;->valueOf:Ljava/util/Map;

    return-void
.end method

.method private static AFKeystoreWrapper(Landroid/content/Context;)Z
    .locals 3

    .line 43
    invoke-static {}, Lcom/appsflyer/internal/ac;->AFInAppEventParameterName()Lcom/appsflyer/internal/ac;

    move-result-object v0

    .line 44
    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/appsflyer/internal/ac;->valueOf(Landroid/content/SharedPreferences;Z)I

    move-result v0

    if-lez v0, :cond_0

    const-string p0, "Install referrer will not load, the counter > 1, "

    .line 46
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    return v2

    :cond_0
    const-string v0, "com.android.installreferrer.api.InstallReferrerClient"

    .line 51
    :try_start_0
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    const-string v1, "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE"

    .line 52
    invoke-static {p0, v1}, Lcom/appsflyer/internal/z;->AFInAppEventType(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "Install referrer is allowed"

    .line 53
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p0, 0x1

    return p0

    :cond_1
    const-string p0, "Install referrer is not allowed"

    .line 63
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    return v2

    :catchall_0
    move-exception p0

    const-string v1, "An error occurred while trying to verify manifest : "

    .line 60
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v2

    .line 57
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "Class "

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " not found"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    return v2
.end method


# virtual methods
.method public final AFInAppEventParameterName(Landroid/content/Context;)V
    .locals 2

    .line 68
    invoke-static {p1}, Lcom/appsflyer/internal/cx;->AFKeystoreWrapper(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 69
    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/dd;->values()V

    .line 71
    :try_start_0
    invoke-static {p1}, Lcom/android/installreferrer/api/InstallReferrerClient;->newBuilder(Landroid/content/Context;)Lcom/android/installreferrer/api/InstallReferrerClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/installreferrer/api/InstallReferrerClient$Builder;->build()Lcom/android/installreferrer/api/InstallReferrerClient;

    move-result-object v0

    const-string v1, "Connecting to Install Referrer Library..."

    .line 72
    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;)V

    .line 73
    new-instance v1, Lcom/appsflyer/internal/cx$5;

    invoke-direct {v1, p0, p1, v0}, Lcom/appsflyer/internal/cx$5;-><init>(Lcom/appsflyer/internal/cx;Landroid/content/Context;Lcom/android/installreferrer/api/InstallReferrerClient;)V

    invoke-virtual {v0, v1}, Lcom/android/installreferrer/api/InstallReferrerClient;->startConnection(Lcom/android/installreferrer/api/InstallReferrerStateListener;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p1

    const-string v0, "referrerClient -> startConnection"

    .line 154
    invoke-static {v0, p1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
