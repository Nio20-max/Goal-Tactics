.class public final Lcom/appsflyer/internal/d;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/d$d;
    }
.end annotation


# static fields
.field private static AFInAppEventParameterName:I = 0x270a1027

.field private static AFInAppEventType:I = 0x2e

.field private static AFKeystoreWrapper:J = 0x22b4314784668a6cL

.field private static AFLogger$LogLevel:I = 0x1

.field private static AppsFlyer2dXConversionCallback:[S = null

.field private static getLevel:I = 0x0

.field private static valueOf:[B = null

.field private static values:I = -0x6a9cbea1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x77

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/appsflyer/internal/d;->valueOf:[B

    return-void

    :array_0
    .array-data 1
        -0x1ct
        0x52t
        -0x4bt
        -0x4dt
        -0x4bt
        -0x70t
        -0x4bt
        0x5ct
        0x4et
        -0x4bt
        -0x7et
        0x55t
        -0x4bt
        -0x6bt
        0x1t
        -0x4bt
        -0x4bt
        -0x4bt
        -0x17t
        0x47t
        -0x48t
        0x41t
        0x4dt
        0x56t
        0x61t
        -0x73t
        -0x49t
        0x55t
        -0x52t
        0x57t
        -0x4at
        0x55t
        -0x43t
        0x7et
        -0x72t
        -0x41t
        -0x42t
        -0x47t
        0x4at
        -0x4et
        0x49t
        -0x1ft
        -0x59t
        0x4dt
        0x77t
        -0x16t
        0x5ft
        -0x59t
        0x10t
        -0x66t
        -0x55t
        -0x56t
        -0x53t
        0x5et
        -0x5at
        0x5dt
        -0x2ct
        0x7at
        -0x20t
        0x2ft
        0x23t
        -0x2et
        0x25t
        -0x21t
        0x60t
        -0x67t
        0x20t
        0x1dt
        -0x15t
        -0x33t
        0x33t
        -0x2ft
        -0x28t
        0x5at
        -0x5et
        -0x5bt
        0x59t
        -0x6dt
        -0x5t
        -0x34t
        -0x1at
        -0x2bt
        0x2ct
        -0x21t
        0x2et
        0x21t
        0x28t
        -0x3ft
        0x39t
        0x6ft
        -0x6et
        -0x22t
        0x21t
        -0x28t
        0x7dt
        -0x6et
        -0x22t
        0x39t
        -0x25t
        0x7at
        -0x6ft
        -0x29t
        0x2ft
        0x28t
        -0x2ct
        0x69t
        -0x7at
        0x25t
        -0x2ct
        0x6dt
        -0x65t
        -0x2ft
        0x7et
        -0x6at
        -0x2bt
        -0x2dt
        0x29t
        0x22t
        0x31t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static AFInAppEventType(Landroid/content/Context;)Ljava/lang/String;
    .locals 5

    .line 283
    sget v0, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 v0, v0, 0x15

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 v3, 0x0

    if-eq v0, v1, :cond_1

    .line 277
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 278
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    :goto_1
    invoke-virtual {v0, p0, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    .line 279
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    goto :goto_2

    .line 277
    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 278
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 279
    :goto_2
    sget v0, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    add-int/lit8 v0, v0, 0x33

    rem-int/lit16 v4, v0, 0x80

    sput v4, Lcom/appsflyer/internal/d;->getLevel:I

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_2

    goto :goto_3

    :cond_2
    const/4 v1, 0x0

    :goto_3
    if-eqz v1, :cond_3

    .line 283
    :try_start_1
    invoke-super {v3}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 279
    throw p0

    :cond_3
    return-object p0

    :catch_0
    return-object v3
.end method

.method private static AFInAppEventType(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 190
    sget v0, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 v0, v0, 0x3b

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    const/4 v1, 0x2

    rem-int/2addr v0, v1

    .line 189
    invoke-static {p0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result p0

    const/16 v0, 0x10

    .line 190
    invoke-static {p0, v0}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object p0

    sget v0, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 v0, v0, 0x5

    rem-int/lit16 v2, v0, 0x80

    sput v2, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/2addr v0, v1

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    const/16 v0, 0x1f

    :try_start_0
    div-int/2addr v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    throw p0

    :cond_1
    return-object p0
.end method

.method private static AFInAppEventType(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 1

    .line 177
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    invoke-static {p1}, Lcom/appsflyer/internal/d;->AFInAppEventType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p0

    invoke-virtual {v0, p2, p0}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 179
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    sget p1, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 p1, p1, 0x7b

    rem-int/lit16 p2, p1, 0x80

    sput p2, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/lit8 p1, p1, 0x2

    return-object p0
.end method

.method private static AFKeystoreWrapper(IBISI)Ljava/lang/String;
    .locals 7

    .line 1200
    sget-object v0, Lcom/appsflyer/internal/du;->getLevel:Ljava/lang/Object;

    monitor-enter v0

    .line 1202
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1205
    sget v2, Lcom/appsflyer/internal/d;->AFInAppEventType:I

    add-int/2addr p0, v2

    const/4 v3, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne p0, v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    if-eqz v3, :cond_2

    .line 1209
    sget-object p0, Lcom/appsflyer/internal/d;->valueOf:[B

    if-eqz p0, :cond_1

    .line 1211
    sget v6, Lcom/appsflyer/internal/d;->AFInAppEventParameterName:I

    add-int/2addr v6, p4

    aget-byte p0, p0, v6

    add-int/2addr p0, v2

    int-to-byte p0, p0

    goto :goto_1

    .line 1217
    :cond_1
    sget-object p0, Lcom/appsflyer/internal/d;->AppsFlyer2dXConversionCallback:[S

    sget v6, Lcom/appsflyer/internal/d;->AFInAppEventParameterName:I

    add-int/2addr v6, p4

    aget-short p0, p0, v6

    add-int/2addr p0, v2

    int-to-short p0, p0

    :cond_2
    :goto_1
    if-lez p0, :cond_5

    add-int/2addr p4, p0

    add-int/lit8 p4, p4, -0x2

    .line 1226
    sget v2, Lcom/appsflyer/internal/d;->AFInAppEventParameterName:I

    add-int/2addr p4, v2

    if-eqz v3, :cond_3

    const/4 v4, 0x1

    :cond_3
    add-int/2addr p4, v4

    sput p4, Lcom/appsflyer/internal/du;->AFKeystoreWrapper:I

    .line 1227
    sput-byte p1, Lcom/appsflyer/internal/du;->AFInAppEventParameterName:B

    .line 1230
    sget p1, Lcom/appsflyer/internal/d;->values:I

    add-int/2addr p2, p1

    int-to-char p1, p2

    sput-char p1, Lcom/appsflyer/internal/du;->valueOf:C

    .line 1231
    sget-char p1, Lcom/appsflyer/internal/du;->valueOf:C

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1234
    sget-char p1, Lcom/appsflyer/internal/du;->valueOf:C

    sput-char p1, Lcom/appsflyer/internal/du;->AFInAppEventType:C

    .line 1235
    sput v5, Lcom/appsflyer/internal/du;->values:I

    :goto_2
    sget p1, Lcom/appsflyer/internal/du;->values:I

    if-ge p1, p0, :cond_5

    .line 1238
    sget-object p1, Lcom/appsflyer/internal/d;->valueOf:[B

    if-eqz p1, :cond_4

    .line 1240
    sget p2, Lcom/appsflyer/internal/du;->AFKeystoreWrapper:I

    add-int/lit8 p4, p2, -0x1

    sput p4, Lcom/appsflyer/internal/du;->AFKeystoreWrapper:I

    aget-byte p1, p1, p2

    .line 1241
    sget-char p2, Lcom/appsflyer/internal/du;->AFInAppEventType:C

    add-int/2addr p1, p3

    int-to-byte p1, p1

    sget-byte p4, Lcom/appsflyer/internal/du;->AFInAppEventParameterName:B

    xor-int/2addr p1, p4

    add-int/2addr p2, p1

    int-to-char p1, p2

    sput-char p1, Lcom/appsflyer/internal/du;->valueOf:C

    goto :goto_3

    .line 1245
    :cond_4
    sget-object p1, Lcom/appsflyer/internal/d;->AppsFlyer2dXConversionCallback:[S

    sget p2, Lcom/appsflyer/internal/du;->AFKeystoreWrapper:I

    add-int/lit8 p4, p2, -0x1

    sput p4, Lcom/appsflyer/internal/du;->AFKeystoreWrapper:I

    aget-short p1, p1, p2

    .line 1246
    sget-char p2, Lcom/appsflyer/internal/du;->AFInAppEventType:C

    add-int/2addr p1, p3

    int-to-short p1, p1

    sget-byte p4, Lcom/appsflyer/internal/du;->AFInAppEventParameterName:B

    xor-int/2addr p1, p4

    add-int/2addr p2, p1

    int-to-char p1, p2

    sput-char p1, Lcom/appsflyer/internal/du;->valueOf:C

    .line 1248
    :goto_3
    sget-char p1, Lcom/appsflyer/internal/du;->valueOf:C

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1249
    sget-char p1, Lcom/appsflyer/internal/du;->valueOf:C

    sput-char p1, Lcom/appsflyer/internal/du;->AFInAppEventType:C

    .line 1235
    sget p1, Lcom/appsflyer/internal/du;->values:I

    add-int/2addr p1, v5

    sput p1, Lcom/appsflyer/internal/du;->values:I

    goto :goto_2

    .line 1253
    :cond_5
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 1254
    monitor-exit v0

    throw p0
.end method

.method static AFKeystoreWrapper(Landroid/content/Context;J)Ljava/lang/String;
    .locals 12

    const-string v0, ""

    .line 73
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    .line 78
    invoke-static {v4}, Landroid/graphics/Color;->red(I)I

    move-result v5

    const-string/jumbo v6, "\uad71\u9fd0\uad10\u15d2\uedfd\uf941\u7281\uedb7\u84ae\u2ba5\ud311\u256d\ufe65\u4279\u85a9\u1f76\ud011\u98c4\u7c7a\uf18d\u0bc8\uaed2\u5631\uabd6\u7d6d\uc569\u08c5\u826b\u573e\u1b32\ue37c\u749e\u8ec0\u3182\ud534\u2ec4\ue094\u484e"

    invoke-static {v6, v5}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/appsflyer/internal/d;->valueOf(Ljava/lang/String;)Z

    move-result v5

    const/16 v6, 0x4c

    if-eqz v5, :cond_0

    const/16 v5, 0x4c

    goto :goto_0

    :cond_0
    const/16 v5, 0x5a

    :goto_0
    const/4 v7, 0x1

    if-eq v5, v6, :cond_1

    invoke-static {}, Landroid/view/ViewConfiguration;->getWindowTouchSlop()I

    move-result v5

    shr-int/lit8 v5, v5, 0x8

    const-string/jumbo v6, "\u55de\u78f8\u55ee\ub963\ue11d"

    invoke-static {v6, v5}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    .line 104
    :cond_1
    sget v5, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    add-int/lit8 v5, v5, 0x65

    rem-int/lit16 v6, v5, 0x80

    sput v6, Lcom/appsflyer/internal/d;->getLevel:I

    rem-int/lit8 v5, v5, 0x2

    if-eqz v5, :cond_2

    const/4 v5, 0x1

    goto :goto_1

    :cond_2
    const/4 v5, 0x0

    :goto_1
    const-string/jumbo v6, "\u81cf\u44d7\u81fe\u1096\uea64"

    if-eq v5, v7, :cond_3

    .line 78
    invoke-static {v4, v4}, Landroid/view/View;->getDefaultSize(II)I

    move-result v5

    invoke-static {v6, v5}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v5

    goto :goto_2

    .line 104
    :cond_3
    invoke-static {v4, v7}, Landroid/view/View;->getDefaultSize(II)I

    move-result v5

    invoke-static {v6, v5}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v5

    :goto_2
    sget v6, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    add-int/lit8 v6, v6, 0x3f

    rem-int/lit16 v8, v6, 0x80

    sput v8, Lcom/appsflyer/internal/d;->getLevel:I

    rem-int/lit8 v6, v6, 0x2

    .line 78
    :goto_3
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    invoke-static {p0, v2}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Landroid/content/Context;Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v5, p0, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    .line 86
    iget-wide v5, p0, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    .line 88
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result p0

    shr-int/lit8 p0, p0, 0x16

    add-int/lit8 p0, p0, -0x2f

    invoke-static {v4}, Landroid/util/TypedValue;->complexToFloat(I)F

    move-result v8

    const/4 v9, 0x0

    cmpl-float v8, v8, v9

    rsub-int/lit8 v8, v8, -0x4b

    int-to-byte v8, v8

    const v9, 0x6a9cbf1a

    invoke-static {v4, v4}, Landroid/view/View;->resolveSize(II)I

    move-result v10

    sub-int/2addr v9, v10

    const/16 v10, 0x30

    invoke-static {v0, v10}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;C)I

    move-result v10

    add-int/2addr v10, v7

    int-to-short v7, v10

    const v10, -0x270a1027

    invoke-static {v4, v4}, Landroid/view/KeyEvent;->getDeadChar(II)I

    move-result v11

    add-int/2addr v11, v10

    invoke-static {p0, v8, v9, v7, v11}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(IBISI)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p0

    .line 1020
    new-instance v7, Ljava/text/SimpleDateFormat;

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v7, p0, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 88
    new-instance p0, Ljava/util/Date;

    invoke-direct {p0, v5, v6}, Ljava/util/Date;-><init>(J)V

    .line 89
    invoke-virtual {v7, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    .line 88
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 104
    sget p0, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    add-int/lit8 p0, p0, 0x65

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/d;->getLevel:I

    rem-int/lit8 p0, p0, 0x2

    .line 96
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 99
    invoke-static {v3}, Lcom/appsflyer/internal/d;->valueOf(Ljava/lang/StringBuilder;)V

    .line 102
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/internal/d;->values(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x11

    invoke-static {p0, v0, v1}, Lcom/appsflyer/internal/d;->AFInAppEventType(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    .line 103
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x1b

    invoke-static {p0, v0, v1}, Lcom/appsflyer/internal/d;->AFInAppEventType(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    .line 104
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/appsflyer/internal/d;->valueOf(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 92
    :catch_0
    invoke-static {v0, v0, v4}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)I

    move-result p0

    const-string/jumbo p1, "\u2cbe\u5028\u2cdc\uda25\u81a0\u951a\ufcfb\u63da\u056f\ue451\ubf18\uab1b\u7fe7\u8d80\ue9ad\u914d\u51cf\u5736\u1071\u7fbd\u8a4a\u6162\u3a0c\u25bb\ufcfa\u0a91\u64dc\u0c5e\ud6fa\ud49d\u8f69\ufad8\u0f5c\ufe24\ub939\ua0ff"

    invoke-static {p1, p0}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static AFKeystoreWrapper(Landroid/content/Context;Ljava/lang/StringBuilder;)Ljava/lang/String;
    .locals 9

    .line 294
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 297
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 298
    invoke-static {v1}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 299
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollBarSize()I

    move-result v3

    shr-int/lit8 v3, v3, 0x8

    const-string/jumbo v4, "\u81cf\u44d7\u81fe\u1096\uea64"

    invoke-static {v4, v3}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    invoke-static {p0}, Lcom/appsflyer/internal/d;->values(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x39

    if-nez v2, :cond_0

    const/16 v2, 0x39

    goto :goto_0

    :cond_0
    const/4 v2, 0x6

    :goto_0
    const-string/jumbo v5, "\u55de\u78f8\u55ee\ub963\ue11d"

    if-eq v2, v3, :cond_1

    const/16 v2, 0x30

    .line 308
    invoke-static {v2}, Landroid/text/AndroidCharacter;->getMirror(C)C

    move-result v2

    add-int/lit8 v2, v2, -0x30

    invoke-static {v4, v2}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 305
    :cond_1
    invoke-static {}, Landroid/view/ViewConfiguration;->getZoomControlsTimeout()J

    move-result-wide v2

    const-wide/16 v6, 0x0

    cmp-long v8, v2, v6

    add-int/lit8 v8, v8, -0x1

    invoke-static {v5, v8}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    sget v2, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 v2, v2, 0x2b

    rem-int/lit16 v3, v2, 0x80

    sput v3, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/lit8 v2, v2, 0x2

    .line 313
    :goto_1
    invoke-static {p0}, Lcom/appsflyer/internal/d;->AFInAppEventType(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez p0, :cond_2

    const/4 v6, 0x0

    goto :goto_2

    :cond_2
    const/4 v6, 0x1

    :goto_2
    if-eq v6, v2, :cond_3

    .line 315
    invoke-static {v3}, Landroid/util/TypedValue;->complexToFloat(I)F

    move-result p0

    const/4 v2, 0x0

    cmpl-float p0, p0, v2

    invoke-static {v5, p0}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 318
    :cond_3
    invoke-static {v3, v3}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v1

    invoke-static {v4, v1}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    sget p0, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    add-int/lit8 p0, p0, 0x4b

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/d;->getLevel:I

    rem-int/lit8 p0, p0, 0x2

    .line 323
    :goto_3
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static AFKeystoreWrapper(Ljava/lang/String;)Ljava/lang/String;
    .locals 14

    .line 245
    sget v0, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 v0, v0, 0x67

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/lit8 v0, v0, 0x2

    const-string/jumbo v1, "\u5747\u5204\u5769\u73a8\u05e1"

    if-nez v0, :cond_0

    .line 226
    invoke-static {}, Landroid/view/ViewConfiguration;->getMaximumDrawingCacheSize()I

    move-result v0

    shl-int/lit8 v0, v0, 0x17

    invoke-static {v1, v0}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/view/ViewConfiguration;->getMaximumDrawingCacheSize()I

    move-result v0

    shr-int/lit8 v0, v0, 0x18

    invoke-static {v1, v0}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    :goto_0
    return-object p0

    .line 230
    :cond_1
    invoke-static {}, Landroid/view/ViewConfiguration;->getZoomControlsTimeout()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    const/4 v0, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    cmp-long v8, v2, v4

    rsub-int/lit8 v2, v8, -0x2e

    invoke-static {v7, v7, v7, v7}, Landroid/graphics/Color;->argb(IIII)I

    move-result v3

    add-int/lit8 v3, v3, -0x58

    int-to-byte v3, v3

    const v8, 0x6a9cbefe

    invoke-static {v7}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    move-result v9

    add-int/2addr v9, v8

    invoke-static {}, Landroid/view/ViewConfiguration;->getMaximumDrawingCacheSize()I

    move-result v8

    shr-int/lit8 v8, v8, 0x18

    int-to-short v8, v8

    const v10, -0x270a0fef

    invoke-static {v7}, Landroid/widget/ExpandableListView;->getPackedPositionForGroup(I)J

    move-result-wide v11

    cmp-long v13, v11, v4

    add-int/2addr v13, v10

    invoke-static {v2, v3, v9, v8, v13}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(IBISI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 231
    array-length v2, p0

    .line 232
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sub-int/2addr v2, v6

    .line 235
    aget-object v4, p0, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v7, v0, v0}, Landroid/util/TypedValue;->complexToFraction(IFF)F

    move-result v4

    cmpl-float v0, v4, v0

    invoke-static {v1, v0}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    sget v0, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 v0, v0, 0x69

    rem-int/lit16 v4, v0, 0x80

    sput v4, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v0, 0x1

    :goto_1
    const/16 v4, 0x27

    const/16 v5, 0x30

    if-ge v0, v2, :cond_2

    const/16 v8, 0x27

    goto :goto_2

    :cond_2
    const/16 v8, 0x30

    :goto_2
    if-eq v8, v4, :cond_3

    .line 243
    aget-object p0, p0, v7

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 226
    :cond_3
    sget v4, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 v4, v4, 0x77

    rem-int/lit16 v8, v4, 0x80

    sput v8, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/lit8 v4, v4, 0x2

    const-string v8, ""

    if-nez v4, :cond_4

    .line 239
    aget-object v4, p0, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v4, 0x37

    invoke-static {v8, v4, v7, v6}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;CII)I

    move-result v4

    div-int v4, v7, v4

    invoke-static {v1, v4}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x4f

    goto :goto_1

    :cond_4
    aget-object v4, p0, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v8, v5, v7, v7}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;CII)I

    move-result v4

    add-int/2addr v4, v6

    invoke-static {v1, v4}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private static AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;
    .locals 8

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    :cond_0
    check-cast p0, [C

    .line 1073
    sget-object v0, Lcom/appsflyer/internal/dl;->AFInAppEventParameterName:Ljava/lang/Object;

    monitor-enter v0

    .line 1076
    :try_start_0
    sget-wide v1, Lcom/appsflyer/internal/d;->AFKeystoreWrapper:J

    invoke-static {v1, v2, p0, p1}, Lcom/appsflyer/internal/dl;->AFInAppEventType(J[CI)[C

    move-result-object p0

    const/4 p1, 0x4

    .line 1081
    sput p1, Lcom/appsflyer/internal/dl;->AFKeystoreWrapper:I

    :goto_0
    sget v1, Lcom/appsflyer/internal/dl;->AFKeystoreWrapper:I

    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 1083
    sget v1, Lcom/appsflyer/internal/dl;->AFKeystoreWrapper:I

    sub-int/2addr v1, p1

    sput v1, Lcom/appsflyer/internal/dl;->values:I

    .line 1084
    sget v1, Lcom/appsflyer/internal/dl;->AFKeystoreWrapper:I

    sget v2, Lcom/appsflyer/internal/dl;->AFKeystoreWrapper:I

    aget-char v2, p0, v2

    sget v3, Lcom/appsflyer/internal/dl;->AFKeystoreWrapper:I

    rem-int/2addr v3, p1

    aget-char v3, p0, v3

    xor-int/2addr v2, v3

    int-to-long v2, v2

    sget v4, Lcom/appsflyer/internal/dl;->values:I

    int-to-long v4, v4

    sget-wide v6, Lcom/appsflyer/internal/d;->AFKeystoreWrapper:J

    mul-long v4, v4, v6

    xor-long/2addr v2, v4

    long-to-int v3, v2

    int-to-char v2, v3

    aput-char v2, p0, v1

    .line 1081
    sget v1, Lcom/appsflyer/internal/dl;->AFKeystoreWrapper:I

    add-int/lit8 v1, v1, 0x1

    sput v1, Lcom/appsflyer/internal/dl;->AFKeystoreWrapper:I

    goto :goto_0

    .line 1088
    :cond_1
    new-instance v1, Ljava/lang/String;

    array-length v2, p0

    sub-int/2addr v2, p1

    invoke-direct {v1, p0, p1, v2}, Ljava/lang/String;-><init>([CII)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v1

    :catchall_0
    move-exception p0

    .line 1089
    monitor-exit v0

    throw p0
.end method

.method private static valueOf(Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/String;
    .locals 8

    .line 152
    sget v0, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 v0, v0, 0x27

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p0, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const-wide/16 v3, 0x0

    if-eqz v2, :cond_7

    if-eqz p1, :cond_7

    .line 116
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v5, 0x20

    if-ne v2, v5, :cond_7

    .line 117
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    .line 152
    sget p1, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    add-int/lit8 p1, p1, 0x9

    rem-int/lit16 v5, p1, 0x80

    sput v5, Lcom/appsflyer/internal/d;->getLevel:I

    rem-int/lit8 p1, p1, 0x2

    const/4 p1, 0x0

    const/4 v5, 0x0

    .line 124
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    if-ge p1, v6, :cond_2

    .line 152
    sget v6, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 v6, v6, 0x5

    rem-int/lit16 v7, v6, 0x80

    sput v7, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/lit8 v6, v6, 0x2

    if-nez v6, :cond_1

    .line 125
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v6

    shl-int/2addr v5, v6

    add-int/lit8 p1, p1, 0x71

    goto :goto_1

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v6

    add-int/2addr v5, v6

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    .line 129
    :cond_2
    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    .line 130
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    const/4 v5, 0x7

    add-int/2addr p1, v5

    invoke-virtual {v2, v5, p1, p0}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    const/4 p0, 0x0

    .line 133
    :goto_2
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-ge p0, p1, :cond_3

    const/4 p1, 0x0

    goto :goto_3

    :cond_3
    const/4 p1, 0x1

    :goto_3
    if-eqz p1, :cond_6

    :goto_4
    const-wide/16 p0, 0x64

    cmp-long v0, v3, p0

    if-lez v0, :cond_4

    .line 139
    rem-long/2addr v3, p0

    goto :goto_4

    :cond_4
    long-to-int p0, v3

    const/16 p1, 0x17

    .line 143
    invoke-virtual {v2, p1, p0}, Ljava/lang/StringBuilder;->insert(II)Ljava/lang/StringBuilder;

    const-wide/16 v5, 0xa

    cmp-long p0, v3, v5

    if-gez p0, :cond_5

    .line 152
    sget p0, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/2addr p0, p1

    rem-int/lit16 v0, p0, 0x80

    sput v0, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/lit8 p0, p0, 0x2

    const-string p0, ""

    .line 147
    invoke-static {p0, p0, v1}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)I

    move-result p0

    const-string/jumbo v0, "\u55de\u78f8\u55ee\ub963\ue11d"

    invoke-static {v0, p0}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p1, p0}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    sget p0, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    add-int/lit8 p0, p0, 0x21

    rem-int/lit16 p1, p0, 0x80

    sput p1, Lcom/appsflyer/internal/d;->getLevel:I

    rem-int/lit8 p0, p0, 0x2

    .line 150
    :cond_5
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 134
    :cond_6
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result p1

    invoke-static {p1}, Ljava/lang/Character;->getNumericValue(C)I

    move-result p1

    int-to-long v5, p1

    add-long/2addr v3, v5

    add-int/lit8 p0, p0, 0x1

    goto :goto_2

    .line 152
    :cond_7
    invoke-static {v1, v1}, Landroid/widget/ExpandableListView;->getPackedPositionForChild(II)J

    move-result-wide p0

    const-string/jumbo v0, "\u2cbe\u5028\u2cdc\uda25\u81a0\u951a\ufcfb\u63da\u056f\ue451\ubf18\uab1b\u7fe7\u8d80\ue9ad\u914d\u51cf\u5736\u1071\u7fbd\u8a4a\u6162\u3a0c\u25bb\ufcfa\u0a91\u64dc\u0c5e\ud6fa\ud49d\u8f69\ufad8\u0f5c\ufe24\ub939\ua0ff"

    cmp-long v1, p0, v3

    rsub-int/lit8 p0, v1, -0x1

    invoke-static {v0, p0}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static valueOf(Ljava/lang/StringBuilder;)V
    .locals 17

    move-object/from16 v0, p0

    .line 201
    sget v1, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 v1, v1, 0x4b

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v2, 0x3

    if-nez v1, :cond_0

    const/4 v1, 0x3

    goto :goto_0

    :cond_0
    const/16 v1, 0x57

    :goto_0
    const/16 v3, 0x4f

    const-string/jumbo v4, "\u2cb4\u8ec3\u2cd5\u04c1\u4545\u51f9\u5bb0\uc486\u056b\u3ab6\u7ba9\u0c5c\u7fbb\u537c\u2d53\u3660\u51c5\u89cb\ud4d9\ud8b7\u8a06\ubf96\ufe90\u82e3\ufcaa\ud47e\ua06a\uab57\ud6e6"

    const/4 v5, -0x1

    const-string/jumbo v6, "\u55de\u78f8\u55ee\ub963\ue11d"

    const-string/jumbo v7, "\u81cf\u44d7\u81fe\u1096\uea64"

    const-wide/16 v8, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x0

    if-eq v1, v2, :cond_2

    .line 195
    invoke-static {v11}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    invoke-static {v4, v1}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/internal/d;->valueOf(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    const/4 v1, 0x1

    :goto_1
    if-eq v1, v10, :cond_5

    goto :goto_2

    :cond_2
    invoke-static {v10}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    invoke-static {v4, v1}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/internal/d;->valueOf(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 201
    :goto_2
    sget v1, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    add-int/lit8 v1, v1, 0x45

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/d;->getLevel:I

    rem-int/lit8 v1, v1, 0x2

    const/16 v2, 0x55

    if-eqz v1, :cond_3

    const/16 v1, 0x4f

    goto :goto_3

    :cond_3
    const/16 v1, 0x55

    :goto_3
    if-eq v1, v2, :cond_4

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const-wide/16 v12, 0x1

    cmp-long v4, v1, v12

    shl-int v1, v5, v4

    invoke-static {v7, v1}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    goto :goto_5

    .line 195
    :cond_4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    cmp-long v4, v1, v8

    add-int/2addr v4, v5

    invoke-static {v7, v4}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_4

    :cond_5
    invoke-static {v11}, Landroid/widget/ExpandableListView;->getPackedPositionForGroup(I)J

    move-result-wide v1

    cmp-long v4, v1, v8

    invoke-static {v6, v4}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    :goto_4
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    :goto_5
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    invoke-static {v11, v11}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v1

    rsub-int/lit8 v1, v1, -0x2f

    const-string v2, ""

    invoke-static {v2, v11}, Landroid/text/TextUtils;->getOffsetAfter(Ljava/lang/CharSequence;I)I

    move-result v4

    add-int/lit8 v4, v4, 0x44

    int-to-byte v4, v4

    const v12, 0x6a9cbf01

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v13

    const/16 v15, 0x30

    cmp-long v16, v13, v8

    add-int v12, v16, v12

    invoke-static {}, Landroid/view/ViewConfiguration;->getKeyRepeatTimeout()I

    move-result v13

    shr-int/lit8 v13, v13, 0x10

    int-to-short v13, v13

    const v14, -0x270a1016

    invoke-static {v2, v15}, Landroid/text/TextUtils;->lastIndexOf(Ljava/lang/CharSequence;C)I

    move-result v16

    sub-int v14, v14, v16

    invoke-static {v1, v4, v12, v13, v14}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(IBISI)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/internal/d;->valueOf(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-static {v2, v2, v11, v11}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;II)I

    move-result v1

    invoke-static {v7, v1}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    .line 201
    sget v4, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    add-int/lit8 v4, v4, 0x43

    rem-int/lit16 v12, v4, 0x80

    sput v12, Lcom/appsflyer/internal/d;->getLevel:I

    rem-int/lit8 v4, v4, 0x2

    goto :goto_6

    .line 197
    :cond_6
    invoke-static {v2, v2, v11}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;I)I

    move-result v1

    invoke-static {v6, v1}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    :goto_6
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    invoke-static {v8, v9}, Landroid/widget/ExpandableListView;->getPackedPositionGroup(J)I

    move-result v1

    const-string/jumbo v4, "\u79e0\u1505\u7981\u9f07\u496f\u5dd3\ud914\u4622\u503f\ua170\u7783\u8ef8\u2aef\uc8ba\u2179\ub4c7\u0483\u1200\ud8e9\u5a15\udf74\u2448\uf284M"

    invoke-static {v4, v1}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/internal/d;->valueOf(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    const/4 v1, 0x0

    goto :goto_7

    :cond_7
    const/4 v1, 0x1

    :goto_7
    if-eq v1, v10, :cond_8

    invoke-static {v11}, Landroid/view/KeyEvent;->normalizeMetaState(I)I

    move-result v1

    invoke-static {v7, v1}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    :goto_8
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    goto :goto_9

    :cond_8
    invoke-static {v8, v9}, Landroid/widget/ExpandableListView;->getPackedPositionChild(J)I

    move-result v1

    sub-int/2addr v5, v1

    invoke-static {v6, v5}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_8

    :goto_9
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    invoke-static {}, Landroid/view/ViewConfiguration;->getMaximumDrawingCacheSize()I

    move-result v1

    shr-int/lit8 v1, v1, 0x18

    rsub-int/lit8 v1, v1, -0x2f

    invoke-static {v2, v15, v11}, Landroid/text/TextUtils;->lastIndexOf(Ljava/lang/CharSequence;CI)I

    move-result v2

    sub-int/2addr v3, v2

    int-to-byte v2, v3

    const v3, 0x6a9cbf02

    const/4 v4, 0x0

    invoke-static {v4, v4}, Landroid/graphics/PointF;->length(FF)F

    move-result v5

    cmpl-float v4, v5, v4

    add-int/2addr v4, v3

    const/high16 v3, -0x1000000

    invoke-static {v11, v11, v11}, Landroid/graphics/Color;->rgb(III)I

    move-result v5

    sub-int/2addr v3, v5

    int-to-short v3, v3

    const v5, -0x280a0ffe

    invoke-static {v11, v11, v11}, Landroid/graphics/Color;->rgb(III)I

    move-result v8

    sub-int/2addr v5, v8

    invoke-static {v1, v2, v4, v3, v5}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(IBISI)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/internal/d;->valueOf(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-static {v11, v11}, Landroid/graphics/drawable/Drawable;->resolveOpacity(II)I

    move-result v1

    invoke-static {v7, v1}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_a

    :cond_9
    invoke-static {}, Landroid/view/ViewConfiguration;->getKeyRepeatTimeout()I

    move-result v1

    shr-int/lit8 v1, v1, 0x10

    invoke-static {v6, v1}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    :goto_a
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method private static valueOf(Ljava/lang/String;)Z
    .locals 2

    .line 164
    sget v0, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    add-int/lit8 v0, v0, 0x6f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/d;->getLevel:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v1, 0xc

    if-eqz v0, :cond_0

    const/16 v0, 0x30

    goto :goto_0

    :cond_0
    const/16 v0, 0xc

    .line 161
    :goto_0
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p0, 0x1

    .line 164
    sget v0, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    add-int/lit8 v0, v0, 0x1f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/d;->getLevel:I

    rem-int/lit8 v0, v0, 0x2

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method

.method private static values(Landroid/content/Context;)Ljava/lang/String;
    .locals 16

    const-string v0, ""

    .line 256
    invoke-static {}, Ljava/lang/System;->getProperties()Ljava/util/Properties;

    move-result-object v1

    invoke-static {}, Landroid/view/ViewConfiguration;->getMinimumFlingVelocity()I

    move-result v2

    shr-int/lit8 v2, v2, 0x10

    add-int/lit8 v2, v2, -0x2f

    const/4 v3, 0x0

    invoke-static {v3, v3}, Landroid/view/View;->combineMeasuredStates(II)I

    move-result v4

    rsub-int/lit8 v4, v4, 0x26

    int-to-byte v4, v4

    const v5, 0x6a9cbf0a

    invoke-static {v3, v3}, Landroid/widget/ExpandableListView;->getPackedPositionForChild(II)J

    move-result-wide v6

    const/16 v8, 0x5e

    const-wide/16 v9, -0x1

    const-wide/16 v11, 0x0

    cmp-long v13, v6, v11

    sub-int/2addr v5, v13

    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    move-result v6

    shr-int/lit8 v6, v6, 0x10

    int-to-short v6, v6

    const v7, -0x270a0fec

    invoke-static {}, Landroid/os/SystemClock;->currentThreadTimeMillis()J

    move-result-wide v13

    cmp-long v15, v13, v9

    sub-int/2addr v7, v15

    invoke-static {v2, v4, v5, v6, v7}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(IBISI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x47

    goto :goto_0

    :cond_0
    const/16 v1, 0x5e

    :goto_0
    const/4 v2, 0x0

    if-eq v1, v8, :cond_3

    .line 270
    sget v1, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 v1, v1, 0x21

    rem-int/lit16 v4, v1, 0x80

    sput v4, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/lit8 v1, v1, 0x2

    const/4 v1, 0x0

    const/4 v4, 0x1

    .line 258
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    .line 259
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollBarSize()I

    move-result v6

    shr-int/lit8 v6, v6, 0x8

    add-int/lit8 v6, v6, -0x2f

    invoke-static {v0, v3, v3}, Landroid/text/TextUtils;->getCapsMode(Ljava/lang/CharSequence;II)I

    move-result v7

    add-int/lit8 v7, v7, -0x59

    int-to-byte v7, v7

    const v8, 0x6a9cbed0

    invoke-static {v3}, Landroid/graphics/Color;->red(I)I

    move-result v13

    add-int/2addr v13, v8

    invoke-static {}, Landroid/os/SystemClock;->currentThreadTimeMillis()J

    move-result-wide v14

    cmp-long v8, v14, v9

    add-int/lit8 v8, v8, -0x1

    int-to-short v8, v8

    const v9, -0x270a0fdf

    invoke-static {v3, v3, v3, v3}, Landroid/graphics/Color;->argb(IIII)I

    move-result v10

    add-int/2addr v10, v9

    invoke-static {v6, v7, v13, v8, v10}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(IBISI)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v5, "\u9d74\ua574\u9d5a\u2f32\u5c38\u48cf\u0ec8\u91d0\ub4b7\u1142\u6298\u590a\uce3e\u7891"

    .line 260
    invoke-static {v1, v1}, Landroid/graphics/PointF;->length(FF)F

    move-result v6

    cmpl-float v6, v6, v1

    invoke-static {v5, v6}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    .line 261
    invoke-virtual {v5, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 262
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v5, :cond_1

    const/4 v5, 0x1

    goto :goto_1

    :cond_1
    const/4 v5, 0x0

    :goto_1
    if-eq v5, v4, :cond_2

    goto :goto_2

    .line 270
    :cond_2
    sget v5, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 v5, v5, 0x4f

    rem-int/lit16 v6, v5, 0x80

    sput v6, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/lit8 v5, v5, 0x2

    .line 263
    :try_start_1
    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v2, v0

    .line 270
    :goto_2
    sget v0, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    add-int/lit8 v0, v0, 0x2d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/d;->getLevel:I

    rem-int/lit8 v0, v0, 0x2

    goto :goto_3

    :catch_0
    move-exception v0

    .line 266
    invoke-static {}, Lcom/appsflyer/internal/ak;->AFInAppEventType()Lcom/appsflyer/internal/ak;

    move-result-object v5

    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollFriction()F

    move-result v6

    const-string/jumbo v7, "\u5971\u5039\u5932\uda3d\ue1a1\uf51c\u64be\ufb99\u70aa\ue456\udf5c\u3300\u0a54\u8d8d\u89fa\u0958\u2411\u5731\u7020\ue7a2\uffdf"

    cmpl-float v1, v6, v1

    sub-int/2addr v4, v1

    invoke-static {v7, v4}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v3}, Landroid/os/Process;->getThreadPriority(I)I

    move-result v6

    add-int/lit8 v6, v6, 0x14

    shr-int/lit8 v6, v6, 0x6

    add-int/lit8 v6, v6, -0x2f

    invoke-static {v3}, Landroid/graphics/Color;->blue(I)I

    move-result v7

    add-int/lit8 v7, v7, 0x2a

    int-to-byte v7, v7

    const v8, 0x6a9cbee6

    invoke-static {v3, v3}, Landroid/widget/ExpandableListView;->getPackedPositionForChild(II)J

    move-result-wide v9

    cmp-long v13, v9, v11

    sub-int/2addr v8, v13

    invoke-static {}, Landroid/view/ViewConfiguration;->getKeyRepeatTimeout()I

    move-result v9

    shr-int/lit8 v9, v9, 0x10

    int-to-short v9, v9

    const v10, -0x270a0fd9

    invoke-static {v3, v3}, Landroid/graphics/drawable/Drawable;->resolveOpacity(II)I

    move-result v3

    add-int/2addr v3, v10

    invoke-static {v6, v7, v8, v9, v3}, Lcom/appsflyer/internal/d;->AFKeystoreWrapper(IBISI)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v1, v0}, Lcom/appsflyer/internal/ak;->AFInAppEventParameterName(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_3
    return-object v2
.end method

.method private static values(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 214
    sget v0, Lcom/appsflyer/internal/d;->getLevel:I

    add-int/lit8 v0, v0, 0x53

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/d;->AFLogger$LogLevel:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eq v0, v1, :cond_1

    .line 212
    invoke-static {p0}, Lcom/appsflyer/internal/ag;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 214
    invoke-static {p0}, Lcom/appsflyer/internal/ag;->AFKeystoreWrapper(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 212
    :cond_1
    invoke-static {p0}, Lcom/appsflyer/internal/ag;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 214
    invoke-static {p0}, Lcom/appsflyer/internal/ag;->AFKeystoreWrapper(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x57

    :try_start_0
    div-int/2addr v0, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    return-object p0

    :catchall_0
    move-exception p0

    throw p0
.end method
