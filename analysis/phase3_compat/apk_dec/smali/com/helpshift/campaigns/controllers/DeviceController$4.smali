.class Lcom/helpshift/campaigns/controllers/DeviceController$4;
.super Ljava/lang/Object;
.source "DeviceController.java"

# interfaces
.implements Lcom/helpshift/network/response/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/DeviceController;->getRequestWithFullData()Lcom/helpshift/network/request/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/DeviceController;

.field final synthetic val$deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

.field final synthetic val$syncedAndUnSyncedPropertyKeys:Ljava/util/ArrayList;

.field final synthetic val$unSyncedPropertyKeys:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/DeviceController;Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/helpshift/campaigns/controllers/DeviceController;)V
    .locals 0

    .line 136
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/DeviceController$4;->this$0:Lcom/helpshift/campaigns/controllers/DeviceController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/DeviceController$4;->val$syncedAndUnSyncedPropertyKeys:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/DeviceController$4;->val$unSyncedPropertyKeys:Ljava/util/ArrayList;

    iput-object p4, p0, Lcom/helpshift/campaigns/controllers/DeviceController$4;->val$deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/helpshift/network/errors/NetworkError;Ljava/lang/Integer;)V
    .locals 2

    .line 141
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/DeviceController$4;->val$syncedAndUnSyncedPropertyKeys:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController$4;->val$unSyncedPropertyKeys:Ljava/util/ArrayList;

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 142
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/DeviceController$4;->val$deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    iget-object p2, p2, Lcom/helpshift/campaigns/controllers/DeviceController;->deviceModel:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController$4;->val$syncedAndUnSyncedPropertyKeys:Ljava/util/ArrayList;

    invoke-virtual {p2, v0}, Lcom/helpshift/campaigns/models/DeviceModel;->checkAndMarkPropertiesAsSynced(Ljava/util/List;)V

    .line 143
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/DeviceController$4;->this$0:Lcom/helpshift/campaigns/controllers/DeviceController;

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController$4;->val$deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/DeviceController$4;->val$unSyncedPropertyKeys:Ljava/util/ArrayList;

    invoke-virtual {p2, v0, v1, p1}, Lcom/helpshift/campaigns/controllers/DeviceController;->handlePropertySyncFailure(Lcom/helpshift/campaigns/controllers/DeviceController;Ljava/util/ArrayList;Lcom/helpshift/network/errors/NetworkError;)V

    return-void
.end method
