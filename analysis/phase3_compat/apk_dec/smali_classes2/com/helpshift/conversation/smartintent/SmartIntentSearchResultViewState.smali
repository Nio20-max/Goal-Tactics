.class public Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;
.super Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;
.source "SmartIntentSearchResultViewState.java"


# instance fields
.field public final emptySearchDescription:Ljava/lang/String;

.field public final searchIntentUIModels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;",
            ">;"
        }
    .end annotation
.end field


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
            "Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;",
            ">;)V"
        }
    .end annotation

    .line 16
    invoke-direct {p0, p1, p3}, Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;-><init>(Ljava/lang/String;Z)V

    .line 17
    iput-object p2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;->emptySearchDescription:Ljava/lang/String;

    .line 18
    iput-object p4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentSearchResultViewState;->searchIntentUIModels:Ljava/util/List;

    return-void
.end method
