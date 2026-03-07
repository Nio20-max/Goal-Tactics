.class public final synthetic Lcom/facebook/appevents/aam/-$$Lambda$MetadataViewObserver$tUXpbge9JBjfGl4o6B-uBZ3t8go;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/view/View;

.field public final synthetic f$1:Lcom/facebook/appevents/aam/MetadataViewObserver;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Lcom/facebook/appevents/aam/MetadataViewObserver;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/appevents/aam/-$$Lambda$MetadataViewObserver$tUXpbge9JBjfGl4o6B-uBZ3t8go;->f$0:Landroid/view/View;

    iput-object p2, p0, Lcom/facebook/appevents/aam/-$$Lambda$MetadataViewObserver$tUXpbge9JBjfGl4o6B-uBZ3t8go;->f$1:Lcom/facebook/appevents/aam/MetadataViewObserver;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/facebook/appevents/aam/-$$Lambda$MetadataViewObserver$tUXpbge9JBjfGl4o6B-uBZ3t8go;->f$0:Landroid/view/View;

    iget-object v1, p0, Lcom/facebook/appevents/aam/-$$Lambda$MetadataViewObserver$tUXpbge9JBjfGl4o6B-uBZ3t8go;->f$1:Lcom/facebook/appevents/aam/MetadataViewObserver;

    invoke-static {v0, v1}, Lcom/facebook/appevents/aam/MetadataViewObserver;->lambda$tUXpbge9JBjfGl4o6B-uBZ3t8go(Landroid/view/View;Lcom/facebook/appevents/aam/MetadataViewObserver;)V

    return-void
.end method
