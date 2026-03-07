.class public Lcom/helpshift/executors/SupportCampaignsActionExecutor;
.super Ljava/lang/Object;
.source "SupportCampaignsActionExecutor.java"

# interfaces
.implements Lcom/helpshift/executors/ActionExecutor;


# static fields
.field private static final serialVersionUID:J = 0x3f0f957cfad4dc4aL


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public executeAction(Landroid/app/Activity;Lcom/helpshift/enums/ACTION_TYPE;Ljava/lang/String;)V
    .locals 1

    .line 23
    sget-object v0, Lcom/helpshift/executors/SupportCampaignsActionExecutor$1;->$SwitchMap$com$helpshift$enums$ACTION_TYPE:[I

    invoke-virtual {p2}, Lcom/helpshift/enums/ACTION_TYPE;->ordinal()I

    move-result p2

    aget p2, v0, p2

    packed-switch p2, :pswitch_data_0

    .line 55
    invoke-static {}, Lcom/helpshift/applifecycle/HSAppLifeCycleController;->getInstance()Lcom/helpshift/applifecycle/HSAppLifeCycleController;

    move-result-object p2

    invoke-virtual {p2}, Lcom/helpshift/applifecycle/HSAppLifeCycleController;->isAppInForeground()Z

    move-result p2

    if-nez p2, :cond_0

    .line 57
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/helpshift/util/ApplicationUtil;->getLaunchIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 60
    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_0
    const/4 p1, 0x0

    .line 51
    invoke-static {p3, p1}, Lcom/helpshift/support/Support;->showAlertToRateApp(Ljava/lang/String;Lcom/helpshift/support/AlertToRateAppListener;)V

    goto :goto_0

    .line 48
    :pswitch_1
    invoke-static {p1, p3}, Lcom/helpshift/support/Support;->showSingleFAQ(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0

    .line 43
    :pswitch_2
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "conversationPrefillText"

    .line 44
    invoke-virtual {p2, v0, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    invoke-static {p1, p2}, Lcom/helpshift/support/Support;->showConversation(Landroid/app/Activity;Ljava/util/Map;)V

    goto :goto_0

    .line 40
    :pswitch_3
    invoke-static {p1, p3}, Lcom/helpshift/support/Support;->showFAQSection(Landroid/app/Activity;Ljava/lang/String;)V

    goto :goto_0

    .line 37
    :pswitch_4
    invoke-static {p1}, Lcom/helpshift/support/Support;->showFAQs(Landroid/app/Activity;)V

    goto :goto_0

    .line 25
    :pswitch_5
    new-instance p2, Landroid/content/Intent;

    const-string v0, "android.intent.action.VIEW"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 26
    invoke-static {p3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 28
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 32
    :catch_0
    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Lcom/helpshift/R$string;->hs__could_not_open_attachment_msg:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x0

    .line 31
    invoke-static {p1, p2, p3}, Lcom/helpshift/views/HSToast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 33
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_0
    :goto_0
    return-void

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
