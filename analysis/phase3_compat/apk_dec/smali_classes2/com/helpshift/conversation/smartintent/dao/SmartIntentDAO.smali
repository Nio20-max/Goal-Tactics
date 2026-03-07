.class public interface abstract Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;
.super Ljava/lang/Object;
.source "SmartIntentDAO.java"


# virtual methods
.method public abstract deleteModel(J)Z
.end method

.method public abstract deleteTreeAndModel(Lcom/helpshift/account/domainmodel/UserDM;)Z
.end method

.method public abstract getModelWithoutWordProbabilities(J)Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;
.end method

.method public abstract getTree(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;
.end method

.method public abstract getWordToIntentProbabilities(JLjava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end method

.method public abstract insertModel(JLcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;)Z
.end method

.method public abstract insertTree(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Z
.end method

.method public abstract updateModelLastRefreshedAtTime(JJ)Z
.end method

.method public abstract updateTreeLastRefreshedAtTime(Lcom/helpshift/account/domainmodel/UserDM;J)Z
.end method
