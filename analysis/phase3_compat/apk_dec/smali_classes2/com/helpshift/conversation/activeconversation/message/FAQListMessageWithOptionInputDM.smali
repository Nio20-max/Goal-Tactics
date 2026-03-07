.class public Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;
.super Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;
.source "FAQListMessageWithOptionInputDM.java"


# static fields
.field public static final KEY_SUGGESTIONS_READ_FAQ_PREFIX:Ljava/lang/String; = "read_faq_"


# instance fields
.field public input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

.field private readFAQs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;)V
    .locals 1

    .line 41
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;)V

    .line 42
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->deepClone()Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    .line 43
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->readFAQs:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->readFAQs:Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object p1, v0

    :goto_0
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->readFAQs:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Lcom/helpshift/conversation/activeconversation/message/Author;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;",
            ">;)V"
        }
    .end annotation

    .line 25
    sget-object v9, Lcom/helpshift/conversation/activeconversation/message/MessageType;->FAQ_LIST_WITH_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    invoke-direct/range {v0 .. v9}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/util/List;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 26
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;->PILL:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    move-object p1, v0

    move-object/from16 p2, p9

    move/from16 p3, p10

    move-object/from16 p4, p11

    move-object/from16 p5, p12

    move-object/from16 p6, p13

    move-object/from16 p7, v1

    invoke-direct/range {p1 .. p7}, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;)V

    move-object v1, p0

    iput-object v0, v1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/util/List;ZLjava/lang/String;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "J",
            "Lcom/helpshift/conversation/activeconversation/message/Author;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM$FAQ;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    move-object v10, p0

    .line 34
    sget-object v9, Lcom/helpshift/conversation/activeconversation/message/MessageType;->FAQ_LIST_WITH_OPTION_INPUT:Lcom/helpshift/conversation/activeconversation/message/MessageType;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    invoke-direct/range {v0 .. v9}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/helpshift/conversation/activeconversation/message/Author;Ljava/util/List;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/MessageType;)V

    .line 35
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    sget-object v1, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;->PILL:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    move-object p1, v0

    move-object/from16 p2, p9

    move/from16 p3, p10

    move-object/from16 p4, p11

    move-object/from16 p5, p12

    move-object/from16 p6, p13

    move-object/from16 p7, v1

    invoke-direct/range {p1 .. p7}, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;)V

    iput-object v0, v10, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    move/from16 v0, p14

    .line 36
    iput-boolean v0, v10, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->isSuggestionsReadEventSent:Z

    move-object/from16 v0, p15

    .line 37
    iput-object v0, v10, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->suggestionsReadFAQPublishId:Ljava/lang/String;

    return-void
.end method

.method private populateReadFAQs()V
    .locals 3

    .line 71
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->readFAQs:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->readFAQs:Ljava/util/ArrayList;

    .line 73
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getKVStore()Lcom/helpshift/common/platform/KVStore;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "read_faq_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->serverId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/helpshift/common/platform/KVStore;->getSerializable(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 74
    instance-of v1, v0, Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    .line 75
    check-cast v0, Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->readFAQs:Ljava/util/ArrayList;

    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/AdminMessageDM;
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;

    move-result-object v0

    return-object v0
.end method

.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;
    .locals 1

    .line 82
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;-><init>(Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Lcom/helpshift/conversation/activeconversation/message/MessageDM;
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->deepClone()Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;

    move-result-object v0

    return-object v0
.end method

.method public handleSuggestionClick(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 63
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->readFAQs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    .line 64
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->readFAQs:Ljava/util/ArrayList;

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getKVStore()Lcom/helpshift/common/platform/KVStore;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "read_faq_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->serverId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->readFAQs:Ljava/util/ArrayList;

    invoke-interface {v0, v1, v2}, Lcom/helpshift/common/platform/KVStore;->setSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 67
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->handleSuggestionClick(Lcom/helpshift/conversation/activeconversation/ConversationServerInfo;Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V
    .locals 1

    .line 54
    invoke-super {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->merge(Lcom/helpshift/conversation/activeconversation/message/MessageDM;)V

    .line 55
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;

    if-eqz v0, :cond_0

    .line 56
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->input:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    :cond_0
    return-void
.end method

.method public setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V
    .locals 0

    .line 48
    invoke-super {p0, p1, p2}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageDM;->setDependencies(Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;)V

    .line 49
    invoke-direct {p0}, Lcom/helpshift/conversation/activeconversation/message/FAQListMessageWithOptionInputDM;->populateReadFAQs()V

    return-void
.end method
