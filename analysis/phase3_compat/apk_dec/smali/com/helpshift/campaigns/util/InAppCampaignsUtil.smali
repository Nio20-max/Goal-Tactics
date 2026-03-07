.class public final Lcom/helpshift/campaigns/util/InAppCampaignsUtil;
.super Ljava/lang/Object;
.source "InAppCampaignsUtil.java"


# static fields
.field private static workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 26
    new-instance v0, Lcom/helpshift/util/concurrent/DispatchQueue;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/helpshift/util/concurrent/DispatchQueue;-><init>(Z)V

    sput-object v0, Lcom/helpshift/campaigns/util/InAppCampaignsUtil;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cleanAndGetActiveCampaigns(Landroid/content/Context;Lcom/helpshift/campaigns/storage/CampaignStorage;Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/helpshift/campaigns/storage/CampaignStorage;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/CampaignDetailModel;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 63
    invoke-static {p2}, Lcom/helpshift/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 66
    :cond_0
    invoke-interface {p1, p2}, Lcom/helpshift/campaigns/storage/CampaignStorage;->getAllCampaigns(Ljava/lang/String;)Ljava/util/List;

    move-result-object p2

    .line 67
    invoke-static {p0, p1, p2}, Lcom/helpshift/campaigns/util/InAppCampaignsUtil;->removeExpiredCampaigns(Landroid/content/Context;Lcom/helpshift/campaigns/storage/CampaignStorage;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static cleanAndGetActiveCampaigns(Landroid/content/Context;Lcom/helpshift/campaigns/storage/CampaignStorage;ZLjava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/helpshift/campaigns/storage/CampaignStorage;",
            "Z",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/CampaignDetailModel;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 83
    invoke-static {p3}, Lcom/helpshift/util/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 86
    :cond_0
    invoke-interface {p1, p2, p3}, Lcom/helpshift/campaigns/storage/CampaignStorage;->getAllCampaigns(ZLjava/lang/String;)Ljava/util/List;

    move-result-object p2

    .line 87
    invoke-static {p0, p1, p2}, Lcom/helpshift/campaigns/util/InAppCampaignsUtil;->removeExpiredCampaigns(Landroid/content/Context;Lcom/helpshift/campaigns/storage/CampaignStorage;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getCampaignIdForLoggedInUser(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 48
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/ControllerFactory;->userController:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 49
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ":"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static removeExpiredCampaigns(Landroid/content/Context;Lcom/helpshift/campaigns/storage/CampaignStorage;Ljava/util/List;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/helpshift/campaigns/storage/CampaignStorage;",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/CampaignDetailModel;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/models/CampaignDetailModel;",
            ">;"
        }
    .end annotation

    .line 100
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 101
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 102
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    if-eqz p2, :cond_2

    .line 104
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    .line 105
    invoke-virtual {v4}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getExpiryTimeStamp()J

    move-result-wide v5

    const-wide v7, 0x7fffffffffffffffL

    cmp-long v9, v5, v7

    if-eqz v9, :cond_1

    cmp-long v7, v5, v2

    if-lez v7, :cond_0

    goto :goto_1

    .line 110
    :cond_0
    invoke-virtual {v4}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 107
    :cond_1
    :goto_1
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 114
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p2

    if-lez p2, :cond_3

    .line 115
    sget-object p2, Lcom/helpshift/campaigns/util/InAppCampaignsUtil;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance v2, Lcom/helpshift/campaigns/util/InAppCampaignsUtil$1;

    invoke-direct {v2, p1, v1, p0}, Lcom/helpshift/campaigns/util/InAppCampaignsUtil$1;-><init>(Lcom/helpshift/campaigns/storage/CampaignStorage;Ljava/util/List;Landroid/content/Context;)V

    invoke-virtual {p2, v2}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    :cond_3
    return-object v0
.end method
