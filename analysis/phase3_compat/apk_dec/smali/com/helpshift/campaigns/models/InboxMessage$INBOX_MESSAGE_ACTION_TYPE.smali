.class public final enum Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;
.super Ljava/lang/Enum;
.source "InboxMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/campaigns/models/InboxMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "INBOX_MESSAGE_ACTION_TYPE"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

.field public static final enum OPEN_DEEP_LINK:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

.field public static final enum SHOW_ALERT_TO_RATE_APP:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

.field public static final enum SHOW_CONVERSATION:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

.field public static final enum SHOW_FAQS:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

.field public static final enum SHOW_FAQ_SECTION:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

.field public static final enum SHOW_SINGLE_FAQ:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

.field public static final enum UNKNOWN:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 198
    new-instance v0, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->UNKNOWN:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    .line 199
    new-instance v1, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    const-string v3, "OPEN_DEEP_LINK"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->OPEN_DEEP_LINK:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    .line 200
    new-instance v3, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    const-string v5, "SHOW_FAQS"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->SHOW_FAQS:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    .line 201
    new-instance v5, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    const-string v7, "SHOW_FAQ_SECTION"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->SHOW_FAQ_SECTION:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    .line 202
    new-instance v7, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    const-string v9, "SHOW_CONVERSATION"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->SHOW_CONVERSATION:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    .line 203
    new-instance v9, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    const-string v11, "SHOW_SINGLE_FAQ"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->SHOW_SINGLE_FAQ:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    .line 204
    new-instance v11, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    const-string v13, "SHOW_ALERT_TO_RATE_APP"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->SHOW_ALERT_TO_RATE_APP:Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    const/4 v13, 0x7

    new-array v13, v13, [Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    .line 197
    sput-object v13, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->$VALUES:[Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 197
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;
    .locals 1

    .line 197
    const-class v0, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;
    .locals 1

    .line 197
    sget-object v0, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->$VALUES:[Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    invoke-virtual {v0}, [Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    return-object v0
.end method
