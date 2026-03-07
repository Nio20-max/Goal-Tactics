.class public final Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "UserResponseCSATMessageViewDataBinder.java"

# interfaces
.implements Landroid/view/View$OnCreateContextMenuListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "ViewHolder"
.end annotation


# instance fields
.field final messageBubble:Landroid/widget/RelativeLayout;

.field final messageLayout:Landroid/view/View;

.field final messageText:Landroid/widget/TextView;

.field final ratingBar:Landroid/widget/RatingBar;

.field final retryButton:Landroid/widget/ImageView;

.field final subText:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;Landroid/view/View;)V
    .locals 0

    .line 111
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;

    .line 112
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 113
    sget p1, Lcom/helpshift/R$id;->csat_selected_rating:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RatingBar;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->ratingBar:Landroid/widget/RatingBar;

    .line 114
    sget p1, Lcom/helpshift/R$id;->user_message_text:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->messageText:Landroid/widget/TextView;

    .line 115
    sget p1, Lcom/helpshift/R$id;->user_date_text:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    .line 116
    sget p1, Lcom/helpshift/R$id;->user_message_container:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/RelativeLayout;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->messageBubble:Landroid/widget/RelativeLayout;

    .line 117
    sget p1, Lcom/helpshift/R$id;->user_message_retry_button:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    .line 118
    sget p1, Lcom/helpshift/R$id;->user_csat_rsp_message_layout:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 136
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    if-eqz p1, :cond_0

    .line 137
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    invoke-virtual {p0}, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->getAdapterPosition()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->retryMessage(I)V

    :cond_0
    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 0

    .line 128
    iget-object p3, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;

    iget-object p3, p3, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    if-eqz p3, :cond_0

    .line 129
    check-cast p2, Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    .line 130
    iget-object p3, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;

    iget-object p3, p3, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    invoke-interface {p3, p1, p2}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->onCreateContextMenu(Landroid/view/ContextMenu;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method setListeners()V
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserResponseCSATMessageViewDataBinder$ViewHolder;->messageText:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    return-void
.end method
