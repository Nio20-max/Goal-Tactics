.class public Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$RootIntentViewHolder;
.super Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;
.source "SmartIntentsListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "RootIntentViewHolder"
.end annotation


# instance fields
.field private nextIconView:Landroid/widget/ImageView;

.field final synthetic this$0:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;Landroid/view/View;)V
    .locals 0

    .line 121
    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$RootIntentViewHolder;->this$0:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;

    .line 122
    invoke-direct {p0, p1, p2}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;-><init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter;Landroid/view/View;)V

    .line 123
    sget p1, Lcom/helpshift/R$id;->hs__smart_intent_next_icon_view:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$RootIntentViewHolder;->nextIconView:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method public bind(Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;)V
    .locals 3

    .line 129
    invoke-super {p0, p1, p2}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;->bind(Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;)V

    .line 130
    iget-object p2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$RootIntentViewHolder;->nextIconView:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$RootIntentViewHolder;->nextIconView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const v1, 0x1010036

    invoke-static {p2, v0, v1}, Lcom/helpshift/util/Styles;->setColorFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;I)V

    .line 133
    iget-object p2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$RootIntentViewHolder;->itemView:Landroid/view/View;

    invoke-static {p2}, Lcom/helpshift/util/HSViewUtil;->isViewDirectionRtl(Landroid/view/View;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 135
    iget-object p2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$RootIntentViewHolder;->nextIconView:Landroid/widget/ImageView;

    const/high16 v0, 0x43340000    # 180.0f

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setRotationY(F)V

    .line 139
    :cond_0
    iget-object p2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$RootIntentViewHolder;->itemView:Landroid/view/View;

    .line 140
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    sget v0, Lcom/helpshift/R$string;->hs__si_root_intent_list_item_voice_over:I

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;->label:Ljava/lang/String;

    aput-object p1, v1, v2

    invoke-virtual {p2, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 142
    iget-object p2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$RootIntentViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method
