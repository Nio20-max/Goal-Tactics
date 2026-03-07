.class Lcom/helpshift/support/HSApiData$6;
.super Ljava/lang/Object;
.source "HSApiData.java"

# interfaces
.implements Lcom/helpshift/util/FetchDataFromThread;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/support/HSApiData;->sendErrorReports(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/helpshift/util/FetchDataFromThread<",
        "Lcom/helpshift/common/platform/network/Response;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/support/HSApiData;


# direct methods
.method constructor <init>(Lcom/helpshift/support/HSApiData;)V
    .locals 0

    .line 636
    iput-object p1, p0, Lcom/helpshift/support/HSApiData$6;->this$0:Lcom/helpshift/support/HSApiData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataFetched(Lcom/helpshift/common/platform/network/Response;)V
    .locals 0

    .line 639
    invoke-static {}, Lcom/helpshift/util/HSLogger;->deleteAll()V

    return-void
.end method

.method public bridge synthetic onDataFetched(Ljava/lang/Object;)V
    .locals 0

    .line 636
    check-cast p1, Lcom/helpshift/common/platform/network/Response;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/HSApiData$6;->onDataFetched(Lcom/helpshift/common/platform/network/Response;)V

    return-void
.end method

.method public bridge synthetic onFailure(Ljava/lang/Object;)V
    .locals 0

    .line 636
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/helpshift/support/HSApiData$6;->onFailure(Ljava/lang/Void;)V

    return-void
.end method

.method public onFailure(Ljava/lang/Void;)V
    .locals 4

    .line 646
    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getPlatform()Lcom/helpshift/common/platform/Platform;

    move-result-object p1

    invoke-static {p1}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTimeInMillis(Lcom/helpshift/common/platform/Platform;)J

    move-result-wide v0

    .line 647
    iget-object p1, p0, Lcom/helpshift/support/HSApiData$6;->this$0:Lcom/helpshift/support/HSApiData;

    iget-object p1, p1, Lcom/helpshift/support/HSApiData;->storage:Lcom/helpshift/support/HSStorage;

    const-wide/32 v2, 0x5265c00

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    invoke-virtual {p1, v0, v1}, Lcom/helpshift/support/HSStorage;->setLastErrorReportedTime(J)V

    return-void
.end method
