.class Lcom/helpshift/campaigns/controllers/UserController$4;
.super Ljava/lang/Object;
.source "UserController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/UserController;->addProperties(Ljava/util/HashMap;)[Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/UserController;

.field final synthetic val$acceptableProperties:Ljava/util/HashMap;

.field final synthetic val$controller:Lcom/helpshift/campaigns/controllers/UserController;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/UserController;Ljava/util/HashMap;Lcom/helpshift/campaigns/controllers/UserController;)V
    .locals 0

    .line 272
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/UserController$4;->this$0:Lcom/helpshift/campaigns/controllers/UserController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController$4;->val$acceptableProperties:Ljava/util/HashMap;

    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/UserController$4;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 275
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$4;->val$acceptableProperties:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 276
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$4;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$4;->val$acceptableProperties:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Lcom/helpshift/campaigns/controllers/UserController;->getSizeOfPropertiesMap(Ljava/util/Map;)Ljava/lang/Integer;

    move-result-object v0

    .line 277
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$4;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/controllers/UserController;->getSizeOfUserProperties()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v1, v0

    const v0, 0x19000

    const-string v2, "Helpshift_UserControl"

    if-gt v1, v0, :cond_0

    .line 278
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Add properties : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$4;->val$acceptableProperties:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$4;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$4;->val$acceptableProperties:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Lcom/helpshift/campaigns/models/UserModel;->addProperties(Ljava/util/HashMap;)Ljava/util/ArrayList;

    move-result-object v0

    .line 280
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 281
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$4;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v1, v1, Lcom/helpshift/campaigns/controllers/UserController;->syncController:Lcom/helpshift/controllers/SyncController;

    const-string v2, "data_type_user"

    invoke-virtual {v1, v2, v0}, Lcom/helpshift/controllers/SyncController;->incrementDataChangeCount(Ljava/lang/String;I)V

    goto :goto_0

    :cond_0
    const-string v0, "Properties size exceeds the maximum allowed size"

    .line 284
    invoke-static {v2, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method
