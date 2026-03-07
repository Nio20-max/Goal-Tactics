.class public Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;
.super Ljava/lang/Object;
.source "SISearchModelDTO.java"


# instance fields
.field public final confidenceThreshold:Ljava/lang/Double;

.field public lastRefreshedAt:J

.field public final leafIntentBaseProbabilities:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field public final leafIntentServerIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public localId:Ljava/lang/Long;

.field public final maxCombinedConfidence:Ljava/lang/Double;

.field public final version:Ljava/lang/Integer;

.field public final wordToLeafIntentProbabilitiesMapping:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/Double;Ljava/lang/Double;Ljava/util/List;Ljava/util/List;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Integer;",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;>;)V"
        }
    .end annotation

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->version:Ljava/lang/Integer;

    .line 25
    iput-object p2, p0, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->confidenceThreshold:Ljava/lang/Double;

    .line 26
    iput-object p3, p0, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->maxCombinedConfidence:Ljava/lang/Double;

    .line 27
    iput-object p4, p0, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->leafIntentServerIds:Ljava/util/List;

    .line 28
    iput-object p5, p0, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->leafIntentBaseProbabilities:Ljava/util/List;

    .line 29
    iput-object p6, p0, Lcom/helpshift/conversation/smartintent/dto/SISearchModelDTO;->wordToLeafIntentProbabilitiesMapping:Ljava/util/Map;

    return-void
.end method
