.class public final Lcom/appsflyer/internal/aa;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/aa$c;,
        Lcom/appsflyer/internal/aa$a;,
        Lcom/appsflyer/internal/aa$e;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final AFInAppEventParameterName:Landroid/content/Context;

.field private valueOf:Landroid/os/Bundle;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 2028
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2026
    iput-object v0, p0, Lcom/appsflyer/internal/aa;->valueOf:Landroid/os/Bundle;

    .line 2029
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/appsflyer/internal/aa;->AFInAppEventParameterName:Landroid/content/Context;

    return-void
.end method

.method static AFKeystoreWrapper(Landroid/content/Context;)Lcom/appsflyer/internal/aa$e;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 27
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_6

    .line 29
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const-string v1, "com.android.vending"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 30
    new-instance v0, Lcom/appsflyer/internal/aa$a;

    invoke-direct {v0, v2}, Lcom/appsflyer/internal/aa$a;-><init>(B)V

    .line 31
    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.google.android.gms.ads.identifier.service.START"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "com.google.android.gms"

    .line 32
    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v2, 0x1

    .line 34
    :try_start_0
    invoke-virtual {p0, v1, v0, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 35
    new-instance v1, Lcom/appsflyer/internal/aa$c;

    .line 1077
    iget-boolean v3, v0, Lcom/appsflyer/internal/aa$a;->AFKeystoreWrapper:Z

    if-nez v3, :cond_2

    .line 1079
    iput-boolean v2, v0, Lcom/appsflyer/internal/aa$a;->AFKeystoreWrapper:Z

    .line 1080
    iget-object v2, v0, Lcom/appsflyer/internal/aa$a;->valueOf:Ljava/util/concurrent/LinkedBlockingQueue;

    const-wide/16 v3, 0xa

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v3, v4, v5}, Ljava/util/concurrent/LinkedBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/IBinder;

    if-eqz v2, :cond_1

    .line 35
    invoke-direct {v1, v2}, Lcom/appsflyer/internal/aa$c;-><init>(Landroid/os/IBinder;)V

    .line 36
    new-instance v2, Lcom/appsflyer/internal/aa$e;

    invoke-virtual {v1}, Lcom/appsflyer/internal/aa$c;->AFInAppEventType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/appsflyer/internal/aa$c;->values()Z

    move-result v1

    invoke-direct {v2, v3, v1}, Lcom/appsflyer/internal/aa$e;-><init>(Ljava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    .line 39
    invoke-virtual {p0, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    :cond_0
    return-object v2

    .line 1082
    :cond_1
    :try_start_1
    new-instance v1, Ljava/util/concurrent/TimeoutException;

    const-string v2, "Timed out waiting for the service connection"

    invoke-direct {v1, v2}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1078
    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot call get on this connection more than once"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_3
    if-eqz p0, :cond_4

    .line 39
    invoke-virtual {p0, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 41
    :cond_4
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Google Play connection failed"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_0
    move-exception v1

    if-eqz p0, :cond_5

    .line 39
    invoke-virtual {p0, v0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 40
    :cond_5
    throw v1

    .line 28
    :cond_6
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot be called from the main thread"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const/4 v0, 0x0

    .line 2068
    :try_start_0
    iget-object v1, p0, Lcom/appsflyer/internal/aa;->valueOf:Landroid/os/Bundle;

    if-nez v1, :cond_0

    .line 2069
    iget-object v1, p0, Lcom/appsflyer/internal/aa;->AFInAppEventParameterName:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 2070
    iget-object v2, p0, Lcom/appsflyer/internal/aa;->AFInAppEventParameterName:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x80

    .line 2071
    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageItemInfo;->metaData:Landroid/os/Bundle;

    iput-object v1, p0, Lcom/appsflyer/internal/aa;->valueOf:Landroid/os/Bundle;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2077
    :cond_0
    iget-object v1, p0, Lcom/appsflyer/internal/aa;->valueOf:Landroid/os/Bundle;

    if-eqz v1, :cond_1

    .line 2078
    invoke-virtual {v1, p1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 2080
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    return-object v0

    :catchall_0
    move-exception p1

    .line 2074
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Could not load manifest metadata!"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0
.end method
