.class Lcom/helpshift/support/fragments/SupportFragment$2;
.super Landroid/view/animation/Animation;
.source "SupportFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/fragments/SupportFragment;->animateViewBottomMarginChange(Landroid/view/View;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/fragments/SupportFragment;

.field final synthetic val$marginChange:I

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/helpshift/support/fragments/SupportFragment;Landroid/view/View;I)V
    .locals 0

    .line 1317
    iput-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment$2;->this$0:Lcom/helpshift/support/fragments/SupportFragment;

    iput-object p2, p0, Lcom/helpshift/support/fragments/SupportFragment$2;->val$view:Landroid/view/View;

    iput p3, p0, Lcom/helpshift/support/fragments/SupportFragment$2;->val$marginChange:I

    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 1

    .line 1320
    iget-object p2, p0, Lcom/helpshift/support/fragments/SupportFragment$2;->val$view:Landroid/view/View;

    .line 1321
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    check-cast p2, Landroidx/coordinatorlayout/widget/CoordinatorLayout$LayoutParams;

    .line 1322
    iget v0, p0, Lcom/helpshift/support/fragments/SupportFragment$2;->val$marginChange:I

    int-to-float v0, v0

    mul-float v0, v0, p1

    float-to-int p1, v0

    iput p1, p2, Landroidx/coordinatorlayout/widget/CoordinatorLayout$LayoutParams;->bottomMargin:I

    .line 1323
    iget-object p1, p0, Lcom/helpshift/support/fragments/SupportFragment$2;->this$0:Lcom/helpshift/support/fragments/SupportFragment;

    invoke-static {p1}, Lcom/helpshift/support/fragments/SupportFragment;->access$000(Lcom/helpshift/support/fragments/SupportFragment;)Landroid/widget/LinearLayout;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
