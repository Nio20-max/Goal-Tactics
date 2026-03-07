.class Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$3;
.super Ljava/lang/Object;
.source "CampaignSyncModelDbStorage.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->markCampaignAsSyncing(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;

.field final synthetic val$campaignId:Ljava/lang/String;

.field final synthetic val$userIdentifier:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 80
    iput-object p1, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$3;->this$0:Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;

    iput-object p2, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$3;->val$userIdentifier:Ljava/lang/String;

    iput-object p3, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$3;->val$campaignId:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 83
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$3;->this$0:Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;

    iget-object v0, v0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "kCampaignSyncModels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$3;->val$userIdentifier:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 84
    invoke-interface {v0, v1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    if-eqz v0, :cond_1

    .line 86
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$3;->val$campaignId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/campaigns/models/CampaignSyncModel;

    if-eqz v1, :cond_0

    const/4 v3, 0x1

    .line 88
    invoke-virtual {v1, v3}, Lcom/helpshift/campaigns/models/CampaignSyncModel;->setIsSyncing(Z)V

    .line 90
    :cond_0
    iget-object v3, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$3;->val$campaignId:Ljava/lang/String;

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    iget-object v1, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$3;->this$0:Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;

    iget-object v1, v1, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$3;->val$userIdentifier:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lcom/helpshift/storage/KeyValueStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    :cond_1
    return-void
.end method
