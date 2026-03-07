.class public Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
.super Ljava/lang/Object;
.source "HelpshiftAPIConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private conversationPrefillText:Ljava/lang/String;

.field private customContactUsFlows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/xamarin/flows/Flow;",
            ">;"
        }
    .end annotation
.end field

.field private customIssueFieldsJson:Ljava/lang/String;

.field private customMetadata:Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;

.field private enableContactUs:Lcom/helpshift/xamarin/support/HsEnableContactUs;

.field private enableFullPrivacy:Z

.field private enableTypingIndicator:Z

.field private extrasJson:Ljava/lang/String;

.field private gotoConversationAfterContactUs:Z

.field private hideNameAndEmail:Z

.field private requireEmail:Z

.field private showConversationInfoScreen:Z

.field private showConversationResolutionQuestion:Z

.field private showSearchOnNewConversation:Z

.field private toolbarId:I

.field private withTagsMatching:Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public build()Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;
    .locals 20

    move-object/from16 v0, p0

    .line 152
    new-instance v18, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;

    move-object/from16 v1, v18

    iget-object v2, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->enableContactUs:Lcom/helpshift/xamarin/support/HsEnableContactUs;

    iget-boolean v3, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->gotoConversationAfterContactUs:Z

    iget-boolean v4, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->requireEmail:Z

    iget-boolean v5, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->hideNameAndEmail:Z

    iget-object v6, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->conversationPrefillText:Ljava/lang/String;

    iget-boolean v7, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->enableFullPrivacy:Z

    iget-boolean v8, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->showSearchOnNewConversation:Z

    iget-boolean v9, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->showConversationResolutionQuestion:Z

    iget-object v10, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->customContactUsFlows:Ljava/util/List;

    iget-object v11, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->withTagsMatching:Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;

    iget-object v12, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->customMetadata:Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;

    iget v13, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->toolbarId:I

    iget-boolean v14, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->showConversationInfoScreen:Z

    iget-boolean v15, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->enableTypingIndicator:Z

    move-object/from16 v19, v1

    iget-object v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->customIssueFieldsJson:Ljava/lang/String;

    move-object/from16 v16, v1

    iget-object v1, v0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->extrasJson:Ljava/lang/String;

    move-object/from16 v17, v1

    move-object/from16 v1, v19

    invoke-direct/range {v1 .. v17}, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig;-><init>(Lcom/helpshift/xamarin/support/HsEnableContactUs;ZZZLjava/lang/String;ZZZLjava/util/List;Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;IZZLjava/lang/String;Ljava/lang/String;)V

    return-object v18
.end method

.method public setConversationPrefillText(Ljava/lang/String;)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 92
    iput-object p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->conversationPrefillText:Ljava/lang/String;

    return-object p0
.end method

.method public setCustomContactUsFlows(Ljava/util/List;)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/xamarin/flows/Flow;",
            ">;)",
            "Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;"
        }
    .end annotation

    .line 112
    iput-object p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->customContactUsFlows:Ljava/util/List;

    return-object p0
.end method

.method public setCustomIssueFieldsJson(Ljava/lang/String;)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 142
    iput-object p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->customIssueFieldsJson:Ljava/lang/String;

    return-object p0
.end method

.method public setCustomMetadata(Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 122
    iput-object p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->customMetadata:Lcom/helpshift/xamarin/support/HelpshiftSupportMetadata;

    return-object p0
.end method

.method public setEnableContactUs(Lcom/helpshift/xamarin/support/HsEnableContactUs;)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 72
    iput-object p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->enableContactUs:Lcom/helpshift/xamarin/support/HsEnableContactUs;

    return-object p0
.end method

.method public setEnableFullPrivacy(Z)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 97
    iput-boolean p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->enableFullPrivacy:Z

    return-object p0
.end method

.method public setEnableTypingIndicator(Z)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 137
    iput-boolean p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->enableTypingIndicator:Z

    return-object p0
.end method

.method public setExtrasJson(Ljava/lang/String;)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 147
    iput-object p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->extrasJson:Ljava/lang/String;

    return-object p0
.end method

.method public setGotoConversationAfterContactUs(Z)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 77
    iput-boolean p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->gotoConversationAfterContactUs:Z

    return-object p0
.end method

.method public setHideNameAndEmail(Z)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 87
    iput-boolean p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->hideNameAndEmail:Z

    return-object p0
.end method

.method public setRequireEmail(Z)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 82
    iput-boolean p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->requireEmail:Z

    return-object p0
.end method

.method public setShowConversationInfoScreen(Z)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 132
    iput-boolean p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->showConversationInfoScreen:Z

    return-object p0
.end method

.method public setShowConversationResolutionQuestion(Z)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 107
    iput-boolean p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->showConversationResolutionQuestion:Z

    return-object p0
.end method

.method public setShowSearchOnNewConversation(Z)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 102
    iput-boolean p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->showSearchOnNewConversation:Z

    return-object p0
.end method

.method public setToolbarId(I)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 127
    iput p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->toolbarId:I

    return-object p0
.end method

.method public setWithTagsMatching(Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;)Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;
    .locals 0

    .line 117
    iput-object p1, p0, Lcom/helpshift/xamarin/support/HelpshiftAPIConfig$Builder;->withTagsMatching:Lcom/helpshift/xamarin/support/HelpshiftFAQFilter;

    return-object p0
.end method
