.class public Lcom/helpshift/configuration/response/RootServerConfig;
.super Ljava/lang/Object;
.source "RootServerConfig.java"


# instance fields
.field public final activelySyncAppLaunchEvent:Z

.field public final allowUserAttachments:Z

.field public final autoFillFirstPreissueMessage:Z

.field public final avatarConfig:Lcom/helpshift/configuration/response/AvatarConfig;

.field public final breadcrumbLimit:I

.field public final conversationGreetingMessage:Ljava/lang/String;

.field public final conversationHeaderImageUrl:Ljava/lang/String;

.field public final conversationHeaderTitleText:Ljava/lang/String;

.field public final conversationalIssueFiling:Z

.field public final customerSatisfactionSurvey:Z

.field public final debugLogLimit:I

.field public final disableHelpshiftBranding:Z

.field public final disableInAppConversation:Z

.field public final enableTypingIndicator:Z

.field public final isShowConversationHeaderEnabled:Z

.field public final isSmartIntentEnabled:Z

.field public final issueExists:Z

.field public final lastRedactionAt:Ljava/lang/Long;

.field public final logLevel:I

.field public final periodicFetchInterval:J

.field public final periodicReview:Lcom/helpshift/configuration/response/PeriodicReview;

.field public final periodicSyncAppLaunchEventInterval:J

.field public final preissueResetInterval:J

.field public final profileCreatedAt:Ljava/lang/Long;

.field public final profileFormEnable:Z

.field public final requireNameAndEmail:Z

.field public final reviewUrl:Ljava/lang/String;

.field public final shouldShowConversationHistory:Z

.field public final showConversationResolutionQuestion:Z

.field public final smartIntentClientCacheInterval:Ljava/lang/Long;

.field public final smartIntentSearchModelRefreshInterval:Ljava/lang/Long;

.field public final smartIntentTreeRefreshInterval:Ljava/lang/Long;

.field public final whiteListedAttachments:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ZZZZZZIILjava/lang/String;Lcom/helpshift/configuration/response/PeriodicReview;ZLjava/lang/String;ZZZLjava/lang/Long;Ljava/lang/Long;ZJJZZLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/util/ArrayList;IZLjava/lang/String;Ljava/lang/String;Lcom/helpshift/configuration/response/AvatarConfig;ZJ)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZZZZZII",
            "Ljava/lang/String;",
            "Lcom/helpshift/configuration/response/PeriodicReview;",
            "Z",
            "Ljava/lang/String;",
            "ZZZ",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            "ZJJZZ",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            "Ljava/util/ArrayList<",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;IZ",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/helpshift/configuration/response/AvatarConfig;",
            "ZJ)V"
        }
    .end annotation

    move-object v0, p0

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move v1, p1

    .line 93
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->requireNameAndEmail:Z

    move v1, p2

    .line 94
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->profileFormEnable:Z

    move v1, p3

    .line 95
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->customerSatisfactionSurvey:Z

    move v1, p4

    .line 96
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->disableInAppConversation:Z

    move v1, p5

    .line 97
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->disableHelpshiftBranding:Z

    move v1, p6

    .line 98
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->issueExists:Z

    move v1, p7

    .line 99
    iput v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->debugLogLimit:I

    move v1, p8

    .line 100
    iput v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->breadcrumbLimit:I

    move-object v1, p9

    .line 101
    iput-object v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->reviewUrl:Ljava/lang/String;

    move-object v1, p10

    .line 102
    iput-object v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->periodicReview:Lcom/helpshift/configuration/response/PeriodicReview;

    move v1, p11

    .line 103
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->conversationalIssueFiling:Z

    move-object v1, p12

    .line 104
    iput-object v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->conversationGreetingMessage:Ljava/lang/String;

    move/from16 v1, p13

    .line 105
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->enableTypingIndicator:Z

    move/from16 v1, p14

    .line 106
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->showConversationResolutionQuestion:Z

    move/from16 v1, p15

    .line 107
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->shouldShowConversationHistory:Z

    move-object/from16 v1, p16

    .line 108
    iput-object v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->lastRedactionAt:Ljava/lang/Long;

    move-object/from16 v1, p17

    .line 109
    iput-object v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->profileCreatedAt:Ljava/lang/Long;

    move/from16 v1, p18

    .line 110
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->allowUserAttachments:Z

    move-wide/from16 v1, p19

    .line 111
    iput-wide v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->periodicFetchInterval:J

    move-wide/from16 v1, p21

    .line 112
    iput-wide v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->preissueResetInterval:J

    move/from16 v1, p23

    .line 113
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->autoFillFirstPreissueMessage:Z

    move/from16 v1, p24

    .line 114
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->isSmartIntentEnabled:Z

    move-object/from16 v1, p25

    .line 115
    iput-object v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->smartIntentSearchModelRefreshInterval:Ljava/lang/Long;

    move-object/from16 v1, p26

    .line 116
    iput-object v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->smartIntentTreeRefreshInterval:Ljava/lang/Long;

    move-object/from16 v1, p27

    .line 117
    iput-object v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->smartIntentClientCacheInterval:Ljava/lang/Long;

    move-object/from16 v1, p28

    .line 118
    iput-object v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->whiteListedAttachments:Ljava/util/ArrayList;

    move/from16 v1, p29

    .line 119
    iput v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->logLevel:I

    move/from16 v1, p30

    .line 120
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->isShowConversationHeaderEnabled:Z

    move-object/from16 v1, p31

    .line 121
    iput-object v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->conversationHeaderTitleText:Ljava/lang/String;

    move-object/from16 v1, p32

    .line 122
    iput-object v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->conversationHeaderImageUrl:Ljava/lang/String;

    move-object/from16 v1, p33

    .line 123
    iput-object v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->avatarConfig:Lcom/helpshift/configuration/response/AvatarConfig;

    move/from16 v1, p34

    .line 124
    iput-boolean v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->activelySyncAppLaunchEvent:Z

    move-wide/from16 v1, p35

    .line 125
    iput-wide v1, v0, Lcom/helpshift/configuration/response/RootServerConfig;->periodicSyncAppLaunchEventInterval:J

    return-void
.end method
