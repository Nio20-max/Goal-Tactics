.class public Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SearchResultViewHolder;
.super Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;
.source "SmartIntentsListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SearchResultViewHolder"
.end annotation


# instance fields
.field private parentLabelTextView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;Landroid/view/View;)V
    .locals 0

    .line 153
    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SearchResultViewHolder;->this$0:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;

    .line 154
    invoke-direct {p0, p1, p2}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;Landroid/view/View;)V

    .line 155
    sget p1, Lcom/helpshift/R$id;->hs__smart_intent_title_text_View:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SearchResultViewHolder;->parentLabelTextView:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public bind(Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;)V
    .locals 1

    .line 161
    invoke-super {p0, p1, p2}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;->bind(Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;)V

    .line 163
    check-cast p1, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;

    .line 164
    iget-object p2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SearchResultViewHolder;->parentLabelTextView:Landroid/widget/TextView;

    iget-object v0, p1, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->parentLabel:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p1, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->parentLabel:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->label:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 168
    iget-object p2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SearchResultViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method
