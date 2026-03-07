.class public Lcom/helpshift/executors/CampaignActionExecutor;
.super Ljava/lang/Object;
.source "CampaignActionExecutor.java"

# interfaces
.implements Lcom/helpshift/executors/ActionExecutor;


# static fields
.field private static final serialVersionUID:J = 0x73f4dd88f0a010f5L


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public executeAction(Landroid/app/Activity;Lcom/helpshift/enums/ACTION_TYPE;Ljava/lang/String;)V
    .locals 1

    .line 20
    sget-object v0, Lcom/helpshift/executors/CampaignActionExecutor$1;->$SwitchMap$com$helpshift$enums$ACTION_TYPE:[I

    invoke-virtual {p2}, Lcom/helpshift/enums/ACTION_TYPE;->ordinal()I

    move-result p2

    aget p2, v0, p2

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    .line 35
    invoke-static {}, Lcom/helpshift/applifecycle/HSAppLifeCycleController;->getInstance()Lcom/helpshift/applifecycle/HSAppLifeCycleController;

    move-result-object p2

    invoke-virtual {p2}, Lcom/helpshift/applifecycle/HSAppLifeCycleController;->isAppInForeground()Z

    move-result p2

    if-nez p2, :cond_1

    .line 37
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/helpshift/util/ApplicationUtil;->getLaunchIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 40
    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 22
    :cond_0
    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 23
    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 25
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 29
    :catch_0
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Lcom/helpshift/R$string;->hs__could_not_open_attachment_msg:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x0

    .line 28
    invoke-static {p1, p2, p3}, Lcom/helpshift/views/HSToast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 30
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_1
    :goto_0
    return-void
.end method
