.class public final enum Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;
.super Ljava/lang/Enum;
.source "IronSource.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ironsource/mediationsdk/IronSource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AD_UNIT"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

.field public static final enum BANNER:Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

.field public static final enum INTERSTITIAL:Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

.field public static final enum OFFERWALL:Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

.field public static final enum REWARDED_VIDEO:Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;


# instance fields
.field private mValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 30
    new-instance v0, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    const-string v1, "REWARDED_VIDEO"

    const/4 v2, 0x0

    const-string v3, "rewardedVideo"

    invoke-direct {v0, v1, v2, v3}, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;->REWARDED_VIDEO:Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    .line 31
    new-instance v1, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    const-string v3, "INTERSTITIAL"

    const/4 v4, 0x1

    const-string v5, "interstitial"

    invoke-direct {v1, v3, v4, v5}, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;->INTERSTITIAL:Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    .line 32
    new-instance v3, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    const-string v5, "OFFERWALL"

    const/4 v6, 0x2

    const-string v7, "offerwall"

    invoke-direct {v3, v5, v6, v7}, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;->OFFERWALL:Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    .line 33
    new-instance v5, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    const-string v7, "BANNER"

    const/4 v8, 0x3

    const-string v9, "banner"

    invoke-direct {v5, v7, v8, v9}, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;->BANNER:Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 29
    sput-object v7, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;->$VALUES:[Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 37
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 38
    iput-object p3, p0, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;->mValue:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;
    .locals 1

    .line 29
    const-class v0, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    return-object p0
.end method

.method public static values()[Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;
    .locals 1

    .line 29
    sget-object v0, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;->$VALUES:[Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    invoke-virtual {v0}, [Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/ironsource/mediationsdk/IronSource$AD_UNIT;->mValue:Ljava/lang/String;

    return-object v0
.end method
