.class Lcom/helpshift/support/fragments/SectionListFragment$1;
.super Ljava/lang/Object;
.source "SectionListFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/fragments/SectionListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/fragments/SectionListFragment;

.field final synthetic val$faqTagFilter:Lcom/helpshift/support/FaqTagFilter;

.field final synthetic val$sections:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/helpshift/support/fragments/SectionListFragment;Ljava/util/ArrayList;Lcom/helpshift/support/FaqTagFilter;)V
    .locals 0

    .line 62
    iput-object p1, p0, Lcom/helpshift/support/fragments/SectionListFragment$1;->this$0:Lcom/helpshift/support/fragments/SectionListFragment;

    iput-object p2, p0, Lcom/helpshift/support/fragments/SectionListFragment$1;->val$sections:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/helpshift/support/fragments/SectionListFragment$1;->val$faqTagFilter:Lcom/helpshift/support/FaqTagFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 65
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 66
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 67
    iget-object v1, p0, Lcom/helpshift/support/fragments/SectionListFragment$1;->val$sections:Ljava/util/ArrayList;

    const-string v2, "sections"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string v1, "sectionPublishId"

    .line 68
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    iget-object p1, p0, Lcom/helpshift/support/fragments/SectionListFragment$1;->val$faqTagFilter:Lcom/helpshift/support/FaqTagFilter;

    const-string v1, "withTagsMatching"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 70
    iget-object p1, p0, Lcom/helpshift/support/fragments/SectionListFragment$1;->this$0:Lcom/helpshift/support/fragments/SectionListFragment;

    invoke-virtual {p1}, Lcom/helpshift/support/fragments/SectionListFragment;->getFaqFlowListener()Lcom/helpshift/support/contracts/FaqFragmentListener;

    move-result-object p1

    invoke-interface {p1, v0}, Lcom/helpshift/support/contracts/FaqFragmentListener;->onSectionSelected(Landroid/os/Bundle;)V

    return-void
.end method
