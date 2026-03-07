.class Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager$1;
.super Ljava/lang/Object;
.source "SmartIntentSearchManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->rankProbabilities(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/helpshift/util/ValuePair<",
        "Ljava/lang/String;",
        "Ljava/lang/Double;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;)V
    .locals 0

    .line 286
    iput-object p1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager$1;->this$0:Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/helpshift/util/ValuePair;Lcom/helpshift/util/ValuePair;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/util/ValuePair<",
            "Ljava/lang/String;",
            "Ljava/lang/Double;",
            ">;",
            "Lcom/helpshift/util/ValuePair<",
            "Ljava/lang/String;",
            "Ljava/lang/Double;",
            ">;)I"
        }
    .end annotation

    .line 289
    iget-object v0, p1, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Double;

    iget-object v1, p2, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/Double;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 293
    :cond_0
    iget-object p1, p1, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    iget-object p1, p2, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Double;

    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p1

    cmpl-double v2, v0, p1

    if-lez v2, :cond_1

    const/4 p1, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    :goto_0
    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 286
    check-cast p1, Lcom/helpshift/util/ValuePair;

    check-cast p2, Lcom/helpshift/util/ValuePair;

    invoke-virtual {p0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager$1;->compare(Lcom/helpshift/util/ValuePair;Lcom/helpshift/util/ValuePair;)I

    move-result p1

    return p1
.end method
