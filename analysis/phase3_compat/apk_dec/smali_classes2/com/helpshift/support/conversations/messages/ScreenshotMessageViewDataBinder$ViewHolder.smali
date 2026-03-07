.class public final Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "ScreenshotMessageViewDataBinder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "ViewHolder"
.end annotation


# instance fields
.field final messageLayout:Landroid/view/View;

.field private final progress:Landroid/widget/ProgressBar;

.field final retryButton:Landroid/widget/ImageView;

.field final roundedImageView:Lcom/helpshift/support/views/HSRoundedImageView;

.field final subText:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder;Landroid/view/View;)V
    .locals 2

    .line 134
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder;

    .line 135
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 136
    sget v0, Lcom/helpshift/R$id;->user_image_message_layout:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    .line 137
    sget v0, Lcom/helpshift/R$id;->upload_attachment_progressbar:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder$ViewHolder;->progress:Landroid/widget/ProgressBar;

    .line 138
    sget v1, Lcom/helpshift/R$id;->user_attachment_imageview:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/helpshift/support/views/HSRoundedImageView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder$ViewHolder;->roundedImageView:Lcom/helpshift/support/views/HSRoundedImageView;

    .line 139
    sget v1, Lcom/helpshift/R$id;->date:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    .line 140
    sget v1, Lcom/helpshift/R$id;->user_message_retry_button:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    .line 141
    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/helpshift/support/util/Styles;->setAccentColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder$ViewHolder;)Landroid/widget/ProgressBar;
    .locals 0

    .line 126
    iget-object p0, p0, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder$ViewHolder;->progress:Landroid/widget/ProgressBar;

    return-object p0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 146
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    if-eqz p1, :cond_0

    .line 147
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    invoke-virtual {p0}, Lcom/helpshift/support/conversations/messages/ScreenshotMessageViewDataBinder$ViewHolder;->getAdapterPosition()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->retryMessage(I)V

    :cond_0
    return-void
.end method
