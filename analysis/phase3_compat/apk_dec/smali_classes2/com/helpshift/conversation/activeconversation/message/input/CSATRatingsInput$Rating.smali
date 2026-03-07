.class public Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;
.super Ljava/lang/Object;
.source "CSATRatingsInput.java"

# interfaces
.implements Lcom/helpshift/util/HSCloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Rating"
.end annotation


# instance fields
.field public final jsonData:Ljava/lang/String;

.field public final title:Ljava/lang/String;

.field public final value:I


# direct methods
.method private constructor <init>(Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;)V
    .locals 1

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->title:Ljava/lang/String;

    iput-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->title:Ljava/lang/String;

    .line 60
    iget v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->value:I

    iput v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->value:I

    .line 61
    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->jsonData:Ljava/lang/String;

    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->jsonData:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->title:Ljava/lang/String;

    .line 54
    iput p2, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->value:I

    .line 55
    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->jsonData:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;
    .locals 1

    .line 83
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;-><init>(Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;)V

    return-object v0
.end method

.method public bridge synthetic deepClone()Ljava/lang/Object;
    .locals 1

    .line 46
    invoke-virtual {p0}, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->deepClone()Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 72
    instance-of v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 76
    :cond_0
    check-cast p1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;

    .line 78
    iget-object v0, p1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->title:Ljava/lang/String;

    iget-object v2, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->title:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->jsonData:Ljava/lang/String;

    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Rating;->jsonData:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method
