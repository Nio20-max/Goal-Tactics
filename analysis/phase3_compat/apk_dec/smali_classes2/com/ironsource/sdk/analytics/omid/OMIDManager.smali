.class public Lcom/ironsource/sdk/analytics/omid/OMIDManager;
.super Ljava/lang/Object;
.source "OMIDManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;
    }
.end annotation


# static fields
.field private static final INVALID_OMID_IMPRESSION_OWNER_MESSAGE:Ljava/lang/String; = "%s | Invalid OMID impressionOwner"

.field private static final INVALID_OMID_VIDEO_EVENTS_TYPE_MESSAGE:Ljava/lang/String; = "%s | Invalid OMID videoEventsOwner"

.field private static final MISSING_OMID_IMPRESSION_OWNER_MESSAGE:Ljava/lang/String; = "Missing OMID impressionOwner"

.field private static final MISSING_OMID_VIDEO_EVENTS_OWNER_MESSAGE:Ljava/lang/String; = "Missing OMID videoEventsOwner"

.field private static final OMID_HAS_NOT_BEEN_ACTIVATED_MESSAGE:Ljava/lang/String; = "OMID has not been activated"

.field public static final OMID_PARTNER_NAME:Ljava/lang/String; = "Ironsrc"

.field public static final OMID_PARTNER_NAME_PROPERTY_NAME:Ljava/lang/String; = "omidPartnerName"

.field public static final OMID_PARTNER_VERSION:Ljava/lang/String; = "6"

.field public static final OMID_PARTNER_VERSION_PROPERTY_NAME:Ljava/lang/String; = "omidPartnerVersion"

.field private static final OMID_SESSION_HAS_ALREADY_STARTED_MESSAGE:Ljava/lang/String; = "OMID Session has already started"

.field private static final OMID_SESSION_HAS_NOT_STARTED_MESSAGE:Ljava/lang/String; = "OMID Session has not started"

.field public static final OMID_VERSION_PROPERTY_NAME:Ljava/lang/String; = "omidVersion"

.field private static mAdSession:Lcom/iab/omid/library/ironsrc/adsession/AdSession;

.field private static mIsActivated:Z

.field private static final mPartner:Lcom/iab/omid/library/ironsrc/adsession/Partner;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "Ironsrc"

    const-string v1, "6"

    .line 82
    invoke-static {v0, v1}, Lcom/iab/omid/library/ironsrc/adsession/Partner;->createPartner(Ljava/lang/String;Ljava/lang/String;)Lcom/iab/omid/library/ironsrc/adsession/Partner;

    move-result-object v0

    sput-object v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->mPartner:Lcom/iab/omid/library/ironsrc/adsession/Partner;

    const/4 v0, 0x0

    .line 84
    sput-boolean v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->mIsActivated:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static activate(Landroid/content/Context;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 89
    sget-boolean v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->mIsActivated:Z

    if-nez v0, :cond_0

    .line 91
    invoke-static {}, Lcom/iab/omid/library/ironsrc/Omid;->getVersion()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/iab/omid/library/ironsrc/Omid;->activateWithOmidApiVersion(Ljava/lang/String;Landroid/content/Context;)Z

    move-result p0

    sput-boolean p0, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->mIsActivated:Z

    :cond_0
    return-void
.end method

.method private static assertAdSession()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 140
    sget-boolean v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->mIsActivated:Z

    if-eqz v0, :cond_1

    .line 143
    sget-object v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->mAdSession:Lcom/iab/omid/library/ironsrc/adsession/AdSession;

    if-eqz v0, :cond_0

    return-void

    .line 144
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "OMID Session has not started"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 141
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "OMID has not been activated"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static createSession(Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;Landroid/webkit/WebView;)Lcom/iab/omid/library/ironsrc/adsession/AdSession;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;->impressionOwner:Lcom/iab/omid/library/ironsrc/adsession/Owner;

    iget-object v1, p0, Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;->videoEventsOwner:Lcom/iab/omid/library/ironsrc/adsession/Owner;

    iget-boolean v2, p0, Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;->isolateVerificationScripts:Z

    invoke-static {v0, v1, v2}, Lcom/iab/omid/library/ironsrc/adsession/AdSessionConfiguration;->createAdSessionConfiguration(Lcom/iab/omid/library/ironsrc/adsession/Owner;Lcom/iab/omid/library/ironsrc/adsession/Owner;Z)Lcom/iab/omid/library/ironsrc/adsession/AdSessionConfiguration;

    move-result-object v0

    .line 121
    sget-object v1, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->mPartner:Lcom/iab/omid/library/ironsrc/adsession/Partner;

    iget-object p0, p0, Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;->customReferenceData:Ljava/lang/String;

    invoke-static {v1, p1, p0}, Lcom/iab/omid/library/ironsrc/adsession/AdSessionContext;->createHtmlAdSessionContext(Lcom/iab/omid/library/ironsrc/adsession/Partner;Landroid/webkit/WebView;Ljava/lang/String;)Lcom/iab/omid/library/ironsrc/adsession/AdSessionContext;

    move-result-object p0

    .line 122
    invoke-static {v0, p0}, Lcom/iab/omid/library/ironsrc/adsession/AdSession;->createAdSession(Lcom/iab/omid/library/ironsrc/adsession/AdSessionConfiguration;Lcom/iab/omid/library/ironsrc/adsession/AdSessionContext;)Lcom/iab/omid/library/ironsrc/adsession/AdSession;

    move-result-object p0

    .line 123
    invoke-virtual {p0, p1}, Lcom/iab/omid/library/ironsrc/adsession/AdSession;->registerAdView(Landroid/view/View;)V

    return-object p0
.end method

.method public static finishSession()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 128
    invoke-static {}, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->assertAdSession()V

    .line 129
    sget-object v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->mAdSession:Lcom/iab/omid/library/ironsrc/adsession/AdSession;

    invoke-virtual {v0}, Lcom/iab/omid/library/ironsrc/adsession/AdSession;->finish()V

    const/4 v0, 0x0

    .line 130
    sput-object v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->mAdSession:Lcom/iab/omid/library/ironsrc/adsession/AdSession;

    return-void
.end method

.method public static getOMIDData()Lcom/ironsource/sdk/data/SSAObj;
    .locals 3

    .line 96
    new-instance v0, Lcom/ironsource/sdk/data/SSAObj;

    invoke-direct {v0}, Lcom/ironsource/sdk/data/SSAObj;-><init>()V

    const-string v1, "omidVersion"

    .line 97
    invoke-static {v1}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/iab/omid/library/ironsrc/Omid;->getVersion()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/ironsource/sdk/data/SSAObj;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "omidPartnerName"

    .line 98
    invoke-static {v1}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "Ironsrc"

    invoke-static {v2}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/ironsource/sdk/data/SSAObj;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "omidPartnerVersion"

    .line 99
    invoke-static {v1}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "6"

    invoke-static {v2}, Lcom/ironsource/sdk/utils/SDKUtils;->encodeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/ironsource/sdk/data/SSAObj;->put(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static impressionOccurred()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .line 134
    invoke-static {}, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->assertAdSession()V

    .line 135
    sget-object v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->mAdSession:Lcom/iab/omid/library/ironsrc/adsession/AdSession;

    invoke-static {v0}, Lcom/iab/omid/library/ironsrc/adsession/AdEvents;->createAdEvents(Lcom/iab/omid/library/ironsrc/adsession/AdSession;)Lcom/iab/omid/library/ironsrc/adsession/AdEvents;

    move-result-object v0

    .line 136
    invoke-virtual {v0}, Lcom/iab/omid/library/ironsrc/adsession/AdEvents;->impressionOccurred()V

    return-void
.end method

.method public static startSession(Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;Landroid/webkit/WebView;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 109
    sget-boolean v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->mIsActivated:Z

    if-eqz v0, :cond_1

    .line 112
    sget-object v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->mAdSession:Lcom/iab/omid/library/ironsrc/adsession/AdSession;

    if-nez v0, :cond_0

    .line 115
    invoke-static {p0, p1}, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->createSession(Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;Landroid/webkit/WebView;)Lcom/iab/omid/library/ironsrc/adsession/AdSession;

    move-result-object p0

    sput-object p0, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->mAdSession:Lcom/iab/omid/library/ironsrc/adsession/AdSession;

    .line 116
    invoke-virtual {p0}, Lcom/iab/omid/library/ironsrc/adsession/AdSession;->start()V

    return-void

    .line 113
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "OMID Session has already started"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 110
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "OMID has not been activated"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static startSession(Lorg/json/JSONObject;Landroid/webkit/WebView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 104
    invoke-static {p0}, Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;->createFromJSON(Lorg/json/JSONObject;)Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;

    move-result-object p0

    .line 105
    invoke-static {p0, p1}, Lcom/ironsource/sdk/analytics/omid/OMIDManager;->startSession(Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;Landroid/webkit/WebView;)V

    return-void
.end method
