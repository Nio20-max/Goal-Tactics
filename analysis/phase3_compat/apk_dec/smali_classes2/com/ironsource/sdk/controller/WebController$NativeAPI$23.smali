.class Lcom/ironsource/sdk/controller/WebController$NativeAPI$23;
.super Ljava/lang/Object;
.source "WebController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ironsource/sdk/controller/WebController$NativeAPI;->onGenericFunctionSuccess(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/ironsource/sdk/controller/WebController$NativeAPI;


# direct methods
.method constructor <init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;)V
    .locals 0

    .line 1996
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI$23;->this$1:Lcom/ironsource/sdk/controller/WebController$NativeAPI;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1998
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI$23;->this$1:Lcom/ironsource/sdk/controller/WebController$NativeAPI;

    iget-object v0, v0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$4800(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/listeners/OnGenericFunctionListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/ironsource/sdk/listeners/OnGenericFunctionListener;->onGFSuccess()V

    return-void
.end method
