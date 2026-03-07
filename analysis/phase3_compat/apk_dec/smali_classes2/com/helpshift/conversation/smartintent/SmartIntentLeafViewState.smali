.class public Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;
.super Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;
.source "SmartIntentLeafViewState.java"


# instance fields
.field public final leafIntentUIModels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/LeafIntentUIModel;",
            ">;"
        }
    .end annotation
.end field

.field public final parentIntentId:J

.field public final typingBoxHint:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZJLjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "ZJ",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/LeafIntentUIModel;",
            ">;)V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p3}, Lcom/helpshift/conversation/smartintent/BaseSmartIntentViewState;-><init>(Ljava/lang/String;Z)V

    .line 20
    iput-object p2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;->typingBoxHint:Ljava/lang/String;

    .line 21
    iput-wide p4, p0, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;->parentIntentId:J

    .line 22
    iput-object p6, p0, Lcom/helpshift/conversation/smartintent/SmartIntentLeafViewState;->leafIntentUIModels:Ljava/util/List;

    return-void
.end method
