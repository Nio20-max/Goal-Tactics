.class public final enum Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;
.super Ljava/lang/Enum;
.source "Author.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/conversation/activeconversation/message/Author;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AuthorRole"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

.field public static final enum AGENT:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

.field public static final enum BOT:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

.field public static final enum LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

.field public static final enum SYSTEM:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;


# instance fields
.field private final roleName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 31
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v1, "AGENT"

    const/4 v2, 0x0

    const-string v3, "a"

    invoke-direct {v0, v1, v2, v3}, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->AGENT:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    .line 32
    new-instance v1, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v3, "BOT"

    const/4 v4, 0x1

    const-string v5, "b"

    invoke-direct {v1, v3, v4, v5}, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->BOT:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    .line 33
    new-instance v3, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v5, "SYSTEM"

    const/4 v6, 0x2

    const-string v7, "s"

    invoke-direct {v3, v5, v6, v7}, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->SYSTEM:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    .line 38
    new-instance v5, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const-string v7, "LOCAL_USER"

    const/4 v8, 0x3

    const-string v9, "local_user"

    invoke-direct {v5, v7, v8, v9}, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->LOCAL_USER:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 30
    sput-object v7, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->$VALUES:[Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 42
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 43
    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->roleName:Ljava/lang/String;

    return-void
.end method

.method public static getEnum(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;
    .locals 5

    .line 47
    invoke-static {}, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->values()[Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 48
    iget-object v4, v3, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->roleName:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 52
    :cond_1
    sget-object p0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->SYSTEM:Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;
    .locals 1

    .line 30
    const-class v0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;
    .locals 1

    .line 30
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->$VALUES:[Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    invoke-virtual {v0}, [Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;

    return-object v0
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/Author$AuthorRole;->roleName:Ljava/lang/String;

    return-object v0
.end method
