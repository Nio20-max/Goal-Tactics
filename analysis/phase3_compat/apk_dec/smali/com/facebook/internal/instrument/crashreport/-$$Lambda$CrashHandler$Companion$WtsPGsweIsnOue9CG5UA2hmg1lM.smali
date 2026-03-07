.class public final synthetic Lcom/facebook/internal/instrument/crashreport/-$$Lambda$CrashHandler$Companion$WtsPGsweIsnOue9CG5UA2hmg1lM;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final synthetic INSTANCE:Lcom/facebook/internal/instrument/crashreport/-$$Lambda$CrashHandler$Companion$WtsPGsweIsnOue9CG5UA2hmg1lM;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/internal/instrument/crashreport/-$$Lambda$CrashHandler$Companion$WtsPGsweIsnOue9CG5UA2hmg1lM;

    invoke-direct {v0}, Lcom/facebook/internal/instrument/crashreport/-$$Lambda$CrashHandler$Companion$WtsPGsweIsnOue9CG5UA2hmg1lM;-><init>()V

    sput-object v0, Lcom/facebook/internal/instrument/crashreport/-$$Lambda$CrashHandler$Companion$WtsPGsweIsnOue9CG5UA2hmg1lM;->INSTANCE:Lcom/facebook/internal/instrument/crashreport/-$$Lambda$CrashHandler$Companion$WtsPGsweIsnOue9CG5UA2hmg1lM;

    return-void
.end method

.method private synthetic constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/facebook/internal/instrument/InstrumentData;

    check-cast p2, Lcom/facebook/internal/instrument/InstrumentData;

    invoke-static {p1, p2}, Lcom/facebook/internal/instrument/crashreport/CrashHandler$Companion;->lambda$WtsPGsweIsnOue9CG5UA2hmg1lM(Lcom/facebook/internal/instrument/InstrumentData;Lcom/facebook/internal/instrument/InstrumentData;)I

    move-result p1

    return p1
.end method
