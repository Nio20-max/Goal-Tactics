.class final Lcom/helpshift/xamarin/support/HelpshiftSupport$3;
.super Ljava/lang/Object;
.source "HelpshiftSupport.java"

# interfaces
.implements Lcom/helpshift/support/Support$Delegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/xamarin/support/HelpshiftSupport;->setDelegate(Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$delegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;


# direct methods
.method constructor <init>(Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;)V
    .locals 0

    .line 179
    iput-object p1, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;->val$delegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public authenticationFailed(Lcom/helpshift/HelpshiftUser;Lcom/helpshift/delegate/AuthenticationFailureReason;)V
    .locals 5

    .line 239
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;->val$delegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    new-instance v1, Lcom/helpshift/xamarin/WrappedHelpshiftUser;

    invoke-virtual {p1}, Lcom/helpshift/HelpshiftUser;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    .line 240
    invoke-virtual {p1}, Lcom/helpshift/HelpshiftUser;->getEmail()Ljava/lang/String;

    move-result-object v3

    .line 241
    invoke-virtual {p1}, Lcom/helpshift/HelpshiftUser;->getName()Ljava/lang/String;

    move-result-object v4

    .line 242
    invoke-virtual {p1}, Lcom/helpshift/HelpshiftUser;->getAuthToken()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, v2, v3, v4, p1}, Lcom/helpshift/xamarin/WrappedHelpshiftUser;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    invoke-virtual {p2}, Lcom/helpshift/delegate/AuthenticationFailureReason;->getValue()I

    move-result p1

    .line 239
    invoke-interface {v0, v1, p1}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->authenticationFailed(Lcom/helpshift/xamarin/WrappedHelpshiftUser;I)V

    return-void
.end method

.method public conversationEnded()V
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;->val$delegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    invoke-interface {v0}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->conversationEnded()V

    return-void
.end method

.method public didReceiveNotification(I)V
    .locals 1

    .line 234
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;->val$delegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->didReceiveNotification(I)V

    return-void
.end method

.method public displayAttachmentFile(Landroid/net/Uri;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 225
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    .line 226
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 227
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;->val$delegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->handleTapOnAttachmentFile(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public displayAttachmentFile(Ljava/io/File;)V
    .locals 1

    .line 213
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    move-result-object p1

    .line 214
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 215
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;->val$delegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->handleTapOnAttachmentFile(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "Helpshift_XamSupport"

    const-string v0, "Unable to retrieve filePath from File object"

    .line 218
    invoke-static {p1, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void
.end method

.method public newConversationStarted(Ljava/lang/String;)V
    .locals 1

    .line 192
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;->val$delegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->newConversationStarted(Ljava/lang/String;)V

    return-void
.end method

.method public sessionBegan()V
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;->val$delegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    invoke-interface {v0}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->sessionBegan()V

    return-void
.end method

.method public sessionEnded()V
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;->val$delegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    invoke-interface {v0}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->sessionEnded()V

    return-void
.end method

.method public userClickOnAction(Lcom/helpshift/conversation/activeconversation/model/ActionType;Ljava/lang/String;)V
    .locals 1

    .line 248
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;->val$delegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    invoke-virtual {p1}, Lcom/helpshift/conversation/activeconversation/model/ActionType;->getValue()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1, p2}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->userClickOnAction(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public userCompletedCustomerSatisfactionSurvey(ILjava/lang/String;)V
    .locals 1

    .line 207
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;->val$delegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    invoke-interface {v0, p1, p2}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->userCompletedCustomerSatisfactionSurvey(ILjava/lang/String;)V

    return-void
.end method

.method public userRepliedToConversation(Ljava/lang/String;)V
    .locals 1

    .line 202
    iget-object v0, p0, Lcom/helpshift/xamarin/support/HelpshiftSupport$3;->val$delegate:Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;

    invoke-interface {v0, p1}, Lcom/helpshift/xamarin/support/HelpshiftSupport$Delegate;->userRepliedToConversation(Ljava/lang/String;)V

    return-void
.end method
