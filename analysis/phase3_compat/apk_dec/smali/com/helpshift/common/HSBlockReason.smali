.class public final enum Lcom/helpshift/common/HSBlockReason;
.super Ljava/lang/Enum;
.source "HSBlockReason.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/common/HSBlockReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/common/HSBlockReason;

.field public static final enum FETCH_ACTIVE_USER_ERROR:Lcom/helpshift/common/HSBlockReason;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 4
    new-instance v0, Lcom/helpshift/common/HSBlockReason;

    const-string v1, "FETCH_ACTIVE_USER_ERROR"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/helpshift/common/HSBlockReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/helpshift/common/HSBlockReason;->FETCH_ACTIVE_USER_ERROR:Lcom/helpshift/common/HSBlockReason;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/helpshift/common/HSBlockReason;

    aput-object v0, v1, v2

    .line 3
    sput-object v1, Lcom/helpshift/common/HSBlockReason;->$VALUES:[Lcom/helpshift/common/HSBlockReason;

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

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/common/HSBlockReason;
    .locals 1

    .line 3
    const-class v0, Lcom/helpshift/common/HSBlockReason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/common/HSBlockReason;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/common/HSBlockReason;
    .locals 1

    .line 3
    sget-object v0, Lcom/helpshift/common/HSBlockReason;->$VALUES:[Lcom/helpshift/common/HSBlockReason;

    invoke-virtual {v0}, [Lcom/helpshift/common/HSBlockReason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/common/HSBlockReason;

    return-object v0
.end method
