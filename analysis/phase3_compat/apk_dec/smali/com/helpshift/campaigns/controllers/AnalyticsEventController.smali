.class public Lcom/helpshift/campaigns/controllers/AnalyticsEventController;
.super Ljava/lang/Object;
.source "AnalyticsEventController.java"

# interfaces
.implements Lcom/helpshift/network/NetworkDataProvider;
.implements Lcom/helpshift/app/LifecycleListener;


# static fields
.field private static final KEY_ANALYTICS_EVENTS:Ljava/lang/String; = "kAnalyticsEvents"

.field private static final KEY_RECORDED_EVENTS_MAP:Ljava/lang/String; = "kRecordedEventsMap"

.field private static final TAG:Ljava/lang/String; = "Helpshift_AnalyticsCnt"


# instance fields
.field storage:Lcom/helpshift/storage/KeyValueStorage;

.field public final syncController:Lcom/helpshift/controllers/SyncController;

.field workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;


# direct methods
.method protected constructor <init>(Lcom/helpshift/storage/KeyValueStorage;Lcom/helpshift/util/concurrent/DispatchQueue;Lcom/helpshift/controllers/SyncController;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->storage:Lcom/helpshift/storage/KeyValueStorage;

    .line 42
    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    .line 43
    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->syncController:Lcom/helpshift/controllers/SyncController;

    .line 44
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCampaignAppLifeCycleListener()Lcom/helpshift/app/CampaignAppLifeCycleListener;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 46
    invoke-virtual {p1, p0}, Lcom/helpshift/app/CampaignAppLifeCycleListener;->addLifecycleListener(Lcom/helpshift/app/LifecycleListener;)V

    :cond_0
    return-void
.end method

.method private addEventToStorage(Lcom/helpshift/campaigns/models/AnalyticsEvent;)V
    .locals 2

    .line 67
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$1;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$1;-><init>(Lcom/helpshift/campaigns/controllers/AnalyticsEventController;Lcom/helpshift/campaigns/models/AnalyticsEvent;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method private getRecordedEventsMap()Ljava/util/HashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 131
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->storage:Lcom/helpshift/storage/KeyValueStorage;

    const-string v1, "kRecordedEventsMap"

    invoke-interface {v0, v1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    return-object v0
.end method

.method private isAnalyticsEventRecorded(Ljava/lang/Integer;Ljava/lang/String;)Z
    .locals 2

    .line 83
    invoke-direct {p0}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->getRecordedEventsMap()Ljava/util/HashMap;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 85
    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/List;

    if-eqz p2, :cond_0

    .line 86
    invoke-interface {p2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method


# virtual methods
.method addToRecordedEventsMap(Ljava/lang/Integer;Ljava/lang/String;)V
    .locals 2

    .line 92
    invoke-direct {p0}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->getRecordedEventsMap()Ljava/util/HashMap;

    move-result-object v0

    if-nez v0, :cond_0

    .line 95
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 98
    :cond_0
    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_1

    .line 100
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 103
    :cond_1
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    invoke-virtual {v0, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->storage:Lcom/helpshift/storage/KeyValueStorage;

    const-string p2, "kRecordedEventsMap"

    invoke-interface {p1, p2, v0}, Lcom/helpshift/storage/KeyValueStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    return-void
.end method

.method getAnalyticsEventsFromStorage()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/helpshift/campaigns/models/AnalyticsEvent;",
            ">;"
        }
    .end annotation

    .line 135
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->storage:Lcom/helpshift/storage/KeyValueStorage;

    const-string v1, "kAnalyticsEvents"

    invoke-interface {v0, v1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    return-object v0
.end method

.method public getRequest()Lcom/helpshift/network/request/Request;
    .locals 10

    .line 141
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->getAnalyticsEventsFromStorage()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 142
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 144
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 145
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 147
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/campaigns/models/AnalyticsEvent;

    .line 148
    invoke-virtual {v3}, Lcom/helpshift/campaigns/models/AnalyticsEvent;->toData()Ljava/util/HashMap;

    move-result-object v4

    .line 149
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    iget-object v3, v3, Lcom/helpshift/campaigns/models/AnalyticsEvent;->eventId:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 153
    :cond_0
    invoke-static {v1}, Lcom/helpshift/util/HSJSONUtils;->fromListOfMaps(Ljava/util/List;)Lorg/json/JSONArray;

    move-result-object v0

    .line 155
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 156
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "e"

    invoke-virtual {v6, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "sv"

    const-string v1, "7.11.1"

    .line 157
    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string/jumbo v0, "v"

    const-string v1, "1.1.0"

    .line 158
    invoke-virtual {v6, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/DeviceController;->getDeviceInfoForPushAnalytics()Ljava/util/HashMap;

    move-result-object v0

    .line 162
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 163
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 165
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    .line 169
    invoke-interface {v2, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 170
    new-instance v7, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3;

    invoke-direct {v7, p0, p0, v0}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$3;-><init>(Lcom/helpshift/campaigns/controllers/AnalyticsEventController;Lcom/helpshift/campaigns/controllers/AnalyticsEventController;[Ljava/lang/String;)V

    .line 183
    new-instance v8, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$4;

    invoke-direct {v8, p0, p0}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$4;-><init>(Lcom/helpshift/campaigns/controllers/AnalyticsEventController;Lcom/helpshift/campaigns/controllers/AnalyticsEventController;)V

    .line 190
    new-instance v0, Lcom/helpshift/network/request/Request;

    const/4 v4, 0x1

    new-instance v9, Lcom/helpshift/network/response/JsonArrayResponseParser;

    invoke-direct {v9}, Lcom/helpshift/network/response/JsonArrayResponseParser;-><init>()V

    const-string v5, "/ma/ae/"

    move-object v3, v0

    invoke-direct/range {v3 .. v9}, Lcom/helpshift/network/request/Request;-><init>(ILjava/lang/String;Ljava/util/Map;Lcom/helpshift/network/response/Response$Listener;Lcom/helpshift/network/response/Response$ErrorListener;Lcom/helpshift/network/response/ResponseParser;)V

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    :goto_2
    return-object v0
.end method

.method public getRequestWithFullData()Lcom/helpshift/network/request/Request;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onBackground()V
    .locals 3

    .line 219
    invoke-virtual {p0}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->getAnalyticsEventsFromStorage()Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 220
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 221
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->syncController:Lcom/helpshift/controllers/SyncController;

    .line 222
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const-string v2, "data_type_analytics_event"

    .line 221
    invoke-virtual {v1, v2, v0}, Lcom/helpshift/controllers/SyncController;->setDataChangeCount(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public onForeground()V
    .locals 0

    return-void
.end method

.method public recordAnalyticsEvent(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1

    .line 55
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "Helpshift_AnalyticsCnt"

    const-string p2, "Encountered empty campaign id for analytics record"

    .line 56
    invoke-static {p1, p2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 60
    :cond_0
    new-instance v0, Lcom/helpshift/campaigns/models/AnalyticsEvent;

    invoke-direct {v0, p1, p2, p3}, Lcom/helpshift/campaigns/models/AnalyticsEvent;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 61
    invoke-direct {p0, p1, p2}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->isAnalyticsEventRecorded(Ljava/lang/Integer;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 62
    invoke-direct {p0, v0}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->addEventToStorage(Lcom/helpshift/campaigns/models/AnalyticsEvent;)V

    :cond_1
    return-void
.end method

.method removeAnalyticsEventsFromStorage([Ljava/lang/String;)V
    .locals 2

    .line 110
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v1, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$2;

    invoke-direct {v1, p0, p1}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController$2;-><init>(Lcom/helpshift/campaigns/controllers/AnalyticsEventController;[Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setBatchSize(Ljava/lang/Integer;)V
    .locals 0

    return-void
.end method
