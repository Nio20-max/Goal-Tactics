.class public final synthetic Lcom/facebook/-$$Lambda$UserSettingsManager$aplsConLqG69UDRfnzXKr1cLNq4;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:J


# direct methods
.method public synthetic constructor <init>(J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/facebook/-$$Lambda$UserSettingsManager$aplsConLqG69UDRfnzXKr1cLNq4;->f$0:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-wide v0, p0, Lcom/facebook/-$$Lambda$UserSettingsManager$aplsConLqG69UDRfnzXKr1cLNq4;->f$0:J

    invoke-static {v0, v1}, Lcom/facebook/UserSettingsManager;->lambda$aplsConLqG69UDRfnzXKr1cLNq4(J)V

    return-void
.end method
