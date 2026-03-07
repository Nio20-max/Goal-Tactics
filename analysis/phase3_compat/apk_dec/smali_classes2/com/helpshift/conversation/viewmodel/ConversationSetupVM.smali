.class public Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;
.super Ljava/lang/Object;
.source "ConversationSetupVM.java"

# interfaces
.implements Lcom/helpshift/account/AuthenticationFailureDM$AuthenticationFailureObserver;
.implements Lcom/helpshift/conversation/viewmodel/ConversationSetupVMCallback;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_ConvStpVM"


# instance fields
.field private conversationSetupDM:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;

.field private domain:Lcom/helpshift/common/domain/Domain;

.field private final errorViewState:Lcom/helpshift/widget/MutableBaseViewState;

.field private platform:Lcom/helpshift/common/platform/Platform;

.field private final progressBarViewState:Lcom/helpshift/widget/MutableBaseViewState;

.field private final progressDescriptionViewState:Lcom/helpshift/widget/MutableBaseViewState;

.field private renderer:Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 36
    iput-object p3, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->conversationSetupDM:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;

    .line 37
    iput-object p4, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->renderer:Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;

    .line 38
    iput-object p2, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->domain:Lcom/helpshift/common/domain/Domain;

    .line 39
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->buildProgressBarWidget()Lcom/helpshift/widget/MutableBaseViewState;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->progressBarViewState:Lcom/helpshift/widget/MutableBaseViewState;

    .line 40
    new-instance p1, Lcom/helpshift/widget/MutableBaseViewState;

    invoke-direct {p1}, Lcom/helpshift/widget/MutableBaseViewState;-><init>()V

    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->progressDescriptionViewState:Lcom/helpshift/widget/MutableBaseViewState;

    .line 41
    new-instance p1, Lcom/helpshift/widget/MutableBaseViewState;

    invoke-direct {p1}, Lcom/helpshift/widget/MutableBaseViewState;-><init>()V

    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->errorViewState:Lcom/helpshift/widget/MutableBaseViewState;

    .line 43
    invoke-virtual {p3}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->init()V

    .line 44
    invoke-virtual {p3, p0}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->setCallback(Lcom/helpshift/conversation/viewmodel/ConversationSetupVMCallback;)V

    .line 45
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {p1}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/helpshift/account/AuthenticationFailureDM;->registerListener(Lcom/helpshift/account/AuthenticationFailureDM$AuthenticationFailureObserver;)V

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;)Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;
    .locals 0

    .line 19
    iget-object p0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->renderer:Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;

    return-object p0
.end method

.method static synthetic access$100(Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;)Lcom/helpshift/widget/MutableBaseViewState;
    .locals 0

    .line 19
    iget-object p0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->progressBarViewState:Lcom/helpshift/widget/MutableBaseViewState;

    return-object p0
.end method

.method static synthetic access$200(Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;)Lcom/helpshift/widget/MutableBaseViewState;
    .locals 0

    .line 19
    iget-object p0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->errorViewState:Lcom/helpshift/widget/MutableBaseViewState;

    return-object p0
.end method

.method static synthetic access$300(Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->showOfflineError()V

    return-void
.end method

.method private buildProgressBarWidget()Lcom/helpshift/widget/MutableBaseViewState;
    .locals 3

    .line 49
    new-instance v0, Lcom/helpshift/widget/MutableBaseViewState;

    invoke-direct {v0}, Lcom/helpshift/widget/MutableBaseViewState;-><init>()V

    .line 50
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->conversationSetupDM:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;

    .line 51
    invoke-virtual {v1}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->getState()Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    move-result-object v1

    .line 53
    sget-object v2, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->IN_PROGRESS:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    return-object v0
.end method

.method private handleConversationSetupComplete()V
    .locals 2

    .line 77
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$1;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$1;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method private showOfflineError()V
    .locals 2

    .line 113
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->progressBarViewState:Lcom/helpshift/widget/MutableBaseViewState;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    .line 114
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->progressDescriptionViewState:Lcom/helpshift/widget/MutableBaseViewState;

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    .line 115
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->errorViewState:Lcom/helpshift/widget/MutableBaseViewState;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    return-void
.end method


# virtual methods
.method public getDescriptionProgressViewState()Lcom/helpshift/widget/BaseViewState;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->progressDescriptionViewState:Lcom/helpshift/widget/MutableBaseViewState;

    return-object v0
.end method

.method public getProgressBarViewState()Lcom/helpshift/widget/BaseViewState;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->progressBarViewState:Lcom/helpshift/widget/MutableBaseViewState;

    return-object v0
.end method

.method public getUserOfflineErrorViewState()Lcom/helpshift/widget/BaseViewState;
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->errorViewState:Lcom/helpshift/widget/MutableBaseViewState;

    return-object v0
.end method

.method public onAuthenticationFailure()V
    .locals 2

    .line 133
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$4;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$4;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public onConversationSetupStateUpdate(Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;)V
    .locals 2

    .line 146
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->isOnline()Z

    move-result v0

    if-nez v0, :cond_0

    .line 147
    invoke-virtual {p0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->onNetworkUnavailable()V

    return-void

    .line 150
    :cond_0
    sget-object v0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$5;->$SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState:[I

    invoke-virtual {p1}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v1, 0x2

    if-eq p1, v1, :cond_3

    const/4 v1, 0x3

    if-eq p1, v1, :cond_2

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    goto :goto_0

    .line 163
    :cond_1
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->handleConversationSetupComplete()V

    goto :goto_0

    .line 158
    :cond_2
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->progressBarViewState:Lcom/helpshift/widget/MutableBaseViewState;

    invoke-virtual {p1, v0}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    .line 159
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->errorViewState:Lcom/helpshift/widget/MutableBaseViewState;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    goto :goto_0

    .line 153
    :cond_3
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->progressDescriptionViewState:Lcom/helpshift/widget/MutableBaseViewState;

    invoke-virtual {p1, v0}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    .line 155
    iget-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->progressBarViewState:Lcom/helpshift/widget/MutableBaseViewState;

    invoke-virtual {p1, v0}, Lcom/helpshift/widget/MutableBaseViewState;->setVisible(Z)V

    :goto_0
    return-void
.end method

.method public onDestroyView()V
    .locals 2

    const/4 v0, 0x0

    .line 71
    iput-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->renderer:Lcom/helpshift/conversation/activeconversation/usersetup/ConversationSetupRenderer;

    .line 72
    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->conversationSetupDM:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;

    invoke-virtual {v1, v0}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->setCallback(Lcom/helpshift/conversation/viewmodel/ConversationSetupVMCallback;)V

    .line 73
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-virtual {v0}, Lcom/helpshift/common/domain/Domain;->getAuthenticationFailureDM()Lcom/helpshift/account/AuthenticationFailureDM;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/helpshift/account/AuthenticationFailureDM;->unregisterListener(Lcom/helpshift/account/AuthenticationFailureDM$AuthenticationFailureObserver;)V

    return-void
.end method

.method public onNetworkAvailable()V
    .locals 2

    .line 91
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$2;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$2;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public onNetworkUnavailable()V
    .locals 2

    .line 103
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->domain:Lcom/helpshift/common/domain/Domain;

    new-instance v1, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$3;

    invoke-direct {v1, p0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM$3;-><init>(Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;)V

    invoke-virtual {v0, v1}, Lcom/helpshift/common/domain/Domain;->runOnUI(Lcom/helpshift/common/domain/F;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 59
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->conversationSetupDM:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;

    .line 60
    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->getState()Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    move-result-object v0

    .line 61
    sget-object v1, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->COMPLETED:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    if-ne v0, v1, :cond_0

    const-string v0, "Helpshift_ConvStpVM"

    const-string v1, "Conversation setup already complete."

    .line 62
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    invoke-direct {p0}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->handleConversationSetupComplete()V

    goto :goto_0

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationSetupVM;->conversationSetupDM:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;

    invoke-virtual {v0}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->startSetup()V

    :goto_0
    return-void
.end method
