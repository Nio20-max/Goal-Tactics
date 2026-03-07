.class Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder$1;
.super Ljava/lang/Object;
.source "SmartIntentsListAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;->bind(Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;

.field final synthetic val$callback:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;

.field final synthetic val$uiModel:Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;


# direct methods
.method constructor <init>(Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;)V
    .locals 0

    .line 102
    iput-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder$1;->this$1:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder;

    iput-object p2, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder$1;->val$callback:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;

    iput-object p3, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder$1;->val$uiModel:Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 105
    iget-object p1, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder$1;->val$callback:Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;

    iget-object v0, p0, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$ViewHolder$1;->val$uiModel:Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;

    invoke-interface {p1, v0}, Lcom/helpshift/support/conversations/smartintent/SmartIntentsListAdapter$SmartIntentListAdapterCallback;->onIntentSelected(Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;)V

    return-void
.end method
