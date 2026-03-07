.class public Lcom/ironsource/sdk/controller/WebController$NativeAPI;
.super Ljava/lang/Object;
.source "WebController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ironsource/sdk/controller/WebController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NativeAPI"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ironsource/sdk/controller/WebController$NativeAPI$JSCallbackTask;
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ironsource/sdk/controller/WebController;


# direct methods
.method public constructor <init>(Lcom/ironsource/sdk/controller/WebController;)V
    .locals 0

    .line 766
    iput-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private addSupportedNativeFeaturesToConfig(Lorg/json/JSONObject;)V
    .locals 3

    .line 899
    :try_start_0
    invoke-static {}, Lcom/ironsource/sdk/controller/FeaturesManager;->getInstance()Lcom/ironsource/sdk/controller/FeaturesManager;

    move-result-object v0

    .line 900
    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/FeaturesManager;->getSupportedFeatures()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    const-string v1, "nativeFeatures"

    .line 903
    new-instance v2, Lorg/json/JSONArray;

    .line 905
    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/FeaturesManager;->getSupportedFeatures()Ljava/util/ArrayList;

    move-result-object v0

    invoke-direct {v2, v0}, Lorg/json/JSONArray;-><init>(Ljava/util/Collection;)V

    .line 903
    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 908
    new-instance v0, Lcom/ironsource/sdk/Events/ISNEventParams;

    invoke-direct {v0}, Lcom/ironsource/sdk/Events/ISNEventParams;-><init>()V

    .line 909
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v1, "callfailreason"

    invoke-virtual {v0, v1, p1}, Lcom/ironsource/sdk/Events/ISNEventParams;->addPair(Ljava/lang/String;Ljava/lang/Object;)Lcom/ironsource/sdk/Events/ISNEventParams;

    move-result-object p1

    .line 910
    sget-object v0, Lcom/ironsource/sdk/Events/SDK5Events;->appendNativeFeaturesDataFailed:Lcom/ironsource/sdk/Events/SDK5Events$Event;

    invoke-virtual {p1}, Lcom/ironsource/sdk/Events/ISNEventParams;->getData()Ljava/util/HashMap;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ironsource/sdk/Events/ISNEventsTracker;->logEvent(Lcom/ironsource/sdk/Events/SDK5Events$Event;Ljava/util/Map;)V

    .line 911
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "getControllerConfig Error while adding supported features data from FeaturesManager"

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private addTesterParametersToConfig(Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 3

    const-string v0, "testFriendlyName"

    const-string v1, "testerABGroup"

    .line 916
    invoke-virtual {p0, p2}, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->areTesterParametersValid(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 918
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 919
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, v1, p2}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 920
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 922
    :catch_0
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "getControllerConfig Error while parsing Tester AB Group parameters"

    invoke-static {p1, p2}, Lcom/ironsource/sdk/utils/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method

.method private callJavaScriptFunction(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1265
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1266
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1, p2}, Lcom/ironsource/sdk/controller/WebController;->access$400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1267
    iget-object p2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p2, p1}, Lcom/ironsource/sdk/controller/WebController;->access$500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private extendControllerConfig(Lorg/json/JSONObject;)V
    .locals 1

    .line 893
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->addSupportedNativeFeaturesToConfig(Lorg/json/JSONObject;)V

    .line 894
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->getTesterParameters()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->addTesterParametersToConfig(Lorg/json/JSONObject;Ljava/lang/String;)V

    return-void
.end method

.method private handleAdCreditedOnInterstitial(Ljava/lang/String;I)V
    .locals 2

    .line 1407
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v1}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 1410
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$3800(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/DemandSourceManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0, v1, p1}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSourceById(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1411
    invoke-virtual {v0}, Lcom/ironsource/sdk/data/DemandSource;->isRewarded()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    .line 1415
    :cond_1
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v1, Lcom/ironsource/sdk/controller/WebController$NativeAPI$5;

    invoke-direct {v1, p0, p1, p2}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$5;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private setInterstitialAvailability(Ljava/lang/String;Z)V
    .locals 2

    .line 1718
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$3800(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/DemandSourceManager;

    move-result-object v0

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0, v1, p1}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSourceById(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 1720
    invoke-virtual {p1, p2}, Lcom/ironsource/sdk/data/DemandSource;->setAvailabilityState(Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public adClicked(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1666
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "adClicked("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1668
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string p1, "productType"

    .line 1669
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1670
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v0

    .line 1671
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 1675
    :cond_0
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    move-result-object p1

    .line 1676
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4600(Lcom/ironsource/sdk/controller/WebController;Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Lcom/ironsource/sdk/listeners/internals/DSAdProductListener;

    move-result-object v1

    if-eqz p1, :cond_1

    if-eqz v1, :cond_1

    .line 1679
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v3, Lcom/ironsource/sdk/controller/WebController$NativeAPI$12;

    invoke-direct {v3, p0, v1, p1, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$12;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Lcom/ironsource/sdk/listeners/internals/DSAdProductListener;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method

.method public adCredited(Ljava/lang/String;)V
    .locals 13
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1311
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$3900(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "adCredited("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1313
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "credits"

    .line 1314
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 1315
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    move v7, v1

    goto :goto_0

    :cond_0
    const/4 v7, 0x0

    .line 1317
    :goto_0
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v6

    const-string v1, "productType"

    .line 1318
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1320
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1321
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$3900(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "adCredited | not product NAME !!!!"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1324
    :cond_1
    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v1}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1325
    invoke-direct {p0, v6, v7}, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->handleAdCreditedOnInterstitial(Ljava/lang/String;I)V

    return-void

    :cond_2
    const-string v1, "total"

    .line 1329
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 1330
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    move v9, v3

    goto :goto_1

    :cond_3
    const/4 v9, 0x0

    :goto_1
    const-string v3, "externalPoll"

    .line 1332
    invoke-virtual {v0, v3}, Lcom/ironsource/sdk/data/SSAObj;->getBoolean(Ljava/lang/String;)Z

    .line 1340
    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_7

    const-string v3, "signature"

    .line 1343
    invoke-virtual {v0, v3}, Lcom/ironsource/sdk/data/SSAObj;->isNull(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_6

    const-string v8, "timestamp"

    invoke-virtual {v0, v8}, Lcom/ironsource/sdk/data/SSAObj;->isNull(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_6

    const-string v10, "totalCreditsFlag"

    invoke-virtual {v0, v10}, Lcom/ironsource/sdk/data/SSAObj;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_4

    goto :goto_3

    .line 1350
    :cond_4
    invoke-virtual {v0, v3}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1353
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$4100(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$4000(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1355
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/ironsource/sdk/utils/SDKUtils;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1357
    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    const/4 v2, 0x1

    goto :goto_2

    .line 1361
    :cond_5
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v3, "Controller signature is not equal to SDK signature"

    invoke-static {v1, p1, v2, v3, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1365
    :goto_2
    invoke-virtual {v0, v10}, Lcom/ironsource/sdk/data/SSAObj;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 1368
    invoke-virtual {v0, v8}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v11, v0

    move v10, v1

    move v8, v2

    goto :goto_4

    .line 1345
    :cond_6
    :goto_3
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "One of the keys are missing: signature/timestamp/totalCreditsFlag"

    invoke-static {v0, p1, v2, v1, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_7
    move-object v11, v4

    const/4 v8, 0x0

    const/4 v10, 0x0

    .line 1371
    :goto_4
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, v5}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 1377
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v1, Lcom/ironsource/sdk/controller/WebController$NativeAPI$4;

    move-object v3, v1

    move-object v4, p0

    move-object v12, p1

    invoke-direct/range {v3 .. v12}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$4;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;Ljava/lang/String;IZIZLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_8
    return-void
.end method

.method public adUnitsReady(Ljava/lang/String;)V
    .locals 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1039
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "adUnitsReady("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1041
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 1042
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v0

    .line 1044
    new-instance v1, Lcom/ironsource/sdk/data/AdUnitsReady;

    invoke-direct {v1, p1}, Lcom/ironsource/sdk/data/AdUnitsReady;-><init>(Ljava/lang/String;)V

    .line 1046
    invoke-virtual {v1}, Lcom/ironsource/sdk/data/AdUnitsReady;->isNumOfAdUnitsExist()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_0

    .line 1047
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x0

    const-string v2, "Num Of Ad Units Do Not Exist"

    invoke-static {v0, p1, v1, v2, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1051
    :cond_0
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v4, 0x1

    invoke-static {v2, p1, v4, v3, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1053
    invoke-virtual {v1}, Lcom/ironsource/sdk/data/AdUnitsReady;->getProductType()Ljava/lang/String;

    move-result-object p1

    .line 1054
    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1055
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2, p1}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1056
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v2, Lcom/ironsource/sdk/controller/WebController$NativeAPI$3;

    invoke-direct {v2, p0, v1, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$3;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Lcom/ironsource/sdk/data/AdUnitsReady;Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method

.method public adViewAPI(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2397
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "adViewAPI("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2398
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 2399
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$5600(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/AdViewsJSAdapter;

    move-result-object p1

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAObj;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/ironsource/sdk/controller/WebController$NativeAPI$JSCallbackTask;

    invoke-direct {v1, p0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$JSCallbackTask;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;)V

    invoke-virtual {p1, v0, v1}, Lcom/ironsource/sdk/controller/AdViewsJSAdapter;->call(Ljava/lang/String;Lcom/ironsource/sdk/controller/WebController$NativeAPI$JSCallbackTask;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 2401
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 2402
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "adViewAPI failed with exception "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method areTesterParametersValid(Ljava/lang/String;)Z
    .locals 1

    .line 928
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "-1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 930
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "testerABGroup"

    .line 931
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "testFriendlyName"

    .line 932
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :catch_0
    move-exception p1

    .line 936
    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public bannerViewAPI(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2346
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$5100(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/BannerJSAdapter;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/controller/BannerJSAdapter;->sendMessageToISNAdView(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 2348
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 2349
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bannerViewAPI failed with exception "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ironsource/sdk/utils/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public deleteFile(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1099
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deleteFile("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1101
    new-instance v0, Lcom/ironsource/sdk/data/SSAFile;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAFile;-><init>(Ljava/lang/String;)V

    .line 1103
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$1300(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAFile;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ironsource/sdk/utils/IronSourceStorageUtils;->isPathExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1104
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x0

    const-string v2, "File not exist"

    const-string v3, "1"

    invoke-static {v0, p1, v1, v2, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1107
    :cond_0
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$1300(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAFile;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAFile;->getFile()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/ironsource/sdk/utils/IronSourceStorageUtils;->deleteFile(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    .line 1108
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v2, 0x0

    invoke-static {v1, p1, v0, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public deleteFolder(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1085
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deleteFolder("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1087
    new-instance v0, Lcom/ironsource/sdk/data/SSAFile;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAFile;-><init>(Ljava/lang/String;)V

    .line 1089
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$1300(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAFile;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ironsource/sdk/utils/IronSourceStorageUtils;->isPathExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1090
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x0

    const-string v2, "Folder not exist"

    const-string v3, "1"

    invoke-static {v0, p1, v1, v2, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1092
    :cond_0
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$1300(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAFile;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/ironsource/sdk/utils/IronSourceStorageUtils;->deleteFolder(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    .line 1093
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v2, 0x0

    invoke-static {v1, p1, v0, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public deviceDataAPI(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2385
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deviceDataAPI("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2386
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 2387
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$5500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/DeviceDataJSAdapter;

    move-result-object p1

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAObj;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/ironsource/sdk/controller/WebController$NativeAPI$JSCallbackTask;

    invoke-direct {v1, p0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$JSCallbackTask;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;)V

    invoke-virtual {p1, v0, v1}, Lcom/ironsource/sdk/controller/DeviceDataJSAdapter;->call(Ljava/lang/String;Lcom/ironsource/sdk/controller/WebController$NativeAPI$JSCallbackTask;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 2389
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 2390
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "deviceDataAPI failed with exception "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public displayWebView(Ljava/lang/String;)V
    .locals 11
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1114
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "displayWebView("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1116
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1118
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string p1, "display"

    .line 1119
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const-string v1, "productType"

    .line 1120
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "standaloneView"

    .line 1121
    invoke-virtual {v0, v3}, Lcom/ironsource/sdk/data/SSAObj;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    const-string v4, "adViewId"

    .line 1122
    invoke-virtual {v0, v4}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1125
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v6

    if-eqz p1, :cond_9

    .line 1129
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v7, "immersive"

    invoke-virtual {v0, v7}, Lcom/ironsource/sdk/data/SSAObj;->getBoolean(Ljava/lang/String;)Z

    move-result v8

    invoke-static {p1, v8}, Lcom/ironsource/sdk/controller/WebController;->access$3202(Lcom/ironsource/sdk/controller/WebController;Z)Z

    const-string p1, "activityThemeTranslucent"

    .line 1130
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    .line 1132
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/WebController;->getState()Lcom/ironsource/sdk/controller/WebController$State;

    move-result-object v0

    sget-object v8, Lcom/ironsource/sdk/controller/WebController$State;->Display:Lcom/ironsource/sdk/controller/WebController$State;

    const-string v9, "State: "

    if-eq v0, v8, :cond_8

    .line 1134
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v8, Lcom/ironsource/sdk/controller/WebController$State;->Display:Lcom/ironsource/sdk/controller/WebController$State;

    invoke-virtual {v0, v8}, Lcom/ironsource/sdk/controller/WebController;->setState(Lcom/ironsource/sdk/controller/WebController$State;)V

    .line 1136
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v9}, Lcom/ironsource/sdk/controller/WebController;->access$3300(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/WebController$State;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v0, v8}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1138
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/WebController;->getCurrentActivityContext()Landroid/content/Context;

    move-result-object v0

    .line 1140
    iget-object v8, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v8}, Lcom/ironsource/sdk/controller/WebController;->getOrientationState()Ljava/lang/String;

    move-result-object v8

    .line 1141
    invoke-static {v0}, Lcom/ironsource/environment/DeviceStatus;->getApplicationRotation(Landroid/content/Context;)I

    move-result v9

    if-eqz v3, :cond_0

    .line 1146
    new-instance p1, Lcom/ironsource/sdk/controller/ControllerView;

    invoke-direct {p1, v0}, Lcom/ironsource/sdk/controller/ControllerView;-><init>(Landroid/content/Context;)V

    .line 1147
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$3400(Lcom/ironsource/sdk/controller/WebController;)Landroid/widget/FrameLayout;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/ironsource/sdk/controller/ControllerView;->addView(Landroid/view/View;)V

    .line 1148
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {p1, v0}, Lcom/ironsource/sdk/controller/ControllerView;->showInterstitial(Lcom/ironsource/sdk/controller/WebController;)V

    goto/16 :goto_2

    :cond_0
    if-eqz p1, :cond_1

    .line 1155
    new-instance p1, Landroid/content/Intent;

    const-class v3, Lcom/ironsource/sdk/controller/InterstitialActivity;

    invoke-direct {p1, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    goto :goto_0

    .line 1157
    :cond_1
    new-instance p1, Landroid/content/Intent;

    const-class v3, Lcom/ironsource/sdk/controller/ControllerActivity;

    invoke-direct {p1, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1160
    :goto_0
    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    const-string v10, "application"

    if-eqz v3, :cond_3

    .line 1161
    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1162
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v2}, Lcom/ironsource/sdk/controller/WebController;->getCurrentActivityContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/ironsource/environment/DeviceStatus;->getActivityRequestedOrientation(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Lcom/ironsource/sdk/utils/SDKUtils;->translateRequestedOrientation(I)Ljava/lang/String;

    move-result-object v8

    .line 1165
    :cond_2
    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1168
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object v1

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/data/AdUnitsState;->adOpened(I)V

    .line 1169
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/ironsource/sdk/data/AdUnitsState;->setDisplayedDemandSourceId(Ljava/lang/String;)V

    .line 1170
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 1171
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$3000(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;

    move-result-object v1

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-interface {v1, v2, v6}, Lcom/ironsource/sdk/listeners/internals/DSRewardedVideoListener;->onAdProductOpen(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)V

    goto :goto_1

    .line 1174
    :cond_3
    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1175
    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1177
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object v1

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/data/AdUnitsState;->adOpened(I)V

    goto :goto_1

    .line 1178
    :cond_4
    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1179
    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1180
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v2}, Lcom/ironsource/sdk/controller/WebController;->getCurrentActivityContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/ironsource/environment/DeviceStatus;->getActivityRequestedOrientation(Landroid/content/Context;)I

    move-result v2

    invoke-static {v2}, Lcom/ironsource/sdk/utils/SDKUtils;->translateRequestedOrientation(I)Ljava/lang/String;

    move-result-object v2

    move-object v8, v2

    .line 1182
    :cond_5
    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_6
    :goto_1
    if-eqz v5, :cond_7

    .line 1186
    invoke-virtual {p1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_7
    const/high16 v1, 0x20000000

    .line 1189
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1190
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$3200(Lcom/ironsource/sdk/controller/WebController;)Z

    move-result v1

    invoke-virtual {p1, v7, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "orientation_set_flag"

    .line 1191
    invoke-virtual {p1, v1, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "rotation_set_flag"

    .line 1192
    invoke-virtual {p1, v1, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1194
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_2

    .line 1198
    :cond_8
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$3300(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/WebController$State;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 1202
    :cond_9
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v0, Lcom/ironsource/sdk/controller/WebController$State;->Gone:Lcom/ironsource/sdk/controller/WebController$State;

    invoke-virtual {p1, v0}, Lcom/ironsource/sdk/controller/WebController;->setState(Lcom/ironsource/sdk/controller/WebController$State;)V

    .line 1203
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$3600(Lcom/ironsource/sdk/controller/WebController;)V

    :goto_2
    return-void
.end method

.method public getApplicationInfo(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 944
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getApplicationInfo("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 946
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$1800(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 947
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$1900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 950
    new-instance v2, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v2, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string p1, "productType"

    .line 951
    invoke-virtual {v2, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 952
    invoke-static {v2}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v2

    .line 958
    iget-object v3, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v3, p1, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2600(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object p1

    const/4 v2, 0x0

    .line 960
    aget-object v2, p1, v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x1

    .line 961
    aget-object p1, p1, v3

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 964
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    move-object v0, v1

    goto :goto_0

    .line 968
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 973
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 974
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onGetApplicationInfoSuccess"

    const-string v3, "onGetApplicationInfoFail"

    invoke-static {p1, v0, v2, v1, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2100(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 975
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public getCachedFilesMap(Ljava/lang/String;)V
    .locals 6
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1235
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getCachedFilesMap("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1237
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$1800(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1239
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 1241
    new-instance v1, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v1, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v2, "path"

    .line 1244
    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/data/SSAObj;->containsKey(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-nez v3, :cond_0

    .line 1245
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "path key does not exist"

    invoke-static {v0, p1, v5, v1, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1249
    :cond_0
    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/data/SSAObj;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1252
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2}, Lcom/ironsource/sdk/controller/WebController;->access$1300(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/ironsource/sdk/utils/IronSourceStorageUtils;->isPathExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1253
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "path file does not exist on disk"

    invoke-static {v0, p1, v5, v1, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1257
    :cond_1
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$1300(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v1}, Lcom/ironsource/sdk/utils/IronSourceStorageUtils;->getCachedFilesMap(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1258
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v2, "onGetCachedFilesMapSuccess"

    const-string v3, "onGetCachedFilesMapFail"

    invoke-static {v1, v0, p1, v2, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2100(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1260
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public getConnectivityInfo(Ljava/lang/String;)V
    .locals 12
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 844
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getConnectivityInfo("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 846
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 847
    invoke-static {}, Lcom/ironsource/sdk/controller/WebController;->access$2200()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 848
    invoke-static {}, Lcom/ironsource/sdk/controller/WebController;->access$2300()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 849
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 851
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2}, Lcom/ironsource/sdk/controller/WebController;->access$2400(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/service/ConnectivityAdapter;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 852
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$2400(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/service/ConnectivityAdapter;

    move-result-object v1

    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v2}, Lcom/ironsource/sdk/controller/WebController;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/service/ConnectivityAdapter;->getConnectivityData(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v1

    .line 857
    :cond_0
    invoke-virtual {v1}, Lorg/json/JSONObject;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 858
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/ironsource/sdk/controller/WebController;->access$400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 860
    :cond_1
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-string v2, "errMsg"

    const-string v3, "failed to retrieve connection info"

    invoke-static/range {v1 .. v11}, Lcom/ironsource/sdk/controller/WebController;->access$2500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    .line 861
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1, v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 864
    :goto_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V

    return-void
.end method

.method public getControllerConfig(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 881
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getControllerConfig("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 882
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 883
    invoke-static {}, Lcom/ironsource/sdk/controller/WebController;->access$2200()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 884
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 885
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->getControllerConfigAsJSONObject()Lorg/json/JSONObject;

    move-result-object v0

    .line 886
    invoke-direct {p0, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->extendControllerConfig(Lorg/json/JSONObject;)V

    .line 887
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, p1, v0}, Lcom/ironsource/sdk/controller/WebController;->access$400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 888
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public getDemandSourceState(Ljava/lang/String;)V
    .locals 7
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1273
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getMediationState("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1275
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "demandSourceName"

    .line 1276
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1277
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "productType"

    .line 1279
    invoke-virtual {v0, v4}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    if-eqz v2, :cond_1

    .line 1283
    :try_start_0
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->getProductType(Ljava/lang/String;)Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 1285
    iget-object v6, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v6}, Lcom/ironsource/sdk/controller/WebController;->access$3800(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/DemandSourceManager;

    move-result-object v6

    invoke-virtual {v6, v5, v3}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSourceById(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object v5

    .line 1288
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 1289
    invoke-virtual {v6, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1290
    invoke-virtual {v6, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "demandSourceId"

    .line 1291
    invoke-virtual {v6, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz v5, :cond_0

    const/4 v0, -0x1

    .line 1293
    invoke-virtual {v5, v0}, Lcom/ironsource/sdk/data/DemandSource;->isMediationState(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1294
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$1800(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "state"

    .line 1295
    invoke-virtual {v5}, Lcom/ironsource/sdk/data/DemandSource;->getMediationState()I

    move-result v2

    invoke-virtual {v6, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto :goto_0

    .line 1297
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$1900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1299
    :goto_0
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->callJavaScriptFunction(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 1303
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v1, p1, v2, v3, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1304
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    :goto_1
    return-void
.end method

.method public getDeviceStatus(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 813
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getDeviceStatus("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 815
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$1800(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 816
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$1900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 819
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v1}, Lcom/ironsource/sdk/controller/WebController;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2000(Lcom/ironsource/sdk/controller/WebController;Landroid/content/Context;)[Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    .line 821
    aget-object v2, v1, v2

    check-cast v2, Ljava/lang/String;

    const/4 v3, 0x1

    .line 822
    aget-object v1, v1, v3

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 827
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    move-object v0, p1

    goto :goto_0

    .line 831
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 836
    :goto_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 837
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onGetDeviceStatusSuccess"

    const-string v3, "onGetDeviceStatusFail"

    invoke-static {p1, v0, v2, v1, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2100(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 838
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public getDeviceVolume(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2409
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getDeviceVolume("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2412
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/WebController;->getCurrentActivityContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/ironsource/sdk/utils/DeviceProperties;->getInstance(Landroid/content/Context;)Lcom/ironsource/sdk/utils/DeviceProperties;

    move-result-object v0

    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v1}, Lcom/ironsource/sdk/controller/WebController;->getCurrentActivityContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/utils/DeviceProperties;->getDeviceVolume(Landroid/content/Context;)F

    move-result v0

    .line 2414
    new-instance v1, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v1, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string p1, "deviceVolume"

    .line 2415
    invoke-static {v0}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, p1, v0}, Lcom/ironsource/sdk/data/SSAObj;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2416
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v1}, Lcom/ironsource/sdk/data/SSAObj;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p1, v0, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 2418
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public getOrientation(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1209
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$1800(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1210
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/WebController;->getCurrentActivityContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->getOrientation(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1212
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1213
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v2, "onGetOrientationSuccess"

    const-string v3, "onGetOrientationFail"

    invoke-static {v1, p1, v0, v2, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2100(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1214
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public getUserData(Ljava/lang/String;)V
    .locals 13
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2145
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getUserData("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2147
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "key"

    .line 2149
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2150
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, "key does not exist"

    invoke-static {v0, p1, v1, v3, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 2154
    :cond_0
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2, p1}, Lcom/ironsource/sdk/controller/WebController;->access$1800(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2155
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 2157
    invoke-static {}, Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;->getSupersonicPrefHelper()Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;->getUserData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2159
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-static/range {v2 .. v12}, Lcom/ironsource/sdk/controller/WebController;->access$2500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 2161
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1, p1, v0}, Lcom/ironsource/sdk/controller/WebController;->access$400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2162
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V

    return-void
.end method

.method public iabTokenAPI(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1074
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "iabTokenAPI("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1075
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 1076
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$3100(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/TokenJSAdapter;

    move-result-object p1

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAObj;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/ironsource/sdk/controller/WebController$NativeAPI$JSCallbackTask;

    invoke-direct {v1, p0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$JSCallbackTask;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;)V

    invoke-virtual {p1, v0, v1}, Lcom/ironsource/sdk/controller/TokenJSAdapter;->call(Ljava/lang/String;Lcom/ironsource/sdk/controller/WebController$NativeAPI$JSCallbackTask;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 1078
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 1079
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "iabTokenAPI failed with exception "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public initController(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 781
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initController("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 783
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 785
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    iget-object p1, p1, Lcom/ironsource/sdk/controller/WebController;->mLoadControllerTimer:Landroid/os/CountDownTimer;

    if-eqz p1, :cond_0

    .line 786
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    iget-object p1, p1, Lcom/ironsource/sdk/controller/WebController;->mLoadControllerTimer:Landroid/os/CountDownTimer;

    invoke-virtual {p1}, Landroid/os/CountDownTimer;->cancel()V

    .line 787
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x0

    iput-object v1, p1, Lcom/ironsource/sdk/controller/WebController;->mLoadControllerTimer:Landroid/os/CountDownTimer;

    :cond_0
    const-string p1, "stage"

    .line 790
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 791
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "ready"

    .line 793
    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 794
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/ironsource/sdk/controller/WebController;->access$302(Lcom/ironsource/sdk/controller/WebController;Z)Z

    .line 795
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$1200(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/ControllerEventListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/ironsource/sdk/controller/ControllerEventListener;->handleControllerStageReady()V

    return-void

    :cond_1
    const-string v1, "loaded"

    .line 798
    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 799
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$1200(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/ControllerEventListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/ironsource/sdk/controller/ControllerEventListener;->handleControllerStageLoaded()V

    return-void

    :cond_2
    const-string v1, "failed"

    .line 802
    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "errMsg"

    .line 803
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 804
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$1200(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/ControllerEventListener;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "controller failed to initialize : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/ironsource/sdk/controller/ControllerEventListener;->handleControllerStageFailed(Ljava/lang/String;)V

    return-void

    .line 807
    :cond_3
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "No STAGE mentioned! Should not get here!"

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    return-void
.end method

.method public omidAPI(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2355
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v1, Lcom/ironsource/sdk/controller/WebController$NativeAPI$28;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$28;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onAdWindowsClosed(Ljava/lang/String;)V
    .locals 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2190
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onAdWindowsClosed("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2193
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/AdUnitsState;->adClosed()V

    .line 2194
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/AdUnitsState;->setDisplayedDemandSourceId(Ljava/lang/String;)V

    .line 2197
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string p1, "productType"

    .line 2198
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2199
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v0

    .line 2200
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    move-result-object v1

    .line 2202
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2}, Lcom/ironsource/sdk/controller/WebController;->access$3900(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onAdClosed() with type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2204
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2, p1}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2206
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v2, Lcom/ironsource/sdk/controller/WebController$NativeAPI$26;

    invoke-direct {v2, p0, v1, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$26;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onGenericFunctionFail(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2007
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onGenericFunctionFail("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2009
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$4800(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/listeners/OnGenericFunctionListener;

    move-result-object v0

    if-nez v0, :cond_0

    .line 2010
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "genericFunctionListener was not found"

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 2014
    :cond_0
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "errMsg"

    .line 2015
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2017
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v2, Lcom/ironsource/sdk/controller/WebController$NativeAPI$24;

    invoke-direct {v2, p0, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$24;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2023
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 2024
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onGenericFunctionFail"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onGenericFunctionSuccess(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1989
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onGenericFunctionSuccess("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1991
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$4800(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/listeners/OnGenericFunctionListener;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1992
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "genericFunctionListener was not found"

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1996
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v1, Lcom/ironsource/sdk/controller/WebController$NativeAPI$23;

    invoke-direct {v1, p0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$23;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2002
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onGetApplicationInfoFail(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1494
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onGetApplicationInfoFail("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1496
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1497
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onGetApplicationInfoFail"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onGetApplicationInfoSuccess(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1486
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onGetApplicationInfoSuccess("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1488
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1489
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onGetApplicationInfoSuccess"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onGetCachedFilesMapFail(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1547
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onGetCachedFilesMapFail("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1549
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1551
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onGetCachedFilesMapFail"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onGetCachedFilesMapSuccess(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1538
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onGetCachedFilesMapSuccess("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1540
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1542
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onGetCachedFilesMapSuccess"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onGetDeviceStatusFail(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1445
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onGetDeviceStatusFail("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1447
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1449
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onGetDeviceStatusFail"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onGetDeviceStatusSuccess(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1436
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onGetDeviceStatusSuccess("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1438
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1440
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onGetDeviceStatusSuccess"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onGetUserCreditsFail(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2167
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onGetUserCreditsFail("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2169
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "errMsg"

    .line 2170
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2172
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2173
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v2, Lcom/ironsource/sdk/controller/WebController$NativeAPI$25;

    invoke-direct {v2, p0, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$25;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 2184
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 2185
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onGetUserCreditsFail"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onInitBannerFail(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1900
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onInitBannerFail("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1902
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "errMsg"

    .line 1903
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1904
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v0

    .line 1906
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1907
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "onInitBannerFail failed with no demand source"

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1911
    :cond_0
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2}, Lcom/ironsource/sdk/controller/WebController;->access$3800(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/DemandSourceManager;

    move-result-object v2

    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2, v3, v0}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSourceById(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object v2

    if-eqz v2, :cond_1

    const/4 v3, 0x3

    .line 1914
    invoke-virtual {v2, v3}, Lcom/ironsource/sdk/data/DemandSource;->setDemandSourceInitState(I)V

    .line 1917
    :cond_1
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1919
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v3, Lcom/ironsource/sdk/controller/WebController$NativeAPI$20;

    invoke-direct {v3, p0, v1, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$20;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1932
    :cond_2
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1933
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onInitBannerFail"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onInitBannerSuccess(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1876
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onInitBannerSuccess()"

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1878
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onInitBannerSuccess"

    const-string v2, "true"

    invoke-static {v0, v1, v2}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    .line 1879
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 1880
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object p1

    .line 1882
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1883
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "onInitBannerSuccess failed with no demand source"

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1887
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v1}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1888
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v1, Lcom/ironsource/sdk/controller/WebController$NativeAPI$19;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$19;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method

.method public onInitInterstitialFail(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1629
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onInitInterstitialFail("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1631
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "errMsg"

    .line 1632
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1633
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v0

    .line 1635
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1636
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "onInitInterstitialSuccess failed with no demand source"

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1639
    :cond_0
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2}, Lcom/ironsource/sdk/controller/WebController;->access$3800(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/DemandSourceManager;

    move-result-object v2

    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2, v3, v0}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSourceById(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object v2

    if-eqz v2, :cond_1

    const/4 v3, 0x3

    .line 1642
    invoke-virtual {v2, v3}, Lcom/ironsource/sdk/data/DemandSource;->setDemandSourceInitState(I)V

    .line 1645
    :cond_1
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1647
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v3, Lcom/ironsource/sdk/controller/WebController$NativeAPI$11;

    invoke-direct {v3, p0, v1, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$11;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1660
    :cond_2
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1661
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onInitInterstitialFail"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onInitInterstitialSuccess(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1603
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onInitInterstitialSuccess()"

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1605
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onInitInterstitialSuccess"

    const-string v2, "true"

    invoke-static {v0, v1, v2}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    .line 1606
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 1607
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object p1

    .line 1609
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1610
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "onInitInterstitialSuccess failed with no demand source"

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1614
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v1}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1616
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v1, Lcom/ironsource/sdk/controller/WebController$NativeAPI$10;

    invoke-direct {v1, p0, p1}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$10;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method

.method public onInitOfferWallFail(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1748
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onInitOfferWallFail("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1751
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/AdUnitsState;->setOfferwallInitSuccess(Z)V

    .line 1753
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v2, "errMsg"

    .line 1754
    invoke-virtual {v0, v2}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1757
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/AdUnitsState;->reportInitOfferwall()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1760
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/ironsource/sdk/data/AdUnitsState;->setOfferwallReportInit(Z)V

    .line 1762
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1764
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v2, Lcom/ironsource/sdk/controller/WebController$NativeAPI$15;

    invoke-direct {v2, p0, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$15;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1778
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1779
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onInitOfferWallFail"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onInitOfferWallSuccess(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1726
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v0, "onInitOfferWallSuccess"

    const-string v1, "true"

    invoke-static {p1, v0, v1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    .line 1728
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/ironsource/sdk/data/AdUnitsState;->setOfferwallInitSuccess(Z)V

    .line 1731
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object p1

    invoke-virtual {p1}, Lcom/ironsource/sdk/data/AdUnitsState;->reportInitOfferwall()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1733
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/ironsource/sdk/data/AdUnitsState;->setOfferwallReportInit(Z)V

    .line 1734
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1735
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v0, Lcom/ironsource/sdk/controller/WebController$NativeAPI$14;

    invoke-direct {v0, p0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$14;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;)V

    invoke-virtual {p1, v0}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onInitRewardedVideoFail(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1454
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onInitRewardedVideoFail("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1456
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "errMsg"

    .line 1457
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1459
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v0

    .line 1461
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2}, Lcom/ironsource/sdk/controller/WebController;->access$3800(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/DemandSourceManager;

    move-result-object v2

    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2, v3, v0}, Lcom/ironsource/sdk/controller/DemandSourceManager;->getDemandSourceById(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;)Lcom/ironsource/sdk/data/DemandSource;

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v3, 0x3

    .line 1464
    invoke-virtual {v2, v3}, Lcom/ironsource/sdk/data/DemandSource;->setDemandSourceInitState(I)V

    .line 1467
    :cond_0
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1468
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v3, Lcom/ironsource/sdk/controller/WebController$NativeAPI$6;

    invoke-direct {v3, p0, v1, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$6;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1480
    :cond_1
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1481
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onInitRewardedVideoFail"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onLoadBannerFail(Ljava/lang/String;)V
    .locals 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1959
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onLoadBannerFail()"

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1960
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "errMsg"

    .line 1961
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1962
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v0

    .line 1964
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v2, p1, v3, v4, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1966
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 1970
    :cond_0
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1971
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v2, Lcom/ironsource/sdk/controller/WebController$NativeAPI$22;

    invoke-direct {v2, p0, v1, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$22;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method

.method public onLoadBannerSuccess(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1938
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "onLoadBannerSuccess()"

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1940
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 1942
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v0

    .line 1944
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {v1, p1, v2, v3, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1946
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v1}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1947
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v1, Lcom/ironsource/sdk/controller/WebController$NativeAPI$21;

    invoke-direct {v1, p0, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$21;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onLoadInterstitialFail(Ljava/lang/String;)V
    .locals 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1808
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLoadInterstitialFail("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1810
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "errMsg"

    .line 1811
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1812
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v0

    .line 1814
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v2, p1, v3, v4, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1815
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    :cond_0
    const/4 p1, 0x0

    .line 1819
    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->setInterstitialAvailability(Ljava/lang/String;Z)V

    .line 1822
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1824
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v2, Lcom/ironsource/sdk/controller/WebController$NativeAPI$17;

    invoke-direct {v2, p0, v1, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$17;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1, v2}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1835
    :cond_1
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v0, "onLoadInterstitialFail"

    const-string v1, "true"

    invoke-static {p1, v0, v1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onLoadInterstitialSuccess(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1784
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLoadInterstitialSuccess("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1786
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 1787
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    .line 1789
    invoke-direct {p0, v0, v1}, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->setInterstitialAvailability(Ljava/lang/String;Z)V

    .line 1790
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v3, 0x0

    invoke-static {v2, p1, v1, v3, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1793
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v1}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1795
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v1, Lcom/ironsource/sdk/controller/WebController$NativeAPI$16;

    invoke-direct {v1, p0, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$16;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1803
    :cond_0
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v0, "onLoadInterstitialSuccess"

    const-string v1, "true"

    invoke-static {p1, v0, v1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onOfferWallGeneric(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2107
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onOfferWallGeneric("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2108
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2109
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$4200(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/listeners/OnOfferWallListener;

    move-result-object p1

    const-string v0, ""

    invoke-interface {p1, v0, v0}, Lcom/ironsource/sdk/listeners/OnOfferWallListener;->onOWGeneric(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onShowInterstitialFail(Ljava/lang/String;)V
    .locals 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1841
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onShowInterstitialFail("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1843
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "errMsg"

    .line 1844
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1845
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v0

    .line 1847
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v2, p1, v3, v4, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1849
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-void

    :cond_0
    const/4 v2, 0x0

    .line 1853
    invoke-direct {p0, v0, v2}, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->setInterstitialAvailability(Ljava/lang/String;Z)V

    .line 1855
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1857
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v3, Lcom/ironsource/sdk/controller/WebController$NativeAPI$18;

    invoke-direct {v3, p0, v1, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$18;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1869
    :cond_1
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onShowInterstitialFail"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onShowInterstitialSuccess(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1689
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onShowInterstitialSuccess("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1691
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1693
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 1694
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v0

    .line 1696
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1697
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "onShowInterstitialSuccess called with no demand"

    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1701
    :cond_0
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object v1

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->ordinal()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/data/AdUnitsState;->adOpened(I)V

    .line 1702
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/ironsource/sdk/data/AdUnitsState;->setDisplayedDemandSourceId(Ljava/lang/String;)V

    .line 1704
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1706
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v2, Lcom/ironsource/sdk/controller/WebController$NativeAPI$13;

    invoke-direct {v2, p0, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$13;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1712
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v2, "onShowInterstitialSuccess"

    invoke-static {v1, v2, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/4 p1, 0x0

    .line 1714
    invoke-direct {p0, v0, p1}, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->setInterstitialAvailability(Ljava/lang/String;Z)V

    return-void
.end method

.method public onShowOfferWallFail(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1578
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onShowOfferWallFail("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1580
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "errMsg"

    .line 1581
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1583
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1584
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v2, Lcom/ironsource/sdk/controller/WebController$NativeAPI$9;

    invoke-direct {v2, p0, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$9;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1595
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1596
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onShowOfferWallFail"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onShowOfferWallSuccess(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1559
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onShowOfferWallSuccess("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1560
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$3500(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/data/AdUnitsState;

    move-result-object v0

    sget-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v1}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->ordinal()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/AdUnitsState;->adOpened(I)V

    const-string v0, "placementId"

    .line 1562
    invoke-static {p1, v0}, Lcom/ironsource/sdk/utils/SDKUtils;->getValueFromJsonObject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1564
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v2, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1565
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v2, Lcom/ironsource/sdk/controller/WebController$NativeAPI$8;

    invoke-direct {v2, p0, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$8;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1572
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1573
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onShowOfferWallSuccess"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onShowRewardedVideoFail(Ljava/lang/String;)V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1510
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onShowRewardedVideoFail("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1512
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "errMsg"

    .line 1513
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1514
    invoke-static {v0}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v0

    .line 1516
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    sget-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v3}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1518
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v3, Lcom/ironsource/sdk/controller/WebController$NativeAPI$7;

    invoke-direct {v3, p0, v1, v0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$7;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1531
    :cond_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1532
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onShowRewardedVideoFail"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onShowRewardedVideoSuccess(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1502
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onShowRewardedVideoSuccess("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1504
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1505
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "onShowRewardedVideoSuccess"

    invoke-static {v0, v1, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onVideoStatusChanged(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2224
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onVideoStatusChanged("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2225
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string p1, "productType"

    .line 2226
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2228
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$5000(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/VideoEventsListener;

    move-result-object v1

    if-eqz v1, :cond_5

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5

    const-string p1, "status"

    .line 2229
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "started"

    .line 2230
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2231
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$5000(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/VideoEventsListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/ironsource/sdk/controller/VideoEventsListener;->onVideoStarted()V

    goto :goto_0

    :cond_0
    const-string v0, "paused"

    .line 2232
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2233
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$5000(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/VideoEventsListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/ironsource/sdk/controller/VideoEventsListener;->onVideoPaused()V

    goto :goto_0

    :cond_1
    const-string v0, "playing"

    .line 2234
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2235
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$5000(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/VideoEventsListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/ironsource/sdk/controller/VideoEventsListener;->onVideoResumed()V

    goto :goto_0

    :cond_2
    const-string v0, "ended"

    .line 2236
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2237
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$5000(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/VideoEventsListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/ironsource/sdk/controller/VideoEventsListener;->onVideoEnded()V

    goto :goto_0

    :cond_3
    const-string v0, "stopped"

    .line 2238
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2239
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$5000(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/VideoEventsListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/ironsource/sdk/controller/VideoEventsListener;->onVideoStopped()V

    goto :goto_0

    .line 2241
    :cond_4
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onVideoStatusChanged: unknown status: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_0
    return-void
.end method

.method public openUrl(Ljava/lang/String;)V
    .locals 5
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2033
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "openUrl("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2035
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v1, "url"

    .line 2036
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "method"

    .line 2037
    invoke-virtual {v0, v2}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2040
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v2}, Lcom/ironsource/sdk/controller/WebController;->getCurrentActivityContext()Landroid/content/Context;

    move-result-object v2

    :try_start_0
    const-string v3, "external_browser"

    .line 2042
    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2043
    invoke-static {v2, v1}, Lcom/ironsource/environment/UrlHandler;->openUrl(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string v3, "webview"

    .line 2044
    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_1

    .line 2046
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lcom/ironsource/sdk/controller/OpenUrlActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2047
    sget-object v3, Lcom/ironsource/sdk/controller/WebController;->EXTERNAL_URL:Ljava/lang/String;

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2048
    sget-object v1, Lcom/ironsource/sdk/controller/WebController;->SECONDARY_WEB_VIEW:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "immersive"

    .line 2049
    iget-object v3, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v3}, Lcom/ironsource/sdk/controller/WebController;->access$3200(Lcom/ironsource/sdk/controller/WebController;)Z

    move-result v3

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2050
    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :cond_1
    const-string v3, "store"

    .line 2052
    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2054
    new-instance v0, Landroid/content/Intent;

    const-class v3, Lcom/ironsource/sdk/controller/OpenUrlActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 2055
    sget-object v3, Lcom/ironsource/sdk/controller/WebController;->EXTERNAL_URL:Ljava/lang/String;

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2056
    sget-object v1, Lcom/ironsource/sdk/controller/WebController;->IS_STORE:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2057
    sget-object v1, Lcom/ironsource/sdk/controller/WebController;->SECONDARY_WEB_VIEW:Ljava/lang/String;

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 2058
    invoke-virtual {v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 2061
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v1, p1, v2, v3, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 2062
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    :goto_0
    return-void
.end method

.method public permissionsAPI(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2373
    :try_start_0
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "permissionsAPI("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2374
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    .line 2375
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$5400(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/controller/PermissionsJSAdapter;

    move-result-object p1

    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAObj;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/ironsource/sdk/controller/WebController$NativeAPI$JSCallbackTask;

    invoke-direct {v1, p0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$JSCallbackTask;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;)V

    invoke-virtual {p1, v0, v1}, Lcom/ironsource/sdk/controller/PermissionsJSAdapter;->call(Ljava/lang/String;Lcom/ironsource/sdk/controller/WebController$NativeAPI$JSCallbackTask;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 2377
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    .line 2378
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "permissionsAPI failed with exception "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public postAdEventNotification(Ljava/lang/String;)V
    .locals 21
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    move-object/from16 v7, p0

    move-object/from16 v0, p1

    .line 2249
    :try_start_0
    iget-object v1, v7, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "postAdEventNotification("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2251
    new-instance v1, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v1, v0}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v2, "eventName"

    .line 2254
    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 2255
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    .line 2256
    iget-object v1, v7, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v2, "eventName does not exist"

    invoke-static {v1, v0, v4, v2, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v2, "dsName"

    .line 2261
    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 2262
    invoke-static {v1}, Lcom/ironsource/sdk/utils/SDKUtils;->fetchDemandSourceId(Lcom/ironsource/sdk/data/SSAObj;)Ljava/lang/String;

    move-result-object v2

    .line 2263
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    move-object v6, v2

    goto :goto_0

    :cond_1
    move-object v6, v14

    :goto_0
    const-string v2, "extData"

    .line 2266
    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/data/SSAObj;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v19, v2

    check-cast v19, Lorg/json/JSONObject;

    const-string v2, "productType"

    .line 2268
    invoke-virtual {v1, v2}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 2269
    iget-object v1, v7, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1, v10}, Lcom/ironsource/sdk/controller/WebController;->access$4500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    move-result-object v20

    .line 2271
    iget-object v1, v7, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1, v10}, Lcom/ironsource/sdk/controller/WebController;->access$2900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 2273
    iget-object v1, v7, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1, v0}, Lcom/ironsource/sdk/controller/WebController;->access$1800(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2274
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 2275
    iget-object v8, v7, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v9, "productType"

    const-string v11, "eventName"

    const-string v13, "demandSourceName"

    const-string v15, "demandSourceId"

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object v12, v5

    move-object/from16 v16, v6

    invoke-static/range {v8 .. v18}, Lcom/ironsource/sdk/controller/WebController;->access$2500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    .line 2277
    iget-object v2, v7, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v3, "postAdEventNotificationSuccess"

    const-string v4, "postAdEventNotificationFail"

    invoke-static {v2, v0, v1, v3, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2100(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2278
    iget-object v1, v7, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1, v0}, Lcom/ironsource/sdk/controller/WebController;->access$500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V

    .line 2281
    :cond_2
    iget-object v0, v7, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v8, Lcom/ironsource/sdk/controller/WebController$NativeAPI$27;

    move-object v1, v8

    move-object/from16 v2, p0

    move-object/from16 v3, v20

    move-object v4, v6

    move-object/from16 v6, v19

    invoke-direct/range {v1 .. v6}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$27;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v8}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 2294
    :cond_3
    iget-object v1, v7, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v2, "productType does not exist"

    invoke-static {v1, v0, v4, v2, v3}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 2297
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1
    return-void
.end method

.method public removeCloseEventHandler(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1425
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "removeCloseEventHandler("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1427
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$1100(Lcom/ironsource/sdk/controller/WebController;)Landroid/os/CountDownTimer;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 1428
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$1100(Lcom/ironsource/sdk/controller/WebController;)Landroid/os/CountDownTimer;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/CountDownTimer;->cancel()V

    .line 1431
    :cond_0
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/ironsource/sdk/controller/WebController;->access$1002(Lcom/ironsource/sdk/controller/WebController;Z)Z

    return-void
.end method

.method public removeMessagingInterface(Ljava/lang/String;)V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 771
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v0, Lcom/ironsource/sdk/controller/WebController$NativeAPI$1;

    invoke-direct {v0, p0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$1;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;)V

    invoke-virtual {p1, v0}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public saveFile(Ljava/lang/String;)V
    .locals 8
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 982
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "saveFile("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 984
    new-instance v0, Lcom/ironsource/sdk/data/SSAFile;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAFile;-><init>(Ljava/lang/String;)V

    .line 986
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$1300(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/ironsource/environment/DeviceStatus;->getAvailableMemorySizeInMegaBytes(Ljava/lang/String;)J

    move-result-wide v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    cmp-long v7, v1, v5

    if-gtz v7, :cond_0

    .line 988
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "no_disk_space"

    invoke-static {v0, p1, v3, v1, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 992
    :cond_0
    invoke-static {}, Lcom/ironsource/sdk/utils/SDKUtils;->isExternalStorageAvailable()Z

    move-result v1

    if-nez v1, :cond_1

    .line 994
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "sotrage_unavailable"

    invoke-static {v0, p1, v3, v1, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 998
    :cond_1
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$1300(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/ironsource/sdk/utils/IronSourceStorageUtils;->isFileCached(Ljava/lang/String;Lcom/ironsource/sdk/data/SSAFile;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 999
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "file_already_exist"

    invoke-static {v0, p1, v3, v1, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1003
    :cond_2
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v1}, Lcom/ironsource/sdk/controller/WebController;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/ironsource/network/ConnectivityService;->isConnected(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 1005
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "no_network_connection"

    invoke-static {v0, p1, v3, v1, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 1009
    :cond_3
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v2, 0x1

    invoke-static {v1, p1, v2, v4, v4}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 1011
    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAFile;->getLastUpdateTime()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 1015
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 1018
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 1021
    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAFile;->getPath()Ljava/lang/String;

    move-result-object v1

    const-string v3, "/"

    .line 1023
    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1024
    invoke-virtual {v0}, Lcom/ironsource/sdk/data/SSAFile;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 1025
    array-length v3, v1

    sub-int/2addr v3, v2

    aget-object v1, v1, v3

    .line 1030
    :cond_4
    invoke-static {}, Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;->getSupersonicPrefHelper()Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;

    move-result-object v2

    invoke-virtual {v2, v1, p1}, Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;->setCampaignLastUpdate(Ljava/lang/String;Ljava/lang/String;)V

    .line 1034
    :cond_5
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Lcom/ironsource/sdk/controller/WebController;->access$2800(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/precache/DownloadManager;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/ironsource/sdk/precache/DownloadManager;->downloadFile(Lcom/ironsource/sdk/data/SSAFile;)V

    return-void
.end method

.method sendUnauthorizedError(Ljava/lang/String;)V
    .locals 3

    .line 2302
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "unauthorizedMessage"

    const/4 v2, 0x0

    invoke-static {v0, v1, p1, v2, v2}, Lcom/ironsource/sdk/controller/WebController;->access$2100(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2303
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V

    return-void
.end method

.method public setBackButtonState(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2083
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setBackButtonState("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2085
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string p1, "state"

    .line 2086
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 2088
    invoke-static {}, Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;->getSupersonicPrefHelper()Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;->setBackButtonState(Ljava/lang/String;)V

    return-void
.end method

.method public setForceClose(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2068
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setForceClose("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2070
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string p1, "width"

    .line 2072
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "height"

    .line 2073
    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2075
    iget-object v2, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {v2, p1}, Lcom/ironsource/sdk/controller/WebController;->access$702(Lcom/ironsource/sdk/controller/WebController;I)I

    .line 2076
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {p1, v1}, Lcom/ironsource/sdk/controller/WebController;->access$802(Lcom/ironsource/sdk/controller/WebController;I)I

    .line 2077
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v1, "position"

    invoke-virtual {v0, v1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ironsource/sdk/controller/WebController;->access$902(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public setMixedContentAlwaysAllow(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 869
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setMixedContentAlwaysAllow("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 870
    iget-object p1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    new-instance v0, Lcom/ironsource/sdk/controller/WebController$NativeAPI$2;

    invoke-direct {v0, p0}, Lcom/ironsource/sdk/controller/WebController$NativeAPI$2;-><init>(Lcom/ironsource/sdk/controller/WebController$NativeAPI;)V

    invoke-virtual {p1, v0}, Lcom/ironsource/sdk/controller/WebController;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setOrientation(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 1220
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setOrientation("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 1222
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string p1, "orientation"

    .line 1223
    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1225
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->setOrientationState(Ljava/lang/String;)V

    .line 1226
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-virtual {v0}, Lcom/ironsource/sdk/controller/WebController;->getCurrentActivityContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/ironsource/environment/DeviceStatus;->getApplicationRotation(Landroid/content/Context;)I

    move-result v0

    .line 1228
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$3700(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/listeners/OnWebViewChangeListener;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1229
    iget-object v1, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v1}, Lcom/ironsource/sdk/controller/WebController;->access$3700(Lcom/ironsource/sdk/controller/WebController;)Lcom/ironsource/sdk/listeners/OnWebViewChangeListener;

    move-result-object v1

    invoke-interface {v1, p1, v0}, Lcom/ironsource/sdk/listeners/OnWebViewChangeListener;->onOrientationChanged(Ljava/lang/String;I)V

    :cond_0
    return-void
.end method

.method public setStoreSearchKeys(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2093
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setStoreSearchKeys("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2095
    invoke-static {}, Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;->getSupersonicPrefHelper()Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;->setSearchKeys(Ljava/lang/String;)V

    return-void
.end method

.method public setUserData(Ljava/lang/String;)V
    .locals 18
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 2114
    iget-object v2, v0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setUserData("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2116
    new-instance v2, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v2, v1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string v3, "key"

    .line 2118
    invoke-virtual {v2, v3}, Lcom/ironsource/sdk/data/SSAObj;->containsKey(Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-nez v4, :cond_0

    .line 2119
    iget-object v2, v0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v3, "key does not exist"

    invoke-static {v2, v1, v6, v3, v5}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v4, "value"

    .line 2123
    invoke-virtual {v2, v4}, Lcom/ironsource/sdk/data/SSAObj;->containsKey(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 2124
    iget-object v2, v0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v3, "value does not exist"

    invoke-static {v2, v1, v6, v3, v5}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    return-void

    .line 2128
    :cond_1
    invoke-virtual {v2, v3}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 2129
    invoke-virtual {v2, v4}, Lcom/ironsource/sdk/data/SSAObj;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 2131
    invoke-static {}, Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;->getSupersonicPrefHelper()Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;

    move-result-object v2

    invoke-virtual {v2, v8, v9}, Lcom/ironsource/sdk/utils/IronSourceSharedPrefHelper;->setUserData(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2134
    iget-object v2, v0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2, v1}, Lcom/ironsource/sdk/controller/WebController;->access$1800(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2135
    iget-object v7, v0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-static/range {v7 .. v17}, Lcom/ironsource/sdk/controller/WebController;->access$2500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    .line 2136
    iget-object v3, v0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v3, v1, v2}, Lcom/ironsource/sdk/controller/WebController;->access$400(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2137
    iget-object v2, v0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v2, v1}, Lcom/ironsource/sdk/controller/WebController;->access$500(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V

    goto :goto_0

    .line 2139
    :cond_2
    iget-object v2, v0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    const-string v3, "SetUserData failed writing to shared preferences"

    invoke-static {v2, v1, v6, v3, v5}, Lcom/ironsource/sdk/controller/WebController;->access$2700(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public setWebviewBackgroundColor(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .line 2100
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0}, Lcom/ironsource/sdk/controller/WebController;->access$600(Lcom/ironsource/sdk/controller/WebController;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setWebviewBackgroundColor("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ironsource/sdk/utils/Logger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 2102
    iget-object v0, p0, Lcom/ironsource/sdk/controller/WebController$NativeAPI;->this$0:Lcom/ironsource/sdk/controller/WebController;

    invoke-static {v0, p1}, Lcom/ironsource/sdk/controller/WebController;->access$4900(Lcom/ironsource/sdk/controller/WebController;Ljava/lang/String;)V

    return-void
.end method
