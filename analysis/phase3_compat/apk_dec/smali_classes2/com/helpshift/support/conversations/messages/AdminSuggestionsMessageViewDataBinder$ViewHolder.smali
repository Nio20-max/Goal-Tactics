.class public final Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "AdminSuggestionsMessageViewDataBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x14
    name = "ViewHolder"
.end annotation


# instance fields
.field final avatarImageView:Lcom/helpshift/views/CircleImageView;

.field final dateText:Landroid/widget/TextView;

.field final messageContainer:Landroid/view/View;

.field final messageLayout:Landroid/view/View;

.field final messageText:Landroid/widget/TextView;

.field final suggestionsList:Landroid/widget/TableLayout;

.field final synthetic this$0:Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder;Landroid/view/View;)V
    .locals 0

    .line 156
    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder$ViewHolder;->this$0:Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder;

    .line 157
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 158
    sget p1, Lcom/helpshift/R$id;->admin_suggestion_message_layout:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder$ViewHolder;->messageLayout:Landroid/view/View;

    .line 159
    sget p1, Lcom/helpshift/R$id;->suggestionsListStub:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TableLayout;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder$ViewHolder;->suggestionsList:Landroid/widget/TableLayout;

    .line 160
    sget p1, Lcom/helpshift/R$id;->admin_message_text:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder$ViewHolder;->messageText:Landroid/widget/TextView;

    .line 161
    sget p1, Lcom/helpshift/R$id;->admin_message_container:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder$ViewHolder;->messageContainer:Landroid/view/View;

    .line 162
    sget p1, Lcom/helpshift/R$id;->admin_date_text:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder$ViewHolder;->dateText:Landroid/widget/TextView;

    .line 163
    sget p1, Lcom/helpshift/R$id;->avatar_image_view:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/helpshift/views/CircleImageView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/messages/AdminSuggestionsMessageViewDataBinder$ViewHolder;->avatarImageView:Lcom/helpshift/views/CircleImageView;

    return-void
.end method
