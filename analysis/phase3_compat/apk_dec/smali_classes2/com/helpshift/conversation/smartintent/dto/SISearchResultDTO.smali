.class public Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;
.super Ljava/lang/Object;
.source "SISearchResultDTO.java"


# instance fields
.field public final aiModelVersion:Ljava/lang/Integer;

.field public final isSearchPerformed:Z

.field public final searchAlgorithmType:Ljava/lang/Integer;

.field public final searchIntentLevel:Ljava/lang/Integer;

.field public final searchResults:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/util/ValuePair<",
            "Ljava/lang/String;",
            "Ljava/lang/Double;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ZLjava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/util/List<",
            "Lcom/helpshift/util/ValuePair<",
            "Ljava/lang/String;",
            "Ljava/lang/Double;",
            ">;>;)V"
        }
    .end annotation

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-boolean p1, p0, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->isSearchPerformed:Z

    .line 22
    iput-object p2, p0, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->searchAlgorithmType:Ljava/lang/Integer;

    .line 23
    iput-object p3, p0, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->searchIntentLevel:Ljava/lang/Integer;

    .line 24
    iput-object p4, p0, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->aiModelVersion:Ljava/lang/Integer;

    .line 25
    iput-object p5, p0, Lcom/helpshift/conversation/smartintent/dto/SISearchResultDTO;->searchResults:Ljava/util/List;

    return-void
.end method
