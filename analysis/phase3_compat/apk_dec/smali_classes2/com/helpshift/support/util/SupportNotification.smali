.class public final Lcom/helpshift/support/util/SupportNotification;
.super Ljava/lang/Object;
.source "SupportNotification.java"


# static fields
.field public static final APP_NAME:Ljava/lang/String; = "app_name"

.field public static final BUNGLE_ARG_NOTIFICATION_CONVERSATION_ID:Ljava/lang/String; = "conversationIdInPush"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createNotification(Landroid/content/Context;Ljava/lang/Long;Ljava/lang/String;ILjava/lang/String;)Landroidx/core/app/NotificationCompat$Builder;
    .locals 6

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Creating Support notification : \n Id : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n Title : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n Message count : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_SupportNotif"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getDelegate()Lcom/helpshift/delegate/UIThreadDelegateDecorator;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/helpshift/delegate/UIThreadDelegateDecorator;->didReceiveNotification(I)V

    .line 42
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/helpshift/R$plurals;->hs__notification_content_title:I

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    .line 43
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 42
    invoke-virtual {v0, v1, p3, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    .line 44
    invoke-static {p0}, Lcom/helpshift/util/ApplicationUtil;->getLogoResourceValue(Landroid/content/Context;)I

    move-result v0

    .line 47
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v1

    const-string v3, "notificationIconId"

    invoke-virtual {v1, v3}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    .line 48
    invoke-static {p0, v1}, Lcom/helpshift/util/AssetsUtil;->resourceExists(Landroid/content/Context;Ljava/lang/Integer;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 49
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 52
    :cond_0
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v1

    invoke-interface {v1}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v1

    const-string v3, "notificationLargeIconId"

    invoke-virtual {v1, v3}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    .line 53
    invoke-static {p0, v1}, Lcom/helpshift/util/AssetsUtil;->resourceExists(Landroid/content/Context;Ljava/lang/Integer;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 54
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v3, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    if-eqz p2, :cond_2

    .line 59
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    goto :goto_1

    :cond_2
    const/4 p2, 0x0

    .line 62
    :goto_1
    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/helpshift/support/activities/ParentActivity;

    invoke-direct {v3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v4, 0x10000000

    .line 63
    invoke-virtual {v3, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v4, "support_mode"

    .line 64
    invoke-virtual {v3, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v4, "conversationIdInPush"

    .line 65
    invoke-virtual {v3, v4, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string p1, "isRoot"

    .line 66
    invoke-virtual {v3, p1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 68
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x17

    if-ge p1, v4, :cond_3

    goto :goto_2

    :cond_3
    const/high16 v5, 0x4000000

    .line 71
    :goto_2
    invoke-static {p0, p2, v3, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    .line 70
    invoke-static {p0, p1}, Lcom/helpshift/PluginEventBridge;->getPendingIntentForNotification(Landroid/content/Context;Landroid/app/PendingIntent;)Landroid/app/PendingIntent;

    move-result-object p1

    .line 76
    new-instance p2, Landroidx/core/app/NotificationCompat$Builder;

    invoke-direct {p2, p0}, Landroidx/core/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 77
    invoke-virtual {p2, v0}, Landroidx/core/app/NotificationCompat$Builder;->setSmallIcon(I)Landroidx/core/app/NotificationCompat$Builder;

    .line 78
    invoke-virtual {p2, p4}, Landroidx/core/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 79
    invoke-virtual {p2, p3}, Landroidx/core/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroidx/core/app/NotificationCompat$Builder;

    .line 80
    invoke-virtual {p2, p1}, Landroidx/core/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroidx/core/app/NotificationCompat$Builder;

    .line 81
    invoke-virtual {p2, v2}, Landroidx/core/app/NotificationCompat$Builder;->setAutoCancel(Z)Landroidx/core/app/NotificationCompat$Builder;

    if-eqz v1, :cond_4

    .line 84
    invoke-virtual {p2, v1}, Landroidx/core/app/NotificationCompat$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroidx/core/app/NotificationCompat$Builder;

    .line 87
    :cond_4
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 88
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p3

    invoke-interface {p3}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object p3

    const-string p4, "notificationSoundId"

    invoke-virtual {p3, p4}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->getInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p3

    .line 87
    invoke-static {p1, p3}, Lcom/helpshift/util/AssetsUtil;->getNotificationSoundUri(Landroid/content/Context;Ljava/lang/Integer;)Landroid/net/Uri;

    move-result-object p1

    const-string p3, "android.permission.VIBRATE"

    if-nez p1, :cond_6

    .line 90
    invoke-static {p0, p3}, Lcom/helpshift/util/ApplicationUtil;->isPermissionGranted(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5

    const/4 p0, -0x1

    .line 91
    invoke-virtual {p2, p0}, Landroidx/core/app/NotificationCompat$Builder;->setDefaults(I)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_3

    :cond_5
    const/4 p0, 0x5

    .line 94
    invoke-virtual {p2, p0}, Landroidx/core/app/NotificationCompat$Builder;->setDefaults(I)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_3

    .line 99
    :cond_6
    invoke-virtual {p2, p1}, Landroidx/core/app/NotificationCompat$Builder;->setSound(Landroid/net/Uri;)Landroidx/core/app/NotificationCompat$Builder;

    .line 100
    invoke-static {p0, p3}, Lcom/helpshift/util/ApplicationUtil;->isPermissionGranted(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_7

    const/4 p0, 0x6

    .line 101
    invoke-virtual {p2, p0}, Landroidx/core/app/NotificationCompat$Builder;->setDefaults(I)Landroidx/core/app/NotificationCompat$Builder;

    goto :goto_3

    :cond_7
    const/4 p0, 0x4

    .line 105
    invoke-virtual {p2, p0}, Landroidx/core/app/NotificationCompat$Builder;->setDefaults(I)Landroidx/core/app/NotificationCompat$Builder;

    :goto_3
    return-object p2
.end method
