.class Lcom/helpshift/support/conversations/NewConversationFragmentRenderer$1;
.super Ljava/lang/Object;
.source "NewConversationFragmentRenderer.java"

# interfaces
.implements Lcom/helpshift/support/imageloader/ImageLoaderCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->showImageAttachmentContainer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

.field final synthetic val$attachmentName:Ljava/lang/String;

.field final synthetic val$attachmentSize:Ljava/lang/Long;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0

    .line 163
    iput-object p1, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer$1;->this$0:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

    iput-object p2, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer$1;->val$attachmentName:Ljava/lang/String;

    iput-object p3, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer$1;->val$attachmentSize:Ljava/lang/Long;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuccess()V
    .locals 3

    .line 166
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer$1;->this$0:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

    invoke-static {v0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->access$000(Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;)Landroid/widget/TextView;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer$1;->val$attachmentName:Ljava/lang/String;

    const-string v2, ""

    if-nez v1, :cond_0

    move-object v1, v2

    :cond_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 168
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer$1;->val$attachmentSize:Ljava/lang/Long;

    if-eqz v0, :cond_1

    .line 170
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    long-to-double v0, v0

    invoke-static {v0, v1}, Lcom/helpshift/util/AttachmentFileSize;->getFormattedFileSize(D)Ljava/lang/String;

    move-result-object v2

    .line 172
    :cond_1
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer$1;->this$0:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

    invoke-static {v0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->access$100(Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer$1;->this$0:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

    invoke-static {v0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->access$200(Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;)Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 174
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer$1;->this$0:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

    invoke-static {v0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->access$300(Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;)Landroid/widget/ImageButton;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 175
    iget-object v0, p0, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer$1;->this$0:Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;

    invoke-static {v0}, Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;->access$400(Lcom/helpshift/support/conversations/NewConversationFragmentRenderer;)Landroidx/cardview/widget/CardView;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroidx/cardview/widget/CardView;->setVisibility(I)V

    return-void
.end method
