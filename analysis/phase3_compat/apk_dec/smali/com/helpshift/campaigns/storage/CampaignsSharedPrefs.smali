.class public Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;
.super Ljava/lang/Object;
.source "CampaignsSharedPrefs.java"


# static fields
.field public static final SHARED_PREF_NAME:Ljava/lang/String; = "HSCampaignsSharedPref"

.field private static campaignsSharedPrefs:Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;


# instance fields
.field private final sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "HSCampaignsSharedPref"

    const/4 v1, 0x0

    .line 20
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;->sharedPreferences:Landroid/content/SharedPreferences;

    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;
    .locals 2

    const-class v0, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;

    monitor-enter v0

    .line 24
    :try_start_0
    sget-object v1, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;->campaignsSharedPrefs:Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;

    if-nez v1, :cond_0

    .line 25
    new-instance v1, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;

    invoke-direct {v1, p0}, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;->campaignsSharedPrefs:Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;

    .line 28
    :cond_0
    sget-object p0, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;->campaignsSharedPrefs:Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public getCurrentSDKVersion()Ljava/lang/String;
    .locals 3

    .line 32
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;->sharedPreferences:Landroid/content/SharedPreferences;

    const-string v1, "libraryVersion"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setCurrentSDKVersion(Ljava/lang/String;)V
    .locals 2

    .line 37
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignsSharedPrefs;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "libraryVersion"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method
