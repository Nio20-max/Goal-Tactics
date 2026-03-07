.class public final Lcom/appsflyer/internal/bw;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static AFInAppEventParameterName:I = 0x1

.field private static AFInAppEventType:[C

.field private static valueOf:I

.field private static values:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x40

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lcom/appsflyer/internal/bw;->AFInAppEventType:[C

    const-wide v0, -0x34771af445d16776L    # -7.630206472688437E55

    sput-wide v0, Lcom/appsflyer/internal/bw;->values:J

    return-void

    nop

    :array_0
    .array-data 2
        0x33s
        -0x6747s
        0x3123s
        -0x3653s
        0x621bs
        -0x57cs
        -0x6cf5s
        0x2bf0s
        -0x3b9ds
        0x5ce3s
        -0xaads
        -0x7229s
        0x264as
        -0x40cas
        0x57b8s
        -0xfdcs
        -0x776es
        0x211cs
        -0x4680s
        0x520bs
        -0x1506s
        -0x7c95s
        0x1be8s
        -0x4ba2s
        0x4cc4s
        -0x1ab6s
        0x7e30s
        0x16cas
        -0x50d2s
        0x4791s
        -0x1fe7s
        0x7887s
        0x1176s
        -0x5604s
        0x4261s
        -0x2516s
        0x735es
        0xbb3s
        -0x5bb7s
        0x3d31s
        -0x2a5as
        0x6e5fs
        0x691s
        -0x6091s
        0x378fs
        -0x2f8ds
        0x68ffs
        0x162s
        -0x6629s
        0x325es
        -0x3539s
        0x6349s
        -0x3c1s
        -0x6b5bs
        0x2d2es
        -0x3a69s
        0x5e07s
        -0x905s
        -0x708as
        0x27fbs
        -0x3f94s
        0x58d1s
        -0xea2s
        -0x7649s
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static AFInAppEventType(Lcom/appsflyer/internal/ao;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/internal/ay;
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p1, :cond_1

    .line 64
    new-instance p1, Lcom/appsflyer/internal/ay;

    .line 1051
    iget-object p0, p0, Lcom/appsflyer/internal/ao;->AFKeystoreWrapper:Lcom/appsflyer/internal/cs;

    .line 64
    sget-object p2, Lcom/appsflyer/internal/cs;->valueOf:Lcom/appsflyer/internal/cs;

    if-ne p0, p2, :cond_0

    const/4 v0, 0x1

    :cond_0
    sget-object p0, Lcom/appsflyer/internal/cw;->valueOf:Lcom/appsflyer/internal/cw;

    invoke-direct {p1, v0, p0}, Lcom/appsflyer/internal/ay;-><init>(ZLcom/appsflyer/internal/cw;)V

    return-object p1

    .line 68
    :cond_1
    invoke-static {}, Landroid/view/KeyEvent;->getModifierMetaStateMask()I

    move-result v2

    int-to-byte v2, v2

    add-int/2addr v2, v1

    int-to-char v1, v2

    invoke-static {v0}, Landroid/util/TypedValue;->complexToFloat(I)F

    move-result v0

    const/4 v2, 0x0

    cmpl-float v0, v0, v2

    add-int/lit8 v0, v0, 0x40

    const-wide/16 v2, 0x0

    invoke-static {v2, v3}, Landroid/widget/ExpandableListView;->getPackedPositionType(J)I

    move-result v2

    invoke-static {v1, v0, v2}, Lcom/appsflyer/internal/bw;->values(CII)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    .line 2051
    iget-object v1, p0, Lcom/appsflyer/internal/ao;->AFKeystoreWrapper:Lcom/appsflyer/internal/cs;

    .line 70
    sget-object v2, Lcom/appsflyer/internal/cs;->values:Lcom/appsflyer/internal/cs;

    if-ne v1, v2, :cond_2

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->reverse()Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_2
    const-string p2, ""

    move-object p3, v0

    .line 3046
    :goto_0
    iget-object p0, p0, Lcom/appsflyer/internal/ao;->AFInAppEventParameterName:Ljava/lang/String;

    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->reverse()Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v0, "android"

    const-string/jumbo v1, "v1"

    .line 76
    invoke-static {p3, p0, v0, v1, p2}, Lcom/appsflyer/internal/bw;->valueOf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 77
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    .line 78
    new-instance p1, Lcom/appsflyer/internal/ay;

    if-eqz p0, :cond_3

    sget-object p2, Lcom/appsflyer/internal/cw;->AFKeystoreWrapper:Lcom/appsflyer/internal/cw;

    goto :goto_1

    :cond_3
    sget-object p2, Lcom/appsflyer/internal/cw;->values:Lcom/appsflyer/internal/cw;

    :goto_1
    invoke-direct {p1, p0, p2}, Lcom/appsflyer/internal/ay;-><init>(ZLcom/appsflyer/internal/cw;)V

    return-object p1
.end method

.method private static valueOf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 106
    sget v0, Lcom/appsflyer/internal/bw;->AFInAppEventParameterName:I

    add-int/lit8 v0, v0, 0x5d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/bw;->valueOf:I

    const/4 v1, 0x2

    rem-int/2addr v0, v1

    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v0, v2

    const/4 p1, 0x1

    aput-object p2, v0, p1

    aput-object p3, v0, v1

    const/4 p2, 0x3

    aput-object p4, v0, p2

    const/4 p2, 0x4

    const-string p3, ""

    aput-object p3, v0, p2

    .line 96
    invoke-static {v0}, Lcom/appsflyer/internal/ag;->AFInAppEventParameterName([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 100
    invoke-static {p2, p0}, Lcom/appsflyer/internal/ag;->valueOf(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 103
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p2

    const/16 p3, 0xc

    if-ge p2, p3, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    :goto_0
    if-eq p2, p1, :cond_1

    .line 106
    sget p1, Lcom/appsflyer/internal/bw;->valueOf:I

    add-int/lit8 p1, p1, 0x7b

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/bw;->AFInAppEventParameterName:I

    rem-int/2addr p1, v1

    return-object p0

    :cond_1
    invoke-virtual {p0, v2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static values(CII)Ljava/lang/String;
    .locals 9

    .line 3099
    sget-object v0, Lcom/appsflyer/internal/dh;->AFInAppEventParameterName:Ljava/lang/Object;

    monitor-enter v0

    .line 3102
    :try_start_0
    new-array v1, p1, [C

    const/4 v2, 0x0

    .line 3105
    sput v2, Lcom/appsflyer/internal/dh;->values:I

    :goto_0
    sget v2, Lcom/appsflyer/internal/dh;->values:I

    if-ge v2, p1, :cond_0

    .line 3107
    sget v2, Lcom/appsflyer/internal/dh;->values:I

    sget-object v3, Lcom/appsflyer/internal/bw;->AFInAppEventType:[C

    sget v4, Lcom/appsflyer/internal/dh;->values:I

    add-int/2addr v4, p2

    aget-char v3, v3, v4

    int-to-long v3, v3

    sget v5, Lcom/appsflyer/internal/dh;->values:I

    int-to-long v5, v5

    sget-wide v7, Lcom/appsflyer/internal/bw;->values:J

    mul-long v5, v5, v7

    xor-long/2addr v3, v5

    int-to-long v5, p0

    xor-long/2addr v3, v5

    long-to-int v4, v3

    int-to-char v3, v4

    aput-char v3, v1, v2

    .line 3105
    sget v2, Lcom/appsflyer/internal/dh;->values:I

    add-int/lit8 v2, v2, 0x1

    sput v2, Lcom/appsflyer/internal/dh;->values:I

    goto :goto_0

    .line 3113
    :cond_0
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v1}, Ljava/lang/String;-><init>([C)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 3114
    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public final AFKeystoreWrapper(Lcom/appsflyer/internal/ao;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/internal/ay;
    .locals 5

    .line 47
    sget v0, Lcom/appsflyer/internal/bw;->AFInAppEventParameterName:I

    add-int/lit8 v0, v0, 0x37

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/bw;->valueOf:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v0, 0x0

    const/4 v2, 0x1

    if-eqz p1, :cond_0

    const/4 v3, 0x0

    goto :goto_0

    :cond_0
    const/4 v3, 0x1

    :goto_0
    if-eq v3, v2, :cond_5

    add-int/lit8 v3, v1, 0x1b

    rem-int/lit16 v4, v3, 0x80

    sput v4, Lcom/appsflyer/internal/bw;->AFInAppEventParameterName:I

    rem-int/lit8 v3, v3, 0x2

    if-eqz p3, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    if-eq v3, v2, :cond_2

    goto :goto_3

    :cond_2
    const/16 v3, 0x59

    if-eqz p4, :cond_3

    const/16 v4, 0x59

    goto :goto_2

    :cond_3
    const/16 v4, 0x25

    :goto_2
    if-eq v4, v3, :cond_4

    goto :goto_3

    :cond_4
    add-int/2addr v1, v2

    rem-int/lit16 v3, v1, 0x80

    sput v3, Lcom/appsflyer/internal/bw;->AFInAppEventParameterName:I

    rem-int/lit8 v1, v1, 0x2

    goto :goto_4

    :cond_5
    :goto_3
    const/4 v2, 0x0

    :goto_4
    if-nez v2, :cond_6

    .line 45
    new-instance p1, Lcom/appsflyer/internal/ay;

    sget-object p2, Lcom/appsflyer/internal/cw;->AFInAppEventParameterName:Lcom/appsflyer/internal/cw;

    invoke-direct {p1, v0, p2}, Lcom/appsflyer/internal/ay;-><init>(ZLcom/appsflyer/internal/cw;)V

    return-object p1

    .line 47
    :cond_6
    invoke-static {p1, p2, p3, p4}, Lcom/appsflyer/internal/bw;->AFInAppEventType(Lcom/appsflyer/internal/ao;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/internal/ay;

    move-result-object p1

    return-object p1
.end method
