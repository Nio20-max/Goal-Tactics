.class public final enum Lcom/ironsource/sdk/data/SSAEnums$ControllerState;
.super Ljava/lang/Enum;
.source "SSAEnums.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ironsource/sdk/data/SSAEnums;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ControllerState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ironsource/sdk/data/SSAEnums$ControllerState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

.field public static final enum Failed:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

.field public static final enum Loaded:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

.field public static final enum None:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

.field public static final enum Ready:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 44
    new-instance v0, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    const-string v1, "None"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;->None:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    .line 45
    new-instance v1, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    const-string v3, "Loaded"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;->Loaded:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    .line 46
    new-instance v3, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    const-string v5, "Ready"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;->Ready:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    .line 47
    new-instance v5, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    const-string v7, "Failed"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;->Failed:Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 43
    sput-object v7, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;->$VALUES:[Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 43
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ironsource/sdk/data/SSAEnums$ControllerState;
    .locals 1

    .line 43
    const-class v0, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    return-object p0
.end method

.method public static values()[Lcom/ironsource/sdk/data/SSAEnums$ControllerState;
    .locals 1

    .line 43
    sget-object v0, Lcom/ironsource/sdk/data/SSAEnums$ControllerState;->$VALUES:[Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    invoke-virtual {v0}, [Lcom/ironsource/sdk/data/SSAEnums$ControllerState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ironsource/sdk/data/SSAEnums$ControllerState;

    return-object v0
.end method
