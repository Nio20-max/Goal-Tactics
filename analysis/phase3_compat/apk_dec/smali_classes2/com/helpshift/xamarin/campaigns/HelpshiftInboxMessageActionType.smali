.class public final enum Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;
.super Ljava/lang/Enum;
.source "HelpshiftInboxMessageActionType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

.field public static final enum OPEN_DEEP_LINK:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

.field public static final enum SHOW_ALERT_TO_RATE_APP:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

.field public static final enum SHOW_CONVERSATION:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

.field public static final enum SHOW_FAQS:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

.field public static final enum SHOW_FAQ_SECTION:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

.field public static final enum SHOW_SINGLE_FAQ:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

.field public static final enum UNKNOWN:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 4
    new-instance v0, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    const-string v1, "UNKNOWN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->UNKNOWN:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    .line 5
    new-instance v1, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    const-string v3, "OPEN_DEEP_LINK"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v4}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->OPEN_DEEP_LINK:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    .line 6
    new-instance v3, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    const-string v5, "SHOW_FAQS"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6, v6}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;-><init>(Ljava/lang/String;II)V

    sput-object v3, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->SHOW_FAQS:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    .line 7
    new-instance v5, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    const-string v7, "SHOW_FAQ_SECTION"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8, v8}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;-><init>(Ljava/lang/String;II)V

    sput-object v5, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->SHOW_FAQ_SECTION:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    .line 8
    new-instance v7, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    const-string v9, "SHOW_CONVERSATION"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v10}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;-><init>(Ljava/lang/String;II)V

    sput-object v7, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->SHOW_CONVERSATION:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    .line 9
    new-instance v9, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    const-string v11, "SHOW_SINGLE_FAQ"

    const/4 v12, 0x5

    invoke-direct {v9, v11, v12, v12}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;-><init>(Ljava/lang/String;II)V

    sput-object v9, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->SHOW_SINGLE_FAQ:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    .line 10
    new-instance v11, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    const-string v13, "SHOW_ALERT_TO_RATE_APP"

    const/4 v14, 0x6

    invoke-direct {v11, v13, v14, v14}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;-><init>(Ljava/lang/String;II)V

    sput-object v11, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->SHOW_ALERT_TO_RATE_APP:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    const/4 v13, 0x7

    new-array v13, v13, [Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    aput-object v0, v13, v2

    aput-object v1, v13, v4

    aput-object v3, v13, v6

    aput-object v5, v13, v8

    aput-object v7, v13, v10

    aput-object v9, v13, v12

    aput-object v11, v13, v14

    .line 3
    sput-object v13, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->$VALUES:[Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 15
    iput p3, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->value:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;
    .locals 1

    .line 3
    const-class v0, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;
    .locals 1

    .line 3
    sget-object v0, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->$VALUES:[Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    invoke-virtual {v0}, [Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .locals 1

    .line 19
    iget v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->value:I

    return v0
.end method
