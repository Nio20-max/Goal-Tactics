.class public Lcom/helpshift/common/domain/network/HSUrlMetadata;
.super Ljava/lang/Object;
.source "HSUrlMetadata.java"


# instance fields
.field public final etag:Ljava/lang/String;

.field public final isLastFetchSuccessful:Z

.field public final lastFetchTimestamp:J

.field public final url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JZ)V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/helpshift/common/domain/network/HSUrlMetadata;->url:Ljava/lang/String;

    .line 24
    iput-object p2, p0, Lcom/helpshift/common/domain/network/HSUrlMetadata;->etag:Ljava/lang/String;

    .line 25
    iput-wide p3, p0, Lcom/helpshift/common/domain/network/HSUrlMetadata;->lastFetchTimestamp:J

    .line 26
    iput-boolean p5, p0, Lcom/helpshift/common/domain/network/HSUrlMetadata;->isLastFetchSuccessful:Z

    return-void
.end method
