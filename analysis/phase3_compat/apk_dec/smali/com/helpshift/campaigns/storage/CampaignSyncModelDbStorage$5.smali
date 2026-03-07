.class Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$5;
.super Ljava/lang/Object;
.source "CampaignSyncModelDbStorage.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->cleanUpSyncingModels(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;

.field final synthetic val$userIdentifier:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;Ljava/lang/String;)V
    .locals 0

    .line 159
    iput-object p1, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$5;->this$0:Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;

    iput-object p2, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$5;->val$userIdentifier:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 162
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$5;->this$0:Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;

    iget-object v0, v0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "kCampaignSyncModels"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$5;->val$userIdentifier:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 163
    invoke-interface {v0, v1}, Lcom/helpshift/storage/KeyValueStorage;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashMap;

    .line 164
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    if-eqz v0, :cond_1

    .line 166
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 167
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/helpshift/campaigns/models/CampaignSyncModel;

    .line 168
    invoke-virtual {v5}, Lcom/helpshift/campaigns/models/CampaignSyncModel;->isSyncing()Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v6, 0x0

    .line 169
    invoke-virtual {v5, v6}, Lcom/helpshift/campaigns/models/CampaignSyncModel;->setIsSyncing(Z)V

    .line 171
    :cond_0
    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 174
    :cond_1
    iget-object v0, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$5;->this$0:Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;

    iget-object v0, v0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage;->storage:Lcom/helpshift/storage/KeyValueStorage;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/helpshift/campaigns/storage/CampaignSyncModelDbStorage$5;->val$userIdentifier:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Lcom/helpshift/storage/KeyValueStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    return-void
.end method
