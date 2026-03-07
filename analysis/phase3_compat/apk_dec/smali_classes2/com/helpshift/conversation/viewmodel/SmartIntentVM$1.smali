.class Lcom/helpshift/conversation/viewmodel/SmartIntentVM$1;
.super Lcom/helpshift/common/domain/F;
.source "SmartIntentVM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->onTreeAvailable(Lcom/helpshift/account/domainmodel/UserDM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

.field final synthetic val$siTreeDTO:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;


# direct methods
.method constructor <init>(Lcom/helpshift/conversation/viewmodel/SmartIntentVM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V
    .locals 0

    .line 732
    iput-object p1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM$1;->this$0:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    iput-object p2, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM$1;->val$siTreeDTO:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 2

    .line 735
    iget-object v0, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM$1;->this$0:Lcom/helpshift/conversation/viewmodel/SmartIntentVM;

    iget-object v1, p0, Lcom/helpshift/conversation/viewmodel/SmartIntentVM$1;->val$siTreeDTO:Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;

    invoke-static {v0, v1}, Lcom/helpshift/conversation/viewmodel/SmartIntentVM;->access$000(Lcom/helpshift/conversation/viewmodel/SmartIntentVM;Lcom/helpshift/conversation/smartintent/dto/SITreeDTO;)V

    return-void
.end method
