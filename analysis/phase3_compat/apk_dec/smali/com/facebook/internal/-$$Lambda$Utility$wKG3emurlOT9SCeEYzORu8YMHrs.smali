.class public final synthetic Lcom/facebook/internal/-$$Lambda$Utility$wKG3emurlOT9SCeEYzORu8YMHrs;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/io/FilenameFilter;


# static fields
.field public static final synthetic INSTANCE:Lcom/facebook/internal/-$$Lambda$Utility$wKG3emurlOT9SCeEYzORu8YMHrs;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/internal/-$$Lambda$Utility$wKG3emurlOT9SCeEYzORu8YMHrs;

    invoke-direct {v0}, Lcom/facebook/internal/-$$Lambda$Utility$wKG3emurlOT9SCeEYzORu8YMHrs;-><init>()V

    sput-object v0, Lcom/facebook/internal/-$$Lambda$Utility$wKG3emurlOT9SCeEYzORu8YMHrs;->INSTANCE:Lcom/facebook/internal/-$$Lambda$Utility$wKG3emurlOT9SCeEYzORu8YMHrs;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/io/File;Ljava/lang/String;)Z
    .locals 0

    invoke-static {p1, p2}, Lcom/facebook/internal/Utility;->lambda$wKG3emurlOT9SCeEYzORu8YMHrs(Ljava/io/File;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
