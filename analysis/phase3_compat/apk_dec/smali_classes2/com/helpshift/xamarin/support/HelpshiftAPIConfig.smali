.class public Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;
.super Ljava/lang/Object;
.source "HelpshiftAPIConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    }
.end annotation


# instance fields
.field public final conversationPrefillText:Ljava/lang/String;

.field public final customContactUsFlows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/xamarin/flows/Flow;",
            ">;"
        }
    .end annotation
.end field

.field public final customIssueFieldsJson:Ljava/lang/String;

.field public final customMetadata:Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;

.field public final enableContactUs:Lcom/helpshift/xamarin/support/HsEnableContactUs;

.field public final enableFullPrivacy:Z

.field public final enableTypingIndicator:Z

.field public final extrasJson:Ljava/lang/String;

.field public final gotoConversationAfterContactUs:Z

.field public final hideNameAndEmail:Z

.field public final requireEmail:Z

.field public final showConversationInfoScreen:Z

.field public final showConversationResolutionQuestion:Z

.field public final showSearchOnNewConversation:Z

.field public final toolbarId:I

.field public final withTagsMatching:Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;


# direct methods
.method constructor <init>(Lcom/helpshift/xamarin/support/HsEnableContactUs;ZZZLjava/lang/String;ZZZLjava/util/List;Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;IZZLjava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/xamarin/support/HsEnableContactUs;",
            "ZZZ",
            "Ljava/lang/String;",
            "ZZZ",
            "Ljava/util/List<",
            "Lcom/helpshift/xamarin/flows/Flow;",
            ">;",
            "Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;",
            "Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;",
            "IZZ",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    move-object v0, p0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move-object v1, p1

    .line 34
    iput-object v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->enableContactUs:Lcom/helpshift/xamarin/support/HsEnableContactUs;

    move v1, p2

    .line 35
    iput-boolean v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->gotoConversationAfterContactUs:Z

    move v1, p3

    .line 36
    iput-boolean v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->requireEmail:Z

    move v1, p4

    .line 37
    iput-boolean v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->hideNameAndEmail:Z

    move-object v1, p5

    .line 38
    iput-object v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->conversationPrefillText:Ljava/lang/String;

    move v1, p6

    .line 39
    iput-boolean v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->enableFullPrivacy:Z

    move v1, p7

    .line 40
    iput-boolean v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->showSearchOnNewConversation:Z

    move v1, p8

    .line 41
    iput-boolean v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->showConversationResolutionQuestion:Z

    move-object v1, p9

    .line 42
    iput-object v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->customContactUsFlows:Ljava/util/List;

    move-object v1, p10

    .line 43
    iput-object v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->withTagsMatching:Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;

    move-object v1, p11

    .line 44
    iput-object v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->customMetadata:Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;

    move v1, p12

    .line 45
    iput v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->toolbarId:I

    move v1, p13

    .line 46
    iput-boolean v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->showConversationInfoScreen:Z

    move/from16 v1, p14

    .line 47
    iput-boolean v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->enableTypingIndicator:Z

    move-object/from16 v1, p15

    .line 48
    iput-object v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->customIssueFieldsJson:Ljava/lang/String;

    move-object/from16 v1, p16

    .line 49
    iput-object v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;->extrasJson:Ljava/lang/String;

    return-void
.end method
