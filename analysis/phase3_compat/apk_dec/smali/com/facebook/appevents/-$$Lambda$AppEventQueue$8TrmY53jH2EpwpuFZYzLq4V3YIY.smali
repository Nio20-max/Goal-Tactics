.class public final synthetic Lcom/facebook/appevents/-$$Lambda$AppEventQueue$8TrmY53jH2EpwpuFZYzLq4V3YIY;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final synthetic INSTANCE:Lcom/facebook/appevents/-$$Lambda$AppEventQueue$8TrmY53jH2EpwpuFZYzLq4V3YIY;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/appevents/-$$Lambda$AppEventQueue$8TrmY53jH2EpwpuFZYzLq4V3YIY;

    invoke-direct {v0}, Lcom/facebook/appevents/-$$Lambda$AppEventQueue$8TrmY53jH2EpwpuFZYzLq4V3YIY;-><init>()V

    sput-object v0, Lcom/facebook/appevents/-$$Lambda$AppEventQueue$8TrmY53jH2EpwpuFZYzLq4V3YIY;->INSTANCE:Lcom/facebook/appevents/-$$Lambda$AppEventQueue$8TrmY53jH2EpwpuFZYzLq4V3YIY;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    invoke-static {}, Lcom/facebook/appevents/AppEventQueue;->lambda$8TrmY53jH2EpwpuFZYzLq4V3YIY()V

    return-void
.end method
