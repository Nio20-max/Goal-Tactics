.class Lcom/helpshift/campaigns/Campaigns$6;
.super Ljava/lang/Object;
.source "Campaigns.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/Campaigns;->_setTheme(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/Campaigns;

.field final synthetic val$themeResourceId:I


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/Campaigns;I)V
    .locals 0

    .line 603
    iput-object p1, p0, Lcom/helpshift/campaigns/Campaigns$6;->this$0:Lcom/helpshift/campaigns/Campaigns;

    iput p2, p0, Lcom/helpshift/campaigns/Campaigns$6;->val$themeResourceId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 606
    invoke-static {}, Lcom/helpshift/model/InfoModelFactory;->getInstance()Lcom/helpshift/model/InfoModelFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/model/InfoModelFactory;->sdkInfoModel:Lcom/helpshift/model/SdkInfoModel;

    iget v1, p0, Lcom/helpshift/campaigns/Campaigns$6;->val$themeResourceId:I

    invoke-virtual {v0, v1}, Lcom/helpshift/model/SdkInfoModel;->setTheme(I)V

    return-void
.end method
