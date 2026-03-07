.class final Lcom/appsflyer/internal/d$d$a;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/d$d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# static fields
.field private static AFInAppEventParameterName:Z = true

.field private static AFInAppEventType:[C = null

.field private static AFKeystoreWrapper:I = 0x0

.field private static init:I = 0x1

.field private static valueOf:I = 0xd9

.field private static values:Z = true


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [C

    const/4 v1, 0x0

    const/16 v2, 0x109

    aput-char v2, v0, v1

    sput-object v0, Lcom/appsflyer/internal/d$d$a;->AFInAppEventType:[C

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 457
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 460
    sget v0, Lcom/appsflyer/internal/d$d$a;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x21

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/d$d$a;->init:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-static {p0}, Lcom/appsflyer/internal/d$d$a;->AFInAppEventType(Ljava/lang/String;)[B

    move-result-object p0

    if-eq v0, v2, :cond_1

    invoke-static {p0}, Lcom/appsflyer/internal/d$d$a;->AFInAppEventParameterName([B)[B

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/internal/d$d$a;->valueOf([B)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x13

    :try_start_0
    div-int/2addr v0, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    throw p0

    :cond_1
    invoke-static {p0}, Lcom/appsflyer/internal/d$d$a;->AFInAppEventParameterName([B)[B

    move-result-object p0

    invoke-static {p0}, Lcom/appsflyer/internal/d$d$a;->valueOf([B)Ljava/lang/String;

    move-result-object p0

    :goto_1
    sget v0, Lcom/appsflyer/internal/d$d$a;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x23

    rem-int/lit16 v3, v0, 0x80

    sput v3, Lcom/appsflyer/internal/d$d$a;->init:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_2

    goto :goto_2

    :cond_2
    const/4 v1, 0x1

    :goto_2
    if-eqz v1, :cond_3

    return-object p0

    :cond_3
    const/4 v0, 0x0

    :try_start_1
    invoke-super {v0}, Ljava/lang/Object;->hashCode()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object p0

    :catchall_1
    move-exception p0

    throw p0
.end method

.method private static AFInAppEventParameterName([B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 481
    sget v1, Lcom/appsflyer/internal/d$d$a;->init:I

    add-int/lit8 v1, v1, 0x37

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/d$d$a;->AFKeystoreWrapper:I

    rem-int/lit8 v1, v1, 0x2

    .line 479
    :goto_0
    array-length v1, p0

    const/16 v2, 0x49

    if-ge v0, v1, :cond_0

    const/16 v1, 0x49

    goto :goto_1

    :cond_0
    const/16 v1, 0x58

    :goto_1
    if-eq v1, v2, :cond_1

    return-object p0

    .line 481
    :cond_1
    sget v1, Lcom/appsflyer/internal/d$d$a;->AFKeystoreWrapper:I

    add-int/lit8 v1, v1, 0x77

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/d$d$a;->init:I

    rem-int/lit8 v1, v1, 0x2

    .line 480
    aget-byte v1, p0, v0

    rem-int/lit8 v2, v0, 0x2

    add-int/lit8 v2, v2, 0x2a

    xor-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static AFInAppEventType(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;
    .locals 5

    if-eqz p2, :cond_0

    const-string v0, "ISO-8859-1"

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p2

    :cond_0
    check-cast p2, [B

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    :cond_1
    check-cast p0, [C

    .line 1163
    sget-object v0, Lcom/appsflyer/internal/dq;->valueOf:Ljava/lang/Object;

    monitor-enter v0

    .line 1165
    :try_start_0
    sget-object v1, Lcom/appsflyer/internal/d$d$a;->AFInAppEventType:[C

    .line 1166
    sget v2, Lcom/appsflyer/internal/d$d$a;->valueOf:I

    .line 1168
    sget-boolean v3, Lcom/appsflyer/internal/d$d$a;->values:Z

    const/4 v4, 0x0

    if-eqz v3, :cond_3

    .line 1171
    array-length p0, p2

    .line 1172
    sput p0, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    new-array p0, p0, [C

    .line 1174
    sput v4, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    :goto_0
    sget p1, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    sget v3, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    if-ge p1, v3, :cond_2

    .line 1176
    sget p1, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    sget v3, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    add-int/lit8 v3, v3, -0x1

    sget v4, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    sub-int/2addr v3, v4

    aget-byte v3, p2, v3

    add-int/2addr v3, p3

    aget-char v3, v1, v3

    sub-int/2addr v3, v2

    int-to-char v3, v3

    aput-char v3, p0, p1

    .line 1174
    sget p1, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    add-int/lit8 p1, p1, 0x1

    sput p1, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    goto :goto_0

    .line 1179
    :cond_2
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([C)V

    monitor-exit v0

    return-object p1

    .line 1182
    :cond_3
    sget-boolean p2, Lcom/appsflyer/internal/d$d$a;->AFInAppEventParameterName:Z

    if-eqz p2, :cond_5

    .line 1185
    array-length p1, p0

    .line 1186
    sput p1, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    new-array p1, p1, [C

    .line 1188
    sput v4, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    :goto_1
    sget p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    sget v3, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    if-ge p2, v3, :cond_4

    .line 1190
    sget p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    sget v3, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    add-int/lit8 v3, v3, -0x1

    sget v4, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    sub-int/2addr v3, v4

    aget-char v3, p0, v3

    sub-int/2addr v3, p3

    aget-char v3, v1, v3

    sub-int/2addr v3, v2

    int-to-char v3, v3

    aput-char v3, p1, p2

    .line 1188
    sget p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    add-int/lit8 p2, p2, 0x1

    sput p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    goto :goto_1

    .line 1193
    :cond_4
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, p1}, Ljava/lang/String;-><init>([C)V

    monitor-exit v0

    return-object p0

    .line 1199
    :cond_5
    array-length p0, p1

    .line 1200
    sput p0, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    new-array p0, p0, [C

    .line 1202
    sput v4, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    :goto_2
    sget p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    sget v3, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    if-ge p2, v3, :cond_6

    .line 1204
    sget p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    sget v3, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    add-int/lit8 v3, v3, -0x1

    sget v4, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    sub-int/2addr v3, v4

    aget v3, p1, v3

    sub-int/2addr v3, p3

    aget-char v3, v1, v3

    sub-int/2addr v3, v2

    int-to-char v3, v3

    aput-char v3, p0, p2

    .line 1202
    sget p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    add-int/lit8 p2, p2, 0x1

    sput p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    goto :goto_2

    .line 1207
    :cond_6
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([C)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p1

    :catchall_0
    move-exception p0

    .line 1209
    monitor-exit v0

    throw p0
.end method

.method private static AFInAppEventType(Ljava/lang/String;)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 470
    sget v0, Lcom/appsflyer/internal/d$d$a;->init:I

    add-int/lit8 v0, v0, 0x41

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/d$d$a;->AFKeystoreWrapper:I

    rem-int/lit8 v0, v0, 0x2

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    sget v0, Lcom/appsflyer/internal/d$d$a;->AFKeystoreWrapper:I

    add-int/lit8 v0, v0, 0x33

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/d$d$a;->init:I

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eq v0, v1, :cond_1

    return-object p0

    :cond_1
    const/4 v0, 0x0

    :try_start_0
    array-length v0, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    throw p0
.end method

.method private static valueOf([B)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 486
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 487
    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    const/4 v4, 0x1

    if-ge v3, v1, :cond_0

    const/4 v5, 0x1

    goto :goto_1

    :cond_0
    const/4 v5, 0x0

    :goto_1
    if-eq v5, v4, :cond_1

    .line 493
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    sget v5, Lcom/appsflyer/internal/d$d$a;->init:I

    add-int/lit8 v5, v5, 0x3f

    rem-int/lit16 v6, v5, 0x80

    sput v6, Lcom/appsflyer/internal/d$d$a;->AFKeystoreWrapper:I

    rem-int/lit8 v5, v5, 0x2

    const/16 v6, 0xd

    if-eqz v5, :cond_2

    const/16 v5, 0x25

    goto :goto_2

    :cond_2
    const/16 v5, 0xd

    :goto_2
    if-eq v5, v6, :cond_3

    aget-byte v4, p0, v3

    .line 488
    invoke-static {v4}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    .line 489
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_5

    goto :goto_3

    .line 487
    :cond_3
    aget-byte v5, p0, v3

    .line 488
    invoke-static {v5}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v5

    .line 489
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    if-ne v6, v4, :cond_4

    move-object v4, v5

    .line 490
    :goto_3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v6, 0x30

    const-string v7, ""

    invoke-static {v7, v6, v2}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;CI)I

    move-result v6

    rsub-int/lit8 v6, v6, 0x7e

    const/4 v7, 0x0

    const-string/jumbo v8, "\u0081"

    invoke-static {v7, v7, v8, v6}, Lcom/appsflyer/internal/d$d$a;->AFInAppEventType(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 493
    sget v5, Lcom/appsflyer/internal/d$d$a;->init:I

    add-int/lit8 v5, v5, 0x47

    rem-int/lit16 v6, v5, 0x80

    sput v6, Lcom/appsflyer/internal/d$d$a;->AFKeystoreWrapper:I

    rem-int/lit8 v5, v5, 0x2

    goto :goto_4

    :cond_4
    move-object v4, v5

    .line 491
    :cond_5
    :goto_4
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0
.end method
