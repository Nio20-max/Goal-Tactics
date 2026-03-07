.class public final enum Lcom/appsflyer/internal/b$b;
.super Ljava/lang/Enum;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/appsflyer/internal/b$b;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum AFInAppEventParameterName:Lcom/appsflyer/internal/b$b;

.field public static final enum AFKeystoreWrapper:Lcom/appsflyer/internal/b$b;

.field private static final synthetic values:[Lcom/appsflyer/internal/b$b;


# instance fields
.field public valueOf:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 281
    new-instance v0, Lcom/appsflyer/internal/b$b;

    const-string v1, "XPOSED"

    const/4 v2, 0x0

    const-string/jumbo v3, "xps"

    invoke-direct {v0, v1, v2, v3}, Lcom/appsflyer/internal/b$b;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/appsflyer/internal/b$b;->AFKeystoreWrapper:Lcom/appsflyer/internal/b$b;

    new-instance v1, Lcom/appsflyer/internal/b$b;

    const-string v3, "FRIDA"

    const/4 v4, 0x1

    const-string v5, "frd"

    invoke-direct {v1, v3, v4, v5}, Lcom/appsflyer/internal/b$b;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/appsflyer/internal/b$b;->AFInAppEventParameterName:Lcom/appsflyer/internal/b$b;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/appsflyer/internal/b$b;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    .line 280
    sput-object v3, Lcom/appsflyer/internal/b$b;->values:[Lcom/appsflyer/internal/b$b;

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

    .line 285
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 286
    iput-object p3, p0, Lcom/appsflyer/internal/b$b;->valueOf:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/appsflyer/internal/b$b;
    .locals 1

    .line 280
    const-class v0, Lcom/appsflyer/internal/b$b;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/appsflyer/internal/b$b;

    return-object p0
.end method

.method public static values()[Lcom/appsflyer/internal/b$b;
    .locals 1

    .line 280
    sget-object v0, Lcom/appsflyer/internal/b$b;->values:[Lcom/appsflyer/internal/b$b;

    invoke-virtual {v0}, [Lcom/appsflyer/internal/b$b;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/appsflyer/internal/b$b;

    return-object v0
.end method
