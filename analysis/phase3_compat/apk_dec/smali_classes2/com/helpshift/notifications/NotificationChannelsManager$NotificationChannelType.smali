.class public final enum Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;
.super Ljava/lang/Enum;
.source "NotificationChannelsManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/notifications/NotificationChannelsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NotificationChannelType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;

.field public static final enum CAMPAIGN:Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;

.field public static final enum SUPPORT:Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 148
    new-instance v0, Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;

    const-string v1, "SUPPORT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;->SUPPORT:Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;

    .line 149
    new-instance v1, Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;

    const-string v3, "CAMPAIGN"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;->CAMPAIGN:Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;

    const/4 v3, 0x2

    new-array v3, v3, [Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;

    aput-object v0, v3, v2

    aput-object v1, v3, v4

    .line 147
    sput-object v3, Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;->$VALUES:[Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 147
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;
    .locals 1

    .line 147
    const-class v0, Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;
    .locals 1

    .line 147
    sget-object v0, Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;->$VALUES:[Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;

    invoke-virtual {v0}, [Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/notifications/NotificationChannelsManager$NotificationChannelType;

    return-object v0
.end method
