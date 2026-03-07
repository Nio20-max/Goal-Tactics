.class public Lcom/ironsource/sdk/data/SSABCParameters;
.super Lcom/ironsource/sdk/data/SSAObj;
.source "SSABCParameters.java"


# instance fields
.field private CONNECTION_RETRIES:Ljava/lang/String;

.field private mConnectionRetries:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 10
    invoke-direct {p0}, Lcom/ironsource/sdk/data/SSAObj;-><init>()V

    const-string v0, "connectionRetries"

    .line 5
    iput-object v0, p0, Lcom/ironsource/sdk/data/SSABCParameters;->CONNECTION_RETRIES:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/ironsource/sdk/data/SSAObj;-><init>(Ljava/lang/String;)V

    const-string p1, "connectionRetries"

    .line 5
    iput-object p1, p0, Lcom/ironsource/sdk/data/SSABCParameters;->CONNECTION_RETRIES:Ljava/lang/String;

    .line 16
    invoke-virtual {p0, p1}, Lcom/ironsource/sdk/data/SSABCParameters;->containsKey(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 17
    iget-object p1, p0, Lcom/ironsource/sdk/data/SSABCParameters;->CONNECTION_RETRIES:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/ironsource/sdk/data/SSABCParameters;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/ironsource/sdk/data/SSABCParameters;->setConnectionRetries(Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public getConnectionRetries()Ljava/lang/String;
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/ironsource/sdk/data/SSABCParameters;->mConnectionRetries:Ljava/lang/String;

    return-object v0
.end method

.method public setConnectionRetries(Ljava/lang/String;)V
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/ironsource/sdk/data/SSABCParameters;->mConnectionRetries:Ljava/lang/String;

    return-void
.end method
