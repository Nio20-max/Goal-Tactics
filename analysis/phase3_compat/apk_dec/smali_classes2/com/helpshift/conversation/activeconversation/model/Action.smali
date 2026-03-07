.class public Lcom/helpshift/conversation/activeconversation/model/Action;
.super Ljava/lang/Object;
.source "Action.java"

# interfaces
.implements Lcom/helpshift/util/HSCloneable;


# instance fields
.field public final actionData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public actionLocalId:Ljava/lang/Long;

.field public final actionSHA:Ljava/lang/String;

.field public final actionTitle:Ljava/lang/String;

.field public final actionType:Lcom/helpshift/conversation/activeconversation/model/ActionType;


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/model/Action;)V
    .locals 2

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Action;->actionSHA:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionSHA:Ljava/lang/String;

    .line 28
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Action;->actionTitle:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionTitle:Ljava/lang/String;

    .line 29
    new-instance v0, Ljava/util/HashMap;

    iget-object v1, p1, Lcom/helpshift/conversation/activeconversation/model/Action;->actionData:Ljava/util/Map;

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionData:Ljava/util/Map;

    .line 30
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/model/Action;->actionType:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionType:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    .line 31
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Action;->actionLocalId:Ljava/lang/Long;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionLocalId:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/model/ActionType;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/helpshift/conversation/activeconversation/model/ActionType;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionSHA:Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionTitle:Ljava/lang/String;

    .line 22
    iput-object p4, p0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionData:Ljava/util/Map;

    .line 23
    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionType:Lcom/helpshift/conversation/activeconversation/model/ActionType;

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/model/Action;
    .locals 1

    .line 36
    new-instance v0, Lcom/helpshift/conversation/activeconversation/model/Action;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/model/Action;-><init>(Lcom/helpshift/conversation/activeconversation/model/Action;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/model/Action;->deepClone()Lcom/helpshift/conversation/activeconversation/model/Action;

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

    .line 44
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/model/Action;

    if-nez v0, :cond_1

    goto :goto_0

    .line 47
    :cond_1
    check-cast p1, Lcom/helpshift/conversation/activeconversation/model/Action;

    .line 48
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/model/Action;->actionSHA:Ljava/lang/String;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/model/Action;->actionSHA:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method
