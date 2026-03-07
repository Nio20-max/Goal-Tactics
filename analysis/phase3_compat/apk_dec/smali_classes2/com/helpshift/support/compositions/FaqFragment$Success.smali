.class Lcom/helpshift/support/compositions/FaqFragment$Success;
.super Landroid/os/Handler;
.source "FaqFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/compositions/FaqFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Success"
.end annotation


# instance fields
.field private final faqFragmentWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/helpshift/support/compositions/FaqFragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/helpshift/support/compositions/FaqFragment;)V
    .locals 1

    .line 238
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 239
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/helpshift/support/compositions/FaqFragment$Success;->faqFragmentWeakReference:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    .line 244
    iget-object v0, p0, Lcom/helpshift/support/compositions/FaqFragment$Success;->faqFragmentWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/compositions/FaqFragment;

    if-eqz v0, :cond_6

    .line 245
    invoke-virtual {v0}, Lcom/helpshift/support/compositions/FaqFragment;->getHost()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_6

    invoke-virtual {v0}, Lcom/helpshift/support/compositions/FaqFragment;->isDetached()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 250
    :cond_0
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    .line 251
    iget p1, p1, Landroid/os/Message;->what:I

    if-eqz v1, :cond_1

    .line 253
    invoke-virtual {v0, v1}, Lcom/helpshift/support/compositions/FaqFragment;->removeEmptySections(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v1

    .line 254
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    iput v2, v0, Lcom/helpshift/support/compositions/FaqFragment;->sectionsSize:I

    .line 257
    :cond_1
    sget v2, Lcom/helpshift/support/constants/GetSectionsCallBackStatus;->DATABASE_SUCCESS:I

    const/4 v3, 0x1

    if-ne p1, v2, :cond_2

    .line 258
    iget p1, v0, Lcom/helpshift/support/compositions/FaqFragment;->sectionsSize:I

    if-eqz p1, :cond_5

    .line 260
    invoke-virtual {v0, v3}, Lcom/helpshift/support/compositions/FaqFragment;->updateFaqLoadingUI(I)V

    .line 261
    invoke-virtual {v0, v0, v1}, Lcom/helpshift/support/compositions/FaqFragment;->updateFragment(Lcom/helpshift/support/compositions/FaqFragment;Ljava/util/ArrayList;)V

    goto :goto_0

    .line 265
    :cond_2
    sget v2, Lcom/helpshift/support/constants/GetSectionsCallBackStatus;->API_SUCCESS_NEW_DATA:I

    const/4 v4, 0x2

    if-ne p1, v2, :cond_4

    .line 266
    iget p1, v0, Lcom/helpshift/support/compositions/FaqFragment;->sectionsSize:I

    if-nez p1, :cond_3

    .line 268
    invoke-virtual {v0, v4}, Lcom/helpshift/support/compositions/FaqFragment;->updateFaqLoadingUI(I)V

    goto :goto_0

    .line 273
    :cond_3
    iput-boolean v3, v0, Lcom/helpshift/support/compositions/FaqFragment;->isDataUpdatePending:Z

    .line 274
    invoke-virtual {v0, v3}, Lcom/helpshift/support/compositions/FaqFragment;->updateFaqLoadingUI(I)V

    .line 275
    invoke-virtual {v0, v0, v1}, Lcom/helpshift/support/compositions/FaqFragment;->updateFragment(Lcom/helpshift/support/compositions/FaqFragment;Ljava/util/ArrayList;)V

    goto :goto_0

    .line 279
    :cond_4
    sget v1, Lcom/helpshift/support/constants/GetSectionsCallBackStatus;->API_SUCCESS_NO_NEW_DATA:I

    if-ne p1, v1, :cond_5

    .line 280
    iget p1, v0, Lcom/helpshift/support/compositions/FaqFragment;->sectionsSize:I

    if-nez p1, :cond_5

    .line 282
    invoke-virtual {v0, v4}, Lcom/helpshift/support/compositions/FaqFragment;->updateFaqLoadingUI(I)V

    .line 286
    :cond_5
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Faq loaded with "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v0, Lcom/helpshift/support/compositions/FaqFragment;->sectionsSize:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " sections"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Helpshift_FaqFragment"

    invoke-static {v0, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    :goto_1
    return-void
.end method
