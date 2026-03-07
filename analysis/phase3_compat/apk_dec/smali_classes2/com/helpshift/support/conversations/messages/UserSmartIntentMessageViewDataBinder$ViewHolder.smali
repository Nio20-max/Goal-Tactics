.class public final Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "UserSmartIntentMessageViewDataBinder.java"

# interfaces
.implements Landroid/view/View$OnCreateContextMenuListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "ViewHolder"
.end annotation


# instance fields
.field final leafLabelText:Landroid/widget/TextView;

.field final messageBubble:Landroid/widget/FrameLayout;

.field final messageLayout:Landroid/view/View;

.field final retryButton:Landroid/widget/ImageView;

.field final rootLabelText:Landroid/widget/TextView;

.field final subText:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;Landroid/view/View;)V
    .locals 0

    .line 106
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;

    .line 107
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 108
    sget p1, Lcom/helpshift/R$id;->smart_intent_root_label:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->rootLabelText:Landroid/widget/TextView;

    .line 109
    sget p1, Lcom/helpshift/R$id;->smart_intent_leaf_label:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->leafLabelText:Landroid/widget/TextView;

    .line 110
    sget p1, Lcom/helpshift/R$id;->user_date_text:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->subText:Landroid/widget/TextView;

    .line 111
    sget p1, Lcom/helpshift/R$id;->user_message_container:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->messageBubble:Landroid/widget/FrameLayout;

    .line 112
    sget p1, Lcom/helpshift/R$id;->user_message_retry_button:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->retryButton:Landroid/widget/ImageView;

    .line 113
    sget p1, Lcom/helpshift/R$id;->smart_intent_user_message_layout:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 131
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    if-eqz p1, :cond_0

    .line 132
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    invoke-virtual {p0}, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->getAdapterPosition()I

    move-result v0

    invoke-interface {p1, v0}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->retryMessage(I)V

    :cond_0
    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 0

    .line 123
    iget-object p2, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;

    iget-object p2, p2, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    if-eqz p2, :cond_0

    .line 124
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->rootLabelText:Landroid/widget/TextView;

    invoke-virtual {p3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p3, " "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->leafLabelText:Landroid/widget/TextView;

    invoke-virtual {p3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 125
    iget-object p3, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;

    iget-object p3, p3, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder;->messageClickListener:Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;

    invoke-interface {p3, p1, p2}, Lcom/helpshift/support/conversations/messages/MessageViewDataBinder$MessageItemClickListener;->onCreateContextMenu(Landroid/view/ContextMenu;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method setListeners()V
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/UserSmartIntentMessageViewDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnCreateContextMenuListener(Landroid/view/View$OnCreateContextMenuListener;)V

    return-void
.end method
