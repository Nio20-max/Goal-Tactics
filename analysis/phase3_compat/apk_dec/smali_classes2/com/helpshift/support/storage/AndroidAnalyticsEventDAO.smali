.class public Lcom/helpshift/support/storage/AndroidAnalyticsEventDAO;
.super Ljava/lang/Object;
.source "AndroidAnalyticsEventDAO.java"

# interfaces
.implements Lcom/helpshift/analytics/AnalyticsEventDAO;


# static fields
.field private static final KEY_UNSENT_ANALYTICS_EVENTS:Ljava/lang/String; = "unsent_analytics_events"

.field private static final KEY_UNSENT_APP_LAUNCH_ANALYTICS_EVENTS:Ljava/lang/String; = "unsent_app_launch_analytics_events"

.field private static final MAX_APP_LAUNCH_EVENTS_COUNT:I = 0x3e8


# instance fields
.field private kvStore:Lcom/helpshift/common/platform/KVStore;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/KVStore;)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/helpshift/support/storage/AndroidAnalyticsEventDAO;->kvStore:Lcom/helpshift/common/platform/KVStore;

    return-void
.end method

.method private getUnSentAnalyticFromDB()Ljava/util/HashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/helpshift/support/storage/AndroidAnalyticsEventDAO;->kvStore:Lcom/helpshift/common/platform/KVStore;

    const-string v1, "unsent_analytics_events"

    invoke-interface {v0, v1}, Lcom/helpshift/common/platform/KVStore;->getSerializable(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 87
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    goto :goto_0

    .line 90
    :cond_0
    check-cast v0, Ljava/util/HashMap;

    :goto_0
    return-object v0
.end method


# virtual methods
.method public getUnsentAnalytics()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 49
    invoke-direct {p0}, Lcom/helpshift/support/storage/AndroidAnalyticsEventDAO;->getUnSentAnalyticFromDB()Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method public getUnsentAnalyticsAppLaunchData()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/helpshift/analytics/dto/AnalyticsEventDTO;",
            ">;"
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lcom/helpshift/support/storage/AndroidAnalyticsEventDAO;->kvStore:Lcom/helpshift/common/platform/KVStore;

    const-string v1, "unsent_app_launch_analytics_events"

    invoke-interface {v0, v1}, Lcom/helpshift/common/platform/KVStore;->getSerializable(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    .line 73
    :cond_0
    check-cast v0, Ljava/util/ArrayList;

    :goto_0
    return-object v0
.end method

.method public removeAnalyticsAppLaunchData()V
    .locals 3

    .line 80
    iget-object v0, p0, Lcom/helpshift/support/storage/AndroidAnalyticsEventDAO;->kvStore:Lcom/helpshift/common/platform/KVStore;

    const-string v1, "unsent_app_launch_analytics_events"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/helpshift/common/platform/KVStore;->setSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    return-void
.end method

.method public removeAnalyticsData(Ljava/lang/String;)V
    .locals 2

    .line 33
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 37
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/support/storage/AndroidAnalyticsEventDAO;->getUnSentAnalyticFromDB()Ljava/util/HashMap;

    move-result-object v0

    .line 38
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result p1

    const-string v1, "unsent_analytics_events"

    if-nez p1, :cond_1

    .line 40
    iget-object p1, p0, Lcom/helpshift/support/storage/AndroidAnalyticsEventDAO;->kvStore:Lcom/helpshift/common/platform/KVStore;

    const/4 v0, 0x0

    invoke-interface {p1, v1, v0}, Lcom/helpshift/common/platform/KVStore;->setSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    goto :goto_0

    .line 43
    :cond_1
    iget-object p1, p0, Lcom/helpshift/support/storage/AndroidAnalyticsEventDAO;->kvStore:Lcom/helpshift/common/platform/KVStore;

    invoke-interface {p1, v1, v0}, Lcom/helpshift/common/platform/KVStore;->setSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    :goto_0
    return-void
.end method

.method public saveUnsentAnalyticsAppLaunchData(Lcom/helpshift/analytics/dto/AnalyticsEventDTO;)V
    .locals 3

    .line 55
    invoke-virtual {p0}, Lcom/helpshift/support/storage/AndroidAnalyticsEventDAO;->getUnsentAnalyticsAppLaunchData()Ljava/util/List;

    move-result-object v0

    .line 57
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/16 v2, 0x3e8

    if-ge v1, v2, :cond_0

    .line 59
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 60
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    iget-object p1, p0, Lcom/helpshift/support/storage/AndroidAnalyticsEventDAO;->kvStore:Lcom/helpshift/common/platform/KVStore;

    const-string v0, "unsent_app_launch_analytics_events"

    invoke-interface {p1, v0, v1}, Lcom/helpshift/common/platform/KVStore;->setSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    :cond_0
    return-void
.end method

.method public saveUnsentAnalyticsData(Ljava/lang/String;Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 26
    invoke-direct {p0}, Lcom/helpshift/support/storage/AndroidAnalyticsEventDAO;->getUnSentAnalyticFromDB()Ljava/util/HashMap;

    move-result-object v0

    .line 27
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    iget-object p1, p0, Lcom/helpshift/support/storage/AndroidAnalyticsEventDAO;->kvStore:Lcom/helpshift/common/platform/KVStore;

    const-string p2, "unsent_analytics_events"

    invoke-interface {p1, p2, v0}, Lcom/helpshift/common/platform/KVStore;->setSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    return-void
.end method
