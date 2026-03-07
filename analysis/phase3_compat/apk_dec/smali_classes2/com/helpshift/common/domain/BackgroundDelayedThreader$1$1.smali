.class Lcom/helpshift/common/domain/BackgroundDelayedThreader$1$1;
.super Ljava/lang/Object;
.source "BackgroundDelayedThreader.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/common/domain/BackgroundDelayedThreader$1;->f()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/helpshift/common/domain/BackgroundDelayedThreader$1;


# direct methods
.method constructor <init>(Lcom/helpshift/common/domain/BackgroundDelayedThreader$1;)V
    .locals 0

    .line 29
    iput-object p1, p0, Lcom/helpshift/common/domain/BackgroundDelayedThreader$1$1;->this$1:Lcom/helpshift/common/domain/BackgroundDelayedThreader$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    const-string v0, "Helpshift_CoreDelayTh"

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 33
    :try_start_0
    iget-object v4, p0, Lcom/helpshift/common/domain/BackgroundDelayedThreader$1$1;->this$1:Lcom/helpshift/common/domain/BackgroundDelayedThreader$1;

    iget-object v4, v4, Lcom/helpshift/common/domain/BackgroundDelayedThreader$1;->val$f:Lcom/helpshift/common/domain/F;

    invoke-virtual {v4}, Lcom/helpshift/common/domain/F;->f()V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v4

    new-array v1, v1, [Ljava/lang/Throwable;

    aput-object v4, v1, v3

    .line 50
    iget-object v4, p0, Lcom/helpshift/common/domain/BackgroundDelayedThreader$1$1;->this$1:Lcom/helpshift/common/domain/BackgroundDelayedThreader$1;

    iget-object v4, v4, Lcom/helpshift/common/domain/BackgroundDelayedThreader$1;->val$f:Lcom/helpshift/common/domain/F;

    iget-object v4, v4, Lcom/helpshift/common/domain/F;->cause:Ljava/lang/Throwable;

    aput-object v4, v1, v2

    new-array v2, v3, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    const-string v3, "Caught unhandled exception inside BackgroundThreader"

    invoke-static {v0, v3, v1, v2}, Lcom/helpshift/util/HSLogger;->f(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    goto :goto_1

    :catch_1
    move-exception v4

    .line 36
    invoke-virtual {v4}, Lcom/helpshift/common/exception/RootAPIException;->shouldLog()Z

    move-result v5

    if-eqz v5, :cond_2

    const/4 v5, 0x0

    .line 38
    iget-object v6, v4, Lcom/helpshift/common/exception/RootAPIException;->message:Ljava/lang/String;

    if-nez v6, :cond_0

    const-string v6, ""

    goto :goto_0

    :cond_0
    iget-object v6, v4, Lcom/helpshift/common/exception/RootAPIException;->message:Ljava/lang/String;

    .line 39
    :goto_0
    iget-object v7, v4, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    instance-of v7, v7, Lcom/helpshift/common/exception/NetworkException;

    if-eqz v7, :cond_1

    .line 40
    iget-object v5, v4, Lcom/helpshift/common/exception/RootAPIException;->exceptionType:Lcom/helpshift/common/exception/ExceptionType;

    check-cast v5, Lcom/helpshift/common/exception/NetworkException;

    iget-object v5, v5, Lcom/helpshift/common/exception/NetworkException;->route:Ljava/lang/String;

    const-string v7, "route"

    .line 41
    invoke-static {v7, v5}, Lcom/helpshift/logger/logmodels/LogExtrasModelProvider;->fromString(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    move-result-object v5

    :cond_1
    new-array v1, v1, [Ljava/lang/Throwable;

    .line 43
    iget-object v4, v4, Lcom/helpshift/common/exception/RootAPIException;->exception:Ljava/lang/Exception;

    aput-object v4, v1, v3

    iget-object v4, p0, Lcom/helpshift/common/domain/BackgroundDelayedThreader$1$1;->this$1:Lcom/helpshift/common/domain/BackgroundDelayedThreader$1;

    iget-object v4, v4, Lcom/helpshift/common/domain/BackgroundDelayedThreader$1;->val$f:Lcom/helpshift/common/domain/F;

    iget-object v4, v4, Lcom/helpshift/common/domain/F;->cause:Ljava/lang/Throwable;

    aput-object v4, v1, v2

    new-array v2, v2, [Lcom/helpshift/logger/logmodels/ILogExtrasModel;

    aput-object v5, v2, v3

    invoke-static {v0, v6, v1, v2}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Throwable;[Lcom/helpshift/logger/logmodels/ILogExtrasModel;)V

    :cond_2
    :goto_1
    return-void
.end method
