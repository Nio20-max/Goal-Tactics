.class Lcom/helpshift/conversation/viewmodel/ConversationalVM$30;
.super Lcom/helpshift/common/domain/F;
.source "ConversationalVM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/viewmodel/ConversationalVM;->retryFallbackAvatarImageDownload()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/viewmodel/ConversationalVM;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/viewmodel/ConversationalVM;)V
    .locals 0

    .line 2532
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$30;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationalVM;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 2

    .line 2535
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$30;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationalVM;

    iget-object v0, v0, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/ConversationalVM$30;->this$0:Lcom/helpshift/conversation/viewmodel/ConversationalVM;

    iget-object v1, v1, Lcom/helpshift/conversation/viewmodel/ConversationalVM;->domain:Lcom/helpshift/common/domain/Domain;

    invoke-static {v0, v1}, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->retryFallbackImagesDownload(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;)V

    return-void
.end method
