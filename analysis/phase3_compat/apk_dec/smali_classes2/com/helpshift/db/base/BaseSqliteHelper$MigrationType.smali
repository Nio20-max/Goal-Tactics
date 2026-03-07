.class public final enum Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;
.super Ljava/lang/Enum;
.source "BaseSqliteHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/db/base/BaseSqliteHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MigrationType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

.field public static final enum DOWNGRADE:Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

.field public static final enum UPGRADE:Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 24
    new-instance v0, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    const-string v1, "UPGRADE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;->UPGRADE:Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    .line 25
    new-instance v1, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    const-string v3, "DOWNGRADE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;->DOWNGRADE:Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    .line 23
    sput-object v3, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;->$VALUES:[Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

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

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;
    .locals 1

    .line 23
    const-class v0, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;
    .locals 1

    .line 23
    sget-object v0, Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;->$VALUES:[Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    invoke-virtual {v0}, [Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/db/base/BaseSqliteHelper$MigrationType;

    return-object v0
.end method
