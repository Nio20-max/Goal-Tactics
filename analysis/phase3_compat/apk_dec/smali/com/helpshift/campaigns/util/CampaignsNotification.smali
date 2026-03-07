.class public Lcom/helpshift/campaigns/util/CampaignsNotification;
.super Ljava/lang/Object;
.source "CampaignsNotification.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addAction(Landroidx/core/app/NotificationCompat$Builder;Landroid/content/Context;Landroid/content/Intent;IILjava/lang/String;Ljava/lang/String;Z)Landroidx/core/app/NotificationCompat$Builder;
    .locals 7

    if-eqz p4, :cond_0

    if-eqz p5, :cond_0

    .line 214
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ".a"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 215
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ".d"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object v1, p1

    move-object v4, p6

    move v5, p3

    move v6, p7

    .line 217
    invoke-static/range {v1 .. v6}, Lcom/helpshift/campaigns/util/CampaignsNotification;->getPendingIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)Landroid/app/PendingIntent;

    move-result-object p1

    .line 218
    invoke-virtual {p0, p4, p5, p1}, Landroidx/core/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    :cond_0
    return-object p0
.end method

.method public static createNotification(Landroid/content/Context;Landroid/content/Intent;)Landroidx/core/app/NotificationCompat$Builder;
    .locals 20

    move-object/from16 v8, p0

    move-object/from16 v9, p1

    .line 48
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    const-string v1, "cid"

    .line 49
    invoke-virtual {v9, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 50
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v2, v1, v0}, Lcom/helpshift/model/SdkInfoModel;->isDuplicateNotification(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    const/4 v6, 0x0

    if-eqz v2, :cond_0

    return-object v6

    :cond_0
    const-string v2, "hsp.a"

    .line 54
    invoke-virtual {v9, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "hsp.d"

    .line 55
    invoke-virtual {v9, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "alert"

    .line 56
    invoke-virtual {v9, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v4, "app_name"

    .line 57
    invoke-virtual {v9, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v4, "category"

    .line 58
    invoke-virtual {v9, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 59
    invoke-static {v8, v4}, Lcom/helpshift/campaigns/util/CampaignsNotification;->getActionsData(Landroid/content/Context;Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v4

    .line 61
    sget-object v10, Lcom/helpshift/enums/ACTION_TYPE;->SHOW_INBOX:Lcom/helpshift/enums/ACTION_TYPE;

    invoke-static {v2}, Lcom/helpshift/enums/ACTION_TYPE;->getEnum(Ljava/lang/String;)Lcom/helpshift/enums/ACTION_TYPE;

    move-result-object v11

    if-ne v10, v11, :cond_2

    .line 63
    invoke-static {v1}, Lcom/helpshift/campaigns/util/InAppCampaignsUtil;->getCampaignIdForLoggedInUser(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 67
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v10

    iget-object v10, v10, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v10, v1, v15}, Lcom/helpshift/model/SdkInfoModel;->setChangeSetId(Ljava/lang/String;Ljava/lang/String;)V

    const-wide v10, 0x7fffffffffffffffL

    const-string v1, "expires"

    .line 69
    invoke-virtual {v9, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 70
    invoke-static {v1}, Lcom/helpshift/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_1

    .line 71
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v10

    :cond_1
    move-wide/from16 v16, v10

    .line 73
    new-instance v1, Lcom/helpshift/campaigns/models/CampaignSyncModel;

    .line 75
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    const-wide/16 v12, 0x3e8

    div-long v13, v10, v12

    const/16 v18, 0x0

    move-object v10, v1

    move-object v11, v15

    move-object v12, v3

    move-object/from16 v19, v15

    move-wide/from16 v15, v16

    move/from16 v17, v18

    invoke-direct/range {v10 .. v17}, Lcom/helpshift/campaigns/models/CampaignSyncModel;-><init>(Ljava/lang/String;Ljava/lang/String;JJZ)V

    .line 78
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object v10

    iget-object v10, v10, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->campaignSyncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

    invoke-interface {v10, v1, v0}, Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;->addCampaign(Lcom/helpshift/campaigns/models/CampaignSyncModel;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object/from16 v19, v1

    .line 81
    :goto_0
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    iget-object v0, v0, Lcom/helpshift/model/AppInfoModel;->muteNotifications:Ljava/lang/Boolean;

    if-eqz v0, :cond_3

    .line 82
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_c

    .line 83
    :cond_3
    sget-object v0, Lcom/helpshift/campaigns/models/AnalyticsEvent$AnalyticsEventType;->VIEW:Ljava/lang/Integer;

    .line 84
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v10

    const/4 v11, 0x1

    move-object/from16 v0, p0

    move-object v1, v2

    move-object v2, v3

    move-object/from16 v3, v19

    move-object v12, v4

    move v4, v10

    move-object v10, v5

    move v5, v11

    .line 83
    invoke-static/range {v0 .. v5}, Lcom/helpshift/campaigns/util/CampaignsNotification;->getPendingIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)Landroid/app/PendingIntent;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 87
    new-instance v1, Landroidx/core/app/NotificationCompat$Builder;

    invoke-direct {v1, v8}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 88
    invoke-virtual {v1, v7}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 89
    new-instance v2, Landroidx/core/app/NotificationCompat$BigTextStyle;

    invoke-direct {v2}, Landroidx/core/app/NotificationCompat$BigTextStyle;-><init>()V

    invoke-virtual {v2, v7}, Landroidx/core/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$BigTextStyle;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/core/app/NotificationCompat$Builder;->setStyle(Landroidx/core/app/NotificationCompat$Style;)Landroidx/core/app/NotificationCompat$Builder;

    .line 90
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroidx/core/app/NotificationCompat$Builder;->setWhen(J)Landroidx/core/app/NotificationCompat$Builder;

    const/4 v11, 0x1

    .line 91
    invoke-virtual {v1, v11}, Landroidx/core/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroidx/core/app/NotificationCompat$Builder;

    .line 92
    invoke-virtual {v1, v0}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    const-string v0, "actionIds"

    .line 94
    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    move-object v13, v0

    check-cast v13, [I

    const-string v0, "actionIcons"

    .line 95
    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [I

    move-object v14, v0

    check-cast v14, [I

    const-string v0, "actionLabels"

    .line 96
    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    move-object v15, v0

    check-cast v15, [Ljava/lang/String;

    const-string v0, "foregroundStatus"

    .line 97
    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Z

    move-object/from16 v16, v0

    check-cast v16, [Z

    const-string v0, "requiresAuth"

    .line 98
    invoke-virtual {v12, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Z

    move-object v12, v0

    check-cast v12, [Z

    .line 99
    aget v3, v13, v11

    aget v4, v14, v11

    aget-object v5, v15, v11

    aget-boolean v7, v16, v11

    move-object v0, v1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v6, v19

    .line 100
    invoke-static/range {v0 .. v7}, Lcom/helpshift/campaigns/util/CampaignsNotification;->addAction(Landroidx/core/app/NotificationCompat$Builder;Landroid/content/Context;Landroid/content/Intent;IILjava/lang/String;Ljava/lang/String;Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    const/4 v7, 0x0

    .line 102
    aget v3, v13, v7

    aget v4, v14, v7

    aget-object v5, v15, v7

    aget-boolean v13, v16, v7

    const/4 v9, 0x0

    move v7, v13

    .line 103
    invoke-static/range {v0 .. v7}, Lcom/helpshift/campaigns/util/CampaignsNotification;->addAction(Landroidx/core/app/NotificationCompat$Builder;Landroid/content/Context;Landroid/content/Intent;IILjava/lang/String;Ljava/lang/String;Z)Landroidx/core/app/NotificationCompat$Builder;

    move-result-object v0

    .line 106
    aget-boolean v1, v12, v9

    if-nez v1, :cond_4

    aget-boolean v1, v12, v11

    if-eqz v1, :cond_5

    .line 107
    :cond_4
    invoke-virtual {v0, v9}, Landroidx/core/app/NotificationCompat$Builder;->setVisibility(I)Landroidx/core/app/NotificationCompat$Builder;

    :cond_5
    if-eqz v10, :cond_6

    .line 111
    invoke-virtual {v0, v10}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_1

    .line 114
    :cond_6
    invoke-static/range {p0 .. p0}, Lcom/helpshift/util/ApplicationUtil;->getApplicationName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 117
    :goto_1
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    iget-object v1, v1, Lcom/helpshift/model/AppInfoModel;->notificationIconId:Ljava/lang/Integer;

    .line 118
    invoke-static {v8, v1}, Lcom/helpshift/util/AssetsUtil;->resourceExists(Landroid/content/Context;Ljava/lang/Integer;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 119
    invoke-static/range {p0 .. p0}, Lcom/helpshift/util/ApplicationUtil;->getLogoResourceValue(Landroid/content/Context;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 121
    :cond_7
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 124
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    iget-object v1, v1, Lcom/helpshift/model/AppInfoModel;->largeNotificationIconId:Ljava/lang/Integer;

    .line 125
    invoke-static {v8, v1}, Lcom/helpshift/util/AssetsUtil;->resourceExists(Landroid/content/Context;Ljava/lang/Integer;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 126
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v2, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_8

    .line 128
    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroidx/core/app/NotificationCompat$Builder;

    .line 132
    :cond_8
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    .line 133
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v2

    invoke-interface {v2}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v2

    const-string v3, "notificationSoundId"

    invoke-virtual {v2, v3}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    .line 132
    invoke-static {v1, v2}, Lcom/helpshift/util/AssetsUtil;->getNotificationSoundUri(Landroid/content/Context;Ljava/lang/Integer;)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "android.permission.VIBRATE"

    .line 134
    invoke-static {v8, v2}, Lcom/helpshift/util/ApplicationUtil;->isPermissionGranted(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v1, :cond_a

    if-eqz v2, :cond_9

    const/4 v1, -0x1

    .line 137
    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setDefaults(I)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_2

    :cond_9
    const/4 v1, 0x5

    .line 140
    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setDefaults(I)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_2

    .line 145
    :cond_a
    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroidx/core/app/NotificationCompat$Builder;

    if-eqz v2, :cond_b

    const/4 v1, 0x6

    .line 147
    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setDefaults(I)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_2

    :cond_b
    const/4 v1, 0x4

    .line 151
    invoke-virtual {v0, v1}, Landroidx/core/app/NotificationCompat$Builder;->setDefaults(I)Landroidx/core/app/NotificationCompat$Builder;

    :goto_2
    return-object v0

    :cond_c
    return-object v6
.end method

.method private static getActionsData(Landroid/content/Context;Ljava/lang/String;)Ljava/util/HashMap;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 224
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v1, 0x2

    new-array v2, v1, [I

    new-array v3, v1, [I

    new-array v4, v1, [Ljava/lang/String;

    new-array v5, v1, [Z

    new-array v6, v1, [Z

    .line 230
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    if-eqz p1, :cond_1c

    .line 232
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    const/4 v7, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v8

    const/4 v9, 0x1

    const/4 v10, 0x0

    sparse-switch v8, :sswitch_data_0

    :goto_0
    const/4 v1, -0x1

    goto/16 :goto_1

    :sswitch_0
    const-string v1, "hs28"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v1, 0x1b

    goto/16 :goto_1

    :sswitch_1
    const-string v1, "hs27"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/16 v1, 0x1a

    goto/16 :goto_1

    :sswitch_2
    const-string v1, "hs26"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    goto :goto_0

    :cond_2
    const/16 v1, 0x19

    goto/16 :goto_1

    :sswitch_3
    const-string v1, "hs25"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_3

    goto :goto_0

    :cond_3
    const/16 v1, 0x18

    goto/16 :goto_1

    :sswitch_4
    const-string v1, "hs24"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_4

    goto :goto_0

    :cond_4
    const/16 v1, 0x17

    goto/16 :goto_1

    :sswitch_5
    const-string v1, "hs23"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_5

    goto :goto_0

    :cond_5
    const/16 v1, 0x16

    goto/16 :goto_1

    :sswitch_6
    const-string v1, "hs22"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    goto :goto_0

    :cond_6
    const/16 v1, 0x15

    goto/16 :goto_1

    :sswitch_7
    const-string v1, "hs21"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    goto :goto_0

    :cond_7
    const/16 v1, 0x14

    goto/16 :goto_1

    :sswitch_8
    const-string v1, "hs20"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_8

    goto :goto_0

    :cond_8
    const/16 v1, 0x13

    goto/16 :goto_1

    :sswitch_9
    const-string v1, "hs19"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_9

    goto/16 :goto_0

    :cond_9
    const/16 v1, 0x12

    goto/16 :goto_1

    :sswitch_a
    const-string v1, "hs18"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a

    goto/16 :goto_0

    :cond_a
    const/16 v1, 0x11

    goto/16 :goto_1

    :sswitch_b
    const-string v1, "hs17"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_b

    goto/16 :goto_0

    :cond_b
    const/16 v1, 0x10

    goto/16 :goto_1

    :sswitch_c
    const-string v1, "hs16"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_c

    goto/16 :goto_0

    :cond_c
    const/16 v1, 0xf

    goto/16 :goto_1

    :sswitch_d
    const-string v1, "hs15"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_d

    goto/16 :goto_0

    :cond_d
    const/16 v1, 0xe

    goto/16 :goto_1

    :sswitch_e
    const-string v1, "hs14"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_e

    goto/16 :goto_0

    :cond_e
    const/16 v1, 0xd

    goto/16 :goto_1

    :sswitch_f
    const-string v1, "hs13"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_f

    goto/16 :goto_0

    :cond_f
    const/16 v1, 0xc

    goto/16 :goto_1

    :sswitch_10
    const-string v1, "hs12"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_10

    goto/16 :goto_0

    :cond_10
    const/16 v1, 0xb

    goto/16 :goto_1

    :sswitch_11
    const-string v1, "hs11"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_11

    goto/16 :goto_0

    :cond_11
    const/16 v1, 0xa

    goto/16 :goto_1

    :sswitch_12
    const-string v1, "hs10"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_12

    goto/16 :goto_0

    :cond_12
    const/16 v1, 0x9

    goto/16 :goto_1

    :sswitch_13
    const-string v1, "hs9"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_13

    goto/16 :goto_0

    :cond_13
    const/16 v1, 0x8

    goto :goto_1

    :sswitch_14
    const-string v1, "hs8"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_14

    goto/16 :goto_0

    :cond_14
    const/4 v1, 0x7

    goto :goto_1

    :sswitch_15
    const-string v1, "hs7"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_15

    goto/16 :goto_0

    :cond_15
    const/4 v1, 0x6

    goto :goto_1

    :sswitch_16
    const-string v1, "hs6"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_16

    goto/16 :goto_0

    :cond_16
    const/4 v1, 0x5

    goto :goto_1

    :sswitch_17
    const-string v1, "hs5"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_17

    goto/16 :goto_0

    :cond_17
    const/4 v1, 0x4

    goto :goto_1

    :sswitch_18
    const-string v1, "hs4"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_18

    goto/16 :goto_0

    :cond_18
    const/4 v1, 0x3

    goto :goto_1

    :sswitch_19
    const-string v8, "hs3"

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1b

    goto/16 :goto_0

    :sswitch_1a
    const-string v1, "hs2"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_19

    goto/16 :goto_0

    :cond_19
    const/4 v1, 0x1

    goto :goto_1

    :sswitch_1b
    const-string v1, "hs1"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1a

    goto/16 :goto_0

    :cond_1a
    const/4 v1, 0x0

    :cond_1b
    :goto_1
    packed-switch v1, :pswitch_data_0

    goto/16 :goto_2

    :pswitch_0
    const/16 p1, 0x9a

    aput p1, v2, v10

    const/16 p1, 0x9b

    aput p1, v2, v9

    .line 504
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_rate:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 505
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_send_feedback:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 506
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_rate:I

    aput p0, v3, v10

    .line 507
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_send_feedback:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v9, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v9, v6, v9

    goto/16 :goto_2

    :pswitch_1
    const/16 p1, 0x98

    aput p1, v2, v10

    const/16 p1, 0x99

    aput p1, v2, v9

    .line 492
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_rate:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 493
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_later:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 494
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_rate:I

    aput p0, v3, v10

    .line 495
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_later:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v10, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v10, v6, v9

    goto/16 :goto_2

    :pswitch_2
    const/16 p1, 0x96

    aput p1, v2, v10

    const/16 p1, 0x97

    aput p1, v2, v9

    .line 484
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_rate:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 485
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_rate:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_3
    const/16 p1, 0x94

    aput p1, v2, v10

    const/16 p1, 0x95

    aput p1, v2, v9

    .line 476
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_open_help:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 477
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_help:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_4
    const/16 p1, 0x92

    aput p1, v2, v10

    const/16 p1, 0x93

    aput p1, v2, v9

    .line 468
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_reply:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 469
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_reply:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_5
    const/16 p1, 0x90

    aput p1, v2, v10

    const/16 p1, 0x91

    aput p1, v2, v9

    .line 460
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_read_faq:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 461
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_help:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_6
    const/16 p1, 0x8e

    aput p1, v2, v10

    const/16 p1, 0x8f

    aput p1, v2, v9

    .line 452
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_read_faqs:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 453
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_help:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_7
    const/16 p1, 0x8c

    aput p1, v2, v10

    const/16 p1, 0x8d

    aput p1, v2, v9

    .line 444
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_chat_now:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 445
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_chat_now:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_8
    const/16 p1, 0x8a

    aput p1, v2, v10

    const/16 p1, 0x8b

    aput p1, v2, v9

    .line 436
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_send_feedback:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 437
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_send_feedback:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_9
    const/16 p1, 0x88

    aput p1, v2, v10

    const/16 p1, 0x89

    aput p1, v2, v9

    .line 424
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_like:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 425
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_share:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 426
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_like:I

    aput p0, v3, v10

    .line 427
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_share:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v10, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v10, v6, v9

    goto/16 :goto_2

    :pswitch_a
    const/16 p1, 0x86

    aput p1, v2, v10

    const/16 p1, 0x87

    aput p1, v2, v9

    .line 412
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_like:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 413
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_dislike:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 414
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_like:I

    aput p0, v3, v10

    .line 415
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_dislike:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v10, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v10, v6, v9

    goto/16 :goto_2

    :pswitch_b
    const/16 p1, 0x84

    aput p1, v2, v10

    const/16 p1, 0x85

    aput p1, v2, v9

    .line 404
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_like:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 405
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_like:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_c
    const/16 p1, 0x82

    aput p1, v2, v10

    const/16 p1, 0x83

    aput p1, v2, v9

    .line 396
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_share:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 397
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_share:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_d
    const/16 p1, 0x80

    aput p1, v2, v10

    const/16 p1, 0x81

    aput p1, v2, v9

    .line 388
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_download:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 389
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_download:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_e
    const/16 p1, 0x7e

    aput p1, v2, v10

    const/16 p1, 0x7f

    aput p1, v2, v9

    .line 376
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_book_now:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 377
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_later:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 378
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_book_now:I

    aput p0, v3, v10

    .line 379
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_later:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v10, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v10, v6, v9

    goto/16 :goto_2

    :pswitch_f
    const/16 p1, 0x7c

    aput p1, v2, v10

    const/16 p1, 0x7d

    aput p1, v2, v9

    .line 368
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_book_now:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 369
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_book_now:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_10
    const/16 p1, 0x7a

    aput p1, v2, v10

    const/16 p1, 0x7b

    aput p1, v2, v9

    .line 356
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_buy_now:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 357
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_later:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 358
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_shop_now:I

    aput p0, v3, v10

    .line 359
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_later:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v10, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v10, v6, v9

    goto/16 :goto_2

    :pswitch_11
    const/16 p1, 0x78

    aput p1, v2, v10

    const/16 p1, 0x79

    aput p1, v2, v9

    .line 348
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_buy_now:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 349
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_shop_now:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_12
    const/16 p1, 0x76

    aput p1, v2, v10

    const/16 p1, 0x77

    aput p1, v2, v9

    .line 336
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_launch:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 337
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_later:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 338
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_launch:I

    aput p0, v3, v10

    .line 339
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_later:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v10, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v10, v6, v9

    goto/16 :goto_2

    :pswitch_13
    const/16 p1, 0x74

    aput p1, v2, v10

    const/16 p1, 0x75

    aput p1, v2, v9

    .line 328
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_launch:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 329
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_launch:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_14
    const/16 p1, 0x72

    aput p1, v2, v10

    const/16 p1, 0x73

    aput p1, v2, v9

    .line 316
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_shop_now:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 317
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_later:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 318
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_shop_now:I

    aput p0, v3, v10

    .line 319
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_later:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v10, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v10, v6, v9

    goto/16 :goto_2

    :pswitch_15
    const/16 p1, 0x70

    aput p1, v2, v10

    const/16 p1, 0x71

    aput p1, v2, v9

    .line 308
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_shop_now:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v10

    .line 309
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_shop_now:I

    aput p0, v3, v10

    aput-boolean v9, v5, v10

    aput-boolean v9, v6, v10

    goto/16 :goto_2

    :pswitch_16
    const/16 p1, 0x6e

    aput p1, v2, v10

    const/16 p1, 0x6f

    aput p1, v2, v9

    .line 296
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_accept:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 297
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_decline:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 298
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_yes:I

    aput p0, v3, v10

    .line 299
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_no:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v10, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v10, v6, v9

    goto/16 :goto_2

    :pswitch_17
    const/16 p1, 0x6c

    aput p1, v2, v10

    const/16 p1, 0x6d

    aput p1, v2, v9

    .line 284
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_accept:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 285
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_decline:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 286
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_yes:I

    aput p0, v3, v10

    .line 287
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_no:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v10, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v10, v6, v9

    goto/16 :goto_2

    :pswitch_18
    const/16 p1, 0x6a

    aput p1, v2, v10

    const/16 p1, 0x6b

    aput p1, v2, v9

    .line 272
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_accept:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 273
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_decline:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 274
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_yes:I

    aput p0, v3, v10

    .line 275
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_no:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v10, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v10, v6, v9

    goto/16 :goto_2

    :pswitch_19
    const/16 p1, 0x68

    aput p1, v2, v10

    const/16 p1, 0x69

    aput p1, v2, v9

    .line 260
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_yes:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 261
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_no:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 262
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_yes:I

    aput p0, v3, v10

    .line 263
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_no:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v10, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v10, v6, v9

    goto :goto_2

    :pswitch_1a
    const/16 p1, 0x66

    aput p1, v2, v10

    const/16 p1, 0x67

    aput p1, v2, v9

    .line 248
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_yes:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 249
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_no:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 250
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_yes:I

    aput p0, v3, v10

    .line 251
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_no:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v10, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v9, v6, v9

    goto :goto_2

    :pswitch_1b
    const/16 p1, 0x64

    aput p1, v2, v10

    const/16 p1, 0x65

    aput p1, v2, v9

    .line 236
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_yes:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v10

    .line 237
    sget p1, Lcom/helpshift/R$string;->hs__cam_action_no:I

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v9

    .line 238
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_yes:I

    aput p0, v3, v10

    .line 239
    sget p0, Lcom/helpshift/R$drawable;->hs__cam_action_no:I

    aput p0, v3, v9

    aput-boolean v9, v5, v10

    aput-boolean v10, v5, v9

    aput-boolean v9, v6, v10

    aput-boolean v10, v6, v9

    :cond_1c
    :goto_2
    const-string p0, "actionIds"

    .line 517
    invoke-virtual {v0, p0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "actionLabels"

    .line 518
    invoke-virtual {v0, p0, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "actionIcons"

    .line 519
    invoke-virtual {v0, p0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "foregroundStatus"

    .line 520
    invoke-virtual {v0, p0, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "requiresAuth"

    .line 521
    invoke-virtual {v0, p0, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :sswitch_data_0
    .sparse-switch
        0x19486 -> :sswitch_1b
        0x19487 -> :sswitch_1a
        0x19488 -> :sswitch_19
        0x19489 -> :sswitch_18
        0x1948a -> :sswitch_17
        0x1948b -> :sswitch_16
        0x1948c -> :sswitch_15
        0x1948d -> :sswitch_14
        0x1948e -> :sswitch_13
        0x30fc6a -> :sswitch_12
        0x30fc6b -> :sswitch_11
        0x30fc6c -> :sswitch_10
        0x30fc6d -> :sswitch_f
        0x30fc6e -> :sswitch_e
        0x30fc6f -> :sswitch_d
        0x30fc70 -> :sswitch_c
        0x30fc71 -> :sswitch_b
        0x30fc72 -> :sswitch_a
        0x30fc73 -> :sswitch_9
        0x30fc89 -> :sswitch_8
        0x30fc8a -> :sswitch_7
        0x30fc8b -> :sswitch_6
        0x30fc8c -> :sswitch_5
        0x30fc8d -> :sswitch_4
        0x30fc8e -> :sswitch_3
        0x30fc8f -> :sswitch_2
        0x30fc90 -> :sswitch_1
        0x30fc91 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getCampaignsId(Landroid/content/Intent;)Ljava/lang/String;
    .locals 2

    const-string v0, "cid"

    .line 39
    invoke-virtual {p0, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "hsp.a"

    .line 40
    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz v0, :cond_0

    .line 41
    sget-object v1, Lcom/helpshift/enums/ACTION_TYPE;->SHOW_INBOX:Lcom/helpshift/enums/ACTION_TYPE;

    invoke-static {p0}, Lcom/helpshift/enums/ACTION_TYPE;->getEnum(Ljava/lang/String;)Lcom/helpshift/enums/ACTION_TYPE;

    move-result-object p0

    if-ne v1, p0, :cond_0

    .line 42
    invoke-static {v0}, Lcom/helpshift/campaigns/util/InAppCampaignsUtil;->getCampaignIdForLoggedInUser(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    return-object v0
.end method

.method private static getPendingIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)Landroid/app/PendingIntent;
    .locals 2

    if-eqz p5, :cond_0

    .line 169
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/helpshift/campaigns/activities/NotificationActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const v1, 0x10008000

    .line 170
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    goto :goto_0

    .line 173
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/helpshift/campaigns/services/NotificationService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    :goto_0
    const-string v1, "action"

    .line 176
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "data"

    .line 177
    invoke-virtual {v0, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "campaignId"

    .line 178
    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string/jumbo p1, "type"

    .line 179
    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "foregroundStatus"

    .line 180
    invoke-virtual {v0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 194
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 p1, 0x10000000

    const/4 p2, 0x1

    if-eqz p5, :cond_1

    .line 197
    invoke-static {p0, p2, v0, p1}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    goto :goto_1

    .line 200
    :cond_1
    invoke-static {p0, p2, v0, p1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    .line 202
    :goto_1
    invoke-static {p0, p1}, Lcom/helpshift/PluginEventBridge;->getPendingIntentForNotification(Landroid/content/Context;Landroid/app/PendingIntent;)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method
