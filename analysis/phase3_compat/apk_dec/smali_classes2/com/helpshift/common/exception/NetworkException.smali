.class public final enum Lcom/helpshift/common/exception/NetworkException;
.super Ljava/lang/Enum;
.source "NetworkException.java"

# interfaces
.implements Lcom/helpshift/common/exception/ExceptionType;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/common/exception/NetworkException;",
        ">;",
        "Lcom/helpshift/common/exception/ExceptionType;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/common/exception/NetworkException;

.field public static final enum AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum CONTENT_NOT_FOUND:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum CONTENT_UNCHANGED:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum CONVERSATION_ARCHIVED:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum CONVERSATION_REOPEN_EXPIRED:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum CSAT_EXPIRED:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum ENTITY_TOO_LARGE_RETRIES_EXHAUSTED:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum GENERIC:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum NON_RETRIABLE:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum NO_CONNECTION:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum SCREENSHOT_UPLOAD_ERROR:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum SSL_HANDSHAKE:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum SSL_PEER_UNVERIFIED:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum TIMESTAMP_CORRECTION_RETRIES_EXHAUSTED:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum UNABLE_TO_GENERATE_SIGNATURE:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum UNHANDLED_STATUS_CODE:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum UNKNOWN_HOST:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum UNSUPPORTED_ENCODING_EXCEPTION:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum UNSUPPORTED_MIME_TYPE:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum USER_NOT_FOUND:Lcom/helpshift/common/exception/NetworkException;

.field public static final enum USER_PRE_CONDITION_FAILED:Lcom/helpshift/common/exception/NetworkException;


# instance fields
.field public route:Ljava/lang/String;

.field public serverStatusCode:I


# direct methods
.method static constructor <clinit>()V
    .locals 25

    .line 4
    new-instance v0, Lcom/helpshift/common/exception/NetworkException;

    const-string v1, "GENERIC"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/helpshift/common/exception/NetworkException;->GENERIC:Lcom/helpshift/common/exception/NetworkException;

    .line 5
    new-instance v1, Lcom/helpshift/common/exception/NetworkException;

    const-string v3, "NO_CONNECTION"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/helpshift/common/exception/NetworkException;->NO_CONNECTION:Lcom/helpshift/common/exception/NetworkException;

    .line 6
    new-instance v3, Lcom/helpshift/common/exception/NetworkException;

    const-string v5, "UNKNOWN_HOST"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/helpshift/common/exception/NetworkException;->UNKNOWN_HOST:Lcom/helpshift/common/exception/NetworkException;

    .line 7
    new-instance v5, Lcom/helpshift/common/exception/NetworkException;

    const-string v7, "SSL_PEER_UNVERIFIED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/helpshift/common/exception/NetworkException;->SSL_PEER_UNVERIFIED:Lcom/helpshift/common/exception/NetworkException;

    .line 8
    new-instance v7, Lcom/helpshift/common/exception/NetworkException;

    const-string v9, "SSL_HANDSHAKE"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/helpshift/common/exception/NetworkException;->SSL_HANDSHAKE:Lcom/helpshift/common/exception/NetworkException;

    .line 9
    new-instance v9, Lcom/helpshift/common/exception/NetworkException;

    const-string v11, "UNHANDLED_STATUS_CODE"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/helpshift/common/exception/NetworkException;->UNHANDLED_STATUS_CODE:Lcom/helpshift/common/exception/NetworkException;

    .line 10
    new-instance v11, Lcom/helpshift/common/exception/NetworkException;

    const-string v13, "TIMESTAMP_CORRECTION_RETRIES_EXHAUSTED"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/helpshift/common/exception/NetworkException;->TIMESTAMP_CORRECTION_RETRIES_EXHAUSTED:Lcom/helpshift/common/exception/NetworkException;

    .line 11
    new-instance v13, Lcom/helpshift/common/exception/NetworkException;

    const-string v15, "ENTITY_TOO_LARGE_RETRIES_EXHAUSTED"

    const/4 v14, 0x7

    invoke-direct {v13, v15, v14}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/helpshift/common/exception/NetworkException;->ENTITY_TOO_LARGE_RETRIES_EXHAUSTED:Lcom/helpshift/common/exception/NetworkException;

    .line 12
    new-instance v15, Lcom/helpshift/common/exception/NetworkException;

    const-string v14, "CONTENT_NOT_FOUND"

    const/16 v12, 0x8

    invoke-direct {v15, v14, v12}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/helpshift/common/exception/NetworkException;->CONTENT_NOT_FOUND:Lcom/helpshift/common/exception/NetworkException;

    .line 13
    new-instance v14, Lcom/helpshift/common/exception/NetworkException;

    const-string v12, "UNSUPPORTED_ENCODING_EXCEPTION"

    const/16 v10, 0x9

    invoke-direct {v14, v12, v10}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v14, Lcom/helpshift/common/exception/NetworkException;->UNSUPPORTED_ENCODING_EXCEPTION:Lcom/helpshift/common/exception/NetworkException;

    .line 14
    new-instance v12, Lcom/helpshift/common/exception/NetworkException;

    const-string v10, "UNABLE_TO_GENERATE_SIGNATURE"

    const/16 v8, 0xa

    invoke-direct {v12, v10, v8}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v12, Lcom/helpshift/common/exception/NetworkException;->UNABLE_TO_GENERATE_SIGNATURE:Lcom/helpshift/common/exception/NetworkException;

    .line 15
    new-instance v10, Lcom/helpshift/common/exception/NetworkException;

    const-string v8, "UNSUPPORTED_MIME_TYPE"

    const/16 v6, 0xb

    invoke-direct {v10, v8, v6}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v10, Lcom/helpshift/common/exception/NetworkException;->UNSUPPORTED_MIME_TYPE:Lcom/helpshift/common/exception/NetworkException;

    .line 16
    new-instance v8, Lcom/helpshift/common/exception/NetworkException;

    const-string v6, "NON_RETRIABLE"

    const/16 v4, 0xc

    invoke-direct {v8, v6, v4}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lcom/helpshift/common/exception/NetworkException;->NON_RETRIABLE:Lcom/helpshift/common/exception/NetworkException;

    .line 17
    new-instance v6, Lcom/helpshift/common/exception/NetworkException;

    const-string v4, "CONVERSATION_ARCHIVED"

    const/16 v2, 0xd

    invoke-direct {v6, v4, v2}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/helpshift/common/exception/NetworkException;->CONVERSATION_ARCHIVED:Lcom/helpshift/common/exception/NetworkException;

    .line 18
    new-instance v4, Lcom/helpshift/common/exception/NetworkException;

    const-string v2, "CONVERSATION_REOPEN_EXPIRED"

    move-object/from16 v17, v6

    const/16 v6, 0xe

    invoke-direct {v4, v2, v6}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/common/exception/NetworkException;->CONVERSATION_REOPEN_EXPIRED:Lcom/helpshift/common/exception/NetworkException;

    .line 19
    new-instance v2, Lcom/helpshift/common/exception/NetworkException;

    const-string v6, "CSAT_EXPIRED"

    move-object/from16 v18, v4

    const/16 v4, 0xf

    invoke-direct {v2, v6, v4}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/common/exception/NetworkException;->CSAT_EXPIRED:Lcom/helpshift/common/exception/NetworkException;

    .line 20
    new-instance v6, Lcom/helpshift/common/exception/NetworkException;

    const-string v4, "SCREENSHOT_UPLOAD_ERROR"

    move-object/from16 v19, v2

    const/16 v2, 0x10

    invoke-direct {v6, v4, v2}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/helpshift/common/exception/NetworkException;->SCREENSHOT_UPLOAD_ERROR:Lcom/helpshift/common/exception/NetworkException;

    .line 21
    new-instance v4, Lcom/helpshift/common/exception/NetworkException;

    const-string v2, "INVALID_AUTH_TOKEN"

    move-object/from16 v20, v6

    const/16 v6, 0x11

    invoke-direct {v4, v2, v6}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/common/exception/NetworkException;->INVALID_AUTH_TOKEN:Lcom/helpshift/common/exception/NetworkException;

    .line 22
    new-instance v2, Lcom/helpshift/common/exception/NetworkException;

    const-string v6, "AUTH_TOKEN_NOT_PROVIDED"

    move-object/from16 v21, v4

    const/16 v4, 0x12

    invoke-direct {v2, v6, v4}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/common/exception/NetworkException;->AUTH_TOKEN_NOT_PROVIDED:Lcom/helpshift/common/exception/NetworkException;

    .line 23
    new-instance v6, Lcom/helpshift/common/exception/NetworkException;

    const-string v4, "USER_PRE_CONDITION_FAILED"

    move-object/from16 v22, v2

    const/16 v2, 0x13

    invoke-direct {v6, v4, v2}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/helpshift/common/exception/NetworkException;->USER_PRE_CONDITION_FAILED:Lcom/helpshift/common/exception/NetworkException;

    .line 24
    new-instance v4, Lcom/helpshift/common/exception/NetworkException;

    const-string v2, "USER_NOT_FOUND"

    move-object/from16 v23, v6

    const/16 v6, 0x14

    invoke-direct {v4, v2, v6}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/common/exception/NetworkException;->USER_NOT_FOUND:Lcom/helpshift/common/exception/NetworkException;

    .line 25
    new-instance v2, Lcom/helpshift/common/exception/NetworkException;

    const-string v6, "CONTENT_UNCHANGED"

    move-object/from16 v24, v4

    const/16 v4, 0x15

    invoke-direct {v2, v6, v4}, Lcom/helpshift/common/exception/NetworkException;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/common/exception/NetworkException;->CONTENT_UNCHANGED:Lcom/helpshift/common/exception/NetworkException;

    const/16 v6, 0x16

    new-array v6, v6, [Lcom/helpshift/common/exception/NetworkException;

    const/16 v16, 0x0

    aput-object v0, v6, v16

    const/4 v0, 0x1

    aput-object v1, v6, v0

    const/4 v0, 0x2

    aput-object v3, v6, v0

    const/4 v0, 0x3

    aput-object v5, v6, v0

    const/4 v0, 0x4

    aput-object v7, v6, v0

    const/4 v0, 0x5

    aput-object v9, v6, v0

    const/4 v0, 0x6

    aput-object v11, v6, v0

    const/4 v0, 0x7

    aput-object v13, v6, v0

    const/16 v0, 0x8

    aput-object v15, v6, v0

    const/16 v0, 0x9

    aput-object v14, v6, v0

    const/16 v0, 0xa

    aput-object v12, v6, v0

    const/16 v0, 0xb

    aput-object v10, v6, v0

    const/16 v0, 0xc

    aput-object v8, v6, v0

    const/16 v0, 0xd

    aput-object v17, v6, v0

    const/16 v0, 0xe

    aput-object v18, v6, v0

    const/16 v0, 0xf

    aput-object v19, v6, v0

    const/16 v0, 0x10

    aput-object v20, v6, v0

    const/16 v0, 0x11

    aput-object v21, v6, v0

    const/16 v0, 0x12

    aput-object v22, v6, v0

    const/16 v0, 0x13

    aput-object v23, v6, v0

    const/16 v0, 0x14

    aput-object v24, v6, v0

    aput-object v2, v6, v4

    .line 3
    sput-object v6, Lcom/helpshift/common/exception/NetworkException;->$VALUES:[Lcom/helpshift/common/exception/NetworkException;

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

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/common/exception/NetworkException;
    .locals 1

    .line 3
    const-class v0, Lcom/helpshift/common/exception/NetworkException;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/common/exception/NetworkException;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/common/exception/NetworkException;
    .locals 1

    .line 3
    sget-object v0, Lcom/helpshift/common/exception/NetworkException;->$VALUES:[Lcom/helpshift/common/exception/NetworkException;

    invoke-virtual {v0}, [Lcom/helpshift/common/exception/NetworkException;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/common/exception/NetworkException;

    return-object v0
.end method
