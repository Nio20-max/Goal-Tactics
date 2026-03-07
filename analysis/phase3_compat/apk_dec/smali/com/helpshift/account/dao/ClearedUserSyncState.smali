.class public final enum Lcom/helpshift/account/dao/ClearedUserSyncState;
.super Ljava/lang/Enum;
.source "ClearedUserSyncState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/account/dao/ClearedUserSyncState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/account/dao/ClearedUserSyncState;

.field public static final enum COMPLETED:Lcom/helpshift/account/dao/ClearedUserSyncState;

.field public static final enum FAILED:Lcom/helpshift/account/dao/ClearedUserSyncState;

.field public static final enum IN_PROGRESS:Lcom/helpshift/account/dao/ClearedUserSyncState;

.field public static final enum NOT_STARTED:Lcom/helpshift/account/dao/ClearedUserSyncState;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 4
    new-instance v0, Lcom/helpshift/account/dao/ClearedUserSyncState;

    const-string v1, "NOT_STARTED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/helpshift/account/dao/ClearedUserSyncState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/helpshift/account/dao/ClearedUserSyncState;->NOT_STARTED:Lcom/helpshift/account/dao/ClearedUserSyncState;

    .line 5
    new-instance v1, Lcom/helpshift/account/dao/ClearedUserSyncState;

    const-string v3, "IN_PROGRESS"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/helpshift/account/dao/ClearedUserSyncState;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/helpshift/account/dao/ClearedUserSyncState;->IN_PROGRESS:Lcom/helpshift/account/dao/ClearedUserSyncState;

    .line 6
    new-instance v3, Lcom/helpshift/account/dao/ClearedUserSyncState;

    const-string v5, "COMPLETED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/helpshift/account/dao/ClearedUserSyncState;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/helpshift/account/dao/ClearedUserSyncState;->COMPLETED:Lcom/helpshift/account/dao/ClearedUserSyncState;

    .line 7
    new-instance v5, Lcom/helpshift/account/dao/ClearedUserSyncState;

    const-string v7, "FAILED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/helpshift/account/dao/ClearedUserSyncState;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/helpshift/account/dao/ClearedUserSyncState;->FAILED:Lcom/helpshift/account/dao/ClearedUserSyncState;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/helpshift/account/dao/ClearedUserSyncState;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 3
    sput-object v7, Lcom/helpshift/account/dao/ClearedUserSyncState;->$VALUES:[Lcom/helpshift/account/dao/ClearedUserSyncState;

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

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/account/dao/ClearedUserSyncState;
    .locals 1

    .line 3
    const-class v0, Lcom/helpshift/account/dao/ClearedUserSyncState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/account/dao/ClearedUserSyncState;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/account/dao/ClearedUserSyncState;
    .locals 1

    .line 3
    sget-object v0, Lcom/helpshift/account/dao/ClearedUserSyncState;->$VALUES:[Lcom/helpshift/account/dao/ClearedUserSyncState;

    invoke-virtual {v0}, [Lcom/helpshift/account/dao/ClearedUserSyncState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/account/dao/ClearedUserSyncState;

    return-object v0
.end method
