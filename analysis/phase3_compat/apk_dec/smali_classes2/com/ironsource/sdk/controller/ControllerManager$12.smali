.class Lcom/ironsource/sdk/controller/ControllerManager$12;
.super Ljava/lang/Object;
.source "ControllerManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ironsource/sdk/controller/ControllerManager;->showInterstitial(Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ironsource/sdk/controller/ControllerManager;

.field final synthetic val$listener:Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;

.field final synthetic val$showParams:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lcom/ironsource/sdk/controller/ControllerManager;Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V
    .locals 0

    .line 297
    iput-object p1, p0, Lcom/ironsource/sdk/controller/ControllerManager$12;->this$0:Lcom/ironsource/sdk/controller/ControllerManager;

    iput-object p2, p0, Lcom/ironsource/sdk/controller/ControllerManager$12;->val$showParams:Lorg/json/JSONObject;

    iput-object p3, p0, Lcom/ironsource/sdk/controller/ControllerManager$12;->val$listener:Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 300
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager$12;->this$0:Lcom/ironsource/sdk/controller/ControllerManager;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/ControllerManager;->access$500(Lcom/ironsource/sdk/controller/ControllerManager;)Lcom/ironsource/sdk/controller/IronSourceController;

    move-result-object v0

    iget-object v1, p0, Lcom/ironsource/sdk/controller/ControllerManager$12;->val$showParams:Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/ironsource/sdk/controller/ControllerManager$12;->val$listener:Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;

    invoke-interface {v0, v1, v2}, Lcom/ironsource/sdk/controller/IronSourceController;->showInterstitial(Lorg/json/JSONObject;Lcom/ironsource/sdk/listeners/internals/DSInterstitialListener;)V

    return-void
.end method
