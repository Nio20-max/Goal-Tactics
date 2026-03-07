.class Lcom/helpshift/campaigns/models/DeviceModel$6;
.super Ljava/lang/Object;
.source "DeviceModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/models/DeviceModel;->setSyncStatus(Ljava/lang/Integer;Ljava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/models/DeviceModel;

.field final synthetic val$keys:Ljava/util/ArrayList;

.field final synthetic val$model:Lcom/helpshift/campaigns/models/DeviceModel;

.field final synthetic val$syncStatus:Ljava/lang/Integer;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/models/DeviceModel;Lcom/helpshift/campaigns/models/DeviceModel;Ljava/lang/Integer;Ljava/util/ArrayList;)V
    .locals 0

    .line 270
    iput-object p1, p0, Lcom/helpshift/campaigns/models/DeviceModel$6;->this$0:Lcom/helpshift/campaigns/models/DeviceModel;

    iput-object p2, p0, Lcom/helpshift/campaigns/models/DeviceModel$6;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    iput-object p3, p0, Lcom/helpshift/campaigns/models/DeviceModel$6;->val$syncStatus:Ljava/lang/Integer;

    iput-object p4, p0, Lcom/helpshift/campaigns/models/DeviceModel$6;->val$keys:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 273
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel$6;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

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

    .line 274
    iget-object v2, p0, Lcom/helpshift/campaigns/models/DeviceModel$6;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-static {v2}, Lcom/helpshift/campaigns/models/DeviceModel;->access$000(Lcom/helpshift/campaigns/models/DeviceModel;)Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/models/PropertyValue;

    if-eqz v1, :cond_0

    .line 276
    iget-object v2, p0, Lcom/helpshift/campaigns/models/DeviceModel$6;->val$syncStatus:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Lcom/helpshift/campaigns/models/PropertyValue;->setIsSynced(Ljava/lang/Integer;)V

    goto :goto_0

    .line 279
    :cond_1
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel$6;->this$0:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v0, v0, Lcom/helpshift/campaigns/models/DeviceModel;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    iget-object v1, p0, Lcom/helpshift/campaigns/models/DeviceModel$6;->val$syncStatus:Ljava/lang/Integer;

    iget-object v2, p0, Lcom/helpshift/campaigns/models/DeviceModel$6;->val$keys:Ljava/util/ArrayList;

    .line 280
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    iget-object v3, p0, Lcom/helpshift/campaigns/models/DeviceModel$6;->this$0:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v3, v3, Lcom/helpshift/campaigns/models/DeviceModel;->identifier:Ljava/lang/String;

    .line 279
    invoke-interface {v0, v1, v2, v3}, Lcom/helpshift/campaigns/storage/PropertyStorage;->setSecondaryPropertySyncStatus(Ljava/lang/Integer;[Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
