.class public final enum Lcom/appsflyer/internal/bu;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/appsflyer/internal/bu;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AFInAppEventType:Lcom/appsflyer/internal/bu;

.field public static final enum AFKeystoreWrapper:Lcom/appsflyer/internal/bu;

.field public static final enum valueOf:Lcom/appsflyer/internal/bu;

.field private static final synthetic values:[Lcom/appsflyer/internal/bu;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 7
    new-instance v0, Lcom/appsflyer/internal/bu;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/appsflyer/internal/bu;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/appsflyer/internal/bu;->AFKeystoreWrapper:Lcom/appsflyer/internal/bu;

    .line 11
    new-instance v1, Lcom/appsflyer/internal/bu;

    const-string v3, "USE_CACHED"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/appsflyer/internal/bu;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/appsflyer/internal/bu;->valueOf:Lcom/appsflyer/internal/bu;

    .line 15
    new-instance v3, Lcom/appsflyer/internal/bu;

    const-string v5, "FAILURE"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/appsflyer/internal/bu;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/appsflyer/internal/bu;->AFInAppEventType:Lcom/appsflyer/internal/bu;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/appsflyer/internal/bu;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    .line 3
    sput-object v5, Lcom/appsflyer/internal/bu;->values:[Lcom/appsflyer/internal/bu;

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

.method public static valueOf(Ljava/lang/String;)Lcom/appsflyer/internal/bu;
    .locals 1

    .line 3
    const-class v0, Lcom/appsflyer/internal/bu;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/internal/bu;

    return-object p0
.end method

.method public static values()[Lcom/appsflyer/internal/bu;
    .locals 1

    .line 3
    sget-object v0, Lcom/appsflyer/internal/bu;->values:[Lcom/appsflyer/internal/bu;

    invoke-virtual {v0}, [Lcom/appsflyer/internal/bu;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/appsflyer/internal/bu;

    return-object v0
.end method
