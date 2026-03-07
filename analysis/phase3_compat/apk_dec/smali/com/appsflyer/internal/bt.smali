.class public final enum Lcom/appsflyer/internal/bt;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/appsflyer/internal/bt;",
        ">;"
    }
.end annotation


# static fields
.field private static enum AFInAppEventParameterName:Lcom/appsflyer/internal/bt;

.field private static enum AFInAppEventType:Lcom/appsflyer/internal/bt;

.field public static final enum AFKeystoreWrapper:Lcom/appsflyer/internal/bt;

.field private static enum AFLogger$LogLevel:Lcom/appsflyer/internal/bt;

.field private static enum AFVersionDeclaration:Lcom/appsflyer/internal/bt;

.field private static enum AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/bt;

.field private static enum getLevel:Lcom/appsflyer/internal/bt;

.field private static enum init:Lcom/appsflyer/internal/bt;

.field private static enum onAppOpenAttribution:Lcom/appsflyer/internal/bt;

.field private static enum onAppOpenAttributionNative:Lcom/appsflyer/internal/bt;

.field private static enum onAttributionFailureNative:Lcom/appsflyer/internal/bt;

.field private static final synthetic onConversionDataFail:[Lcom/appsflyer/internal/bt;

.field private static enum onConversionDataSuccess:Lcom/appsflyer/internal/bt;

.field private static enum onDeepLinkingNative:Lcom/appsflyer/internal/bt;

.field private static enum onInstallConversionDataLoadedNative:Lcom/appsflyer/internal/bt;

.field private static enum onInstallConversionFailureNative:Lcom/appsflyer/internal/bt;

.field private static enum onResponseErrorNative:Lcom/appsflyer/internal/bt;

.field private static enum onResponseNative:Lcom/appsflyer/internal/bt;

.field private static enum values:Lcom/appsflyer/internal/bt;


# instance fields
.field public final valueOf:I


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 10
    new-instance v0, Lcom/appsflyer/internal/bt;

    const-string v1, "RC_CDN"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/appsflyer/internal/bt;->AFKeystoreWrapper:Lcom/appsflyer/internal/bt;

    .line 11
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "LOAD_CACHE"

    const/4 v5, 0x2

    invoke-direct {v1, v4, v3, v5}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->AFInAppEventParameterName:Lcom/appsflyer/internal/bt;

    .line 12
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "CACHED_EVENT"

    invoke-direct {v1, v4, v5, v5}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->AFInAppEventType:Lcom/appsflyer/internal/bt;

    .line 13
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "CONVERSION"

    const/4 v6, 0x3

    invoke-direct {v1, v4, v6, v5}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->values:Lcom/appsflyer/internal/bt;

    .line 14
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "ONELINK"

    const/4 v7, 0x4

    invoke-direct {v1, v4, v7, v5}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/bt;

    .line 15
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "DLSDK"

    const/4 v8, 0x5

    invoke-direct {v1, v4, v8, v5}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->init:Lcom/appsflyer/internal/bt;

    .line 16
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "ATTR"

    const/4 v9, 0x6

    invoke-direct {v1, v4, v9, v5}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->getLevel:Lcom/appsflyer/internal/bt;

    .line 18
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "GCDSDK"

    const/4 v10, 0x7

    invoke-direct {v1, v4, v10, v6}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->AFVersionDeclaration:Lcom/appsflyer/internal/bt;

    .line 19
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "REGISTER"

    const/16 v11, 0x8

    invoke-direct {v1, v4, v11, v7}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->AFLogger$LogLevel:Lcom/appsflyer/internal/bt;

    .line 20
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "LAUNCH"

    const/16 v12, 0x9

    invoke-direct {v1, v4, v12, v7}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->onInstallConversionFailureNative:Lcom/appsflyer/internal/bt;

    .line 21
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "INAPP"

    const/16 v13, 0xa

    invoke-direct {v1, v4, v13, v7}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->onAttributionFailureNative:Lcom/appsflyer/internal/bt;

    .line 22
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "PURCHASE_VALIDATE"

    const/16 v14, 0xb

    invoke-direct {v1, v4, v14, v7}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->onDeepLinkingNative:Lcom/appsflyer/internal/bt;

    .line 23
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "SDK_SERVICES"

    const/16 v15, 0xc

    invoke-direct {v1, v4, v15, v7}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->onAppOpenAttributionNative:Lcom/appsflyer/internal/bt;

    .line 24
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "STATS"

    const/16 v15, 0xd

    invoke-direct {v1, v4, v15, v7}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->onInstallConversionDataLoadedNative:Lcom/appsflyer/internal/bt;

    .line 25
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "IMPRESSIONS"

    const/16 v15, 0xe

    invoke-direct {v1, v4, v15, v7}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->onConversionDataSuccess:Lcom/appsflyer/internal/bt;

    .line 26
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "MONITORSDK"

    const/16 v15, 0xf

    invoke-direct {v1, v4, v15, v7}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->onResponseNative:Lcom/appsflyer/internal/bt;

    .line 27
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "ARS_VALIDATE"

    const/16 v15, 0x10

    invoke-direct {v1, v4, v15, v7}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->onResponseErrorNative:Lcom/appsflyer/internal/bt;

    .line 28
    new-instance v1, Lcom/appsflyer/internal/bt;

    const-string v4, "ADREVENUE"

    const/16 v15, 0x11

    invoke-direct {v1, v4, v15, v7}, Lcom/appsflyer/internal/bt;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/appsflyer/internal/bt;->onAppOpenAttribution:Lcom/appsflyer/internal/bt;

    const/16 v4, 0x12

    new-array v4, v4, [Lcom/appsflyer/internal/bt;

    aput-object v0, v4, v2

    .line 9
    sget-object v0, Lcom/appsflyer/internal/bt;->AFInAppEventParameterName:Lcom/appsflyer/internal/bt;

    aput-object v0, v4, v3

    sget-object v0, Lcom/appsflyer/internal/bt;->AFInAppEventType:Lcom/appsflyer/internal/bt;

    aput-object v0, v4, v5

    sget-object v0, Lcom/appsflyer/internal/bt;->values:Lcom/appsflyer/internal/bt;

    aput-object v0, v4, v6

    sget-object v0, Lcom/appsflyer/internal/bt;->AppsFlyer2dXConversionCallback:Lcom/appsflyer/internal/bt;

    aput-object v0, v4, v7

    sget-object v0, Lcom/appsflyer/internal/bt;->init:Lcom/appsflyer/internal/bt;

    aput-object v0, v4, v8

    sget-object v0, Lcom/appsflyer/internal/bt;->getLevel:Lcom/appsflyer/internal/bt;

    aput-object v0, v4, v9

    sget-object v0, Lcom/appsflyer/internal/bt;->AFVersionDeclaration:Lcom/appsflyer/internal/bt;

    aput-object v0, v4, v10

    sget-object v0, Lcom/appsflyer/internal/bt;->AFLogger$LogLevel:Lcom/appsflyer/internal/bt;

    aput-object v0, v4, v11

    sget-object v0, Lcom/appsflyer/internal/bt;->onInstallConversionFailureNative:Lcom/appsflyer/internal/bt;

    aput-object v0, v4, v12

    sget-object v0, Lcom/appsflyer/internal/bt;->onAttributionFailureNative:Lcom/appsflyer/internal/bt;

    aput-object v0, v4, v13

    sget-object v0, Lcom/appsflyer/internal/bt;->onDeepLinkingNative:Lcom/appsflyer/internal/bt;

    aput-object v0, v4, v14

    sget-object v0, Lcom/appsflyer/internal/bt;->onAppOpenAttributionNative:Lcom/appsflyer/internal/bt;

    const/16 v2, 0xc

    aput-object v0, v4, v2

    sget-object v0, Lcom/appsflyer/internal/bt;->onInstallConversionDataLoadedNative:Lcom/appsflyer/internal/bt;

    const/16 v2, 0xd

    aput-object v0, v4, v2

    sget-object v0, Lcom/appsflyer/internal/bt;->onConversionDataSuccess:Lcom/appsflyer/internal/bt;

    const/16 v2, 0xe

    aput-object v0, v4, v2

    sget-object v0, Lcom/appsflyer/internal/bt;->onResponseNative:Lcom/appsflyer/internal/bt;

    const/16 v2, 0xf

    aput-object v0, v4, v2

    sget-object v0, Lcom/appsflyer/internal/bt;->onResponseErrorNative:Lcom/appsflyer/internal/bt;

    const/16 v2, 0x10

    aput-object v0, v4, v2

    aput-object v1, v4, v15

    sput-object v4, Lcom/appsflyer/internal/bt;->onConversionDataFail:[Lcom/appsflyer/internal/bt;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 37
    iput p3, p0, Lcom/appsflyer/internal/bt;->valueOf:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/appsflyer/internal/bt;
    .locals 1

    .line 9
    const-class v0, Lcom/appsflyer/internal/bt;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/internal/bt;

    return-object p0
.end method

.method public static values()[Lcom/appsflyer/internal/bt;
    .locals 1

    .line 9
    sget-object v0, Lcom/appsflyer/internal/bt;->onConversionDataFail:[Lcom/appsflyer/internal/bt;

    invoke-virtual {v0}, [Lcom/appsflyer/internal/bt;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/appsflyer/internal/bt;

    return-object v0
.end method
