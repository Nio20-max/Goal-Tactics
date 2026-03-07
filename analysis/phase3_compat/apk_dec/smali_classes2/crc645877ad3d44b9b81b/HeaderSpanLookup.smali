.class public Lcrc645877ad3d44b9b81b/HeaderSpanLookup;
.super Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;
.source "HeaderSpanLookup.java"

# interfaces
.implements Lmono/android/IGCUserPeer;


# static fields
.field public static final __md_methods:Ljava/lang/String; = "n_getSpanSize:(I)I:GetGetSpanSize_IHandler\n"


# instance fields
.field private refList:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 15
    const-class v0, Lcrc645877ad3d44b9b81b/HeaderSpanLookup;

    const-string v1, "GT.Droid.HeaderSpanLookup, GT.Droid"

    const-string v2, "n_getSpanSize:(I)I:GetGetSpanSize_IHandler\n"

    invoke-static {v1, v0, v2}, Lmono/android/Runtime;->register(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 21
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcrc645877ad3d44b9b81b/HeaderSpanLookup;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "GT.Droid.HeaderSpanLookup, GT.Droid"

    const-string v2, ""

    .line 23
    invoke-static {v1, v2, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 28
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcrc645877ad3d44b9b81b/HeaderSpanLookup;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, v1

    const-string p1, "GT.Droid.HeaderSpanLookup, GT.Droid"

    const-string v1, "System.Int32, mscorlib"

    invoke-static {p1, v1, p0, v0}, Lmono/android/TypeManager;->Activate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private native n_getSpanSize(I)I
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 0

    .line 36
    invoke-direct {p0, p1}, Lcrc645877ad3d44b9b81b/HeaderSpanLookup;->n_getSpanSize(I)I

    move-result p1

    return p1
.end method

.method public monodroidAddReference(Ljava/lang/Object;)V
    .locals 1

    .line 44
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/HeaderSpanLookup;->refList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcrc645877ad3d44b9b81b/HeaderSpanLookup;->refList:Ljava/util/ArrayList;

    .line 46
    :cond_0
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/HeaderSpanLookup;->refList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public monodroidClearReferences()V
    .locals 1

    .line 51
    iget-object v0, p0, Lcrc645877ad3d44b9b81b/HeaderSpanLookup;->refList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 52
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method
