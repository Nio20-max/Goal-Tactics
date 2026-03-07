.class Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;
.super Ljava/lang/Object;
.source "OMIDManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ironsource/sdk/analytics/omid/OMIDManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "OMIDOptions"
.end annotation


# static fields
.field private static final CUSTOM_REFERENCE_DATA:Ljava/lang/String; = "customReferenceData"

.field private static final IMPRESSION_OWNER:Ljava/lang/String; = "impressionOwner"

.field private static final ISOLATE_VERIFICATION_SCRIPTS:Ljava/lang/String; = "isolateVerificationScripts"

.field private static final VIDEO_EVENTS_OWNER:Ljava/lang/String; = "videoEventsOwner"


# instance fields
.field public customReferenceData:Ljava/lang/String;

.field public impressionOwner:Lcom/iab/omid/library/ironsrc/adsession/Owner;

.field public isolateVerificationScripts:Z

.field public videoEventsOwner:Lcom/iab/omid/library/ironsrc/adsession/Owner;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createFromJSON(Lorg/json/JSONObject;)Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 53
    new-instance v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;

    invoke-direct {v0}, Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;-><init>()V

    const-string v1, "isolateVerificationScripts"

    const/4 v2, 0x0

    .line 55
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;->isolateVerificationScripts:Z

    const-string v1, "impressionOwner"

    const-string v3, ""

    .line 56
    invoke-virtual {p0, v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 57
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v5, 0x1

    if-nez v4, :cond_1

    .line 61
    :try_start_0
    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/iab/omid/library/ironsrc/adsession/Owner;->valueOf(Ljava/lang/String;)Lcom/iab/omid/library/ironsrc/adsession/Owner;

    move-result-object v4

    iput-object v4, v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;->impressionOwner:Lcom/iab/omid/library/ironsrc/adsession/Owner;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    const-string v4, "videoEventsOwner"

    .line 66
    invoke-virtual {p0, v4, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 67
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 71
    :try_start_1
    invoke-virtual {v4}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/iab/omid/library/ironsrc/adsession/Owner;->valueOf(Ljava/lang/String;)Lcom/iab/omid/library/ironsrc/adsession/Owner;

    move-result-object v1

    iput-object v1, v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;->videoEventsOwner:Lcom/iab/omid/library/ironsrc/adsession/Owner;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    const-string v1, "customReferenceData"

    .line 75
    invoke-virtual {p0, v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    iput-object p0, v0, Lcom/ironsource/sdk/analytics/omid/OMIDManager$OMIDOptions;->customReferenceData:Ljava/lang/String;

    return-object v0

    .line 73
    :catch_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-array v0, v5, [Ljava/lang/Object;

    aput-object v4, v0, v2

    const-string v1, "%s | Invalid OMID videoEventsOwner"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 68
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-array v0, v5, [Ljava/lang/Object;

    aput-object v4, v0, v2

    const-string v1, "Missing OMID videoEventsOwner"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 63
    :catch_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-array v0, v5, [Ljava/lang/Object;

    aput-object v1, v0, v2

    const-string v1, "%s | Invalid OMID impressionOwner"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 58
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-array v0, v5, [Ljava/lang/Object;

    aput-object v1, v0, v2

    const-string v1, "Missing OMID impressionOwner"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
