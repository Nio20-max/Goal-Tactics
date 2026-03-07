.class public final synthetic Lcom/facebook/-$$Lambda$FacebookSdk$QXkRtamIwU9QKfxXqTl0cZN1r3g;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic f$0:Lcom/facebook/FacebookSdk$InitializeCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/FacebookSdk$InitializeCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/-$$Lambda$FacebookSdk$QXkRtamIwU9QKfxXqTl0cZN1r3g;->f$0:Lcom/facebook/FacebookSdk$InitializeCallback;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/facebook/-$$Lambda$FacebookSdk$QXkRtamIwU9QKfxXqTl0cZN1r3g;->f$0:Lcom/facebook/FacebookSdk$InitializeCallback;

    invoke-static {v0}, Lcom/facebook/FacebookSdk;->lambda$QXkRtamIwU9QKfxXqTl0cZN1r3g(Lcom/facebook/FacebookSdk$InitializeCallback;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method
