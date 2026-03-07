.class public Lcom/helpshift/logger/Logger;
.super Ljava/lang/Object;
.source "Logger.java"

# interfaces
.implements Lcom/helpshift/logger/ILogger;


# static fields
.field private static final DEBUG:Ljava/lang/String; = "DEBUG"

.field private static final ERROR:Ljava/lang/String; = "ERROR"

.field private static final FATAL:Ljava/lang/String; = "FATAL"

.field static final MAX_EXTRAS_COUNT:I = 0x14

.field static final MAX_LOG_SIZE:I = 0x1388

.field private static final WARN:Ljava/lang/String; = "WARN"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private consoleLoggingLevel:I

.field private enableConsoleLogging:Z

.field private enableLogCaching:Z

.field private logStorage:Lcom/helpshift/logger/database/LogStorage;

.field private requiredLogCachingLevel:I

.field private final sdkVersion:Ljava/lang/String;

.field private final simpleDateFormat:Ljava/text/SimpleDateFormat;

.field private threadPoolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

.field private timestampDelta:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    .line 49
    iput v0, p0, Lcom/helpshift/logger/Logger;->consoleLoggingLevel:I

    .line 55
    sget-object v0, Lcom/helpshift/logger/constants/LogLevel;->FATAL:Lcom/helpshift/logger/constants/LogLevel;

    invoke-virtual {v0}, Lcom/helpshift/logger/constants/LogLevel;->getValue()I

    move-result v0

    iput v0, p0, Lcom/helpshift/logger/Logger;->requiredLogCachingLevel:I

    .line 60
    const-class v0, Lcom/helpshift/logger/Logger;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/logger/Logger;->TAG:Ljava/lang/String;

    .line 110
    new-instance v0, Lcom/helpshift/logger/database/LogSQLiteStorage;

    invoke-direct {v0, p1, p2}, Lcom/helpshift/logger/database/LogSQLiteStorage;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/helpshift/logger/Logger;->logStorage:Lcom/helpshift/logger/database/LogStorage;

    .line 111
    new-instance p1, Ljava/text/SimpleDateFormat;

    const-string p2, "dd/MM/yyyy HH:mm:ss"

    invoke-direct {p1, p2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/helpshift/logger/Logger;->simpleDateFormat:Ljava/text/SimpleDateFormat;

    const-string p2, "UTC"

    .line 112
    invoke-static {p2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 113
    iput-object p3, p0, Lcom/helpshift/logger/Logger;->sdkVersion:Ljava/lang/String;

    return-void
.end method

.method private containsUnknownHostException([Ljava/lang/Throwable;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    .line 352
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_2

    .line 353
    aget-object v2, p1, v1

    instance-of v2, v2, Ljava/net/UnknownHostException;

    if-eqz v2, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return v0
.end method

.method private convertMaskToLogLevel(I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 411
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    and-int/lit8 v1, p1, 0x8

    if-eqz v1, :cond_1

    const-string v1, "ERROR"

    .line 413
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    and-int/lit8 v1, p1, 0x4

    if-eqz v1, :cond_2

    const-string v1, "WARN"

    .line 417
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    and-int/lit8 p1, p1, 0x10

    if-eqz p1, :cond_3

    const-string p1, "FATAL"

    .line 421
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    return-object v0
.end method

.method private getExtrasForConsoleLogging([Lcom/helpshift/logger/logmodels/ILogExtrasModel;)Ljava/lang/String;
    .locals 5

    const-string v0, " "

    if-eqz p1, :cond_2

    .line 370
    array-length v1, p1

    if-lez v1, :cond_2

    .line 371
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 372
    array-length v2, p1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, p1, v3

    if-eqz v4, :cond_0

    .line 374
    invoke-interface {v4}, Lcom/helpshift/logger/logmodels/ILogExtrasModel;->getConsoleLoggingMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 378
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_2
    return-object v0
.end method

.method private getStackTraceString([Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 3

    if-eqz p1, :cond_2

    .line 387
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 388
    invoke-direct {p0, p1}, Lcom/helpshift/logger/Logger;->containsUnknownHostException([Ljava/lang/Throwable;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p1, "UnknownHostException"

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    .line 395
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 396
    aget-object v2, p1, v1

    invoke-static {v2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    .line 397
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 399
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_2
    const-string p1, ""

    :goto_1
    return-object p1
.end method

.method private isConsoleLoggingEnabled()Z
    .locals 1

    .line 313
    iget-boolean v0, p0, Lcom/helpshift/logger/Logger;->enableConsoleLogging:Z

    return v0
.end method

.method private logMessageToDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)Ljava/util/concurrent/Future;
    .locals 3

    .line 324
    new-instance v0, Lcom/helpshift/logger/LogMessage;

    invoke-direct {v0}, Lcom/helpshift/logger/LogMessage;-><init>()V

    .line 325
    iput-object p1, v0, Lcom/helpshift/logger/LogMessage;->level:Ljava/lang/String;

    .line 326
    iput-object p4, v0, Lcom/helpshift/logger/LogMessage;->extras:[Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    .line 327
    iput-object p2, v0, Lcom/helpshift/logger/LogMessage;->message:Ljava/lang/String;

    .line 328
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iget-wide v1, p0, Lcom/helpshift/logger/Logger;->timestampDelta:J

    add-long/2addr p1, v1

    iput-wide p1, v0, Lcom/helpshift/logger/LogMessage;->timeStamp:J

    .line 329
    iput-object p3, v0, Lcom/helpshift/logger/LogMessage;->stacktrace:Ljava/lang/String;

    .line 330
    iget-object p1, p0, Lcom/helpshift/logger/Logger;->sdkVersion:Ljava/lang/String;

    iput-object p1, v0, Lcom/helpshift/logger/LogMessage;->sdkVersion:Ljava/lang/String;

    .line 335
    :try_start_0
    iget-object p1, p0, Lcom/helpshift/logger/Logger;->threadPoolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance p2, Lcom/helpshift/logger/WorkerThread;

    iget-object p3, p0, Lcom/helpshift/logger/Logger;->logStorage:Lcom/helpshift/logger/database/LogStorage;

    iget-object p4, p0, Lcom/helpshift/logger/Logger;->simpleDateFormat:Ljava/text/SimpleDateFormat;

    invoke-direct {p2, v0, p3, p4}, Lcom/helpshift/logger/WorkerThread;-><init>(Lcom/helpshift/logger/LogMessage;Lcom/helpshift/logger/database/LogStorage;Ljava/text/SimpleDateFormat;)V

    invoke-virtual {p1, p2}, Ljava/util/concurrent/ThreadPoolExecutor;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p1
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 341
    iget-object p2, p0, Lcom/helpshift/logger/Logger;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Rejected execution of log message : "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p4, v0, Lcom/helpshift/logger/LogMessage;->message:Ljava/lang/String;

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    return-object p1
.end method

.method private shouldAddLogToDatabase(Lcom/helpshift/logger/constants/LogLevel;)Z
    .locals 1

    .line 309
    iget-boolean v0, p0, Lcom/helpshift/logger/Logger;->enableLogCaching:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/helpshift/logger/constants/LogLevel;->getValue()I

    move-result p1

    iget v0, p0, Lcom/helpshift/logger/Logger;->requiredLogCachingLevel:I

    if-gt p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 167
    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/helpshift/logger/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    return-void
.end method

.method public varargs d(Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V
    .locals 1

    const/4 v0, 0x0

    .line 202
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/helpshift/logger/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    return-void
.end method

.method public d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x0

    .line 182
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/helpshift/logger/Logger;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    return-void
.end method

.method public varargs d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V
    .locals 2

    .line 217
    invoke-direct {p0}, Lcom/helpshift/logger/Logger;->isConsoleLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/helpshift/logger/Logger;->consoleLoggingLevel:I

    const/4 v1, 0x2

    if-gt v0, v1, :cond_0

    .line 218
    invoke-direct {p0, p3}, Lcom/helpshift/logger/Logger;->getStackTraceString([Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p3

    .line 219
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p4}, Lcom/helpshift/logger/Logger;->getExtrasForConsoleLogging([Lcom/helpshift/logger/logmodels/ILogExtrasModel;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public deleteAllCachedLogs()V
    .locals 1

    .line 296
    iget-object v0, p0, Lcom/helpshift/logger/Logger;->logStorage:Lcom/helpshift/logger/database/LogStorage;

    invoke-interface {v0}, Lcom/helpshift/logger/database/LogStorage;->deleteAll()V

    return-void
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 177
    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/helpshift/logger/Logger;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    return-void
.end method

.method public varargs e(Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V
    .locals 1

    const/4 v0, 0x0

    .line 212
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/helpshift/logger/Logger;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    return-void
.end method

.method public e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x0

    .line 192
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/helpshift/logger/Logger;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    return-void
.end method

.method public varargs e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V
    .locals 3

    .line 244
    invoke-direct {p0}, Lcom/helpshift/logger/Logger;->isConsoleLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/helpshift/logger/Logger;->consoleLoggingLevel:I

    const/16 v1, 0x8

    if-gt v0, v1, :cond_0

    .line 245
    invoke-direct {p0, p3}, Lcom/helpshift/logger/Logger;->getStackTraceString([Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    .line 246
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p4}, Lcom/helpshift/logger/Logger;->getExtrasForConsoleLogging([Lcom/helpshift/logger/logmodels/ILogExtrasModel;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 253
    :goto_0
    sget-object p1, Lcom/helpshift/logger/constants/LogLevel;->ERROR:Lcom/helpshift/logger/constants/LogLevel;

    invoke-direct {p0, p1}, Lcom/helpshift/logger/Logger;->shouldAddLogToDatabase(Lcom/helpshift/logger/constants/LogLevel;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-direct {p0, p3}, Lcom/helpshift/logger/Logger;->containsUnknownHostException([Ljava/lang/Throwable;)Z

    move-result p1

    if-nez p1, :cond_2

    if-nez v0, :cond_1

    .line 255
    invoke-direct {p0, p3}, Lcom/helpshift/logger/Logger;->getStackTraceString([Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    const-string p1, "ERROR"

    .line 257
    invoke-direct {p0, p1, p2, v0, p4}, Lcom/helpshift/logger/Logger;->logMessageToDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)Ljava/util/concurrent/Future;

    :cond_2
    return-void
.end method

.method public enableLogging(ZZ)V
    .locals 8

    .line 119
    iput-boolean p1, p0, Lcom/helpshift/logger/Logger;->enableConsoleLogging:Z

    .line 121
    iget-boolean p1, p0, Lcom/helpshift/logger/Logger;->enableLogCaching:Z

    if-ne p1, p2, :cond_0

    return-void

    .line 125
    :cond_0
    iput-boolean p2, p0, Lcom/helpshift/logger/Logger;->enableLogCaching:Z

    if-eqz p2, :cond_1

    .line 129
    new-instance v6, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v6}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 134
    new-instance p1, Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x1

    const/4 v2, 0x1

    const-wide/16 v3, 0x3c

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Lcom/helpshift/logger/Logger$1;

    invoke-direct {v7, p0}, Lcom/helpshift/logger/Logger$1;-><init>(Lcom/helpshift/logger/Logger;)V

    move-object v0, p1

    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object p1, p0, Lcom/helpshift/logger/Logger;->threadPoolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    goto :goto_0

    .line 144
    :cond_1
    iget-object p1, p0, Lcom/helpshift/logger/Logger;->threadPoolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    if-eqz p1, :cond_2

    .line 145
    invoke-virtual {p1}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdown()V

    :cond_2
    :goto_0
    return-void
.end method

.method public f(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x0

    .line 197
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/helpshift/logger/Logger;->f(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    return-void
.end method

.method public varargs f(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V
    .locals 3

    .line 266
    invoke-direct {p0}, Lcom/helpshift/logger/Logger;->isConsoleLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/helpshift/logger/Logger;->consoleLoggingLevel:I

    const/16 v1, 0x10

    if-gt v0, v1, :cond_0

    .line 267
    invoke-direct {p0, p3}, Lcom/helpshift/logger/Logger;->getStackTraceString([Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    .line 268
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p4}, Lcom/helpshift/logger/Logger;->getExtrasForConsoleLogging([Lcom/helpshift/logger/logmodels/ILogExtrasModel;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 271
    :goto_0
    sget-object p1, Lcom/helpshift/logger/constants/LogLevel;->FATAL:Lcom/helpshift/logger/constants/LogLevel;

    invoke-direct {p0, p1}, Lcom/helpshift/logger/Logger;->shouldAddLogToDatabase(Lcom/helpshift/logger/constants/LogLevel;)Z

    move-result p1

    if-eqz p1, :cond_2

    if-nez v0, :cond_1

    .line 273
    invoke-direct {p0, p3}, Lcom/helpshift/logger/Logger;->getStackTraceString([Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    const-string p1, "FATAL"

    .line 276
    invoke-direct {p0, p1, p2, v0, p4}, Lcom/helpshift/logger/Logger;->logMessageToDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)Ljava/util/concurrent/Future;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 280
    :try_start_0
    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 284
    iget-object p2, p0, Lcom/helpshift/logger/Logger;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Error logging fatal log : "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_1
    return-void
.end method

.method public getAll()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/logger/model/LogModel;",
            ">;"
        }
    .end annotation

    .line 291
    iget-object v0, p0, Lcom/helpshift/logger/Logger;->logStorage:Lcom/helpshift/logger/database/LogStorage;

    invoke-interface {v0}, Lcom/helpshift/logger/database/LogStorage;->getAll()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public setConsoleLoggingLevel(I)V
    .locals 0

    .line 152
    iput p1, p0, Lcom/helpshift/logger/Logger;->consoleLoggingLevel:I

    return-void
.end method

.method public setLogCachingLevel(I)V
    .locals 0

    .line 157
    iput p1, p0, Lcom/helpshift/logger/Logger;->requiredLogCachingLevel:I

    return-void
.end method

.method public setTimestampDelta(J)V
    .locals 0

    .line 162
    iput-wide p1, p0, Lcom/helpshift/logger/Logger;->timestampDelta:J

    return-void
.end method

.method public w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 172
    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/helpshift/logger/Logger;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    return-void
.end method

.method public varargs w(Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V
    .locals 1

    const/4 v0, 0x0

    .line 207
    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/helpshift/logger/Logger;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    return-void
.end method

.method public w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x0

    .line 187
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/helpshift/logger/Logger;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    return-void
.end method

.method public varargs w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V
    .locals 3

    .line 227
    invoke-direct {p0}, Lcom/helpshift/logger/Logger;->isConsoleLoggingEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/helpshift/logger/Logger;->consoleLoggingLevel:I

    const/4 v1, 0x4

    if-gt v0, v1, :cond_0

    .line 228
    invoke-direct {p0, p3}, Lcom/helpshift/logger/Logger;->getStackTraceString([Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    .line 229
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0, p4}, Lcom/helpshift/logger/Logger;->getExtrasForConsoleLogging([Lcom/helpshift/logger/logmodels/ILogExtrasModel;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 232
    :goto_0
    sget-object p1, Lcom/helpshift/logger/constants/LogLevel;->WARN:Lcom/helpshift/logger/constants/LogLevel;

    invoke-direct {p0, p1}, Lcom/helpshift/logger/Logger;->shouldAddLogToDatabase(Lcom/helpshift/logger/constants/LogLevel;)Z

    move-result p1

    if-eqz p1, :cond_2

    if-nez v0, :cond_1

    .line 234
    invoke-direct {p0, p3}, Lcom/helpshift/logger/Logger;->getStackTraceString([Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    const-string p1, "WARN"

    .line 236
    invoke-direct {p0, p1, p2, v0, p4}, Lcom/helpshift/logger/Logger;->logMessageToDatabase(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)Ljava/util/concurrent/Future;

    :cond_2
    return-void
.end method
