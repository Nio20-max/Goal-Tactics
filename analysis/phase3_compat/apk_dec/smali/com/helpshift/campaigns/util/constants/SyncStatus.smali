.class public Lcom/helpshift/campaigns/util/constants/SyncStatus;
.super Ljava/lang/Object;
.source "SyncStatus.java"


# static fields
.field public static final SYNCED:Ljava/lang/Integer;

.field public static final SYNCING:Ljava/lang/Integer;

.field public static final UNSYNCED:Ljava/lang/Integer;

.field public static final valueSet:Ljava/util/HashSet;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    .line 7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/helpshift/campaigns/util/constants/SyncStatus;->UNSYNCED:Ljava/lang/Integer;

    const/4 v0, 0x1

    .line 8
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCED:Ljava/lang/Integer;

    const/4 v0, 0x2

    .line 9
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/helpshift/campaigns/util/constants/SyncStatus;->SYNCING:Ljava/lang/Integer;

    .line 10
    invoke-static {}, Lcom/helpshift/campaigns/util/constants/SyncStatus;->initializeValueSet()Ljava/util/HashSet;

    move-result-object v0

    sput-object v0, Lcom/helpshift/campaigns/util/constants/SyncStatus;->valueSet:Ljava/util/HashSet;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static initializeValueSet()Ljava/util/HashSet;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 16
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    const/4 v1, 0x0

    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    .line 18
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x2

    .line 19
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
