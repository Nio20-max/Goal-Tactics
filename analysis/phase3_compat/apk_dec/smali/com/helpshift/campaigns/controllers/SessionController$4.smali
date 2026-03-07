.class Lcom/helpshift/campaigns/controllers/SessionController$4;
.super Ljava/lang/Object;
.source "SessionController.java"

# interfaces
.implements Lcom/helpshift/network/response/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/SessionController;->getRequest()Lcom/helpshift/network/request/Request;
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
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/SessionController;

.field final synthetic val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

.field final synthetic val$sessions:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/SessionController;Lcom/helpshift/campaigns/controllers/SessionController;[Ljava/lang/String;)V
    .locals 0

    .line 216
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/SessionController$4;->this$0:Lcom/helpshift/campaigns/controllers/SessionController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/SessionController$4;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/SessionController$4;->val$sessions:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;Ljava/lang/Integer;)V
    .locals 0

    .line 216
    check-cast p1, Lorg/json/JSONArray;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/campaigns/controllers/SessionController$4;->onResponse(Lorg/json/JSONArray;Ljava/lang/Integer;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONArray;Ljava/lang/Integer;)V
    .locals 0

    .line 219
    iget-object p1, p0, Lcom/helpshift/campaigns/controllers/SessionController$4;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    iget-object p1, p1, Lcom/helpshift/campaigns/controllers/SessionController;->workerQueue:Lcom/helpshift/util/concurrent/DispatchQueue;

    new-instance p2, Lcom/helpshift/campaigns/controllers/SessionController$4$1;

    invoke-direct {p2, p0}, Lcom/helpshift/campaigns/controllers/SessionController$4$1;-><init>(Lcom/helpshift/campaigns/controllers/SessionController$4;)V

    invoke-virtual {p1, p2}, Lcom/helpshift/util/concurrent/DispatchQueue;->dispatchAsync(Ljava/lang/Runnable;)V

    return-void
.end method
