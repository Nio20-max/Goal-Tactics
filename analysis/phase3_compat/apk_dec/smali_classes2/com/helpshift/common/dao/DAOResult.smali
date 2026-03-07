.class public Lcom/helpshift/common/dao/DAOResult;
.super Ljava/lang/Object;
.source "DAOResult.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final data:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final isSuccess:Z


# direct methods
.method public constructor <init>(ZLjava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZTT;)V"
        }
    .end annotation

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-boolean p1, p0, Lcom/helpshift/common/dao/DAOResult;->isSuccess:Z

    .line 16
    iput-object p2, p0, Lcom/helpshift/common/dao/DAOResult;->data:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getData()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 20
    iget-object v0, p0, Lcom/helpshift/common/dao/DAOResult;->data:Ljava/lang/Object;

    return-object v0
.end method

.method public isSuccess()Z
    .locals 1

    .line 24
    iget-boolean v0, p0, Lcom/helpshift/common/dao/DAOResult;->isSuccess:Z

    return v0
.end method
