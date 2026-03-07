.class public final enum Lcom/helpshift/websockets/WebSocketError;
.super Ljava/lang/Enum;
.source "WebSocketError.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/websockets/WebSocketError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/websockets/WebSocketError;

.field public static final enum COMPRESSION_ERROR:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum CONTINUATION_NOT_CLOSED:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum DECOMPRESSION_ERROR:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum EXTENSIONS_CONFLICT:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum EXTENSION_PARSE_ERROR:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum FLUSH_ERROR:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum FRAGMENTED_CONTROL_FRAME:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum FRAME_MASKED:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum HOSTNAME_UNVERIFIED:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum HTTP_HEADER_FAILURE:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum INSUFFICENT_DATA:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum INSUFFICIENT_MEMORY_FOR_PAYLOAD:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum INTERRUPTED_IN_READING:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum INVALID_PAYLOAD_LENGTH:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum IO_ERROR_IN_READING:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum IO_ERROR_IN_WRITING:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum MESSAGE_CONSTRUCTION_ERROR:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum NON_ZERO_RESERVED_BITS:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum NOT_IN_CREATED_STATE:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum NOT_SWITCHING_PROTOCOLS:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum NO_CONNECTION_HEADER:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum NO_MORE_FRAME:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum NO_SEC_WEBSOCKET_ACCEPT_HEADER:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum NO_UPGRADE_HEADER:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum NO_UPGRADE_IN_CONNECTION_HEADER:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum NO_WEBSOCKET_IN_UPGRADE_HEADER:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum OPENING_HAHDSHAKE_REQUEST_FAILURE:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum OPENING_HANDSHAKE_RESPONSE_FAILURE:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum PERMESSAGE_DEFLATE_INVALID_MAX_WINDOW_BITS:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum PERMESSAGE_DEFLATE_UNSUPPORTED_PARAMETER:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum PROXY_HANDSHAKE_ERROR:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum SOCKET_CONNECT_ERROR:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum SOCKET_INPUT_STREAM_FAILURE:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum SOCKET_OUTPUT_STREAM_FAILURE:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum SOCKET_OVERLAY_ERROR:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum SSL_HANDSHAKE_ERROR:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum STATUS_LINE_BAD_FORMAT:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum STATUS_LINE_EMPTY:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum TEXT_MESSAGE_CONSTRUCTION_ERROR:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum TOO_LONG_CONTROL_FRAME_PAYLOAD:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum TOO_LONG_PAYLOAD:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum UNEXPECTED_CONTINUATION_FRAME:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum UNEXPECTED_ERROR_IN_READING_THREAD:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum UNEXPECTED_ERROR_IN_WRITING_THREAD:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum UNEXPECTED_RESERVED_BIT:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum UNEXPECTED_SEC_WEBSOCKET_ACCEPT_HEADER:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum UNKNOWN_OPCODE:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum UNSUPPORTED_EXTENSION:Lcom/helpshift/websockets/WebSocketError;

.field public static final enum UNSUPPORTED_PROTOCOL:Lcom/helpshift/websockets/WebSocketError;


# direct methods
.method static constructor <clinit>()V
    .locals 51

    .line 40
    new-instance v0, Lcom/helpshift/websockets/WebSocketError;

    const-string v1, "NOT_IN_CREATED_STATE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/helpshift/websockets/WebSocketError;->NOT_IN_CREATED_STATE:Lcom/helpshift/websockets/WebSocketError;

    .line 46
    new-instance v1, Lcom/helpshift/websockets/WebSocketError;

    const-string v3, "SOCKET_INPUT_STREAM_FAILURE"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/helpshift/websockets/WebSocketError;->SOCKET_INPUT_STREAM_FAILURE:Lcom/helpshift/websockets/WebSocketError;

    .line 52
    new-instance v3, Lcom/helpshift/websockets/WebSocketError;

    const-string v5, "SOCKET_OUTPUT_STREAM_FAILURE"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/helpshift/websockets/WebSocketError;->SOCKET_OUTPUT_STREAM_FAILURE:Lcom/helpshift/websockets/WebSocketError;

    .line 58
    new-instance v5, Lcom/helpshift/websockets/WebSocketError;

    const-string v7, "OPENING_HAHDSHAKE_REQUEST_FAILURE"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/helpshift/websockets/WebSocketError;->OPENING_HAHDSHAKE_REQUEST_FAILURE:Lcom/helpshift/websockets/WebSocketError;

    .line 64
    new-instance v7, Lcom/helpshift/websockets/WebSocketError;

    const-string v9, "OPENING_HANDSHAKE_RESPONSE_FAILURE"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/helpshift/websockets/WebSocketError;->OPENING_HANDSHAKE_RESPONSE_FAILURE:Lcom/helpshift/websockets/WebSocketError;

    .line 70
    new-instance v9, Lcom/helpshift/websockets/WebSocketError;

    const-string v11, "STATUS_LINE_EMPTY"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v9, Lcom/helpshift/websockets/WebSocketError;->STATUS_LINE_EMPTY:Lcom/helpshift/websockets/WebSocketError;

    .line 76
    new-instance v11, Lcom/helpshift/websockets/WebSocketError;

    const-string v13, "STATUS_LINE_BAD_FORMAT"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v11, Lcom/helpshift/websockets/WebSocketError;->STATUS_LINE_BAD_FORMAT:Lcom/helpshift/websockets/WebSocketError;

    .line 82
    new-instance v13, Lcom/helpshift/websockets/WebSocketError;

    const-string v15, "NOT_SWITCHING_PROTOCOLS"

    const/4 v14, 0x7

    invoke-direct {v13, v15, v14}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v13, Lcom/helpshift/websockets/WebSocketError;->NOT_SWITCHING_PROTOCOLS:Lcom/helpshift/websockets/WebSocketError;

    .line 88
    new-instance v15, Lcom/helpshift/websockets/WebSocketError;

    const-string v14, "HTTP_HEADER_FAILURE"

    const/16 v12, 0x8

    invoke-direct {v15, v14, v12}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v15, Lcom/helpshift/websockets/WebSocketError;->HTTP_HEADER_FAILURE:Lcom/helpshift/websockets/WebSocketError;

    .line 94
    new-instance v14, Lcom/helpshift/websockets/WebSocketError;

    const-string v12, "NO_UPGRADE_HEADER"

    const/16 v10, 0x9

    invoke-direct {v14, v12, v10}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v14, Lcom/helpshift/websockets/WebSocketError;->NO_UPGRADE_HEADER:Lcom/helpshift/websockets/WebSocketError;

    .line 100
    new-instance v12, Lcom/helpshift/websockets/WebSocketError;

    const-string v10, "NO_WEBSOCKET_IN_UPGRADE_HEADER"

    const/16 v8, 0xa

    invoke-direct {v12, v10, v8}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v12, Lcom/helpshift/websockets/WebSocketError;->NO_WEBSOCKET_IN_UPGRADE_HEADER:Lcom/helpshift/websockets/WebSocketError;

    .line 106
    new-instance v10, Lcom/helpshift/websockets/WebSocketError;

    const-string v8, "NO_CONNECTION_HEADER"

    const/16 v6, 0xb

    invoke-direct {v10, v8, v6}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v10, Lcom/helpshift/websockets/WebSocketError;->NO_CONNECTION_HEADER:Lcom/helpshift/websockets/WebSocketError;

    .line 112
    new-instance v8, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "NO_UPGRADE_IN_CONNECTION_HEADER"

    const/16 v4, 0xc

    invoke-direct {v8, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v8, Lcom/helpshift/websockets/WebSocketError;->NO_UPGRADE_IN_CONNECTION_HEADER:Lcom/helpshift/websockets/WebSocketError;

    .line 118
    new-instance v6, Lcom/helpshift/websockets/WebSocketError;

    const-string v4, "NO_SEC_WEBSOCKET_ACCEPT_HEADER"

    const/16 v2, 0xd

    invoke-direct {v6, v4, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/helpshift/websockets/WebSocketError;->NO_SEC_WEBSOCKET_ACCEPT_HEADER:Lcom/helpshift/websockets/WebSocketError;

    .line 124
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v2, "UNEXPECTED_SEC_WEBSOCKET_ACCEPT_HEADER"

    move-object/from16 v16, v6

    const/16 v6, 0xe

    invoke-direct {v4, v2, v6}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->UNEXPECTED_SEC_WEBSOCKET_ACCEPT_HEADER:Lcom/helpshift/websockets/WebSocketError;

    .line 130
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "EXTENSION_PARSE_ERROR"

    move-object/from16 v17, v4

    const/16 v4, 0xf

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->EXTENSION_PARSE_ERROR:Lcom/helpshift/websockets/WebSocketError;

    .line 136
    new-instance v6, Lcom/helpshift/websockets/WebSocketError;

    const-string v4, "UNSUPPORTED_EXTENSION"

    move-object/from16 v18, v2

    const/16 v2, 0x10

    invoke-direct {v6, v4, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/helpshift/websockets/WebSocketError;->UNSUPPORTED_EXTENSION:Lcom/helpshift/websockets/WebSocketError;

    .line 145
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v2, "EXTENSIONS_CONFLICT"

    move-object/from16 v19, v6

    const/16 v6, 0x11

    invoke-direct {v4, v2, v6}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->EXTENSIONS_CONFLICT:Lcom/helpshift/websockets/WebSocketError;

    .line 151
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "UNSUPPORTED_PROTOCOL"

    move-object/from16 v20, v4

    const/16 v4, 0x12

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->UNSUPPORTED_PROTOCOL:Lcom/helpshift/websockets/WebSocketError;

    .line 157
    new-instance v6, Lcom/helpshift/websockets/WebSocketError;

    const-string v4, "INSUFFICENT_DATA"

    move-object/from16 v21, v2

    const/16 v2, 0x13

    invoke-direct {v6, v4, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/helpshift/websockets/WebSocketError;->INSUFFICENT_DATA:Lcom/helpshift/websockets/WebSocketError;

    .line 163
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v2, "INVALID_PAYLOAD_LENGTH"

    move-object/from16 v22, v6

    const/16 v6, 0x14

    invoke-direct {v4, v2, v6}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->INVALID_PAYLOAD_LENGTH:Lcom/helpshift/websockets/WebSocketError;

    .line 169
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "TOO_LONG_PAYLOAD"

    move-object/from16 v23, v4

    const/16 v4, 0x15

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->TOO_LONG_PAYLOAD:Lcom/helpshift/websockets/WebSocketError;

    .line 175
    new-instance v6, Lcom/helpshift/websockets/WebSocketError;

    const-string v4, "INSUFFICIENT_MEMORY_FOR_PAYLOAD"

    move-object/from16 v24, v2

    const/16 v2, 0x16

    invoke-direct {v6, v4, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v6, Lcom/helpshift/websockets/WebSocketError;->INSUFFICIENT_MEMORY_FOR_PAYLOAD:Lcom/helpshift/websockets/WebSocketError;

    .line 181
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v4, "INTERRUPTED_IN_READING"

    move-object/from16 v25, v6

    const/16 v6, 0x17

    invoke-direct {v2, v4, v6}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->INTERRUPTED_IN_READING:Lcom/helpshift/websockets/WebSocketError;

    .line 187
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "IO_ERROR_IN_READING"

    move-object/from16 v26, v2

    const/16 v2, 0x18

    invoke-direct {v4, v6, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->IO_ERROR_IN_READING:Lcom/helpshift/websockets/WebSocketError;

    .line 193
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "IO_ERROR_IN_WRITING"

    move-object/from16 v27, v4

    const/16 v4, 0x19

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->IO_ERROR_IN_WRITING:Lcom/helpshift/websockets/WebSocketError;

    .line 199
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "FLUSH_ERROR"

    move-object/from16 v28, v2

    const/16 v2, 0x1a

    invoke-direct {v4, v6, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->FLUSH_ERROR:Lcom/helpshift/websockets/WebSocketError;

    .line 225
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "NON_ZERO_RESERVED_BITS"

    move-object/from16 v29, v4

    const/16 v4, 0x1b

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->NON_ZERO_RESERVED_BITS:Lcom/helpshift/websockets/WebSocketError;

    .line 249
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "UNEXPECTED_RESERVED_BIT"

    move-object/from16 v30, v2

    const/16 v2, 0x1c

    invoke-direct {v4, v6, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->UNEXPECTED_RESERVED_BIT:Lcom/helpshift/websockets/WebSocketError;

    .line 264
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "FRAME_MASKED"

    move-object/from16 v31, v4

    const/16 v4, 0x1d

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->FRAME_MASKED:Lcom/helpshift/websockets/WebSocketError;

    .line 275
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "UNKNOWN_OPCODE"

    move-object/from16 v32, v2

    const/16 v2, 0x1e

    invoke-direct {v4, v6, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->UNKNOWN_OPCODE:Lcom/helpshift/websockets/WebSocketError;

    .line 290
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "FRAGMENTED_CONTROL_FRAME"

    move-object/from16 v33, v4

    const/16 v4, 0x1f

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->FRAGMENTED_CONTROL_FRAME:Lcom/helpshift/websockets/WebSocketError;

    .line 296
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "UNEXPECTED_CONTINUATION_FRAME"

    move-object/from16 v34, v2

    const/16 v2, 0x20

    invoke-direct {v4, v6, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->UNEXPECTED_CONTINUATION_FRAME:Lcom/helpshift/websockets/WebSocketError;

    .line 302
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "CONTINUATION_NOT_CLOSED"

    move-object/from16 v35, v4

    const/16 v4, 0x21

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->CONTINUATION_NOT_CLOSED:Lcom/helpshift/websockets/WebSocketError;

    .line 317
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "TOO_LONG_CONTROL_FRAME_PAYLOAD"

    move-object/from16 v36, v2

    const/16 v2, 0x22

    invoke-direct {v4, v6, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->TOO_LONG_CONTROL_FRAME_PAYLOAD:Lcom/helpshift/websockets/WebSocketError;

    .line 323
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "MESSAGE_CONSTRUCTION_ERROR"

    move-object/from16 v37, v4

    const/16 v4, 0x23

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->MESSAGE_CONSTRUCTION_ERROR:Lcom/helpshift/websockets/WebSocketError;

    .line 329
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "TEXT_MESSAGE_CONSTRUCTION_ERROR"

    move-object/from16 v38, v2

    const/16 v2, 0x24

    invoke-direct {v4, v6, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->TEXT_MESSAGE_CONSTRUCTION_ERROR:Lcom/helpshift/websockets/WebSocketError;

    .line 336
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "UNEXPECTED_ERROR_IN_READING_THREAD"

    move-object/from16 v39, v4

    const/16 v4, 0x25

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->UNEXPECTED_ERROR_IN_READING_THREAD:Lcom/helpshift/websockets/WebSocketError;

    .line 343
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "UNEXPECTED_ERROR_IN_WRITING_THREAD"

    move-object/from16 v40, v2

    const/16 v2, 0x26

    invoke-direct {v4, v6, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->UNEXPECTED_ERROR_IN_WRITING_THREAD:Lcom/helpshift/websockets/WebSocketError;

    .line 357
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "PERMESSAGE_DEFLATE_UNSUPPORTED_PARAMETER"

    move-object/from16 v41, v4

    const/16 v4, 0x27

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->PERMESSAGE_DEFLATE_UNSUPPORTED_PARAMETER:Lcom/helpshift/websockets/WebSocketError;

    .line 373
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "PERMESSAGE_DEFLATE_INVALID_MAX_WINDOW_BITS"

    move-object/from16 v42, v2

    const/16 v2, 0x28

    invoke-direct {v4, v6, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->PERMESSAGE_DEFLATE_INVALID_MAX_WINDOW_BITS:Lcom/helpshift/websockets/WebSocketError;

    .line 381
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "COMPRESSION_ERROR"

    move-object/from16 v43, v4

    const/16 v4, 0x29

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->COMPRESSION_ERROR:Lcom/helpshift/websockets/WebSocketError;

    .line 389
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "DECOMPRESSION_ERROR"

    move-object/from16 v44, v2

    const/16 v2, 0x2a

    invoke-direct {v4, v6, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->DECOMPRESSION_ERROR:Lcom/helpshift/websockets/WebSocketError;

    .line 398
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "SOCKET_CONNECT_ERROR"

    move-object/from16 v45, v4

    const/16 v4, 0x2b

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->SOCKET_CONNECT_ERROR:Lcom/helpshift/websockets/WebSocketError;

    .line 406
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "PROXY_HANDSHAKE_ERROR"

    move-object/from16 v46, v2

    const/16 v2, 0x2c

    invoke-direct {v4, v6, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->PROXY_HANDSHAKE_ERROR:Lcom/helpshift/websockets/WebSocketError;

    .line 414
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "SOCKET_OVERLAY_ERROR"

    move-object/from16 v47, v4

    const/16 v4, 0x2d

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->SOCKET_OVERLAY_ERROR:Lcom/helpshift/websockets/WebSocketError;

    .line 422
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "SSL_HANDSHAKE_ERROR"

    move-object/from16 v48, v2

    const/16 v2, 0x2e

    invoke-direct {v4, v6, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->SSL_HANDSHAKE_ERROR:Lcom/helpshift/websockets/WebSocketError;

    .line 439
    new-instance v2, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "NO_MORE_FRAME"

    move-object/from16 v49, v4

    const/16 v4, 0x2f

    invoke-direct {v2, v6, v4}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->NO_MORE_FRAME:Lcom/helpshift/websockets/WebSocketError;

    .line 458
    new-instance v4, Lcom/helpshift/websockets/WebSocketError;

    const-string v6, "HOSTNAME_UNVERIFIED"

    move-object/from16 v50, v2

    const/16 v2, 0x30

    invoke-direct {v4, v6, v2}, Lcom/helpshift/websockets/WebSocketError;-><init>(Ljava/lang/String;I)V

    sput-object v4, Lcom/helpshift/websockets/WebSocketError;->HOSTNAME_UNVERIFIED:Lcom/helpshift/websockets/WebSocketError;

    const/16 v2, 0x31

    new-array v2, v2, [Lcom/helpshift/websockets/WebSocketError;

    const/4 v6, 0x0

    aput-object v0, v2, v6

    const/4 v0, 0x1

    aput-object v1, v2, v0

    const/4 v0, 0x2

    aput-object v3, v2, v0

    const/4 v0, 0x3

    aput-object v5, v2, v0

    const/4 v0, 0x4

    aput-object v7, v2, v0

    const/4 v0, 0x5

    aput-object v9, v2, v0

    const/4 v0, 0x6

    aput-object v11, v2, v0

    const/4 v0, 0x7

    aput-object v13, v2, v0

    const/16 v0, 0x8

    aput-object v15, v2, v0

    const/16 v0, 0x9

    aput-object v14, v2, v0

    const/16 v0, 0xa

    aput-object v12, v2, v0

    const/16 v0, 0xb

    aput-object v10, v2, v0

    const/16 v0, 0xc

    aput-object v8, v2, v0

    const/16 v0, 0xd

    aput-object v16, v2, v0

    const/16 v0, 0xe

    aput-object v17, v2, v0

    const/16 v0, 0xf

    aput-object v18, v2, v0

    const/16 v0, 0x10

    aput-object v19, v2, v0

    const/16 v0, 0x11

    aput-object v20, v2, v0

    const/16 v0, 0x12

    aput-object v21, v2, v0

    const/16 v0, 0x13

    aput-object v22, v2, v0

    const/16 v0, 0x14

    aput-object v23, v2, v0

    const/16 v0, 0x15

    aput-object v24, v2, v0

    const/16 v0, 0x16

    aput-object v25, v2, v0

    const/16 v0, 0x17

    aput-object v26, v2, v0

    const/16 v0, 0x18

    aput-object v27, v2, v0

    const/16 v0, 0x19

    aput-object v28, v2, v0

    const/16 v0, 0x1a

    aput-object v29, v2, v0

    const/16 v0, 0x1b

    aput-object v30, v2, v0

    const/16 v0, 0x1c

    aput-object v31, v2, v0

    const/16 v0, 0x1d

    aput-object v32, v2, v0

    const/16 v0, 0x1e

    aput-object v33, v2, v0

    const/16 v0, 0x1f

    aput-object v34, v2, v0

    const/16 v0, 0x20

    aput-object v35, v2, v0

    const/16 v0, 0x21

    aput-object v36, v2, v0

    const/16 v0, 0x22

    aput-object v37, v2, v0

    const/16 v0, 0x23

    aput-object v38, v2, v0

    const/16 v0, 0x24

    aput-object v39, v2, v0

    const/16 v0, 0x25

    aput-object v40, v2, v0

    const/16 v0, 0x26

    aput-object v41, v2, v0

    const/16 v0, 0x27

    aput-object v42, v2, v0

    const/16 v0, 0x28

    aput-object v43, v2, v0

    const/16 v0, 0x29

    aput-object v44, v2, v0

    const/16 v0, 0x2a

    aput-object v45, v2, v0

    const/16 v0, 0x2b

    aput-object v46, v2, v0

    const/16 v0, 0x2c

    aput-object v47, v2, v0

    const/16 v0, 0x2d

    aput-object v48, v2, v0

    const/16 v0, 0x2e

    aput-object v49, v2, v0

    const/16 v0, 0x2f

    aput-object v50, v2, v0

    const/16 v0, 0x30

    aput-object v4, v2, v0

    .line 30
    sput-object v2, Lcom/helpshift/websockets/WebSocketError;->$VALUES:[Lcom/helpshift/websockets/WebSocketError;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 30
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/websockets/WebSocketError;
    .locals 1

    .line 30
    const-class v0, Lcom/helpshift/websockets/WebSocketError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/websockets/WebSocketError;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/websockets/WebSocketError;
    .locals 1

    .line 30
    sget-object v0, Lcom/helpshift/websockets/WebSocketError;->$VALUES:[Lcom/helpshift/websockets/WebSocketError;

    invoke-virtual {v0}, [Lcom/helpshift/websockets/WebSocketError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/websockets/WebSocketError;

    return-object v0
.end method
