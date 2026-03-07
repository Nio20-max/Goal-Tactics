.class public Lcom/helpshift/xamarin/support/HelpshiftSupport;
.super Ljava/lang/Object;
.source "HelpshiftSupport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_XamSupport"

.field private static xamarinDelegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;
    .locals 1

    .line 41
    sget-object v0, Lcom/helpshift/xamarin/support/HelpshiftSupport;->xamarinDelegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    return-object v0
.end method

.method public static checkIfConversationActive()V
    .locals 2

    .line 311
    sget-object v0, Lcom/helpshift/xamarin/support/HelpshiftSupport;->xamarinDelegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    if-eqz v0, :cond_0

    .line 312
    invoke-static {}, Lcom/helpshift/support/Support;->isConversationActive()Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->didCheckIfConversationActive(Z)V

    :cond_0
    return-void
.end method

.method public static clearBreadCrumbs()V
    .locals 0

    .line 72
    invoke-static {}, Lcom/helpshift/support/Support;->clearBreadCrumbs()V

    return-void
.end method

.method public static getDelegate()Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;
    .locals 1

    .line 175
    sget-object v0, Lcom/helpshift/xamarin/support/HelpshiftSupport;->xamarinDelegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    return-object v0
.end method

.method public static getNotificationCount(Z)Ljava/lang/Integer;
    .locals 2

    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getNotificationCount : isAsync "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_XamSupport"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p0, :cond_0

    .line 51
    invoke-static {}, Lcom/helpshift/xamarin/support/HelpshiftSupport;->getRequestUnreadMessagesCountHandler()Landroid/os/Handler;

    move-result-object p0

    .line 52
    invoke-static {p0, p0}, Lcom/helpshift/support/Support;->getNotificationCount(Landroid/os/Handler;Landroid/os/Handler;)V

    const/4 p0, 0x0

    goto :goto_0

    .line 54
    :cond_0
    invoke-static {}, Lcom/helpshift/support/Support;->getNotificationCount()Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    .line 56
    :goto_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static getNotificationCount(Landroid/os/Handler;Landroid/os/Handler;)V
    .locals 0

    .line 60
    invoke-static {p0, p1}, Lcom/helpshift/support/Support;->getNotificationCount(Landroid/os/Handler;Landroid/os/Handler;)V

    return-void
.end method

.method private static getRequestUnreadMessagesCountHandler()Landroid/os/Handler;
    .locals 1

    .line 339
    new-instance v0, Lcom/helpshift/xamarin/support/HelpshiftSupport$5;

    invoke-direct {v0}, Lcom/helpshift/xamarin/support/HelpshiftSupport$5;-><init>()V

    return-object v0
.end method

.method public static isConversationActive()Z
    .locals 1

    .line 307
    invoke-static {}, Lcom/helpshift/support/Support;->isConversationActive()Z

    move-result v0

    return v0
.end method

.method public static leaveBreadCrumb(Ljava/lang/String;)V
    .locals 0

    .line 68
    invoke-static {p0}, Lcom/helpshift/support/Support;->leaveBreadCrumb(Ljava/lang/String;)V

    return-void
.end method

.method public static requestUnreadMessagesCount(Z)V
    .locals 1

    .line 319
    sget-object v0, Lcom/helpshift/xamarin/support/HelpshiftSupport;->xamarinDelegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-nez p0, :cond_1

    .line 325
    invoke-static {}, Lcom/helpshift/support/Support;->getNotificationCount()Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-interface {v0, p0}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->didReceiveUnreadMessagesCount(I)V

    return-void

    .line 331
    :cond_1
    invoke-static {}, Lcom/helpshift/xamarin/support/HelpshiftSupport;->getRequestUnreadMessagesCountHandler()Landroid/os/Handler;

    move-result-object p0

    .line 332
    invoke-static {p0, p0}, Lcom/helpshift/support/Support;->getNotificationCount(Landroid/os/Handler;Landroid/os/Handler;)V

    return-void
.end method

.method public static setDelegate(Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;)V
    .locals 3

    .line 179
    new-instance v0, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;

    invoke-direct {v0, p0}, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;-><init>(Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;)V

    .line 252
    sput-object p0, Lcom/helpshift/xamarin/support/HelpshiftSupport;->xamarinDelegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    .line 253
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setDelegate : register Support.Delegate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " for delegating calls to Delegate "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "Helpshift_XamSupport"

    invoke-static {v1, p0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 254
    invoke-static {v0}, Lcom/helpshift/support/Support;->setDelegate(Lcom/helpshift/support/Support$Delegate;)V

    return-void
.end method

.method public static setMetaData(Ljava/lang/String;)V
    .locals 7

    const-string v0, "hs-tags"

    .line 272
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setMetaData : jsonMetaData - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Helpshift_XamSupport"

    invoke-static {v2, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p0, :cond_4

    .line 273
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    goto/16 :goto_1

    .line 278
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 279
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    .line 280
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 281
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 282
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_2

    .line 283
    invoke-virtual {p0, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_1

    const-string v6, "null"

    .line 284
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 285
    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 289
    :cond_2
    invoke-static {v1}, Lcom/helpshift/util/HSJSONUtils;->toMap(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object p0

    .line 290
    invoke-static {v0}, Lcom/helpshift/util/HSJSONUtils;->toList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    new-array v1, v3, [Ljava/lang/String;

    .line 293
    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, [Ljava/lang/String;

    .line 297
    :cond_3
    new-instance v0, Lcom/helpshift/xamarin/support/XamarinMetaDataCallable;

    invoke-direct {v0, p0, v1}, Lcom/helpshift/xamarin/support/XamarinMetaDataCallable;-><init>(Ljava/util/Map;[Ljava/lang/String;)V

    .line 298
    invoke-static {v0}, Lcom/helpshift/support/Support;->setMetadataCallback(Lcom/helpshift/support/MetadataCallable;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 302
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setMetaData : Error setting meta data : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :catch_1
    move-exception p0

    .line 300
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setMetaData: Exception in processing tags "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    :goto_1
    return-void
.end method

.method public static setMetadata(Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;)V
    .locals 1

    .line 262
    invoke-static {p0}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildMetadata(Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;)Lcom/helpshift/support/Metadata;

    move-result-object p0

    .line 263
    new-instance v0, Lcom/helpshift/xamarin/support/HelpshiftSupport$4;

    invoke-direct {v0, p0}, Lcom/helpshift/xamarin/support/HelpshiftSupport$4;-><init>(Lcom/helpshift/support/Metadata;)V

    invoke-static {v0}, Lcom/helpshift/support/Support;->setMetadataCallback(Lcom/helpshift/support/MetadataCallable;)V

    return-void
.end method

.method public static setMetadataCallback(Lcom/helpshift/xamarin/support/HelpshiftCallable;)V
    .locals 3

    .line 153
    new-instance v0, Lcom/helpshift/xamarin/support/HelpshiftSupport$1;

    invoke-direct {v0, p0}, Lcom/helpshift/xamarin/support/HelpshiftSupport$1;-><init>(Lcom/helpshift/xamarin/support/HelpshiftCallable;)V

    .line 159
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setMetadataCallback : register Callable "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " for delegating calls to HelpshiftCallable "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v1, "Helpshift_XamSupport"

    invoke-static {v1, p0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    invoke-static {v0}, Lcom/helpshift/support/Support;->setMetadataCallback(Lcom/helpshift/support/Callable;)V

    return-void
.end method

.method public static setSDKLanguage(Ljava/lang/String;)V
    .locals 0

    .line 258
    invoke-static {p0}, Lcom/helpshift/support/Support;->setSDKLanguage(Ljava/lang/String;)V

    return-void
.end method

.method public static setUserIdentifier(Ljava/lang/String;)V
    .locals 0

    .line 64
    invoke-static {p0}, Lcom/helpshift/support/Support;->setUserIdentifier(Ljava/lang/String;)V

    return-void
.end method

.method public static showAlertToRateApp(Ljava/lang/String;Lcom/helpshift/xamarin/listeners/HelpshiftAlertToRateAppListener;)V
    .locals 3

    .line 164
    new-instance v0, Lcom/helpshift/xamarin/support/HelpshiftSupport$2;

    invoke-direct {v0, p1}, Lcom/helpshift/xamarin/support/HelpshiftSupport$2;-><init>(Lcom/helpshift/xamarin/listeners/HelpshiftAlertToRateAppListener;)V

    .line 170
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "showAlertToRateApp : register AlertToRateAppListener "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " for delegating calls to HelpshiftAlertToRateAppListener "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "Helpshift_XamSupport"

    invoke-static {v1, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    invoke-static {p0, v0}, Lcom/helpshift/support/Support;->showAlertToRateApp(Ljava/lang/String;Lcom/helpshift/support/AlertToRateAppListener;)V

    return-void
.end method

.method public static showConversation(Landroid/app/Activity;)V
    .locals 0

    .line 76
    invoke-static {p0}, Lcom/helpshift/support/Support;->showConversation(Landroid/app/Activity;)V

    return-void
.end method

.method public static showConversation(Landroid/app/Activity;Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)V
    .locals 0

    .line 86
    invoke-static {p1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildApiConfig(Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)Lcom/helpshift/support/ApiConfig;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/helpshift/support/Support;->showConversation(Landroid/app/Activity;Lcom/helpshift/support/ApiConfig;)V

    return-void
.end method

.method public static showConversation(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "showConversation : jsonConfig - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_XamSupport"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->parseConfigDictionary(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    .line 82
    invoke-static {p0, p1}, Lcom/helpshift/support/Support;->showConversation(Landroid/app/Activity;Ljava/util/Map;)V

    return-void
.end method

.method public static showDynamicForm(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "showDynamicForm : jsonFlowsString - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_XamSupport"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    :try_start_0
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 135
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    .line 136
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 137
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 138
    invoke-static {v3}, Lcom/helpshift/util/HSJSONUtils;->toMap(Lorg/json/JSONObject;)Ljava/util/HashMap;

    move-result-object v3

    .line 139
    invoke-interface {p2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 141
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->parseFlowList(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/helpshift/support/Support;->showDynamicForm(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "showDynamicForm : JSON Exception in parsing dynamic form data :"

    .line 143
    invoke-static {v1, p1, p0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method

.method public static showDynamicForm(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/xamarin/flows/Flow;",
            ">;)V"
        }
    .end annotation

    .line 149
    invoke-static {p2}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildFlows(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/helpshift/support/Support;->showDynamicForm(Landroid/app/Activity;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static showFAQSection(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .line 90
    invoke-static {p0, p1}, Lcom/helpshift/support/Support;->showFAQSection(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method public static showFAQSection(Landroid/app/Activity;Ljava/lang/String;Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)V
    .locals 0

    .line 100
    invoke-static {p2}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildApiConfig(Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)Lcom/helpshift/support/ApiConfig;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/helpshift/support/Support;->showFAQSection(Landroid/app/Activity;Ljava/lang/String;Lcom/helpshift/support/ApiConfig;)V

    return-void
.end method

.method public static showFAQSection(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 94
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "showFAQSection : sectionPublishId - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\njsonConfig - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_XamSupport"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->parseConfigDictionary(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;

    move-result-object p2

    .line 96
    invoke-static {p0, p1, p2}, Lcom/helpshift/support/Support;->showFAQSection(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static showFAQs(Landroid/app/Activity;)V
    .locals 0

    .line 118
    invoke-static {p0}, Lcom/helpshift/support/Support;->showFAQs(Landroid/app/Activity;)V

    return-void
.end method

.method public static showFAQs(Landroid/app/Activity;Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)V
    .locals 0

    .line 128
    invoke-static {p1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildApiConfig(Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)Lcom/helpshift/support/ApiConfig;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/helpshift/support/Support;->showFAQs(Landroid/app/Activity;Lcom/helpshift/support/ApiConfig;)V

    return-void
.end method

.method public static showFAQs(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 122
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "showFAQs : jsonConfig - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_XamSupport"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->parseConfigDictionary(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    .line 124
    invoke-static {p0, p1}, Lcom/helpshift/support/Support;->showFAQs(Landroid/app/Activity;Ljava/util/Map;)V

    return-void
.end method

.method public static showSingleFAQ(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .line 104
    invoke-static {p0, p1}, Lcom/helpshift/support/Support;->showSingleFAQ(Landroid/app/Activity;Ljava/lang/String;)V

    return-void
.end method

.method public static showSingleFAQ(Landroid/app/Activity;Ljava/lang/String;Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)V
    .locals 0

    .line 114
    invoke-static {p2}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->buildApiConfig(Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;)Lcom/helpshift/support/ApiConfig;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/helpshift/support/Support;->showSingleFAQ(Landroid/app/Activity;Ljava/lang/String;Lcom/helpshift/support/ApiConfig;)V

    return-void
.end method

.method public static showSingleFAQ(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "showSingleFAQ : questionPublishId - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\njsonConfig - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_XamSupport"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/helpshift/xamarin/util/ConfigParserUtil;->parseConfigDictionary(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Map;

    move-result-object p2

    .line 110
    invoke-static {p0, p1, p2}, Lcom/helpshift/support/Support;->showSingleFAQ(Landroid/app/Activity;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
