.class public Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;
.super Lcom/helpshift/campaigns/fragments/MainFragment;
.source "CampaignDetailFragment.java"

# interfaces
.implements Lcom/helpshift/campaigns/observers/CampaignDetailPresenterObserver;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_CampDetails"


# instance fields
.field private actionButtons:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/widget/Button;",
            ">;"
        }
    .end annotation
.end field

.field private bodyTextView:Landroid/widget/TextView;

.field private campaignDetailViewContainer:Landroid/widget/ScrollView;

.field private campaignId:Ljava/lang/String;

.field private coverImageProgressbar:Landroid/widget/ProgressBar;

.field private coverImageView:Lcom/helpshift/campaigns/views/AdjustableImageView;

.field private expiredMessageView:Landroid/widget/LinearLayout;

.field private expiredMessageViewStub:Landroid/view/ViewStub;

.field presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

.field private progressBar:Landroid/widget/ProgressBar;

.field private titleTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Landroid/os/Bundle;)Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;
    .locals 1

    .line 53
    new-instance v0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;

    invoke-direct {v0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;-><init>()V

    .line 54
    invoke-virtual {v0, p0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method


# virtual methods
.method public dataChanged()V
    .locals 2

    .line 229
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 230
    new-instance v1, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment$2;

    invoke-direct {v1, p0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment$2;-><init>(Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method invalidateUiElements()V
    .locals 6

    .line 138
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    const/4 v1, 0x0

    if-eqz v0, :cond_9

    .line 139
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->getView()Landroid/view/View;

    move-result-object v0

    .line 140
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->isExpired()Z

    move-result v2

    const/16 v3, 0x8

    if-eqz v2, :cond_1

    .line 141
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->expiredMessageView:Landroid/widget/LinearLayout;

    if-nez v2, :cond_0

    .line 142
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->expiredMessageViewStub:Landroid/view/ViewStub;

    invoke-virtual {v2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    iput-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->expiredMessageView:Landroid/widget/LinearLayout;

    .line 144
    :cond_0
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->expiredMessageView:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 145
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->campaignDetailViewContainer:Landroid/widget/ScrollView;

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->setVisibility(I)V

    if-eqz v0, :cond_a

    .line 147
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    goto/16 :goto_6

    .line 151
    :cond_1
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->expiredMessageView:Landroid/widget/LinearLayout;

    if-eqz v2, :cond_2

    .line 152
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 154
    :cond_2
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->campaignDetailViewContainer:Landroid/widget/ScrollView;

    invoke-virtual {v2, v1}, Landroid/widget/ScrollView;->setVisibility(I)V

    .line 155
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getTitle()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 156
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_0

    .line 159
    :cond_3
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 162
    :goto_0
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getCoverImage()Ljava/util/HashMap;

    move-result-object v2

    const-string v4, "bitmap"

    .line 163
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/Bitmap;

    if-eqz v4, :cond_5

    .line 166
    iget-object v5, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->coverImageView:Lcom/helpshift/campaigns/views/AdjustableImageView;

    invoke-virtual {v5, v4}, Lcom/helpshift/campaigns/views/AdjustableImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    const-string v4, "default"

    .line 167
    invoke-virtual {v2, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 168
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->coverImageProgressbar:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    goto :goto_1

    .line 171
    :cond_4
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->coverImageProgressbar:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 175
    :cond_5
    :goto_1
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->titleTextView:Landroid/widget/TextView;

    iget-object v3, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v3}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 177
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getTitleColor()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const-string v3, "Helpshift_CampDetails"

    if-nez v2, :cond_6

    .line 179
    :try_start_0
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->titleTextView:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v4}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getTitleColor()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v2

    const-string v4, "Error while parsing title color"

    .line 182
    invoke-static {v3, v4, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 186
    :cond_6
    :goto_2
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->bodyTextView:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v4}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getBody()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getTextColor()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 190
    :try_start_1
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->bodyTextView:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v4}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getTextColor()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    :catch_1
    move-exception v2

    const-string v4, "Error while parsing body color"

    .line 193
    invoke-static {v3, v4, v2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_7
    :goto_3
    if-eqz v0, :cond_8

    .line 197
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getBackgroundColor()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    .line 199
    :try_start_2
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getBackgroundColor()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_4

    :catch_2
    move-exception v0

    const-string v2, "Error while parsing background color"

    .line 202
    invoke-static {v3, v2, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_8
    :goto_4
    const/4 v0, 0x0

    .line 206
    :goto_5
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getCountOfActions()I

    move-result v2

    if-ge v0, v2, :cond_a

    .line 207
    iget-object v2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->actionButtons:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 208
    iget-object v3, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v3, v0}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getActionTitle(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 209
    iget-object v3, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v3, v0}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getActionTitleColor(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 211
    new-instance v3, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment$1;

    invoke-direct {v3, p0, v0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment$1;-><init>(Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;I)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 217
    invoke-virtual {v2, v1}, Landroid/widget/Button;->setVisibility(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 222
    :cond_9
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->getView()Landroid/view/View;

    move-result-object v0

    sget v2, Lcom/helpshift/R$string;->hs__data_not_found_msg:I

    invoke-static {v0, v2, v1}, Lcom/helpshift/views/HSSnackbar;->make(Landroid/view/View;II)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/snackbar/Snackbar;->show()V

    :cond_a
    :goto_6
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 2

    .line 60
    invoke-super {p0, p1}, Lcom/helpshift/campaigns/fragments/MainFragment;->onAttach(Landroid/content/Context;)V

    .line 61
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "campaignId"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->campaignId:Ljava/lang/String;

    .line 62
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object p1

    iget-object p1, p1, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    .line 63
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->campaignSyncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

    .line 64
    iget-object v1, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->campaignId:Ljava/lang/String;

    invoke-static {v1, p1, v0}, Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;->newInstance(Ljava/lang/String;Lcom/helpshift/campaigns/storage/CampaignStorage;Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;)Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 66
    new-instance v0, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-direct {v0, p1}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;-><init>(Lcom/helpshift/campaigns/interactors/CampaignDetailInteractor;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 109
    iget-object p3, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    if-eqz p3, :cond_0

    .line 110
    invoke-virtual {p3}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->setUp()V

    .line 111
    iget-object p3, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {p3, p0}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->addObserver(Lcom/helpshift/campaigns/observers/CampaignDetailPresenterObserver;)V

    .line 113
    :cond_0
    sget p3, Lcom/helpshift/R$layout;->hs__campaign_detail_fragment:I

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onPause()V
    .locals 1

    .line 130
    invoke-super {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->onPause()V

    .line 131
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    if-eqz v0, :cond_0

    .line 132
    invoke-virtual {v0}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->cleanUp()V

    .line 133
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v0, p0}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->removeObserver(Lcom/helpshift/campaigns/observers/CampaignDetailPresenterObserver;)V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 118
    invoke-super {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->onResume()V

    .line 119
    sget v0, Lcom/helpshift/R$string;->hs__cam_message:I

    invoke-virtual {p0, v0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->setToolbarTitle(Ljava/lang/String;)V

    .line 120
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->invalidateUiElements()V

    .line 121
    iget-object v0, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    if-eqz v0, :cond_0

    .line 122
    invoke-virtual {v0}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->markCampaignAsSeen()V

    .line 123
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->campaignId:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/helpshift/util/ApplicationUtil;->cancelNotification(Landroid/content/Context;Ljava/lang/String;)V

    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Campaign title : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->presenter:Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/presenters/CampaignDetailPresenter;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_CampDetails"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 2

    .line 92
    invoke-super {p0}, Lcom/helpshift/campaigns/fragments/MainFragment;->onStop()V

    .line 93
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->isChangingConfigurations()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->isDualPane()Z

    move-result v0

    if-nez v0, :cond_0

    .line 94
    invoke-static {p0}, Lcom/helpshift/campaigns/util/FragmentUtil;->getInboxFragment(Landroidx/fragment/app/Fragment;)Lcom/helpshift/campaigns/fragments/InboxFragment;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 96
    invoke-virtual {v0, v1}, Lcom/helpshift/campaigns/fragments/InboxFragment;->setShowDetailFragment(Z)V

    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1

    .line 73
    invoke-super {p0, p1, p2}, Lcom/helpshift/campaigns/fragments/MainFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 74
    sget p2, Lcom/helpshift/R$id;->campaign_cover_image:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/helpshift/campaigns/views/AdjustableImageView;

    iput-object p2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->coverImageView:Lcom/helpshift/campaigns/views/AdjustableImageView;

    .line 75
    sget p2, Lcom/helpshift/R$id;->campaign_cover_image_progress:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ProgressBar;

    iput-object p2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->coverImageProgressbar:Landroid/widget/ProgressBar;

    .line 76
    sget p2, Lcom/helpshift/R$id;->campaign_title:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->titleTextView:Landroid/widget/TextView;

    .line 77
    sget p2, Lcom/helpshift/R$id;->campaign_body:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->bodyTextView:Landroid/widget/TextView;

    .line 79
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->actionButtons:Ljava/util/List;

    .line 80
    sget v0, Lcom/helpshift/R$id;->action1_button:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    iget-object p2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->actionButtons:Ljava/util/List;

    sget v0, Lcom/helpshift/R$id;->action2_button:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    iget-object p2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->actionButtons:Ljava/util/List;

    sget v0, Lcom/helpshift/R$id;->action3_button:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    iget-object p2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->actionButtons:Ljava/util/List;

    sget v0, Lcom/helpshift/R$id;->action4_button:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    sget p2, Lcom/helpshift/R$id;->progress_bar:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ProgressBar;

    iput-object p2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->progressBar:Landroid/widget/ProgressBar;

    .line 85
    sget p2, Lcom/helpshift/R$id;->campaign_detail_view_container:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ScrollView;

    iput-object p2, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->campaignDetailViewContainer:Landroid/widget/ScrollView;

    .line 86
    sget p2, Lcom/helpshift/R$id;->hs__campaign_expired_view_stub:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewStub;

    iput-object p1, p0, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->expiredMessageViewStub:Landroid/view/ViewStub;

    const-string p1, "Helpshift_CampDetails"

    const-string p2, "Showing Campaign details"

    .line 87
    invoke-static {p1, p2}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected shouldRetainInstance()Z
    .locals 1

    .line 103
    invoke-virtual {p0}, Lcom/helpshift/campaigns/fragments/CampaignDetailFragment;->isTablet()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method
