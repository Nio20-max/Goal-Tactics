.class Lcom/helpshift/logger/ErrorReportsDM$1;
.super Lcom/helpshift/common/domain/F;
.source "ErrorReportsDM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/logger/ErrorReportsDM;->sendErrorReport(Lcom/helpshift/util/FetchDataFromThread;Ljava/util/List;Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/helpshift/logger/ErrorReportsDM;

.field final synthetic val$apiVersion:Ljava/lang/String;

.field final synthetic val$buildModel:Ljava/lang/String;

.field final synthetic val$callback:Lcom/helpshift/util/FetchDataFromThread;

.field final synthetic val$campaignDeviceId:Ljava/lang/String;

.field final synthetic val$logs:Ljava/util/List;

.field final synthetic val$os:Ljava/lang/String;

.field final synthetic val$sdkVersion:Ljava/lang/String;

.field final synthetic val$userDM:Lcom/helpshift/account/domainmodel/UserDM;


# direct methods
.method constructor <init>(Lcom/helpshift/logger/ErrorReportsDM;Ljava/util/List;Ljava/lang/String;Lcom/helpshift/account/domainmodel/UserDM;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/helpshift/util/FetchDataFromThread;)V
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iput-object p2, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$logs:Ljava/util/List;

    iput-object p3, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$buildModel:Ljava/lang/String;

    iput-object p4, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    iput-object p5, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$campaignDeviceId:Ljava/lang/String;

    iput-object p6, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$os:Ljava/lang/String;

    iput-object p7, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$apiVersion:Ljava/lang/String;

    iput-object p8, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$sdkVersion:Ljava/lang/String;

    iput-object p9, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$callback:Lcom/helpshift/util/FetchDataFromThread;

    invoke-direct {p0}, Lcom/helpshift/common/domain/F;-><init>()V

    return-void
.end method


# virtual methods
.method public f()V
    .locals 7

    .line 52
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v0, v0, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v0}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v0

    iget-object v1, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$logs:Ljava/util/List;

    invoke-interface {v0, v1}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyLogModelList(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    .line 53
    iget-object v1, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v1, v1, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v1}, Lcom/helpshift/common/platform/Platform;->getDevice()Lcom/helpshift/common/platform/Device;

    move-result-object v1

    .line 54
    invoke-interface {v1}, Lcom/helpshift/common/platform/Device;->getAppName()Ljava/lang/String;

    move-result-object v2

    .line 55
    invoke-interface {v1}, Lcom/helpshift/common/platform/Device;->getAppVersion()Ljava/lang/String;

    move-result-object v1

    .line 57
    new-instance v3, Ljava/util/ArrayList;

    const/4 v4, 0x5

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 58
    iget-object v4, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v4, v4, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v4}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v4

    const-string v5, "domain"

    iget-object v6, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v6, v6, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v6}, Lcom/helpshift/common/platform/Platform;->getDomain()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyToObject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    iget-object v4, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v4, v4, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v4}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v4

    const-string v5, "dm"

    iget-object v6, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$buildModel:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyToObject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 60
    iget-object v4, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v4, v4, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v4}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v4

    const-string v5, "did"

    iget-object v6, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$userDM:Lcom/helpshift/account/domainmodel/UserDM;

    invoke-virtual {v6}, Lcom/helpshift/account/domainmodel/UserDM;->getDeviceId()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyToObject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 61
    iget-object v4, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$campaignDeviceId:Ljava/lang/String;

    invoke-static {v4}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 62
    iget-object v4, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v4, v4, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v4}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v4

    const-string v5, "cdid"

    iget-object v6, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$campaignDeviceId:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyToObject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    :cond_0
    iget-object v4, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v4, v4, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v4}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v4

    const-string v5, "os"

    iget-object v6, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$os:Ljava/lang/String;

    invoke-interface {v4, v5, v6}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyToObject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    invoke-static {v2}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 66
    iget-object v4, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v4, v4, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v4}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v4

    const-string v5, "an"

    invoke-interface {v4, v5, v2}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyToObject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    :cond_1
    invoke-static {v1}, Lcom/helpshift/util/StringUtils;->isEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 69
    iget-object v2, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v2, v2, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v2}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v2

    const-string v4, "av"

    invoke-interface {v2, v4, v1}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyToObject(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    :cond_2
    iget-object v1, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v1, v1, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-interface {v1}, Lcom/helpshift/common/platform/Platform;->getJsonifier()Lcom/helpshift/common/platform/Jsonifier;

    move-result-object v1

    invoke-interface {v1, v3}, Lcom/helpshift/common/platform/Jsonifier;->jsonifyListToJsonArray(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    .line 73
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v3, "id"

    .line 74
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "v"

    .line 75
    iget-object v4, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$apiVersion:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    iget-object v3, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v3, v3, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-static {v3}, Lcom/helpshift/common/util/HSDateFormatSpec;->getCurrentAdjustedTime(Lcom/helpshift/common/platform/Platform;)Ljava/util/Date;

    move-result-object v3

    const-string v4, "ctime"

    .line 79
    sget-object v5, Lcom/helpshift/util/HSFormat;->errorLogReportingTimeFormat:Lcom/helpshift/util/HSSimpleDateFormat;

    invoke-virtual {v5, v3}, Lcom/helpshift/util/HSSimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "src"

    .line 80
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sdk.android."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$sdkVersion:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "logs"

    .line 81
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "md"

    .line 82
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    new-instance v0, Lcom/helpshift/common/domain/network/CustomAuthDataPOSTNetwork;

    const-string v1, "/events/crash-log"

    iget-object v3, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v3, v3, Lcom/helpshift/logger/ErrorReportsDM;->domain:Lcom/helpshift/common/domain/Domain;

    iget-object v4, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v4, v4, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    iget-object v5, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    invoke-virtual {v5}, Lcom/helpshift/logger/ErrorReportsDM;->getAuthDataForErrorReports()Ljava/util/Map;

    move-result-object v5

    invoke-direct {v0, v1, v3, v4, v5}, Lcom/helpshift/common/domain/network/CustomAuthDataPOSTNetwork;-><init>(Ljava/lang/String;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/common/platform/Platform;Ljava/util/Map;)V

    .line 84
    new-instance v1, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;

    invoke-direct {v1, v0}, Lcom/helpshift/common/domain/network/FailedAPICallNetworkDecorator;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 85
    new-instance v0, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;

    iget-object v3, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->this$0:Lcom/helpshift/logger/ErrorReportsDM;

    iget-object v3, v3, Lcom/helpshift/logger/ErrorReportsDM;->platform:Lcom/helpshift/common/platform/Platform;

    invoke-direct {v0, v1, v3}, Lcom/helpshift/common/domain/network/TSCorrectedNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;Lcom/helpshift/common/platform/Platform;)V

    .line 86
    new-instance v1, Lcom/helpshift/common/domain/network/GuardOKNetwork;

    invoke-direct {v1, v0}, Lcom/helpshift/common/domain/network/GuardOKNetwork;-><init>(Lcom/helpshift/common/domain/network/Network;)V

    .line 88
    new-instance v0, Lcom/helpshift/common/platform/network/RequestData;

    invoke-direct {v0, v2}, Lcom/helpshift/common/platform/network/RequestData;-><init>(Ljava/util/Map;)V

    invoke-interface {v1, v0}, Lcom/helpshift/common/domain/network/Network;->makeRequest(Lcom/helpshift/common/platform/network/RequestData;)Lcom/helpshift/common/platform/network/Response;

    move-result-object v0

    .line 89
    iget-object v1, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$callback:Lcom/helpshift/util/FetchDataFromThread;

    invoke-interface {v1, v0}, Lcom/helpshift/util/FetchDataFromThread;->onDataFetched(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/helpshift/common/exception/RootAPIException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 92
    :catch_0
    iget-object v0, p0, Lcom/helpshift/logger/ErrorReportsDM$1;->val$callback:Lcom/helpshift/util/FetchDataFromThread;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/helpshift/util/FetchDataFromThread;->onFailure(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
