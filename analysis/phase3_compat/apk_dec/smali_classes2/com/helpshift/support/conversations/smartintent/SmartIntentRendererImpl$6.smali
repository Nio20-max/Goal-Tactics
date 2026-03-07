.class Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$6;
.super Ljava/lang/Object;
.source "SmartIntentRendererImpl.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->registerViewListeners()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)V
    .locals 0

    .line 254
    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$6;->this$0:Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 257
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$6;->this$0:Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;

    invoke-static {p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->access$000(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;

    move-result-object p1

    invoke-interface {p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;->onSmartIntentSendButtonClick()V

    return-void
.end method
