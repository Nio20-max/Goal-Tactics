.class public final synthetic Lcom/facebook/appevents/cloudbridge/-$$Lambda$AppEventsConversionsAPITransformerWebRequests$1ejVAMWy4Hqq0D8rdnJsBJQtd7E;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/facebook/GraphRequest;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/GraphRequest;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/appevents/cloudbridge/-$$Lambda$AppEventsConversionsAPITransformerWebRequests$1ejVAMWy4Hqq0D8rdnJsBJQtd7E;->f$0:Lcom/facebook/GraphRequest;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/appevents/cloudbridge/-$$Lambda$AppEventsConversionsAPITransformerWebRequests$1ejVAMWy4Hqq0D8rdnJsBJQtd7E;->f$0:Lcom/facebook/GraphRequest;

    invoke-static {v0}, Lcom/facebook/appevents/cloudbridge/AppEventsConversionsAPITransformerWebRequests;->lambda$1ejVAMWy4Hqq0D8rdnJsBJQtd7E(Lcom/facebook/GraphRequest;)V

    return-void
.end method
