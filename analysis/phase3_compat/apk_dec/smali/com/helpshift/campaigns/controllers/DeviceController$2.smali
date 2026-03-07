.class Lcom/helpshift/campaigns/controllers/DeviceController$2;
.super Ljava/lang/Object;
.source "DeviceController.java"

# interfaces
.implements Lcom/helpshift/network/response/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/DeviceController;->getRequest()Lcom/helpshift/network/request/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/DeviceController;

.field final synthetic val$deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

.field final synthetic val$unSyncedList:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/DeviceController;Lcom/helpshift/campaigns/controllers/DeviceController;Ljava/util/ArrayList;)V
    .locals 0

    .line 107
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/DeviceController$2;->this$0:Lcom/helpshift/campaigns/controllers/DeviceController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/DeviceController$2;->val$deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/DeviceController$2;->val$unSyncedList:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/helpshift/network/errors/NetworkError;Ljava/lang/Integer;)V
    .locals 2

    .line 110
    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/DeviceController$2;->this$0:Lcom/helpshift/campaigns/controllers/DeviceController;

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController$2;->val$deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/DeviceController$2;->val$unSyncedList:Ljava/util/ArrayList;

    invoke-virtual {p2, v0, v1, p1}, Lcom/helpshift/campaigns/controllers/DeviceController;->handlePropertySyncFailure(Lcom/helpshift/campaigns/controllers/DeviceController;Ljava/util/ArrayList;Lcom/helpshift/network/errors/NetworkError;)V

    return-void
.end method
