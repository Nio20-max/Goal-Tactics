.class public Lcom/helpshift/util/ConnectivityUtil;
.super Ljava/lang/Object;
.source "ConnectivityUtil.java"


# instance fields
.field private final context:Landroid/content/Context;

.field private final defaultBatchSize:I

.field private final maximumBatchSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/helpshift/util/ConnectivityUtil;->context:Landroid/content/Context;

    .line 16
    iput p2, p0, Lcom/helpshift/util/ConnectivityUtil;->defaultBatchSize:I

    .line 17
    iput p3, p0, Lcom/helpshift/util/ConnectivityUtil;->maximumBatchSize:I

    return-void
.end method


# virtual methods
.method public getBatchSize()I
    .locals 2

    .line 22
    iget-object v0, p0, Lcom/helpshift/util/ConnectivityUtil;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/helpshift/network/connectivity/HSConnectivityManager;->getInstance(Landroid/content/Context;)Lcom/helpshift/network/connectivity/HSConnectivityManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/helpshift/network/connectivity/HSConnectivityManager;->getConnectivityType()Lcom/helpshift/network/connectivity/HSConnectivityType;

    move-result-object v0

    .line 23
    sget-object v1, Lcom/helpshift/util/ConnectivityUtil$1;->$SwitchMap$com$helpshift$network$connectivity$HSConnectivityType:[I

    invoke-virtual {v0}, Lcom/helpshift/network/connectivity/HSConnectivityType;->ordinal()I

    move-result v0

    aget v0, v1, v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 30
    iget v0, p0, Lcom/helpshift/util/ConnectivityUtil;->defaultBatchSize:I

    goto :goto_0

    .line 25
    :cond_0
    iget v0, p0, Lcom/helpshift/util/ConnectivityUtil;->maximumBatchSize:I

    .line 32
    :goto_0
    iget v1, p0, Lcom/helpshift/util/ConnectivityUtil;->maximumBatchSize:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method
