.class public final synthetic Lcom/facebook/internal/-$$Lambda$FetchedAppGateKeepersManager$88hCiLqd34I9PIXLsFQQ5bjLs-Q;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/facebook/internal/FetchedAppGateKeepersManager$Callback;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/internal/FetchedAppGateKeepersManager$Callback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/internal/-$$Lambda$FetchedAppGateKeepersManager$88hCiLqd34I9PIXLsFQQ5bjLs-Q;->f$0:Lcom/facebook/internal/FetchedAppGateKeepersManager$Callback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/internal/-$$Lambda$FetchedAppGateKeepersManager$88hCiLqd34I9PIXLsFQQ5bjLs-Q;->f$0:Lcom/facebook/internal/FetchedAppGateKeepersManager$Callback;

    invoke-static {v0}, Lcom/facebook/internal/FetchedAppGateKeepersManager;->lambda$88hCiLqd34I9PIXLsFQQ5bjLs-Q(Lcom/facebook/internal/FetchedAppGateKeepersManager$Callback;)V

    return-void
.end method
