.class public final enum Lcom/helpshift/logger/constants/LogLevel;
.super Ljava/lang/Enum;
.source "LogLevel.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/logger/constants/LogLevel;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/logger/constants/LogLevel;

.field public static final enum DEBUG:Lcom/helpshift/logger/constants/LogLevel;

.field public static final enum ERROR:Lcom/helpshift/logger/constants/LogLevel;

.field public static final enum FATAL:Lcom/helpshift/logger/constants/LogLevel;

.field public static final enum OFF:Lcom/helpshift/logger/constants/LogLevel;

.field public static final enum WARN:Lcom/helpshift/logger/constants/LogLevel;


# instance fields
.field value:I


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 14
    new-instance v0, Lcom/helpshift/logger/constants/LogLevel;

    const-string v1, "OFF"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/helpshift/logger/constants/LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/helpshift/logger/constants/LogLevel;->OFF:Lcom/helpshift/logger/constants/LogLevel;

    .line 15
    new-instance v1, Lcom/helpshift/logger/constants/LogLevel;

    const-string v3, "FATAL"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/helpshift/logger/constants/LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/helpshift/logger/constants/LogLevel;->FATAL:Lcom/helpshift/logger/constants/LogLevel;

    .line 16
    new-instance v3, Lcom/helpshift/logger/constants/LogLevel;

    const-string v5, "ERROR"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/helpshift/logger/constants/LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/helpshift/logger/constants/LogLevel;->ERROR:Lcom/helpshift/logger/constants/LogLevel;

    .line 17
    new-instance v5, Lcom/helpshift/logger/constants/LogLevel;

    const-string v7, "WARN"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lcom/helpshift/logger/constants/LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/helpshift/logger/constants/LogLevel;->WARN:Lcom/helpshift/logger/constants/LogLevel;

    .line 18
    new-instance v7, Lcom/helpshift/logger/constants/LogLevel;

    const-string v9, "DEBUG"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v10}, Lcom/helpshift/logger/constants/LogLevel;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/helpshift/logger/constants/LogLevel;->DEBUG:Lcom/helpshift/logger/constants/LogLevel;

    const/4 v9, 0x5

    new-array v9, v9, [Lcom/helpshift/logger/constants/LogLevel;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    .line 12
    sput-object v9, Lcom/helpshift/logger/constants/LogLevel;->$VALUES:[Lcom/helpshift/logger/constants/LogLevel;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 22
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 23
    iput p3, p0, Lcom/helpshift/logger/constants/LogLevel;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/logger/constants/LogLevel;
    .locals 1

    .line 12
    const-class v0, Lcom/helpshift/logger/constants/LogLevel;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/logger/constants/LogLevel;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/logger/constants/LogLevel;
    .locals 1

    .line 12
    sget-object v0, Lcom/helpshift/logger/constants/LogLevel;->$VALUES:[Lcom/helpshift/logger/constants/LogLevel;

    invoke-virtual {v0}, [Lcom/helpshift/logger/constants/LogLevel;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/logger/constants/LogLevel;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .line 27
    iget v0, p0, Lcom/helpshift/logger/constants/LogLevel;->value:I

    return v0
.end method
