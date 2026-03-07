.class Lcom/helpshift/campaigns/controllers/DeviceController$1;
.super Ljava/lang/Object;
.source "DeviceController.java"

# interfaces
.implements Lcom/helpshift/network/response/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/DeviceController;->getRequest()Lcom/helpshift/network/request/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/helpshift/network/response/Response$Listener<",
        "Lorg/json/JSONArray;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/DeviceController;

.field final synthetic val$deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

.field final synthetic val$uid:Ljava/lang/String;

.field final synthetic val$unSyncedList:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/DeviceController;Lcom/helpshift/campaigns/controllers/DeviceController;Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 0

    .line 100
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/DeviceController$1;->this$0:Lcom/helpshift/campaigns/controllers/DeviceController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/DeviceController$1;->val$deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/DeviceController$1;->val$unSyncedList:Ljava/util/ArrayList;

    iput-object p4, p0, Lcom/helpshift/campaigns/controllers/DeviceController$1;->val$uid:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;Ljava/lang/Integer;)V
    .locals 0

    .line 100
    check-cast p1, Lorg/json/JSONArray;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/campaigns/controllers/DeviceController$1;->onResponse(Lorg/json/JSONArray;Ljava/lang/Integer;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONArray;Ljava/lang/Integer;)V
    .locals 3

    .line 103
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/DeviceController$1;->this$0:Lcom/helpshift/campaigns/controllers/DeviceController;

    iget-object p2, p0, Lcom/helpshift/campaigns/controllers/DeviceController$1;->val$deviceController:Lcom/helpshift/campaigns/controllers/DeviceController;

    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/DeviceController$1;->val$unSyncedList:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/DeviceController$1;->val$uid:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v0, v1, v2}, Lcom/helpshift/campaigns/controllers/DeviceController;->handlePropertySyncSuccess(Lcom/helpshift/campaigns/controllers/DeviceController;Ljava/util/ArrayList;Ljava/lang/String;Z)V

    return-void
.end method
