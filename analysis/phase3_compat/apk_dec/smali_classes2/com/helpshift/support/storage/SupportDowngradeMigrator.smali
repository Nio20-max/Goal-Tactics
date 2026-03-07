.class public Lcom/helpshift/support/storage/SupportDowngradeMigrator;
.super Ljava/lang/Object;
.source "SupportDowngradeMigrator.java"

# interfaces
.implements Lcom/helpshift/support/storage/SDKMigrator;


# instance fields
.field private deviceId:Ljava/lang/String;

.field private kvStore:Lcom/helpshift/common/platform/KVStore;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v0

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getKVStore()Lcom/helpshift/common/platform/KVStore;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/storage/SupportDowngradeMigrator;->kvStore:Lcom/helpshift/common/platform/KVStore;

    return-void
.end method


# virtual methods
.method public backup(Lcom/helpshift/util/VersionName;)V
    .locals 1

    .line 20
    iget-object p1, p0, Lcom/helpshift/support/storage/SupportDowngradeMigrator;->kvStore:Lcom/helpshift/common/platform/KVStore;

    const-string v0, "key_support_device_id"

    invoke-interface {p1, v0}, Lcom/helpshift/common/platform/KVStore;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/storage/SupportDowngradeMigrator;->deviceId:Ljava/lang/String;

    return-void
.end method

.method public restore()V
    .locals 3

    .line 25
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportDowngradeMigrator;->deviceId:Ljava/lang/String;

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 26
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportDowngradeMigrator;->kvStore:Lcom/helpshift/common/platform/KVStore;

    iget-object v1, p0, Lcom/helpshift/support/storage/SupportDowngradeMigrator;->deviceId:Ljava/lang/String;

    const-string v2, "key_support_device_id"

    invoke-interface {v0, v2, v1}, Lcom/helpshift/common/platform/KVStore;->setString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
