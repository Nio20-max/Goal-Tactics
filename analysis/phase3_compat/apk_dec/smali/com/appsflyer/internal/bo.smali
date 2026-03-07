.class public final enum Lcom/appsflyer/internal/bo;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/appsflyer/internal/bo;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AFInAppEventParameterName:Lcom/appsflyer/internal/bo;

.field public static final enum AFKeystoreWrapper:Lcom/appsflyer/internal/bo;

.field public static final enum valueOf:Lcom/appsflyer/internal/bo;

.field private static final synthetic values:[Lcom/appsflyer/internal/bo;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 4
    new-instance v0, Lcom/appsflyer/internal/bo;

    const-string v1, "SUCCESS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/appsflyer/internal/bo;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/appsflyer/internal/bo;->AFKeystoreWrapper:Lcom/appsflyer/internal/bo;

    new-instance v1, Lcom/appsflyer/internal/bo;

    const-string v3, "FAILURE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/appsflyer/internal/bo;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/appsflyer/internal/bo;->AFInAppEventParameterName:Lcom/appsflyer/internal/bo;

    new-instance v3, Lcom/appsflyer/internal/bo;

    const-string v5, "TIMEOUT"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/appsflyer/internal/bo;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/appsflyer/internal/bo;->valueOf:Lcom/appsflyer/internal/bo;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/appsflyer/internal/bo;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    .line 3
    sput-object v5, Lcom/appsflyer/internal/bo;->values:[Lcom/appsflyer/internal/bo;

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

.method public static valueOf(Ljava/lang/String;)Lcom/appsflyer/internal/bo;
    .locals 1

    .line 3
    const-class v0, Lcom/appsflyer/internal/bo;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/internal/bo;

    return-object p0
.end method

.method public static values()[Lcom/appsflyer/internal/bo;
    .locals 1

    .line 3
    sget-object v0, Lcom/appsflyer/internal/bo;->values:[Lcom/appsflyer/internal/bo;

    invoke-virtual {v0}, [Lcom/appsflyer/internal/bo;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/appsflyer/internal/bo;

    return-object v0
.end method
