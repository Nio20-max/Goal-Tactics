.class Lcom/helpshift/campaigns/controllers/InboxSyncController$1;
.super Ljava/lang/Object;
.source "InboxSyncController.java"

# interfaces
.implements Lcom/helpshift/network/response/Response$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/InboxSyncController;->getRequest()Lcom/helpshift/network/request/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/helpshift/network/response/Response$Listener<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/InboxSyncController;

.field final synthetic val$uid:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/InboxSyncController;Ljava/lang/String;)V
    .locals 0

    .line 151
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController$1;->this$0:Lcom/helpshift/campaigns/controllers/InboxSyncController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController$1;->val$uid:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onResponse(Ljava/lang/Object;Ljava/lang/Integer;)V
    .locals 0

    .line 151
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/campaigns/controllers/InboxSyncController$1;->onResponse(Lorg/json/JSONObject;Ljava/lang/Integer;)V

    return-void
.end method

.method public onResponse(Lorg/json/JSONObject;Ljava/lang/Integer;)V
    .locals 6

    const-string p2, "cid"

    .line 154
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/helpshift/model/SdkInfoModel;->setOneCampaignFetchSuccessful(Ljava/lang/Boolean;)V

    const-string v0, "cursor"

    const-string v1, ""

    .line 155
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 156
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 157
    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController$1;->this$0:Lcom/helpshift/campaigns/controllers/InboxSyncController;

    iget-object v2, v2, Lcom/helpshift/campaigns/controllers/InboxSyncController;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "hs__campaigns_inbox_cursor"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController$1;->val$uid:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v0}, Lcom/helpshift/storage/KeyValueStorage;->set(Ljava/lang/String;Ljava/io/Serializable;)Z

    :cond_0
    const-string v0, "campaigns"

    .line 160
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    const/4 v0, 0x0

    .line 164
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 165
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 168
    :try_start_0
    invoke-virtual {v2, p2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 169
    invoke-static {v3}, Lcom/helpshift/campaigns/util/InAppCampaignsUtil;->getCampaignIdForLoggedInUser(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 173
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v5

    iget-object v5, v5, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    invoke-virtual {v5, v3, v4}, Lcom/helpshift/model/SdkInfoModel;->setChangeSetId(Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    invoke-virtual {v2, p2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 175
    new-instance v3, Lcom/helpshift/campaigns/models/CampaignSyncModel;

    invoke-direct {v3, v2}, Lcom/helpshift/campaigns/models/CampaignSyncModel;-><init>(Lorg/json/JSONObject;)V

    .line 176
    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController$1;->this$0:Lcom/helpshift/campaigns/controllers/InboxSyncController;

    iget-object v2, v2, Lcom/helpshift/campaigns/controllers/InboxSyncController;->syncModelStorage:Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;

    iget-object v4, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController$1;->val$uid:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Lcom/helpshift/campaigns/storage/CampaignSyncModelStorage;->addCampaign(Lcom/helpshift/campaigns/models/CampaignSyncModel;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const-string v2, "Helpshift_ISControl"

    const-string v3, "Error while parsing creative"

    .line 179
    invoke-static {v2, v3}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method
