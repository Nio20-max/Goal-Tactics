.class Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic$2;
.super Lorg/json/JSONObject;
.source "ISNAdViewLogic.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->buildParamsObjectForAdViewVisibility()Lorg/json/JSONObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;


# direct methods
.method constructor <init>(Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;,
            Ljava/lang/Error;
        }
    .end annotation

    .line 193
    iput-object p1, p0, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic$2;->this$0:Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;

    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v0, "configs"

    .line 196
    invoke-static {p1}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->access$500(Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {p1}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->access$600(Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;)Lcom/ironsource/sdk/ISNAdView/ViewVisibilityParameters;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ironsource/sdk/ISNAdView/ViewVisibilityParameters;->collectVisibilityParameters()Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;->access$700(Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic;Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/ironsource/sdk/ISNAdView/ISNAdViewLogic$2;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 198
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :goto_0
    return-void
.end method
