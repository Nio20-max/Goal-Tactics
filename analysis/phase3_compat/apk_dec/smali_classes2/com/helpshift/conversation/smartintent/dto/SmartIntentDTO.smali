.class public Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;
.super Ljava/lang/Object;
.source "SmartIntentDTO.java"


# instance fields
.field public children:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;"
        }
    .end annotation
.end field

.field public final label:Ljava/lang/String;

.field public localId:Ljava/lang/Long;

.field public final parentServerId:Ljava/lang/String;

.field public final serverId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;",
            ">;)V"
        }
    .end annotation

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->label:Ljava/lang/String;

    .line 19
    iput-object p2, p0, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->serverId:Ljava/lang/String;

    .line 20
    iput-object p3, p0, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->parentServerId:Ljava/lang/String;

    .line 21
    iput-object p4, p0, Lcom/helpshift/conversation/smartintent/dto/SmartIntentDTO;->children:Ljava/util/List;

    return-void
.end method
