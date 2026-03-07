.class public final Lcom/helpshift/util/HSFormat;
.super Ljava/lang/Object;
.source "HSFormat.java"


# static fields
.field public static final alphaNumericCharacters:Ljava/lang/String; = "abcdefghijklmnopqrstuvwxyz0123456789"

.field public static final datePropertyTsFormat:Lcom/helpshift/util/HSSimpleDateFormat;

.field public static final deviceInfoTsFormat:Lcom/helpshift/util/HSSimpleDateFormat;

.field public static final errorLogReportingTimeFormat:Lcom/helpshift/util/HSSimpleDateFormat;

.field public static final timeStampAnonymousUserFormat:Lcom/helpshift/util/HSSimpleDateFormat;

.field public static final tsSecFormatter:Ljava/text/DecimalFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 9
    new-instance v0, Lcom/helpshift/util/HSSimpleDateFormat;

    .line 10
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const-string v2, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    invoke-direct {v0, v2, v1}, Lcom/helpshift/util/HSSimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/helpshift/util/HSFormat;->deviceInfoTsFormat:Lcom/helpshift/util/HSSimpleDateFormat;

    .line 12
    new-instance v0, Lcom/helpshift/util/HSSimpleDateFormat;

    .line 13
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const-string v3, "UTC"

    invoke-direct {v0, v2, v1, v3}, Lcom/helpshift/util/HSSimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;)V

    sput-object v0, Lcom/helpshift/util/HSFormat;->datePropertyTsFormat:Lcom/helpshift/util/HSSimpleDateFormat;

    .line 15
    new-instance v0, Lcom/helpshift/util/HSSimpleDateFormat;

    .line 16
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const-string v2, "yyyyMMddHHmmssSSS"

    invoke-direct {v0, v2, v1}, Lcom/helpshift/util/HSSimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/helpshift/util/HSFormat;->timeStampAnonymousUserFormat:Lcom/helpshift/util/HSSimpleDateFormat;

    .line 18
    new-instance v0, Ljava/text/DecimalFormat;

    new-instance v1, Ljava/text/DecimalFormatSymbols;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2}, Ljava/text/DecimalFormatSymbols;-><init>(Ljava/util/Locale;)V

    const-string v2, "0.000"

    invoke-direct {v0, v2, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;Ljava/text/DecimalFormatSymbols;)V

    sput-object v0, Lcom/helpshift/util/HSFormat;->tsSecFormatter:Ljava/text/DecimalFormat;

    .line 20
    new-instance v0, Lcom/helpshift/util/HSSimpleDateFormat;

    const-string v1, "dd/MM/yyyy HH:mm:ss"

    invoke-direct {v0, v1, v3}, Lcom/helpshift/util/HSSimpleDateFormat;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/helpshift/util/HSFormat;->errorLogReportingTimeFormat:Lcom/helpshift/util/HSSimpleDateFormat;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
