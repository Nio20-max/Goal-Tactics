.class public final enum Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;
.super Ljava/lang/Enum;
.source "ConversationSetupDM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ConversationSetupState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

.field public static final enum COMPLETED:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

.field public static final enum FAILED:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

.field public static final enum IN_PROGRESS:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

.field public static final enum NOT_STARTED:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 140
    new-instance v0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    const-string v1, "NOT_STARTED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->NOT_STARTED:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    .line 141
    new-instance v1, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    const-string v3, "IN_PROGRESS"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->IN_PROGRESS:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    .line 142
    new-instance v3, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    const-string v5, "COMPLETED"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->COMPLETED:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    .line 143
    new-instance v5, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    const-string v7, "FAILED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->FAILED:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 139
    sput-object v7, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->$VALUES:[Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 139
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;
    .locals 1

    .line 139
    const-class v0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;
    .locals 1

    .line 139
    sget-object v0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->$VALUES:[Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    invoke-virtual {v0}, [Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    return-object v0
.end method
