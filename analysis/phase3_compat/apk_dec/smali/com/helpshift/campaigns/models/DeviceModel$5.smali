.class Lcom/helpshift/campaigns/models/DeviceModel$5;
.super Ljava/lang/Object;
.source "DeviceModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/models/DeviceModel;->checkAndMarkPropertiesAsSynced(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/models/DeviceModel;

.field final synthetic val$model:Lcom/helpshift/campaigns/models/DeviceModel;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/models/DeviceModel;Lcom/helpshift/campaigns/models/DeviceModel;)V
    .locals 0

    .line 236
    iput-object p1, p0, Lcom/helpshift/campaigns/models/DeviceModel$5;->this$0:Lcom/helpshift/campaigns/models/DeviceModel;

    iput-object p2, p0, Lcom/helpshift/campaigns/models/DeviceModel$5;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 239
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 240
    iget-object v1, p0, Lcom/helpshift/campaigns/models/DeviceModel$5;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-static {v1}, Lcom/helpshift/campaigns/models/DeviceModel;->access$000(Lcom/helpshift/campaigns/models/DeviceModel;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 241
    iget-object v3, p0, Lcom/helpshift/campaigns/models/DeviceModel$5;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-static {v3}, Lcom/helpshift/campaigns/models/DeviceModel;->access$000(Lcom/helpshift/campaigns/models/DeviceModel;)Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/helpshift/campaigns/models/PropertyValue;

    if-eqz v3, :cond_0

    .line 243
    invoke-virtual {v3}, Lcom/helpshift/campaigns/models/PropertyValue;->getIsSynced()Ljava/lang/Integer;

    move-result-object v4

    sget-object v5, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCING:Ljava/lang/Integer;

    invoke-virtual {v4, v5}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 244
    sget-object v4, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCED:Ljava/lang/Integer;

    invoke-virtual {v3, v4}, Lcom/helpshift/campaigns/models/PropertyValue;->setIsSynced(Ljava/lang/Integer;)V

    .line 245
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 247
    :cond_1
    iget-object v3, p0, Lcom/helpshift/campaigns/models/DeviceModel$5;->this$0:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-virtual {v3, v2}, Lcom/helpshift/campaigns/models/DeviceModel;->shouldDevicePropertySyncImmediately(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 248
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v2

    iget-object v2, v2, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/helpshift/model/SdkInfoModel;->setDevicePropertiesSyncImmediately(Ljava/lang/Boolean;)V

    goto :goto_0

    .line 252
    :cond_2
    iget-object v1, p0, Lcom/helpshift/campaigns/models/DeviceModel$5;->this$0:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v1, v1, Lcom/helpshift/campaigns/models/DeviceModel;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    sget-object v2, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCED:Ljava/lang/Integer;

    .line 253
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    iget-object v3, p0, Lcom/helpshift/campaigns/models/DeviceModel$5;->this$0:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v3, v3, Lcom/helpshift/campaigns/models/DeviceModel;->identifier:Ljava/lang/String;

    .line 252
    invoke-interface {v1, v2, v0, v3}, Lcom/helpshift/campaigns/storage/PropertyStorage;->setSecondaryPropertySyncStatus(Ljava/lang/Integer;[Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
