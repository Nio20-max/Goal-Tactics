.class public Lcom/helpshift/conversation/activeconversation/message/Author;
.super Ljava/lang/Object;
.source "Author.java"

# interfaces
.implements Lcom/helpshift/util/HSCloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;
    }
.end annotation


# instance fields
.field public final authorId:Ljava/lang/String;

.field public authorName:Ljava/lang/String;

.field public localAvatarImagePath:Ljava/lang/String;

.field public final role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;


# direct methods
.method public constructor <init>(Lcom/helpshift/conversation/activeconversation/message/Author;)V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/Author;->authorName:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/Author;->authorName:Ljava/lang/String;

    .line 23
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/Author;->authorId:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/Author;->authorId:Ljava/lang/String;

    .line 24
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/Author;->role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/Author;->role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    .line 25
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/Author;->localAvatarImagePath:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/Author;->localAvatarImagePath:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/Author;->authorName:Ljava/lang/String;

    .line 17
    iput-object p2, p0, Lcom/helpshift/conversation/activeconversation/message/Author;->authorId:Ljava/lang/String;

    .line 18
    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/message/Author;->role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/Author;
    .locals 1

    .line 63
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/Author;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/Author;-><init>(Lcom/helpshift/conversation/activeconversation/message/Author;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 9
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/Author;->deepClone()Lcom/helpshift/conversation/activeconversation/message/Author;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 68
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/Author;

    if-eqz p1, :cond_0

    .line 69
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/Author;->authorName:Ljava/lang/String;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/Author;->authorName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/Author;->authorId:Ljava/lang/String;

    iget-object v1, p0, Lcom/helpshift/conversation/activeconversation/message/Author;->authorId:Ljava/lang/String;

    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/Author;->role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/Author;->role:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
