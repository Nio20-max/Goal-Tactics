.class public Lcom/helpshift/campaigns/models/CampaignSyncModel;
.super Ljava/lang/Object;
.source "CampaignSyncModel.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_CampSyncMod"

.field private static final serialVersionUID:J = 0x2L


# instance fields
.field public campaignId:Ljava/lang/String;

.field public creativeUrl:Ljava/lang/String;

.field public expiryTimeStamp:J

.field private isSyncing:Z

.field public timeStamp:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJZ)V
    .locals 2

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide v0, 0x7fffffffffffffffL

    .line 19
    iput-wide v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->expiryTimeStamp:J

    .line 27
    iput-object p1, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->campaignId:Ljava/lang/String;

    .line 28
    iput-object p2, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->creativeUrl:Ljava/lang/String;

    .line 29
    iput-wide p3, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->timeStamp:J

    .line 30
    iput-wide p5, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->expiryTimeStamp:J

    .line 31
    iput-boolean p7, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->isSyncing:Z

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 4

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide v0, 0x7fffffffffffffffL

    .line 19
    iput-wide v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->expiryTimeStamp:J

    :try_start_0
    const-string v2, "cid"

    .line 36
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->campaignId:Ljava/lang/String;

    const-string v2, "creative-url"

    .line 37
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->creativeUrl:Ljava/lang/String;

    const-string/jumbo v2, "ts"

    .line 38
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->timeStamp:J

    const-string v2, "expires"

    .line 39
    invoke-virtual {p1, v2, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->expiryTimeStamp:J

    const/4 p1, 0x0

    .line 41
    iput-boolean p1, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->isSyncing:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Helpshift_CampSyncMod"

    const-string v1, "Exception in initializing model with json object : "

    .line 44
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 81
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 82
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->campaignId:Ljava/lang/String;

    .line 83
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->creativeUrl:Ljava/lang/String;

    .line 84
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->timeStamp:J

    .line 85
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readBoolean()Z

    move-result v0

    iput-boolean v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->isSyncing:Z

    .line 87
    :try_start_0
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->expiryTimeStamp:J
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-wide v0, 0x7fffffffffffffffL

    .line 90
    iput-wide v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->expiryTimeStamp:J

    :goto_0
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 65
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->campaignId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 66
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->creativeUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 67
    iget-wide v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->timeStamp:J

    invoke-virtual {p1, v0, v1}, Ljava/io/ObjectOutputStream;->writeLong(J)V

    .line 68
    iget-boolean v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->isSyncing:Z

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeBoolean(Z)V

    .line 69
    iget-wide v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->expiryTimeStamp:J

    invoke-virtual {p1, v0, v1}, Ljava/io/ObjectOutputStream;->writeLong(J)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    .line 96
    instance-of v0, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 97
    check-cast p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;

    .line 98
    iget-boolean v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->isSyncing:Z

    iget-boolean v2, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->isSyncing:Z

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->campaignId:Ljava/lang/String;

    iget-object v2, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->campaignId:Ljava/lang/String;

    .line 99
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->creativeUrl:Ljava/lang/String;

    iget-object v2, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->creativeUrl:Ljava/lang/String;

    .line 100
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v2, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->timeStamp:J

    iget-wide v4, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->timeStamp:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_0

    iget-wide v2, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->expiryTimeStamp:J

    iget-wide v4, p1, Lcom/helpshift/campaigns/models/CampaignSyncModel;->expiryTimeStamp:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public isSyncing()Z
    .locals 1

    .line 49
    iget-boolean v0, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->isSyncing:Z

    return v0
.end method

.method public setIsSyncing(Z)V
    .locals 0

    .line 53
    iput-boolean p1, p0, Lcom/helpshift/campaigns/models/CampaignSyncModel;->isSyncing:Z

    return-void
.end method
