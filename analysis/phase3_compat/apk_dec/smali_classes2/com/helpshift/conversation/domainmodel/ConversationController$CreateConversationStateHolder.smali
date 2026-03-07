.class Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder;
.super Ljava/lang/Object;
.source "ConversationController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/conversation/domainmodel/ConversationController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CreateConversationStateHolder"
.end annotation


# instance fields
.field final attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

.field final description:Ljava/lang/String;

.field private final startNewConversationInternalF:Lcom/helpshift/common/domain/F;

.field final synthetic this$0:Lcom/helpshift/conversation/domainmodel/ConversationController;

.field final userProvidedEmail:Ljava/lang/String;

.field final userProvidedName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/domainmodel/ConversationController;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/conversation/dto/AttachmentPickerFile;)V
    .locals 1

    .line 1766
    iput-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder;->this$0:Lcom/helpshift/conversation/domainmodel/ConversationController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1757
    new-instance p1, Lcom/helpshift/common/domain/One;

    new-instance v0, Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder$1;

    invoke-direct {v0, p0}, Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder$1;-><init>(Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder;)V

    invoke-direct {p1, v0}, Lcom/helpshift/common/domain/One;-><init>(Lcom/helpshift/common/domain/F;)V

    iput-object p1, p0, Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder;->startNewConversationInternalF:Lcom/helpshift/common/domain/F;

    .line 1767
    iput-object p2, p0, Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder;->description:Ljava/lang/String;

    .line 1768
    iput-object p3, p0, Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder;->userProvidedName:Ljava/lang/String;

    .line 1769
    iput-object p4, p0, Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder;->userProvidedEmail:Ljava/lang/String;

    .line 1770
    iput-object p5, p0, Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder;->attachmentPickerFile:Lcom/helpshift/conversation/dto/AttachmentPickerFile;

    return-void
.end method


# virtual methods
.method getStartNewConversationInternalF()Lcom/helpshift/common/domain/F;
    .locals 1

    .line 1774
    iget-object v0, p0, Lcom/helpshift/conversation/domainmodel/ConversationController$CreateConversationStateHolder;->startNewConversationInternalF:Lcom/helpshift/common/domain/F;

    return-object v0
.end method
