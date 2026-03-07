.class public Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "SmartIntentsListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ViewHolder"
.end annotation


# instance fields
.field private labelTextView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;


# direct methods
.method public constructor <init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;Landroid/view/View;)V
    .locals 0

    .line 94
    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;->this$0:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;

    .line 95
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 96
    sget p1, Lcom/helpshift/R$id;->hs__smart_intent_text_View:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;->labelTextView:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public bind(Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;)V
    .locals 2

    .line 101
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;->labelTextView:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 102
    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;->itemView:Landroid/view/View;

    new-instance v1, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder$1;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    iget-object p2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;->itemView:Landroid/view/View;

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;->label:Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method
