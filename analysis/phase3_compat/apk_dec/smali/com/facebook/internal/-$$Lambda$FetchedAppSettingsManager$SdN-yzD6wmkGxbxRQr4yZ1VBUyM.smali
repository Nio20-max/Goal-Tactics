.class public final synthetic Lcom/facebook/internal/-$$Lambda$FetchedAppSettingsManager$SdN-yzD6wmkGxbxRQr4yZ1VBUyM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/facebook/internal/FetchedAppSettingsManager$FetchedAppSettingsCallback;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/internal/FetchedAppSettingsManager$FetchedAppSettingsCallback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/internal/-$$Lambda$FetchedAppSettingsManager$SdN-yzD6wmkGxbxRQr4yZ1VBUyM;->f$0:Lcom/facebook/internal/FetchedAppSettingsManager$FetchedAppSettingsCallback;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/facebook/internal/-$$Lambda$FetchedAppSettingsManager$SdN-yzD6wmkGxbxRQr4yZ1VBUyM;->f$0:Lcom/facebook/internal/FetchedAppSettingsManager$FetchedAppSettingsCallback;

    invoke-static {v0}, Lcom/facebook/internal/FetchedAppSettingsManager;->lambda$SdN-yzD6wmkGxbxRQr4yZ1VBUyM(Lcom/facebook/internal/FetchedAppSettingsManager$FetchedAppSettingsCallback;)V

    return-void
.end method
