.class public Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;
.super Ljava/lang/Object;
.source "CampaignDetailPresenter.java"

# interfaces
.implements Lcom/helpshift/campaigns/observers/CampaignDetailObserver;


# instance fields
.field private detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

.field private observers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/campaigns/observers/CampaignDetailPresenterObserver;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    .line 28
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->observers:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public addObserver(Lcom/helpshift/campaigns/observers/CampaignDetailPresenterObserver;)V
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->observers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public buttonClicked(ILandroid/app/Activity;)V
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->executeAction(ILandroid/app/Activity;)V

    return-void
.end method

.method public campaignCoverImageDownloaded()V
    .locals 2

    .line 181
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->observers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/observers/CampaignDetailPresenterObserver;

    .line 182
    invoke-interface {v1}, Lcom/helpshift/campaigns/observers/CampaignDetailPresenterObserver;->dataChanged()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public campaignDetailAdded()V
    .locals 2

    .line 169
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->observers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/observers/CampaignDetailPresenterObserver;

    .line 170
    invoke-interface {v1}, Lcom/helpshift/campaigns/observers/CampaignDetailPresenterObserver;->dataChanged()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public campaignIconImageDownloaded()V
    .locals 0

    return-void
.end method

.method public cleanUp()V
    .locals 1

    .line 200
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->cleanUp()V

    .line 201
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0, p0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->removeObserver(Lcom/helpshift/campaigns/observers/CampaignDetailObserver;)V

    return-void
.end method

.method public getActionTitle(I)Ljava/lang/String;
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    .line 135
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 136
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/campaigns/models/ActionModel;

    .line 137
    iget-object p1, p1, Lcom/helpshift/campaigns/models/ActionModel;->title:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    return-object p1
.end method

.method public getActionTitleColor(I)Ljava/lang/String;
    .locals 1

    .line 147
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    .line 148
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/helpshift/campaigns/models/ActionModel;

    .line 150
    iget-object p1, p1, Lcom/helpshift/campaigns/models/ActionModel;->textColor:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    return-object p1
.end method

.method public getBackgroundColor()Ljava/lang/String;
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 107
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getBackgroundColor()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getBody()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public getCountOfActions()I
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 120
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->actions:Ljava/util/List;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 124
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public getCoverImage()Ljava/util/HashMap;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 34
    iget-object v1, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v1

    const/4 v2, -0x1

    if-eqz v1, :cond_0

    .line 37
    iget-object v3, v1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageFilePath:Ljava/lang/String;

    invoke-static {v3, v2}, Lcom/helpshift/util/ImageUtil;->getBitmap(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v3

    .line 38
    iget-object v4, v1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageUrl:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    const-string v4, ""

    :goto_0
    if-nez v3, :cond_2

    if-eqz v1, :cond_2

    .line 41
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 42
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    sget v5, Lcom/helpshift/R$drawable;->hs__cam_inbox_default_cover:I

    invoke-static {v3, v5, v2}, Lcom/helpshift/util/ImageUtil;->getBitmap(Landroid/content/res/Resources;II)Landroid/graphics/Bitmap;

    move-result-object v3

    const/4 v2, 0x1

    .line 44
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v5, "default"

    invoke-virtual {v0, v5, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    iget-object v2, v1, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageFilePath:Ljava/lang/String;

    .line 47
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 48
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 49
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 51
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 55
    :cond_1
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/campaigns/controllers/ControllerFactory;->inboxSyncController:Lcom/helpshift/campaigns/controllers/InboxSyncController;

    .line 56
    invoke-virtual {v1}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getIdentifier()Ljava/lang/String;

    move-result-object v1

    .line 55
    invoke-virtual {v2, v4, v1}, Lcom/helpshift/campaigns/controllers/InboxSyncController;->startCoverImageDownload(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 65
    :cond_2
    invoke-static {}, Lcom/helpshift/campaigns/controllers/ControllerFactory;->getInstance()Lcom/helpshift/campaigns/controllers/ControllerFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/campaigns/controllers/ControllerFactory;->inboxSyncController:Lcom/helpshift/campaigns/controllers/InboxSyncController;

    invoke-virtual {v1, v4}, Lcom/helpshift/campaigns/controllers/InboxSyncController;->resetCorruptImageDownloadRetryCount(Ljava/lang/String;)V

    :goto_1
    const-string v1, "bitmap"

    .line 68
    invoke-virtual {v0, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public getTextColor()Ljava/lang/String;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getBodyColor()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getTitle()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public getTitleColor()Ljava/lang/String;
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->getTitleColor()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    return-object v0
.end method

.method public isExpired()Z
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->getCampaignDetailModel()Lcom/helpshift/campaigns/models/CampaignDetailModel;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 114
    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/CampaignDetailModel;->isExpired()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public markCampaignAsSeen()V
    .locals 1

    .line 158
    invoke-virtual {p0}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->isExpired()Z

    move-result v0

    if-nez v0, :cond_0

    .line 159
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->markCampaignAsSeen()V

    :cond_0
    return-void
.end method

.method public removeObserver(Lcom/helpshift/campaigns/observers/CampaignDetailPresenterObserver;)V
    .locals 1

    .line 191
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->observers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public setUp()V
    .locals 1

    .line 195
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->setUp()V

    .line 196
    iget-object v0, p0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->detailInteractor:Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    invoke-virtual {v0, p0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->addObserver(Lcom/helpshift/campaigns/observers/CampaignDetailObserver;)V

    return-void
.end method
