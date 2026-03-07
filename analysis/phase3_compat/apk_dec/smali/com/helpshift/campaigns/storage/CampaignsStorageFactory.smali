.class public Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;
.super Ljava/lang/Object;
.source "CampaignsStorageFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/campaigns/storage/CampaignsStorageFactory$LazyHolder;
    }
.end annotation


# instance fields
.field public final campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

.field public final campaignSyncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

.field public final keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

.field public final propertyStorage:Lcom/helpshift/campaigns/storage/PropertyStorage;

.field public final sessionStorage:Lcom/helpshift/campaigns/storage/SessionStorage;


# direct methods
.method constructor <init>()V
    .locals 4

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Lcom/helpshift/storage/CachedKeyValueStorage;

    invoke-static {}, Lcom/helpshift/storage/StorageFactory;->getInstance()Lcom/helpshift/storage/StorageFactory;

    move-result-object v1

    iget-object v1, v1, Lcom/helpshift/storage/StorageFactory;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    .line 34
    invoke-direct {p0}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getCacheWhitelistKeys()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/helpshift/storage/CachedKeyValueStorage;-><init>(Lcom/helpshift/storage/KeyValueStorage;Ljava/util/Set;)V

    iput-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    .line 35
    new-instance v1, Lcom/helpshift/campaigns/storage/PropertyDbStorage;

    invoke-direct {v1}, Lcom/helpshift/campaigns/storage/PropertyDbStorage;-><init>()V

    iput-object v1, p0, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->propertyStorage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    .line 36
    new-instance v1, Lcom/helpshift/campaigns/storage/SessionDbStorage;

    invoke-direct {v1}, Lcom/helpshift/campaigns/storage/SessionDbStorage;-><init>()V

    iput-object v1, p0, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->sessionStorage:Lcom/helpshift/campaigns/storage/SessionStorage;

    .line 37
    new-instance v1, Lcom/helpshift/campaigns/storage/CampaignDbStorage;

    invoke-direct {v1}, Lcom/helpshift/campaigns/storage/CampaignDbStorage;-><init>()V

    iput-object v1, p0, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    .line 38
    new-instance v1, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;

    new-instance v2, Lcom/helpshift/util/concurrent/DispatchQueue;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/helpshift/util/concurrent/DispatchQueue;-><init>(Z)V

    invoke-direct {v1, v0, v2}, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;-><init>(Lcom/helpshift/storage/KeyValueStorage;Lcom/helpshift/util/concurrent/DispatchQueue;)V

    iput-object v1, p0, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->campaignSyncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

    return-void
.end method

.method private getCacheWhitelistKeys()Ljava/util/Set;
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 47
    new-instance v0, Ljava/util/HashSet;

    const-string v1, "firstDeviceSyncComplete"

    const-string v2, "hs__campaigns_icon_image_retry_counts"

    const-string v3, "sdk-language"

    const-string v4, "sdk-theme"

    const-string v5, "disableHelpshiftBranding"

    const-string v6, "screenOrientation"

    const-string v7, "data_type_device"

    const-string v8, "data_type_user"

    const-string v9, "data_type_session"

    const-string v10, "data_type_switch_user"

    const-string v11, "data_type_analytics_event"

    const-string v12, "__hs_switch_current_user"

    const-string v13, "__hs_switch_prev_user"

    filled-new-array/range {v1 .. v13}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public static getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;
    .locals 1

    .line 42
    sget-object v0, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory$LazyHolder;->INSTANCE:Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    return-object v0
.end method
