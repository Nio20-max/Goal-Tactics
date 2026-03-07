.class public Lcom/ironsource/sdk/constants/Constants$ConnectivityEvent;
.super Ljava/lang/Object;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ironsource/sdk/constants/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ConnectivityEvent"
.end annotation


# static fields
.field public static final CONNECTED:Ljava/lang/String; = "connected"

.field public static final CONNECTIVITY_EVENT:Ljava/lang/String; = "connectivityEvent"

.field public static final DISCONNECTED:Ljava/lang/String; = "disconnected"

.field public static final STATUS_CHANGED:Ljava/lang/String; = "statusChanged"


# instance fields
.field final synthetic this$0:Lcom/ironsource/sdk/constants/Constants;


# direct methods
.method public constructor <init>(Lcom/ironsource/sdk/constants/Constants;)V
    .locals 0

    .line 450
    iput-object p1, p0, Lcom/ironsource/sdk/constants/Constants$ConnectivityEvent;->this$0:Lcom/ironsource/sdk/constants/Constants;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
