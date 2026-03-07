.class Lcom/ironsource/sdk/controller/ControllerManager$1;
.super Ljava/lang/Object;
.source "ControllerManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ironsource/sdk/controller/ControllerManager;->createController(Landroid/app/Activity;Lcom/ironsource/sdk/service/TokenService;Lcom/ironsource/sdk/controller/DemandSourceManager;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ironsource/sdk/controller/ControllerManager;

.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$demandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

.field final synthetic val$tokenService:Lcom/ironsource/sdk/service/TokenService;


# direct methods
.method constructor <init>(Lcom/ironsource/sdk/controller/ControllerManager;Landroid/app/Activity;Lcom/ironsource/sdk/service/TokenService;Lcom/ironsource/sdk/controller/DemandSourceManager;)V
    .locals 0

    .line 65
    iput-object p1, p0, Lcom/ironsource/sdk/controller/ControllerManager$1;->this$0:Lcom/ironsource/sdk/controller/ControllerManager;

    iput-object p2, p0, Lcom/ironsource/sdk/controller/ControllerManager$1;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/ironsource/sdk/controller/ControllerManager$1;->val$tokenService:Lcom/ironsource/sdk/service/TokenService;

    iput-object p4, p0, Lcom/ironsource/sdk/controller/ControllerManager$1;->val$demandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 69
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ControllerManager$1;->this$0:Lcom/ironsource/sdk/controller/ControllerManager;

    iget-object v1, p0, Lcom/ironsource/sdk/controller/ControllerManager$1;->val$activity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/ironsource/sdk/controller/ControllerManager$1;->val$tokenService:Lcom/ironsource/sdk/service/TokenService;

    iget-object v3, p0, Lcom/ironsource/sdk/controller/ControllerManager$1;->val$demandSourceManager:Lcom/ironsource/sdk/controller/DemandSourceManager;

    invoke-static {v0, v1, v2, v3}, Lcom/ironsource/sdk/controller/ControllerManager;->access$000(Lcom/ironsource/sdk/controller/ControllerManager;Landroid/app/Activity;Lcom/ironsource/sdk/service/TokenService;Lcom/ironsource/sdk/controller/DemandSourceManager;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 71
    iget-object v1, p0, Lcom/ironsource/sdk/controller/ControllerManager$1;->this$0:Lcom/ironsource/sdk/controller/ControllerManager;

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/ironsource/sdk/controller/ControllerManager;->access$100(Lcom/ironsource/sdk/controller/ControllerManager;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
