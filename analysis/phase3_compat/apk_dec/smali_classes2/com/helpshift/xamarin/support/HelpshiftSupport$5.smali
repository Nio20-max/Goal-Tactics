.class final Lcom/helpshift/xamarin/support/HelpshiftSupport$5;
.super Landroid/os/Handler;
.source "HelpshiftSupport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/xamarin/support/HelpshiftSupport;->getRequestUnreadMessagesCountHandler()Landroid/os/Handler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 339
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 342
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    if-nez p1, :cond_0

    return-void

    .line 346
    :cond_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/os/Bundle;

    if-nez p1, :cond_1

    return-void

    :cond_1
    const-string v0, "value"

    .line 350
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    .line 351
    invoke-static {}, Lcom/helpshift/xamarin/support/HelpshiftSupport;->access$000()Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 352
    invoke-static {}, Lcom/helpshift/xamarin/support/HelpshiftSupport;->access$000()Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->didReceiveUnreadMessagesCount(I)V

    :cond_2
    return-void
.end method
