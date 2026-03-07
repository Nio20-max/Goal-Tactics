.class final Lcom/helpshift/campaigns/Campaigns$4;
.super Ljava/lang/Object;
.source "Campaigns.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/Campaigns;->setDelegate(Lcom/helpshift/campaigns/Campaigns$Delegate;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$delegate:Lcom/helpshift/campaigns/Campaigns$Delegate;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/Campaigns$Delegate;)V
    .locals 0

    .line 329
    iput-object p1, p0, Lcom/helpshift/campaigns/Campaigns$4;->val$delegate:Lcom/helpshift/campaigns/Campaigns$Delegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 332
    iget-object v0, p0, Lcom/helpshift/campaigns/Campaigns$4;->val$delegate:Lcom/helpshift/campaigns/Campaigns$Delegate;

    invoke-static {v0}, Lcom/helpshift/campaigns/delegates/CampaignsDelegateRouter;->setDelegate(Lcom/helpshift/campaigns/Campaigns$Delegate;)V

    return-void
.end method
