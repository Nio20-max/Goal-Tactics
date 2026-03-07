.class public Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;
.super Lcom/helpshift/conversation/activeconversation/message/input/Input;
.source "OptionInput.java"

# interfaces
.implements Lcom/helpshift/util/HSCloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;,
        Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;
    }
.end annotation


# instance fields
.field public final options:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;",
            ">;"
        }
    .end annotation
.end field

.field public final type:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;)V
    .locals 1

    .line 23
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/input/Input;-><init>(Lcom/helpshift/conversation/activeconversation/message/input/Input;)V

    .line 24
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->options:Ljava/util/List;

    invoke-static {v0}, Lcom/helpshift/util/CloneUtil;->deepClone(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->options:Ljava/util/List;

    .line 25
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->type:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->type:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Option;",
            ">;",
            "Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;",
            ")V"
        }
    .end annotation

    .line 17
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/helpshift/conversation/activeconversation/message/input/Input;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 18
    iput-object p5, p0, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->options:Ljava/util/List;

    .line 19
    iput-object p6, p0, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->type:Lcom/helpshift/conversation/activeconversation/message/input/OptionInput$Type;

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;
    .locals 1

    .line 30
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;-><init>(Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 10
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;->deepClone()Lcom/helpshift/conversation/activeconversation/message/input/OptionInput;

    move-result-object v0

    return-object v0
.end method
