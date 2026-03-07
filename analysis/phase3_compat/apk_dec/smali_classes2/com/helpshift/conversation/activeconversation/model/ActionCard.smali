.class public Lcom/helpshift/conversation/activeconversation/model/ActionCard;
.super Ljava/lang/Object;
.source "ActionCard.java"

# interfaces
.implements Lcom/helpshift/util/HSCloneable;


# instance fields
.field public final action:Lcom/helpshift/conversation/activeconversation/model/Action;

.field public actionCardLocalId:Ljava/lang/Long;

.field public filePath:Ljava/lang/String;

.field public final imageUrl:Ljava/lang/String;

.field public final isSecure:Z

.field public final title:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/model/ActionCard;)V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->title:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->title:Ljava/lang/String;

    .line 28
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->imageUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->imageUrl:Ljava/lang/String;

    .line 29
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->filePath:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->filePath:Ljava/lang/String;

    .line 30
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->isSecure:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->isSecure:Z

    .line 31
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->action:Lcom/helpshift/conversation/activeconversation/model/Action;

    invoke-virtual {v0}, Lcom/helpshift/conversation/activeconversation/model/Action;->deepClone()Lcom/helpshift/conversation/activeconversation/model/Action;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->action:Lcom/helpshift/conversation/activeconversation/model/Action;

    .line 32
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->actionCardLocalId:Ljava/lang/Long;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->actionCardLocalId:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLcom/helpshift/conversation/activeconversation/model/Action;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->title:Ljava/lang/String;

    .line 20
    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->imageUrl:Ljava/lang/String;

    .line 21
    iput-boolean p3, p0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->isSecure:Z

    .line 22
    iput-object p4, p0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->action:Lcom/helpshift/conversation/activeconversation/model/Action;

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/model/ActionCard;
    .locals 1

    .line 37
    new-instance v0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/model/ActionCard;-><init>(Lcom/helpshift/conversation/activeconversation/model/ActionCard;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->deepClone()Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-ne p1, p0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    if-eqz p1, :cond_2

    .line 45
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    if-nez v0, :cond_1

    goto :goto_0

    .line 48
    :cond_1
    check-cast p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;

    .line 49
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->action:Lcom/helpshift/conversation/activeconversation/model/Action;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/ActionCard;->action:Lcom/helpshift/conversation/activeconversation/model/Action;

    invoke-virtual {p1, v0}, Lcom/helpshift/conversation/activeconversation/model/Action;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method
