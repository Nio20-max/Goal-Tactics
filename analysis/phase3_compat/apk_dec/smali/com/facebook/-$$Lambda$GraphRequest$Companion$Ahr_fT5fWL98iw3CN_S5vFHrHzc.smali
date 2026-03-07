.class public final synthetic Lcom/facebook/-$$Lambda$GraphRequest$Companion$Ahr_fT5fWL98iw3CN_S5vFHrHzc;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/facebook/GraphRequest$Callback;


# instance fields
.field public final synthetic f$0:Lcom/facebook/GraphRequest$GraphJSONArrayCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/GraphRequest$GraphJSONArrayCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/-$$Lambda$GraphRequest$Companion$Ahr_fT5fWL98iw3CN_S5vFHrHzc;->f$0:Lcom/facebook/GraphRequest$GraphJSONArrayCallback;

    return-void
.end method


# virtual methods
.method public final onCompleted(Lcom/facebook/GraphResponse;)V
    .locals 1

    iget-object v0, p0, Lcom/facebook/-$$Lambda$GraphRequest$Companion$Ahr_fT5fWL98iw3CN_S5vFHrHzc;->f$0:Lcom/facebook/GraphRequest$GraphJSONArrayCallback;

    invoke-static {v0, p1}, Lcom/facebook/GraphRequest$Companion;->lambda$Ahr_fT5fWL98iw3CN_S5vFHrHzc(Lcom/facebook/GraphRequest$GraphJSONArrayCallback;Lcom/facebook/GraphResponse;)V

    return-void
.end method
