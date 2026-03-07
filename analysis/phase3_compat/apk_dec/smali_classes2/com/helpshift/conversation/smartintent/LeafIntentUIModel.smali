.class public Lcom/helpshift/conversation/smartintent/LeafIntentUIModel;
.super Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;
.source "LeafIntentUIModel.java"


# direct methods
.method public constructor <init>(JLjava/lang/String;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2, p3}, Lcom/helpshift/conversation/smartintent/BaseIntentUIModel;-><init>(JLjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getType()Lcom/helpshift/conversation/smartintent/SmartIntentType;
    .locals 1

    .line 14
    sget-object v0, Lcom/helpshift/conversation/smartintent/SmartIntentType;->LEAF_INTENT:Lcom/helpshift/conversation/smartintent/SmartIntentType;

    return-object v0
.end method
