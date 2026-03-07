.class public Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns;
.super Ljava/lang/Object;
.source "HelpshiftCampaigns.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_XamCampaigns"

.field private static campaignsDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftCampaignsDelegate;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/helpshift/xamarin/campaigns/HelpshiftCampaignsDelegate;
    .locals 1

    .line 19
    sget-object v0, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns;->campaignsDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftCampaignsDelegate;

    return-object v0
.end method

.method public static addProperties(Ljava/util/Map;)[Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)[",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 48
    invoke-static {p0}, Lcom/helpshift/campaigns/Campaigns;->addProperties(Ljava/util/Map;)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static addProperty(Ljava/lang/String;Ljava/lang/Boolean;)Z
    .locals 0

    .line 36
    invoke-static {p0, p1}, Lcom/helpshift/campaigns/Campaigns;->addProperty(Ljava/lang/String;Ljava/lang/Boolean;)Z

    move-result p0

    return p0
.end method

.method public static addProperty(Ljava/lang/String;Ljava/lang/Integer;)Z
    .locals 0

    .line 32
    invoke-static {p0, p1}, Lcom/helpshift/campaigns/Campaigns;->addProperty(Ljava/lang/String;Ljava/lang/Integer;)Z

    move-result p0

    return p0
.end method

.method public static addProperty(Ljava/lang/String;Ljava/lang/Long;)Z
    .locals 0

    .line 44
    invoke-static {p0, p1}, Lcom/helpshift/campaigns/Campaigns;->addProperty(Ljava/lang/String;Ljava/lang/Long;)Z

    move-result p0

    return p0
.end method

.method public static addProperty(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 28
    invoke-static {p0, p1}, Lcom/helpshift/campaigns/Campaigns;->addProperty(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static addProperty(Ljava/lang/String;Ljava/util/Date;)Z
    .locals 0

    .line 40
    invoke-static {p0, p1}, Lcom/helpshift/campaigns/Campaigns;->addProperty(Ljava/lang/String;Ljava/util/Date;)Z

    move-result p0

    return p0
.end method

.method public static configure(Ljava/util/Map;)V
    .locals 0

    .line 243
    invoke-static {p0}, Lcom/helpshift/campaigns/Campaigns;->configure(Ljava/util/Map;)V

    return-void
.end method

.method public static getCountOfUnreadMessages()I
    .locals 1

    .line 60
    invoke-static {}, Lcom/helpshift/campaigns/Campaigns;->getCountOfUnreadMessages()I

    move-result v0

    return v0
.end method

.method public static requestUnreadMessagesCount()V
    .locals 2

    .line 237
    sget-object v0, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns;->campaignsDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftCampaignsDelegate;

    if-eqz v0, :cond_0

    .line 238
    invoke-static {}, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns;->getCountOfUnreadMessages()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaignsDelegate;->didReceiveUnreadMessagesCount(I)V

    :cond_0
    return-void
.end method

.method public static setCampaignsDelegate(Lcom/helpshift/xamarin/campaigns/HelpshiftCampaignsDelegate;)V
    .locals 0

    .line 222
    sput-object p0, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns;->campaignsDelegate:Lcom/helpshift/xamarin/campaigns/HelpshiftCampaignsDelegate;

    .line 223
    new-instance p0, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$2;

    invoke-direct {p0}, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$2;-><init>()V

    invoke-static {p0}, Lcom/helpshift/campaigns/Campaigns;->setDelegate(Lcom/helpshift/campaigns/Campaigns$Delegate;)V

    return-void
.end method

.method public static setInboxMessageDelegate(Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;)V
    .locals 3

    .line 65
    new-instance v0, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$1;

    invoke-direct {v0, p0}, Lcom/helpshift/xamarin/campaigns/HelpshiftCampaigns$1;-><init>(Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageDelegate;)V

    .line 217
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setInboxMessageDelegate : register InboxMessageDelegate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " for delegating calls to HelpshiftInboxMessageDelegate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "Helpshift_XamCampaigns"

    invoke-static {v1, p0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    invoke-static {v0}, Lcom/helpshift/campaigns/Campaigns;->setInboxMessageDelegate(Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;)V

    return-void
.end method

.method public static showInbox(Landroid/app/Activity;)V
    .locals 0

    .line 52
    invoke-static {p0}, Lcom/helpshift/campaigns/Campaigns;->showInbox(Landroid/app/Activity;)V

    return-void
.end method

.method public static showMessage(Ljava/lang/String;Landroid/app/Activity;)V
    .locals 0

    .line 56
    invoke-static {p0, p1}, Lcom/helpshift/campaigns/Campaigns;->showMessage(Ljava/lang/String;Landroid/app/Activity;)V

    return-void
.end method
