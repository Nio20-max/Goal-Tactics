.class public final Lcom/appsflyer/internal/ai;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static AFInAppEventParameterName:Ljava/lang/String;

.field private static values:Ljava/lang/String;


# instance fields
.field public final AFKeystoreWrapper:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(B)V
    .locals 1

    .line 1081
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1047
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 1053
    new-instance p1, Ljava/util/Timer;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Ljava/util/Timer;-><init>(Z)V

    .line 1056
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object p1, p0, Lcom/appsflyer/internal/ai;->AFKeystoreWrapper:Ljava/util/List;

    .line 1065
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {p1}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    .line 1067
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-static {p1}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    .line 1072
    new-instance p1, Ljava/util/concurrent/ConcurrentSkipListSet;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentSkipListSet;-><init>()V

    .line 1073
    new-instance p1, Ljava/util/concurrent/ConcurrentSkipListSet;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentSkipListSet;-><init>()V

    .line 1077
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1079
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-static {p1}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    return-void
.end method

.method static AFInAppEventType(Ljava/lang/String;)V
    .locals 3

    .line 30
    sput-object p0, Lcom/appsflyer/internal/ai;->AFInAppEventParameterName:Ljava/lang/String;

    if-nez p0, :cond_0

    return-void

    .line 34
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 36
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    if-eqz v1, :cond_2

    .line 37
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ne v1, v2, :cond_1

    goto :goto_1

    :cond_1
    const-string v2, "*"

    .line 40
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 38
    :cond_2
    :goto_1
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 43
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    sput-object p0, Lcom/appsflyer/internal/ai;->values:Ljava/lang/String;

    return-void
.end method

.method public static AFKeystoreWrapper(Ljava/lang/String;)V
    .locals 2

    .line 47
    sget-object v0, Lcom/appsflyer/internal/ai;->AFInAppEventParameterName:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 48
    invoke-static {}, Lcom/appsflyer/AppsFlyerProperties;->getInstance()Lcom/appsflyer/AppsFlyerProperties;

    move-result-object v0

    invoke-virtual {v0}, Lcom/appsflyer/AppsFlyerProperties;->getDevKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/internal/ai;->AFInAppEventType(Ljava/lang/String;)V

    .line 50
    :cond_0
    sget-object v0, Lcom/appsflyer/internal/ai;->AFInAppEventParameterName:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 51
    sget-object v1, Lcom/appsflyer/internal/ai;->values:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    :cond_1
    return-void
.end method
