.class public final Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "UserAttachmentMessageViewDataBinder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "ViewHolder"
.end annotation


# instance fields
.field final attachmentIcon:Landroid/widget/ImageView;

.field final downloadButton:Landroid/view/View;

.field final fileName:Landroid/widget/TextView;

.field final fileSize:Landroid/widget/TextView;

.field final messageContainer:Landroid/view/View;

.field final messageLayout:Landroid/view/View;

.field final progress:Landroid/widget/ProgressBar;

.field final retryButton:Landroid/widget/ImageView;

.field final subText:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;Landroid/view/View;)V
    .locals 4

    .line 182
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;

    .line 183
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 184
    sget v0, Lcom/helpshift/R$id;->user_attachment_message_layout:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    .line 185
    sget v0, Lcom/helpshift/R$id;->user_attachment_container:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->messageContainer:Landroid/view/View;

    .line 186
    sget v0, Lcom/helpshift/R$id;->attachment_file_name:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->fileName:Landroid/widget/TextView;

    .line 187
    sget v0, Lcom/helpshift/R$id;->attachment_file_size:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->fileSize:Landroid/widget/TextView;

    .line 188
    sget v0, Lcom/helpshift/R$id;->download_button:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->downloadButton:Landroid/view/View;

    .line 189
    sget v0, Lcom/helpshift/R$id;->progress:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->progress:Landroid/widget/ProgressBar;

    .line 190
    sget v1, Lcom/helpshift/R$id;->attachment_icon:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->attachmentIcon:Landroid/widget/ImageView;

    .line 191
    sget v2, Lcom/helpshift/R$id;->date:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    .line 192
    sget v2, Lcom/helpshift/R$id;->user_message_retry_button:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    .line 195
    sget v2, Lcom/helpshift/R$id;->hs_download_foreground_view:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    .line 196
    iget-object v2, p1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    .line 197
    invoke-virtual {p2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    sget v3, Lcom/helpshift/R$attr;->hs__chatBubbleMediaBackgroundColor:I

    .line 196
    invoke-static {v2, p2, v3}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 199
    iget-object p2, p1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/helpshift/support/util/Styles;->setAccentColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    .line 200
    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/helpshift/support/util/Styles;->setAccentColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 205
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    if-eqz p1, :cond_0

    .line 206
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    invoke-virtual {p0}, Lcom/helpshift/support/conversations/messages/UserAttachmentMessageViewDataBinder$ViewHolder;->getAdapterPosition()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->retryMessage(I)V

    :cond_0
    return-void
.end method
