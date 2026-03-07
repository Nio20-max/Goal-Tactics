.class public Lcom/ironsource/sdk/controller/ProductParametersCollection;
.super Ljava/lang/Object;
.source "ProductParametersCollection.java"


# instance fields
.field private mProductParameters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/ironsource/sdk/data/SSAEnums$ProductType;",
            "Lcom/ironsource/sdk/data/ProductParameters;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/ironsource/sdk/controller/ProductParametersCollection;->mProductParameters:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getProductParameters(Lcom/ironsource/sdk/data/SSAEnums$ProductType;)Lcom/ironsource/sdk/data/ProductParameters;
    .locals 1

    if-eqz p1, :cond_0

    .line 29
    iget-object v0, p0, Lcom/ironsource/sdk/controller/ProductParametersCollection;->mProductParameters:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/ironsource/sdk/data/ProductParameters;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public setProductParameters(Lcom/ironsource/sdk/data/SSAEnums$ProductType;Ljava/lang/String;Ljava/lang/String;)Lcom/ironsource/sdk/data/ProductParameters;
    .locals 1

    .line 21
    new-instance v0, Lcom/ironsource/sdk/data/ProductParameters;

    invoke-direct {v0, p2, p3}, Lcom/ironsource/sdk/data/ProductParameters;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    iget-object p2, p0, Lcom/ironsource/sdk/controller/ProductParametersCollection;->mProductParameters:Ljava/util/Map;

    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method
