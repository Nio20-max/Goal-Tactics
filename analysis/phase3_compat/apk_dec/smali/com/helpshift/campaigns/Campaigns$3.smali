.class final Lcom/helpshift/campaigns/Campaigns$3;
.super Ljava/lang/Object;
.source "Campaigns.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/Campaigns;->setInboxMessageDelegate(Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$inboxMessageDelegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;)V
    .locals 0

    .line 303
    iput-object p1, p0, Lcom/helpshift/campaigns/Campaigns$3;->val$inboxMessageDelegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 306
    iget-object v0, p0, Lcom/helpshift/campaigns/Campaigns$3;->val$inboxMessageDelegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    sput-object v0, Lcom/helpshift/campaigns/Campaigns;->delegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    .line 307
    iget-object v0, p0, Lcom/helpshift/campaigns/Campaigns$3;->val$inboxMessageDelegate:Lcom/helpshift/campaigns/delegates/InboxMessageDelegate;

    if-eqz v0, :cond_0

    .line 308
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    .line 309
    invoke-static {}, Lcom/helpshift/campaigns/Campaigns;->getInstance()Lcom/helpshift/campaigns/Campaigns;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/helpshift/campaigns/storage/CampaignStorage;->addObserver(Lcom/helpshift/campaigns/observers/CampaignStorageObserver;)V

    goto :goto_0

    .line 312
    :cond_0
    invoke-static {}, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->getInstance()Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/storage/CampaignsStorageFactory;->campaignStorage:Lcom/helpshift/campaigns/storage/CampaignStorage;

    .line 313
    invoke-static {}, Lcom/helpshift/campaigns/Campaigns;->getInstance()Lcom/helpshift/campaigns/Campaigns;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/helpshift/campaigns/storage/CampaignStorage;->removeObserver(Lcom/helpshift/campaigns/observers/CampaignStorageObserver;)V

    :goto_0
    return-void
.end method
