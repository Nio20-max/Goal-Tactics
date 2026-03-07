.class public final enum Lcom/helpshift/xamarin/support/HsEnableContactUs;
.super Ljava/lang/Enum;
.source "HsEnableContactUs.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/xamarin/support/HsEnableContactUs;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/xamarin/support/HsEnableContactUs;

.field public static final enum AFTER_MARKING_ANSWER_UNHELPFUL:Lcom/helpshift/xamarin/support/HsEnableContactUs;

.field public static final enum AFTER_VIEWING_FAQS:Lcom/helpshift/xamarin/support/HsEnableContactUs;

.field public static final enum ALWAYS:Lcom/helpshift/xamarin/support/HsEnableContactUs;

.field public static final enum NEVER:Lcom/helpshift/xamarin/support/HsEnableContactUs;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 4
    new-instance v0, Lcom/helpshift/xamarin/support/HsEnableContactUs;

    const-string v1, "ALWAYS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/helpshift/xamarin/support/HsEnableContactUs;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/helpshift/xamarin/support/HsEnableContactUs;->ALWAYS:Lcom/helpshift/xamarin/support/HsEnableContactUs;

    .line 5
    new-instance v1, Lcom/helpshift/xamarin/support/HsEnableContactUs;

    const-string v3, "AFTER_VIEWING_FAQS"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/helpshift/xamarin/support/HsEnableContactUs;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/helpshift/xamarin/support/HsEnableContactUs;->AFTER_VIEWING_FAQS:Lcom/helpshift/xamarin/support/HsEnableContactUs;

    .line 6
    new-instance v3, Lcom/helpshift/xamarin/support/HsEnableContactUs;

    const-string v5, "AFTER_MARKING_ANSWER_UNHELPFUL"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/helpshift/xamarin/support/HsEnableContactUs;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/helpshift/xamarin/support/HsEnableContactUs;->AFTER_MARKING_ANSWER_UNHELPFUL:Lcom/helpshift/xamarin/support/HsEnableContactUs;

    .line 7
    new-instance v5, Lcom/helpshift/xamarin/support/HsEnableContactUs;

    const-string v7, "NEVER"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/helpshift/xamarin/support/HsEnableContactUs;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/helpshift/xamarin/support/HsEnableContactUs;->NEVER:Lcom/helpshift/xamarin/support/HsEnableContactUs;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/helpshift/xamarin/support/HsEnableContactUs;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 3
    sput-object v7, Lcom/helpshift/xamarin/support/HsEnableContactUs;->$VALUES:[Lcom/helpshift/xamarin/support/HsEnableContactUs;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/xamarin/support/HsEnableContactUs;
    .locals 1

    .line 3
    const-class v0, Lcom/helpshift/xamarin/support/HsEnableContactUs;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/xamarin/support/HsEnableContactUs;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/xamarin/support/HsEnableContactUs;
    .locals 1

    .line 3
    sget-object v0, Lcom/helpshift/xamarin/support/HsEnableContactUs;->$VALUES:[Lcom/helpshift/xamarin/support/HsEnableContactUs;

    invoke-virtual {v0}, [Lcom/helpshift/xamarin/support/HsEnableContactUs;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/xamarin/support/HsEnableContactUs;

    return-object v0
.end method
