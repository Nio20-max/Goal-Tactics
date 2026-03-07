.class final enum Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;
.super Ljava/lang/Enum;
.source "ProgIsManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ironsource/mediationsdk/ProgIsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "MEDIATION_STATE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

.field public static final enum STATE_AUCTION:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

.field public static final enum STATE_LOADING_SMASHES:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

.field public static final enum STATE_NOT_INITIALIZED:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

.field public static final enum STATE_READY_TO_LOAD:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

.field public static final enum STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

.field public static final enum STATE_SHOWING:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 831
    new-instance v0, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    const-string v1, "STATE_NOT_INITIALIZED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_NOT_INITIALIZED:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    .line 832
    new-instance v1, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    const-string v3, "STATE_READY_TO_LOAD"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_READY_TO_LOAD:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    .line 833
    new-instance v3, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    const-string v5, "STATE_AUCTION"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_AUCTION:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    .line 834
    new-instance v5, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    const-string v7, "STATE_LOADING_SMASHES"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_LOADING_SMASHES:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    .line 835
    new-instance v7, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    const-string v9, "STATE_READY_TO_SHOW"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_READY_TO_SHOW:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    .line 836
    new-instance v9, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    const-string v11, "STATE_SHOWING"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->STATE_SHOWING:Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    const/4 v11, 0x6

    new-array v11, v11, [Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    aput-object v0, v11, v2

    aput-object v1, v11, v4

    aput-object v3, v11, v6

    aput-object v5, v11, v8

    aput-object v7, v11, v10

    aput-object v9, v11, v12

    .line 830
    sput-object v11, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->$VALUES:[Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 830
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;
    .locals 1

    .line 830
    const-class v0, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    return-object p0
.end method

.method public static values()[Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;
    .locals 1

    .line 830
    sget-object v0, Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->$VALUES:[Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    invoke-virtual {v0}, [Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/ironsource/mediationsdk/ProgIsManager$MEDIATION_STATE;

    return-object v0
.end method
