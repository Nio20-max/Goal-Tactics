.class public Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;
.super Ljava/lang/Object;
.source "AttachmentTypeOptionPicker.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;
    }
.end annotation


# static fields
.field private static final ICON:Ljava/lang/String; = "icon"

.field private static final TITLE:Ljava/lang/String; = "title"


# instance fields
.field private bottomSheetDialog:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

.field private context:Landroid/content/Context;

.field listener:Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;

.field private popupWindow:Landroid/widget/ListPopupWindow;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->context:Landroid/content/Context;

    return-void
.end method

.method private getAdapter(Ljava/util/List;)Landroid/widget/ListAdapter;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Landroid/widget/ListAdapter;"
        }
    .end annotation

    .line 120
    new-instance v6, Landroid/widget/SimpleAdapter;

    iget-object v1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->context:Landroid/content/Context;

    .line 122
    invoke-direct {p0, p1}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->getViewDataForWhiteListedAttachment(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    sget v3, Lcom/helpshift/R$layout;->hs__attachment_picker_list_item:I

    const-string p1, "title"

    const-string v0, "icon"

    filled-new-array {p1, v0}, [Ljava/lang/String;

    move-result-object v4

    const/4 p1, 0x2

    new-array v5, p1, [I

    sget p1, Lcom/helpshift/R$id;->title:I

    const/4 v0, 0x0

    aput p1, v5, v0

    sget p1, Lcom/helpshift/R$id;->icon:I

    const/4 v0, 0x1

    aput p1, v5, v0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Landroid/widget/SimpleAdapter;-><init>(Landroid/content/Context;Ljava/util/List;I[Ljava/lang/String;[I)V

    return-object v6
.end method

.method private getViewDataForDocument()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 146
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 147
    iget-object v1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$string;->hs__documents:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "title"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    sget v1, Lcom/helpshift/R$drawable;->hs__document_picker_icon:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "icon"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private getViewDataForImage()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 160
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 161
    iget-object v1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$string;->hs__photo:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "title"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    sget v1, Lcom/helpshift/R$drawable;->hs__image_picker_icon:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "icon"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private getViewDataForVideo()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 153
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 154
    iget-object v1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->context:Landroid/content/Context;

    sget v2, Lcom/helpshift/R$string;->hs__video:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "title"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    sget v1, Lcom/helpshift/R$drawable;->hs__video_picker_icon:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v2, "icon"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private getViewDataForWhiteListedAttachment(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 129
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 130
    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 131
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 132
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 133
    invoke-direct {p0}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->getViewDataForImage()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 135
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_2

    .line 136
    invoke-direct {p0}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->getViewDataForVideo()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 138
    :cond_2
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 139
    invoke-direct {p0}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->getViewDataForDocument()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method private showPickerForPhone(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->context:Landroid/content/Context;

    .line 106
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/helpshift/R$layout;->hs__attachment_picker_bottom_sheet:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    .line 107
    sget v1, Lcom/helpshift/R$id;->picker_list:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ListView;

    .line 108
    invoke-direct {p0, p1}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->getAdapter(Ljava/util/List;)Landroid/widget/ListAdapter;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 109
    invoke-virtual {v1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 110
    new-instance p1, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    iget-object v1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->context:Landroid/content/Context;

    invoke-direct {p1, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->bottomSheetDialog:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 111
    invoke-virtual {p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 112
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->bottomSheetDialog:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    sget v0, Lcom/helpshift/R$id;->design_bottom_sheet:I

    invoke-virtual {p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    .line 113
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->bottomSheetDialog:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    invoke-virtual {v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->show()V

    if-eqz p1, :cond_0

    .line 115
    invoke-static {p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    move-result-object p1

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    :cond_0
    return-void
.end method

.method private showPickerForTablet(Landroid/view/View;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 92
    new-instance v0, Landroid/widget/ListPopupWindow;

    iget-object v1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/ListPopupWindow;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->popupWindow:Landroid/widget/ListPopupWindow;

    .line 93
    invoke-virtual {v0, p1}, Landroid/widget/ListPopupWindow;->setAnchorView(Landroid/view/View;)V

    .line 94
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->popupWindow:Landroid/widget/ListPopupWindow;

    const/16 v0, 0x14

    invoke-virtual {p1, v0}, Landroid/widget/ListPopupWindow;->setHorizontalOffset(I)V

    .line 95
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->popupWindow:Landroid/widget/ListPopupWindow;

    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Landroid/widget/ListPopupWindow;->setVerticalOffset(I)V

    .line 96
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->popupWindow:Landroid/widget/ListPopupWindow;

    invoke-direct {p0, p2}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->getAdapter(Ljava/util/List;)Landroid/widget/ListAdapter;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ListPopupWindow;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 97
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->popupWindow:Landroid/widget/ListPopupWindow;

    iget-object p2, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->context:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v0, Lcom/helpshift/R$dimen;->hs__file_option_picker_pop_up_width:I

    .line 98
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    float-to-int p2, p2

    .line 97
    invoke-virtual {p1, p2}, Landroid/widget/ListPopupWindow;->setWidth(I)V

    .line 100
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->popupWindow:Landroid/widget/ListPopupWindow;

    invoke-virtual {p1, p0}, Landroid/widget/ListPopupWindow;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 101
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->popupWindow:Landroid/widget/ListPopupWindow;

    invoke-virtual {p1}, Landroid/widget/ListPopupWindow;->show()V

    return-void
.end method


# virtual methods
.method public dismissAttachmentPicker()V
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->bottomSheetDialog:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->bottomSheetDialog:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    invoke-virtual {v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->dismiss()V

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->popupWindow:Landroid/widget/ListPopupWindow;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 65
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->popupWindow:Landroid/widget/ListPopupWindow;

    invoke-virtual {v0}, Landroid/widget/ListPopupWindow;->dismiss()V

    :cond_1
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 75
    invoke-virtual {p0}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->dismissAttachmentPicker()V

    .line 76
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->listener:Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;

    if-eqz p1, :cond_2

    .line 77
    sget p1, Lcom/helpshift/R$id;->title:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    .line 78
    iget-object p2, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->context:Landroid/content/Context;

    sget p3, Lcom/helpshift/R$string;->hs__photo:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 79
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->listener:Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;

    const/4 p2, 0x1

    invoke-interface {p1, p2}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;->launchAttachmentPicker(I)V

    goto :goto_0

    .line 81
    :cond_0
    iget-object p2, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->context:Landroid/content/Context;

    sget p3, Lcom/helpshift/R$string;->hs__video:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 82
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->listener:Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;

    const/4 p2, 0x2

    invoke-interface {p1, p2}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;->launchAttachmentPicker(I)V

    goto :goto_0

    .line 84
    :cond_1
    iget-object p2, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->context:Landroid/content/Context;

    sget p3, Lcom/helpshift/R$string;->hs__documents:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 85
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->listener:Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;

    const/4 p2, 0x3

    invoke-interface {p1, p2}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;->launchAttachmentPicker(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public setListener(Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->listener:Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;

    return-void
.end method

.method public showAttachmentPicker(Landroid/view/View;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 45
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 46
    iget-object p1, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->listener:Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;

    if-eqz p1, :cond_2

    const/4 v0, 0x0

    .line 47
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-interface {p1, p2}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker$OnAttachmentTypeOptionClickListener;->launchAttachmentPicker(I)V

    goto :goto_0

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/helpshift/support/util/Styles;->isTablet(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 52
    invoke-direct {p0, p1, p2}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->showPickerForTablet(Landroid/view/View;Ljava/util/List;)V

    goto :goto_0

    .line 55
    :cond_1
    invoke-direct {p0, p2}, Lcom/helpshift/support/widget/AttachmentTypeOptionPicker;->showPickerForPhone(Ljava/util/List;)V

    :cond_2
    :goto_0
    return-void
.end method
