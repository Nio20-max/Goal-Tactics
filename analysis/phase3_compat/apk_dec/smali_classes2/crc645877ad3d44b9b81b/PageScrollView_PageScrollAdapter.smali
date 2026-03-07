.class public Lcrc645877ad3d44b9b81b/PageScrollView_PageScrollAdapter;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "PageScrollView_PageScrollAdapter.java"

# interfaces
.implements Lmono/android/IGCUserPeer;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_getCount:()I:GetGetCountHandler\nn_isViewFromObject:(Landroid/view/View;Ljava/lang/Object;)Z:GetIsViewFromObject_Landroid_view_View_Ljava_lang_Object_Handler\nn_instantiateItem:(Landroid/view/ViewGroup;I)Ljava/lang/Object;:GetInstantiateItem_Landroid_view_ViewGroup_IHandler\nn_destroyItem:(Landroid/view/ViewGroup;ILjava/lang/Object;)V:GetDestroyItem_Landroid_view_ViewGroup_ILjava_lang_Object_Handler\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 18
    const-class v0, Lcrc645877ad3d44b9b81b/PageScrollView_PageScrollAdapter;

    const-string v1, "GT.Droid.PageScrollView+PageScrollAdapter, GT.Droid"

    const-string v2, "n_getCount:()I:GetGetCountHandler\nn_isViewFromObject:(Landroid/view/View;Ljava/lang/Object;)Z:GetIsViewFromObject_Landroid_view_View_Ljava_lang_Object_Handler\nn_instantiateItem:(Landroid/view/ViewGroup;I)Ljava/lang/Object;:GetInstantiateItem_Landroid_view_ViewGroup_IHandler\nn_destroyItem:(Landroid/view/ViewGroup;ILjava/lang/Object;)V:GetDestroyItem_Landroid_view_ViewGroup_ILjava_lang_Object_Handler\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 24
    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcrc645877ad3d44b9b81b/PageScrollView_PageScrollAdapter;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "GT.Droid.PageScrollView+PageScrollAdapter, GT.Droid"

    const-string v2, ""

    .line 26
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
.end method

.method private native n_getCount()I
.end method

.method private native n_instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
.end method

.method private native n_isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 56
    invoke-direct {p0, p1, p2, p3}, Lcrc645877ad3d44b9b81b/PageScrollView_PageScrollAdapter;->n_destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    return-void
.end method

.method public getCount()I
    .locals 1

    .line 32
    invoke-direct {p0}, Lcrc645877ad3d44b9b81b/PageScrollView_PageScrollAdapter;->n_getCount()I

    move-result v0

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 0

    .line 48
    invoke-direct {p0, p1, p2}, Lcrc645877ad3d44b9b81b/PageScrollView_PageScrollAdapter;->n_instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 40
    invoke-direct {p0, p1, p2}, Lcrc645877ad3d44b9b81b/PageScrollView_PageScrollAdapter;->n_isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 64
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/PageScrollView_PageScrollAdapter;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcrc645877ad3d44b9b81b/PageScrollView_PageScrollAdapter;->refList:Ljava/util/ArrayList;

    .line 66
    :cond_0
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/PageScrollView_PageScrollAdapter;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 71
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/PageScrollView_PageScrollAdapter;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 72
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method
