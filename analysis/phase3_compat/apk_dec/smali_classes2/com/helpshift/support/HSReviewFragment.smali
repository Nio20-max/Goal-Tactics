.class public final Lcom/helpshift/support/HSReviewFragment;
.super Landroidx/fragment/app/DialogFragment;
.source "HSReviewFragment.java"


# static fields
.field private static alertToRateAppListener:Lcom/helpshift/support/AlertToRateAppListener;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private disableReview:Z

.field rurl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 36
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    const-string v0, "Helpshift_ReviewFrag"

    .line 39
    iput-object v0, p0, Lcom/helpshift/support/HSReviewFragment;->TAG:Ljava/lang/String;

    const-string v0, ""

    .line 40
    iput-object v0, p0, Lcom/helpshift/support/HSReviewFragment;->rurl:Ljava/lang/String;

    const/4 v0, 0x1

    .line 41
    iput-boolean v0, p0, Lcom/helpshift/support/HSReviewFragment;->disableReview:Z

    return-void
.end method

.method private initAlertDialog(Landroidx/fragment/app/FragmentActivity;)Landroid/app/Dialog;
    .locals 3

    .line 97
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 98
    sget p1, Lcom/helpshift/R$string;->hs__review_message:I

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(I)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 99
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object p1

    .line 100
    sget v0, Lcom/helpshift/R$string;->hs__review_title:I

    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AlertDialog;->setTitle(I)V

    const/4 v0, 0x0

    .line 101
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 104
    invoke-virtual {p0}, Lcom/helpshift/support/HSReviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/helpshift/R$string;->hs__rate_button:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/helpshift/support/HSReviewFragment$1;

    invoke-direct {v1, p0}, Lcom/helpshift/support/HSReviewFragment$1;-><init>(Lcom/helpshift/support/HSReviewFragment;)V

    const/4 v2, -0x1

    .line 103
    invoke-virtual {p1, v2, v0, v1}, Landroidx/appcompat/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 122
    invoke-virtual {p0}, Lcom/helpshift/support/HSReviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/helpshift/R$string;->hs__feedback_button:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/helpshift/support/HSReviewFragment$2;

    invoke-direct {v1, p0}, Lcom/helpshift/support/HSReviewFragment$2;-><init>(Lcom/helpshift/support/HSReviewFragment;)V

    const/4 v2, -0x3

    .line 121
    invoke-virtual {p1, v2, v0, v1}, Landroidx/appcompat/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 147
    invoke-virtual {p0}, Lcom/helpshift/support/HSReviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/helpshift/R$string;->hs__review_close_button:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/helpshift/support/HSReviewFragment$3;

    invoke-direct {v1, p0}, Lcom/helpshift/support/HSReviewFragment$3;-><init>(Lcom/helpshift/support/HSReviewFragment;)V

    const/4 v2, -0x2

    .line 146
    invoke-virtual {p1, v2, v0, v1}, Landroidx/appcompat/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 155
    invoke-static {p1}, Lcom/helpshift/views/FontApplier;->apply(Landroid/app/Dialog;)V

    return-object p1
.end method

.method protected static setAlertToRateAppListener(Lcom/helpshift/support/AlertToRateAppListener;)V
    .locals 0

    .line 44
    sput-object p0, Lcom/helpshift/support/HSReviewFragment;->alertToRateAppListener:Lcom/helpshift/support/AlertToRateAppListener;

    return-void
.end method


# virtual methods
.method gotoApp(Ljava/lang/String;)V
    .locals 2

    .line 74
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 75
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 76
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 78
    :try_start_0
    invoke-virtual {p0}, Lcom/helpshift/support/HSReviewFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Helpshift_ReviewFrag"

    const-string v1, "Unable to resolve activity"

    .line 81
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 82
    invoke-virtual {p0}, Lcom/helpshift/support/HSReviewFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 83
    invoke-virtual {p0}, Lcom/helpshift/support/HSReviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/helpshift/R$string;->hs__could_not_open_attachment_msg:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 82
    invoke-static {p1, v0, v1}, Lcom/helpshift/views/HSToast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 84
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_0
    :goto_0
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    const-string p1, "later"

    .line 60
    invoke-virtual {p0, p1}, Lcom/helpshift/support/HSReviewFragment;->sendReviewActionEvent(Ljava/lang/String;)V

    const/4 p1, 0x2

    .line 61
    invoke-virtual {p0, p1}, Lcom/helpshift/support/HSReviewFragment;->sendAlertToRateAppAction(I)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3

    .line 49
    invoke-virtual {p0}, Lcom/helpshift/support/HSReviewFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 50
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    const-string v2, "disableReview"

    .line 52
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/helpshift/support/HSReviewFragment;->disableReview:Z

    const-string v1, "rurl"

    .line 53
    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/HSReviewFragment;->rurl:Ljava/lang/String;

    .line 55
    :cond_0
    invoke-direct {p0, p1}, Lcom/helpshift/support/HSReviewFragment;->initAlertDialog(Landroidx/fragment/app/FragmentActivity;)Landroid/app/Dialog;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    .line 66
    invoke-super {p0}, Landroidx/fragment/app/DialogFragment;->onDestroyView()V

    .line 67
    iget-boolean v0, p0, Lcom/helpshift/support/HSReviewFragment;->disableReview:Z

    if-eqz v0, :cond_0

    .line 68
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/CoreApi;->getSDKConfigurationDM()Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->setAppReviewed(Z)V

    .line 70
    :cond_0
    invoke-virtual {p0}, Lcom/helpshift/support/HSReviewFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void
.end method

.method sendAlertToRateAppAction(I)V
    .locals 1

    .line 90
    sget-object v0, Lcom/helpshift/support/HSReviewFragment;->alertToRateAppListener:Lcom/helpshift/support/AlertToRateAppListener;

    if-eqz v0, :cond_0

    .line 91
    invoke-interface {v0, p1}, Lcom/helpshift/support/AlertToRateAppListener;->onAction(I)V

    :cond_0
    const/4 p1, 0x0

    .line 93
    sput-object p1, Lcom/helpshift/support/HSReviewFragment;->alertToRateAppListener:Lcom/helpshift/support/AlertToRateAppListener;

    return-void
.end method

.method sendReviewActionEvent(Ljava/lang/String;)V
    .locals 3

    .line 160
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "type"

    const-string v2, "periodic"

    .line 161
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "response"

    .line 162
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getCoreApi()Lcom/helpshift/CoreApi;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/CoreApi;->getAnalyticsEventDM()Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;

    move-result-object p1

    sget-object v1, Lcom/helpshift/analytics/AnalyticsEventType;->REVIEWED_APP:Lcom/helpshift/analytics/AnalyticsEventType;

    invoke-virtual {p1, v1, v0}, Lcom/helpshift/analytics/domainmodel/AnalyticsEventDM;->pushEvent(Lcom/helpshift/analytics/AnalyticsEventType;Ljava/util/Map;)V

    return-void
.end method
