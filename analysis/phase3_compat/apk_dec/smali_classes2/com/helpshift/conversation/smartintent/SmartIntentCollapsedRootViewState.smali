.class public Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;
.super Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;
.source "SmartIntentCollapsedRootViewState.java"


# instance fields
.field public final rootIntentUIModels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/RootIntentUIModel;",
            ">;"
        }
    .end annotation
.end field

.field public final typingBoxHint:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/RootIntentUIModel;",
            ">;)V"
        }
    .end annotation

    .line 16
    invoke-direct {p0, p1, p3}, Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;-><init>(Ljava/lang/String;Z)V

    .line 17
    iput-object p2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->typingBoxHint:Ljava/lang/String;

    .line 18
    iput-object p4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentCollapsedRootViewState;->rootIntentUIModels:Ljava/util/List;

    return-void
.end method
