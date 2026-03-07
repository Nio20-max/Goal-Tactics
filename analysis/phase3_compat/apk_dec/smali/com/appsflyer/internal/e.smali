.class public Lcom/appsflyer/internal/e;
.super Ljava/lang/Object;
.source ""


# static fields
.field private static onAppOpenAttribution:J = 0x0L

.field public static onAppOpenAttributionNative:[B = null

.field private static onAttributionFailure:I = 0x0

.field private static onConversionDataFail:Ljava/lang/Object; = null

.field private static onConversionDataSuccess:Ljava/lang/Object; = null

.field public static final onDeepLinking:I = 0x0

.field private static onResponse:I = 0x1

.field public static final onResponseError:[B

.field private static onResponseErrorNative:I

.field public static onResponseNative:[B


# direct methods
.method private static $$c(BSI)Ljava/lang/String;
    .locals 8

    sget v0, Lcom/appsflyer/internal/e;->onResponse:I

    add-int/lit8 v0, v0, 0x7d

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    rem-int/lit8 v0, v0, 0x2

    sget-object v0, Lcom/appsflyer/internal/e;->onResponseError:[B

    neg-int p2, p2

    or-int/lit8 v2, p2, 0x24

    const/4 v3, 0x1

    shl-int/2addr v2, v3

    xor-int/lit8 p2, p2, 0x24

    sub-int/2addr v2, p2

    rsub-int p1, p1, 0x3e6

    rsub-int/lit8 p0, p0, 0x77

    new-array p2, v2, [B

    const/4 v4, 0x0

    if-nez v0, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    if-eqz v5, :cond_3

    add-int/lit8 v1, v1, 0x6f

    rem-int/lit16 v5, v1, 0x80

    sput v5, Lcom/appsflyer/internal/e;->onResponse:I

    rem-int/lit8 v1, v1, 0x2

    const/16 v5, 0x3a

    if-nez v1, :cond_1

    const/16 v1, 0x3a

    goto :goto_1

    :cond_1
    const/16 v1, 0x59

    :goto_1
    if-eq v1, v5, :cond_2

    goto :goto_2

    :cond_2
    const/16 v1, 0x5b

    :try_start_0
    div-int/2addr v1, v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_2
    move v5, v2

    const/4 v1, 0x0

    goto :goto_4

    :catchall_0
    move-exception p0

    throw p0

    :cond_3
    const/4 v1, 0x0

    :goto_3
    move v7, v2

    move v2, p0

    move p0, v7

    add-int/lit8 v5, v1, 0x1

    int-to-byte v6, v2

    aput-byte v6, p2, v1

    if-ne v5, p0, :cond_6

    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, p2, v4}, Ljava/lang/String;-><init>([BI)V

    sget p1, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    and-int/lit8 p2, p1, 0x7

    or-int/lit8 p1, p1, 0x7

    add-int/2addr p2, p1

    rem-int/lit16 p1, p2, 0x80

    sput p1, Lcom/appsflyer/internal/e;->onResponse:I

    rem-int/lit8 p2, p2, 0x2

    if-nez p2, :cond_4

    const/4 v3, 0x0

    :cond_4
    if-eqz v3, :cond_5

    return-object p0

    :cond_5
    const/4 p1, 0x0

    :try_start_1
    array-length p1, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    return-object p0

    :catchall_1
    move-exception p0

    throw p0

    :cond_6
    aget-byte v1, v0, p1

    move v7, v2

    move v2, p0

    move p0, v1

    move v1, v5

    move v5, v7

    :goto_4
    xor-int/lit8 v6, p1, 0x1

    and-int/2addr p1, v3

    shl-int/2addr p1, v3

    add-int/2addr p1, v6

    neg-int p0, p0

    neg-int p0, p0

    and-int v6, v5, p0

    or-int/2addr p0, v5

    add-int/2addr v6, p0

    or-int/lit8 p0, v6, -0x3

    shl-int/2addr p0, v3

    xor-int/lit8 v5, v6, -0x3

    sub-int/2addr p0, v5

    sget v5, Lcom/appsflyer/internal/e;->onResponse:I

    add-int/lit8 v5, v5, 0x66

    sub-int/2addr v5, v3

    rem-int/lit16 v6, v5, 0x80

    sput v6, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    rem-int/lit8 v5, v5, 0x2

    goto :goto_3
.end method

.method static constructor <clinit>()V
    .locals 48

    const-class v1, [B

    invoke-static {}, Lcom/appsflyer/internal/e;->init$0()V

    const/4 v2, 0x5

    .line 1000
    sput v2, Lcom/appsflyer/internal/e;->onResponseErrorNative:I

    const-wide v3, 0x29cd1712d2aeb455L

    sput-wide v3, Lcom/appsflyer/internal/e;->onAppOpenAttribution:J

    .line 79
    :try_start_0
    sget-object v3, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v4, 0x1af

    aget-byte v5, v3, v4

    int-to-byte v5, v5

    const/16 v6, 0x328

    int-to-short v6, v6

    const/16 v7, 0xa7

    aget-byte v7, v3, v7

    int-to-byte v7, v7

    invoke-static {v5, v6, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    .line 83
    sget-object v6, Lcom/appsflyer/internal/e;->onConversionDataSuccess:Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_e

    const/4 v7, 0x2

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-nez v6, :cond_0

    .line 259
    sget v6, Lcom/appsflyer/internal/e;->onResponse:I

    xor-int/lit8 v10, v6, 0x35

    and-int/lit8 v6, v6, 0x35

    shl-int/2addr v6, v9

    add-int/2addr v10, v6

    rem-int/lit16 v6, v10, 0x80

    sput v6, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    rem-int/2addr v10, v7

    .line 83
    :try_start_1
    aget-byte v6, v3, v4

    int-to-byte v6, v6

    const/16 v10, 0xb1

    aget-byte v10, v3, v10

    int-to-short v10, v10

    const/16 v11, 0xb

    aget-byte v11, v3, v11

    int-to-byte v11, v11

    invoke-static {v6, v10, v11}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_e

    goto :goto_0

    :cond_0
    move-object v6, v8

    :goto_0
    const/16 v10, 0x1d

    const/16 v11, 0x3a

    const/16 v12, 0x10

    const/4 v13, 0x3

    const/4 v14, 0x0

    .line 1774
    :try_start_2
    aget-byte v15, v3, v11

    int-to-byte v15, v15

    xor-int/lit16 v2, v15, 0xe8

    and-int/lit16 v9, v15, 0xe8

    or-int/2addr v2, v9

    int-to-short v2, v2

    const/16 v9, 0xa7

    aget-byte v9, v3, v9

    int-to-byte v9, v9

    invoke-static {v15, v2, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    .line 1775
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    aget-byte v9, v3, v4

    int-to-byte v9, v9

    const/16 v15, 0x3b9

    int-to-short v15, v15

    aget-byte v3, v3, v13

    int-to-byte v3, v3

    invoke-static {v9, v15, v3}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v3

    new-array v9, v14, [Ljava/lang/Class;

    .line 1776
    invoke-virtual {v2, v3, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    move-object v3, v8

    check-cast v3, [Ljava/lang/Object;

    .line 1777
    invoke-virtual {v2, v8, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    if-eqz v2, :cond_1

    goto :goto_1

    :catch_0
    move-object v2, v8

    .line 1788
    :cond_1
    :try_start_3
    sget-object v3, Lcom/appsflyer/internal/e;->onResponseError:[B

    aget-byte v9, v3, v11

    int-to-byte v9, v9

    const/16 v15, 0x262

    int-to-short v15, v15

    const/16 v18, 0x94

    aget-byte v13, v3, v18

    int-to-byte v13, v13

    invoke-static {v9, v15, v13}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v9

    .line 1789
    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    aget-byte v13, v3, v12

    int-to-byte v13, v13

    xor-int/lit16 v15, v13, 0x89

    and-int/lit16 v4, v13, 0x89

    or-int/2addr v4, v15

    int-to-short v4, v4

    aget-byte v3, v3, v10

    int-to-byte v3, v3

    invoke-static {v13, v4, v3}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v3

    new-array v4, v14, [Ljava/lang/Class;

    .line 1790
    invoke-virtual {v9, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    move-object v4, v8

    check-cast v4, [Ljava/lang/Object;

    .line 1791
    invoke-virtual {v3, v8, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    :catch_1
    nop

    :goto_1
    if-eqz v2, :cond_2

    .line 3603
    sget v3, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    add-int/lit8 v3, v3, 0x3d

    rem-int/lit16 v4, v3, 0x80

    sput v4, Lcom/appsflyer/internal/e;->onResponse:I

    rem-int/2addr v3, v7

    .line 100
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    sget-object v4, Lcom/appsflyer/internal/e;->onResponseError:[B

    aget-byte v9, v4, v12

    int-to-byte v9, v9

    const/16 v13, 0x30f

    int-to-short v13, v13

    const/16 v15, 0xff

    aget-byte v4, v4, v15

    int-to-byte v4, v4

    invoke-static {v9, v13, v4}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    move-object v9, v8

    check-cast v9, [Ljava/lang/Class;

    .line 101
    invoke-virtual {v3, v4, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    move-object v4, v8

    check-cast v4, [Ljava/lang/Object;

    .line 102
    invoke-virtual {v3, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_2

    :catch_2
    :cond_2
    move-object v3, v8

    :goto_2
    if-eqz v2, :cond_3

    .line 112
    :try_start_5
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    sget-object v9, Lcom/appsflyer/internal/e;->onResponseError:[B

    aget-byte v13, v9, v12

    int-to-byte v13, v13

    xor-int/lit16 v15, v13, 0x2a8

    and-int/lit16 v11, v13, 0x2a8

    or-int/2addr v11, v15

    int-to-short v11, v11

    const/16 v15, 0x2d

    aget-byte v9, v9, v15

    int-to-byte v9, v9

    invoke-static {v13, v11, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v9

    move-object v11, v8

    check-cast v11, [Ljava/lang/Class;

    .line 113
    invoke-virtual {v4, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    move-object v9, v8

    check-cast v9, [Ljava/lang/Object;

    .line 114
    invoke-virtual {v4, v2, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_3

    :catch_3
    :cond_3
    move-object v4, v8

    :goto_3
    if-eqz v2, :cond_4

    .line 124
    :try_start_6
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    sget-object v11, Lcom/appsflyer/internal/e;->onResponseError:[B

    aget-byte v13, v11, v12

    int-to-byte v13, v13

    const/16 v15, 0x301

    int-to-short v15, v15

    const/16 v21, 0xff

    aget-byte v11, v11, v21

    int-to-byte v11, v11

    invoke-static {v13, v15, v11}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v11

    move-object v13, v8

    check-cast v13, [Ljava/lang/Class;

    .line 125
    invoke-virtual {v9, v11, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    move-object v11, v8

    check-cast v11, [Ljava/lang/Object;

    .line 126
    invoke-virtual {v9, v2, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_4

    :catch_4
    :cond_4
    move-object v2, v8

    :goto_4
    if-eqz v3, :cond_5

    const/4 v9, 0x0

    goto :goto_5

    :cond_5
    const/4 v9, 0x1

    :goto_5
    const/16 v11, 0x95

    if-eqz v9, :cond_9

    if-nez v6, :cond_6

    const/16 v3, 0x2d

    goto :goto_6

    :cond_6
    const/16 v3, 0x12

    :goto_6
    const/16 v9, 0x2d

    if-eq v3, v9, :cond_8

    .line 134
    :try_start_7
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v13, 0x99

    aget-byte v13, v9, v13

    int-to-byte v13, v13

    const/16 v15, 0x1aa

    int-to-short v15, v15

    const/16 v21, 0xff

    aget-byte v8, v9, v21

    int-to-byte v8, v8

    invoke-static {v13, v15, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_e

    const/4 v6, 0x1

    :try_start_8
    new-array v8, v6, [Ljava/lang/Object;

    aput-object v3, v8, v14

    aget-byte v3, v9, v11

    int-to-byte v3, v3

    const/16 v6, 0x85

    int-to-short v6, v6

    const/4 v13, 0x5

    aget-byte v9, v9, v13

    int-to-byte v9, v9

    invoke-static {v3, v6, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const/4 v6, 0x1

    new-array v9, v6, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v9, v14

    invoke-virtual {v3, v9}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_7

    :catchall_0
    move-exception v0

    move-object v1, v0

    :try_start_9
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_7

    throw v2

    :cond_7
    throw v1
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_e

    :cond_8
    const/4 v3, 0x0

    goto :goto_7

    .line 259
    :cond_9
    sget v6, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    and-int/lit8 v8, v6, 0x1d

    or-int/2addr v6, v10

    add-int/2addr v8, v6

    rem-int/lit16 v6, v8, 0x80

    sput v6, Lcom/appsflyer/internal/e;->onResponse:I

    rem-int/2addr v8, v7

    :goto_7
    if-eqz v2, :cond_a

    const/4 v6, 0x0

    goto :goto_8

    :cond_a
    const/4 v6, 0x1

    :goto_8
    const/4 v8, 0x1

    if-eq v6, v8, :cond_b

    goto :goto_9

    .line 138
    :cond_b
    :try_start_a
    sget-object v2, Lcom/appsflyer/internal/e;->onResponseError:[B

    aget-byte v6, v2, v11

    int-to-byte v6, v6

    const/16 v8, 0x123

    int-to-short v8, v8

    const/16 v9, 0x3a

    aget-byte v13, v2, v9

    int-to-byte v9, v13

    invoke-static {v6, v8, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_e

    .line 259
    sget v8, Lcom/appsflyer/internal/e;->onResponse:I

    and-int/lit8 v9, v8, 0x39

    or-int/lit8 v8, v8, 0x39

    add-int/2addr v9, v8

    rem-int/lit16 v8, v9, 0x80

    sput v8, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    rem-int/2addr v9, v7

    const/4 v8, 0x1

    :try_start_b
    new-array v9, v8, [Ljava/lang/Object;

    aput-object v6, v9, v14

    .line 138
    aget-byte v6, v2, v11

    int-to-byte v6, v6

    const/16 v8, 0x3c8

    int-to-short v8, v8

    const/16 v13, 0x1af

    aget-byte v15, v2, v13

    int-to-byte v13, v15

    invoke-static {v6, v8, v13}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    aget-byte v8, v2, v12

    int-to-byte v8, v8

    xor-int/lit16 v13, v8, 0x106

    and-int/lit16 v15, v8, 0x106

    or-int/2addr v13, v15

    int-to-short v13, v13

    const/16 v15, 0xff

    aget-byte v15, v2, v15

    int-to-byte v15, v15

    invoke-static {v8, v13, v15}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    const/4 v13, 0x1

    new-array v15, v13, [Ljava/lang/Class;

    const-class v17, Ljava/lang/String;

    aput-object v17, v15, v14

    invoke-virtual {v6, v8, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    const/4 v8, 0x0

    invoke-virtual {v6, v8, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4e

    :try_start_c
    new-array v8, v13, [Ljava/lang/Object;

    aput-object v6, v8, v14

    aget-byte v6, v2, v11

    int-to-byte v6, v6

    const/16 v9, 0x85

    int-to-short v9, v9

    const/4 v13, 0x5

    aget-byte v2, v2, v13

    int-to-byte v2, v2

    invoke-static {v6, v9, v2}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v6, 0x1

    new-array v9, v6, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v9, v14

    invoke-virtual {v2, v9}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4d

    :goto_9
    if-nez v4, :cond_d

    if-eqz v3, :cond_d

    .line 146
    :try_start_d
    sget-object v4, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v6, 0x1af

    aget-byte v8, v4, v6

    int-to-byte v6, v8

    const/16 v8, 0x2e0

    int-to-short v8, v8

    const/16 v9, 0x20e

    aget-byte v9, v4, v9

    int-to-byte v9, v9

    invoke-static {v6, v8, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_e

    .line 3603
    sget v8, Lcom/appsflyer/internal/e;->onResponse:I

    xor-int/lit8 v9, v8, 0x77

    and-int/lit8 v8, v8, 0x77

    const/4 v13, 0x1

    shl-int/2addr v8, v13

    add-int/2addr v9, v8

    rem-int/lit16 v8, v9, 0x80

    sput v8, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    rem-int/2addr v9, v7

    :try_start_e
    new-array v8, v7, [Ljava/lang/Object;

    const/4 v9, 0x1

    aput-object v6, v8, v9

    aput-object v3, v8, v14

    .line 146
    aget-byte v6, v4, v11

    int-to-byte v6, v6

    const/16 v9, 0x85

    int-to-short v9, v9

    const/4 v13, 0x5

    aget-byte v15, v4, v13

    int-to-byte v13, v15

    invoke-static {v6, v9, v13}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    new-array v13, v7, [Ljava/lang/Class;

    aget-byte v15, v4, v11

    int-to-byte v15, v15

    const/16 v16, 0x5

    aget-byte v4, v4, v16

    int-to-byte v4, v4

    invoke-static {v15, v9, v4}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    aput-object v4, v13, v14

    const-class v4, Ljava/lang/String;

    const/4 v9, 0x1

    aput-object v4, v13, v9

    invoke-virtual {v6, v13}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    goto :goto_a

    :catchall_1
    move-exception v0

    move-object v1, v0

    :try_start_f
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_c

    throw v2

    :cond_c
    throw v1
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_e

    :cond_d
    :goto_a
    :try_start_10
    sget-object v6, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v8, 0x3a

    aget-byte v9, v6, v8

    int-to-byte v8, v9

    const/16 v9, 0x1e2

    int-to-short v9, v9

    const/16 v13, 0x94

    aget-byte v13, v6, v13

    int-to-byte v13, v13

    invoke-static {v8, v9, v13}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    aget-byte v9, v6, v12

    int-to-byte v9, v9

    const/16 v13, 0x24d

    int-to-short v13, v13

    const/16 v15, 0x9

    aget-byte v12, v6, v15

    int-to-byte v12, v12

    invoke-static {v9, v13, v12}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v9

    const/4 v12, 0x0

    invoke-virtual {v8, v9, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-virtual {v8, v12, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_4c

    .line 150
    :try_start_11
    aget-byte v9, v6, v11

    int-to-byte v9, v9

    const/16 v12, 0x85

    int-to-short v12, v12

    const/4 v13, 0x5

    aget-byte v11, v6, v13

    int-to-byte v11, v11

    invoke-static {v9, v12, v11}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    invoke-static {v9, v15}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v11, v9, v14

    const/4 v11, 0x1

    aput-object v4, v9, v11

    aput-object v3, v9, v7

    const/4 v11, 0x3

    aput-object v2, v9, v11

    const/4 v11, 0x4

    aput-object v8, v9, v11

    const/4 v13, 0x5

    aput-object v4, v9, v13

    const/4 v4, 0x6

    aput-object v3, v9, v4

    const/4 v3, 0x7

    aput-object v2, v9, v3

    const/16 v2, 0x8

    aput-object v8, v9, v2

    new-array v2, v15, [Z

    aput-boolean v14, v2, v14

    const/4 v8, 0x1

    aput-boolean v8, v2, v8

    aput-boolean v8, v2, v7

    const/4 v13, 0x3

    aput-boolean v8, v2, v13

    aput-boolean v8, v2, v11

    const/4 v13, 0x5

    aput-boolean v8, v2, v13

    aput-boolean v8, v2, v4

    aput-boolean v8, v2, v3

    const/16 v13, 0x8

    aput-boolean v8, v2, v13

    new-array v13, v15, [Z

    aput-boolean v14, v13, v14

    aput-boolean v14, v13, v8

    aput-boolean v14, v13, v7

    const/16 v17, 0x3

    aput-boolean v14, v13, v17

    aput-boolean v14, v13, v11

    const/16 v16, 0x5

    aput-boolean v8, v13, v16

    aput-boolean v8, v13, v4

    aput-boolean v8, v13, v3

    const/16 v17, 0x8

    aput-boolean v8, v13, v17

    new-array v10, v15, [Z

    aput-boolean v14, v10, v14

    aput-boolean v14, v10, v8

    aput-boolean v8, v10, v7

    const/16 v17, 0x3

    aput-boolean v8, v10, v17

    aput-boolean v14, v10, v11

    const/16 v16, 0x5

    aput-boolean v14, v10, v16

    aput-boolean v8, v10, v4

    aput-boolean v8, v10, v3

    const/16 v8, 0x8

    aput-boolean v14, v10, v8
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_e

    const/16 v8, 0x31

    const/16 v20, 0x3a

    .line 206
    :try_start_12
    aget-byte v3, v6, v20

    int-to-byte v3, v3

    const/16 v4, 0x385

    int-to-short v4, v4

    aget-byte v15, v6, v8

    int-to-byte v15, v15

    invoke-static {v3, v4, v15}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const/16 v4, 0x19

    .line 207
    aget-byte v4, v6, v4

    int-to-byte v4, v4

    const/16 v15, 0x187

    int-to-short v15, v15

    const/16 v23, 0x251

    aget-byte v6, v6, v23

    int-to-byte v6, v6

    invoke-static {v4, v15, v6}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v3

    const/16 v4, 0x1d

    if-ne v3, v4, :cond_e

    const/4 v4, 0x1

    goto :goto_b

    :cond_e
    const/4 v4, 0x0

    :goto_b
    if-eqz v4, :cond_f

    goto :goto_c

    :cond_f
    const/16 v4, 0x1a

    if-lt v3, v4, :cond_10

    const/4 v4, 0x1

    goto :goto_d

    :cond_10
    :goto_c
    const/4 v4, 0x0

    :goto_d
    aput-boolean v4, v10, v14
    :try_end_12
    .catch Ljava/lang/ClassNotFoundException; {:try_start_12 .. :try_end_12} :catch_5
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_e

    const/16 v4, 0x15

    if-lt v3, v4, :cond_11

    .line 259
    sget v4, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    add-int/lit8 v4, v4, 0xb

    rem-int/lit16 v6, v4, 0x80

    sput v6, Lcom/appsflyer/internal/e;->onResponse:I

    rem-int/2addr v4, v7

    const/4 v4, 0x1

    const/16 v17, 0x1

    goto :goto_e

    :cond_11
    const/4 v4, 0x1

    const/16 v17, 0x0

    :goto_e
    :try_start_13
    aput-boolean v17, v10, v4

    const/16 v4, 0x15

    if-lt v3, v4, :cond_12

    const/4 v4, 0x1

    goto :goto_f

    :cond_12
    const/4 v4, 0x0

    :goto_f
    const/4 v6, 0x5

    aput-boolean v4, v10, v6

    const/16 v4, 0x10

    if-ge v3, v4, :cond_13

    const/4 v6, 0x1

    goto :goto_10

    :cond_13
    const/4 v6, 0x0

    :goto_10
    aput-boolean v6, v10, v11

    const/16 v6, 0x8

    if-ge v3, v4, :cond_14

    const/4 v3, 0x1

    goto :goto_11

    :cond_14
    const/4 v3, 0x0

    :goto_11
    aput-boolean v3, v10, v6
    :try_end_13
    .catch Ljava/lang/ClassNotFoundException; {:try_start_13 .. :try_end_13} :catch_5
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_e

    :catch_5
    const/4 v3, 0x0

    const/4 v6, 0x0

    :goto_12
    if-nez v6, :cond_15

    const/4 v4, 0x0

    goto :goto_13

    :cond_15
    const/4 v4, 0x1

    :goto_13
    if-eqz v4, :cond_16

    goto :goto_15

    .line 3603
    :cond_16
    sget v4, Lcom/appsflyer/internal/e;->onResponse:I

    xor-int/lit8 v15, v4, 0xd

    and-int/lit8 v4, v4, 0xd

    const/16 v17, 0x1

    shl-int/lit8 v4, v4, 0x1

    add-int/2addr v15, v4

    rem-int/lit16 v4, v15, 0x80

    sput v4, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    rem-int/2addr v15, v7

    const/16 v4, 0x9

    if-ge v3, v4, :cond_17

    const/4 v4, 0x1

    goto :goto_14

    :cond_17
    const/4 v4, 0x0

    :goto_14
    const/4 v15, 0x1

    if-eq v4, v15, :cond_18

    :goto_15
    return-void

    .line 232
    :cond_18
    :try_start_14
    aget-boolean v4, v10, v3
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_e

    if-eqz v4, :cond_7d

    .line 236
    :try_start_15
    aget-boolean v15, v2, v3

    aget-object v11, v9, v3

    aget-boolean v24, v13, v3
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_4a

    const/16 v25, 0x37b

    if-eqz v15, :cond_1d

    if-eqz v11, :cond_19

    const/4 v7, 0x1

    const/4 v8, 0x0

    goto :goto_16

    :cond_19
    const/4 v7, 0x1

    const/4 v8, 0x1

    :goto_16
    if-eq v8, v7, :cond_1b

    .line 2309
    :try_start_16
    sget-object v7, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v8, 0x95

    aget-byte v4, v7, v8

    int-to-byte v4, v4

    const/4 v8, 0x5

    aget-byte v14, v7, v8

    int-to-byte v8, v14

    invoke-static {v4, v12, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/16 v8, 0x1af

    aget-byte v14, v7, v8

    int-to-byte v8, v14

    const/16 v14, 0xce

    int-to-short v14, v14

    const/16 v28, 0x341

    aget-byte v7, v7, v28

    neg-int v7, v7

    int-to-byte v7, v7

    invoke-static {v8, v14, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v4, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v4, v11, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_2

    if-eqz v4, :cond_1b

    goto/16 :goto_17

    :catchall_2
    move-exception v0

    move-object v4, v0

    :try_start_17
    invoke-virtual {v4}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v7

    if-eqz v7, :cond_1a

    throw v7

    :cond_1a
    throw v4

    .line 2313
    :cond_1b
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v8, 0x34

    aget-byte v8, v7, v8

    int-to-byte v8, v8

    const/16 v14, 0x282

    int-to-short v14, v14

    aget-byte v15, v7, v25

    int-to-byte v15, v15

    invoke-static {v8, v14, v15}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget v8, Lcom/appsflyer/internal/e;->onDeepLinking:I

    and-int/lit8 v11, v8, -0x4

    or-int/lit8 v8, v8, -0x4

    add-int/2addr v11, v8

    int-to-byte v8, v11

    const/16 v11, 0x2f4

    int-to-short v11, v11

    const/16 v14, 0x19

    aget-byte v14, v7, v14

    const/4 v15, 0x1

    sub-int/2addr v14, v15

    int-to-byte v14, v14

    invoke-static {v8, v11, v14}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_4a

    :try_start_18
    new-array v8, v15, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v4, v8, v11

    const/16 v4, 0x95

    aget-byte v11, v7, v4

    int-to-byte v4, v11

    const/16 v11, 0xc7

    int-to-short v11, v11

    const/16 v14, 0x40

    aget-byte v7, v7, v14

    int-to-byte v7, v7

    invoke-static {v4, v11, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/4 v7, 0x1

    new-array v11, v7, [Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    const/4 v14, 0x0

    aput-object v7, v11, v14

    invoke-virtual {v4, v11}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    invoke-virtual {v4, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Throwable;

    throw v4
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_3

    :catchall_3
    move-exception v0

    move-object v4, v0

    :try_start_19
    invoke-virtual {v4}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v7

    if-eqz v7, :cond_1c

    throw v7

    :cond_1c
    throw v4
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_4a

    :cond_1d
    :goto_17
    if-eqz v15, :cond_34

    .line 2328
    :try_start_1a
    new-instance v8, Ljava/util/Random;

    invoke-direct {v8}, Ljava/util/Random;-><init>()V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_13

    .line 2329
    :try_start_1b
    sget-object v14, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v22, 0x95

    aget-byte v7, v14, v22
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_11

    int-to-byte v7, v7

    const/16 v4, 0x3c8

    int-to-short v4, v4

    move-object/from16 v30, v2

    const/16 v18, 0x1af

    :try_start_1c
    aget-byte v2, v14, v18

    int-to-byte v2, v2

    invoke-static {v7, v4, v2}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    aget-byte v4, v14, v18

    int-to-byte v4, v4

    xor-int/lit8 v7, v4, 0x62

    and-int/lit8 v31, v4, 0x62

    or-int v7, v7, v31

    int-to-short v7, v7

    const/16 v29, 0x286

    aget-byte v14, v14, v29

    int-to-byte v14, v14

    invoke-static {v4, v7, v14}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    invoke-virtual {v2, v4, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-virtual {v2, v7, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v31
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_10

    const-wide/32 v33, 0x3a9680e2

    move-object v2, v5

    xor-long v4, v31, v33

    :try_start_1d
    invoke-virtual {v8, v4, v5}, Ljava/util/Random;->setSeed(J)V
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_f

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v14, 0x0

    :goto_18
    if-nez v4, :cond_32

    if-nez v5, :cond_1e

    move-object/from16 v33, v2

    move-object/from16 v31, v4

    const/4 v2, 0x6

    goto :goto_1a

    :cond_1e
    if-nez v7, :cond_1f

    .line 3603
    sget v31, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    and-int/lit8 v32, v31, 0x19

    or-int/lit8 v31, v31, 0x19

    move-object/from16 v33, v2

    add-int v2, v32, v31

    move-object/from16 v31, v4

    rem-int/lit16 v4, v2, 0x80

    sput v4, Lcom/appsflyer/internal/e;->onResponse:I

    const/4 v4, 0x2

    rem-int/2addr v2, v4

    const/4 v2, 0x5

    goto :goto_1a

    :cond_1f
    move-object/from16 v33, v2

    move-object/from16 v31, v4

    if-nez v14, :cond_20

    const/16 v2, 0x10

    goto :goto_19

    :cond_20
    const/16 v2, 0x16

    :goto_19
    const/16 v4, 0x16

    if-eq v2, v4, :cond_21

    const/4 v2, 0x4

    goto :goto_1a

    :cond_21
    const/4 v2, 0x3

    .line 2347
    :goto_1a
    :try_start_1e
    new-instance v4, Ljava/lang/StringBuilder;
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_e

    add-int/lit8 v32, v2, 0x2

    move/from16 v34, v6

    move-object/from16 v35, v9

    const/4 v6, 0x1

    add-int/lit8 v9, v32, -0x1

    :try_start_1f
    invoke-direct {v4, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v9, 0x2e

    .line 2349
    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_1f
    .catchall {:try_start_1f .. :try_end_1f} :catchall_d

    const/4 v9, 0x0

    :goto_1b
    if-ge v9, v2, :cond_22

    move/from16 v32, v2

    const/4 v2, 0x0

    goto :goto_1c

    :cond_22
    move/from16 v32, v2

    const/4 v2, 0x1

    :goto_1c
    if-eq v2, v6, :cond_26

    if-eqz v24, :cond_25

    .line 259
    sget v2, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    add-int/lit8 v2, v2, 0x45

    rem-int/lit16 v6, v2, 0x80

    sput v6, Lcom/appsflyer/internal/e;->onResponse:I

    const/4 v6, 0x2

    rem-int/2addr v2, v6

    const/16 v2, 0x1a

    .line 2355
    :try_start_20
    invoke-virtual {v8, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    .line 2356
    invoke-virtual {v8}, Ljava/util/Random;->nextBoolean()Z

    move-result v6

    if-eqz v6, :cond_23

    const/4 v6, 0x1

    goto :goto_1d

    :cond_23
    const/4 v6, 0x0

    :goto_1d
    if-eqz v6, :cond_24

    and-int/lit8 v6, v2, 0x41

    or-int/lit8 v2, v2, 0x41

    goto :goto_1e

    :cond_24
    and-int/lit8 v6, v2, 0x60

    or-int/lit8 v2, v2, 0x60

    :goto_1e
    add-int/2addr v6, v2

    int-to-char v2, v6

    .line 2361
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1f

    :cond_25
    const/16 v2, 0xc

    .line 2365
    invoke-virtual {v8, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v2

    add-int/lit16 v2, v2, 0x2000

    int-to-char v2, v2

    .line 2366
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_4

    :goto_1f
    add-int/lit8 v9, v9, 0x1

    move/from16 v2, v32

    const/4 v6, 0x1

    goto :goto_1b

    :catchall_4
    move-exception v0

    move-object v2, v0

    move/from16 v36, v3

    move-object/from16 v40, v10

    move-object/from16 v39, v13

    goto/16 :goto_29

    .line 2370
    :cond_26
    :try_start_21
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_d

    if-nez v5, :cond_28

    const/4 v4, 0x2

    :try_start_22
    new-array v5, v4, [Ljava/lang/Object;

    const/4 v4, 0x1

    aput-object v2, v5, v4

    const/4 v2, 0x0

    aput-object v11, v5, v2

    .line 2374
    sget-object v2, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v4, 0x95

    aget-byte v6, v2, v4

    int-to-byte v4, v6

    const/4 v6, 0x5

    aget-byte v9, v2, v6

    int-to-byte v6, v9

    invoke-static {v4, v12, v6}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/4 v6, 0x2

    new-array v9, v6, [Ljava/lang/Class;

    move-object/from16 v32, v8

    const/16 v6, 0x95

    aget-byte v8, v2, v6

    int-to-byte v6, v8

    const/4 v8, 0x5

    aget-byte v2, v2, v8

    int-to-byte v2, v2

    invoke-static {v6, v12, v2}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v6, 0x0

    aput-object v2, v9, v6

    const-class v2, Ljava/lang/String;

    const/4 v6, 0x1

    aput-object v2, v9, v6

    invoke-virtual {v4, v9}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_5

    move-object v5, v2

    :goto_20
    move-object/from16 v38, v11

    move-object/from16 v39, v13

    move-object/from16 v4, v31

    goto/16 :goto_22

    :catchall_5
    move-exception v0

    move-object v2, v0

    :try_start_23
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_27

    throw v4

    :cond_27
    throw v2
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_4

    :cond_28
    move-object/from16 v32, v8

    if-nez v7, :cond_2a

    const/4 v4, 0x2

    :try_start_24
    new-array v6, v4, [Ljava/lang/Object;

    const/4 v4, 0x1

    aput-object v2, v6, v4

    const/4 v2, 0x0

    aput-object v11, v6, v2

    .line 2378
    sget-object v2, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v4, 0x95

    aget-byte v7, v2, v4

    int-to-byte v4, v7

    const/4 v7, 0x5

    aget-byte v8, v2, v7

    int-to-byte v7, v8

    invoke-static {v4, v12, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/4 v7, 0x2

    new-array v8, v7, [Ljava/lang/Class;

    const/16 v7, 0x95

    aget-byte v9, v2, v7

    int-to-byte v7, v9

    const/4 v9, 0x5

    aget-byte v2, v2, v9

    int-to-byte v2, v2

    invoke-static {v7, v12, v2}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v7, 0x0

    aput-object v2, v8, v7

    const-class v2, Ljava/lang/String;

    const/4 v7, 0x1

    aput-object v2, v8, v7

    invoke-virtual {v4, v8}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_24
    .catchall {:try_start_24 .. :try_end_24} :catchall_6

    move-object v7, v2

    goto :goto_20

    :catchall_6
    move-exception v0

    move-object v2, v0

    :try_start_25
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_29

    throw v4

    :cond_29
    throw v2
    :try_end_25
    .catchall {:try_start_25 .. :try_end_25} :catchall_4

    :cond_2a
    if-nez v14, :cond_2b

    const/4 v4, 0x1

    goto :goto_21

    :cond_2b
    const/4 v4, 0x0

    :goto_21
    if-eqz v4, :cond_2d

    const/4 v4, 0x2

    :try_start_26
    new-array v6, v4, [Ljava/lang/Object;

    const/4 v4, 0x1

    aput-object v2, v6, v4

    const/4 v2, 0x0

    aput-object v11, v6, v2

    .line 2382
    sget-object v2, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v4, 0x95

    aget-byte v8, v2, v4

    int-to-byte v4, v8

    const/4 v8, 0x5

    aget-byte v9, v2, v8

    int-to-byte v8, v9

    invoke-static {v4, v12, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/4 v8, 0x2

    new-array v9, v8, [Ljava/lang/Class;

    const/16 v8, 0x95

    aget-byte v14, v2, v8

    int-to-byte v8, v14

    const/4 v14, 0x5

    aget-byte v2, v2, v14

    int-to-byte v2, v2

    invoke-static {v8, v12, v2}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v8, 0x0

    aput-object v2, v9, v8

    const-class v2, Ljava/lang/String;

    const/4 v8, 0x1

    aput-object v2, v9, v8

    invoke-virtual {v4, v9}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_26
    .catchall {:try_start_26 .. :try_end_26} :catchall_7

    move-object v14, v2

    goto/16 :goto_20

    :catchall_7
    move-exception v0

    move-object v2, v0

    :try_start_27
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_2c

    throw v4

    :cond_2c
    throw v2
    :try_end_27
    .catchall {:try_start_27 .. :try_end_27} :catchall_4

    :cond_2d
    const/4 v4, 0x2

    :try_start_28
    new-array v6, v4, [Ljava/lang/Object;

    const/4 v4, 0x1

    aput-object v2, v6, v4

    const/4 v2, 0x0

    aput-object v11, v6, v2

    .line 2386
    sget-object v2, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v4, 0x95

    aget-byte v8, v2, v4

    int-to-byte v4, v8

    const/4 v8, 0x5

    aget-byte v9, v2, v8

    int-to-byte v8, v9

    invoke-static {v4, v12, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/4 v8, 0x2

    new-array v9, v8, [Ljava/lang/Class;

    move-object/from16 v36, v5

    const/16 v8, 0x95

    aget-byte v5, v2, v8

    int-to-byte v5, v5

    move-object/from16 v37, v7

    const/4 v8, 0x5

    aget-byte v7, v2, v8

    int-to-byte v7, v7

    invoke-static {v5, v12, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/4 v7, 0x0

    aput-object v5, v9, v7

    const-class v5, Ljava/lang/String;

    const/4 v7, 0x1

    aput-object v5, v9, v7

    invoke-virtual {v4, v9}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4
    :try_end_28
    .catchall {:try_start_28 .. :try_end_28} :catchall_c

    :try_start_29
    new-array v5, v7, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v4, v5, v6

    const/16 v6, 0x95

    .line 2391
    aget-byte v7, v2, v6

    int-to-byte v6, v7

    const/16 v7, 0xe5

    int-to-short v7, v7

    const/16 v8, 0x31

    aget-byte v9, v2, v8

    int-to-byte v8, v9

    invoke-static {v6, v7, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/4 v8, 0x1

    new-array v9, v8, [Ljava/lang/Class;

    move-object/from16 v38, v11

    const/16 v8, 0x95

    aget-byte v11, v2, v8
    :try_end_29
    .catchall {:try_start_29 .. :try_end_29} :catchall_a

    int-to-byte v8, v11

    move-object/from16 v39, v13

    const/4 v11, 0x5

    :try_start_2a
    aget-byte v13, v2, v11

    int-to-byte v11, v13

    invoke-static {v8, v12, v11}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/4 v11, 0x0

    aput-object v8, v9, v11

    invoke-virtual {v6, v9}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_2a
    .catchall {:try_start_2a .. :try_end_2a} :catchall_9

    const/16 v6, 0x95

    :try_start_2b
    aget-byte v8, v2, v6

    int-to-byte v6, v8

    const/16 v8, 0x31

    aget-byte v9, v2, v8

    int-to-byte v8, v9

    invoke-static {v6, v7, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v7, 0x1af

    aget-byte v8, v2, v7

    int-to-byte v7, v8

    const/16 v8, 0x150

    int-to-short v8, v8

    aget-byte v2, v2, v25

    int-to-byte v2, v2

    invoke-static {v7, v8, v2}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    const/4 v7, 0x0

    invoke-virtual {v6, v2, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-virtual {v2, v5, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2b
    .catchall {:try_start_2b .. :try_end_2b} :catchall_8

    move-object/from16 v5, v36

    move-object/from16 v7, v37

    :goto_22
    move-object/from16 v8, v32

    move-object/from16 v2, v33

    move/from16 v6, v34

    move-object/from16 v9, v35

    move-object/from16 v11, v38

    move-object/from16 v13, v39

    goto/16 :goto_18

    :catchall_8
    move-exception v0

    move-object v2, v0

    :try_start_2c
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_2e

    throw v5

    :cond_2e
    throw v2

    :catchall_9
    move-exception v0

    goto :goto_23

    :catchall_a
    move-exception v0

    move-object/from16 v39, v13

    :goto_23
    move-object v2, v0

    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_2f

    throw v5

    :cond_2f
    throw v2
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2c} :catch_6
    .catchall {:try_start_2c .. :try_end_2c} :catchall_12

    :catch_6
    move-exception v0

    move-object v2, v0

    .line 2395
    :try_start_2d
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v7, 0x34

    aget-byte v7, v6, v7

    int-to-byte v7, v7

    xor-int/lit8 v8, v7, 0x48

    and-int/lit8 v9, v7, 0x48

    or-int/2addr v8, v9

    int-to-short v8, v8

    aget-byte v9, v6, v25

    int-to-byte v9, v9

    invoke-static {v7, v8, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget v4, Lcom/appsflyer/internal/e;->onDeepLinking:I

    const/4 v7, 0x3

    sub-int/2addr v4, v7

    const/4 v7, 0x1

    sub-int/2addr v4, v7

    int-to-byte v4, v4

    const/16 v8, 0x2f4

    int-to-short v8, v8

    const/16 v9, 0x19

    aget-byte v9, v6, v9

    sub-int/2addr v9, v7

    int-to-byte v9, v9

    invoke-static {v4, v8, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4
    :try_end_2d
    .catchall {:try_start_2d .. :try_end_2d} :catchall_12

    const/4 v5, 0x2

    :try_start_2e
    new-array v8, v5, [Ljava/lang/Object;

    aput-object v2, v8, v7

    const/4 v2, 0x0

    aput-object v4, v8, v2

    const/16 v2, 0x95

    aget-byte v4, v6, v2

    int-to-byte v2, v4

    const/16 v4, 0xc7

    int-to-short v4, v4

    const/16 v5, 0x40

    aget-byte v6, v6, v5

    int-to-byte v5, v6

    invoke-static {v2, v4, v5}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v4, v5, v6

    const-class v4, Ljava/lang/Throwable;

    const/4 v6, 0x1

    aput-object v4, v5, v6

    invoke-virtual {v2, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    throw v2
    :try_end_2e
    .catchall {:try_start_2e .. :try_end_2e} :catchall_b

    :catchall_b
    move-exception v0

    move-object v2, v0

    :try_start_2f
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_30

    throw v4

    :cond_30
    throw v2

    :catchall_c
    move-exception v0

    move-object/from16 v39, v13

    move-object v2, v0

    .line 2386
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_31

    throw v4

    :cond_31
    throw v2

    :catchall_d
    move-exception v0

    goto :goto_26

    :catchall_e
    move-exception v0

    goto :goto_25

    :cond_32
    move-object/from16 v33, v2

    move-object/from16 v31, v4

    move-object/from16 v36, v5

    move/from16 v34, v6

    move-object/from16 v37, v7

    move-object/from16 v35, v9

    move-object/from16 v39, v13

    move-object/from16 v8, v36

    goto :goto_2a

    :catchall_f
    move-exception v0

    move-object/from16 v33, v2

    goto :goto_25

    :catchall_10
    move-exception v0

    goto :goto_24

    :catchall_11
    move-exception v0

    move-object/from16 v30, v2

    :goto_24
    move-object/from16 v33, v5

    move/from16 v34, v6

    move-object/from16 v35, v9

    move-object/from16 v39, v13

    move-object v2, v0

    .line 2329
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_33

    throw v4

    :cond_33
    throw v2
    :try_end_2f
    .catchall {:try_start_2f .. :try_end_2f} :catchall_12

    :catchall_12
    move-exception v0

    goto :goto_27

    :catchall_13
    move-exception v0

    move-object/from16 v30, v2

    move-object/from16 v33, v5

    :goto_25
    move/from16 v34, v6

    move-object/from16 v35, v9

    :goto_26
    move-object/from16 v39, v13

    :goto_27
    move-object v2, v0

    move/from16 v36, v3

    :goto_28
    move-object/from16 v40, v10

    :goto_29
    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    goto/16 :goto_55

    :cond_34
    move-object/from16 v30, v2

    move-object/from16 v33, v5

    move/from16 v34, v6

    move-object/from16 v35, v9

    move-object/from16 v39, v13

    const/4 v8, 0x0

    const/4 v14, 0x0

    const/16 v31, 0x0

    const/16 v37, 0x0

    :goto_2a
    const/16 v2, 0x1cd6

    :try_start_30
    new-array v2, v2, [B

    .line 2409
    const-class v4, Lcom/appsflyer/internal/e;

    sget-object v5, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v6, 0x99

    aget-byte v6, v5, v6

    int-to-byte v6, v6

    const/16 v7, 0x13c

    int-to-short v7, v7

    const/16 v9, 0xa7

    aget-byte v9, v5, v9

    int-to-byte v9, v9

    invoke-static {v6, v7, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    .line 2410
    invoke-virtual {v4, v6}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4
    :try_end_30
    .catchall {:try_start_30 .. :try_end_30} :catchall_49

    const/4 v6, 0x1

    :try_start_31
    new-array v7, v6, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v4, v7, v6

    const/16 v4, 0x95

    aget-byte v6, v5, v4

    int-to-byte v6, v6

    const/16 v9, 0x21a

    int-to-short v9, v9

    aget-byte v11, v5, v4

    int-to-byte v11, v11

    invoke-static {v6, v9, v11}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/4 v11, 0x1

    new-array v13, v11, [Ljava/lang/Class;

    aget-byte v11, v5, v4

    int-to-byte v4, v11

    move-object/from16 v24, v8

    const/16 v11, 0x2e

    aget-byte v8, v5, v11

    int-to-short v8, v8

    move-object/from16 v32, v14

    const/16 v11, 0x40

    aget-byte v14, v5, v11

    int-to-byte v11, v14

    invoke-static {v4, v8, v11}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/4 v8, 0x0

    aput-object v4, v13, v8

    invoke-virtual {v6, v13}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4
    :try_end_31
    .catchall {:try_start_31 .. :try_end_31} :catchall_48

    const/4 v6, 0x1

    :try_start_32
    new-array v7, v6, [Ljava/lang/Object;

    aput-object v2, v7, v8

    const/16 v6, 0x95

    .line 2411
    aget-byte v8, v5, v6

    int-to-byte v8, v8

    aget-byte v11, v5, v6

    int-to-byte v6, v11

    invoke-static {v8, v9, v6}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v8, 0x15

    aget-byte v8, v5, v8

    int-to-byte v8, v8

    const/16 v11, 0x330

    int-to-short v11, v11

    const/16 v13, 0x87

    aget-byte v13, v5, v13

    int-to-byte v13, v13

    invoke-static {v8, v11, v13}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    const/4 v11, 0x1

    new-array v13, v11, [Ljava/lang/Class;

    const/4 v11, 0x0

    aput-object v1, v13, v11

    invoke-virtual {v6, v8, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v4, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_32
    .catchall {:try_start_32 .. :try_end_32} :catchall_47

    const/16 v6, 0x95

    .line 2412
    :try_start_33
    aget-byte v7, v5, v6

    int-to-byte v7, v7

    aget-byte v8, v5, v6

    int-to-byte v6, v8

    invoke-static {v7, v9, v6}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v7, 0x1af

    aget-byte v8, v5, v7

    int-to-byte v7, v8

    const/16 v8, 0x150

    int-to-short v8, v8

    aget-byte v5, v5, v25

    int-to-byte v5, v5

    invoke-static {v7, v8, v5}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    invoke-virtual {v6, v5, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v4, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_33
    .catchall {:try_start_33 .. :try_end_33} :catchall_46

    const/16 v4, 0x16

    const/16 v5, 0x1ca8

    move-object/from16 v7, v33

    const/4 v6, 0x0

    :goto_2b
    add-int/lit16 v8, v4, 0x173

    const/4 v9, 0x1

    sub-int/2addr v8, v9

    add-int/lit16 v11, v4, 0x1cbf

    .line 2424
    :try_start_34
    aget-byte v11, v2, v11

    or-int/lit8 v13, v11, -0x29

    shl-int/2addr v13, v9

    xor-int/lit8 v9, v11, -0x29

    sub-int/2addr v13, v9

    int-to-byte v9, v13

    aput-byte v9, v2, v8

    .line 2429
    array-length v8, v2
    :try_end_34
    .catchall {:try_start_34 .. :try_end_34} :catchall_49

    neg-int v9, v4

    and-int v11, v8, v9

    or-int/2addr v8, v9

    add-int/2addr v11, v8

    const/4 v8, 0x3

    :try_start_35
    new-array v9, v8, [Ljava/lang/Object;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v11, 0x2

    aput-object v8, v9, v11

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v11, 0x1

    aput-object v8, v9, v11

    const/4 v8, 0x0

    aput-object v2, v9, v8

    sget-object v2, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v8, 0x95

    aget-byte v11, v2, v8

    int-to-byte v8, v11

    const/16 v11, 0x36e

    int-to-short v11, v11

    const/16 v13, 0x16

    aget-byte v13, v2, v13

    int-to-byte v13, v13

    invoke-static {v8, v11, v13}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/4 v11, 0x3

    new-array v13, v11, [Ljava/lang/Class;

    const/4 v11, 0x0

    aput-object v1, v13, v11

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v14, 0x1

    aput-object v11, v13, v14

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v14, 0x2

    aput-object v11, v13, v14

    invoke-virtual {v8, v13}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v41, v8

    check-cast v41, Ljava/io/InputStream;
    :try_end_35
    .catchall {:try_start_35 .. :try_end_35} :catchall_44

    .line 2435
    :try_start_36
    sget-object v8, Lcom/appsflyer/internal/e;->onConversionDataSuccess:Ljava/lang/Object;
    :try_end_36
    .catchall {:try_start_36 .. :try_end_36} :catchall_49

    if-nez v8, :cond_36

    .line 2439
    :try_start_37
    invoke-static {}, Landroid/view/ViewConfiguration;->getKeyRepeatTimeout()I

    move-result v8

    const/16 v9, 0x10

    shr-int/2addr v8, v9

    neg-int v8, v8

    xor-int/lit8 v9, v8, 0x2

    const/4 v11, 0x2

    and-int/2addr v8, v11

    const/4 v11, 0x1

    shl-int/2addr v8, v11

    add-int v46, v9, v8

    const/16 v8, 0x8

    new-array v8, v8, [B

    const/16 v9, 0xf

    const/4 v13, 0x0

    aput-byte v9, v8, v13

    const/16 v9, 0x32

    aput-byte v9, v8, v11

    const/16 v9, 0x12

    const/4 v11, 0x2

    aput-byte v9, v8, v11

    const/16 v9, -0x2c

    const/4 v11, 0x3

    aput-byte v9, v8, v11

    const/16 v9, -0x51

    const/4 v11, 0x4

    aput-byte v9, v8, v11

    const/16 v9, -0x4a

    const/4 v11, 0x5

    aput-byte v9, v8, v11

    const/16 v9, -0x1b

    const/4 v11, 0x6

    aput-byte v9, v8, v11

    const/16 v9, 0x32

    const/4 v11, 0x7

    aput-byte v9, v8, v11
    :try_end_37
    .catchall {:try_start_37 .. :try_end_37} :catchall_16

    const/4 v11, 0x1

    :try_start_38
    new-array v13, v11, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v11

    const/16 v11, 0x3a

    aget-byte v14, v2, v11

    int-to-byte v11, v14

    const/16 v14, 0x3a8

    int-to-short v14, v14

    const/16 v19, 0x3

    aget-byte v9, v2, v19

    int-to-byte v9, v9

    invoke-static {v11, v14, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    const/16 v11, 0x10

    aget-byte v14, v2, v11

    int-to-byte v11, v14

    const/16 v14, 0x14c

    int-to-short v14, v14

    move/from16 v38, v5

    const/16 v29, 0x286

    aget-byte v5, v2, v29

    int-to-byte v5, v5

    invoke-static {v11, v14, v5}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    const/4 v11, 0x1

    new-array v14, v11, [Ljava/lang/Class;

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/16 v27, 0x0

    aput-object v11, v14, v27

    invoke-virtual {v9, v5, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    const/4 v9, 0x0

    invoke-virtual {v5, v9, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5
    :try_end_38
    .catchall {:try_start_38 .. :try_end_38} :catchall_14

    xor-int/lit8 v9, v5, 0x14

    and-int/lit8 v5, v5, 0x14

    const/4 v11, 0x1

    shl-int/2addr v5, v11

    add-int/2addr v9, v5

    const/4 v5, 0x6

    shr-int/2addr v9, v5

    neg-int v9, v9

    const v13, 0x1bbcf15e

    or-int v14, v9, v13

    shl-int/2addr v14, v11

    xor-int/2addr v9, v13

    sub-int/2addr v14, v9

    const/4 v9, 0x2

    :try_start_39
    new-array v11, v9, [I

    move-object v9, v6

    .line 3094
    sget-wide v5, Lcom/appsflyer/internal/e;->onAppOpenAttribution:J
    :try_end_39
    .catchall {:try_start_39 .. :try_end_39} :catchall_16

    const/16 v13, 0x20

    move/from16 v36, v3

    move/from16 v47, v4

    ushr-long v3, v5, v13

    long-to-int v4, v3

    xor-int v3, v4, v14

    const/4 v4, 0x0

    :try_start_3a
    aput v3, v11, v4

    long-to-int v3, v5

    not-int v4, v14

    and-int/2addr v4, v3

    not-int v3, v3

    and-int/2addr v3, v14

    or-int/2addr v3, v4

    const/4 v4, 0x1

    aput v3, v11, v4

    .line 3100
    new-instance v3, Lcom/appsflyer/internal/di;

    sget v44, Lcom/appsflyer/internal/e;->onResponseErrorNative:I

    const/16 v45, 0x0

    move-object/from16 v40, v3

    move-object/from16 v42, v11

    move-object/from16 v43, v8

    invoke-direct/range {v40 .. v46}, Lcom/appsflyer/internal/di;-><init>(Ljava/io/InputStream;[I[BIZI)V

    move-object/from16 v40, v10

    :goto_2c
    const/16 v4, 0x10

    goto/16 :goto_2e

    :catchall_14
    move-exception v0

    move/from16 v36, v3

    move-object v2, v0

    .line 2439
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_35

    throw v3

    :cond_35
    throw v2
    :try_end_3a
    .catchall {:try_start_3a .. :try_end_3a} :catchall_15

    :catchall_15
    move-exception v0

    goto :goto_2d

    :catchall_16
    move-exception v0

    move/from16 v36, v3

    :goto_2d
    move-object v2, v0

    goto/16 :goto_28

    :cond_36
    move/from16 v36, v3

    move/from16 v47, v4

    move/from16 v38, v5

    move-object v9, v6

    const v3, 0x758f3ae4

    :try_start_3b
    const-string v4, ""
    :try_end_3b
    .catchall {:try_start_3b .. :try_end_3b} :catchall_43

    const/4 v5, 0x2

    :try_start_3c
    new-array v6, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 2446
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v13, 0x1

    aput-object v11, v6, v13

    aput-object v4, v6, v5

    const/16 v4, 0x3a

    aget-byte v5, v2, v4

    int-to-byte v4, v5

    const/16 v5, 0xb5

    int-to-short v5, v5

    const/16 v11, 0x94

    aget-byte v11, v2, v11

    int-to-byte v11, v11

    invoke-static {v4, v5, v11}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/16 v5, 0x10

    aget-byte v11, v2, v5

    int-to-byte v5, v11

    const/16 v11, 0x1c8

    int-to-short v11, v11

    const/16 v13, 0x2d

    aget-byte v13, v2, v13

    int-to-byte v13, v13

    invoke-static {v5, v11, v13}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    const/4 v11, 0x2

    new-array v13, v11, [Ljava/lang/Class;

    const-class v11, Ljava/lang/CharSequence;

    const/4 v14, 0x0

    aput-object v11, v13, v14

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v14, 0x1

    aput-object v11, v13, v14

    invoke-virtual {v4, v5, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4
    :try_end_3c
    .catchall {:try_start_3c .. :try_end_3c} :catchall_42

    neg-int v4, v4

    and-int v5, v4, v3

    or-int/2addr v3, v4

    add-int/2addr v5, v3

    :try_start_3d
    invoke-static {}, Landroid/view/ViewConfiguration;->getKeyRepeatTimeout()I

    move-result v3
    :try_end_3d
    .catchall {:try_start_3d .. :try_end_3d} :catchall_43

    const/16 v4, 0x10

    shr-int/2addr v3, v4

    neg-int v3, v3

    not-int v3, v3

    const/4 v4, 0x1

    rsub-int/lit8 v3, v3, 0x1

    sub-int/2addr v3, v4

    const/4 v4, 0x4

    :try_start_3e
    new-array v6, v4, [Ljava/lang/Object;

    const/4 v4, 0x3

    const/4 v11, 0x0

    aput-object v11, v6, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    aput-object v3, v6, v4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v6, v4

    const/4 v3, 0x0

    aput-object v41, v6, v3

    const/16 v3, 0x1af

    aget-byte v4, v2, v3

    int-to-byte v3, v4

    const/16 v4, 0x18e

    aget-byte v4, v2, v4

    neg-int v4, v4

    int-to-short v4, v4

    const/16 v5, 0xa7

    aget-byte v5, v2, v5

    int-to-byte v5, v5

    invoke-static {v3, v4, v5}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/appsflyer/internal/e;->onConversionDataFail:Ljava/lang/Object;

    check-cast v4, Ljava/lang/ClassLoader;

    const/4 v5, 0x1

    invoke-static {v3, v5, v4}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v3

    const/16 v4, 0x1a

    aget-byte v4, v2, v4

    int-to-byte v4, v4

    or-int/lit16 v5, v4, 0x1cc

    int-to-short v5, v5

    const/16 v11, 0xa0

    aget-byte v11, v2, v11

    int-to-byte v11, v11

    invoke-static {v4, v5, v11}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x4

    new-array v11, v5, [Ljava/lang/Class;

    const/16 v5, 0x95

    aget-byte v13, v2, v5

    int-to-byte v5, v13

    const/16 v13, 0x2e

    aget-byte v14, v2, v13
    :try_end_3e
    .catchall {:try_start_3e .. :try_end_3e} :catchall_41

    int-to-short v13, v14

    move-object/from16 v40, v10

    const/16 v14, 0x40

    :try_start_3f
    aget-byte v10, v2, v14

    int-to-byte v10, v10

    invoke-static {v5, v13, v10}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/4 v10, 0x0

    aput-object v5, v11, v10

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v10, 0x1

    aput-object v5, v11, v10

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v10, 0x2

    aput-object v5, v11, v10

    const/4 v5, 0x3

    aput-object v1, v11, v5

    invoke-virtual {v3, v4, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v8, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/InputStream;
    :try_end_3f
    .catchall {:try_start_3f .. :try_end_3f} :catchall_40

    goto/16 :goto_2c

    :goto_2e
    int-to-long v5, v4

    const/4 v4, 0x1

    :try_start_40
    new-array v8, v4, [Ljava/lang/Object;

    .line 2449
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v8, v5

    const/16 v4, 0x95

    aget-byte v5, v2, v4

    int-to-byte v4, v5

    const/16 v5, 0x2e

    aget-byte v6, v2, v5

    int-to-short v5, v6

    const/16 v6, 0x40

    aget-byte v10, v2, v6

    int-to-byte v6, v10

    invoke-static {v4, v5, v6}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/16 v5, 0x2a

    aget-byte v5, v2, v5

    int-to-byte v5, v5

    const/16 v6, 0x1ba

    int-to-short v6, v6

    const/16 v10, 0x1d4

    aget-byte v10, v2, v10

    int-to-byte v10, v10

    invoke-static {v5, v6, v10}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    new-array v10, v6, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const/4 v11, 0x0

    aput-object v6, v10, v11

    invoke-virtual {v4, v5, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v4, v3, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J
    :try_end_40
    .catchall {:try_start_40 .. :try_end_40} :catchall_3f

    if-eqz v15, :cond_4e

    .line 259
    sget v4, Lcom/appsflyer/internal/e;->onResponse:I

    add-int/lit8 v5, v4, 0x2c

    const/4 v6, 0x1

    sub-int/2addr v5, v6

    rem-int/lit16 v6, v5, 0x80

    sput v6, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    const/4 v6, 0x2

    rem-int/2addr v5, v6

    if-eqz v5, :cond_37

    const/4 v5, 0x7

    const/4 v11, 0x7

    goto :goto_2f

    :cond_37
    const/16 v11, 0x1a

    const/4 v5, 0x7

    :goto_2f
    if-eq v11, v5, :cond_38

    .line 2455
    :try_start_41
    sget-object v6, Lcom/appsflyer/internal/e;->onConversionDataSuccess:Ljava/lang/Object;

    if-nez v6, :cond_39

    goto :goto_30

    :cond_38
    sget-object v6, Lcom/appsflyer/internal/e;->onConversionDataSuccess:Ljava/lang/Object;

    const/4 v8, 0x0

    array-length v10, v8
    :try_end_41
    .catchall {:try_start_41 .. :try_end_41} :catchall_29

    if-nez v6, :cond_39

    :goto_30
    add-int/lit8 v4, v4, 0x38

    const/4 v6, 0x1

    sub-int/2addr v4, v6

    .line 259
    rem-int/lit16 v6, v4, 0x80

    sput v6, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    const/4 v6, 0x2

    rem-int/2addr v4, v6

    move-object/from16 v4, v24

    goto :goto_31

    :cond_39
    move-object/from16 v4, v37

    .line 2457
    :goto_31
    :try_start_42
    sget-object v6, Lcom/appsflyer/internal/e;->onConversionDataSuccess:Ljava/lang/Object;
    :try_end_42
    .catchall {:try_start_42 .. :try_end_42} :catchall_29

    if-nez v6, :cond_3a

    move-object/from16 v6, v32

    goto :goto_32

    :cond_3a
    move-object/from16 v6, v31

    :goto_32
    const/4 v8, 0x1

    :try_start_43
    new-array v10, v8, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v4, v10, v8

    const/16 v8, 0x95

    .line 3591
    aget-byte v11, v2, v8

    int-to-byte v8, v11

    const/16 v11, 0xe5

    int-to-short v11, v11

    const/16 v13, 0x31

    aget-byte v14, v2, v13

    int-to-byte v13, v14

    invoke-static {v8, v11, v13}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/4 v13, 0x1

    new-array v14, v13, [Ljava/lang/Class;

    const/16 v13, 0x95

    aget-byte v5, v2, v13

    int-to-byte v5, v5

    const/4 v13, 0x5

    aget-byte v2, v2, v13

    int-to-byte v2, v2

    invoke-static {v5, v12, v2}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v5, 0x0

    aput-object v2, v14, v5

    invoke-virtual {v8, v14}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_43
    .catchall {:try_start_43 .. :try_end_43} :catchall_21

    const/16 v5, 0x400

    :try_start_44
    new-array v8, v5, [B

    move/from16 v10, v38

    :goto_33
    if-lez v10, :cond_3f

    .line 3600
    invoke-static {v5, v10}, Ljava/lang/Math;->min(II)I

    move-result v13
    :try_end_44
    .catchall {:try_start_44 .. :try_end_44} :catchall_22

    const/4 v14, 0x3

    :try_start_45
    new-array v5, v14, [Ljava/lang/Object;

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    const/4 v14, 0x2

    aput-object v13, v5, v14

    const/4 v13, 0x0

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/16 v17, 0x1

    aput-object v14, v5, v17

    aput-object v8, v5, v13

    sget-object v13, Lcom/appsflyer/internal/e;->onResponseError:[B

    move-object/from16 v41, v9

    const/16 v14, 0x95

    aget-byte v9, v13, v14

    int-to-byte v9, v9

    move-object/from16 v42, v7

    const/16 v14, 0x2e

    aget-byte v7, v13, v14

    int-to-short v7, v7

    move/from16 v43, v15

    const/16 v14, 0x40

    aget-byte v15, v13, v14

    int-to-byte v14, v15

    invoke-static {v9, v7, v14}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/16 v9, 0x15

    aget-byte v9, v13, v9

    int-to-byte v9, v9

    or-int/lit16 v14, v9, 0x2f2

    int-to-short v14, v14

    const/16 v15, 0x1d4

    aget-byte v15, v13, v15

    int-to-byte v15, v15

    invoke-static {v9, v14, v15}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v9

    const/4 v14, 0x3

    new-array v15, v14, [Ljava/lang/Class;

    const/4 v14, 0x0

    aput-object v1, v15, v14

    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/16 v17, 0x1

    aput-object v14, v15, v17

    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/16 v26, 0x2

    aput-object v14, v15, v26

    invoke-virtual {v7, v9, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    invoke-virtual {v7, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5
    :try_end_45
    .catchall {:try_start_45 .. :try_end_45} :catchall_18

    const/4 v7, -0x1

    if-eq v5, v7, :cond_40

    .line 2538
    sget v7, Lcom/appsflyer/internal/e;->onResponse:I

    add-int/lit8 v7, v7, 0x75

    rem-int/lit16 v9, v7, 0x80

    sput v9, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    const/4 v9, 0x2

    rem-int/2addr v7, v9

    if-eqz v7, :cond_3b

    const/4 v7, 0x0

    goto :goto_34

    :cond_3b
    const/4 v7, 0x1

    :goto_34
    const/4 v9, 0x1

    if-eq v7, v9, :cond_3c

    const/4 v7, 0x3

    const/16 v17, 0x1

    goto :goto_35

    :cond_3c
    const/4 v7, 0x3

    const/16 v17, 0x0

    :goto_35
    :try_start_46
    new-array v14, v7, [Ljava/lang/Object;

    .line 3603
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v15, 0x2

    aput-object v7, v14, v15

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v14, v9

    const/4 v7, 0x0

    aput-object v8, v14, v7

    const/16 v7, 0x95

    aget-byte v9, v13, v7

    int-to-byte v7, v9

    const/16 v9, 0x31

    aget-byte v15, v13, v9

    int-to-byte v9, v15

    invoke-static {v7, v11, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/16 v9, 0x2e

    aget-byte v15, v13, v9

    int-to-byte v9, v15

    xor-int/lit16 v15, v9, 0x305

    move-object/from16 v44, v8

    and-int/lit16 v8, v9, 0x305

    or-int/2addr v8, v15

    int-to-short v8, v8

    aget-byte v13, v13, v25

    int-to-byte v13, v13

    invoke-static {v9, v8, v13}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    new-array v13, v9, [Ljava/lang/Class;

    const/4 v9, 0x0

    aput-object v1, v13, v9

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v15, 0x1

    aput-object v9, v13, v15

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v15, 0x2

    aput-object v9, v13, v15

    invoke-virtual {v7, v8, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    invoke-virtual {v7, v2, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_46
    .catchall {:try_start_46 .. :try_end_46} :catchall_17

    sub-int/2addr v10, v5

    move-object/from16 v9, v41

    move-object/from16 v7, v42

    move/from16 v15, v43

    move-object/from16 v8, v44

    const/16 v5, 0x400

    goto/16 :goto_33

    :catchall_17
    move-exception v0

    move-object v2, v0

    :try_start_47
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_3d

    throw v3

    :cond_3d
    throw v2

    :catchall_18
    move-exception v0

    move-object v2, v0

    .line 3600
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_3e

    throw v3

    :cond_3e
    throw v2
    :try_end_47
    .catchall {:try_start_47 .. :try_end_47} :catchall_22

    :cond_3f
    move-object/from16 v42, v7

    move-object/from16 v41, v9

    move/from16 v43, v15

    .line 2455
    :cond_40
    sget v3, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    or-int/lit8 v5, v3, 0x41

    const/4 v7, 0x1

    shl-int/2addr v5, v7

    xor-int/lit8 v3, v3, 0x41

    sub-int/2addr v5, v3

    rem-int/lit16 v3, v5, 0x80

    sput v3, Lcom/appsflyer/internal/e;->onResponse:I

    const/4 v3, 0x2

    rem-int/2addr v5, v3

    .line 3609
    :try_start_48
    sget-object v3, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v5, 0x95

    aget-byte v7, v3, v5

    int-to-byte v5, v7

    const/16 v7, 0x31

    aget-byte v8, v3, v7

    int-to-byte v7, v8

    invoke-static {v5, v11, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/16 v7, 0x10

    aget-byte v8, v3, v7

    int-to-byte v7, v8

    or-int/lit16 v8, v7, 0x18b

    int-to-short v8, v8

    aget-byte v9, v3, v25

    int-to-byte v9, v9

    invoke-static {v7, v8, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v2, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_48
    .catchall {:try_start_48 .. :try_end_48} :catchall_20

    .line 2455
    sget v7, Lcom/appsflyer/internal/e;->onResponse:I

    or-int/lit8 v8, v7, 0x4d

    const/4 v9, 0x1

    shl-int/2addr v8, v9

    xor-int/lit8 v9, v7, 0x4d

    sub-int/2addr v8, v9

    rem-int/lit16 v9, v8, 0x80

    sput v9, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    const/4 v9, 0x2

    rem-int/2addr v8, v9

    xor-int/lit8 v8, v7, 0x31

    and-int/lit8 v7, v7, 0x31

    const/4 v9, 0x1

    shl-int/2addr v7, v9

    add-int/2addr v8, v7

    .line 3603
    rem-int/lit16 v7, v8, 0x80

    sput v7, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    const/4 v7, 0x2

    rem-int/2addr v8, v7

    const/16 v7, 0x95

    .line 3609
    :try_start_49
    aget-byte v8, v3, v7

    int-to-byte v7, v8

    const/16 v8, 0x66

    int-to-short v8, v8

    const/16 v9, 0x94

    aget-byte v9, v3, v9

    int-to-byte v9, v9

    invoke-static {v7, v8, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const/16 v8, 0x2a

    aget-byte v8, v3, v8

    int-to-byte v8, v8

    const/16 v9, 0x2aa

    int-to-short v9, v9

    const/16 v10, 0x1d4

    aget-byte v10, v3, v10

    int-to-byte v10, v10

    invoke-static {v8, v9, v10}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    invoke-virtual {v7, v5, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_49
    .catchall {:try_start_49 .. :try_end_49} :catchall_1f

    .line 3603
    sget v5, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    add-int/lit8 v5, v5, 0x79

    rem-int/lit16 v7, v5, 0x80

    sput v7, Lcom/appsflyer/internal/e;->onResponse:I

    const/4 v7, 0x2

    rem-int/2addr v5, v7

    const/16 v5, 0x95

    .line 3610
    :try_start_4a
    aget-byte v7, v3, v5

    int-to-byte v5, v7

    const/16 v7, 0x31

    aget-byte v8, v3, v7

    int-to-byte v7, v8

    invoke-static {v5, v11, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/16 v7, 0x1af

    aget-byte v8, v3, v7

    int-to-byte v7, v8

    const/16 v8, 0x150

    int-to-short v8, v8

    aget-byte v9, v3, v25

    int-to-byte v9, v9

    invoke-static {v7, v8, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v5, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v2, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4a
    .catchall {:try_start_4a .. :try_end_4a} :catchall_1e

    const/16 v2, 0x286

    .line 3622
    :try_start_4b
    aget-byte v5, v3, v2

    int-to-byte v2, v5

    const/16 v5, 0x2f4

    int-to-short v5, v5

    const/16 v7, 0x1d

    aget-byte v8, v3, v7

    int-to-byte v7, v8

    invoke-static {v2, v5, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/16 v5, 0x2c

    .line 3623
    aget-byte v5, v3, v5

    int-to-byte v5, v5

    const/16 v7, 0x204

    int-to-short v7, v7

    const/16 v8, 0x251

    aget-byte v8, v3, v8

    int-to-byte v8, v8

    invoke-static {v5, v7, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x3

    new-array v8, v7, [Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    const/4 v9, 0x0

    aput-object v7, v8, v9

    const-class v7, Ljava/lang/String;

    const/4 v9, 0x1

    aput-object v7, v8, v9

    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v9, 0x2

    aput-object v7, v8, v9

    invoke-virtual {v2, v5, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v5, 0x3

    new-array v7, v5, [Ljava/lang/Object;
    :try_end_4b
    .catchall {:try_start_4b .. :try_end_4b} :catchall_22

    .line 2455
    sget v5, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    or-int/lit8 v8, v5, 0x1d

    const/4 v9, 0x1

    shl-int/2addr v8, v9

    const/16 v9, 0x1d

    xor-int/2addr v5, v9

    sub-int/2addr v8, v5

    rem-int/lit16 v5, v8, 0x80

    sput v5, Lcom/appsflyer/internal/e;->onResponse:I

    const/4 v5, 0x2

    rem-int/2addr v8, v5

    const/16 v5, 0x95

    .line 3627
    :try_start_4c
    aget-byte v8, v3, v5

    int-to-byte v5, v8

    const/4 v8, 0x5

    aget-byte v9, v3, v8

    int-to-byte v8, v9

    invoke-static {v5, v12, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/16 v8, 0x10

    aget-byte v9, v3, v8

    int-to-byte v8, v9

    const/16 v9, 0x10c

    int-to-short v9, v9

    const/16 v10, 0x2d

    aget-byte v10, v3, v10

    int-to-byte v10, v10

    invoke-static {v8, v9, v10}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    const/4 v10, 0x0

    invoke-virtual {v5, v8, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v4, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_4c
    .catchall {:try_start_4c .. :try_end_4c} :catchall_1d

    const/4 v8, 0x0

    :try_start_4d
    aput-object v5, v7, v8
    :try_end_4d
    .catchall {:try_start_4d .. :try_end_4d} :catchall_22

    const/16 v5, 0x95

    :try_start_4e
    aget-byte v8, v3, v5

    int-to-byte v5, v8

    const/4 v8, 0x5

    aget-byte v10, v3, v8

    int-to-byte v8, v10

    invoke-static {v5, v12, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/16 v8, 0x10

    aget-byte v10, v3, v8

    int-to-byte v8, v10

    const/16 v10, 0x2d

    aget-byte v10, v3, v10

    int-to-byte v10, v10

    invoke-static {v8, v9, v10}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v5, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v6, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_4e
    .catchall {:try_start_4e .. :try_end_4e} :catchall_1c

    const/4 v8, 0x1

    :try_start_4f
    aput-object v5, v7, v8

    const/4 v5, 0x0

    .line 3630
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    const/4 v5, 0x2

    aput-object v8, v7, v5

    .line 3627
    invoke-virtual {v2, v9, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_4f
    .catchall {:try_start_4f .. :try_end_4f} :catchall_22

    const/16 v5, 0x95

    .line 3636
    :try_start_50
    aget-byte v7, v3, v5

    int-to-byte v5, v7

    const/4 v7, 0x5

    aget-byte v8, v3, v7

    int-to-byte v7, v8

    invoke-static {v5, v12, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/16 v7, 0x286

    aget-byte v8, v3, v7

    int-to-byte v7, v8

    const/16 v8, 0x1a0

    int-to-short v8, v8

    const/16 v9, 0xa0

    aget-byte v9, v3, v9

    int-to-byte v9, v9

    invoke-static {v7, v8, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x0

    invoke-virtual {v5, v7, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v4, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_50
    .catchall {:try_start_50 .. :try_end_50} :catchall_1b

    .line 259
    sget v4, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    xor-int/lit8 v5, v4, 0xd

    and-int/lit8 v4, v4, 0xd

    const/4 v7, 0x1

    shl-int/2addr v4, v7

    add-int/2addr v5, v4

    rem-int/lit16 v4, v5, 0x80

    sput v4, Lcom/appsflyer/internal/e;->onResponse:I

    const/4 v4, 0x2

    rem-int/2addr v5, v4

    const/16 v4, 0x95

    .line 3637
    :try_start_51
    aget-byte v5, v3, v4

    int-to-byte v4, v5

    const/4 v5, 0x5

    aget-byte v7, v3, v5

    int-to-byte v5, v7

    invoke-static {v4, v12, v5}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/16 v5, 0x286

    aget-byte v7, v3, v5

    int-to-byte v5, v7

    const/16 v7, 0xa0

    aget-byte v7, v3, v7

    int-to-byte v7, v7

    invoke-static {v5, v8, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v4, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_51
    .catchall {:try_start_51 .. :try_end_51} :catchall_1a

    .line 3642
    :try_start_52
    sget-object v4, Lcom/appsflyer/internal/e;->onConversionDataFail:Ljava/lang/Object;

    if-nez v4, :cond_42

    .line 3644
    const-class v4, Lcom/appsflyer/internal/e;
    :try_end_52
    .catchall {:try_start_52 .. :try_end_52} :catchall_29

    :try_start_53
    const-class v5, Ljava/lang/Class;

    const/16 v6, 0x10

    aget-byte v7, v3, v6

    int-to-byte v6, v7

    xor-int/lit16 v7, v6, 0x1a7

    and-int/lit16 v8, v6, 0x1a7

    or-int/2addr v7, v8

    int-to-short v7, v7

    const/16 v8, 0x3a

    aget-byte v3, v3, v8

    int-to-byte v3, v3

    invoke-static {v6, v7, v3}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x0

    invoke-virtual {v5, v3, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v4, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_53
    .catchall {:try_start_53 .. :try_end_53} :catchall_19

    :try_start_54
    sput-object v3, Lcom/appsflyer/internal/e;->onConversionDataFail:Ljava/lang/Object;

    goto :goto_36

    :catchall_19
    move-exception v0

    move-object v2, v0

    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_41

    throw v3

    :cond_41
    throw v2

    :cond_42
    :goto_36
    const/4 v5, 0x3

    const/16 v10, 0x31

    goto/16 :goto_44

    :catchall_1a
    move-exception v0

    move-object v2, v0

    .line 3637
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_43

    throw v3

    :cond_43
    throw v2

    :catchall_1b
    move-exception v0

    move-object v2, v0

    .line 3636
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_44

    throw v3

    :cond_44
    throw v2
    :try_end_54
    .catchall {:try_start_54 .. :try_end_54} :catchall_29

    :catchall_1c
    move-exception v0

    move-object v2, v0

    .line 3627
    :try_start_55
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_45

    throw v3

    :cond_45
    throw v2

    :catchall_1d
    move-exception v0

    move-object v2, v0

    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_46

    throw v3

    :cond_46
    throw v2

    :catchall_1e
    move-exception v0

    move-object v2, v0

    .line 3610
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_47

    throw v3

    :cond_47
    throw v2

    :catchall_1f
    move-exception v0

    move-object v2, v0

    .line 3609
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_48

    throw v3

    :cond_48
    throw v2

    :catchall_20
    move-exception v0

    move-object v2, v0

    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_49

    throw v3

    :cond_49
    throw v2
    :try_end_55
    .catchall {:try_start_55 .. :try_end_55} :catchall_22

    :catchall_21
    move-exception v0

    move-object v2, v0

    .line 3591
    :try_start_56
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_4a

    throw v3

    :cond_4a
    throw v2
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_56 .. :try_end_56} :catch_7
    .catchall {:try_start_56 .. :try_end_56} :catchall_22

    :catchall_22
    move-exception v0

    move-object v2, v0

    const/4 v8, 0x4

    goto/16 :goto_38

    :catch_7
    move-exception v0

    move-object v2, v0

    .line 3595
    :try_start_57
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v7, 0x34

    aget-byte v7, v5, v7

    int-to-byte v7, v7

    xor-int/lit16 v8, v7, 0x24c

    and-int/lit16 v9, v7, 0x24c

    or-int/2addr v8, v9

    int-to-short v8, v8

    aget-byte v9, v5, v25

    int-to-byte v9, v9

    invoke-static {v7, v8, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget v7, Lcom/appsflyer/internal/e;->onDeepLinking:I
    :try_end_57
    .catchall {:try_start_57 .. :try_end_57} :catchall_25

    const/4 v8, 0x4

    sub-int/2addr v7, v8

    int-to-byte v7, v7

    const/16 v9, 0x2f4

    int-to-short v9, v9

    const/16 v10, 0x19

    :try_start_58
    aget-byte v10, v5, v10

    const/4 v11, 0x1

    sub-int/2addr v10, v11

    int-to-byte v10, v10

    invoke-static {v7, v9, v10}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_58
    .catchall {:try_start_58 .. :try_end_58} :catchall_24

    const/4 v7, 0x2

    :try_start_59
    new-array v9, v7, [Ljava/lang/Object;

    aput-object v2, v9, v11

    const/4 v2, 0x0

    aput-object v3, v9, v2

    const/16 v2, 0x95

    aget-byte v3, v5, v2

    int-to-byte v2, v3

    const/16 v3, 0xc7

    int-to-short v3, v3

    const/16 v7, 0x40

    aget-byte v5, v5, v7

    int-to-byte v5, v5

    invoke-static {v2, v3, v5}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x2

    new-array v5, v3, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v3, v5, v7

    const-class v3, Ljava/lang/Throwable;

    const/4 v7, 0x1

    aput-object v3, v5, v7

    invoke-virtual {v2, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    throw v2
    :try_end_59
    .catchall {:try_start_59 .. :try_end_59} :catchall_23

    :catchall_23
    move-exception v0

    move-object v2, v0

    :try_start_5a
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_4b

    throw v3

    :cond_4b
    throw v2
    :try_end_5a
    .catchall {:try_start_5a .. :try_end_5a} :catchall_24

    :catchall_24
    move-exception v0

    goto :goto_37

    :catchall_25
    move-exception v0

    const/4 v8, 0x4

    :goto_37
    move-object v2, v0

    .line 3636
    :goto_38
    :try_start_5b
    sget-object v3, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v5, 0x95

    aget-byte v7, v3, v5

    int-to-byte v5, v7

    const/4 v7, 0x5

    aget-byte v9, v3, v7

    int-to-byte v7, v9

    invoke-static {v5, v12, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/16 v7, 0x286

    aget-byte v9, v3, v7

    int-to-byte v7, v9

    const/16 v9, 0x1a0

    int-to-short v9, v9

    const/16 v10, 0xa0

    aget-byte v10, v3, v10

    int-to-byte v10, v10

    invoke-static {v7, v9, v10}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v7

    const/4 v10, 0x0

    invoke-virtual {v5, v7, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v4, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_5b
    .catchall {:try_start_5b .. :try_end_5b} :catchall_28

    const/16 v4, 0x95

    .line 3637
    :try_start_5c
    aget-byte v5, v3, v4
    :try_end_5c
    .catchall {:try_start_5c .. :try_end_5c} :catchall_27

    int-to-byte v4, v5

    const/4 v5, 0x5

    :try_start_5d
    aget-byte v7, v3, v5

    int-to-byte v7, v7

    invoke-static {v4, v12, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/16 v7, 0x286

    aget-byte v7, v3, v7

    int-to-byte v7, v7

    const/16 v10, 0xa0

    aget-byte v3, v3, v10

    int-to-byte v3, v3

    invoke-static {v7, v9, v3}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v3

    const/4 v7, 0x0

    invoke-virtual {v4, v3, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v6, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_5d
    .catchall {:try_start_5d .. :try_end_5d} :catchall_26

    .line 3638
    :try_start_5e
    throw v2

    :catchall_26
    move-exception v0

    goto :goto_39

    :catchall_27
    move-exception v0

    const/4 v5, 0x5

    :goto_39
    move-object v2, v0

    .line 3637
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_4c

    throw v3

    :cond_4c
    throw v2

    :catchall_28
    move-exception v0

    const/4 v5, 0x5

    move-object v2, v0

    .line 3636
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_4d

    throw v3

    :cond_4d
    throw v2
    :try_end_5e
    .catchall {:try_start_5e .. :try_end_5e} :catchall_29

    :catchall_29
    move-exception v0

    move-object v2, v0

    goto/16 :goto_29

    :cond_4e
    move-object/from16 v42, v7

    move-object/from16 v41, v9

    move/from16 v43, v15

    const/4 v5, 0x5

    const/4 v8, 0x4

    .line 3660
    :try_start_5f
    new-instance v4, Ljava/util/zip/ZipInputStream;

    invoke-direct {v4, v3}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 3661
    invoke-virtual {v4}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v3
    :try_end_5f
    .catchall {:try_start_5f .. :try_end_5f} :catchall_3e

    const/4 v6, 0x1

    :try_start_60
    new-array v7, v6, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v4, v7, v6

    const/16 v4, 0x95

    .line 3663
    aget-byte v6, v2, v4

    int-to-byte v4, v6

    const/16 v6, 0x3e2

    int-to-short v6, v6

    const/16 v9, 0x9

    aget-byte v10, v2, v9

    int-to-byte v9, v10

    invoke-static {v4, v6, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/4 v9, 0x1

    new-array v10, v9, [Ljava/lang/Class;

    const/16 v9, 0x95

    aget-byte v11, v2, v9

    int-to-byte v9, v11

    const/16 v11, 0x2e

    aget-byte v13, v2, v11

    int-to-short v11, v13

    const/16 v13, 0x40

    aget-byte v14, v2, v13

    int-to-byte v13, v14

    invoke-static {v9, v11, v13}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    const/4 v11, 0x0

    aput-object v9, v10, v11

    invoke-virtual {v4, v10}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4
    :try_end_60
    .catchall {:try_start_60 .. :try_end_60} :catchall_3d

    const/16 v7, 0x95

    :try_start_61
    aget-byte v9, v2, v7

    int-to-byte v7, v9

    sget v9, Lcom/appsflyer/internal/e;->onDeepLinking:I

    xor-int/lit16 v10, v9, 0x1ac

    and-int/lit16 v9, v9, 0x1ac

    or-int/2addr v9, v10

    int-to-short v9, v9

    const/16 v10, 0x46

    aget-byte v2, v2, v10

    int-to-byte v2, v2

    invoke-static {v7, v9, v2}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v7, 0x0

    invoke-virtual {v2, v7}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_61
    .catchall {:try_start_61 .. :try_end_61} :catchall_3c

    const/16 v7, 0x400

    :try_start_62
    new-array v7, v7, [B
    :try_end_62
    .catchall {:try_start_62 .. :try_end_62} :catchall_3e

    const/4 v9, 0x0

    .line 259
    :goto_3a
    sget v10, Lcom/appsflyer/internal/e;->onResponse:I

    or-int/lit8 v11, v10, 0xb

    const/4 v13, 0x1

    shl-int/2addr v11, v13

    xor-int/lit8 v10, v10, 0xb

    sub-int/2addr v11, v10

    rem-int/lit16 v10, v11, 0x80

    sput v10, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    const/4 v10, 0x2

    rem-int/2addr v11, v10

    :try_start_63
    new-array v10, v13, [Ljava/lang/Object;

    const/4 v11, 0x0

    aput-object v7, v10, v11

    .line 3669
    sget-object v11, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v13, 0x95

    aget-byte v14, v11, v13

    int-to-byte v13, v14

    const/16 v14, 0x9

    aget-byte v15, v11, v14

    int-to-byte v14, v15

    invoke-static {v13, v6, v14}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v13

    const/16 v14, 0x15

    aget-byte v14, v11, v14

    int-to-byte v14, v14

    xor-int/lit16 v15, v14, 0x2f2

    and-int/lit16 v5, v14, 0x2f2

    or-int/2addr v5, v15

    int-to-short v5, v5

    const/16 v15, 0x1d4

    aget-byte v15, v11, v15

    int-to-byte v15, v15

    invoke-static {v14, v5, v15}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    const/4 v14, 0x1

    new-array v15, v14, [Ljava/lang/Class;

    const/4 v14, 0x0

    aput-object v1, v15, v14

    invoke-virtual {v13, v5, v15}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v4, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5
    :try_end_63
    .catchall {:try_start_63 .. :try_end_63} :catchall_3b

    if-lez v5, :cond_4f

    const/4 v10, 0x0

    goto :goto_3b

    :cond_4f
    const/4 v10, 0x1

    :goto_3b
    if-eqz v10, :cond_50

    goto :goto_3c

    :cond_50
    int-to-long v13, v9

    .line 3670
    :try_start_64
    invoke-virtual {v3}, Ljava/util/zip/ZipEntry;->getSize()J

    move-result-wide v44
    :try_end_64
    .catchall {:try_start_64 .. :try_end_64} :catchall_3e

    cmp-long v10, v13, v44

    if-gez v10, :cond_52

    const/4 v10, 0x3

    :try_start_65
    new-array v13, v10, [Ljava/lang/Object;

    .line 3672
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/4 v14, 0x2

    aput-object v10, v13, v14

    const/4 v10, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    const/4 v15, 0x1

    aput-object v14, v13, v15

    aput-object v7, v13, v10

    const/16 v10, 0x95

    aget-byte v14, v11, v10

    int-to-byte v10, v14

    sget v14, Lcom/appsflyer/internal/e;->onDeepLinking:I

    xor-int/lit16 v15, v14, 0x1ac

    and-int/lit16 v14, v14, 0x1ac

    or-int/2addr v14, v15

    int-to-short v14, v14

    const/16 v15, 0x46

    aget-byte v15, v11, v15

    int-to-byte v15, v15

    invoke-static {v10, v14, v15}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    const/16 v14, 0x2e

    aget-byte v15, v11, v14

    int-to-byte v14, v15

    xor-int/lit16 v15, v14, 0x305

    and-int/lit16 v8, v14, 0x305

    or-int/2addr v8, v15

    int-to-short v8, v8

    aget-byte v11, v11, v25

    int-to-byte v11, v11

    invoke-static {v14, v8, v11}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    const/4 v11, 0x3

    new-array v14, v11, [Ljava/lang/Class;

    const/4 v11, 0x0

    aput-object v1, v14, v11

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v15, 0x1

    aput-object v11, v14, v15

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v15, 0x2

    aput-object v11, v14, v15

    invoke-virtual {v10, v8, v14}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    invoke-virtual {v8, v2, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_65
    .catchall {:try_start_65 .. :try_end_65} :catchall_2a

    and-int v8, v9, v5

    or-int/2addr v5, v9

    add-int v9, v8, v5

    const/4 v5, 0x5

    const/4 v8, 0x4

    goto/16 :goto_3a

    :catchall_2a
    move-exception v0

    move-object v2, v0

    :try_start_66
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_51

    throw v3

    :cond_51
    throw v2
    :try_end_66
    .catchall {:try_start_66 .. :try_end_66} :catchall_29

    .line 259
    :cond_52
    :goto_3c
    sget v3, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    and-int/lit8 v5, v3, 0x1d

    const/16 v7, 0x1d

    or-int/2addr v3, v7

    add-int/2addr v5, v3

    rem-int/lit16 v3, v5, 0x80

    sput v3, Lcom/appsflyer/internal/e;->onResponse:I

    const/4 v3, 0x2

    rem-int/2addr v5, v3

    const/16 v3, 0x95

    .line 3675
    :try_start_67
    aget-byte v5, v11, v3

    int-to-byte v3, v5

    sget v5, Lcom/appsflyer/internal/e;->onDeepLinking:I

    xor-int/lit16 v7, v5, 0x1ac

    and-int/lit16 v8, v5, 0x1ac

    or-int/2addr v7, v8

    int-to-short v7, v7

    const/16 v8, 0x46

    aget-byte v8, v11, v8

    int-to-byte v8, v8

    invoke-static {v3, v7, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const/16 v7, 0xe

    aget-byte v7, v11, v7

    int-to-byte v7, v7

    or-int/lit8 v8, v5, -0x1

    const/4 v9, 0x1

    shl-int/2addr v8, v9

    xor-int/lit8 v5, v5, -0x1

    sub-int/2addr v8, v5

    int-to-short v5, v8

    const/16 v8, 0xff

    aget-byte v8, v11, v8

    int-to-byte v8, v8

    invoke-static {v7, v5, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    invoke-virtual {v3, v5, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    invoke-virtual {v3, v2, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_67
    .catchall {:try_start_67 .. :try_end_67} :catchall_3a

    const/16 v5, 0x95

    .line 3679
    :try_start_68
    aget-byte v7, v11, v5

    int-to-byte v5, v7

    const/16 v7, 0x9

    aget-byte v8, v11, v7

    int-to-byte v7, v8

    invoke-static {v5, v6, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/16 v6, 0x1af

    aget-byte v7, v11, v6

    int-to-byte v6, v7

    const/16 v7, 0x150

    int-to-short v7, v7

    aget-byte v8, v11, v25

    int-to-byte v8, v8

    invoke-static {v6, v7, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    invoke-virtual {v5, v4, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_68
    .catchall {:try_start_68 .. :try_end_68} :catchall_2b

    goto :goto_3d

    :catchall_2b
    move-exception v0

    move-object v4, v0

    :try_start_69
    invoke-virtual {v4}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_53

    throw v5

    :cond_53
    throw v4
    :try_end_69
    .catch Ljava/io/IOException; {:try_start_69 .. :try_end_69} :catch_8
    .catchall {:try_start_69 .. :try_end_69} :catchall_29

    .line 3685
    :catch_8
    :goto_3d
    :try_start_6a
    sget-object v4, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v5, 0x95

    aget-byte v6, v4, v5

    int-to-byte v5, v6

    sget v6, Lcom/appsflyer/internal/e;->onDeepLinking:I

    xor-int/lit16 v7, v6, 0x1ac

    and-int/lit16 v6, v6, 0x1ac

    or-int/2addr v6, v7

    int-to-short v6, v6

    const/16 v7, 0x46

    aget-byte v7, v4, v7

    int-to-byte v7, v7

    invoke-static {v5, v6, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/16 v6, 0x1af

    aget-byte v7, v4, v6

    int-to-byte v6, v7

    const/16 v7, 0x150

    int-to-short v7, v7

    aget-byte v4, v4, v25

    int-to-byte v4, v4

    invoke-static {v6, v7, v4}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    invoke-virtual {v5, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v4, v2, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6a
    .catchall {:try_start_6a .. :try_end_6a} :catchall_2c

    goto :goto_3e

    :catchall_2c
    move-exception v0

    move-object v2, v0

    :try_start_6b
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_54

    throw v4

    :cond_54
    throw v2
    :try_end_6b
    .catch Ljava/io/IOException; {:try_start_6b .. :try_end_6b} :catch_9
    .catchall {:try_start_6b .. :try_end_6b} :catchall_29

    .line 3689
    :catch_9
    :goto_3e
    :try_start_6c
    const-class v2, Lcom/appsflyer/internal/e;
    :try_end_6c
    .catchall {:try_start_6c .. :try_end_6c} :catchall_3e

    :try_start_6d
    const-class v4, Ljava/lang/Class;

    sget-object v5, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v6, 0x10

    aget-byte v7, v5, v6

    int-to-byte v6, v7

    or-int/lit16 v7, v6, 0x1a7

    int-to-short v7, v7

    const/16 v8, 0x3a

    aget-byte v9, v5, v8

    int-to-byte v8, v9

    invoke-static {v6, v7, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v4, v2, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_6d
    .catchall {:try_start_6d .. :try_end_6d} :catchall_39

    const/16 v4, 0x286

    .line 3694
    :try_start_6e
    aget-byte v6, v5, v4

    int-to-byte v4, v6

    or-int/lit16 v6, v4, 0x340

    int-to-short v6, v6

    const/16 v7, 0x2e

    aget-byte v8, v5, v7

    int-to-byte v7, v8

    invoke-static {v4, v6, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/4 v6, 0x2

    new-array v7, v6, [Ljava/lang/Class;

    const/16 v6, 0x95

    .line 3695
    aget-byte v8, v5, v6

    int-to-byte v6, v8

    const/16 v8, 0x397

    int-to-short v8, v8

    const/16 v9, 0x40

    aget-byte v10, v5, v9

    int-to-byte v9, v10

    invoke-static {v6, v8, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/4 v9, 0x0

    aput-object v6, v7, v9

    const/16 v6, 0x95

    aget-byte v9, v5, v6

    int-to-byte v6, v9

    sget v9, Lcom/appsflyer/internal/e;->onDeepLinking:I

    xor-int/lit16 v10, v9, 0x224

    and-int/lit16 v9, v9, 0x224

    or-int/2addr v9, v10

    int-to-short v9, v9

    const/16 v10, 0x1d

    aget-byte v11, v5, v10

    int-to-byte v10, v11

    invoke-static {v6, v9, v10}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/4 v9, 0x1

    aput-object v6, v7, v9

    invoke-virtual {v4, v7}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v4

    const/4 v6, 0x2

    new-array v7, v6, [Ljava/lang/Object;
    :try_end_6e
    .catchall {:try_start_6e .. :try_end_6e} :catchall_3e

    .line 259
    sget v6, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    xor-int/lit8 v10, v6, 0x9

    const/16 v11, 0x9

    and-int/2addr v6, v11

    shl-int/2addr v6, v9

    add-int/2addr v10, v6

    rem-int/lit16 v6, v10, 0x80

    sput v6, Lcom/appsflyer/internal/e;->onResponse:I

    const/4 v6, 0x2

    rem-int/2addr v10, v6

    :try_start_6f
    new-array v6, v9, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v3, v6, v9

    const/16 v3, 0x95

    .line 3697
    aget-byte v9, v5, v3

    int-to-byte v3, v9

    const/16 v9, 0x40

    aget-byte v10, v5, v9

    int-to-byte v9, v10

    invoke-static {v3, v8, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const/16 v8, 0x2e

    aget-byte v9, v5, v8

    int-to-byte v8, v9

    const/16 v9, 0x20e

    aget-byte v9, v5, v9

    int-to-short v9, v9

    const/16 v10, 0x1d4

    aget-byte v10, v5, v10

    int-to-byte v10, v10

    invoke-static {v8, v9, v10}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    new-array v10, v9, [Ljava/lang/Class;

    const/4 v11, 0x0

    aput-object v1, v10, v11

    invoke-virtual {v3, v8, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    const/4 v8, 0x0

    invoke-virtual {v3, v8, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_6f
    .catchall {:try_start_6f .. :try_end_6f} :catchall_38

    :try_start_70
    aput-object v3, v7, v11

    aput-object v2, v7, v9

    invoke-virtual {v4, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_70
    .catchall {:try_start_70 .. :try_end_70} :catchall_3e

    const/16 v4, 0x286

    .line 3710
    :try_start_71
    aget-byte v6, v5, v4

    int-to-byte v4, v6

    xor-int/lit16 v6, v4, 0x2c4

    and-int/lit16 v7, v4, 0x2c4

    or-int/2addr v6, v7

    int-to-short v6, v6

    const/16 v7, 0x2a

    aget-byte v7, v5, v7

    int-to-byte v7, v7

    invoke-static {v4, v6, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/16 v6, 0x46

    .line 3711
    aget-byte v6, v5, v6

    int-to-byte v6, v6

    const/16 v7, 0xa0

    int-to-short v7, v7

    const/16 v8, 0x341

    aget-byte v8, v5, v8

    neg-int v8, v8

    int-to-byte v8, v8

    invoke-static {v6, v7, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    const/4 v6, 0x1

    .line 3712
    invoke-virtual {v4, v6}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 3714
    invoke-virtual {v4, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 3715
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const/16 v8, 0x9

    .line 3717
    aget-byte v9, v5, v8

    int-to-byte v8, v9

    const/16 v9, 0xb

    aget-byte v9, v5, v9

    int-to-short v9, v9

    const/16 v10, 0x31

    aget-byte v11, v5, v10

    int-to-byte v11, v11

    invoke-static {v8, v9, v11}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    const/4 v9, 0x1

    .line 3718
    invoke-virtual {v8, v9}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/16 v9, 0x9

    .line 3720
    aget-byte v11, v5, v9

    int-to-byte v9, v11

    const/16 v11, 0x168

    int-to-short v11, v11

    const/16 v13, 0x2c

    aget-byte v5, v5, v13

    int-to-byte v5, v5

    invoke-static {v9, v11, v5}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    const/4 v7, 0x1

    .line 3721
    invoke-virtual {v5, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 3723
    invoke-virtual {v8, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 3724
    invoke-virtual {v5, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .line 3726
    invoke-virtual {v4, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 3729
    new-instance v9, Ljava/util/ArrayList;

    check-cast v7, Ljava/util/List;

    invoke-direct {v9, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 3731
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    .line 3732
    invoke-virtual {v7}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v7

    .line 3734
    invoke-static {v6}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v11

    .line 3735
    invoke-static {v7, v11}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v7
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_71 .. :try_end_71} :catch_d
    .catchall {:try_start_71 .. :try_end_71} :catchall_3e

    const/4 v13, 0x0

    :goto_3f
    if-ge v13, v11, :cond_55

    .line 3738
    :try_start_72
    invoke-static {v6, v13}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v14

    invoke-static {v7, v13, v14}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_72 .. :try_end_72} :catch_a
    .catchall {:try_start_72 .. :try_end_72} :catchall_29

    add-int/lit8 v13, v13, 0x2

    const/4 v14, 0x1

    sub-int/2addr v13, v14

    goto :goto_3f

    :catch_a
    move-exception v0

    move-object v3, v0

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    goto/16 :goto_50

    .line 3741
    :cond_55
    :try_start_73
    invoke-virtual {v8, v4, v9}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 3742
    invoke-virtual {v5, v4, v7}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_73
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_73} :catch_d
    .catchall {:try_start_73 .. :try_end_73} :catchall_3e

    .line 275
    sget v2, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    xor-int/lit8 v4, v2, 0x3

    const/4 v5, 0x3

    and-int/2addr v2, v5

    const/4 v6, 0x1

    shl-int/2addr v2, v6

    add-int/2addr v4, v2

    rem-int/lit16 v2, v4, 0x80

    sput v2, Lcom/appsflyer/internal/e;->onResponse:I

    const/4 v2, 0x2

    rem-int/2addr v4, v2

    if-nez v4, :cond_56

    const/16 v2, 0x5b

    goto :goto_40

    :cond_56
    const/16 v2, 0x28

    :goto_40
    const/16 v4, 0x28

    if-eq v2, v4, :cond_58

    .line 3752
    :try_start_74
    sget-object v2, Lcom/appsflyer/internal/e;->onConversionDataFail:Ljava/lang/Object;

    const/4 v4, 0x0

    array-length v6, v4
    :try_end_74
    .catchall {:try_start_74 .. :try_end_74} :catchall_29

    if-nez v2, :cond_57

    const/4 v2, 0x1

    goto :goto_41

    :cond_57
    const/4 v2, 0x0

    :goto_41
    const/4 v4, 0x1

    if-eq v2, v4, :cond_5a

    goto :goto_43

    :cond_58
    :try_start_75
    sget-object v2, Lcom/appsflyer/internal/e;->onConversionDataFail:Ljava/lang/Object;

    if-nez v2, :cond_59

    const/4 v2, 0x0

    goto :goto_42

    :cond_59
    const/4 v2, 0x1

    :goto_42
    if-eqz v2, :cond_5a

    goto :goto_43

    .line 3754
    :cond_5a
    sput-object v3, Lcom/appsflyer/internal/e;->onConversionDataFail:Ljava/lang/Object;
    :try_end_75
    .catchall {:try_start_75 .. :try_end_75} :catchall_3e

    :goto_43
    move-object v2, v3

    :goto_44
    if-eqz v43, :cond_5e

    .line 2474
    :try_start_76
    sget-object v3, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v4, 0x286

    aget-byte v6, v3, v4

    int-to-byte v6, v6

    const/16 v7, 0x2f4

    int-to-short v7, v7

    const/16 v8, 0x1d

    aget-byte v9, v3, v8

    int-to-byte v8, v9

    invoke-static {v6, v7, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v7, 0x2c

    .line 2475
    aget-byte v7, v3, v7

    int-to-byte v7, v7

    const/4 v8, 0x0

    aget-byte v9, v3, v8

    int-to-short v8, v9

    const/16 v9, 0x87

    aget-byte v9, v3, v9

    int-to-byte v9, v9

    invoke-static {v7, v8, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x2

    new-array v9, v8, [Ljava/lang/Class;

    const-class v8, Ljava/lang/String;

    const/4 v11, 0x0

    aput-object v8, v9, v11

    const/16 v8, 0x95

    aget-byte v11, v3, v8

    int-to-byte v8, v11

    sget v11, Lcom/appsflyer/internal/e;->onDeepLinking:I

    xor-int/lit16 v13, v11, 0x224

    and-int/lit16 v11, v11, 0x224

    or-int/2addr v11, v13

    int-to-short v11, v11

    const/16 v13, 0x1d

    aget-byte v14, v3, v13

    int-to-byte v13, v14

    invoke-static {v8, v11, v13}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/4 v11, 0x1

    aput-object v8, v9, v11

    invoke-virtual {v6, v7, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    const/4 v8, 0x2

    new-array v9, v8, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v42, v9, v8

    .line 2478
    const-class v8, Lcom/appsflyer/internal/e;
    :try_end_76
    .catchall {:try_start_76 .. :try_end_76} :catchall_30

    :try_start_77
    const-class v11, Ljava/lang/Class;
    :try_end_77
    .catchall {:try_start_77 .. :try_end_77} :catchall_2f

    const/16 v13, 0x10

    :try_start_78
    aget-byte v14, v3, v13
    :try_end_78
    .catchall {:try_start_78 .. :try_end_78} :catchall_2e

    int-to-byte v14, v14

    xor-int/lit16 v15, v14, 0x1a7

    and-int/lit16 v4, v14, 0x1a7

    or-int/2addr v4, v15

    int-to-short v4, v4

    const/16 v15, 0x3a

    :try_start_79
    aget-byte v5, v3, v15

    int-to-byte v5, v5

    invoke-static {v14, v4, v5}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v11, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v4, v8, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4
    :try_end_79
    .catchall {:try_start_79 .. :try_end_79} :catchall_2d

    const/4 v5, 0x1

    :try_start_7a
    aput-object v4, v9, v5

    invoke-virtual {v7, v2, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_5b

    const/4 v5, 0x0

    goto :goto_45

    :cond_5b
    const/16 v5, 0x62

    :goto_45
    if-eqz v5, :cond_5c

    goto :goto_46

    :cond_5c
    const/16 v5, 0x1af

    .line 2489
    aget-byte v7, v3, v5

    int-to-byte v5, v7

    const/16 v7, 0x150

    int-to-short v7, v7

    aget-byte v3, v3, v25

    int-to-byte v3, v3

    invoke-static {v5, v7, v3}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    new-array v7, v5, [Ljava/lang/Class;

    invoke-virtual {v6, v3, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v6, v5, [Ljava/lang/Object;

    .line 2490
    invoke-virtual {v3, v2, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    :goto_46
    move-object v3, v4

    const/16 v6, 0x1d

    goto/16 :goto_4a

    :catchall_2d
    move-exception v0

    goto :goto_48

    :catchall_2e
    move-exception v0

    goto :goto_47

    :catchall_2f
    move-exception v0

    const/16 v13, 0x10

    :goto_47
    const/16 v15, 0x3a

    :goto_48
    move-object v2, v0

    .line 2478
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_5d

    throw v3

    :cond_5d
    throw v2
    :try_end_7a
    .catchall {:try_start_7a .. :try_end_7a} :catchall_31

    :catchall_30
    move-exception v0

    const/16 v13, 0x10

    const/16 v15, 0x3a

    :goto_49
    move-object v2, v0

    const/16 v8, 0x1af

    goto/16 :goto_55

    :cond_5e
    const/16 v13, 0x10

    const/16 v15, 0x3a

    .line 2497
    :try_start_7b
    sget-object v3, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v4, 0x95

    aget-byte v5, v3, v4

    int-to-byte v4, v5

    sget v5, Lcom/appsflyer/internal/e;->onDeepLinking:I

    xor-int/lit16 v6, v5, 0x224

    and-int/lit16 v5, v5, 0x224

    or-int/2addr v5, v6

    int-to-short v5, v5

    const/16 v6, 0x1d

    aget-byte v7, v3, v6

    int-to-byte v7, v7

    invoke-static {v4, v5, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const/16 v5, 0x2c

    .line 2498
    aget-byte v5, v3, v5

    int-to-byte v5, v5

    const/4 v7, 0x0

    aget-byte v8, v3, v7

    int-to-short v7, v8

    const/16 v8, 0x87

    aget-byte v3, v3, v8

    int-to-byte v3, v3

    invoke-static {v5, v7, v3}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    new-array v7, v5, [Ljava/lang/Class;

    const-class v8, Ljava/lang/String;

    const/4 v9, 0x0

    aput-object v8, v7, v9

    invoke-virtual {v4, v3, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3
    :try_end_7b
    .catchall {:try_start_7b .. :try_end_7b} :catchall_36

    :try_start_7c
    new-array v4, v5, [Ljava/lang/Object;

    aput-object v42, v4, v9

    .line 2502
    invoke-virtual {v3, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_7c
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_7c .. :try_end_7c} :catch_b
    .catchall {:try_start_7c .. :try_end_7c} :catchall_31

    goto :goto_4a

    :catchall_31
    move-exception v0

    goto :goto_49

    :catch_b
    move-exception v0

    move-object v3, v0

    .line 2509
    :try_start_7d
    invoke-virtual {v3}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    check-cast v3, Ljava/lang/Exception;

    throw v3
    :try_end_7d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_7d .. :try_end_7d} :catch_c
    .catchall {:try_start_7d .. :try_end_7d} :catchall_31

    :catch_c
    const/4 v3, 0x0

    :goto_4a
    if-eqz v3, :cond_5f

    const/4 v4, 0x0

    goto :goto_4b

    :cond_5f
    const/4 v4, 0x1

    :goto_4b
    if-eqz v4, :cond_61

    const/4 v4, 0x2

    :try_start_7e
    new-array v3, v4, [Ljava/lang/Class;

    .line 2556
    const-class v4, Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x1

    aput-object v4, v3, v5

    move-object/from16 v4, v41

    .line 2557
    invoke-virtual {v4, v3}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v3

    .line 2558
    invoke-virtual {v3, v5}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v2, v5, v4
    :try_end_7e
    .catchall {:try_start_7e .. :try_end_7e} :catchall_31

    if-nez v43, :cond_60

    .line 259
    sget v2, Lcom/appsflyer/internal/e;->onResponse:I

    xor-int/lit8 v4, v2, 0x37

    and-int/lit8 v2, v2, 0x37

    const/4 v7, 0x1

    shl-int/2addr v2, v7

    add-int/2addr v4, v2

    rem-int/lit16 v2, v4, 0x80

    sput v2, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    const/4 v2, 0x2

    rem-int/2addr v4, v2

    const/4 v2, 0x1

    goto :goto_4c

    :cond_60
    const/4 v2, 0x0

    .line 2559
    :goto_4c
    :try_start_7f
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v5, v4

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    sput-object v2, Lcom/appsflyer/internal/e;->onConversionDataSuccess:Ljava/lang/Object;
    :try_end_7f
    .catchall {:try_start_7f .. :try_end_7f} :catchall_31

    const/16 v2, 0x95

    const/4 v3, 0x2

    const/16 v4, 0x9

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v8, 0x1af

    const/16 v34, 0x1

    goto/16 :goto_5c

    .line 2520
    :cond_61
    :try_start_80
    check-cast v3, Ljava/lang/Class;

    .line 2525
    sget-object v4, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v5, 0x1af

    aget-byte v7, v4, v5

    int-to-byte v5, v7

    const/16 v7, 0x181

    int-to-short v7, v7

    const/16 v8, 0xa7

    aget-byte v8, v4, v8

    int-to-byte v8, v8

    invoke-static {v5, v7, v8}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v7

    const/4 v5, 0x2

    new-array v8, v5, [Ljava/lang/Class;

    .line 2530
    const-class v5, Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v5, v8, v9

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v9, 0x1

    aput-object v5, v8, v9

    .line 2531
    invoke-virtual {v3, v8}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    .line 2532
    invoke-virtual {v5, v9}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    const/4 v8, 0x2

    new-array v9, v8, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v2, v9, v8

    if-nez v43, :cond_62

    const/16 v2, 0x4c

    goto :goto_4d

    :cond_62
    const/16 v2, 0x22

    :goto_4d
    const/16 v8, 0x22

    if-eq v2, v8, :cond_63

    const/4 v2, 0x1

    goto :goto_4e

    :cond_63
    const/4 v2, 0x0

    .line 2533
    :goto_4e
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const/4 v8, 0x1

    aput-object v2, v9, v8

    invoke-virtual {v5, v9}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    sput-object v2, Lcom/appsflyer/internal/e;->onConversionDataSuccess:Ljava/lang/Object;

    const/16 v2, 0x32a6

    new-array v2, v2, [B

    .line 2543
    const-class v8, Lcom/appsflyer/internal/e;

    const/16 v9, 0x99

    aget-byte v9, v4, v9

    int-to-byte v9, v9

    const/16 v11, 0x233

    int-to-short v11, v11

    const/16 v14, 0xa7

    aget-byte v14, v4, v14

    int-to-byte v14, v14

    invoke-static {v9, v11, v14}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v9

    .line 2544
    invoke-virtual {v8, v9}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v8
    :try_end_80
    .catchall {:try_start_80 .. :try_end_80} :catchall_36

    const/4 v9, 0x1

    :try_start_81
    new-array v11, v9, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v8, v11, v9

    const/16 v8, 0x95

    aget-byte v9, v4, v8

    int-to-byte v9, v9

    const/16 v14, 0x21a

    int-to-short v14, v14

    aget-byte v5, v4, v8

    int-to-byte v5, v5

    invoke-static {v9, v14, v5}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/4 v9, 0x1

    new-array v6, v9, [Ljava/lang/Class;

    aget-byte v9, v4, v8

    int-to-byte v8, v9

    const/16 v9, 0x2e

    aget-byte v10, v4, v9

    int-to-short v10, v10

    const/16 v21, 0x40

    aget-byte v9, v4, v21

    int-to-byte v9, v9

    invoke-static {v8, v10, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v6, v9

    invoke-virtual {v5, v6}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    invoke-virtual {v5, v11}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5
    :try_end_81
    .catchall {:try_start_81 .. :try_end_81} :catchall_35

    const/4 v6, 0x1

    :try_start_82
    new-array v8, v6, [Ljava/lang/Object;

    aput-object v2, v8, v9

    const/16 v6, 0x95

    .line 2546
    aget-byte v9, v4, v6

    int-to-byte v9, v9

    aget-byte v10, v4, v6

    int-to-byte v6, v10

    invoke-static {v9, v14, v6}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/16 v9, 0x15

    aget-byte v9, v4, v9

    int-to-byte v9, v9

    const/16 v10, 0x330

    int-to-short v10, v10

    const/16 v11, 0x87

    aget-byte v11, v4, v11

    int-to-byte v11, v11

    invoke-static {v9, v10, v11}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    new-array v11, v10, [Ljava/lang/Class;

    const/4 v10, 0x0

    aput-object v1, v11, v10

    invoke-virtual {v6, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    invoke-virtual {v6, v5, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_82
    .catchall {:try_start_82 .. :try_end_82} :catchall_34

    const/16 v6, 0x95

    .line 2547
    :try_start_83
    aget-byte v8, v4, v6

    int-to-byte v8, v8

    aget-byte v9, v4, v6

    int-to-byte v6, v9

    invoke-static {v8, v14, v6}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6
    :try_end_83
    .catchall {:try_start_83 .. :try_end_83} :catchall_33

    const/16 v8, 0x1af

    :try_start_84
    aget-byte v9, v4, v8

    int-to-byte v9, v9

    const/16 v10, 0x150

    int-to-short v10, v10

    aget-byte v4, v4, v25

    int-to-byte v4, v4

    invoke-static {v9, v10, v4}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x0

    invoke-virtual {v6, v4, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    invoke-virtual {v4, v5, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_84
    .catchall {:try_start_84 .. :try_end_84} :catchall_32

    .line 2551
    :try_start_85
    invoke-static/range {v47 .. v47}, Ljava/lang/Math;->abs(I)I

    move-result v4

    move-object v6, v3

    move/from16 v3, v36

    move-object/from16 v10, v40

    move/from16 v15, v43

    const/16 v5, 0x327d

    goto/16 :goto_2b

    :catchall_32
    move-exception v0

    goto :goto_4f

    :catchall_33
    move-exception v0

    const/16 v8, 0x1af

    :goto_4f
    move-object v2, v0

    .line 2547
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_64

    throw v3

    :cond_64
    throw v2

    :catchall_34
    move-exception v0

    const/16 v8, 0x1af

    move-object v2, v0

    .line 2546
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_65

    throw v3

    :cond_65
    throw v2

    :catchall_35
    move-exception v0

    const/16 v8, 0x1af

    move-object v2, v0

    .line 2544
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_66

    throw v3

    :cond_66
    throw v2

    :catchall_36
    move-exception v0

    const/16 v8, 0x1af

    goto/16 :goto_54

    :catch_d
    move-exception v0

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v3, v0

    .line 3748
    :goto_50
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v6, 0x34

    aget-byte v6, v5, v6

    int-to-byte v6, v6

    or-int/lit16 v7, v6, 0x248

    int-to-short v7, v7

    aget-byte v9, v5, v25

    int-to-byte v9, v9

    invoke-static {v6, v7, v9}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget v2, Lcom/appsflyer/internal/e;->onDeepLinking:I

    or-int/lit8 v6, v2, -0x4

    const/4 v7, 0x1

    shl-int/2addr v6, v7

    xor-int/lit8 v2, v2, -0x4

    sub-int/2addr v6, v2

    int-to-byte v2, v6

    const/16 v6, 0x2f4

    int-to-short v6, v6

    const/16 v7, 0x19

    aget-byte v7, v5, v7

    xor-int/lit8 v9, v7, -0x1

    and-int/lit8 v7, v7, -0x1

    const/4 v10, 0x1

    shl-int/2addr v7, v10

    add-int/2addr v9, v7

    int-to-byte v7, v9

    invoke-static {v2, v6, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_85
    .catchall {:try_start_85 .. :try_end_85} :catchall_45

    const/4 v4, 0x2

    :try_start_86
    new-array v6, v4, [Ljava/lang/Object;

    const/4 v4, 0x1

    aput-object v3, v6, v4

    const/4 v3, 0x0

    aput-object v2, v6, v3

    const/16 v2, 0x95

    aget-byte v3, v5, v2

    int-to-byte v2, v3

    const/16 v3, 0xc7

    int-to-short v3, v3

    const/16 v4, 0x40

    aget-byte v5, v5, v4

    int-to-byte v4, v5

    invoke-static {v2, v3, v4}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v3, v4, v5

    const-class v3, Ljava/lang/Throwable;

    const/4 v5, 0x1

    aput-object v3, v4, v5

    invoke-virtual {v2, v4}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    throw v2
    :try_end_86
    .catchall {:try_start_86 .. :try_end_86} :catchall_37

    :catchall_37
    move-exception v0

    move-object v2, v0

    :try_start_87
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_67

    throw v3

    :cond_67
    throw v2

    :catchall_38
    move-exception v0

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v2, v0

    .line 3697
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_68

    throw v3

    :cond_68
    throw v2

    :catchall_39
    move-exception v0

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v2, v0

    .line 3689
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_69

    throw v3

    :cond_69
    throw v2

    :catchall_3a
    move-exception v0

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v2, v0

    .line 3675
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_6a

    throw v3

    :cond_6a
    throw v2

    :catchall_3b
    move-exception v0

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v2, v0

    .line 3669
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_6b

    throw v3

    :cond_6b
    throw v2

    :catchall_3c
    move-exception v0

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v2, v0

    .line 3663
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_6c

    throw v3

    :cond_6c
    throw v2

    :catchall_3d
    move-exception v0

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v2, v0

    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_6d

    throw v3

    :cond_6d
    throw v2

    :catchall_3e
    move-exception v0

    goto/16 :goto_53

    :catchall_3f
    move-exception v0

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v2, v0

    .line 2449
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_6e

    throw v3

    :cond_6e
    throw v2

    :catchall_40
    move-exception v0

    goto :goto_51

    :catchall_41
    move-exception v0

    move-object/from16 v40, v10

    :goto_51
    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v2, v0

    .line 2446
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_6f

    throw v3

    :cond_6f
    throw v2

    :catchall_42
    move-exception v0

    move-object/from16 v40, v10

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v2, v0

    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_70

    throw v3

    :cond_70
    throw v2

    :catchall_43
    move-exception v0

    goto :goto_52

    :catchall_44
    move-exception v0

    move/from16 v36, v3

    move-object/from16 v40, v10

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v2, v0

    .line 2429
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_71

    throw v3

    :cond_71
    throw v2

    :catchall_45
    move-exception v0

    goto :goto_54

    :catchall_46
    move-exception v0

    move/from16 v36, v3

    move-object/from16 v40, v10

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v2, v0

    .line 2412
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_72

    throw v3

    :cond_72
    throw v2

    :catchall_47
    move-exception v0

    move/from16 v36, v3

    move-object/from16 v40, v10

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v2, v0

    .line 2411
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_73

    throw v3

    :cond_73
    throw v2

    :catchall_48
    move-exception v0

    move/from16 v36, v3

    move-object/from16 v40, v10

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    move-object v2, v0

    .line 2410
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_74

    throw v3

    :cond_74
    throw v2
    :try_end_87
    .catchall {:try_start_87 .. :try_end_87} :catchall_45

    :catchall_49
    move-exception v0

    move/from16 v36, v3

    :goto_52
    move-object/from16 v40, v10

    goto :goto_53

    :catchall_4a
    move-exception v0

    move-object/from16 v30, v2

    move/from16 v36, v3

    move-object/from16 v33, v5

    move/from16 v34, v6

    move-object/from16 v35, v9

    move-object/from16 v40, v10

    move-object/from16 v39, v13

    :goto_53
    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    :goto_54
    move-object v2, v0

    :goto_55
    and-int/lit8 v3, v36, 0x1

    or-int/lit8 v4, v36, 0x1

    add-int/2addr v3, v4

    :goto_56
    const/16 v4, 0x9

    if-ge v3, v4, :cond_75

    const/4 v5, 0x1

    goto :goto_57

    :cond_75
    const/4 v5, 0x0

    :goto_57
    if-eqz v5, :cond_78

    .line 249
    :try_start_88
    aget-boolean v5, v40, v3
    :try_end_88
    .catch Ljava/lang/Exception; {:try_start_88 .. :try_end_88} :catch_e

    if-eqz v5, :cond_76

    const/4 v5, 0x1

    goto :goto_58

    :cond_76
    const/16 v5, 0x4c

    :goto_58
    const/4 v6, 0x1

    if-eq v5, v6, :cond_77

    or-int/lit8 v5, v3, 0x54

    shl-int/2addr v5, v6

    xor-int/lit8 v3, v3, 0x54

    sub-int/2addr v5, v3

    xor-int/lit8 v3, v5, -0x53

    and-int/lit8 v5, v5, -0x53

    shl-int/2addr v5, v6

    add-int/2addr v3, v5

    goto :goto_56

    :cond_77
    const/4 v3, 0x1

    goto :goto_59

    :cond_78
    const/4 v3, 0x0

    :goto_59
    if-nez v3, :cond_7c

    .line 3603
    sget v1, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    or-int/lit8 v3, v1, 0x33

    const/4 v4, 0x1

    shl-int/2addr v3, v4

    xor-int/lit8 v1, v1, 0x33

    sub-int/2addr v3, v1

    rem-int/lit16 v1, v3, 0x80

    sput v1, Lcom/appsflyer/internal/e;->onResponse:I

    const/4 v1, 0x2

    rem-int/2addr v3, v1

    if-nez v3, :cond_79

    const/16 v1, 0x63

    goto :goto_5a

    :cond_79
    const/16 v1, 0x1f

    :goto_5a
    const/16 v3, 0x1f

    if-eq v1, v3, :cond_7a

    .line 259
    :try_start_89
    sget-object v1, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v3, 0x3d

    aget-byte v3, v1, v3

    int-to-byte v3, v3

    const/16 v4, 0x3c6e

    int-to-short v4, v4

    const/16 v5, 0x74a2

    aget-byte v1, v1, v5

    goto :goto_5b

    :cond_7a
    sget-object v1, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v3, 0x34

    aget-byte v3, v1, v3

    int-to-byte v3, v3

    const/16 v4, 0x298

    int-to-short v4, v4

    const/16 v5, 0x95

    aget-byte v1, v1, v5

    :goto_5b
    int-to-byte v1, v1

    invoke-static {v3, v4, v1}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v1
    :try_end_89
    .catch Ljava/lang/Exception; {:try_start_89 .. :try_end_89} :catch_e

    const/4 v3, 0x2

    :try_start_8a
    new-array v4, v3, [Ljava/lang/Object;

    const/4 v3, 0x1

    aput-object v2, v4, v3

    const/4 v2, 0x0

    aput-object v1, v4, v2

    sget-object v1, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v2, 0x95

    aget-byte v2, v1, v2

    int-to-byte v2, v2

    const/16 v3, 0xc7

    int-to-short v3, v3

    const/16 v5, 0x40

    aget-byte v1, v1, v5

    int-to-byte v1, v1

    invoke-static {v2, v3, v1}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const/4 v3, 0x2

    new-array v2, v3, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v3, v2, v5

    const-class v3, Ljava/lang/Throwable;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Throwable;

    throw v1
    :try_end_8a
    .catchall {:try_start_8a .. :try_end_8a} :catchall_4b

    :catchall_4b
    move-exception v0

    move-object v1, v0

    :try_start_8b
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_7b

    throw v2

    :cond_7b
    throw v1

    :cond_7c
    const/16 v2, 0x95

    const/4 v3, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 264
    sput-object v6, Lcom/appsflyer/internal/e;->onConversionDataSuccess:Ljava/lang/Object;

    .line 265
    sput-object v6, Lcom/appsflyer/internal/e;->onConversionDataFail:Ljava/lang/Object;

    goto :goto_5c

    :cond_7d
    move-object/from16 v30, v2

    move/from16 v36, v3

    move-object/from16 v33, v5

    move/from16 v34, v6

    move-object/from16 v35, v9

    move-object/from16 v40, v10

    move-object/from16 v39, v13

    const/16 v2, 0x95

    const/4 v3, 0x2

    const/16 v4, 0x9

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v8, 0x1af

    const/16 v13, 0x10

    const/16 v15, 0x3a

    :goto_5c
    or-int/lit8 v7, v36, 0x1

    const/4 v9, 0x1

    shl-int/2addr v7, v9

    xor-int/lit8 v10, v36, 0x1

    sub-int/2addr v7, v10

    move v3, v7

    move-object/from16 v2, v30

    move-object/from16 v5, v33

    move/from16 v6, v34

    move-object/from16 v9, v35

    move-object/from16 v13, v39

    move-object/from16 v10, v40

    const/4 v7, 0x2

    const/16 v8, 0x31

    const/4 v11, 0x4

    const/4 v14, 0x0

    goto/16 :goto_12

    :catchall_4c
    move-exception v0

    move-object v1, v0

    .line 146
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_7e

    throw v2

    :cond_7e
    throw v1

    :catchall_4d
    move-exception v0

    move-object v1, v0

    .line 138
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_7f

    throw v2

    :cond_7f
    throw v1

    :catchall_4e
    move-exception v0

    move-object v1, v0

    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-eqz v2, :cond_80

    throw v2

    :cond_80
    throw v1
    :try_end_8b
    .catch Ljava/lang/Exception; {:try_start_8b .. :try_end_8b} :catch_e

    :catch_e
    move-exception v0

    move-object v1, v0

    .line 275
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private constructor <init>()V
    .locals 0

    .line 799
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static AFInAppEventParameterName(I)I
    .locals 8

    sget v0, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    or-int/lit8 v1, v0, 0x3d

    const/4 v2, 0x1

    shl-int/2addr v1, v2

    xor-int/lit8 v3, v0, 0x3d

    sub-int/2addr v1, v3

    rem-int/lit16 v3, v1, 0x80

    sput v3, Lcom/appsflyer/internal/e;->onResponse:I

    rem-int/lit8 v1, v1, 0x2

    sget-object v1, Lcom/appsflyer/internal/e;->onConversionDataSuccess:Ljava/lang/Object;

    and-int/lit8 v3, v0, 0x69

    or-int/lit8 v0, v0, 0x69

    add-int/2addr v3, v0

    rem-int/lit16 v0, v3, 0x80

    sput v0, Lcom/appsflyer/internal/e;->onResponse:I

    rem-int/lit8 v3, v3, 0x2

    :try_start_0
    new-array v0, v2, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v3, 0x0

    aput-object p0, v0, v3

    sget-object p0, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v4, 0x1af

    aget-byte v5, p0, v4

    int-to-byte v5, v5

    const/16 v6, 0x18e

    aget-byte v6, p0, v6

    neg-int v6, v6

    int-to-short v6, v6

    const/16 v7, 0xa7

    aget-byte v7, p0, v7

    int-to-byte v7, v7

    invoke-static {v5, v6, v7}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lcom/appsflyer/internal/e;->onConversionDataFail:Ljava/lang/Object;

    check-cast v6, Ljava/lang/ClassLoader;

    invoke-static {v5, v2, v6}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v5

    const/16 v6, 0xc

    aget-byte v6, p0, v6

    int-to-byte v6, v6

    const/16 v7, 0x2a7

    int-to-short v7, v7

    aget-byte p0, p0, v4

    int-to-byte p0, p0

    invoke-static {v6, v7, p0}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object p0

    new-array v2, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    invoke-virtual {v5, p0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    invoke-virtual {p0, v1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget v0, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    add-int/lit8 v0, v0, 0x61

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/e;->onResponse:I

    rem-int/lit8 v0, v0, 0x2

    return p0

    :catchall_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_0

    throw v0

    :cond_0
    throw p0
.end method

.method public static AFInAppEventParameterName(IIC)Ljava/lang/Object;
    .locals 8

    sget v0, Lcom/appsflyer/internal/e;->onResponse:I

    xor-int/lit8 v1, v0, 0x55

    and-int/lit8 v2, v0, 0x55

    const/4 v3, 0x1

    shl-int/2addr v2, v3

    add-int/2addr v1, v2

    rem-int/lit16 v2, v1, 0x80

    sput v2, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    const/4 v2, 0x2

    rem-int/2addr v1, v2

    sget-object v1, Lcom/appsflyer/internal/e;->onConversionDataSuccess:Ljava/lang/Object;

    or-int/lit8 v4, v0, 0x1b

    shl-int/2addr v4, v3

    xor-int/lit8 v0, v0, 0x1b

    sub-int/2addr v4, v0

    rem-int/lit16 v0, v4, 0x80

    sput v0, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    rem-int/2addr v4, v2

    const/4 v0, 0x3

    :try_start_0
    new-array v4, v0, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p2

    aput-object p2, v4, v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v3

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 p1, 0x0

    aput-object p0, v4, p1

    sget-object p0, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 p2, 0x1af

    aget-byte p2, p0, p2

    int-to-byte p2, p2

    const/16 v5, 0x18e

    aget-byte v5, p0, v5

    neg-int v5, v5

    int-to-short v5, v5

    const/16 v6, 0xa7

    aget-byte v6, p0, v6

    int-to-byte v6, v6

    invoke-static {p2, v5, v6}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object p2

    sget-object v5, Lcom/appsflyer/internal/e;->onConversionDataFail:Ljava/lang/Object;

    check-cast v5, Ljava/lang/ClassLoader;

    invoke-static {p2, v3, v5}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object p2

    const/16 v5, 0xc

    aget-byte v5, p0, v5

    int-to-byte v5, v5

    const/16 v6, 0x197

    int-to-short v6, v6

    const/16 v7, 0x286

    aget-byte p0, p0, v7

    int-to-byte p0, p0

    invoke-static {v5, v6, p0}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object p0

    new-array v0, v0, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v0, p1

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v0, v3

    sget-object v5, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    aput-object v5, v0, v2

    invoke-virtual {p2, p0, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    invoke-virtual {p0, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    sget p2, Lcom/appsflyer/internal/e;->onResponse:I

    xor-int/lit8 v0, p2, 0x4f

    and-int/lit8 p2, p2, 0x4f

    shl-int/2addr p2, v3

    add-int/2addr v0, p2

    rem-int/lit16 p2, v0, 0x80

    sput p2, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    rem-int/2addr v0, v2

    if-eqz v0, :cond_0

    const/4 v3, 0x0

    :cond_0
    if-eqz v3, :cond_1

    return-object p0

    :cond_1
    const/16 p2, 0x5e

    :try_start_1
    div-int/2addr p2, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    throw p0

    :catchall_1
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_2

    throw p1

    :cond_2
    throw p0
.end method

.method public static AFInAppEventType(Ljava/lang/Object;)I
    .locals 8

    sget v0, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    add-int/lit8 v0, v0, 0x2f

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/e;->onResponse:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v2, 0x2c

    if-nez v0, :cond_0

    const/16 v0, 0x41

    goto :goto_0

    :cond_0
    const/16 v0, 0x2c

    :goto_0
    if-eq v0, v2, :cond_1

    sget-object v0, Lcom/appsflyer/internal/e;->onConversionDataSuccess:Ljava/lang/Object;

    const/4 v2, 0x0

    :try_start_0
    array-length v2, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    throw p0

    :cond_1
    sget-object v0, Lcom/appsflyer/internal/e;->onConversionDataSuccess:Ljava/lang/Object;

    :goto_1
    and-int/lit8 v2, v1, 0x1b

    or-int/lit8 v1, v1, 0x1b

    add-int/2addr v2, v1

    rem-int/lit16 v1, v2, 0x80

    sput v1, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    rem-int/lit8 v2, v2, 0x2

    const/4 v1, 0x1

    :try_start_1
    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    sget-object p0, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v4, 0x1af

    aget-byte v4, p0, v4

    int-to-byte v4, v4

    const/16 v5, 0x18e

    aget-byte v5, p0, v5

    neg-int v5, v5

    int-to-short v5, v5

    const/16 v6, 0xa7

    aget-byte v6, p0, v6

    int-to-byte v6, v6

    invoke-static {v4, v5, v6}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/appsflyer/internal/e;->onConversionDataFail:Ljava/lang/Object;

    check-cast v5, Ljava/lang/ClassLoader;

    invoke-static {v4, v1, v5}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v4

    const/16 v5, 0xc

    aget-byte v5, p0, v5

    int-to-byte v5, v5

    const/16 v6, 0x197

    int-to-short v6, v6

    const/16 v7, 0x286

    aget-byte p0, p0, v7

    int-to-byte p0, p0

    invoke-static {v5, v6, p0}, Lcom/appsflyer/internal/e;->$$c(BSI)Ljava/lang/String;

    move-result-object p0

    new-array v5, v1, [Ljava/lang/Class;

    const-class v6, Ljava/lang/Object;

    aput-object v6, v5, v3

    invoke-virtual {v4, p0, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    invoke-virtual {p0, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    sget v0, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    add-int/lit8 v0, v0, 0x2

    sub-int/2addr v0, v1

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/e;->onResponse:I

    rem-int/lit8 v0, v0, 0x2

    return p0

    :catchall_1
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_2

    throw v0

    :cond_2
    throw p0
.end method

.method static init$0()V
    .locals 4

    sget v0, Lcom/appsflyer/internal/e;->onResponse:I

    add-int/lit8 v0, v0, 0x7e

    add-int/lit8 v0, v0, -0x1

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    rem-int/lit8 v0, v0, 0x2

    const/16 v0, 0x3f8

    new-array v1, v0, [B

    const-string v2, "G\u00bb\u00be\u0012\u00fa\u0018\u00ee\u00d0>\t\u00c2\u00176\u00f4\u0003\u0002\u0010\u00f6\u0002\u00e8(\u0005\u0008\u0002\u00e2$\u0001\u00f6\u00ff\u000f\u00fa\u0018\u00ee\u00d0A\u00f8\u0010\u00fc\u00ca()\u00fd\u0004\u00f4\u000b\u0015\u0000\u0003\u00f6\u000c\t\u00d02\u0003\u00ff\u0000\u00fd\u0001\u0016\u00f8\t\u0002\u0010\u00f9\u0011\u0000\u00fd\u00fe\u00cdD\u0007\u00be%%\u0000\u00f7\u0005\u0011\u0003\u00fa\u0018\u00ee\u00d0C\u00fe\t\u00c2\u0017:\u00fe\u00f4\u00e06\u00f4\u0003\u0002\u0010\u0010\u00f9\u0011\u0000\u00fd\u00fe\u00cdD\u0007\u00be\u00176\u00f7\u0006\u00fb\u00c35\u00f2\u0010\u0004\u00f9\t\u0002\u00fa\u0018\u00ee\u00d0>\t\u00c2\u0017:\u00fe\u00f4\u00df4\u0003\u00f2\u001b\u00d3(\u0005\u0008\u0002\u00e2$\u0001\u00f6\u00ff\u000f\u0000\u000e\r\u00f6\u0005\u00c6H\t\u00fd\u0004\u00f4\u000b\u00c4\u001e(\u00e2\u001b\u000b\u0005\u0006\n\u00ce$\u0016\u00ce,\u00f8\u0015\u0003\u00dc&\u00f5\u0006\u0004\u0010\u00f6\u00ff\u0006\u00e52\u00fa\u0003\u0010\u000f\u0001\u00c55\u0012\u0003\u0006\u00f6\t\u0010\u00ef\u0010\u00c0=\u0008\t\u00f4\u0010\u00ff\u00f6\u000e\u00c67\u00c4\u0003\u0001\u0012\u00d5&\u0006\u00fc\u0011\u00d4(\u000c\u00fe\u00fa\u000e\u00f4\u0001\u0012\u00d2!\u0005\u0008\u0000\u00e2(\u000c\u00f6\u00ff\u0006\u0000\u000e\r\u00f6\u0005\u00c6H\t\u00fd\u0004\u00f4\u000b\u00c4\u0019$\u0016\u00d1&\u0006\u00fc\u000f\u00f8\u0004\u00fd\u0007\u0001\u0005\u0008\u0000\u0000\u000e\r\u00f6\u0005\u00c6H\t\u00fd\u0004\u00f4\u000b\u00c4\u0017\"\u0015\u00f5\u00e2$\u0016\u00ce,\u00f8\u0015\u0003\u00dc&\u00f5\u0006\u0004\u0010\u0001\u0012\u00d2/\u00f8\u0004\u00e1!\u0005\u0008\u0000\u00e2(\u000c\t\u00f8\u00f8\u0008\u0006(\u00d62\u0003\u00d84\u00f2\u000c\t\u00e3(\u00fa\u00f8\u00ee\n\u00ec\u000bI\u0004\u00b4I\u00fe\u000e\u0003\u00f9\u0002\u0005\u000b\u000b\u00b0O\u00fc\u0004\u0011\u00b8\u00ee\t\u00ed\u000b\u00ee\u0007\u00ef\u000b\u00ee\u000b\u00eb\u000b\u00fa\u0018\u00ee\u00d0A\u00f8\u0010\u00fc\u00ca\u0018,\u00f8\u0015\u0003\u00dc&\u00f5\u0006\u0004\u0010\u0010\u00f9\u0011\u0000\u00fd\u00fe\u00cd6\u0012\u0003\u00c1\u00162\u0003\u00da(\u0006\u00f6\u0002\u000e\n\u0001\u0012\u00d46\u00ff\u00f4\u0010\u00ff\u00f6\u000e\u00ea$\u00fe\u0006\u00f2\t\u0001\u00e2(\u000c\u00f6\u0001\u0014\u00fe\u0006\n7\u000f\u0001\u00c55\u0012\u0003\u0006\u00f6\t\u0010\u00ef\u0010\u00c0=\u0008\t\u00f4\u0010\u00ff\u00f6\u000e\u00c66\u00ce\u00fa\u0018\u00ee\u00d0>\t\u00c2\u0019 \u0016\u00f0\u00eb(\u0005\u0008\u0002\u00e2$\u0001\u00f6\u00ff\u000f\u0006\u00f5\u0006\u00e3$\u0016\u00fa\u0018\u00ee\u00d0>\t\u00c2\u0017:\u00fe\u00f4\u00df4\u0003\u00f2\u001b\u00d9)\u0002\u00ff\u0008\u0002\u00e2$\u0001\u00f6\u00ff\u000f\u0010\u00f9\u0011\u0000\u00fd\u00fe\u00cdD\u0007\u00be\u001a,\u000b\u00f6\u000c\u0000\u0002\u0002\u00fb\u000c\t\u00ee\u000e\u000c\u00f3\u0011\u0001\u0012\u00de\u001a\u0003\u0010\u00f5\u0012\u00d1&\u0004\u000c\u0006\u00f6\u00fb\u0001\n\u0001\u0012\u00d2,\u00f8\u0015\u0003\u00dc&\u00f5\u0006\u0004\u00108\u0000\u0016\u00f0\u00d18\u0000\u0016\u00f0\u00d1\u0004\n\u00fc\u0012\u00f4\u0001\u0012\u00d5\u0001\u0008\u0008\u001d\u0017\u00fd\u0004\u00fe\u0006\u00f6\u00f5\u001e\u00f2\u0012\u0003\u00f8\u0010\u00f4\n\u0017\u00ed\u0008\t\u000f\u0001\u00c55\u0012\u0003\u0006\u00f6\t\u0010\u00ef\u0010\u00c0=\u0008\t\u00f4\u0010\u00ff\u00f6\u000e\u00c69\u00c2O\u00f6\u0016\u00f8\u0010\u00f2\u00ea \u00fc\u0013\u00f2\u0014\n\u00da\u0014\u0016\u00f7\u00e0*\u00fc\u000b\u00fb\u000c\t\u0002\u000c\u0006\u0007\u00f5\u0001\u0012\u00e3\u0017\r\u00f6\u00ff\u0006\u00ef%\u00fa\t\u0006\u00fa\u000e\u00087\u000f\u0001\u00c55\u0012\u0003\u0006\u00f6\t\u0010\u00ef\u0010\u00c0=\u0008\t\u00f4\u0010\u00ff\u00f6\u000e\u00c65\u00cf\u00fa\u0018\u00ee\u00d0>\t\u00c2I\u00fc\u0006\u00f7\u0008\u000c\u0001\u0012\u00df%\u0000\u0004\u00f8\u0010\u0005\u0008\u0001\u0012\u00d0$\u0014\u00ff\u0000\u000c\u0002\u00f4\u00ee\u0014\u0016\u00f7\u0010\u00f9\u0011\u0000\u00fd\u00fe\u00cd6\u0012\u0003\u00c1\u0016%\u0014\u00f8\u0010\u00f6\u000e\u0008\u00de\u0017\r\u00f6\u00ff\u0006\u00fa\u0018\u00ee\u00d0>\t\u00c2\u001b&\u0006\u00fc\u00ed)\u0002\u00ff\u0008\u0002\u00e2$\u0001\u00f6\u00ff\u000f\u0001\u0010\u00ec\u001e\u00fa\u000e\u00f4\u00fa\u0018\u00ee\u00d0>\t\u00c2\u001e\t\u00f96\u00ee\u0005\u000e\u0007\u00f8\t\u0002\u0010\u00f9\u0011\u0000\u00fd\u00fe\u00cdI\u00f4\u0016\u00ff\u00bd)\u0014\u0016\u00ff\u00e4\"\u00f8\u0006\n\u00f4\u0016\u00f7\u00e7 \r\u0004\u0001\u0012\u00d8(\u00fe\u000e\u00f8\u00fb\u000e\u00d82\u0003\u00ff\u0000\u00fd\u0001\u0016\u00f8\t\u0002\u00fa\u0018\u00ee\u00d0>\t\u00c2\u001b&\u0006\u00fc\u00ee\u0006\u00f0\u000b\u0015\u0000\u0003\u00f6\u000c\t\u00e3\u0018\u0007\u00fb\u00eb\u001f\u0006\u0003\u0000\r\u00fa\u0018\u00ee\u00d0>\t\u00c2\u001b&\u0006\u00fc\u00e2$\u0011\u00f3\u0012\u00fa\n\u0007\u00fe\u0006\u00fe\u00d6:\u00fe\u00f4\u00df4\u0003\u00f2\u001b\u0006\u00f5\u0006\u00e2,\u00f8\u0015\u0003\u000f\u0001\u00c46\u0012\u0003\u0006\u00f6\t\u0010\u00ef\u0010\u00bf>\u0008\t\u00f4\u0010\u00ff\u00f6\u000e\u00c58\u00c4\u0003\u000f\u0001\u00c46\u0012\u0003\u0006\u00f6\t\u0010\u00ef\u0010\u00fe\u00f2\u0012\u00f6\u0016\u00f8\u0010\u00f2\u00ea \u00fc\u0013\u00f2\u0014\n\u00ce(\u000c\u00f6\u0001\u0014\u00fe\u0006\u00fa\u00ff\u0011\u00fa\u0018\u00ee\u00d0>\t\u00c2\u001e(\u0005\u0008\u0002\u00e2$\u0001\u00f6\u00ff\u000f"

    const-string v3, "ISO-8859-1"

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sput-object v1, Lcom/appsflyer/internal/e;->onResponseError:[B

    const/16 v0, 0x52

    sput v0, Lcom/appsflyer/internal/e;->onDeepLinking:I

    sget v0, Lcom/appsflyer/internal/e;->onAttributionFailure:I

    and-int/lit8 v1, v0, 0x43

    or-int/lit8 v0, v0, 0x43

    add-int/2addr v1, v0

    rem-int/lit16 v0, v1, 0x80

    sput v0, Lcom/appsflyer/internal/e;->onResponse:I

    rem-int/lit8 v1, v1, 0x2

    return-void
.end method
