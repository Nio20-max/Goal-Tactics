.class public Lcom/helpshift/conversation/activeconversation/message/input/Input;
.super Ljava/lang/Object;
.source "Input.java"


# instance fields
.field public final botInfo:Ljava/lang/String;

.field public final inputLabel:Ljava/lang/String;

.field public final required:Z

.field public final skipLabel:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lcom/helpshift/conversation/activeconversation/message/input/Input;)V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/Input;->botInfo:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/Input;->botInfo:Ljava/lang/String;

    .line 21
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/Input;->required:Z

    iput-boolean v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/Input;->required:Z

    .line 22
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/Input;->inputLabel:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/Input;->inputLabel:Ljava/lang/String;

    .line 23
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/input/Input;->skipLabel:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/input/Input;->skipLabel:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/input/Input;->botInfo:Ljava/lang/String;

    .line 14
    iput-boolean p2, p0, Lcom/helpshift/conversation/activeconversation/message/input/Input;->required:Z

    .line 15
    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/message/input/Input;->inputLabel:Ljava/lang/String;

    .line 16
    iput-object p4, p0, Lcom/helpshift/conversation/activeconversation/message/input/Input;->skipLabel:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 28
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/Input;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 32
    :cond_0
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/input/Input;

    .line 33
    iget-boolean v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/Input;->required:Z

    iget-boolean v2, p0, Lcom/helpshift/conversation/activeconversation/message/input/Input;->required:Z

    if-ne v0, v2, :cond_1

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/Input;->inputLabel:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/input/Input;->inputLabel:Ljava/lang/String;

    .line 34
    invoke-static {v0, v2}, Lcom/helpshift/util/StringUtils;->isEqual(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/Input;->skipLabel:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/input/Input;->skipLabel:Ljava/lang/String;

    .line 35
    invoke-static {v0, v2}, Lcom/helpshift/util/StringUtils;->isEqual(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/input/Input;->botInfo:Ljava/lang/String;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/Input;->botInfo:Ljava/lang/String;

    .line 36
    invoke-static {p1, v0}, Lcom/helpshift/util/StringUtils;->isEqual(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method
