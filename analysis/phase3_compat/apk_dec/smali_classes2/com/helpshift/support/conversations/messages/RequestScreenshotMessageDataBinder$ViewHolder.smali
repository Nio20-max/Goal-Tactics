.class public final Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "RequestScreenshotMessageDataBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "ViewHolder"
.end annotation


# instance fields
.field private final adminMessage:Landroid/widget/LinearLayout;

.field final adminRequestText:Landroid/widget/TextView;

.field final attachButton:Landroid/widget/Button;

.field final avatarImageView:Lcom/helpshift/views/CircleImageView;

.field final messageLayout:Landroid/view/View;

.field final subText:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;Landroid/view/View;)V
    .locals 2

    .line 87
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;

    .line 88
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 89
    sget v0, Lcom/helpshift/R$id;->agent_screenshot_request_message_layout:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    .line 90
    sget v0, Lcom/helpshift/R$id;->admin_attachment_request_text:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$ViewHolder;->adminRequestText:Landroid/widget/TextView;

    .line 91
    sget v0, Lcom/helpshift/R$id;->admin_attach_screenshot_button:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$ViewHolder;->attachButton:Landroid/widget/Button;

    .line 92
    sget v0, Lcom/helpshift/R$id;->admin_message:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$ViewHolder;->adminMessage:Landroid/widget/LinearLayout;

    .line 93
    sget v1, Lcom/helpshift/R$id;->admin_date_text:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    .line 94
    sget v1, Lcom/helpshift/R$id;->avatar_image_view:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/helpshift/views/CircleImageView;

    iput-object p2, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$ViewHolder;->avatarImageView:Lcom/helpshift/views/CircleImageView;

    .line 96
    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/helpshift/support/util/Styles;->setAdminChatBubbleColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method static synthetic access$000(Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$ViewHolder;)Landroid/widget/LinearLayout;
    .locals 0

    .line 79
    iget-object p0, p0, Lcom/helpshift/support/conversations/messages/RequestScreenshotMessageDataBinder$ViewHolder;->adminMessage:Landroid/widget/LinearLayout;

    return-object p0
.end method
