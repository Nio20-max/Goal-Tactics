.class public final enum Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;
.super Ljava/lang/Enum;
.source "CSATRatingsInput.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

.field public static final enum STAR_5:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;


# instance fields
.field private final ratingInputType:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 88
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    const-string v1, "STAR_5"

    const/4 v2, 0x0

    const-string v3, "five_star"

    invoke-direct {v0, v1, v2, v3}, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;->STAR_5:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    aput-object v0, v1, v2

    .line 87
    sput-object v1, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;->$VALUES:[Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

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

    .line 92
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 93
    iput-object p3, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;->ratingInputType:Ljava/lang/String;

    return-void
.end method

.method public static getType()Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;
    .locals 1

    .line 103
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;->STAR_5:Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;
    .locals 1

    .line 87
    const-class v0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;
    .locals 1

    .line 87
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;->$VALUES:[Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    invoke-virtual {v0}, [Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/helpshift/conversation/activeconversation/message/input/CSATRatingsInput$Type;->ratingInputType:Ljava/lang/String;

    return-object v0
.end method
