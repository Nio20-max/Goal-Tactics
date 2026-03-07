.class public Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;
.super Ljava/lang/Object;
.source "SmartIntentSearchManager.java"


# static fields
.field private static final AI_LEAF_INTENT_MATCH_RESULT_LIMIT:I = 0x5

.field public static final AI_MODEL_MATCH:I = 0x1

.field private static final AI_ROOT_INTENT_MATCH_RESULT_LIMIT:I = 0x2

.field private static final FALLBACK_INTENT_MATCH_RESULT_LIMIT:I = 0x5

.field private static final MIN_CHAR_TO_TRIGGER_SEARCH:I = 0x4

.field public static final SUBSTRING_MATCH:I = 0x2

.field private static final TAG:Ljava/lang/String; = "Helpshift_siSearchM"


# instance fields
.field private patternGenerateToken:Ljava/util/regex/Pattern;

.field private smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;


# direct methods
.method public constructor <init>(Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;)V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 36
    iput-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->patternGenerateToken:Ljava/util/regex/Pattern;

    .line 44
    iput-object p1, p0, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    return-void
.end method

.method private generateTokensForSearchQuery(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 93
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 95
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    .line 98
    invoke-virtual {p2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v4

    .line 100
    iget-object v5, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->tokenDelimiter:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 101
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 102
    invoke-static {v4}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 103
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    goto :goto_1

    .line 108
    :cond_0
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 112
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 113
    invoke-static {p1}, Lcom/helpshift/util/StringUtils;->isNotEmpty(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_3

    .line 114
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    return-object v0
.end method

.method private getLeafIntentsProbability(Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 212
    iget-object v0, p1, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->leafIntentBaseProbabilities:Ljava/util/List;

    .line 213
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 214
    iget-object v2, p0, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    iget-object v3, p1, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->localId:Ljava/lang/Long;

    .line 215
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-interface {v2, v3, v4, v1}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->getWordToIntentProbabilities(JLjava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 216
    invoke-static {v1}, Lcom/helpshift/util/ListUtils;->isNotEmpty(Ljava/util/List;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 218
    invoke-direct {p0, v0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->joinListsByElementsSum(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    .line 221
    :cond_1
    invoke-direct {p0, v0}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->normalizeProbabilities(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method private getSubList(Ljava/util/List;ID)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/helpshift/util/ValuePair<",
            "Ljava/lang/String;",
            "Ljava/lang/Double;",
            ">;>;ID)",
            "Ljava/util/List<",
            "Lcom/helpshift/util/ValuePair<",
            "Ljava/lang/String;",
            "Ljava/lang/Double;",
            ">;>;"
        }
    .end annotation

    .line 335
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 336
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, p2, :cond_1

    .line 339
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/helpshift/util/ValuePair;

    .line 340
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 341
    iget-object v4, v4, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Double;

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    add-double/2addr v1, v4

    cmpl-double v4, v1, p3

    if-ltz v4, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-object v0
.end method

.method private joinListsByElementsSum(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    .line 313
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-eq v0, v1, :cond_0

    goto :goto_1

    .line 316
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 317
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 319
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Double;

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    add-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1

    :cond_2
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private matchIntentsViaAIAlgorithm(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;Ljava/util/List;)Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;",
            "Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;"
        }
    .end annotation

    const-string v0, "Helpshift_siSearchM"

    const-string v1, "Triggering intent search via AI model"

    .line 148
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    invoke-direct {p0, p2, p3}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->getLeafIntentsProbability(Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;Ljava/util/List;)Ljava/util/List;

    move-result-object p3

    .line 151
    iget-object v0, p2, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->leafIntentServerIds:Ljava/util/List;

    .line 152
    invoke-direct {p0, p3, v0}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->rankProbabilities(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object p3

    .line 155
    invoke-static {p3}, Lcom/helpshift/util/ListUtils;->isEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    new-instance p1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p1

    invoke-direct/range {v1 .. v6}, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;-><init>(ZLjava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/List;)V

    return-object p1

    :cond_0
    const/4 v0, 0x0

    .line 161
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/util/ValuePair;

    iget-object v0, v0, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    iget-object v2, p2, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->confidenceThreshold:Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    const/4 v4, 0x2

    const/4 v5, 0x1

    cmpl-double v6, v0, v2

    if-ltz v6, :cond_1

    const/4 p1, 0x5

    .line 162
    iget-object v0, p2, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->maxCombinedConfidence:Ljava/lang/Double;

    .line 164
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    .line 162
    invoke-direct {p0, p3, p1, v0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->getSubList(Ljava/util/List;ID)Ljava/util/List;

    move-result-object v11

    .line 165
    new-instance p1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    const/4 v7, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 166
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    iget-object v10, p2, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->version:Ljava/lang/Integer;

    move-object v6, p1

    invoke-direct/range {v6 .. v11}, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;-><init>(ZLjava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/List;)V

    return-object p1

    .line 170
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 171
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/helpshift/util/ValuePair;

    .line 172
    iget-object v2, v1, Lcom/helpshift/util/ValuePair;->first:Ljava/lang/Object;

    iget-object v1, v1, Lcom/helpshift/util/ValuePair;->second:Ljava/lang/Object;

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 176
    :cond_2
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 177
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 178
    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->rootIntents:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    const-wide/16 v6, 0x0

    .line 179
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    .line 180
    iget-object v6, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->children:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 181
    iget-object v7, v7, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->serverId:Ljava/lang/String;

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Double;

    if-eqz v7, :cond_3

    .line 183
    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    add-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    goto :goto_2

    .line 186
    :cond_4
    iget-object v2, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->serverId:Ljava/lang/String;

    invoke-interface {p3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 187
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 191
    :cond_5
    invoke-direct {p0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->normalizeProbabilities(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 193
    invoke-direct {p0, p1, p3}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->rankProbabilities(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    .line 196
    iget-object p3, p2, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->maxCombinedConfidence:Ljava/lang/Double;

    .line 198
    invoke-virtual {p3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    .line 196
    invoke-direct {p0, p1, v4, v0, v1}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->getSubList(Ljava/util/List;ID)Ljava/util/List;

    move-result-object v11

    .line 199
    new-instance p1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    const/4 v7, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 200
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    iget-object v10, p2, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->version:Ljava/lang/Integer;

    move-object v6, p1

    invoke-direct/range {v6 .. v11}, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;-><init>(ZLjava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/List;)V

    return-object p1
.end method

.method private matchIntentsViaSubstringAlgorithm(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Ljava/util/List;)Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;"
        }
    .end annotation

    const-string v0, "Helpshift_siSearchM"

    const-string v1, "Triggering intent search via substring matching"

    .line 121
    invoke-static {v0, v1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 124
    iget-object p1, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->rootIntents:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 125
    iget-object v0, v0, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->children:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;

    .line 126
    iget-object v3, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->label:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    .line 127
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 128
    invoke-virtual {v3, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 129
    new-instance v3, Lcom/helpshift/util/ValuePair;

    iget-object v2, v2, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->serverId:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v4}, Lcom/helpshift/util/ValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v7, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x5

    if-ne v2, v3, :cond_1

    .line 132
    new-instance p1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    const/4 v3, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    move-object v2, p1

    invoke-direct/range {v2 .. v7}, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;-><init>(ZLjava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/List;)V

    return-object p1

    .line 142
    :cond_3
    new-instance p1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    const/4 v3, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    move-object v2, p1

    invoke-direct/range {v2 .. v7}, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;-><init>(ZLjava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/List;)V

    return-object p1
.end method

.method private normalizeProbabilities(Ljava/util/List;)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation

    .line 232
    invoke-static {p1}, Ljava/util/Collections;->max(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Double;

    .line 235
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 236
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Double;

    .line 237
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v4

    sub-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 241
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 242
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    .line 243
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Math;->exp(D)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    const-wide/16 v0, 0x0

    .line 247
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    .line 248
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Double;

    .line 249
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v7

    add-double/2addr v5, v7

    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    goto :goto_2

    .line 254
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    cmpl-double v5, v3, v0

    if-nez v5, :cond_3

    return-object p1

    .line 257
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 258
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Double;

    .line 259
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    invoke-virtual {v2}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    .line 260
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_4
    return-object v0
.end method

.method private rankProbabilities(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/helpshift/util/ValuePair<",
            "Ljava/lang/String;",
            "Ljava/lang/Double;",
            ">;>;"
        }
    .end annotation

    .line 274
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 275
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    return-object p1

    .line 277
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    .line 278
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 280
    new-instance v3, Lcom/helpshift/util/ValuePair;

    .line 281
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/helpshift/util/ValuePair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 282
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 286
    :cond_1
    new-instance p1, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager$1;

    invoke-direct {p1, p0}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager$1;-><init>(Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;)V

    invoke-static {v1, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-object v1
.end method


# virtual methods
.method public match(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Ljava/lang/String;)Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;
    .locals 8

    .line 55
    invoke-static {p2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    if-nez p1, :cond_0

    goto :goto_1

    .line 63
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    .line 64
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-ge v0, v1, :cond_1

    .line 65
    new-instance p1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p1

    invoke-direct/range {v2 .. v7}, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;-><init>(ZLjava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/List;)V

    return-object p1

    .line 70
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->generateTokensForSearchQuery(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Ljava/lang/String;)Ljava/util/List;

    move-result-object p2

    .line 71
    iget-object v0, p0, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->smartIntentDAO:Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;

    iget-object v1, p1, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->localId:Ljava/lang/Long;

    .line 72
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/helpshift/conversation/smartintent/dao/SmartIntentDAO;->getModelWithoutWordProbabilities(J)Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 76
    invoke-direct {p0, p1, v0, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->matchIntentsViaAIAlgorithm(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;Ljava/util/List;)Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    move-result-object p1

    goto :goto_0

    .line 80
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/helpshift/conversation/smartintent/SmartIntentSearchManager;->matchIntentsViaSubstringAlgorithm(Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;Ljava/util/List;)Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    move-result-object p1

    :goto_0
    return-object p1

    .line 56
    :cond_3
    :goto_1
    new-instance p1, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    invoke-direct/range {v0 .. v5}, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;-><init>(ZLjava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/List;)V

    return-object p1
.end method
