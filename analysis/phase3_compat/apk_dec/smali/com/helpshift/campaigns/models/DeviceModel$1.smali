.class Lcom/helpshift/campaigns/models/DeviceModel$1;
.super Ljava/lang/Object;
.source "DeviceModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/models/DeviceModel;->getPropertyValue(Ljava/lang/String;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/models/DeviceModel;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$propertyValue:[Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/models/DeviceModel;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/helpshift/campaigns/models/DeviceModel$1;->this$0:Lcom/helpshift/campaigns/models/DeviceModel;

    iput-object p2, p0, Lcom/helpshift/campaigns/models/DeviceModel$1;->val$key:Ljava/lang/String;

    iput-object p3, p0, Lcom/helpshift/campaigns/models/DeviceModel$1;->val$propertyValue:[Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 116
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel$1;->this$0:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v0, v0, Lcom/helpshift/campaigns/models/DeviceModel;->storage:Lcom/helpshift/campaigns/storage/PropertyStorage;

    iget-object v1, p0, Lcom/helpshift/campaigns/models/DeviceModel$1;->val$key:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/campaigns/models/DeviceModel$1;->this$0:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v2, v2, Lcom/helpshift/campaigns/models/DeviceModel;->identifier:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/helpshift/campaigns/storage/PropertyStorage;->getSecondaryProperty(Ljava/lang/String;Ljava/lang/String;)Lcom/helpshift/campaigns/models/PropertyValue;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 118
    iget-object v1, p0, Lcom/helpshift/campaigns/models/DeviceModel$1;->val$propertyValue:[Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {v0}, Lcom/helpshift/campaigns/models/PropertyValue;->getValue()Ljava/lang/Object;

    move-result-object v0

    aput-object v0, v1, v2

    :cond_0
    return-void
.end method
