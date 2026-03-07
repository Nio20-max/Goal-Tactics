.class public Lcom/helpshift/common/platform/AndroidSmartIntentDAO;
.super Ljava/lang/Object;
.source "AndroidSmartIntentDAO.java"

# interfaces
.implements Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_SIDBDao"


# instance fields
.field private final smartIntentDB:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    invoke-static {p1}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->getInstance(Landroid/content/Context;)Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/common/platform/AndroidSmartIntentDAO;->smartIntentDB:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    return-void
.end method


# virtual methods
.method public deleteModel(J)Z
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/helpshift/common/platform/AndroidSmartIntentDAO;->smartIntentDB:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->deleteModel(J)Z

    move-result p1

    return p1
.end method

.method public deleteTreeAndModel(Lcom/helpshift/account/domainmodel/UserDM;)Z
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/helpshift/common/platform/AndroidSmartIntentDAO;->smartIntentDB:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    invoke-virtual {v0, p1}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->deleteTreeAndModel(Lcom/helpshift/account/domainmodel/UserDM;)Z

    move-result p1

    return p1
.end method

.method public getModelWithoutWordProbabilities(J)Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;
    .locals 1

    .line 57
    iget-object v0, p0, Lcom/helpshift/common/platform/AndroidSmartIntentDAO;->smartIntentDB:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->getModelWithoutWordProbabilities(J)Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;

    move-result-object p1

    return-object p1
.end method

.method public getTree(Lcom/helpshift/account/domainmodel/UserDM;)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;
    .locals 3

    .line 52
    iget-object v0, p0, Lcom/helpshift/common/platform/AndroidSmartIntentDAO;->smartIntentDB:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    invoke-virtual {p1}, Lcom/helpshift/account/domainmodel/UserDM;->getLocalId()Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->getSmartIntentTree(J)Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    move-result-object p1

    return-object p1
.end method

.method public getWordToIntentProbabilities(JLjava/lang/String;)Ljava/util/List;
    .locals 1
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

    .line 62
    iget-object v0, p0, Lcom/helpshift/common/platform/AndroidSmartIntentDAO;->smartIntentDB:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    invoke-virtual {v0, p1, p2, p3}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->getWordToIntentProbabilities(JLjava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public insertModel(JLcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;)Z
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/helpshift/common/platform/AndroidSmartIntentDAO;->smartIntentDB:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    invoke-virtual {v0, p1, p2, p3}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->insertModel(JLcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;)Z

    move-result p1

    return p1
.end method

.method public insertTree(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Z
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/helpshift/common/platform/AndroidSmartIntentDAO;->smartIntentDB:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    invoke-virtual {v0, p1, p2}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->insertTree(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)Z

    move-result p1

    return p1
.end method

.method public updateModelLastRefreshedAtTime(JJ)Z
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/helpshift/common/platform/AndroidSmartIntentDAO;->smartIntentDB:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->updateModelRefreshedAt(JJ)Z

    move-result p1

    return p1
.end method

.method public updateTreeLastRefreshedAtTime(Lcom/helpshift/account/domainmodel/UserDM;J)Z
    .locals 1

    .line 32
    iget-object v0, p0, Lcom/helpshift/common/platform/AndroidSmartIntentDAO;->smartIntentDB:Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;

    invoke-virtual {v0, p1, p2, p3}, Lcom/helpshift/db/conversation/smartintent/SmartIntentDB;->updateTreeRefreshedAt(Lcom/helpshift/account/domainmodel/UserDM;J)Z

    move-result p1

    return p1
.end method
