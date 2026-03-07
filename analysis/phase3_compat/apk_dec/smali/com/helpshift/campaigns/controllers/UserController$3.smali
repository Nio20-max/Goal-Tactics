.class Lcom/helpshift/campaigns/controllers/UserController$3;
.super Ljava/lang/Object;
.source "UserController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/UserController;->addProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/UserController;

.field final synthetic val$controller:Lcom/helpshift/campaigns/controllers/UserController;

.field final synthetic val$isValidKey:Z

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$value:Lcom/helpshift/campaigns/models/PropertyValue;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/UserController;ZLjava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;Lcom/helpshift/campaigns/controllers/UserController;)V
    .locals 0

    .line 233
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->this$0:Lcom/helpshift/campaigns/controllers/UserController;

    iput-boolean p2, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$isValidKey:Z

    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$key:Ljava/lang/String;

    iput-object p4, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$value:Lcom/helpshift/campaigns/models/PropertyValue;

    iput-object p5, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 236
    iget-boolean v0, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$isValidKey:Z

    if-eqz v0, :cond_1

    .line 237
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 238
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$key:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$value:Lcom/helpshift/campaigns/models/PropertyValue;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v1, v0}, Lcom/helpshift/campaigns/controllers/UserController;->getSizeOfPropertiesMap(Ljava/util/Map;)Ljava/lang/Integer;

    move-result-object v0

    .line 240
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

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

    .line 241
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Add property : Key "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", Value : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$value:Lcom/helpshift/campaigns/models/PropertyValue;

    invoke-virtual {v1}, Lcom/helpshift/campaigns/models/PropertyValue;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/controllers/UserController;->getCurrentUser()Lcom/helpshift/campaigns/models/UserModel;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$key:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$value:Lcom/helpshift/campaigns/models/PropertyValue;

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/campaigns/models/UserModel;->addProperty(Ljava/lang/String;Lcom/helpshift/campaigns/models/PropertyValue;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 243
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/UserController;->syncController:Lcom/helpshift/controllers/SyncController;

    const/4 v1, 0x1

    const-string v2, "data_type_user"

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/controllers/SyncController;->incrementDataChangeCount(Ljava/lang/String;I)V

    goto :goto_0

    .line 247
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Property size exceeds the maximum allowed size : Key : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$3;->val$key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method
