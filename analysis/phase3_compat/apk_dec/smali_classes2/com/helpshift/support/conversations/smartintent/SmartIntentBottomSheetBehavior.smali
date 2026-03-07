.class public Lcom/helpshift/support/conversations/smartintent/SmartIntentBottomSheetBehavior;
.super Lcom/helpshift/views/bottomsheet/HSBottomSheetBehaviour;
.source "SmartIntentBottomSheetBehavior.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Lcom/helpshift/views/bottomsheet/HSBottomSheetBehaviour<",
        "TV;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Lcom/helpshift/views/bottomsheet/HSBottomSheetBehaviour;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1, p2}, Lcom/helpshift/views/bottomsheet/HSBottomSheetBehaviour;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public layoutDependsOn(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            ")Z"
        }
    .end annotation

    .line 62
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/helpshift/R$id;->hs__si_scrollable_view_container:I

    if-ne v0, v1, :cond_0

    .line 63
    invoke-virtual {p3}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/helpshift/R$id;->reply_footer_container:I

    if-ne v0, v1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 67
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/helpshift/views/bottomsheet/HSBottomSheetBehaviour;->layoutDependsOn(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    move-result p1

    return p1
.end method

.method public onDependentViewChanged(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
            "TV;",
            "Landroid/view/View;",
            ")Z"
        }
    .end annotation

    .line 41
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/helpshift/R$id;->hs__si_scrollable_view_container:I

    if-ne v0, v1, :cond_0

    .line 42
    invoke-virtual {p3}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/helpshift/R$id;->reply_footer_container:I

    if-ne v0, v1, :cond_0

    .line 43
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result p1

    .line 45
    invoke-virtual {p2}, Landroid/view/View;->getPaddingLeft()I

    move-result p3

    invoke-virtual {p2}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    .line 46
    invoke-virtual {p2}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    .line 45
    invoke-virtual {p2, p3, v0, v1, p1}, Landroid/view/View;->setPadding(IIII)V

    const/4 p1, 0x1

    return p1

    .line 51
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/helpshift/views/bottomsheet/HSBottomSheetBehaviour;->onDependentViewChanged(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
