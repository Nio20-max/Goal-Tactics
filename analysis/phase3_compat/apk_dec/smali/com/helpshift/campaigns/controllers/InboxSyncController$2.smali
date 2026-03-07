.class Lcom/helpshift/campaigns/controllers/InboxSyncController$2;
.super Ljava/lang/Object;
.source "InboxSyncController.java"

# interfaces
.implements Lcom/helpshift/network/response/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/campaigns/controllers/InboxSyncController;->getRequest()Lcom/helpshift/network/request/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/campaigns/controllers/InboxSyncController;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/controllers/InboxSyncController;)V
    .locals 0

    .line 186
    iput-object p1, p0, Lcom/helpshift/campaigns/controllers/InboxSyncController$2;->this$0:Lcom/helpshift/campaigns/controllers/InboxSyncController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorResponse(Lcom/helpshift/network/errors/NetworkError;Ljava/lang/Integer;)V
    .locals 0

    return-void
.end method
