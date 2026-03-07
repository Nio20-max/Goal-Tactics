.class public final Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "AdminCSATMessageViewBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "ViewHolder"
.end annotation


# instance fields
.field final bottomDividerLayout:Landroid/widget/LinearLayout;

.field final csatBotDislikeText:Lcom/helpshift/views/HSTextView;

.field final csatBotLikedText:Lcom/helpshift/views/HSTextView;

.field final csatBotSelectedRatingText:Lcom/helpshift/views/HSTextView;

.field final csatMessageText:Lcom/helpshift/views/HSTextView;

.field final csatView:Lcom/helpshift/support/widget/AdminCSATBotView;

.field final newConversationButton:Lcom/helpshift/views/HSButton;

.field final sendFeedbackButton:Lcom/helpshift/views/HSButton;

.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;


# direct methods
.method public constructor <init>(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;Landroid/view/View;)V
    .locals 1

    .line 139
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    .line 140
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 141
    sget p1, Lcom/helpshift/R$id;->admin_csat_view_layout:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/helpshift/support/widget/AdminCSATBotView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatView:Lcom/helpshift/support/widget/AdminCSATBotView;

    .line 142
    sget p1, Lcom/helpshift/R$id;->hs__csat_new_conversation_btn:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/helpshift/views/HSButton;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->newConversationButton:Lcom/helpshift/views/HSButton;

    .line 143
    sget p1, Lcom/helpshift/R$id;->csat_sendfeedback_btn:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/helpshift/views/HSButton;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->sendFeedbackButton:Lcom/helpshift/views/HSButton;

    .line 144
    sget v0, Lcom/helpshift/R$id;->csat_bot_message:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/helpshift/views/HSTextView;

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatMessageText:Lcom/helpshift/views/HSTextView;

    .line 145
    sget v0, Lcom/helpshift/R$id;->csat_bot_dislike_msg:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/helpshift/views/HSTextView;

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatBotDislikeText:Lcom/helpshift/views/HSTextView;

    .line 146
    sget v0, Lcom/helpshift/R$id;->csat_bot_like_msg:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/helpshift/views/HSTextView;

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatBotLikedText:Lcom/helpshift/views/HSTextView;

    .line 147
    sget v0, Lcom/helpshift/R$id;->csat_selected_rating_msg:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/helpshift/views/HSTextView;

    iput-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->csatBotSelectedRatingText:Lcom/helpshift/views/HSTextView;

    .line 148
    sget v0, Lcom/helpshift/R$id;->csat_bottom_separator:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    iput-object p2, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->bottomDividerLayout:Landroid/widget/LinearLayout;

    .line 150
    invoke-direct {p0, p1}, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->setBorderToNewConversationButton(Landroid/widget/Button;)V

    return-void
.end method

.method private setBorderToNewConversationButton(Landroid/widget/Button;)V
    .locals 7

    .line 154
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    .line 155
    invoke-static {v0}, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->access$000(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;)Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/helpshift/R$drawable;->hs__button_with_border:I

    invoke-static {v0, v1}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroid/graphics/drawable/GradientDrawable;

    if-nez v2, :cond_0

    return-void

    .line 161
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    invoke-static {v0}, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->access$000(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;)Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Lcom/helpshift/util/Styles;->dpToPx(Landroid/content/Context;F)F

    move-result v0

    float-to-int v0, v0

    .line 163
    iget-object v1, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    invoke-static {v1}, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->access$000(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;)Landroid/content/Context;

    move-result-object v1

    sget v3, Lcom/helpshift/R$attr;->colorAccent:I

    invoke-static {v1, v3}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v2, v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 165
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    invoke-static {v0}, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->access$000(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;)Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/helpshift/R$attr;->hs__footerPromptBackground:I

    invoke-static {v0, v1}, Lcom/helpshift/util/Styles;->getColor(Landroid/content/Context;I)I

    move-result v0

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 167
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    invoke-static {v0}, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->access$000(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;)Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x40800000    # 4.0f

    invoke-static {v0, v1}, Lcom/helpshift/util/Styles;->dpToPx(Landroid/content/Context;F)F

    move-result v0

    float-to-int v5, v0

    .line 168
    iget-object v0, p0, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;

    invoke-static {v0}, Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;->access$000(Lcom/helpshift/support/conversations/messages/AdminCSATMessageViewBinder;)Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-static {v0, v1}, Lcom/helpshift/util/Styles;->dpToPx(Landroid/content/Context;F)F

    move-result v0

    float-to-int v6, v0

    .line 169
    new-instance v0, Landroid/graphics/drawable/InsetDrawable;

    move-object v1, v0

    move v3, v5

    move v4, v6

    invoke-direct/range {v1 .. v6}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    .line 171
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_1

    .line 172
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    .line 175
    :cond_1
    invoke-virtual {p1, v0}, Landroid/widget/Button;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    return-void
.end method
