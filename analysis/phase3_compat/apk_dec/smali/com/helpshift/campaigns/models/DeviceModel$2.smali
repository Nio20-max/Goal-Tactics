.class Lcom/helpshift/campaigns/models/DeviceModel$2;
.super Ljava/lang/Object;
.source "DeviceModel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/models/DeviceModel;->rescanDevice()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/models/DeviceModel;

.field final synthetic val$model:Lcom/helpshift/campaigns/models/DeviceModel;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/models/DeviceModel;Lcom/helpshift/campaigns/models/DeviceModel;)V
    .locals 0

    .line 130
    iput-object p1, p0, Lcom/helpshift/campaigns/models/DeviceModel$2;->this$0:Lcom/helpshift/campaigns/models/DeviceModel;

    iput-object p2, p0, Lcom/helpshift/campaigns/models/DeviceModel$2;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 133
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel$2;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v1, v0, Lcom/helpshift/campaigns/models/DeviceModel;->device:Lcom/helpshift/campaigns/models/Device;

    invoke-interface {v1}, Lcom/helpshift/campaigns/models/Device;->getOsVersion()Ljava/lang/String;

    move-result-object v1

    const-string v2, "os"

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/campaigns/models/DeviceModel;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 134
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel$2;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v1, v0, Lcom/helpshift/campaigns/models/DeviceModel;->device:Lcom/helpshift/campaigns/models/Device;

    invoke-interface {v1}, Lcom/helpshift/campaigns/models/Device;->getBuildModel()Ljava/lang/String;

    move-result-object v1

    const-string v2, "dm"

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/campaigns/models/DeviceModel;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 135
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel$2;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v1, v0, Lcom/helpshift/campaigns/models/DeviceModel;->device:Lcom/helpshift/campaigns/models/Device;

    invoke-interface {v1}, Lcom/helpshift/campaigns/models/Device;->getAppVersion()Ljava/lang/String;

    move-result-object v1

    const-string v2, "av"

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/campaigns/models/DeviceModel;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 136
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel$2;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v1, v0, Lcom/helpshift/campaigns/models/DeviceModel;->device:Lcom/helpshift/campaigns/models/Device;

    invoke-interface {v1}, Lcom/helpshift/campaigns/models/Device;->getLanguageCode()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ln"

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/campaigns/models/DeviceModel;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 137
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel$2;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v1, v0, Lcom/helpshift/campaigns/models/DeviceModel;->device:Lcom/helpshift/campaigns/models/Device;

    invoke-interface {v1}, Lcom/helpshift/campaigns/models/Device;->getCarrierName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ca"

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/campaigns/models/DeviceModel;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 138
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel$2;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v1, v0, Lcom/helpshift/campaigns/models/DeviceModel;->device:Lcom/helpshift/campaigns/models/Device;

    invoke-interface {v1}, Lcom/helpshift/campaigns/models/Device;->getTimeZone()Ljava/lang/Integer;

    move-result-object v1

    const-string/jumbo v2, "tz"

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/campaigns/models/DeviceModel;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 139
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel$2;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    const-string/jumbo v1, "sv"

    const-string v2, "7.11.1"

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/campaigns/models/DeviceModel;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    .line 140
    iget-object v0, p0, Lcom/helpshift/campaigns/models/DeviceModel$2;->val$model:Lcom/helpshift/campaigns/models/DeviceModel;

    iget-object v1, v0, Lcom/helpshift/campaigns/models/DeviceModel;->device:Lcom/helpshift/campaigns/models/Device;

    invoke-interface {v1}, Lcom/helpshift/campaigns/models/Device;->getCountryCode()Ljava/lang/String;

    move-result-object v1

    const-string v2, "cc"

    invoke-virtual {v0, v2, v1}, Lcom/helpshift/campaigns/models/DeviceModel;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
