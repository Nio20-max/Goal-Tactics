.class public final enum Lcom/ironsource/sdk/data/SSAEnums$ProductType;
.super Ljava/lang/Enum;
.source "SSAEnums.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ironsource/sdk/data/SSAEnums;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ProductType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ironsource/sdk/data/SSAEnums$ProductType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ironsource/sdk/data/SSAEnums$ProductType;

.field public static final enum Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

.field public static final enum Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

.field public static final enum OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

.field public static final enum OfferWallCredits:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

.field public static final enum RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 25
    new-instance v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    const-string v1, "Banner"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Banner:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    .line 26
    new-instance v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    const-string v3, "OfferWall"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWall:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    .line 27
    new-instance v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    const-string v5, "Interstitial"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->Interstitial:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    .line 28
    new-instance v5, Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    const-string v7, "OfferWallCredits"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->OfferWallCredits:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    .line 29
    new-instance v7, Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    const-string v9, "RewardedVideo"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/ironsource/sdk/data/SSAEnums$ProductType;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->RewardedVideo:Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    const/4 v9, 0x5

    new-array v9, v9, [Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    .line 23
    sput-object v9, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->$VALUES:[Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ironsource/sdk/data/SSAEnums$ProductType;
    .locals 1

    .line 23
    const-class v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    return-object p0
.end method

.method public static values()[Lcom/ironsource/sdk/data/SSAEnums$ProductType;
    .locals 1

    .line 23
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ProductType;->$VALUES:[Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    invoke-virtual {v0}, [Lcom/ironsource/sdk/data/SSAEnums$ProductType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ironsource/sdk/data/SSAEnums$ProductType;

    return-object v0
.end method
