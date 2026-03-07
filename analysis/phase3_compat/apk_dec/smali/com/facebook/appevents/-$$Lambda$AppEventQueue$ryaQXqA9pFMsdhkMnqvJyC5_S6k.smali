.class public final synthetic Lcom/facebook/appevents/-$$Lambda$AppEventQueue$ryaQXqA9pFMsdhkMnqvJyC5_S6k;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/facebook/appevents/FlushReason;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/appevents/FlushReason;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/appevents/-$$Lambda$AppEventQueue$ryaQXqA9pFMsdhkMnqvJyC5_S6k;->f$0:Lcom/facebook/appevents/FlushReason;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/appevents/-$$Lambda$AppEventQueue$ryaQXqA9pFMsdhkMnqvJyC5_S6k;->f$0:Lcom/facebook/appevents/FlushReason;

    invoke-static {v0}, Lcom/facebook/appevents/AppEventQueue;->lambda$ryaQXqA9pFMsdhkMnqvJyC5_S6k(Lcom/facebook/appevents/FlushReason;)V

    return-void
.end method
