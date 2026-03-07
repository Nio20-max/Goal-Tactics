.class public final synthetic Lcom/facebook/-$$Lambda$GraphRequest$MAUut7MiwSvRh6ET2nrJQ7qtbzs;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/facebook/GraphRequest$Callback;


# instance fields
.field public final synthetic f$0:Lcom/facebook/GraphRequest$Callback;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/GraphRequest$Callback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/-$$Lambda$GraphRequest$MAUut7MiwSvRh6ET2nrJQ7qtbzs;->f$0:Lcom/facebook/GraphRequest$Callback;

    return-void
.end method


# virtual methods
.method public final onCompleted(Lcom/facebook/GraphResponse;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/-$$Lambda$GraphRequest$MAUut7MiwSvRh6ET2nrJQ7qtbzs;->f$0:Lcom/facebook/GraphRequest$Callback;

    invoke-static {v0, p1}, Lcom/facebook/GraphRequest;->lambda$MAUut7MiwSvRh6ET2nrJQ7qtbzs(Lcom/facebook/GraphRequest$Callback;Lcom/facebook/GraphResponse;)V

    return-void
.end method
