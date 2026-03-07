.class public Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;
.super Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;
.source "SearchIntentUIModel.java"


# instance fields
.field public confidence:Ljava/lang/Double;

.field public final parentLabel:Ljava/lang/String;

.field public rank:I


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;-><init>(JLjava/lang/String;)V

    .line 15
    iput-object p4, p0, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->parentLabel:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public deepClone()Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;
    .locals 5

    .line 24
    new-instance v0, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;

    iget-wide v1, p0, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->localId:J

    iget-object v3, p0, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->label:Ljava/lang/String;

    iget-object v4, p0, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->parentLabel:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    .line 25
    iget v1, p0, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->rank:I

    iput v1, v0, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->rank:I

    .line 26
    iget-object v1, p0, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->confidence:Ljava/lang/Double;

    iput-object v1, v0, Lcom/helpshift/conversation/smartintent/SearchIntentUIModel;->confidence:Ljava/lang/Double;

    return-object v0
.end method

.method public getType()Lcom/helpshift/conversation/smartintent/SmartIntentType;
    .locals 1

    .line 32
    sget-object v0, Lcom/helpshift/conversation/smartintent/SmartIntentType;->SEARCH_INTENT:Lcom/helpshift/conversation/smartintent/SmartIntentType;

    return-object v0
.end method
