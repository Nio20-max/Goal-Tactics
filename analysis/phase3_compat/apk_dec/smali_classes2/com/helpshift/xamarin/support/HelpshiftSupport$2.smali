.class final Lcom/helpshift/xamarin/support/HelpshiftSupport$2;
.super Ljava/lang/Object;
.source "HelpshiftSupport.java"

# interfaces
.implements Lcom/helpshift/support/AlertToRateAppListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/xamarin/support/HelpshiftSupport;->showAlertToRateApp(Ljava/lang/String;Lcom/helpshift/xamarin/listeners/HelpshiftAlertToRateAppListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$alertToRateAppListener:Lcom/helpshift/xamarin/listeners/HelpshiftAlertToRateAppListener;


# direct methods
.method constructor <init>(Lcom/helpshift/xamarin/listeners/HelpshiftAlertToRateAppListener;)V
    .locals 0

    .line 164
    iput-object p1, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$2;->val$alertToRateAppListener:Lcom/helpshift/xamarin/listeners/HelpshiftAlertToRateAppListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAction(I)V
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$2;->val$alertToRateAppListener:Lcom/helpshift/xamarin/listeners/HelpshiftAlertToRateAppListener;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/listeners/HelpshiftAlertToRateAppListener;->onAction(I)V

    return-void
.end method
