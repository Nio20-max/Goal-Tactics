.class public Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;
.super Ljava/lang/Object;
.source "ConversationSetupDM.java"

# interfaces
.implements Lcom/helpshift/account/domainmodel/UserSetupDM$UserSetupListener;
.implements Lcom/helpshift/util/Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/helpshift/account/domainmodel/UserSetupDM$UserSetupListener;",
        "Lcom/helpshift/util/Callback<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_ConvStpFrg"


# instance fields
.field private callback:Lcom/helpshift/conversation/viewmodel/ConversationSetupVMCallback;

.field private configFetchDM:Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;

.field private final platform:Lcom/helpshift/common/platform/Platform;

.field private userSetupDM:Lcom/helpshift/account/domainmodel/UserSetupDM;


# direct methods
.method public constructor <init>(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;Lcom/helpshift/account/domainmodel/UserSetupDM;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->platform:Lcom/helpshift/common/platform/Platform;

    .line 30
    iput-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->configFetchDM:Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;

    .line 31
    iput-object p3, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->userSetupDM:Lcom/helpshift/account/domainmodel/UserSetupDM;

    return-void
.end method

.method private handleConfigFetchSuccessCallback()V
    .locals 2

    const-string v0, "Helpshift_ConvStpFrg"

    const-string v1, "Handling config fetch complete."

    .line 123
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    sget-object v0, Lcom/helpshift/account/domainmodel/UserSetupState;->COMPLETED:Lcom/helpshift/account/domainmodel/UserSetupState;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->userSetupDM:Lcom/helpshift/account/domainmodel/UserSetupDM;

    invoke-virtual {v1}, Lcom/helpshift/account/domainmodel/UserSetupDM;->getState()Lcom/helpshift/account/domainmodel/UserSetupState;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 125
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->handleConversationSetupComplete()V

    :cond_0
    return-void
.end method

.method private handleConversationSetupComplete()V
    .locals 2

    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Conversation setup complete. Callback: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->callback:Lcom/helpshift/conversation/viewmodel/ConversationSetupVMCallback;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ConvStpFrg"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->callback:Lcom/helpshift/conversation/viewmodel/ConversationSetupVMCallback;

    if-eqz v0, :cond_0

    .line 118
    sget-object v1, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->COMPLETED:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    invoke-interface {v0, v1}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVMCallback;->onConversationSetupStateUpdate(Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;)V

    :cond_0
    return-void
.end method

.method private handleUserSetupComplete()V
    .locals 2

    const-string v0, "Helpshift_ConvStpFrg"

    const-string v1, "Handling user setup complete."

    .line 106
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object v0

    sget-object v1, Lcom/helpshift/common/domain/network/NetworkConstants;->SUPPORT_CONFIG_ROUTE:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->getETag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->configFetchDM:Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->fetchServerConfig(Z)V

    goto :goto_0

    .line 111
    :cond_0
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->handleConversationSetupComplete()V

    :goto_0
    return-void
.end method


# virtual methods
.method public getState()Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;
    .locals 3

    .line 63
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->userSetupDM:Lcom/helpshift/account/domainmodel/UserSetupDM;

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserSetupDM;->getState()Lcom/helpshift/account/domainmodel/UserSetupState;

    move-result-object v0

    .line 65
    sget-object v1, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$1;->$SwitchMap$com$helpshift$account$domainmodel$UserSetupState:[I

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserSetupState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 73
    :cond_0
    sget-object v1, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->FAILED:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    goto :goto_0

    .line 70
    :cond_1
    sget-object v1, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->NOT_STARTED:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    goto :goto_0

    .line 67
    :cond_2
    sget-object v1, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->IN_PROGRESS:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    .line 78
    :goto_0
    sget-object v2, Lcom/helpshift/account/domainmodel/UserSetupState;->COMPLETED:Lcom/helpshift/account/domainmodel/UserSetupState;

    if-eq v0, v2, :cond_3

    return-object v1

    .line 83
    :cond_3
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getNetworkRequestDAO()Lcom/helpshift/common/platform/network/NetworkRequestDAO;

    move-result-object v0

    sget-object v1, Lcom/helpshift/common/domain/network/NetworkConstants;->SUPPORT_CONFIG_ROUTE:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/helpshift/common/platform/network/NetworkRequestDAO;->getETag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 84
    sget-object v0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->COMPLETED:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    return-object v0

    .line 87
    :cond_4
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->configFetchDM:Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;

    invoke-virtual {v0}, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->isFetchInProgress()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 90
    sget-object v0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->IN_PROGRESS:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    return-object v0

    .line 94
    :cond_5
    sget-object v0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;->IN_PROGRESS:Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    return-object v0
.end method

.method public init()V
    .locals 2

    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Registering for usersetup and config fetch updates: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ConvStpFrg"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->userSetupDM:Lcom/helpshift/account/domainmodel/UserSetupDM;

    invoke-virtual {v0, p0}, Lcom/helpshift/account/domainmodel/UserSetupDM;->registerUserSetupListener(Lcom/helpshift/account/domainmodel/UserSetupDM$UserSetupListener;)V

    .line 37
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->configFetchDM:Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;

    invoke-virtual {v0, p0}, Lcom/helpshift/configuration/domainmodel/ConfigFetchDM;->setListener(Lcom/helpshift/util/Callback;)V

    return-void
.end method

.method public bridge synthetic onFailure(Ljava/lang/Object;)V
    .locals 0

    .line 19
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->onFailure(Ljava/lang/Void;)V

    return-void
.end method

.method public onFailure(Ljava/lang/Void;)V
    .locals 0

    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 19
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->onSuccess(Ljava/lang/Void;)V

    return-void
.end method

.method public onSuccess(Ljava/lang/Void;)V
    .locals 0

    .line 131
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->handleConfigFetchSuccessCallback()V

    return-void
.end method

.method public setCallback(Lcom/helpshift/conversation/viewmodel/ConversationSetupVMCallback;)V
    .locals 0

    .line 41
    iput-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->callback:Lcom/helpshift/conversation/viewmodel/ConversationSetupVMCallback;

    return-void
.end method

.method public startSetup()V
    .locals 2

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Starting conversation setup. Callback: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->callback:Lcom/helpshift/conversation/viewmodel/ConversationSetupVMCallback;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Helpshift_ConvStpFrg"

    invoke-static {v1, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->callback:Lcom/helpshift/conversation/viewmodel/ConversationSetupVMCallback;

    if-eqz v0, :cond_0

    .line 48
    invoke-virtual {p0}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->getState()Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/helpshift/conversation/viewmodel/ConversationSetupVMCallback;->onConversationSetupStateUpdate(Lcom/helpshift/conversation/domainmodel/ConversationSetupDM$ConversationSetupState;)V

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->userSetupDM:Lcom/helpshift/account/domainmodel/UserSetupDM;

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserSetupDM;->getState()Lcom/helpshift/account/domainmodel/UserSetupState;

    move-result-object v0

    sget-object v1, Lcom/helpshift/account/domainmodel/UserSetupState;->COMPLETED:Lcom/helpshift/account/domainmodel/UserSetupState;

    if-ne v0, v1, :cond_1

    .line 52
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->handleUserSetupComplete()V

    goto :goto_0

    .line 55
    :cond_1
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->userSetupDM:Lcom/helpshift/account/domainmodel/UserSetupDM;

    invoke-virtual {v0}, Lcom/helpshift/account/domainmodel/UserSetupDM;->startSetup()V

    :goto_0
    return-void
.end method

.method public userSetupStateChanged(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/account/domainmodel/UserSetupState;)V
    .locals 1

    .line 99
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "User setup state update: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Helpshift_ConvStpFrg"

    invoke-static {v0, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    sget-object p1, Lcom/helpshift/account/domainmodel/UserSetupState;->COMPLETED:Lcom/helpshift/account/domainmodel/UserSetupState;

    if-ne p2, p1, :cond_0

    .line 101
    invoke-direct {p0}, Lcom/helpshift/conversation/domainmodel/ConversationSetupDM;->handleUserSetupComplete()V

    :cond_0
    return-void
.end method
