.class Lcom/ironsource/mediationsdk/AuctionDataUtils$1;
.super Ljava/lang/Object;
.source "AuctionDataUtils.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ironsource/mediationsdk/AuctionDataUtils;->setBrowserUserAgent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ironsource/mediationsdk/AuctionDataUtils;

.field final synthetic val$activity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Lcom/ironsource/mediationsdk/AuctionDataUtils;Landroid/app/Activity;)V
    .locals 0

    .line 146
    iput-object p1, p0, Lcom/ironsource/mediationsdk/AuctionDataUtils$1;->this$0:Lcom/ironsource/mediationsdk/AuctionDataUtils;

    iput-object p2, p0, Lcom/ironsource/mediationsdk/AuctionDataUtils$1;->val$activity:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 152
    :try_start_0
    new-instance v0, Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/AuctionDataUtils$1;->val$activity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 156
    invoke-virtual {v0, v1, v2}, Landroid/webkit/WebView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 159
    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    .line 160
    iget-object v2, p0, Lcom/ironsource/mediationsdk/AuctionDataUtils$1;->this$0:Lcom/ironsource/mediationsdk/AuctionDataUtils;

    invoke-virtual {v1}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->access$502(Lcom/ironsource/mediationsdk/AuctionDataUtils;Ljava/lang/String;)Ljava/lang/String;

    .line 161
    sget-object v1, Lcom/ironsource/mediationsdk/logger/IronLog;->INTERNAL:Lcom/ironsource/mediationsdk/logger/IronLog;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mBrowserUserAgent = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/ironsource/mediationsdk/AuctionDataUtils$1;->this$0:Lcom/ironsource/mediationsdk/AuctionDataUtils;

    invoke-static {v3}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->access$500(Lcom/ironsource/mediationsdk/AuctionDataUtils;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/ironsource/mediationsdk/logger/IronLog;->verbose(Ljava/lang/String;)V

    .line 164
    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    .line 167
    iget-object v0, p0, Lcom/ironsource/mediationsdk/AuctionDataUtils$1;->val$activity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/ironsource/mediationsdk/AuctionDataUtils$1;->this$0:Lcom/ironsource/mediationsdk/AuctionDataUtils;

    invoke-static {v1}, Lcom/ironsource/mediationsdk/AuctionDataUtils;->access$500(Lcom/ironsource/mediationsdk/AuctionDataUtils;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/mediationsdk/utils/IronSourceUtils;->saveBrowserUserAgent(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
