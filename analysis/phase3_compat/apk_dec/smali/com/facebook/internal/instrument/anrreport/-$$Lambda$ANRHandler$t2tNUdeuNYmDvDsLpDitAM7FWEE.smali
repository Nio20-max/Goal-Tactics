.class public final synthetic Lcom/facebook/internal/instrument/anrreport/-$$Lambda$ANRHandler$t2tNUdeuNYmDvDsLpDitAM7FWEE;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/Comparator;


# static fields
.field public static final synthetic INSTANCE:Lcom/facebook/internal/instrument/anrreport/-$$Lambda$ANRHandler$t2tNUdeuNYmDvDsLpDitAM7FWEE;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/internal/instrument/anrreport/-$$Lambda$ANRHandler$t2tNUdeuNYmDvDsLpDitAM7FWEE;

    invoke-direct {v0}, Lcom/facebook/internal/instrument/anrreport/-$$Lambda$ANRHandler$t2tNUdeuNYmDvDsLpDitAM7FWEE;-><init>()V

    sput-object v0, Lcom/facebook/internal/instrument/anrreport/-$$Lambda$ANRHandler$t2tNUdeuNYmDvDsLpDitAM7FWEE;->INSTANCE:Lcom/facebook/internal/instrument/anrreport/-$$Lambda$ANRHandler$t2tNUdeuNYmDvDsLpDitAM7FWEE;

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

    invoke-static {p1, p2}, Lcom/facebook/internal/instrument/anrreport/ANRHandler;->lambda$t2tNUdeuNYmDvDsLpDitAM7FWEE(Lcom/facebook/internal/instrument/InstrumentData;Lcom/facebook/internal/instrument/InstrumentData;)I

    move-result p1

    return p1
.end method
