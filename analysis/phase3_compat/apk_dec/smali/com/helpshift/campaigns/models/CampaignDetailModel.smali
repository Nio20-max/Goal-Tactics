.class public Lcom/helpshift/campaigns/models/CampaignDetailModel;
.super Ljava/lang/Object;
.source "CampaignDetailModel.java"

# interfaces
.implements Lcom/helpshift/campaigns/models/InboxMessage;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_CampDetailMod"


# instance fields
.field public actions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/ActionModel;",
            ">;"
        }
    .end annotation
.end field

.field private backgroundColor:Ljava/lang/String;

.field private body:Ljava/lang/String;

.field private bodyColor:Ljava/lang/String;

.field public coverImageFilePath:Ljava/lang/String;

.field public coverImageUrl:Ljava/lang/String;

.field private createdAt:J

.field private expiryTimeStamp:J

.field public iconImageFilePath:Ljava/lang/String;

.field public iconImageUrl:Ljava/lang/String;

.field private identifier:Ljava/lang/String;

.field public messages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private readStatus:Z

.field private seenStatus:Z

.field private title:Ljava/lang/String;

.field private titleColor:Ljava/lang/String;

.field public userIdentifier:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZJJLjava/util/List;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZZJJ",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/ActionModel;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    move-object v0, p0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v1, p1

    .line 86
    iput-object v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->identifier:Ljava/lang/String;

    move-object v1, p2

    .line 87
    iput-object v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->userIdentifier:Ljava/lang/String;

    move-object v1, p3

    .line 88
    iput-object v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->title:Ljava/lang/String;

    move-object v1, p4

    .line 89
    iput-object v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->body:Ljava/lang/String;

    move-object v1, p5

    .line 90
    iput-object v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageUrl:Ljava/lang/String;

    move-object v1, p6

    .line 91
    iput-object v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageFilePath:Ljava/lang/String;

    move-object v1, p7

    .line 92
    iput-object v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageUrl:Ljava/lang/String;

    move-object v1, p8

    .line 93
    iput-object v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageFilePath:Ljava/lang/String;

    move-object v1, p9

    .line 94
    iput-object v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->backgroundColor:Ljava/lang/String;

    move-object v1, p10

    .line 95
    iput-object v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->titleColor:Ljava/lang/String;

    move-object v1, p11

    .line 96
    iput-object v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->bodyColor:Ljava/lang/String;

    move v1, p12

    .line 97
    iput-boolean v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->readStatus:Z

    move/from16 v1, p13

    .line 98
    iput-boolean v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->seenStatus:Z

    move-object/from16 v1, p18

    .line 99
    iput-object v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    move-object/from16 v1, p19

    .line 100
    iput-object v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->messages:Ljava/util/List;

    move-wide/from16 v1, p14

    .line 101
    iput-wide v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->createdAt:J

    move-wide/from16 v1, p16

    .line 102
    iput-wide v1, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->expiryTimeStamp:J

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/json/JSONObject;JJ)V
    .locals 1

    const-string v0, ""

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    :try_start_0
    iput-object p1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->identifier:Ljava/lang/String;

    .line 50
    iput-wide p3, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->createdAt:J

    .line 51
    iput-wide p5, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->expiryTimeStamp:J

    .line 52
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object p1

    iget-object p1, p1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {p1}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object p1

    iget-object p1, p1, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->userIdentifier:Ljava/lang/String;

    const-string/jumbo p1, "t"

    .line 53
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->title:Ljava/lang/String;

    const-string p1, "m"

    .line 54
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->body:Ljava/lang/String;

    const-string p1, "ci"

    .line 55
    invoke-virtual {p2, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageUrl:Ljava/lang/String;

    const-string p1, "ic"

    .line 56
    invoke-virtual {p2, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageUrl:Ljava/lang/String;

    const-string p1, "ss"

    .line 57
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string p3, "bg"

    .line 59
    invoke-virtual {p1, p3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->backgroundColor:Ljava/lang/String;

    const-string/jumbo p3, "tc"

    .line 60
    invoke-virtual {p1, p3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->titleColor:Ljava/lang/String;

    const-string p3, "mc"

    .line 61
    invoke-virtual {p1, p3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->bodyColor:Ljava/lang/String;

    .line 63
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    const-string p3, "bs"

    .line 64
    invoke-virtual {p2, p3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p2

    const/4 p3, 0x0

    .line 65
    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result p4

    if-ge p3, p4, :cond_0

    .line 66
    new-instance p4, Lcom/helpshift/campaigns/models/ActionModel;

    invoke-virtual {p2, p3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p5

    invoke-direct {p4, p5}, Lcom/helpshift/campaigns/models/ActionModel;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {p1, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    .line 68
    :cond_0
    iput-object p1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string p2, "Helpshift_CampDetailMod"

    const-string p3, "Exception while creating Campaign Detail Object : "

    .line 71
    invoke-static {p2, p3, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 298
    instance-of v0, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    .line 299
    check-cast p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 300
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->identifier:Ljava/lang/String;

    iget-object v2, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->identifier:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->userIdentifier:Ljava/lang/String;

    iget-object v3, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->userIdentifier:Ljava/lang/String;

    .line 301
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->title:Ljava/lang/String;

    iget-object v3, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->title:Ljava/lang/String;

    .line 302
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->body:Ljava/lang/String;

    iget-object v3, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->body:Ljava/lang/String;

    .line 303
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageUrl:Ljava/lang/String;

    iget-object v3, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageUrl:Ljava/lang/String;

    .line 304
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->backgroundColor:Ljava/lang/String;

    iget-object v3, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->backgroundColor:Ljava/lang/String;

    .line 305
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->titleColor:Ljava/lang/String;

    iget-object v3, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->titleColor:Ljava/lang/String;

    .line 306
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->bodyColor:Ljava/lang/String;

    iget-object v3, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->bodyColor:Ljava/lang/String;

    .line 307
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->readStatus:Z

    iget-boolean v3, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->readStatus:Z

    if-ne v0, v3, :cond_0

    iget-boolean v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->seenStatus:Z

    iget-boolean v3, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->seenStatus:Z

    if-ne v0, v3, :cond_0

    iget-wide v3, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->createdAt:J

    iget-wide v5, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->createdAt:J

    cmp-long v0, v3, v5

    if-nez v0, :cond_0

    iget-wide v3, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->expiryTimeStamp:J

    iget-wide v5, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->expiryTimeStamp:J

    cmp-long v0, v3, v5

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 312
    :goto_0
    iget-object v3, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageFilePath:Ljava/lang/String;

    if-eqz v3, :cond_2

    if-eqz v0, :cond_1

    .line 313
    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageFilePath:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :goto_1
    const/4 v0, 0x1

    goto :goto_2

    :cond_1
    const/4 v0, 0x0

    goto :goto_2

    :cond_2
    if-eqz v0, :cond_1

    .line 316
    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageFilePath:Ljava/lang/String;

    if-nez v0, :cond_1

    goto :goto_1

    .line 319
    :goto_2
    iget-object v3, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageUrl:Ljava/lang/String;

    if-eqz v3, :cond_4

    if-eqz v0, :cond_3

    .line 320
    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageUrl:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :goto_3
    const/4 v0, 0x1

    goto :goto_4

    :cond_3
    const/4 v0, 0x0

    goto :goto_4

    :cond_4
    if-eqz v0, :cond_3

    .line 323
    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageUrl:Ljava/lang/String;

    if-nez v0, :cond_3

    goto :goto_3

    .line 326
    :goto_4
    iget-object v3, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageFilePath:Ljava/lang/String;

    if-eqz v3, :cond_6

    if-eqz v0, :cond_5

    .line 327
    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageFilePath:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    :goto_5
    const/4 v0, 0x1

    goto :goto_6

    :cond_5
    const/4 v0, 0x0

    goto :goto_6

    :cond_6
    if-eqz v0, :cond_5

    .line 330
    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageFilePath:Ljava/lang/String;

    if-nez v0, :cond_5

    goto :goto_5

    .line 333
    :goto_6
    iget-object v3, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    if-eqz v3, :cond_8

    if-eqz v0, :cond_7

    .line 334
    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    :goto_7
    const/4 v0, 0x1

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    goto :goto_8

    :cond_8
    if-eqz v0, :cond_7

    .line 337
    iget-object v0, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    if-nez v0, :cond_7

    goto :goto_7

    .line 340
    :goto_8
    iget-object v3, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->messages:Ljava/util/List;

    if-eqz v3, :cond_9

    if-eqz v0, :cond_a

    .line 341
    iget-object p1, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->messages:Ljava/util/List;

    invoke-interface {v3, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_a

    :goto_9
    const/4 v1, 0x1

    goto :goto_a

    :cond_9
    if-eqz v0, :cond_a

    .line 344
    iget-object p1, p1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->messages:Ljava/util/List;

    if-nez p1, :cond_a

    goto :goto_9

    :cond_a
    :goto_a
    return v1
.end method

.method public executeAction(ILandroid/app/Activity;)V
    .locals 2

    .line 248
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 249
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/campaigns/models/ActionModel;

    .line 250
    invoke-virtual {v0, p2}, Lcom/helpshift/campaigns/models/ActionModel;->executeAction(Landroid/app/Activity;)V

    .line 251
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object p2

    iget-object p2, p2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->analyticsEventController:Lcom/helpshift/campaigns/controllers/AnalyticsEventController;

    sget-object v1, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->BUTTON_EVENTS:[Ljava/lang/Integer;

    aget-object p1, v1, p1

    .line 253
    invoke-virtual {p0}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    iget-boolean v0, v0, Lcom/helpshift/campaigns/models/ActionModel;->isGoalCompletion:Z

    .line 254
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 252
    invoke-virtual {p2, p1, v1, v0}, Lcom/helpshift/campaigns/controllers/AnalyticsEventController;->recordAnalyticsEvent(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Boolean;)V

    :cond_0
    return-void
.end method

.method public getActionData(I)Ljava/lang/String;
    .locals 1

    .line 286
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 287
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/campaigns/models/ActionModel;

    iget-object p1, p1, Lcom/helpshift/campaigns/models/ActionModel;->actionData:Ljava/lang/String;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getActionTitle(I)Ljava/lang/String;
    .locals 1

    .line 220
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 221
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/campaigns/models/ActionModel;

    iget-object p1, p1, Lcom/helpshift/campaigns/models/ActionModel;->title:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public getActionTitleColor(I)Ljava/lang/String;
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 231
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/campaigns/models/ActionModel;

    iget-object p1, p1, Lcom/helpshift/campaigns/models/ActionModel;->textColor:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public getActionType(I)Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;
    .locals 1

    .line 261
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 262
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/campaigns/models/ActionModel;

    iget-object p1, p1, Lcom/helpshift/campaigns/models/ActionModel;->actionType:Lcom/helpshift/enums/ACTION_TYPE;

    .line 264
    sget-object v0, Lcom/helpshift/campaigns/models/CampaignDetailModel$1;->$SwitchMap$com$helpshift$enums$ACTION_TYPE:[I

    invoke-virtual {p1}, Lcom/helpshift/enums/ACTION_TYPE;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 278
    sget-object p1, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->UNKNOWN:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    return-object p1

    .line 276
    :pswitch_0
    sget-object p1, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->SHOW_ALERT_TO_RATE_APP:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    return-object p1

    .line 274
    :pswitch_1
    sget-object p1, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->SHOW_SINGLE_FAQ:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    return-object p1

    .line 272
    :pswitch_2
    sget-object p1, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->SHOW_CONVERSATION:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    return-object p1

    .line 270
    :pswitch_3
    sget-object p1, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->SHOW_FAQ_SECTION:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    return-object p1

    .line 268
    :pswitch_4
    sget-object p1, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->SHOW_FAQS:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    return-object p1

    .line 266
    :pswitch_5
    sget-object p1, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->OPEN_DEEP_LINK:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    return-object p1

    .line 281
    :cond_0
    sget-object p1, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->UNKNOWN:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getBackgroundColor()Ljava/lang/String;
    .locals 1

    .line 180
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->backgroundColor:Ljava/lang/String;

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->body:Ljava/lang/String;

    return-object v0
.end method

.method public getBodyColor()Ljava/lang/String;
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->bodyColor:Ljava/lang/String;

    return-object v0
.end method

.method public getCountOfActions()I
    .locals 1

    .line 209
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 210
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getCoverImage()Landroid/graphics/Bitmap;
    .locals 4

    .line 117
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageFilePath:Ljava/lang/String;

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/helpshift/util/ImageUtil;->getBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_1

    .line 119
    iget-object v1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageUrl:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 120
    iget-object v1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageFilePath:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 121
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageFilePath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 122
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 124
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 128
    :cond_0
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->inboxSyncController:Lcom/helpshift/campaigns/controllers/InboxSyncController;

    iget-object v2, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->identifier:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/helpshift/campaigns/controllers/InboxSyncController;->startCoverImageDownload(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-object v0
.end method

.method public getCreatedAt()J
    .locals 2

    .line 185
    iget-wide v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->createdAt:J

    return-wide v0
.end method

.method public getExpiryTimeStamp()J
    .locals 2

    .line 190
    iget-wide v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->expiryTimeStamp:J

    return-wide v0
.end method

.method public getIconImage()Landroid/graphics/Bitmap;
    .locals 4

    .line 136
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageFilePath:Ljava/lang/String;

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/helpshift/util/ImageUtil;->getBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_1

    .line 140
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v2, Lcom/helpshift/R$drawable;->hs__cam_inbox_default_icon:I

    invoke-static {v0, v2, v1}, Lcom/helpshift/util/ImageUtil;->getBitmap(Landroid/content/res/Resources;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 144
    iget-object v1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageUrl:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 145
    iget-object v1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageFilePath:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 146
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageFilePath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 147
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 149
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 152
    :cond_0
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->inboxSyncController:Lcom/helpshift/campaigns/controllers/InboxSyncController;

    iget-object v2, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->identifier:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/helpshift/campaigns/controllers/InboxSyncController;->startIconImageDownload(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->identifier:Ljava/lang/String;

    return-object v0
.end method

.method public getReadStatus()Z
    .locals 1

    .line 195
    iget-boolean v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->readStatus:Z

    return v0
.end method

.method public getSeenStatus()Z
    .locals 1

    .line 200
    iget-boolean v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->seenStatus:Z

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getTitleColor()Ljava/lang/String;
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->titleColor:Ljava/lang/String;

    return-object v0
.end method

.method public isActionGoalCompletion(I)Z
    .locals 1

    .line 240
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 241
    iget-object v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/campaigns/models/ActionModel;

    iget-boolean p1, p1, Lcom/helpshift/campaigns/models/ActionModel;->isGoalCompletion:Z

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isExpired()Z
    .locals 5

    .line 106
    iget-wide v0, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->expiryTimeStamp:J

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    .line 107
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iget-wide v2, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->expiryTimeStamp:J

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setReadStatus(Z)V
    .locals 0

    .line 293
    iput-boolean p1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->readStatus:Z

    return-void
.end method

.method public setSeenStatus(Z)V
    .locals 0

    .line 204
    iput-boolean p1, p0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->seenStatus:Z

    return-void
.end method
