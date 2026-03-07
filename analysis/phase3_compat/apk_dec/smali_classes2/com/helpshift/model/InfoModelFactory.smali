.class public Lcom/helpshift/model/InfoModelFactory;
.super Ljava/lang/Object;
.source "InfoModelFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/model/InfoModelFactory$LazyHolder;
    }
.end annotation


# instance fields
.field public final appInfoModel:Lcom/helpshift/model/AppInfoModel;

.field public final sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;


# direct methods
.method constructor <init>()V
    .locals 3

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-static {}, Lcom/helpshift/storage/StorageFactory;->getInstance()Lcom/helpshift/storage/StorageFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/storage/StorageFactory;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    .line 25
    new-instance v1, Lcom/helpshift/storage/CachedKeyValueStorage;

    .line 26
    invoke-direct {p0}, Lcom/helpshift/model/InfoModelFactory;->getCacheWhitelistKeys()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/helpshift/storage/CachedKeyValueStorage;-><init>(Lcom/helpshift/storage/KeyValueStorage;Ljava/util/Set;)V

    .line 28
    new-instance v0, Lcom/helpshift/model/AppInfoModel;

    invoke-direct {v0, v1}, Lcom/helpshift/model/AppInfoModel;-><init>(Lcom/helpshift/storage/KeyValueStorage;)V

    iput-object v0, p0, Lcom/helpshift/model/InfoModelFactory;->appInfoModel:Lcom/helpshift/model/AppInfoModel;

    .line 29
    new-instance v0, Lcom/helpshift/model/SdkInfoModel;

    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/helpshift/model/SdkInfoModel;-><init>(Lcom/helpshift/storage/KeyValueStorage;Lcom/helpshift/common/platform/Platform;)V

    iput-object v0, p0, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    return-void
.end method

.method private getCacheWhitelistKeys()Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 34
    new-instance v0, Ljava/util/HashSet;

    const-string v1, "sdk-language"

    const-string v2, "sdk-theme"

    const-string v3, "disableHelpshiftBranding"

    const-string v4, "screenOrientation"

    filled-new-array {v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public static getInstance()Lcom/helpshift/model/InfoModelFactory;
    .locals 1

    .line 43
    sget-object v0, Lcom/helpshift/model/InfoModelFactory$LazyHolder;->INSTANCE:Lcom/helpshift/model/InfoModelFactory;

    return-object v0
.end method
