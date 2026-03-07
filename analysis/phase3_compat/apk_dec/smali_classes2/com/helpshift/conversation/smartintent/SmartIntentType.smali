.class public final enum Lcom/helpshift/conversation/smartintent/SmartIntentType;
.super Ljava/lang/Enum;
.source "SmartIntentType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/conversation/smartintent/SmartIntentType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/conversation/smartintent/SmartIntentType;

.field public static final enum LEAF_INTENT:Lcom/helpshift/conversation/smartintent/SmartIntentType;

.field public static final enum ROOT_INTENT:Lcom/helpshift/conversation/smartintent/SmartIntentType;

.field public static final enum SEARCH_INTENT:Lcom/helpshift/conversation/smartintent/SmartIntentType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 4
    new-instance v0, Lcom/helpshift/conversation/smartintent/SmartIntentType;

    const-string v1, "ROOT_INTENT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/helpshift/conversation/smartintent/SmartIntentType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/helpshift/conversation/smartintent/SmartIntentType;->ROOT_INTENT:Lcom/helpshift/conversation/smartintent/SmartIntentType;

    .line 5
    new-instance v1, Lcom/helpshift/conversation/smartintent/SmartIntentType;

    const-string v3, "LEAF_INTENT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/helpshift/conversation/smartintent/SmartIntentType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/helpshift/conversation/smartintent/SmartIntentType;->LEAF_INTENT:Lcom/helpshift/conversation/smartintent/SmartIntentType;

    .line 6
    new-instance v3, Lcom/helpshift/conversation/smartintent/SmartIntentType;

    const-string v5, "SEARCH_INTENT"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/helpshift/conversation/smartintent/SmartIntentType;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/helpshift/conversation/smartintent/SmartIntentType;->SEARCH_INTENT:Lcom/helpshift/conversation/smartintent/SmartIntentType;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/helpshift/conversation/smartintent/SmartIntentType;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    .line 3
    sput-object v5, Lcom/helpshift/conversation/smartintent/SmartIntentType;->$VALUES:[Lcom/helpshift/conversation/smartintent/SmartIntentType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/conversation/smartintent/SmartIntentType;
    .locals 1

    .line 3
    const-class v0, Lcom/helpshift/conversation/smartintent/SmartIntentType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/conversation/smartintent/SmartIntentType;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/conversation/smartintent/SmartIntentType;
    .locals 1

    .line 3
    sget-object v0, Lcom/helpshift/conversation/smartintent/SmartIntentType;->$VALUES:[Lcom/helpshift/conversation/smartintent/SmartIntentType;

    invoke-virtual {v0}, [Lcom/helpshift/conversation/smartintent/SmartIntentType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/conversation/smartintent/SmartIntentType;

    return-object v0
.end method
