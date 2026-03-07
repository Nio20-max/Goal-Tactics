.class public final Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "ConversationFooterViewBinder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/helpshift/support/widget/CSATView$CSATListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ViewHolder"
.end annotation


# instance fields
.field final conversationFooter:Landroid/view/View;

.field final csatView:Lcom/helpshift/support/widget/CSATView;

.field final footerMessage:Landroid/widget/TextView;

.field final newConversationBox:Landroid/widget/LinearLayout;

.field final newConversationButton:Landroid/widget/Button;

.field final newConversationReason:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;


# direct methods
.method public constructor <init>(Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;Landroid/view/View;)V
    .locals 0

    .line 150
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;

    .line 151
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 152
    iput-object p2, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->conversationFooter:Landroid/view/View;

    .line 153
    sget p1, Lcom/helpshift/R$id;->footer_message:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->footerMessage:Landroid/widget/TextView;

    .line 154
    sget p1, Lcom/helpshift/R$id;->hs__new_conversation:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->newConversationBox:Landroid/widget/LinearLayout;

    .line 155
    sget p1, Lcom/helpshift/R$id;->hs__new_conversation_btn:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->newConversationButton:Landroid/widget/Button;

    .line 156
    sget p1, Lcom/helpshift/R$id;->csat_view_layout:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/helpshift/support/widget/CSATView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->csatView:Lcom/helpshift/support/widget/CSATView;

    .line 157
    sget p1, Lcom/helpshift/R$id;->hs__new_conversation_footer_reason:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->newConversationReason:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public onCSATSurveyCancelled()V
    .locals 1

    .line 176
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->footerClickListener:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;

    if-eqz v0, :cond_0

    .line 177
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->footerClickListener:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;

    invoke-interface {v0}, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;->onCSATSurveyCancelled()V

    :cond_0
    return-void
.end method

.method public onCSATSurveyStarted()V
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->footerClickListener:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;

    if-eqz v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->footerClickListener:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;

    invoke-interface {v0}, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;->onCSATSurveyStarted()V

    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 162
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->footerClickListener:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;

    if-eqz p1, :cond_0

    .line 163
    iget-object p1, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;

    iget-object p1, p1, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->footerClickListener:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;

    invoke-interface {p1}, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;->onStartNewConversationButtonClick()V

    :cond_0
    return-void
.end method

.method public sendCSATSurvey(ILjava/lang/String;)V
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->footerClickListener:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;

    iget-object v0, v0, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder;->footerClickListener:Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;

    invoke-interface {v0, p1, p2}, Lcom/helpshift/support/conversations/messages/ConversationFooterViewBinder$ConversationFooterClickListener;->onCSATSurveySubmitted(ILjava/lang/String;)V

    :cond_0
    return-void
.end method
