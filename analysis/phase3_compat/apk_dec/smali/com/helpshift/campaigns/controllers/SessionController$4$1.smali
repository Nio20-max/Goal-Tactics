.class Lcom/helpshift/campaigns/controllers/SessionController$4$1;
.super Ljava/lang/Object;
.source "SessionController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/SessionController$4;->onResponse(Lorg/json/JSONArray;Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/helpshift/campaigns/controllers/SessionController$4;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/SessionController$4;)V
    .locals 0

    .line 219
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/SessionController$4$1;->this$1:Lcom/helpshift/campaigns/controllers/SessionController$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 222
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController$4$1;->this$1:Lcom/helpshift/campaigns/controllers/SessionController$4;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/SessionController$4;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/SessionController;->storage:Lcom/helpshift/campaigns/storage/SessionStorage;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/SessionController$4$1;->this$1:Lcom/helpshift/campaigns/controllers/SessionController$4;

    iget-object v1, v1, Lcom/helpshift/campaigns/controllers/SessionController$4;->val$sessions:[Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/helpshift/campaigns/storage/SessionStorage;->removeSessions([Ljava/lang/String;)V

    .line 223
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/SessionController$4$1;->this$1:Lcom/helpshift/campaigns/controllers/SessionController$4;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/SessionController$4;->val$controller:Lcom/helpshift/campaigns/controllers/SessionController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/SessionController;->syncController:Lcom/helpshift/controllers/SyncController;

    const-string v1, "data_type_session"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/controllers/SyncController;->dataSynced(Ljava/lang/String;Z)V

    return-void
.end method
