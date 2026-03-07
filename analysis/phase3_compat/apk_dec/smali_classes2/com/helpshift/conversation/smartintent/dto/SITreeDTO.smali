.class public Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;
.super Ljava/lang/Object;
.source "SITreeDTO.java"


# instance fields
.field public final emptySearchDescription:Ljava/lang/String;

.field public final emptySearchTitle:Ljava/lang/String;

.field public final enforceIntentSelection:Z

.field public lastRefreshedAt:J

.field public localId:Ljava/lang/Long;

.field public final promptTitle:Ljava/lang/String;

.field public final rootIntents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;"
        }
    .end annotation
.end field

.field public final searchTitle:Ljava/lang/String;

.field public final serverId:Ljava/lang/String;

.field public final textInputHint:Ljava/lang/String;

.field public final tokenDelimiter:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final version:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;)V"
        }
    .end annotation

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->serverId:Ljava/lang/String;

    .line 42
    iput p2, p0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->version:I

    .line 43
    iput-object p3, p0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->promptTitle:Ljava/lang/String;

    .line 44
    iput-object p4, p0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->textInputHint:Ljava/lang/String;

    .line 45
    iput-object p5, p0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->searchTitle:Ljava/lang/String;

    .line 46
    iput-object p6, p0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->emptySearchTitle:Ljava/lang/String;

    .line 47
    iput-object p7, p0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->emptySearchDescription:Ljava/lang/String;

    .line 48
    iput-boolean p8, p0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->enforceIntentSelection:Z

    .line 49
    iput-object p9, p0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->tokenDelimiter:Ljava/util/List;

    .line 50
    iput-object p10, p0, Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;->rootIntents:Ljava/util/List;

    return-void
.end method
