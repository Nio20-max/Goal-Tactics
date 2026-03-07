.class public Lcom/helpshift/configuration/response/AvatarConfig;
.super Ljava/lang/Object;
.source "AvatarConfig.java"


# instance fields
.field public final agentFallbackImageUrl:Ljava/lang/String;

.field public final botFallbackImageUrl:Ljava/lang/String;

.field public final cacheExpiry:J

.field public final isPersonalisedAgentEnabled:Z

.field public final isPersonalisedBotEnabled:Z

.field public final isShowAvatarInChatFeedEnabled:Z

.field public final systemMessageNickname:Ljava/lang/String;

.field public final templateUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZZLjava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-boolean p1, p0, Lcom/helpshift/configuration/response/AvatarConfig;->isShowAvatarInChatFeedEnabled:Z

    .line 38
    iput-boolean p2, p0, Lcom/helpshift/configuration/response/AvatarConfig;->isPersonalisedAgentEnabled:Z

    .line 39
    iput-object p3, p0, Lcom/helpshift/configuration/response/AvatarConfig;->agentFallbackImageUrl:Ljava/lang/String;

    .line 40
    iput-boolean p4, p0, Lcom/helpshift/configuration/response/AvatarConfig;->isPersonalisedBotEnabled:Z

    .line 41
    iput-object p5, p0, Lcom/helpshift/configuration/response/AvatarConfig;->botFallbackImageUrl:Ljava/lang/String;

    .line 42
    iput-object p6, p0, Lcom/helpshift/configuration/response/AvatarConfig;->systemMessageNickname:Ljava/lang/String;

    .line 43
    iput-object p7, p0, Lcom/helpshift/configuration/response/AvatarConfig;->templateUrl:Ljava/lang/String;

    .line 44
    iput-wide p8, p0, Lcom/helpshift/configuration/response/AvatarConfig;->cacheExpiry:J

    return-void
.end method
