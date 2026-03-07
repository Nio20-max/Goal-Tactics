.class public Lcom/helpshift/campaigns/models/SessionModel;
.super Ljava/lang/Object;
.source "SessionModel.java"


# instance fields
.field public final deviceIdentifier:Ljava/lang/String;

.field public final durations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public endTime:J

.field public final identifier:Ljava/lang/String;

.field private referenceTime:J

.field private startElapsedTime:J

.field public final startTime:J

.field public final syncStatus:Ljava/lang/Integer;

.field public final userIdentifier:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    invoke-static {}, Lcom/helpshift/util/TimeUtil;->getCurrentTimeInMillis()J

    move-result-wide v0

    .line 31
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/helpshift/campaigns/models/SessionModel;->startElapsedTime:J

    .line 33
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    iget-object v2, v2, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    .line 34
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "__hs_session_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/DeviceModel;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/helpshift/campaigns/models/SessionModel;->identifier:Ljava/lang/String;

    .line 35
    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/DeviceModel;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/helpshift/campaigns/models/SessionModel;->deviceIdentifier:Ljava/lang/String;

    .line 36
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    iput-object v2, p0, Lcom/helpshift/campaigns/models/SessionModel;->userIdentifier:Ljava/lang/String;

    .line 37
    iput-wide v0, p0, Lcom/helpshift/campaigns/models/SessionModel;->startTime:J

    const-wide/16 v2, 0x0

    .line 38
    iput-wide v2, p0, Lcom/helpshift/campaigns/models/SessionModel;->endTime:J

    .line 39
    iput-wide v0, p0, Lcom/helpshift/campaigns/models/SessionModel;->referenceTime:J

    .line 40
    sget-object v0, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    iput-object v0, p0, Lcom/helpshift/campaigns/models/SessionModel;->syncStatus:Ljava/lang/Integer;

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/helpshift/campaigns/models/SessionModel;->durations:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLjava/util/ArrayList;Ljava/lang/Integer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "JJ",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/lang/Integer;",
            ")V"
        }
    .end annotation

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lcom/helpshift/campaigns/models/SessionModel;->identifier:Ljava/lang/String;

    .line 52
    iput-object p2, p0, Lcom/helpshift/campaigns/models/SessionModel;->deviceIdentifier:Ljava/lang/String;

    .line 53
    iput-object p3, p0, Lcom/helpshift/campaigns/models/SessionModel;->userIdentifier:Ljava/lang/String;

    .line 54
    iput-wide p4, p0, Lcom/helpshift/campaigns/models/SessionModel;->startTime:J

    .line 55
    iput-wide p6, p0, Lcom/helpshift/campaigns/models/SessionModel;->endTime:J

    .line 56
    iput-object p8, p0, Lcom/helpshift/campaigns/models/SessionModel;->durations:Ljava/util/ArrayList;

    .line 57
    iput-object p9, p0, Lcom/helpshift/campaigns/models/SessionModel;->syncStatus:Ljava/lang/Integer;

    .line 59
    invoke-virtual {p8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Long;

    .line 60
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    add-long/2addr p4, p2

    goto :goto_0

    .line 62
    :cond_0
    iput-wide p4, p0, Lcom/helpshift/campaigns/models/SessionModel;->referenceTime:J

    return-void
.end method


# virtual methods
.method public endNow()V
    .locals 6

    .line 103
    iget-wide v0, p0, Lcom/helpshift/campaigns/models/SessionModel;->endTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    .line 104
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 105
    iget-wide v2, p0, Lcom/helpshift/campaigns/models/SessionModel;->startTime:J

    iget-wide v4, p0, Lcom/helpshift/campaigns/models/SessionModel;->startElapsedTime:J

    sub-long/2addr v0, v4

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/helpshift/campaigns/models/SessionModel;->endTime:J

    :cond_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .line 122
    instance-of v0, p1, Lcom/helpshift/campaigns/models/SessionModel;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 123
    check-cast p1, Lcom/helpshift/campaigns/models/SessionModel;

    .line 124
    iget-object v0, p0, Lcom/helpshift/campaigns/models/SessionModel;->identifier:Ljava/lang/String;

    iget-object v2, p1, Lcom/helpshift/campaigns/models/SessionModel;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/SessionModel;->deviceIdentifier:Ljava/lang/String;

    iget-object v2, p1, Lcom/helpshift/campaigns/models/SessionModel;->deviceIdentifier:Ljava/lang/String;

    .line 125
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/SessionModel;->userIdentifier:Ljava/lang/String;

    iget-object v2, p1, Lcom/helpshift/campaigns/models/SessionModel;->userIdentifier:Ljava/lang/String;

    .line 126
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v2, p0, Lcom/helpshift/campaigns/models/SessionModel;->startTime:J

    iget-wide v4, p1, Lcom/helpshift/campaigns/models/SessionModel;->startTime:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    iget-wide v2, p0, Lcom/helpshift/campaigns/models/SessionModel;->endTime:J

    iget-wide v4, p1, Lcom/helpshift/campaigns/models/SessionModel;->endTime:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/SessionModel;->syncStatus:Ljava/lang/Integer;

    iget-object v2, p1, Lcom/helpshift/campaigns/models/SessionModel;->syncStatus:Ljava/lang/Integer;

    .line 129
    invoke-virtual {v0, v2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/SessionModel;->durations:Ljava/util/ArrayList;

    iget-object p1, p1, Lcom/helpshift/campaigns/models/SessionModel;->durations:Ljava/util/ArrayList;

    .line 130
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public toData()Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/util/HashMap;",
            ">;"
        }
    .end annotation

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 74
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string/jumbo v2, "t"

    const-string v3, "s"

    .line 75
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    iget-object v3, p0, Lcom/helpshift/campaigns/models/SessionModel;->identifier:Ljava/lang/String;

    const-string v4, "sid"

    invoke-virtual {v1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    iget-wide v5, p0, Lcom/helpshift/campaigns/models/SessionModel;->startTime:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const-string/jumbo v5, "ts"

    invoke-virtual {v1, v5, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    iget-object v1, p0, Lcom/helpshift/campaigns/models/SessionModel;->durations:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const-string v6, "d"

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    .line 82
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 83
    invoke-virtual {v7, v2, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    iget-object v8, p0, Lcom/helpshift/campaigns/models/SessionModel;->identifier:Ljava/lang/String;

    invoke-virtual {v7, v4, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    invoke-virtual {v7, v6, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 89
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v3, "e"

    .line 90
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    iget-object v2, p0, Lcom/helpshift/campaigns/models/SessionModel;->identifier:Ljava/lang/String;

    invoke-virtual {v1, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    iget-wide v2, p0, Lcom/helpshift/campaigns/models/SessionModel;->endTime:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    iget-wide v2, p0, Lcom/helpshift/campaigns/models/SessionModel;->endTime:J

    iget-wide v4, p0, Lcom/helpshift/campaigns/models/SessionModel;->referenceTime:J

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v1, v6, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public updateDurations()V
    .locals 6

    .line 113
    iget-wide v0, p0, Lcom/helpshift/campaigns/models/SessionModel;->endTime:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    .line 114
    iget-wide v0, p0, Lcom/helpshift/campaigns/models/SessionModel;->startTime:J

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/helpshift/campaigns/models/SessionModel;->startElapsedTime:J

    sub-long/2addr v2, v4

    add-long/2addr v0, v2

    .line 115
    iget-object v2, p0, Lcom/helpshift/campaigns/models/SessionModel;->durations:Ljava/util/ArrayList;

    iget-wide v3, p0, Lcom/helpshift/campaigns/models/SessionModel;->referenceTime:J

    sub-long v3, v0, v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    iput-wide v0, p0, Lcom/helpshift/campaigns/models/SessionModel;->referenceTime:J

    :cond_0
    return-void
.end method
