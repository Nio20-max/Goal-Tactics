.class public Lcom/helpshift/campaigns/models/SessionModelBuilder;
.super Ljava/lang/Object;
.source "SessionModelBuilder.java"


# instance fields
.field private final deviceIdentifier:Ljava/lang/String;

.field private durations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private endTime:J

.field private final identifier:Ljava/lang/String;

.field private final startTime:J

.field private syncStatus:Ljava/lang/Integer;

.field private final userIdentifier:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->identifier:Ljava/lang/String;

    .line 22
    iput-object p2, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->deviceIdentifier:Ljava/lang/String;

    .line 23
    iput-object p3, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->userIdentifier:Ljava/lang/String;

    .line 24
    iput-wide p4, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->startTime:J

    const-wide/16 p1, 0x0

    .line 25
    iput-wide p1, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->endTime:J

    .line 26
    sget-object p1, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    iput-object p1, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->syncStatus:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public build()Lcom/helpshift/campaigns/models/SessionModel;
    .locals 11

    .line 45
    new-instance v10, Lcom/helpshift/campaigns/models/SessionModel;

    iget-object v1, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->identifier:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->deviceIdentifier:Ljava/lang/String;

    iget-object v3, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->userIdentifier:Ljava/lang/String;

    iget-wide v4, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->startTime:J

    iget-wide v6, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->endTime:J

    iget-object v8, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->durations:Ljava/util/ArrayList;

    iget-object v9, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->syncStatus:Ljava/lang/Integer;

    move-object v0, v10

    invoke-direct/range {v0 .. v9}, Lcom/helpshift/campaigns/models/SessionModel;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLjava/util/ArrayList;Ljava/lang/Integer;)V

    return-object v10
.end method

.method public setDurations(Ljava/util/ArrayList;)Lcom/helpshift/campaigns/models/SessionModelBuilder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;)",
            "Lcom/helpshift/campaigns/models/SessionModelBuilder;"
        }
    .end annotation

    .line 40
    iput-object p1, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->durations:Ljava/util/ArrayList;

    return-object p0
.end method

.method public setEndTime(J)Lcom/helpshift/campaigns/models/SessionModelBuilder;
    .locals 0

    .line 30
    iput-wide p1, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->endTime:J

    return-object p0
.end method

.method public setSyncStatus(Ljava/lang/Integer;)Lcom/helpshift/campaigns/models/SessionModelBuilder;
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/helpshift/campaigns/models/SessionModelBuilder;->syncStatus:Ljava/lang/Integer;

    return-object p0
.end method
