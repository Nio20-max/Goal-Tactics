.class Lcom/helpshift/campaigns/models/DeviceModel$3;
.super Ljava/lang/Object;
.source "DeviceModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/models/DeviceModel;->getUnsyncedProperties()Ljava/util/HashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/models/DeviceModel;

.field final synthetic val$model:Lcom/helpshift/campaigns/models/DeviceModel;

.field final synthetic val$properties:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/models/DeviceModel;Lcom/helpshift/campaigns/models/DeviceModel;Ljava/util/HashMap;)V
    .locals 0

    .line 171
    iput-object p1, p0, Lcom/helpshift/campaigns/models/DeviceModel$3;->this$0:Lcom/helpshift/campaigns/models/DeviceModel;

    iput-object p2, p0, Lcom/helpshift/campaigns/models/DeviceModel$3;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    iput-object p3, p0, Lcom/helpshift/campaigns/models/DeviceModel$3;->val$properties:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 174
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel$3;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-static {v0}, Lcom/helpshift/campaigns/models/DeviceModel;->access$000(Lcom/helpshift/campaigns/models/DeviceModel;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 175
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel$3;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-static {v0}, Lcom/helpshift/campaigns/models/DeviceModel;->access$000(Lcom/helpshift/campaigns/models/DeviceModel;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 176
    iget-object v2, p0, Lcom/helpshift/campaigns/models/DeviceModel$3;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-static {v2}, Lcom/helpshift/campaigns/models/DeviceModel;->access$000(Lcom/helpshift/campaigns/models/DeviceModel;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/campaigns/models/PropertyValue;

    if-eqz v2, :cond_0

    .line 177
    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/PropertyValue;->getIsSynced()Ljava/lang/Integer;

    move-result-object v3

    sget-object v4, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    invoke-virtual {v3, v4}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 178
    iget-object v3, p0, Lcom/helpshift/campaigns/models/DeviceModel$3;->val$properties:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/helpshift/campaigns/models/PropertyValue;->getValueInfo()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method
