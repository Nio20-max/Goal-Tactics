.class public Lcrc645877ad3d44b9b81b/GTRecyclerViewAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "GTRecyclerViewAdapter.java"

# interfaces
.implements Lmono/android/IGCUserPeer;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_getItemCount:()I:GetGetItemCountHandler\nn_getItemViewType:(I)I:GetGetItemViewType_IHandler\nn_onBindViewHolder:(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V:GetOnBindViewHolder_Landroidx_recyclerview_widget_RecyclerView_ViewHolder_IHandler\nn_onCreateViewHolder:(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;:GetOnCreateViewHolder_Landroid_view_ViewGroup_IHandler\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 18
    const-class v0, Lcrc645877ad3d44b9b81b/GTRecyclerViewAdapter;

    const-string v1, "GT.Droid.GTRecyclerViewAdapter, GT.Droid"

    const-string v2, "n_getItemCount:()I:GetGetItemCountHandler\nn_getItemViewType:(I)I:GetGetItemViewType_IHandler\nn_onBindViewHolder:(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V:GetOnBindViewHolder_Landroidx_recyclerview_widget_RecyclerView_ViewHolder_IHandler\nn_onCreateViewHolder:(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;:GetOnCreateViewHolder_Landroid_view_ViewGroup_IHandler\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 24
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcrc645877ad3d44b9b81b/GTRecyclerViewAdapter;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "GT.Droid.GTRecyclerViewAdapter, GT.Droid"

    const-string v2, ""

    .line 26
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public constructor <init>(Lcrc645877ad3d44b9b81b/GTRecyclerView;)V
    .locals 2

    .line 31
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 32
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcrc645877ad3d44b9b81b/GTRecyclerViewAdapter;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "GT.Droid.GTRecyclerViewAdapter, GT.Droid"

    const-string v1, "GT.Droid.GTRecyclerView, GT.Droid"

    .line 33
    invoke-static {p1, v1, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_getItemCount()I
.end method

.method private native n_getItemViewType(I)I
.end method

.method private native n_onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
.end method

.method private native n_onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 39
    invoke-direct {p0}, Lcrc645877ad3d44b9b81b/GTRecyclerViewAdapter;->n_getItemCount()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lcrc645877ad3d44b9b81b/GTRecyclerViewAdapter;->n_getItemViewType(I)I

    move-result p1

    return p1
.end method

.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 71
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/GTRecyclerViewAdapter;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 72
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcrc645877ad3d44b9b81b/GTRecyclerViewAdapter;->refList:Ljava/util/ArrayList;

    .line 73
    :cond_0
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/GTRecyclerViewAdapter;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 78
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/GTRecyclerViewAdapter;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 79
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 55
    invoke-direct {p0, p1, p2}, Lcrc645877ad3d44b9b81b/GTRecyclerViewAdapter;->n_onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 63
    invoke-direct {p0, p1, p2}, Lcrc645877ad3d44b9b81b/GTRecyclerViewAdapter;->n_onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    move-result-object p1

    return-object p1
.end method
