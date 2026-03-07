.class public final enum Lcom/helpshift/support/conversations/messages/MessageViewType;
.super Ljava/lang/Enum;
.source "MessageViewType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/support/conversations/messages/MessageViewType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum ACTION_CARD_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum ADMIN_ATTACHMENT_GENERIC:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum ADMIN_ATTACHMENT_IMAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum ADMIN_CSAT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum ADMIN_REDACTED_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum ADMIN_REQUEST_ATTACHMENT:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum ADMIN_SUGGESTIONS_LIST:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum ADMIN_TEXT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum AGENT_TYPING_FOOTER:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum CONFIRMATION_REJECTED:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum CONVERSATION_FOOTER:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum HISTORY_LOADING_VIEW:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum REQUESTED_APP_REVIEW:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum REQUEST_FOR_REOPEN:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum SYSTEM_CONVERSATION_REDACTED_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum SYSTEM_DATE:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum SYSTEM_DIVIDER:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum SYSTEM_PUBLISH_ID:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum USER_ATTACHMENT_GENERIC:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum USER_REDACTED_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum USER_RSP_CSAT_BOT:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum USER_SCREENSHOT_ATTACHMENT:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum USER_SELECTABLE_OPTION:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum USER_SMART_INTENT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

.field public static final enum USER_TEXT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;


# instance fields
.field public final key:I


# direct methods
.method static constructor <clinit>()V
    .locals 28

    .line 4
    new-instance v0, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v1, "USER_TEXT_MESSAGE"

    const/4 v2, 0x0

    const/16 v3, 0xa

    invoke-direct {v0, v1, v2, v3}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_TEXT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 5
    new-instance v1, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v4, "ADMIN_TEXT_MESSAGE"

    const/4 v5, 0x1

    const/16 v6, 0x14

    invoke-direct {v1, v4, v5, v6}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_TEXT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 6
    new-instance v4, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v7, "USER_SCREENSHOT_ATTACHMENT"

    const/4 v8, 0x2

    const/16 v9, 0x1e

    invoke-direct {v4, v7, v8, v9}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_SCREENSHOT_ATTACHMENT:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 7
    new-instance v7, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v9, "ADMIN_ATTACHMENT_IMAGE"

    const/4 v10, 0x3

    const/16 v11, 0x28

    invoke-direct {v7, v9, v10, v11}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_ATTACHMENT_IMAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 8
    new-instance v9, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v11, "ADMIN_ATTACHMENT_GENERIC"

    const/4 v12, 0x4

    const/16 v13, 0x32

    invoke-direct {v9, v11, v12, v13}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_ATTACHMENT_GENERIC:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 9
    new-instance v11, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v13, "ADMIN_REQUEST_ATTACHMENT"

    const/4 v14, 0x5

    const/16 v15, 0x3c

    invoke-direct {v11, v13, v14, v15}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_REQUEST_ATTACHMENT:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 10
    new-instance v13, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "REQUESTED_APP_REVIEW"

    const/4 v14, 0x6

    const/16 v12, 0x46

    invoke-direct {v13, v15, v14, v12}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v13, Lcom/helpshift/support/conversations/messages/MessageViewType;->REQUESTED_APP_REVIEW:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 11
    new-instance v12, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "REQUEST_FOR_REOPEN"

    const/4 v14, 0x7

    const/16 v10, 0x50

    invoke-direct {v12, v15, v14, v10}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v12, Lcom/helpshift/support/conversations/messages/MessageViewType;->REQUEST_FOR_REOPEN:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 12
    new-instance v10, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "CONFIRMATION_REJECTED"

    const/16 v14, 0x8

    const/16 v8, 0x5a

    invoke-direct {v10, v15, v14, v8}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v10, Lcom/helpshift/support/conversations/messages/MessageViewType;->CONFIRMATION_REJECTED:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 13
    new-instance v8, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "CONVERSATION_FOOTER"

    const/16 v14, 0x9

    const/16 v5, 0x64

    invoke-direct {v8, v15, v14, v5}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v8, Lcom/helpshift/support/conversations/messages/MessageViewType;->CONVERSATION_FOOTER:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 14
    new-instance v5, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "AGENT_TYPING_FOOTER"

    const/16 v14, 0x6e

    invoke-direct {v5, v15, v3, v14}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/helpshift/support/conversations/messages/MessageViewType;->AGENT_TYPING_FOOTER:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 15
    new-instance v14, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "SYSTEM_DATE"

    const/16 v3, 0xb

    const/16 v2, 0x78

    invoke-direct {v14, v15, v3, v2}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v14, Lcom/helpshift/support/conversations/messages/MessageViewType;->SYSTEM_DATE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 16
    new-instance v2, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "SYSTEM_DIVIDER"

    const/16 v3, 0xc

    const/16 v6, 0x82

    invoke-direct {v2, v15, v3, v6}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/helpshift/support/conversations/messages/MessageViewType;->SYSTEM_DIVIDER:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 17
    new-instance v6, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "USER_SELECTABLE_OPTION"

    const/16 v3, 0xd

    move-object/from16 v16, v2

    const/16 v2, 0x8c

    invoke-direct {v6, v15, v3, v2}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_SELECTABLE_OPTION:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 18
    new-instance v2, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "ADMIN_SUGGESTIONS_LIST"

    const/16 v3, 0xe

    move-object/from16 v17, v6

    const/16 v6, 0x96

    invoke-direct {v2, v15, v3, v6}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_SUGGESTIONS_LIST:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 19
    new-instance v6, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "SYSTEM_PUBLISH_ID"

    const/16 v3, 0xf

    move-object/from16 v18, v2

    const/16 v2, 0xa0

    invoke-direct {v6, v15, v3, v2}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/helpshift/support/conversations/messages/MessageViewType;->SYSTEM_PUBLISH_ID:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 20
    new-instance v2, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "SYSTEM_CONVERSATION_REDACTED_MESSAGE"

    const/16 v3, 0x10

    move-object/from16 v19, v6

    const/16 v6, 0xaa

    invoke-direct {v2, v15, v3, v6}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/helpshift/support/conversations/messages/MessageViewType;->SYSTEM_CONVERSATION_REDACTED_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 21
    new-instance v6, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "HISTORY_LOADING_VIEW"

    const/16 v3, 0x11

    move-object/from16 v20, v2

    const/16 v2, 0xb4

    invoke-direct {v6, v15, v3, v2}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/helpshift/support/conversations/messages/MessageViewType;->HISTORY_LOADING_VIEW:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 22
    new-instance v2, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "ADMIN_REDACTED_MESSAGE"

    const/16 v3, 0x12

    move-object/from16 v21, v6

    const/16 v6, 0xbe

    invoke-direct {v2, v15, v3, v6}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_REDACTED_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 23
    new-instance v6, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "USER_REDACTED_MESSAGE"

    const/16 v3, 0x13

    move-object/from16 v22, v2

    const/16 v2, 0xc8

    invoke-direct {v6, v15, v3, v2}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v6, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_REDACTED_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 24
    new-instance v2, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v15, "USER_ATTACHMENT_GENERIC"

    const/16 v3, 0xd2

    move-object/from16 v23, v6

    const/16 v6, 0x14

    invoke-direct {v2, v15, v6, v3}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_ATTACHMENT_GENERIC:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 25
    new-instance v3, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v6, "ACTION_CARD_MESSAGE"

    const/16 v15, 0x15

    move-object/from16 v24, v2

    const/16 v2, 0xdc

    invoke-direct {v3, v6, v15, v2}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/helpshift/support/conversations/messages/MessageViewType;->ACTION_CARD_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 26
    new-instance v2, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v6, "USER_SMART_INTENT_MESSAGE"

    const/16 v15, 0x16

    move-object/from16 v25, v3

    const/16 v3, 0xe6

    invoke-direct {v2, v6, v15, v3}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_SMART_INTENT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 27
    new-instance v3, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v6, "ADMIN_CSAT_MESSAGE"

    const/16 v15, 0x17

    move-object/from16 v26, v2

    const/16 v2, 0xf0

    invoke-direct {v3, v6, v15, v2}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/helpshift/support/conversations/messages/MessageViewType;->ADMIN_CSAT_MESSAGE:Lcom/helpshift/support/conversations/messages/MessageViewType;

    .line 28
    new-instance v2, Lcom/helpshift/support/conversations/messages/MessageViewType;

    const-string v6, "USER_RSP_CSAT_BOT"

    const/16 v15, 0x18

    move-object/from16 v27, v3

    const/16 v3, 0xfa

    invoke-direct {v2, v6, v15, v3}, Lcom/helpshift/support/conversations/messages/MessageViewType;-><init>(Ljava/lang/String;II)V

    sput-object v2, Lcom/helpshift/support/conversations/messages/MessageViewType;->USER_RSP_CSAT_BOT:Lcom/helpshift/support/conversations/messages/MessageViewType;

    const/16 v3, 0x19

    new-array v3, v3, [Lcom/helpshift/support/conversations/messages/MessageViewType;

    const/4 v6, 0x0

    aput-object v0, v3, v6

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v4, v3, v0

    const/4 v0, 0x3

    aput-object v7, v3, v0

    const/4 v0, 0x4

    aput-object v9, v3, v0

    const/4 v0, 0x5

    aput-object v11, v3, v0

    const/4 v0, 0x6

    aput-object v13, v3, v0

    const/4 v0, 0x7

    aput-object v12, v3, v0

    const/16 v0, 0x8

    aput-object v10, v3, v0

    const/16 v0, 0x9

    aput-object v8, v3, v0

    const/16 v0, 0xa

    aput-object v5, v3, v0

    const/16 v0, 0xb

    aput-object v14, v3, v0

    const/16 v0, 0xc

    aput-object v16, v3, v0

    const/16 v0, 0xd

    aput-object v17, v3, v0

    const/16 v0, 0xe

    aput-object v18, v3, v0

    const/16 v0, 0xf

    aput-object v19, v3, v0

    const/16 v0, 0x10

    aput-object v20, v3, v0

    const/16 v0, 0x11

    aput-object v21, v3, v0

    const/16 v0, 0x12

    aput-object v22, v3, v0

    const/16 v0, 0x13

    aput-object v23, v3, v0

    const/16 v0, 0x14

    aput-object v24, v3, v0

    const/16 v0, 0x15

    aput-object v25, v3, v0

    const/16 v0, 0x16

    aput-object v26, v3, v0

    const/16 v0, 0x17

    aput-object v27, v3, v0

    const/16 v0, 0x18

    aput-object v2, v3, v0

    .line 3
    sput-object v3, Lcom/helpshift/support/conversations/messages/MessageViewType;->$VALUES:[Lcom/helpshift/support/conversations/messages/MessageViewType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 34
    iput p3, p0, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    return-void
.end method

.method public static getEnum(I)Lcom/helpshift/support/conversations/messages/MessageViewType;
    .locals 5

    .line 38
    invoke-static {}, Lcom/helpshift/support/conversations/messages/MessageViewType;->values()[Lcom/helpshift/support/conversations/messages/MessageViewType;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 39
    iget v4, v3, Lcom/helpshift/support/conversations/messages/MessageViewType;->key:I

    if-ne v4, p0, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/support/conversations/messages/MessageViewType;
    .locals 1

    .line 3
    const-class v0, Lcom/helpshift/support/conversations/messages/MessageViewType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/support/conversations/messages/MessageViewType;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/support/conversations/messages/MessageViewType;
    .locals 1

    .line 3
    sget-object v0, Lcom/helpshift/support/conversations/messages/MessageViewType;->$VALUES:[Lcom/helpshift/support/conversations/messages/MessageViewType;

    invoke-virtual {v0}, [Lcom/helpshift/support/conversations/messages/MessageViewType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/support/conversations/messages/MessageViewType;

    return-object v0
.end method
