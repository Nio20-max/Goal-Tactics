.class public final enum Lcom/appsflyer/internal/ch;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/appsflyer/internal/ch;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AFInAppEventParameterName:Lcom/appsflyer/internal/ch;

.field public static final enum AFInAppEventType:Lcom/appsflyer/internal/ch;

.field public static final enum AFKeystoreWrapper:Lcom/appsflyer/internal/ch;

.field private static final synthetic valueOf:[Lcom/appsflyer/internal/ch;

.field public static final enum values:Lcom/appsflyer/internal/ch;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 4
    new-instance v0, Lcom/appsflyer/internal/ch;

    const-string v1, "onReceive"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/appsflyer/internal/ch;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/appsflyer/internal/ch;->AFInAppEventType:Lcom/appsflyer/internal/ch;

    .line 5
    new-instance v1, Lcom/appsflyer/internal/ch;

    const-string v3, "logSession"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/appsflyer/internal/ch;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/appsflyer/internal/ch;->values:Lcom/appsflyer/internal/ch;

    .line 6
    new-instance v3, Lcom/appsflyer/internal/ch;

    const-string v5, "logEvent"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/appsflyer/internal/ch;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/appsflyer/internal/ch;->AFInAppEventParameterName:Lcom/appsflyer/internal/ch;

    .line 7
    new-instance v5, Lcom/appsflyer/internal/ch;

    const-string v7, "setCustomerIdAndLogSession"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/appsflyer/internal/ch;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/appsflyer/internal/ch;->AFKeystoreWrapper:Lcom/appsflyer/internal/ch;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/appsflyer/internal/ch;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 3
    sput-object v7, Lcom/appsflyer/internal/ch;->valueOf:[Lcom/appsflyer/internal/ch;

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

.method public static valueOf(Ljava/lang/String;)Lcom/appsflyer/internal/ch;
    .locals 1

    .line 3
    const-class v0, Lcom/appsflyer/internal/ch;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/internal/ch;

    return-object p0
.end method

.method public static values()[Lcom/appsflyer/internal/ch;
    .locals 1

    .line 3
    sget-object v0, Lcom/appsflyer/internal/ch;->valueOf:[Lcom/appsflyer/internal/ch;

    invoke-virtual {v0}, [Lcom/appsflyer/internal/ch;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/appsflyer/internal/ch;

    return-object v0
.end method
