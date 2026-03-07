.class public Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;
.super Lcom/helpshift/conversation/activeconversation/message/input/Input;
.source "CSATRatingsInput.java"

# interfaces
.implements Lcom/helpshift/util/HSCloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;,
        Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;
    }
.end annotation


# instance fields
.field public final ratings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;",
            ">;"
        }
    .end annotation
.end field

.field public final sendFeedbackLabel:Ljava/lang/String;

.field public final showNewConversationButton:Z

.field public final startNewConversationLabel:Ljava/lang/String;

.field public final type:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;


# direct methods
.method protected constructor <init>(Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;)V
    .locals 1

    .line 33
    invoke-direct {p0, p1}, Lcom/helpshift/conversation/activeconversation/message/input/Input;-><init>(Lcom/helpshift/conversation/activeconversation/message/input/Input;)V

    .line 34
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->ratings:Ljava/util/List;

    invoke-static {v0}, Lcom/helpshift/util/CloneUtil;->deepClone(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->ratings:Ljava/util/List;

    .line 35
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->type:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->type:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    .line 36
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->sendFeedbackLabel:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->sendFeedbackLabel:Ljava/lang/String;

    .line 37
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->startNewConversationLabel:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->startNewConversationLabel:Ljava/lang/String;

    .line 38
    iget-boolean p1, p1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->showNewConversationButton:Z

    iput-boolean p1, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->showNewConversationButton:Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/util/List;Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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

    .line 24
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/helpshift/conversation/activeconversation/message/input/Input;-><init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V

    .line 25
    iput-object p8, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->ratings:Ljava/util/List;

    .line 26
    iput-object p9, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->type:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    .line 27
    iput-object p5, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->sendFeedbackLabel:Ljava/lang/String;

    .line 28
    iput-boolean p6, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->showNewConversationButton:Z

    .line 29
    iput-object p7, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->startNewConversationLabel:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;
    .locals 1

    .line 43
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;-><init>(Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 10
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;->deepClone()Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;

    move-result-object v0

    return-object v0
.end method
