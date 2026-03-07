.class public Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;
.super Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;
.source "AdminCSATMessageWithOptions.java"


# instance fields
.field public csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;


# direct methods
.method public constructor <init>(Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;)V

    .line 29
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->deepClone()Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Lcom/helpshift/conversation/activeconversation/message/Author;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;",
            ">;",
            "Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;",
            ")V"
        }
    .end annotation

    .line 20
    sget-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageType;->ADMIN_CSAT_MESSAGE:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-wide/from16 v4, p4

    move-object/from16 v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 21
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    move-object v8, v0

    move-object/from16 v9, p7

    move/from16 v10, p8

    move-object/from16 v11, p9

    move-object/from16 v12, p10

    move-object/from16 v13, p11

    move/from16 v14, p12

    move-object/from16 v15, p13

    move-object/from16 v16, p14

    move-object/from16 v17, p15

    invoke-direct/range {v8 .. v17}, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;)V

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;
    .locals 1

    .line 43
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;-><init>(Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    move-result-object v0

    return-object v0
.end method

.method public merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 34
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 35
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    if-eqz v0, :cond_0

    .line 36
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;

    .line 37
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AdminCSATMessageWithOptions;->csatRatingsInput:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    :cond_0
    return-void
.end method
