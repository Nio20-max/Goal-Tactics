.class public final Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "AdminActionCardMessageViewDataBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "ViewHolder"
.end annotation


# instance fields
.field final actionButton:Landroid/widget/TextView;

.field final actionCardImage:Landroid/widget/ImageView;

.field final actionCardView:Landroid/view/View;

.field final actionTitle:Landroid/widget/TextView;

.field final dateText:Landroid/widget/TextView;

.field final imageViewContainer:Landroid/view/View;

.field final messageContainer:Landroid/view/View;

.field final progress:Landroid/widget/ProgressBar;

.field final separator:Landroid/view/View;

.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;Landroid/view/View;)V
    .locals 0

    .line 92
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder;

    .line 93
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 94
    sget p1, Lcom/helpshift/R$id;->action_card_title:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->actionTitle:Landroid/widget/TextView;

    .line 95
    sget p1, Lcom/helpshift/R$id;->admin_date_text:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->dateText:Landroid/widget/TextView;

    .line 96
    sget p1, Lcom/helpshift/R$id;->action_card_action:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->actionButton:Landroid/widget/TextView;

    .line 97
    sget p1, Lcom/helpshift/R$id;->download_progressbar:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ProgressBar;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->progress:Landroid/widget/ProgressBar;

    .line 98
    sget p1, Lcom/helpshift/R$id;->action_card_imageview:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->actionCardImage:Landroid/widget/ImageView;

    .line 99
    sget p1, Lcom/helpshift/R$id;->action_card_imageview_container:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->imageViewContainer:Landroid/view/View;

    .line 100
    sget p1, Lcom/helpshift/R$id;->action_card_separator:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->separator:Landroid/view/View;

    .line 101
    sget p1, Lcom/helpshift/R$id;->action_card_container:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->messageContainer:Landroid/view/View;

    .line 102
    sget p1, Lcom/helpshift/R$id;->action_card_cardview:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminActionCardMessageViewDataBinder$ViewHolder;->actionCardView:Landroid/view/View;

    return-void
.end method
