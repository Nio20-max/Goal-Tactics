.class Lcom/helpshift/campaigns/controllers/UserController$2;
.super Ljava/lang/Object;
.source "UserController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/UserController;->login(Lcom/helpshift/HelpshiftUser;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/UserController;

.field final synthetic val$controller:Lcom/helpshift/campaigns/controllers/UserController;

.field final synthetic val$helpshiftUser:Lcom/helpshift/HelpshiftUser;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/campaigns/controllers/UserController;Lcom/helpshift/HelpshiftUser;)V
    .locals 0

    .line 174
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/UserController$2;->this$0:Lcom/helpshift/campaigns/controllers/UserController;

    iput-object p2, p0, Lcom/helpshift/campaigns/controllers/UserController$2;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    iput-object p3, p0, Lcom/helpshift/campaigns/controllers/UserController$2;->val$helpshiftUser:Lcom/helpshift/HelpshiftUser;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 177
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$2;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v0, v0, Lcom/helpshift/campaigns/controllers/UserController;->currentUser:Lcom/helpshift/campaigns/models/UserModel;

    iget-object v0, v0, Lcom/helpshift/campaigns/models/UserModel;->identifier:Ljava/lang/String;

    .line 178
    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$2;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/UserController$2;->val$helpshiftUser:Lcom/helpshift/HelpshiftUser;

    invoke-virtual {v2}, Lcom/helpshift/HelpshiftUser;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/helpshift/campaigns/controllers/UserController;->switchToUser(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    iget-object v0, p0, Lcom/helpshift/campaigns/controllers/UserController$2;->val$controller:Lcom/helpshift/campaigns/controllers/UserController;

    iget-object v1, p0, Lcom/helpshift/campaigns/controllers/UserController$2;->val$helpshiftUser:Lcom/helpshift/HelpshiftUser;

    invoke-virtual {v1}, Lcom/helpshift/HelpshiftUser;->getName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/helpshift/campaigns/controllers/UserController$2;->val$helpshiftUser:Lcom/helpshift/HelpshiftUser;

    invoke-virtual {v2}, Lcom/helpshift/HelpshiftUser;->getEmail()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/campaigns/controllers/UserController;->setNameAndEmail(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    :try_start_0
    invoke-static {}, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->getInstance()Lcom/helpshift/campaigns/network/NetworkManagerFactory;

    move-result-object v0

    iget-object v0, v0, Lcom/helpshift/campaigns/network/NetworkManagerFactory;->inboxNetworkManager:Lcom/helpshift/campaigns/network/InboxNetworkManager;

    invoke-virtual {v0}, Lcom/helpshift/campaigns/network/InboxNetworkManager;->fetchCampaigns()Ljava/util/concurrent/Future;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Helpshift_UserControl"

    const-string v2, "Exception while fetching campaigns after login"

    .line 186
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
