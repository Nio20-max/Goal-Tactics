.class Lcom/helpshift/common/platform/AndroidResponseParser;
.super Ljava/lang/Object;
.source "AndroidResponseParser.java"

# interfaces
.implements Lcom/helpshift/common/platform/network/ResponseParser;


# static fields
.field private static final AVATAR_IMAGE_CACHE_DEFAULT_INTERVAL:I = 0xdbba00

.field private static final OPTIONS_MAX_LIMIT:I = 0x1f4

.field private static final SMART_INTENT_CLIENT_CACHE_DEFAULT_INTERVAL:J = 0xf731400L

.field private static final SMART_INTENT_REFRESH_DEFAULT_INTERVAL:J = 0x927c0L

.field private static final TAG:Ljava/lang/String; = "Helpshift_AResponseParser"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private convertDeliveryStateToInt(Ljava/lang/String;)I
    .locals 1

    .line 1672
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    const-string v0, "read"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "sent"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x2

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method private parseAdminActionCardMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1096
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_0"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v0, "created_at"

    .line 1097
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1099
    sget-object v2, Lcom/helpshift/common/util/HSDateFormatSpec;->STORAGE_TIME_FORMAT:Lcom/helpshift/util/HSSimpleDateFormat;

    const/4 v3, 0x1

    invoke-static {v2, v0, v3}, Lcom/helpshift/common/util/HSDateFormatSpec;->addMilliSeconds(Lcom/helpshift/util/HSSimpleDateFormat;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    .line 1100
    invoke-static {v6}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v7

    const-string v0, "action_cards"

    .line 1104
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v3, "actions"

    .line 1105
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 1107
    new-instance v5, Lcom/helpshift/conversation/activeconversation/model/Action;

    const-string v9, "display_text"

    invoke-virtual {v3, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1108
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "type"

    .line 1109
    invoke-virtual {v3, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/helpshift/conversation/activeconversation/model/ActionType;->fromValue(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/ActionType;

    move-result-object v11

    const-string v12, "data"

    .line 1110
    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v3}, Lcom/helpshift/util/HSJSONUtils;->toStringMap(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v3

    invoke-direct {v5, v9, v10, v11, v3}, Lcom/helpshift/conversation/activeconversation/model/Action;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/model/ActionType;Ljava/util/Map;)V

    .line 1111
    new-instance v11, Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    const-string v3, "title"

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v9, "image_url"

    .line 1112
    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "is_image_secure"

    .line 1113
    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-direct {v11, v3, v9, v0, v5}, Lcom/helpshift/conversation/activeconversation/model/ActionCard;-><init>(Ljava/lang/String;Ljava/lang/String;ZLcom/helpshift/conversation/activeconversation/model/Action;)V

    .line 1117
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    const-string v3, "body"

    .line 1118
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v3, "author"

    .line 1122
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 1121
    invoke-direct {p0, v3, v2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v9

    .line 1123
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    move-object v3, v0

    invoke-direct/range {v3 .. v11}, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/model/ActionCard;)V

    const-string v1, "md_state"

    const-string v3, ""

    .line 1125
    invoke-virtual {p1, v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->deliveryState:I

    const-string v1, "redacted"

    .line 1127
    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, v0, Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;->isRedacted:Z

    return-object v0
.end method

.method private parseAdminAttachmentEntities(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 28
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    const-string v2, "redacted"

    const-string v3, "body"

    .line 1448
    :try_start_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const-string v5, "meta"

    .line 1449
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const/4 v6, 0x0

    if-eqz v5, :cond_0

    const-string v6, "attachments"

    .line 1453
    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    :cond_0
    if-eqz v6, :cond_6

    .line 1456
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-nez v5, :cond_1

    goto/16 :goto_5

    :cond_1
    const-string v5, "id"

    .line 1460
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v7, "created_at"

    .line 1461
    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1462
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "author"

    .line 1463
    invoke-virtual {v0, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct {v1, v9, v10}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v9

    .line 1464
    invoke-virtual {v0, v2, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v24

    const-string v11, "md_state"

    const-string v12, ""

    .line 1465
    invoke-virtual {v0, v11, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v0

    const/4 v11, 0x0

    .line 1467
    :goto_0
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v11, v12, :cond_6

    .line 1468
    invoke-virtual {v6, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    .line 1469
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_"

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1470
    sget-object v13, Lcom/helpshift/common/util/HSDateFormatSpec;->STORAGE_TIME_FORMAT:Lcom/helpshift/util/HSSimpleDateFormat;

    add-int/lit8 v15, v11, 0x1

    .line 1472
    invoke-static {v13, v7, v15}, Lcom/helpshift/common/util/HSDateFormatSpec;->addMilliSeconds(Lcom/helpshift/util/HSSimpleDateFormat;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v14

    .line 1473
    invoke-static {v14}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v16

    .line 1475
    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 1476
    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    move-object v13, v11

    goto :goto_1

    :cond_2
    move-object v13, v8

    :goto_1
    const-string v11, "url"

    .line 1477
    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    const-string v11, "content-type"

    .line 1478
    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    const-string v11, "size"

    .line 1479
    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v23

    const-string v11, "file-name"

    .line 1480
    invoke-virtual {v12, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    const-string v11, "secure?"

    .line 1481
    invoke-virtual {v12, v11, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v25

    if-nez v24, :cond_4

    .line 1482
    invoke-virtual {v12, v2, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v11

    if-eqz v11, :cond_3

    goto :goto_2

    :cond_3
    const/4 v11, 0x0

    goto :goto_3

    :cond_4
    :goto_2
    const/4 v11, 0x1

    :goto_3
    const-string v10, "image"

    .line 1485
    invoke-virtual {v12, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 1486
    new-instance v10, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;

    const-string v1, "thumbnail"

    .line 1490
    invoke-virtual {v12, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move v12, v11

    move-object v11, v10

    move-object/from16 v26, v2

    move v2, v12

    move-object v12, v5

    move/from16 v27, v15

    move-wide/from16 v15, v16

    move-object/from16 v17, v9

    move-object/from16 v18, v20

    move-object/from16 v19, v22

    move-object/from16 v20, v1

    move/from16 v22, v25

    invoke-direct/range {v11 .. v23}, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZI)V

    goto :goto_4

    :cond_5
    move-object/from16 v26, v2

    move v2, v11

    move/from16 v27, v15

    .line 1494
    new-instance v10, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    move-object v11, v10

    move-object v12, v5

    move-wide/from16 v15, v16

    move-object/from16 v17, v9

    move/from16 v18, v23

    move-object/from16 v19, v21

    move-object/from16 v21, v22

    move/from16 v22, v25

    invoke-direct/range {v11 .. v22}, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 1499
    :goto_4
    iput v0, v10, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->deliveryState:I

    .line 1500
    iput-boolean v2, v10, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isRedacted:Z

    .line 1501
    invoke-interface {v4, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-object/from16 v1, p0

    move-object/from16 v2, v26

    move/from16 v11, v27

    const/4 v10, 0x0

    goto/16 :goto_0

    :cond_6
    :goto_5
    return-object v4

    :catch_0
    move-exception v0

    .line 1506
    sget-object v1, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v2, "Parsing exception while reading admin attachment message"

    .line 1507
    invoke-static {v0, v1, v2}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0
.end method

.method private parseAdminCSATMessageWithRatingInputDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 20

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    :try_start_0
    const-string v2, "input"

    .line 877
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "created_at"

    .line 878
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 879
    invoke-static {v7}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v8

    const-string v3, "show_new_conversation_button"

    const/4 v4, 0x1

    .line 880
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v16

    .line 881
    new-instance v3, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    const-string v4, "id"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v4, "body"

    .line 882
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v4, "author"

    .line 884
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const/4 v15, 0x0

    invoke-direct {v1, v4, v15}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v10

    const-string v4, "chatbot_info"

    .line 885
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 886
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v4, "required"

    .line 887
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v12

    const-string v4, "label"

    .line 888
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v4, "skip_label"

    .line 889
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v4, "submit_feedback_button_text"

    .line 890
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const-string v4, "show_new_conversation_button_text"

    .line 892
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 893
    invoke-direct {v1, v2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseRatingsInput(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v2

    sget-object v19, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;->STAR_5:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    move-object v4, v3

    move-object/from16 v15, v17

    move-object/from16 v17, v18

    move-object/from16 v18, v2

    invoke-direct/range {v4 .. v19}, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;)V

    const-string v2, "md_state"

    const-string v4, ""

    .line 895
    invoke-virtual {v0, v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v3, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->deliveryState:I

    const-string v2, "redacted"

    const/4 v4, 0x0

    .line 897
    invoke-virtual {v0, v2, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v3, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->isRedacted:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :catch_0
    move-exception v0

    .line 901
    sget-object v2, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v3, "Parsing exception while reading admin resolution message with option input"

    .line 902
    invoke-static {v0, v2, v3}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0
.end method

.method private parseAdminEmptyMessageWithTextInputDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    :try_start_0
    const-string v2, "input"

    .line 992
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "created_at"

    .line 993
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 994
    invoke-static {v7}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v8

    .line 995
    new-instance v3, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    const-string v4, "id"

    .line 996
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    const-string v4, "author"

    .line 999
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const/4 v15, 0x0

    invoke-direct {v1, v4, v15}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v10

    const-string v4, "chatbot_info"

    .line 1000
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v4, "placeholder"

    .line 1001
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v4, "required"

    .line 1002
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v13

    const-string v4, "label"

    .line 1003
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v4, "skip_label"

    .line 1004
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/16 v16, 0x1

    const/16 v17, 0x1

    move-object v4, v3

    move-object v15, v2

    invoke-direct/range {v4 .. v17}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;IZ)V

    const-string v2, "md_state"

    const-string v4, ""

    .line 1007
    invoke-virtual {v0, v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v3, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->deliveryState:I

    const-string v2, "redacted"

    const/4 v4, 0x0

    .line 1008
    invoke-virtual {v0, v2, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v3, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->isRedacted:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :catch_0
    move-exception v0

    .line 1012
    sget-object v2, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v3, "Parsing exception while reading admin empty message with text input"

    invoke-static {v0, v2, v3}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0
.end method

.method private parseAdminMessage(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 438
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, -0x1

    .line 440
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x4

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x1

    sparse-switch v2, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v2, "txt_msg_with_numeric_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x3

    goto/16 :goto_0

    :sswitch_1
    const-string v2, "bot_ended"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0x10

    goto/16 :goto_0

    :sswitch_2
    const-string v2, "empty_msg_with_txt_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x5

    goto/16 :goto_0

    :sswitch_3
    const-string v2, "bot_started"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0xf

    goto/16 :goto_0

    :sswitch_4
    const-string v2, "faq_list"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0xa

    goto/16 :goto_0

    :sswitch_5
    const-string v2, "txt_msg_with_txt_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    goto/16 :goto_0

    :sswitch_6
    const-string v2, "txt_msg_with_option_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x6

    goto/16 :goto_0

    :sswitch_7
    const-string v2, "txt_msg_with_dt_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x4

    goto :goto_0

    :sswitch_8
    const-string v2, "txt_msg_with_actions"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0xc

    goto :goto_0

    :sswitch_9
    const-string v2, "txt"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :sswitch_a
    const-string v2, "rsc"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0x8

    goto :goto_0

    :sswitch_b
    const-string v2, "rfr"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0x9

    goto :goto_0

    :sswitch_c
    const-string v2, "rar"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x7

    goto :goto_0

    :sswitch_d
    const-string v2, "txt_msg_with_email_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x2

    goto :goto_0

    :sswitch_e
    const-string v2, "txt_resolution_msg_with_option_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0xd

    goto :goto_0

    :sswitch_f
    const-string v2, "faq_list_msg_with_option_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0xb

    goto :goto_0

    :sswitch_10
    const-string v2, "txt_csat_msg_with_option_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0xe

    :cond_0
    :goto_0
    packed-switch v1, :pswitch_data_0

    const-string p1, "input"

    goto/16 :goto_1

    .line 488
    :pswitch_0
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v7}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseBotControlMessage(Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 484
    :pswitch_1
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminCSATMessageWithRatingInputDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 481
    :pswitch_2
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminResolutionMessageWithOptionInputDM(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_2

    .line 478
    :pswitch_3
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminMessageWithActionCardMessageDM(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_2

    .line 475
    :pswitch_4
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseFAQListMessageWitOptionInputDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2

    .line 472
    :pswitch_5
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseFAQListMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 469
    :pswitch_6
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseRequestForReopenMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 466
    :pswitch_7
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseRequestScreenshotMessageDM(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    .line 463
    :pswitch_8
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseRequestAppReviewMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 460
    :pswitch_9
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminMessageWithOptionInputDM(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    .line 457
    :pswitch_a
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminEmptyMessageWithTextInputDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 454
    :pswitch_b
    invoke-direct {p0, p2, v4}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminMessageWithTextInputDM(Lorg/json/JSONObject;I)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    .line 451
    :pswitch_c
    invoke-direct {p0, p2, v5}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminMessageWithTextInputDM(Lorg/json/JSONObject;I)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    .line 448
    :pswitch_d
    invoke-direct {p0, p2, v6}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminMessageWithTextInputDM(Lorg/json/JSONObject;I)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    .line 445
    :pswitch_e
    invoke-direct {p0, p2, v7}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminMessageWithTextInputDM(Lorg/json/JSONObject;I)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    .line 442
    :pswitch_f
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminMessageDM(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    .line 491
    :goto_1
    invoke-virtual {p2, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 492
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseUnsupportedAdminMessageWithInput(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 496
    :cond_1
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    const-string v2, "feedback_message"

    .line 497
    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isFeedbackMessage:Z

    goto :goto_3

    .line 500
    :cond_2
    invoke-interface {p3, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4

    :catch_0
    move-exception p1

    const-string p2, "Helpshift_AResponseParser"

    const-string p3, "Exception while parsing messages: "

    .line 503
    invoke-static {p2, p3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_4
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x4b8aea52 -> :sswitch_10
        -0x3ebff4fd -> :sswitch_f
        -0x2c192a49 -> :sswitch_e
        -0xb0d3d25 -> :sswitch_d
        0x1b823 -> :sswitch_c
        0x1b8be -> :sswitch_b
        0x1ba42 -> :sswitch_a
        0x1c270 -> :sswitch_9
        0x3a40471 -> :sswitch_8
        0x7f3ce67 -> :sswitch_7
        0x1640a48c -> :sswitch_6
        0x1fdc97af -> :sswitch_5
        0x35355c27 -> :sswitch_4
        0x35e1ae09 -> :sswitch_3
        0x5d46a5b2 -> :sswitch_2
        0x6d06fa42 -> :sswitch_1
        0x7e0aec8c -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private parseAdminMessageDM(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    .line 1050
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "created_at"

    .line 1051
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1052
    invoke-static {v5}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v6

    .line 1054
    new-instance v1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;

    const-string v2, "id"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v2, "body"

    .line 1055
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v2, "author"

    .line 1058
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const/4 v9, 0x0

    invoke-direct {p0, v2, v9}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v8

    move-object v2, v1

    invoke-direct/range {v2 .. v8}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V

    const-string v2, "md_state"

    const-string v3, ""

    .line 1059
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->deliveryState:I

    const-string v2, "redacted"

    .line 1060
    invoke-virtual {p1, v2, v9}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->isRedacted:Z

    .line 1061
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1062
    invoke-direct {p0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminAttachmentEntities(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 1066
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading admin text message"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method private parseAdminMessageWithActionCardMessageDM(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    .line 1071
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    const-string v1, "created_at"

    .line 1073
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1074
    invoke-static {v5}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v6

    .line 1076
    new-instance v1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;

    const-string v2, "id"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v2, "body"

    .line 1077
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v2, "author"

    .line 1080
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const/4 v9, 0x0

    invoke-direct {p0, v2, v9}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v8

    move-object v2, v1

    invoke-direct/range {v2 .. v8}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V

    const-string v2, "md_state"

    const-string v3, ""

    .line 1081
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->deliveryState:I

    const-string v2, "redacted"

    .line 1082
    invoke-virtual {p1, v2, v9}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v1, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->isRedacted:Z

    .line 1083
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1084
    invoke-direct {p0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminActionCardMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/AdminActionCardMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 1087
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading admin action card message"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method private parseAdminMessageWithOptionInputDM(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 803
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const-string v3, "input"

    .line 805
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "created_at"

    .line 806
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 807
    invoke-static {v8}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v9

    .line 808
    new-instance v4, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;

    const-string v5, "id"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v5, "body"

    .line 809
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v5, "author"

    .line 811
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const/4 v15, 0x0

    invoke-direct {v1, v5, v15}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v11

    const-string v5, "chatbot_info"

    .line 812
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 813
    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v5, "required"

    .line 814
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v13

    const-string v5, "label"

    .line 815
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v5, "skip_label"

    .line 816
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 817
    invoke-direct {v1, v3}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseOptions(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v17

    .line 818
    invoke-direct {v1, v3}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseOptionType(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    move-result-object v3

    move-object v5, v4

    move-object/from16 v18, v2

    const/4 v2, 0x0

    move-object/from16 v15, v16

    move-object/from16 v16, v17

    move-object/from16 v17, v3

    invoke-direct/range {v5 .. v17}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;)V

    const-string v3, "md_state"

    const-string v5, ""

    .line 819
    invoke-virtual {v0, v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v4, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->deliveryState:I

    const-string v3, "redacted"

    .line 821
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v4, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->isRedacted:Z

    .line 823
    invoke-direct/range {p0 .. p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminAttachmentEntities(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v0

    .line 824
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    iput v2, v4, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithOptionInputDM;->attachmentCount:I

    move-object/from16 v2, v18

    .line 826
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 827
    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception v0

    .line 831
    sget-object v2, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v3, "Parsing exception while reading admin text message with option input"

    .line 832
    invoke-static {v0, v2, v3}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0
.end method

.method private parseAdminMessageWithTextInputDM(Lorg/json/JSONObject;I)Ljava/util/List;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "I)",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 1019
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const-string v3, "input"

    .line 1020
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "created_at"

    .line 1021
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1022
    invoke-static {v8}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v9

    .line 1023
    new-instance v4, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;

    const-string v5, "id"

    .line 1024
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v5, "body"

    .line 1025
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v5, "author"

    .line 1027
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const/4 v15, 0x0

    invoke-direct {v1, v5, v15}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v11

    const-string v5, "chatbot_info"

    .line 1028
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 1029
    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v5, "placeholder"

    .line 1030
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v5, "required"

    .line 1031
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v14

    const-string v5, "label"

    .line 1032
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v5, "skip_label"

    .line 1033
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const/16 v18, 0x0

    move-object v5, v4

    move-object/from16 v19, v2

    const/4 v2, 0x0

    move-object/from16 v15, v16

    move-object/from16 v16, v3

    move/from16 v17, p2

    invoke-direct/range {v5 .. v18}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;IZ)V

    const-string v3, "md_state"

    const-string v5, ""

    .line 1036
    invoke-virtual {v0, v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v4, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->deliveryState:I

    const-string v3, "redacted"

    .line 1037
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v4, Lcom/helpshift/conversation/activeconversation/message/AdminMessageWithTextInputDM;->isRedacted:Z

    move-object/from16 v2, v19

    .line 1038
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1039
    invoke-direct/range {p0 .. p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminAttachmentEntities(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception v0

    .line 1043
    sget-object v2, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v3, "Parsing exception while reading admin message with text input"

    invoke-static {v0, v2, v3}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0
.end method

.method private parseAdminResolutionMessageWithOptionInputDM(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 838
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    :try_start_0
    const-string v3, "input"

    .line 841
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "created_at"

    .line 842
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 843
    invoke-static {v8}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v9

    .line 844
    new-instance v4, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;

    const-string v5, "id"

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v5, "body"

    .line 845
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v5, "author"

    .line 847
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const/4 v15, 0x0

    invoke-direct {v1, v5, v15}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v11

    const-string v5, "chatbot_info"

    .line 848
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 849
    invoke-virtual {v5}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v12

    const-string v5, "required"

    .line 850
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v13

    const-string v5, "label"

    .line 851
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v5, "skip_label"

    .line 852
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 853
    invoke-direct {v1, v3}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseOptions(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v17

    .line 854
    invoke-direct {v1, v3}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseOptionType(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    move-result-object v3

    move-object v5, v4

    move-object/from16 v18, v2

    const/4 v2, 0x0

    move-object/from16 v15, v16

    move-object/from16 v16, v17

    move-object/from16 v17, v3

    invoke-direct/range {v5 .. v17}, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;)V

    const-string v3, "md_state"

    const-string v5, ""

    .line 855
    invoke-virtual {v0, v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v4, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->deliveryState:I

    const-string v3, "redacted"

    .line 857
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v4, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->isRedacted:Z

    .line 859
    invoke-direct/range {p0 .. p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminAttachmentEntities(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v0

    .line 860
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    iput v2, v4, Lcom/helpshift/conversation/activeconversation/message/AdminResolutionMessageWithOptions;->attachmentCount:I

    move-object/from16 v2, v18

    .line 862
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 863
    invoke-interface {v2, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception v0

    .line 868
    sget-object v2, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v3, "Parsing exception while reading admin resolution message with option input"

    .line 869
    invoke-static {v0, v2, v3}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0
.end method

.method private parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1688
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    xor-int/lit8 v0, v0, 0x1

    const-string v1, "author"

    .line 1691
    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    iput-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->author:Lcom/helpshift/conversation/activeconversation/message/Author;

    const-string v0, "request_id"

    .line 1692
    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->createdRequestId:Ljava/lang/String;

    return-void
.end method

.method private parseAvatarKeys(Lorg/json/JSONObject;)Lcom/helpshift/configuration/response/AvatarConfig;
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1640
    new-instance v10, Lcom/helpshift/configuration/response/AvatarConfig;

    const-string v0, "savtr"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    const-string v0, "pagnt"

    .line 1641
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v3

    const-string v0, "af"

    const-string v4, ""

    .line 1642
    invoke-virtual {p1, v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "pbot"

    .line 1643
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v6

    const-string v0, "bf"

    .line 1644
    invoke-virtual {p1, v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "snn"

    .line 1645
    invoke-virtual {p1, v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v0, "turl"

    .line 1646
    invoke-virtual {p1, v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v0, "ce"

    const v1, 0xdbba00

    .line 1647
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p1

    int-to-long v11, p1

    move-object v0, v10

    move v1, v2

    move v2, v3

    move-object v3, v5

    move v4, v6

    move-object v5, v7

    move-object v6, v8

    move-object v7, v9

    move-wide v8, v11

    invoke-direct/range {v0 .. v9}, Lcom/helpshift/configuration/response/AvatarConfig;-><init>(ZZLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    return-object v10
.end method

.method private parseDisableHelpshiftBrandingValue(Lorg/json/JSONObject;)Z
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, "hl"

    const/4 v1, 0x1

    .line 404
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    xor-int/2addr p1, v1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private parseFAQList(Lorg/json/JSONArray;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 646
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 647
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 648
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "data"

    .line 649
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 651
    new-instance v4, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;

    const-string v5, "title"

    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v5, "publish_id"

    .line 652
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "language"

    .line 653
    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v2, v5, v3}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 651
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private parseFAQListMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;
    .locals 11

    :try_start_0
    const-string v0, "created_at"

    .line 688
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 689
    invoke-static {v4}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v5

    .line 690
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;

    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v1, "body"

    .line 691
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v1, "author"

    .line 693
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v10, 0x0

    invoke-direct {p0, v1, v10}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v7

    const-string v1, "faqs"

    .line 694
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseFAQList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v8

    const-string v1, "faq_source"

    .line 695
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    move-object v1, v0

    invoke-direct/range {v1 .. v9}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/util/List;Ljava/lang/String;)V

    const-string v1, "md_state"

    const-string v2, ""

    .line 696
    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->deliveryState:I

    const-string v1, "redacted"

    .line 698
    invoke-virtual {p1, v1, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, v0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->isRedacted:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 702
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading faq list message"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method private parseFAQListMessageWitOptionInputDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    :try_start_0
    const-string v2, "input"

    .line 661
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "created_at"

    .line 662
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 663
    invoke-static {v7}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v8

    .line 664
    new-instance v3, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;

    const-string v4, "id"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v4, "body"

    .line 665
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v4, "author"

    .line 667
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const/4 v15, 0x0

    invoke-direct {v1, v4, v15}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v10

    const-string v4, "faqs"

    .line 668
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseFAQList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v11

    const-string v4, "faq_source"

    .line 669
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v4, "chatbot_info"

    .line 670
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v4, "required"

    .line 671
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v14

    const-string v4, "label"

    .line 672
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v4, "skip_label"

    .line 673
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 674
    invoke-direct {v1, v2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseOptions(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object v2

    move-object v4, v3

    move-object/from16 v15, v16

    move-object/from16 v16, v17

    move-object/from16 v17, v2

    invoke-direct/range {v4 .. v17}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    const-string v2, "md_state"

    const-string v4, ""

    .line 675
    invoke-virtual {v0, v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v3, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->deliveryState:I

    const-string v2, "redacted"

    const/4 v4, 0x0

    .line 676
    invoke-virtual {v0, v2, v4}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v3, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->isRedacted:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :catch_0
    move-exception v0

    .line 680
    sget-object v2, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v3, "Parsing exception while reading list message with option input"

    invoke-static {v0, v2, v3}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0
.end method

.method private parseFollowupAcceptedMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;
    .locals 9

    :try_start_0
    const-string v0, "created_at"

    .line 731
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 732
    invoke-static {v3}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v4

    .line 733
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    const-string v1, "body"

    .line 734
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v1, "author"

    .line 736
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v6, 0x1

    invoke-direct {p0, v1, v6}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v6

    const-string v1, "meta"

    .line 737
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v7, "refers"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x2

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;I)V

    const-string v1, "id"

    .line 739
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->serverId:Ljava/lang/String;

    const-string v1, "md_state"

    const-string v2, ""

    .line 740
    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->deliveryState:I

    const-string v1, "redacted"

    const/4 v2, 0x0

    .line 741
    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v0, Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;->isRedacted:Z

    .line 742
    invoke-direct {p0, v0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 746
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading follow-up accepted message"

    .line 747
    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method private parseFollowupRejectedMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;
    .locals 9

    :try_start_0
    const-string v0, "created_at"

    .line 709
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 710
    invoke-static {v3}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v4

    .line 711
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    const-string v1, "body"

    .line 712
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v1, "author"

    .line 714
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v6, 0x1

    invoke-direct {p0, v1, v6}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v6

    const-string v1, "meta"

    .line 715
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v7, "refers"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x2

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;I)V

    const-string v1, "id"

    .line 717
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->serverId:Ljava/lang/String;

    const-string v1, "md_state"

    const-string v2, ""

    .line 718
    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->deliveryState:I

    const-string v1, "redacted"

    const/4 v2, 0x0

    .line 719
    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v0, Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;->isRedacted:Z

    .line 720
    invoke-direct {p0, v0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 724
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading follow-up rejected message"

    .line 725
    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method private parseIsFeedbackMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    .locals 2

    const-string v0, "feedback_message"

    const/4 v1, 0x0

    .line 570
    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->isFeedbackMessage:Z

    return-void
.end method

.method private parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;
    .locals 3

    const-string v0, "role"

    if-eqz p2, :cond_0

    .line 1654
    :try_start_0
    sget-object p2, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    goto :goto_0

    .line 1657
    :cond_0
    sget-object p2, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->SYSTEM:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    .line 1659
    :goto_0
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1660
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->getEnum(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    move-result-object p2

    .line 1662
    :cond_1
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/Author;

    const-string v1, "name"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "id"

    .line 1663
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1, p2}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 1667
    sget-object p2, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v0, "Parsing exception while reading author of message"

    invoke-static {p1, p2, v0}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method private parseMessageDMs(Lorg/json/JSONArray;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    const-string v0, "Helpshift_AResponseParser"

    .line 410
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 412
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    .line 415
    :try_start_0
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "type"

    .line 416
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "origin"

    .line 417
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "admin"

    .line 419
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 420
    invoke-direct {p0, v5, v4, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminMessage(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/List;)V

    goto :goto_2

    :cond_0
    const-string v7, "mobile"

    .line 422
    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 423
    invoke-direct {p0, v5, v4, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMobileMessage(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/List;)V

    goto :goto_2

    :cond_1
    const-string v4, "Unknown message type received."

    .line 426
    invoke-static {v0, v4}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v4

    goto :goto_1

    :catch_1
    move-exception v4

    :goto_1
    const-string v5, "Exception while parsing messages: "

    .line 430
    invoke-static {v0, v5, v4}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method private parseMobileMessage(Ljava/lang/String;Lorg/json/JSONObject;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/json/JSONObject;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;)V"
        }
    .end annotation

    .line 508
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, -0x1

    .line 510
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const/4 v3, 0x0

    sparse-switch v2, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    const-string v2, "rsp_txt_msg_with_dt_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0xd

    goto/16 :goto_0

    :sswitch_1
    const-string v2, "rsp_txt_msg_with_option_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0xe

    goto/16 :goto_0

    :sswitch_2
    const-string v2, "rsp_empty_msg_with_txt_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0x9

    goto/16 :goto_0

    :sswitch_3
    const-string v2, "rsp_txt_msg_with_txt_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0xa

    goto/16 :goto_0

    :sswitch_4
    const-string v2, "txt"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x0

    goto/16 :goto_0

    :sswitch_5
    const-string v2, "ncr"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x2

    goto/16 :goto_0

    :sswitch_6
    const-string v2, "si"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0x8

    goto/16 :goto_0

    :sswitch_7
    const-string v2, "sc"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x4

    goto/16 :goto_0

    :sswitch_8
    const-string v2, "rj"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x7

    goto/16 :goto_0

    :sswitch_9
    const-string v2, "ra"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x6

    goto :goto_0

    :sswitch_a
    const-string v2, "ca"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x3

    goto :goto_0

    :sswitch_b
    const-string v2, "at"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x5

    goto :goto_0

    :sswitch_c
    const-string v2, "ar"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :sswitch_d
    const-string v2, "rsp_txt_msg_with_numeric_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0xc

    goto :goto_0

    :sswitch_e
    const-string v2, "bot_cancelled"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0x12

    goto :goto_0

    :sswitch_f
    const-string v2, "rsp_faq_list_msg_with_option_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0xf

    goto :goto_0

    :sswitch_10
    const-string v2, "rsp_txt_msg_with_email_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0xb

    goto :goto_0

    :sswitch_11
    const-string v2, "rsp_txt_csat_msg_with_option_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0x11

    goto :goto_0

    :sswitch_12
    const-string v2, "rsp_txt_resolution_msg_with_option_input"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/16 v1, 0x10

    :cond_0
    :goto_0
    packed-switch v1, :pswitch_data_0

    goto/16 :goto_1

    .line 554
    :pswitch_0
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v3}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseBotControlMessage(Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 551
    :pswitch_1
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseResponseMessageForCSATInput(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1

    .line 548
    :pswitch_2
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseResponseMessageForOptionInput(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 543
    :pswitch_3
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseResponseMessageForTextInput(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 536
    :pswitch_4
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseUserSmartIntentMessage(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 533
    :pswitch_5
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseFollowupRejectedMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 530
    :pswitch_6
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseFollowupAcceptedMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 527
    :pswitch_7
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseUserAttachmentMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 524
    :pswitch_8
    invoke-direct {p0, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseScreenshotMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 521
    :pswitch_9
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseConfirmationAcceptedMessageDM(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 518
    :pswitch_a
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseConfirmationRejectedMessageDM(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 515
    :pswitch_b
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAcceptedAppReviewMessageDM(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 512
    :pswitch_c
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseReadableUserMessage(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 558
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 559
    invoke-direct {p0, v1, p2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseIsFeedbackMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V

    goto :goto_2

    .line 562
    :cond_1
    invoke-interface {p3, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    const-string p2, "Helpshift_AResponseParser"

    const-string p3, "Exception while parsing messages: "

    .line 565
    invoke-static {p2, p3, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_3
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x35e8d259 -> :sswitch_12
        -0x33fdde62 -> :sswitch_11
        -0x318c7d35 -> :sswitch_10
        -0x2732e90d -> :sswitch_f
        -0x2086ab27 -> :sswitch_e
        -0x5a48f84 -> :sswitch_d
        0xc31 -> :sswitch_c
        0xc33 -> :sswitch_b
        0xc5e -> :sswitch_a
        0xe2f -> :sswitch_9
        0xe38 -> :sswitch_8
        0xe50 -> :sswitch_7
        0xe56 -> :sswitch_6
        0x1a95d -> :sswitch_5
        0x1c270 -> :sswitch_4
        0x1d6c939f -> :sswitch_3
        0x36c765a2 -> :sswitch_2
        0x6cd7e29c -> :sswitch_1
        0x7b7c9477 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private parseOptionType(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "type"

    .line 798
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "options"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p1

    invoke-static {v0, p1}, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;->getType(Ljava/lang/String;I)Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    move-result-object p1

    return-object p1
.end method

.method private parseOptions(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 771
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "options"

    .line 772
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 773
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/16 v2, 0x1f4

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    .line 775
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 776
    new-instance v4, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;

    const-string v5, "title"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "data"

    .line 777
    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v5, v3}, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 776
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private parsePeriodicReview(Lorg/json/JSONObject;)Lcom/helpshift/configuration/response/PeriodicReview;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1633
    new-instance v0, Lcom/helpshift/configuration/response/PeriodicReview;

    const-string v1, "s"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "i"

    .line 1634
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "t"

    const-string v4, ""

    .line 1635
    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lcom/helpshift/configuration/response/PeriodicReview;-><init>(ZILjava/lang/String;)V

    return-object v0
.end method

.method private parseRatingsInput(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 783
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "ratings"

    .line 784
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 785
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    const/16 v2, 0x1f4

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    .line 787
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "data"

    .line 788
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "value"

    const/4 v6, 0x1

    .line 789
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v5

    .line 790
    new-instance v6, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;

    const-string v7, "title"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 792
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v6, v3, v5, v4}, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 790
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private parseRequestAppReviewMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;
    .locals 10

    :try_start_0
    const-string v0, "meta"

    .line 1514
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "response"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v2, "state"

    .line 1516
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v2, "invisible"

    .line 1518
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const/4 v9, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v0, 0x1

    const/4 v9, 0x1

    :goto_2
    const-string v0, "created_at"

    .line 1519
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 1520
    invoke-static {v5}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v6

    .line 1521
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;

    const-string v2, "id"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v2, "body"

    .line 1522
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v2, "author"

    .line 1525
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 1524
    invoke-direct {p0, v2, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v8

    move-object v2, v0

    invoke-direct/range {v2 .. v9}, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Z)V

    const-string v2, "md_state"

    const-string v3, ""

    .line 1528
    invoke-virtual {p1, v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v2

    iput v2, v0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->deliveryState:I

    const-string v2, "redacted"

    .line 1529
    invoke-virtual {p1, v2, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, v0, Lcom/helpshift/conversation/activeconversation/message/RequestAppReviewMessageDM;->isRedacted:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 1533
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading request review message"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method private parseRequestForReopenMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;
    .locals 9

    :try_start_0
    const-string v0, "created_at"

    .line 753
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 754
    invoke-static {v4}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v5

    .line 755
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;

    const-string v1, "id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v1, "body"

    .line 756
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v1, "author"

    .line 759
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v8, 0x0

    .line 758
    invoke-direct {p0, v1, v8}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v7

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V

    const-string v1, "md_state"

    const-string v2, ""

    .line 761
    invoke-virtual {p1, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->deliveryState:I

    const-string v1, "redacted"

    .line 762
    invoke-virtual {p1, v1, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, v0, Lcom/helpshift/conversation/activeconversation/message/RequestForReopenMessageDM;->isRedacted:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 766
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading reopen message"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method private parseRequestScreenshotMessageDM(Lorg/json/JSONObject;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/MessageDM;",
            ">;"
        }
    .end annotation

    .line 1539
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "meta"

    .line 1541
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "response"

    .line 1542
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const-string v3, "state"

    .line 1545
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    move v10, v1

    goto :goto_0

    :cond_0
    const/4 v10, 0x0

    :goto_0
    const-string v1, "created_at"

    .line 1547
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 1548
    invoke-static {v6}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v7

    .line 1549
    new-instance v1, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;

    const-string v3, "id"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v3, "body"

    .line 1550
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v3, "author"

    .line 1553
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 1552
    invoke-direct {p0, v3, v2}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v9

    move-object v3, v1

    invoke-direct/range {v3 .. v10}, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Z)V

    const-string v3, "md_state"

    const-string v4, ""

    .line 1556
    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v1, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->deliveryState:I

    const-string v3, "redacted"

    .line 1557
    invoke-virtual {p1, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v1, Lcom/helpshift/conversation/activeconversation/message/RequestScreenshotMessageDM;->isRedacted:Z

    .line 1558
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1559
    invoke-direct {p0, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAdminAttachmentEntities(Lorg/json/JSONObject;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 1563
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading request screenshot message"

    .line 1564
    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method private parseScreenshotMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;
    .locals 21

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    const-string v2, "redacted"

    const-string v3, ""

    const-string v4, "body"

    :try_start_0
    const-string v5, "meta"

    .line 1570
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "attachments"

    .line 1571
    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    const-string v7, "created_at"

    .line 1572
    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 1573
    invoke-static {v10}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v11

    .line 1574
    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1575
    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_0
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_0
    move-object v9, v4

    .line 1576
    new-instance v4, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    const-string v7, "author"

    .line 1578
    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const/4 v15, 0x1

    invoke-direct {v1, v7, v15}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v13

    const-string v7, "content-type"

    .line 1580
    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v7, "thumbnail"

    .line 1581
    invoke-virtual {v5, v7, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "file-name"

    .line 1582
    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v8, "url"

    .line 1583
    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const-string v8, "size"

    .line 1584
    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v18

    const-string v8, "secure?"

    .line 1585
    invoke-virtual {v5, v8, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v19

    move-object v8, v4

    const/16 v20, 0x1

    move-object v15, v7

    invoke-direct/range {v8 .. v19}, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IZ)V

    const-string v7, "id"

    .line 1586
    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v4, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->serverId:Ljava/lang/String;

    const-string v7, "md_state"

    .line 1587
    invoke-virtual {v0, v7, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v3

    iput v3, v4, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->deliveryState:I

    .line 1588
    invoke-virtual {v0, v2, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {v5, v2, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    :cond_1
    const/4 v15, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v15, 0x1

    :goto_2
    iput-boolean v15, v4, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->isRedacted:Z

    const-string v2, "zipped"

    .line 1589
    invoke-virtual {v5, v2, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v4, Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;->isZipped:Z

    .line 1590
    invoke-direct {v1, v4, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V

    .line 1591
    invoke-direct {v1, v4, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseIsFeedbackMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    :catch_0
    move-exception v0

    .line 1595
    sget-object v2, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v3, "Parsing exception while reading screenshot message"

    invoke-static {v0, v2, v3}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0
.end method

.method private parseSmartIntents(Ljava/lang/String;Lorg/json/JSONArray;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1343
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1344
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    .line 1350
    invoke-virtual {p2, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "id"

    .line 1351
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "children"

    .line 1352
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    const/4 v6, 0x0

    if-eqz v5, :cond_1

    .line 1355
    invoke-direct {p0, v4, v5}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseSmartIntents(Ljava/lang/String;Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v6

    .line 1357
    :cond_1
    new-instance v5, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    const-string v7, "label"

    invoke-virtual {v3, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3, v4, p1, v6}, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 1362
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private parseUnsupportedAdminMessageWithInput(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;
    .locals 11

    .line 1134
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "created_at"

    .line 1135
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1136
    invoke-static {v4}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v5

    .line 1137
    new-instance p1, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;

    const-string v1, "id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v1, "body"

    .line 1138
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v1, "author"

    .line 1140
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v7, 0x0

    invoke-direct {p0, v1, v7}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v7

    const-string v1, "type"

    .line 1141
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v1, "chatbot_info"

    .line 1142
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v1, "input"

    .line 1143
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    move-object v1, p1

    invoke-direct/range {v1 .. v10}, Lcom/helpshift/conversation/activeconversation/message/UnsupportedAdminMessageWithInputDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 1146
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading unsupported admin message with input"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method private parseUserAttachmentMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;
    .locals 19

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    const-string v2, "redacted"

    const-string v3, "body"

    :try_start_0
    const-string v4, "meta"

    .line 1601
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "attachments"

    .line 1602
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v6, "created_at"

    .line 1603
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1604
    invoke-static {v9}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v10

    .line 1605
    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1606
    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_0
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_0
    move-object v8, v3

    .line 1608
    new-instance v3, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    const-string v6, "author"

    .line 1611
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    const/4 v15, 0x1

    invoke-direct {v1, v6, v15}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v12

    const-string v6, "size"

    .line 1612
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v13

    const-string v6, "content-type"

    .line 1613
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v6, "url"

    .line 1614
    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "file-name"

    .line 1615
    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v7, "secure?"

    .line 1616
    invoke-virtual {v4, v7, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v17

    move-object v7, v3

    const/16 v18, 0x1

    move-object v15, v6

    invoke-direct/range {v7 .. v17}, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    const-string v6, "id"

    .line 1617
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v3, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->serverId:Ljava/lang/String;

    const-string v6, "md_state"

    const-string v7, ""

    .line 1618
    invoke-virtual {v0, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v1, v6}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v6

    iput v6, v3, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->deliveryState:I

    .line 1620
    invoke-virtual {v0, v2, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-nez v6, :cond_2

    invoke-virtual {v4, v2, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    :cond_1
    const/4 v15, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v15, 0x1

    :goto_2
    iput-boolean v15, v3, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->isRedacted:Z

    const-string v2, "zipped"

    .line 1621
    invoke-virtual {v4, v2, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v3, Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;->isZipped:Z

    .line 1622
    invoke-direct {v1, v3, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V

    .line 1623
    invoke-direct {v1, v3, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseIsFeedbackMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :catch_0
    move-exception v0

    .line 1627
    sget-object v2, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v3, "Parsing exception while reading user attachment message"

    invoke-static {v0, v2, v3}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public parseAcceptedAppReviewMessageDM(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;
    .locals 9

    .line 206
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "created_at"

    .line 207
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 208
    invoke-static {v3}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v4

    .line 209
    new-instance p1, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;

    const-string v1, "body"

    .line 210
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v1, "author"

    .line 212
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v6, 0x1

    invoke-direct {p0, v1, v6}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v6

    const-string v1, "meta"

    .line 213
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v7, "refers"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x2

    move-object v1, p1

    invoke-direct/range {v1 .. v8}, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;I)V

    const-string v1, "id"

    .line 215
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;->serverId:Ljava/lang/String;

    const-string v1, "md_state"

    const-string v2, ""

    .line 216
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p1, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;->deliveryState:I

    const-string v1, "redacted"

    const/4 v2, 0x0

    .line 217
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/message/AcceptedAppReviewMessageDM;->isRedacted:Z

    .line 218
    invoke-direct {p0, p1, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 222
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading accepted review message"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseAuthToken(Ljava/lang/String;)Lcom/helpshift/auth/dto/WebSocketAuthData;
    .locals 2

    .line 345
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "token"

    .line 346
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "endpoint"

    .line 347
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 348
    new-instance v1, Lcom/helpshift/auth/dto/WebSocketAuthData;

    invoke-direct {v1, p1, v0}, Lcom/helpshift/auth/dto/WebSocketAuthData;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "Helpshift_AResponseParser"

    const-string v1, "Exception in parsing auth token"

    .line 351
    invoke-static {v0, v1, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public parseBotControlMessage(Ljava/lang/String;Z)Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 17

    move-object/from16 v1, p0

    .line 605
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    move-object/from16 v2, p1

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "type"

    .line 606
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "id"

    .line 607
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v3, "chatbot_info"

    .line 608
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v3, "redacted"

    const/4 v12, 0x0

    .line 609
    invoke-virtual {v0, v3, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v15

    const-string v3, "created_at"

    .line 610
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 611
    invoke-static {v6}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v7
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, "author"

    const-string v4, "body"

    if-eqz p2, :cond_0

    .line 613
    :try_start_1
    new-instance v13, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;

    .line 614
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 617
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v1, v3, v12}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v9

    move-object v3, v13

    move-object v4, v14

    move-object v10, v2

    invoke-direct/range {v3 .. v11}, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "has_next_bot"

    .line 619
    invoke-virtual {v0, v2, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v13, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->hasNextBot:Z

    .line 620
    iput-boolean v15, v13, Lcom/helpshift/conversation/activeconversation/message/AdminBotControlMessageDM;->isRedacted:Z

    return-object v13

    :cond_0
    const-string v5, "meta"

    .line 624
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v9, "chatbot_cancelled_reason"

    .line 625
    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v9, "refers"

    .line 626
    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 627
    new-instance v13, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;

    .line 628
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 630
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const/4 v5, 0x1

    invoke-direct {v1, v3, v5}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v9

    const/16 v16, 0x2

    move-object v3, v13

    move-object v5, v6

    move-wide v6, v7

    move-object v8, v9

    move-object v9, v2

    move-object v2, v13

    move/from16 v13, v16

    invoke-direct/range {v3 .. v13}, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 634
    iput-object v14, v2, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->serverId:Ljava/lang/String;

    .line 635
    iput-boolean v15, v2, Lcom/helpshift/conversation/activeconversation/message/UserBotControlMessageDM;->isRedacted:Z

    .line 636
    invoke-direct {v1, v2, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v2

    :catch_0
    move-exception v0

    .line 641
    sget-object v2, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v3, "Parsing exception while reading bot control messages."

    invoke-static {v0, v2, v3}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0
.end method

.method public parseConfigResponse(Ljava/lang/String;)Lcom/helpshift/configuration/response/RootServerConfig;
    .locals 46

    move-object/from16 v1, p0

    const-string v0, "avtr"

    const-string v2, "hdr"

    const-string v3, "si"

    const-string v4, "profile_created_at"

    const-string v5, "last_redaction_at"

    .line 1154
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    move-object/from16 v7, p1

    invoke-direct {v6, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1156
    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    const/4 v8, 0x0

    if-eqz v7, :cond_0

    .line 1157
    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v25, v5

    goto :goto_0

    :cond_0
    move-object/from16 v25, v8

    .line 1160
    :goto_0
    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1161
    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    move-object/from16 v26, v4

    goto :goto_1

    :cond_1
    move-object/from16 v26, v8

    :goto_1
    const-string v4, "pfi"

    const-wide/16 v9, 0x0

    .line 1165
    invoke-virtual {v6, v4, v9, v10}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    const-wide/16 v11, 0x3e8

    div-long v28, v4, v11

    const-string v4, "pri"

    .line 1168
    invoke-virtual {v6, v4, v9, v10}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    div-long v30, v4, v11

    const-string v4, "afp"

    const/4 v5, 0x0

    .line 1171
    invoke-virtual {v6, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v32

    .line 1177
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1178
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "enabled"

    .line 1179
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    const-string v7, "tree_sla"

    const-wide/32 v11, 0x927c0

    .line 1180
    invoke-virtual {v3, v7, v11, v12}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    const-string v13, "model_sla"

    .line 1181
    invoke-virtual {v3, v13, v11, v12}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    const-string v12, "cache_sla"

    const-wide/32 v13, 0xf731400

    .line 1183
    invoke-virtual {v3, v12, v13, v14}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v36, v3

    move/from16 v33, v4

    move-object/from16 v35, v7

    move-object/from16 v34, v11

    goto :goto_2

    :cond_2
    move-object/from16 v34, v8

    move-object/from16 v35, v34

    move-object/from16 v36, v35

    const/16 v33, 0x0

    :goto_2
    const-string v3, "wa"

    const-string v4, "[[\"*/*\"]]"

    .line 1189
    invoke-virtual {v6, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1188
    invoke-static {v3}, Lcom/helpshift/util/HSJSONUtils;->nestedJsonArrayToNestedArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v37

    const-string v3, "ll"

    .line 1192
    sget-object v4, Lcom/helpshift/logger/constants/LogLevel;->FATAL:Lcom/helpshift/logger/constants/LogLevel;

    invoke-virtual {v4}, Lcom/helpshift/logger/constants/LogLevel;->getValue()I

    move-result v4

    invoke-virtual {v6, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v38

    .line 1197
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v4, ""

    if-eqz v3, :cond_3

    .line 1198
    :try_start_1
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "sh"

    .line 1199
    invoke-virtual {v2, v3, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v3

    const-string v7, "htxt"

    .line 1200
    invoke-virtual {v2, v7, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v11, "hurl"

    .line 1201
    invoke-virtual {v2, v11, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v41, v2

    move/from16 v39, v3

    move-object/from16 v40, v7

    goto :goto_3

    :cond_3
    move-object/from16 v40, v4

    move-object/from16 v41, v40

    const/16 v39, 0x0

    .line 1204
    :goto_3
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1205
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAvatarKeys(Lorg/json/JSONObject;)Lcom/helpshift/configuration/response/AvatarConfig;

    move-result-object v8

    :cond_4
    move-object/from16 v42, v8

    const-string v0, "asae"

    const/4 v2, 0x1

    .line 1209
    invoke-virtual {v6, v0, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v43

    const-string v0, "pasi"

    .line 1212
    invoke-virtual {v6, v0, v9, v10}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v44

    .line 1214
    new-instance v0, Lcom/helpshift/configuration/response/RootServerConfig;

    const-string v3, "rne"

    invoke-virtual {v6, v3, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v10

    const-string v3, "pfe"

    .line 1215
    invoke-virtual {v6, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v11

    const-string v3, "csat"

    .line 1216
    invoke-virtual {v6, v3, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v12

    const-string v3, "dia"

    .line 1217
    invoke-virtual {v6, v3, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v13

    const-string v3, "t"

    .line 1218
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseDisableHelpshiftBrandingValue(Lorg/json/JSONObject;)Z

    move-result v14

    const-string v3, "issue_exists"

    .line 1219
    invoke-virtual {v6, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v15

    const-string v3, "dbgl"

    const/16 v7, 0x64

    .line 1220
    invoke-virtual {v6, v3, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v16

    const-string v3, "bcl"

    .line 1221
    invoke-virtual {v6, v3, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v17

    const-string v3, "rurl"

    .line 1222
    invoke-virtual {v6, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    const-string v3, "pr"

    .line 1223
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/helpshift/common/platform/AndroidResponseParser;->parsePeriodicReview(Lorg/json/JSONObject;)Lcom/helpshift/configuration/response/PeriodicReview;

    move-result-object v19

    const-string v3, "ic"

    .line 1224
    invoke-virtual {v6, v3, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v20

    const-string v3, "gm"

    .line 1225
    invoke-virtual {v6, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    const-string v3, "tyi"

    .line 1226
    invoke-virtual {v6, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v22

    const-string v3, "rq"

    .line 1227
    invoke-virtual {v6, v3, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v23

    const-string v3, "conversation_history_enabled"

    .line 1228
    invoke-virtual {v6, v3, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v24

    const-string v3, "allow_user_attachments"

    .line 1231
    invoke-virtual {v6, v3, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v27

    move-object v9, v0

    invoke-direct/range {v9 .. v45}, Lcom/helpshift/configuration/response/RootServerConfig;-><init>(ZZZZZZIILjava/lang/String;Lcom/helpshift/configuration/response/PeriodicReview;ZLjava/lang/String;ZZZLjava/lang/Long;Ljava/lang/Long;ZJJZZLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/util/ArrayList;IZLjava/lang/String;Ljava/lang/String;Lcom/helpshift/configuration/response/AvatarConfig;ZJ)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 1249
    sget-object v2, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v3, "Parsing exception while fetching config"

    invoke-static {v0, v2, v3}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0
.end method

.method public parseConfirmationAcceptedMessageDM(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;
    .locals 8

    .line 229
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "created_at"

    .line 230
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 231
    invoke-static {v3}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v4

    .line 232
    new-instance p1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;

    const-string v1, "body"

    .line 233
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v1, "author"

    .line 235
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v6, 0x1

    invoke-direct {p0, v1, v6}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v6

    const/4 v7, 0x2

    move-object v1, p1

    invoke-direct/range {v1 .. v7}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;I)V

    const-string v1, "id"

    .line 237
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;->serverId:Ljava/lang/String;

    const-string v1, "md_state"

    const-string v2, ""

    .line 238
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;->deliveryState:I

    const-string v1, "redacted"

    const/4 v2, 0x0

    .line 239
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationAcceptedMessageDM;->isRedacted:Z

    .line 240
    invoke-direct {p0, p1, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 244
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading confirmation accepted message"

    .line 245
    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseConfirmationRejectedMessageDM(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;
    .locals 9

    .line 252
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "created_at"

    .line 253
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 254
    invoke-static {v3}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v4

    .line 255
    new-instance p1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;

    const-string v1, "body"

    .line 256
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v1, "author"

    .line 259
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v8, 0x0

    invoke-direct {p0, v1, v8}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v6

    const/4 v7, 0x2

    move-object v1, p1

    invoke-direct/range {v1 .. v7}, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;I)V

    const-string v1, "id"

    .line 261
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->serverId:Ljava/lang/String;

    const-string v1, "md_state"

    const-string v2, ""

    .line 262
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->deliveryState:I

    const-string v1, "redacted"

    .line 263
    invoke-virtual {v0, v1, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/message/ConfirmationRejectedMessageDM;->isRedacted:Z

    .line 264
    invoke-direct {p0, p1, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 268
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading confirmation rejected message"

    .line 269
    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseConversationHistory(Ljava/lang/String;)Lcom/helpshift/conversation/dto/ConversationHistory;
    .locals 4

    .line 302
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 303
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "issues"

    .line 304
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    const/4 v2, 0x0

    .line 305
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 306
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseReadableConversation(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v3

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const-string v1, "has_older_messages"

    .line 309
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    .line 310
    new-instance v1, Lcom/helpshift/conversation/dto/ConversationHistory;

    invoke-direct {v1, p1, v0}, Lcom/helpshift/conversation/dto/ConversationHistory;-><init>(Ljava/util/List;Z)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception p1

    .line 313
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading conversation history"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseConversationInbox(Ljava/lang/String;)Lcom/helpshift/conversation/dto/ConversationInbox;
    .locals 5

    const-string v0, "has_older_messages"

    .line 276
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 277
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    const-string v2, "issues"

    .line 278
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const/4 v3, 0x0

    .line 279
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 280
    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseReadableConversation(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;

    move-result-object v4

    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 285
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 286
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    :cond_1
    const-string v0, "cursor"

    .line 289
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "issue_exists"

    .line 291
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    .line 292
    new-instance v3, Lcom/helpshift/conversation/dto/ConversationInbox;

    invoke-direct {v3, v0, p1, v1, v2}, Lcom/helpshift/conversation/dto/ConversationInbox;-><init>(Ljava/lang/String;Ljava/util/List;ZLjava/lang/Boolean;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    :catch_0
    move-exception p1

    .line 295
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading conversation inbox"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseErrorMessage(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "msg"

    .line 1698
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1699
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1700
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method public parseFollowupAcceptedMessage(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;
    .locals 2

    .line 332
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 333
    invoke-direct {p0, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseFollowupAcceptedMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/FollowupAcceptedMessageDM;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 336
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading follow-up accepted message"

    .line 337
    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseFollowupRejectedMessage(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;
    .locals 2

    .line 320
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 321
    invoke-direct {p0, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseFollowupRejectedMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/FollowupRejectedMessageDM;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 324
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading follow-up rejected message"

    .line 325
    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseReadableConversation(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/model/Conversation;
    .locals 22

    const-string v0, "csat_expiry_at"

    const-string v1, "resolution_question_expiry_at"

    const-string v2, "intent"

    const-string v3, "preissue_id"

    const-string v4, "issue_id"

    const-string v5, "acid"

    .line 1256
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    move-object/from16 v7, p1

    invoke-direct {v6, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v7, "messages"

    .line 1257
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v8, p0

    :try_start_1
    invoke-direct {v8, v7}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageDMs(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v7

    .line 1260
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v9

    add-int/lit8 v9, v9, -0x1

    :goto_0
    const/4 v10, 0x0

    if-ltz v9, :cond_1

    .line 1261
    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/helpshift/conversation/activeconversation/message/MessageDM;

    .line 1265
    instance-of v12, v11, Lcom/helpshift/conversation/activeconversation/message/AdminAttachmentMessageDM;

    if-nez v12, :cond_0

    instance-of v12, v11, Lcom/helpshift/conversation/activeconversation/message/AdminImageAttachmentMessageDM;

    if-nez v12, :cond_0

    .line 1267
    invoke-virtual {v11}, Lcom/helpshift/conversation/activeconversation/message/MessageDM;->getCreatedAt()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v19, v9

    goto :goto_1

    :cond_0
    add-int/lit8 v9, v9, -0x1

    goto :goto_0

    :cond_1
    move-object/from16 v19, v10

    :goto_1
    const-string v9, "state"

    .line 1272
    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v9}, Lcom/helpshift/conversation/dto/IssueState;->fromInt(I)Lcom/helpshift/conversation/dto/IssueState;

    move-result-object v13

    const-string v9, "created_at"

    .line 1273
    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 1274
    invoke-static {v14}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v15

    const-string v9, "type"

    .line 1275
    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 1277
    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_2

    move-object/from16 v21, v10

    goto :goto_2

    :cond_2
    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v21, v5

    .line 1278
    :goto_2
    new-instance v5, Lcom/helpshift/conversation/activeconversation/model/Conversation;

    const-string v11, "title"

    const-string v12, ""

    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v11, "updated_at"

    .line 1282
    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const-string v11, "publish_id"

    .line 1283
    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object v11, v5

    move-object/from16 v20, v9

    invoke-direct/range {v11 .. v21}, Lcom/helpshift/conversation/activeconversation/model/Conversation;-><init>(Ljava/lang/String;Lcom/helpshift/conversation/dto/IssueState;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    const-string v11, "redacted"

    const/4 v12, 0x0

    .line 1286
    invoke-virtual {v6, v11, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v11

    iput-boolean v11, v5, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isRedacted:Z

    .line 1287
    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    move-object v4, v10

    goto :goto_3

    :cond_3
    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_3
    iput-object v4, v5, Lcom/helpshift/conversation/activeconversation/model/Conversation;->serverId:Ljava/lang/String;

    .line 1288
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    move-object v3, v10

    goto :goto_4

    :cond_4
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_4
    iput-object v3, v5, Lcom/helpshift/conversation/activeconversation/model/Conversation;->preConversationServerId:Ljava/lang/String;

    .line 1289
    iput-object v9, v5, Lcom/helpshift/conversation/activeconversation/model/Conversation;->issueType:Ljava/lang/String;

    const-string v3, "request_id"

    .line 1290
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v5, Lcom/helpshift/conversation/activeconversation/model/Conversation;->createdRequestId:Ljava/lang/String;

    .line 1291
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    goto :goto_5

    :cond_5
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/helpshift/util/HSJSONUtils;->jsonArrayToStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    :goto_5
    iput-object v10, v5, Lcom/helpshift/conversation/activeconversation/model/Conversation;->smartIntentIds:Ljava/util/List;

    const-string v2, "issue"

    .line 1294
    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    const-string v2, "csat_received"

    .line 1297
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    sget-object v2, Lcom/helpshift/conversation/states/ConversationCSATState;->SUBMITTED_SYNCED:Lcom/helpshift/conversation/states/ConversationCSATState;

    goto :goto_6

    :cond_6
    sget-object v2, Lcom/helpshift/conversation/states/ConversationCSATState;->NONE:Lcom/helpshift/conversation/states/ConversationCSATState;

    :goto_6
    iput-object v2, v5, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatState:Lcom/helpshift/conversation/states/ConversationCSATState;

    .line 1301
    :cond_7
    invoke-virtual {v6, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1302
    invoke-virtual {v6, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, v5, Lcom/helpshift/conversation/activeconversation/model/Conversation;->resolutionExpiryAt:Ljava/lang/Long;

    .line 1304
    :cond_8
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 1305
    invoke-virtual {v6, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, v5, Lcom/helpshift/conversation/activeconversation/model/Conversation;->csatExpiryAt:Ljava/lang/Long;

    :cond_9
    const-string v0, "feedback_bots_enabled"

    .line 1308
    invoke-virtual {v6, v0, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v5, Lcom/helpshift/conversation/activeconversation/model/Conversation;->isFeedbackBotEnabled:Z

    const-string v0, "show_new_conversation_button"

    .line 1309
    invoke-virtual {v6, v0, v12}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v5, Lcom/helpshift/conversation/activeconversation/model/Conversation;->shouldAllowNewConversationCreation:Z

    .line 1311
    invoke-virtual {v5, v7}, Lcom/helpshift/conversation/activeconversation/model/Conversation;->setMessageDMs(Ljava/util/List;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    return-object v5

    :catch_0
    move-exception v0

    goto :goto_7

    :catch_1
    move-exception v0

    move-object/from16 v8, p0

    .line 1315
    :goto_7
    sget-object v1, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v2, "Parsing exception in reading conversation"

    invoke-static {v0, v1, v2}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0
.end method

.method public parseReadableUserMessage(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;
    .locals 7

    .line 102
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "created_at"

    .line 103
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 104
    invoke-static {v3}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v4

    .line 105
    new-instance p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;

    const-string v1, "body"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v1, "author"

    .line 107
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v6, 0x1

    invoke-direct {p0, v1, v6}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v6

    move-object v1, p1

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V

    const-string v1, "id"

    .line 108
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->serverId:Ljava/lang/String;

    const-string v1, "md_state"

    const-string v2, ""

    .line 109
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->deliveryState:I

    const-string v1, "redacted"

    const/4 v2, 0x0

    .line 110
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/message/UserMessageDM;->isRedacted:Z

    .line 111
    invoke-direct {p0, p1, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V

    .line 112
    invoke-direct {p0, p1, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseIsFeedbackMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 116
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading user text message"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseResponseMessageForCSATInput(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;
    .locals 14

    .line 957
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "new_conv_started"

    const/4 v1, 0x0

    .line 959
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v9

    const-string p1, "rating_data"

    .line 961
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    if-nez p1, :cond_0

    const-string v2, "{}"

    goto :goto_0

    .line 962
    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_0
    move-object v11, v2

    if-nez p1, :cond_1

    const/4 v8, 0x0

    goto :goto_1

    :cond_1
    const-string v2, "value"

    .line 964
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result p1

    move v8, p1

    :goto_1
    const-string p1, "created_at"

    .line 966
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 967
    invoke-static {v4}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v5

    .line 968
    new-instance p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;

    const-string v2, "body"

    .line 969
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v2, "author"

    .line 971
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const/4 v7, 0x1

    invoke-direct {p0, v2, v7}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v7

    const-string v2, "chatbot_info"

    .line 974
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v2, "meta"

    .line 976
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v12, "refers"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x2

    move-object v2, p1

    invoke-direct/range {v2 .. v13}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;IZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "id"

    .line 978
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->serverId:Ljava/lang/String;

    const-string v2, "redacted"

    .line 979
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForCSATInput;->isRedacted:Z

    .line 980
    invoke-direct {p0, p1, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V

    .line 981
    invoke-direct {p0, p1, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseIsFeedbackMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 985
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading user response for csat input"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseResponseMessageForOptionInput(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;
    .locals 20

    move-object/from16 v1, p0

    .line 910
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    move-object/from16 v2, p1

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "type"

    .line 911
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, -0x1

    .line 915
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v4

    const v5, -0x35e8d259

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v8, 0x1

    if-eq v4, v5, :cond_2

    const v5, -0x2732e90d

    if-eq v4, v5, :cond_1

    const v5, 0x6cd7e29c

    if-eq v4, v5, :cond_0

    goto :goto_0

    :cond_0
    const-string v4, "rsp_txt_msg_with_option_input"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v3, 0x0

    goto :goto_0

    :cond_1
    const-string v4, "rsp_faq_list_msg_with_option_input"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v3, 0x1

    goto :goto_0

    :cond_2
    const-string v4, "rsp_txt_resolution_msg_with_option_input"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v3, 0x2

    :cond_3
    :goto_0
    if-eqz v3, :cond_6

    if-eq v3, v8, :cond_5

    if-eq v3, v7, :cond_4

    const/4 v0, 0x0

    return-object v0

    .line 923
    :cond_4
    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_RESOLUTION_QUESTION_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    goto :goto_1

    .line 920
    :cond_5
    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/MessageType;->FAQ_LIST_WITH_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    goto :goto_1

    .line 917
    :cond_6
    sget-object v2, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_TEXT_WITH_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    :goto_1
    move-object/from16 v19, v2

    const-string v2, "skipped"

    .line 929
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v16

    if-eqz v16, :cond_7

    const-string v2, "{}"

    :goto_2
    move-object/from16 v17, v2

    goto :goto_3

    :cond_7
    const-string v2, "option_data"

    .line 930
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :goto_3
    const-string v2, "created_at"

    .line 931
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 932
    invoke-static {v11}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v12

    .line 933
    new-instance v2, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;

    const-string v3, "body"

    .line 934
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v3, "author"

    .line 936
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-direct {v1, v3, v8}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v14

    const-string v3, "chatbot_info"

    .line 937
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v15

    const-string v3, "meta"

    .line 940
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "refers"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object v9, v2

    invoke-direct/range {v9 .. v19}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    const-string v3, "id"

    .line 942
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;->serverId:Ljava/lang/String;

    const-string v3, "redacted"

    .line 943
    invoke-virtual {v0, v3, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, v2, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForOptionInput;->isRedacted:Z

    .line 944
    invoke-direct {v1, v2, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V

    .line 945
    invoke-direct {v1, v2, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseIsFeedbackMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception v0

    .line 949
    sget-object v2, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v3, "Parsing exception while reading user response for option input"

    invoke-static {v0, v2, v3}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0
.end method

.method public parseResponseMessageForTextInput(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;
    .locals 20

    move-object/from16 v1, p0

    .line 123
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    move-object/from16 v2, p1

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "type"

    .line 124
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, -0x1

    .line 128
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v4

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x4

    const/4 v8, 0x0

    const/4 v9, 0x1

    sparse-switch v4, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    const-string v4, "rsp_txt_msg_with_dt_input"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x4

    goto :goto_0

    :sswitch_1
    const-string v4, "rsp_empty_msg_with_txt_input"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :sswitch_2
    const-string v4, "rsp_txt_msg_with_txt_input"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :sswitch_3
    const-string v4, "rsp_txt_msg_with_numeric_input"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x3

    goto :goto_0

    :sswitch_4
    const-string v4, "rsp_txt_msg_with_email_input"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v3, 0x2

    :cond_0
    :goto_0
    if-eqz v3, :cond_5

    if-eq v3, v9, :cond_3

    if-eq v3, v6, :cond_2

    if-eq v3, v5, :cond_4

    if-eq v3, v7, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    const/4 v5, 0x4

    goto :goto_1

    :cond_2
    const/4 v5, 0x2

    goto :goto_1

    :cond_3
    const/4 v5, 0x1

    :cond_4
    :goto_1
    const/16 v19, 0x0

    goto :goto_2

    :cond_5
    const/4 v5, 0x1

    const/16 v19, 0x1

    :goto_2
    if-nez v19, :cond_6

    const-string v2, "skipped"

    .line 148
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    const/4 v2, 0x1

    goto :goto_3

    :cond_6
    const/4 v2, 0x0

    :goto_3
    const-string v3, "meta"

    .line 149
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "created_at"

    .line 150
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 151
    invoke-static {v11}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v12

    .line 152
    new-instance v4, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;

    const-string v6, "body"

    .line 153
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v6, "author"

    .line 155
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {v1, v6, v9}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v14

    const-string v6, "chatbot_info"

    .line 157
    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v16

    const-string v6, "refers"

    .line 159
    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object v9, v4

    move v15, v5

    move/from16 v17, v2

    invoke-direct/range {v9 .. v19}, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;ILjava/lang/String;ZLjava/lang/String;Z)V

    if-ne v5, v7, :cond_7

    if-nez v2, :cond_7

    const-string v2, "dt"

    .line 163
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    iput-wide v5, v4, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->dateInMillis:J

    const-string v2, "timezone"

    .line 164
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->timeZoneId:Ljava/lang/String;

    :cond_7
    const-string v2, "id"

    .line 167
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->serverId:Ljava/lang/String;

    const-string v2, "redacted"

    .line 168
    invoke-virtual {v0, v2, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, v4, Lcom/helpshift/conversation/activeconversation/message/UserResponseMessageForTextInputDM;->isRedacted:Z

    .line 169
    invoke-direct {v1, v4, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V

    .line 170
    invoke-direct {v1, v4, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseIsFeedbackMessage(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v4

    :catch_0
    move-exception v0

    .line 174
    sget-object v2, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v3, "Parsing exception while reading user response for text input"

    invoke-static {v0, v2, v3}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object v0

    throw v0

    :sswitch_data_0
    .sparse-switch
        -0x318c7d35 -> :sswitch_4
        -0x5a48f84 -> :sswitch_3
        0x1d6c939f -> :sswitch_2
        0x36c765a2 -> :sswitch_1
        0x7b7c9477 -> :sswitch_0
    .end sparse-switch
.end method

.method public parseScreenshotMessageDM(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;
    .locals 2

    .line 182
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 183
    invoke-direct {p0, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseScreenshotMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/ScreenshotMessageDM;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 186
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading user screenshot message"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseSingleFAQ(Ljava/lang/String;)Lcom/helpshift/faq/FaqCore;
    .locals 14

    const-string v0, "issue_tags"

    const-string v1, "stags"

    .line 1322
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1323
    new-instance p1, Lcom/helpshift/faq/FaqCore;

    const-string v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v3, "publish_id"

    .line 1324
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v3, "language"

    .line 1325
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v3, "section_id"

    .line 1326
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v3, "title"

    .line 1327
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v3, "body"

    .line 1328
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const-string v3, "is_rtl"

    .line 1330
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v11, "true"

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    .line 1331
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1332
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1331
    invoke-static {v1}, Lcom/helpshift/util/HSJSONUtils;->jsonArrayToStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :goto_0
    move-object v12, v1

    .line 1333
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1334
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1333
    invoke-static {v0}, Lcom/helpshift/util/HSJSONUtils;->jsonArrayToStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_1
    move-object v13, v0

    move-object v3, p1

    invoke-direct/range {v3 .. v13}, Lcom/helpshift/faq/FaqCore;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Boolean;Ljava/util/List;Ljava/util/List;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 1337
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading single faq"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseSmartIntentSearchModel(Ljava/lang/String;)Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;
    .locals 10

    .line 1400
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "weights"

    .line 1401
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "intent_ids"

    .line 1403
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    const-string v2, "version"

    .line 1404
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 1407
    invoke-static {v1}, Lcom/helpshift/util/HSJSONUtils;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v7

    const-string v1, "label_base_probabilities"

    .line 1409
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 1411
    invoke-static {v1}, Lcom/helpshift/util/HSJSONUtils;->getDoubleListFromJSONArray(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v8

    .line 1413
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v1

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v3

    if-ne v1, v3, :cond_2

    const-string v1, "vocabulary"

    .line 1418
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    const-string v3, "word_label_probabilities"

    .line 1420
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 1422
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ne v3, v4, :cond_1

    .line 1426
    new-instance v9, Ljava/util/HashMap;

    invoke-direct {v9}, Ljava/util/HashMap;-><init>()V

    const/4 v3, 0x0

    .line 1427
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_0

    .line 1429
    invoke-virtual {p1, v3}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v4

    invoke-static {v4}, Lcom/helpshift/util/HSJSONUtils;->getDoubleListFromJSONArray(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v4

    .line 1430
    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v9, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    const-string p1, "parameters"

    .line 1433
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "confidence_threshold"

    .line 1434
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    const-string v0, "max_combined_confidence"

    .line 1435
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    .line 1437
    new-instance p1, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object v3, p1

    invoke-direct/range {v3 .. v9}, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;-><init>(Ljava/lang/Integer;Ljava/lang/Double;Ljava/lang/Double;Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V

    return-object p1

    .line 1423
    :cond_1
    new-instance p1, Lorg/json/JSONException;

    const-string v0, "Mismatch in vocabulary and wordLabelProbability array"

    invoke-direct {p1, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1414
    :cond_2
    new-instance p1, Lorg/json/JSONException;

    const-string v0, "Mismatch in LeafIntentIds and baseProbabilities list"

    invoke-direct {p1, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 1442
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading smart intent model"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseSmartIntentTree(Ljava/lang/String;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;
    .locals 14

    .line 1371
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "tree"

    .line 1372
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    const/4 v1, 0x0

    .line 1373
    invoke-direct {p0, v1, p1}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseSmartIntents(Ljava/lang/String;Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v12

    const-string p1, "version"

    .line 1374
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string p1, "translations"

    .line 1375
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "token_delimiters"

    .line 1376
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 1377
    new-instance v13, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    const-string v2, "id"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v2, "prompt_title"

    .line 1379
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v2, "typing_hint"

    .line 1380
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v2, "search_title"

    .line 1381
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v2, "empty_search_title"

    .line 1382
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v2, "empty_search_desc"

    .line 1383
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string p1, "eis"

    .line 1384
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v10

    .line 1385
    invoke-static {v1}, Lcom/helpshift/util/HSJSONUtils;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v11

    move-object v2, v13

    invoke-direct/range {v2 .. v12}, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;Ljava/util/List;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v13

    :catch_0
    move-exception p1

    .line 1390
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading smart intent tree"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseUserAttachmentMessageDM(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;
    .locals 2

    .line 194
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 195
    invoke-direct {p0, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseUserAttachmentMessageDM(Lorg/json/JSONObject;)Lcom/helpshift/conversation/activeconversation/message/UserAttachmentMessageDM;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 198
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading user attachment message"

    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseUserSmartIntentMessage(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 7

    .line 575
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "created_at"

    .line 576
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string p1, "intent_labels"

    .line 577
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    .line 579
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_0

    .line 581
    invoke-static {p1}, Lcom/helpshift/util/HSJSONUtils;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object p1

    move-object v2, p1

    goto :goto_0

    :cond_0
    move-object v2, v1

    .line 584
    :goto_0
    invoke-static {v3}, Lcom/helpshift/common/util/HSDateFormatSpec;->convertToEpochTime(Ljava/lang/String;)J

    move-result-wide v4

    .line 585
    new-instance p1, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;

    const-string v1, "author"

    .line 588
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v6, 0x1

    invoke-direct {p0, v1, v6}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseMessageAuthor(Lorg/json/JSONObject;Z)Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v6

    move-object v1, p1

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;-><init>(Ljava/util/List;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;)V

    const-string v1, "id"

    .line 589
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->serverId:Ljava/lang/String;

    const-string v1, "body"

    .line 590
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p1, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->body:Ljava/lang/String;

    const-string v1, "md_state"

    const-string v2, ""

    .line 591
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/helpshift/common/platform/AndroidResponseParser;->convertDeliveryStateToInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p1, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->deliveryState:I

    const-string v1, "redacted"

    const/4 v2, 0x0

    .line 592
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p1, Lcom/helpshift/conversation/activeconversation/message/UserSmartIntentMessageDM;->isRedacted:Z

    .line 593
    invoke-direct {p0, p1, v0}, Lcom/helpshift/common/platform/AndroidResponseParser;->parseAndSetDataForUserSentMessages(Lcom/helpshift/conversation/activeconversation/message/MessageDM;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 597
    sget-object v0, Lcom/helpshift/common/exception/ParseException;->GENERIC:Lcom/helpshift/common/exception/ParseException;

    const-string v1, "Parsing exception while reading user smart intent message"

    .line 598
    invoke-static {p1, v0, v1}, Lcom/helpshift/common/exception/RootAPIException;->wrap(Ljava/lang/Exception;Lcom/helpshift/common/exception/ExceptionType;Ljava/lang/String;)Lcom/helpshift/common/exception/RootAPIException;

    move-result-object p1

    throw p1
.end method

.method public parseWebSocketMessage(Ljava/lang/String;)Lcom/helpshift/conversation/dto/WebSocketMessage;
    .locals 7

    const/4 v0, 0x0

    .line 367
    :try_start_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 368
    invoke-virtual {v1, p1}, Lorg/json/JSONArray;->getInt(I)I

    move-result v2

    const/16 v3, 0x64

    const/4 v4, 0x1

    if-eq v2, v3, :cond_1

    const/16 p1, 0x6b

    if-eq v2, p1, :cond_0

    goto/16 :goto_2

    .line 371
    :cond_0
    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->getLong(I)J

    move-result-wide v1

    invoke-virtual {p1, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v1

    .line 372
    new-instance p1, Lcom/helpshift/conversation/dto/WSPingMessage;

    invoke-direct {p1, v1, v2}, Lcom/helpshift/conversation/dto/WSPingMessage;-><init>(J)V

    move-object v0, p1

    goto :goto_2

    :cond_1
    const/4 v2, 0x2

    .line 375
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v1

    const/4 v2, 0x0

    .line 377
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 378
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    .line 379
    new-instance v5, Lorg/json/JSONObject;

    const-string v6, "m"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v5, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v3, "stream"

    .line 380
    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "agent_type_activity"

    .line 381
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    const-string v3, "action"

    .line 382
    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "start"

    .line 383
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 384
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-string v6, "ttl"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    invoke-virtual {v3, v5, v6}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v5

    .line 385
    new-instance v3, Lcom/helpshift/conversation/dto/WSTypingActionMessage;

    invoke-direct {v3, v4, v5, v6}, Lcom/helpshift/conversation/dto/WSTypingActionMessage;-><init>(ZJ)V

    goto :goto_1

    :cond_2
    const-string v5, "stop"

    .line 387
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 388
    new-instance v3, Lcom/helpshift/conversation/dto/WSTypingActionMessage;

    const-wide/16 v5, 0x0

    invoke-direct {v3, p1, v5, v6}, Lcom/helpshift/conversation/dto/WSTypingActionMessage;-><init>(ZJ)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    move-object v0, v3

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v1, "Helpshift_AResponseParser"

    const-string v2, "Exception in parsing web-socket message"

    .line 396
    invoke-static {v1, v2, p1}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_4
    :goto_2
    return-object v0
.end method
