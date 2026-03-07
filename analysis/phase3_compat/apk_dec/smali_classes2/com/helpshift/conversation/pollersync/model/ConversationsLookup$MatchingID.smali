.class public final enum Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;
.super Ljava/lang/Enum;
.source "ConversationsLookup.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/conversation/pollersync/model/ConversationsLookup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MatchingID"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

.field public static final enum PREISSUE_ID:Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

.field public static final enum PREISSUE_REQUEST_ID:Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

.field public static final enum SERVER_ID:Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 95
    new-instance v0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    const-string v1, "SERVER_ID"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;->SERVER_ID:Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    .line 96
    new-instance v1, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    const-string v3, "PREISSUE_ID"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;->PREISSUE_ID:Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    .line 97
    new-instance v3, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    const-string v5, "PREISSUE_REQUEST_ID"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;->PREISSUE_REQUEST_ID:Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    const/4 v5, 0x3

    new-array v5, v5, [Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    aput-object v0, v5, v2

    aput-object v1, v5, v4

    aput-object v3, v5, v6

    .line 94
    sput-object v5, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;->$VALUES:[Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 94
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;
    .locals 1

    .line 94
    const-class v0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;
    .locals 1

    .line 94
    sget-object v0, Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;->$VALUES:[Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    invoke-virtual {v0}, [Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/conversation/pollersync/model/ConversationsLookup$MatchingID;

    return-object v0
.end method
