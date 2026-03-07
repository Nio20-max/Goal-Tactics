.class public final Lcom/appsflyer/AFLogger;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/AFLogger$LogLevel;
    }
.end annotation


# static fields
.field private static final AFInAppEventType:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/appsflyer/AFLogger;->AFInAppEventType:J

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static AFInAppEventParameterName(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 4

    if-nez p0, :cond_0

    const-string p0, "null"

    :cond_0
    if-nez p1, :cond_2

    .line 35
    sget-object p1, Lcom/appsflyer/AFLogger$LogLevel;->VERBOSE:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-virtual {p1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result p1

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    .line 1110
    sget-object v1, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-virtual {v1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v1

    const-string v2, "logLevel"

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/AppsFlyerProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-gt p1, v0, :cond_1

    goto :goto_0

    :cond_1
    return-object p0

    .line 36
    :cond_2
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "("

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/appsflyer/AFLogger;->AFInAppEventType:J

    sub-long/2addr v0, v2

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ") ["

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "] "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static AFInAppEventParameterName(Ljava/lang/String;)V
    .locals 2

    .line 5044
    sget-object v0, Lcom/appsflyer/AFLogger$LogLevel;->DEBUG:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->valueOf(Lcom/appsflyer/AFLogger$LogLevel;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 6029
    invoke-static {p0, v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppsFlyer_6.5.4"

    .line 5045
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 5048
    :cond_0
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    const-string v1, "D"

    invoke-virtual {v0, v1, p0}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x1

    .line 110
    invoke-static {p0, p1, v0, v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;ZZ)V

    return-void
.end method

.method private static AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;ZZ)V
    .locals 4

    .line 53
    sget-object v0, Lcom/appsflyer/AFLogger$LogLevel;->ERROR:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->valueOf(Lcom/appsflyer/AFLogger$LogLevel;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 55
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " at "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    aget-object v1, v1, v0

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    .line 2029
    :cond_0
    invoke-static {p0, v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    const-string v0, "AppsFlyer_6.5.4"

    if-eqz p3, :cond_1

    .line 58
    invoke-static {v0, p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_2

    .line 59
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    :cond_2
    :goto_0
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/appsflyer/internal/ak;->valueOf(Ljava/lang/Throwable;)V

    .line 3019
    sget-object p0, Lcom/appsflyer/internal/ay;->AFInAppEventParameterName:Landroid/app/Application;

    if-eqz p0, :cond_4

    .line 3020
    sget-object p0, Lcom/appsflyer/internal/ay;->AFInAppEventParameterName:Landroid/app/Application;

    invoke-static {p0}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 3021
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 3027
    sget-object p1, Lcom/appsflyer/internal/ay;->AFInAppEventParameterName:Landroid/app/Application;

    const-string p2, "exception_number"

    if-nez p1, :cond_3

    const-wide/16 v0, -0x1

    goto :goto_1

    .line 3028
    :cond_3
    sget-object p1, Lcom/appsflyer/internal/ay;->AFInAppEventParameterName:Landroid/app/Application;

    invoke-static {p1}, Lcom/appsflyer/internal/ac;->AFInAppEventType(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-wide/16 v0, 0x0

    invoke-interface {p1, p2, v0, v1}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    :goto_1
    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    .line 3022
    invoke-interface {p0, p2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 3023
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_4
    return-void
.end method

.method private static AFInAppEventParameterName()Z
    .locals 1

    .line 94
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/AppsFlyerProperties;->isLogsDisabledCompletely()Z

    move-result v0

    return v0
.end method

.method public static AFInAppEventType(Ljava/lang/String;)V
    .locals 2

    .line 87
    invoke-static {}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 5029
    invoke-static {p0, v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppsFlyer_6.5.4"

    .line 88
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    :cond_0
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    const-string v1, "F"

    invoke-virtual {v0, v1, p0}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static AFKeystoreWrapper(Ljava/lang/String;)V
    .locals 2

    .line 75
    sget-object v0, Lcom/appsflyer/AFLogger$LogLevel;->VERBOSE:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->valueOf(Lcom/appsflyer/AFLogger$LogLevel;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 4029
    invoke-static {p0, v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppsFlyer_6.5.4"

    .line 76
    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    :cond_0
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    const-string v1, "V"

    invoke-virtual {v0, v1, p0}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static AppsFlyer2dXConversionCallback(Ljava/lang/String;)V
    .locals 0

    .line 118
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)V
    .locals 2

    .line 66
    sget-object v0, Lcom/appsflyer/AFLogger$LogLevel;->WARNING:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->valueOf(Lcom/appsflyer/AFLogger$LogLevel;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 3029
    invoke-static {p0, v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppsFlyer_6.5.4"

    .line 67
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    :cond_0
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {p0, v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    const-string v1, "W"

    invoke-virtual {v0, v1, p0}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 106
    invoke-static {p0, p1, v0, v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;ZZ)V

    return-void
.end method

.method private static valueOf(Lcom/appsflyer/AFLogger$LogLevel;)Z
    .locals 3

    .line 83
    invoke-virtual {p0}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result p0

    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    .line 4110
    sget-object v1, Lcom/appsflyer/AFLogger$LogLevel;->NONE:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-virtual {v1}, Lcom/appsflyer/AFLogger$LogLevel;->getLevel()I

    move-result v1

    const-string v2, "logLevel"

    invoke-virtual {v0, v2, v1}, Lcom/appsflyer/AppsFlyerProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-gt p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static values(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    .line 102
    invoke-static {p0, v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;Z)V

    return-void
.end method

.method public static values(Ljava/lang/String;Z)V
    .locals 2

    .line 19
    sget-object v0, Lcom/appsflyer/AFLogger$LogLevel;->INFO:Lcom/appsflyer/AFLogger$LogLevel;

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->valueOf(Lcom/appsflyer/AFLogger$LogLevel;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 1029
    invoke-static {p0, v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "AppsFlyer_6.5.4"

    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    if-eqz p1, :cond_1

    .line 23
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    const-string v0, "I"

    invoke-virtual {p1, v0, p0}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public static values(Ljava/lang/Throwable;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 114
    invoke-static {v0, p0, v1, v1}, Lcom/appsflyer/AFLogger;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/Throwable;ZZ)V

    return-void
.end method
