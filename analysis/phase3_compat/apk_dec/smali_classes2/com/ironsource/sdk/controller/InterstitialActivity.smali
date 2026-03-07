.class public Lcom/ironsource/sdk/controller/InterstitialActivity;
.super Lcom/ironsource/sdk/controller/ControllerActivity;
.source "InterstitialActivity.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "InterstitialActivity"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Lcom/ironsource/sdk/controller/ControllerActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 13
    invoke-super {p0, p1}, Lcom/ironsource/sdk/controller/ControllerActivity;->onCreate(Landroid/os/Bundle;)V

    .line 14
    sget-object p1, Lcom/ironsource/sdk/controller/InterstitialActivity;->TAG:Ljava/lang/String;

    const-string v0, "onCreate"

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onPause()V
    .locals 2

    .line 25
    invoke-super {p0}, Lcom/ironsource/sdk/controller/ControllerActivity;->onPause()V

    .line 26
    sget-object v0, Lcom/ironsource/sdk/controller/InterstitialActivity;->TAG:Ljava/lang/String;

    const-string v1, "onPause"

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onResume()V
    .locals 2

    .line 19
    invoke-super {p0}, Lcom/ironsource/sdk/controller/ControllerActivity;->onResume()V

    .line 20
    sget-object v0, Lcom/ironsource/sdk/controller/InterstitialActivity;->TAG:Ljava/lang/String;

    const-string v1, "onResume"

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
