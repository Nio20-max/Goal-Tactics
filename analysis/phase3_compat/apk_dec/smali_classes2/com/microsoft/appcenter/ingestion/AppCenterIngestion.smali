.class public Lcom/microsoft/appcenter/ingestion/AppCenterIngestion;
.super Lcom/microsoft/appcenter/ingestion/AbstractAppCenterIngestion;
.source "AppCenterIngestion.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/microsoft/appcenter/ingestion/AppCenterIngestion$IngestionCallTemplate;
    }
.end annotation


# static fields
.field static final API_PATH:Ljava/lang/String; = "/logs?api-version=1.0.0"

.field public static final DEFAULT_LOG_URL:Ljava/lang/String; = "https://gt.nikolai-linschmann.de"

.field static final INSTALL_ID:Ljava/lang/String; = "Install-ID"


# instance fields
.field private final mLogSerializer:Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;


# direct methods
.method public constructor <init>(Lcom/microsoft/appcenter/http/HttpClient;Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "httpClient",
            "logSerializer"
        }
    .end annotation

    const-string v0, "https://gt.nikolai-linschmann.de"

    .line 63
    invoke-direct {p0, p1, v0}, Lcom/microsoft/appcenter/ingestion/AbstractAppCenterIngestion;-><init>(Lcom/microsoft/appcenter/http/HttpClient;Ljava/lang/String;)V

    .line 64
    iput-object p2, p0, Lcom/microsoft/appcenter/ingestion/AppCenterIngestion;->mLogSerializer:Lcom/microsoft/appcenter/ingestion/models/json/LogSerializer;

    return-void
.end method


# virtual methods
.method public sendAsync(Ljava/lang/String;Ljava/util/UUID;Lcom/microsoft/appcenter/ingestion/models/LogContainer;Lcom/microsoft/appcenter/http/ServiceCallback;)Lcom/microsoft/appcenter/http/ServiceCall;
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x10
        }
        names = {
            "appSecret",
            "installId",
            "logContainer",
            "serviceCallback"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method
