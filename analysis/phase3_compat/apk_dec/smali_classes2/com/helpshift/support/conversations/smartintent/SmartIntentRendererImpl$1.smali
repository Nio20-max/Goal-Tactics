.class Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$1;
.super Lcom/helpshift/support/conversations/TextWatcherAdapter;
.source "SmartIntentRendererImpl.java"


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

    .line 208
    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$1;->this$0:Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;

    invoke-direct {p0}, Lcom/helpshift/support/conversations/TextWatcherAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    if-eqz p1, :cond_0

    .line 212
    iget-object p2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl$1;->this$0:Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;

    invoke-static {p2}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;->access$000(Lcom/helpshift/support/conversations/smartintent/SmartIntentRendererImpl;)Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentRouter;->onSmartIntentTextChanged(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
