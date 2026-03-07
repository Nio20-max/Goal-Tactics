.class public final synthetic Lcom/facebook/internal/instrument/-$$Lambda$InstrumentUtility$jNZ-2rtK5Fs1aDOyNVtkYhD1qRQ;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/io/FilenameFilter;


# static fields
.field public static final synthetic INSTANCE:Lcom/facebook/internal/instrument/-$$Lambda$InstrumentUtility$jNZ-2rtK5Fs1aDOyNVtkYhD1qRQ;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/internal/instrument/-$$Lambda$InstrumentUtility$jNZ-2rtK5Fs1aDOyNVtkYhD1qRQ;

    invoke-direct {v0}, Lcom/facebook/internal/instrument/-$$Lambda$InstrumentUtility$jNZ-2rtK5Fs1aDOyNVtkYhD1qRQ;-><init>()V

    sput-object v0, Lcom/facebook/internal/instrument/-$$Lambda$InstrumentUtility$jNZ-2rtK5Fs1aDOyNVtkYhD1qRQ;->INSTANCE:Lcom/facebook/internal/instrument/-$$Lambda$InstrumentUtility$jNZ-2rtK5Fs1aDOyNVtkYhD1qRQ;

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

    invoke-static {p1, p2}, Lcom/facebook/internal/instrument/InstrumentUtility;->lambda$jNZ-2rtK5Fs1aDOyNVtkYhD1qRQ(Ljava/io/File;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
