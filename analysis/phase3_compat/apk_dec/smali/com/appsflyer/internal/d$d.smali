.class public final Lcom/appsflyer/internal/d$d;
.super Ljava/util/HashMap;
.source ""


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/appsflyer/internal/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/d$d$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static AFKeystoreWrapper:[I = null

.field private static AFLogger$LogLevel:Z = false

.field private static AFVersionDeclaration:I = 0x0

.field private static AppsFlyer2dXConversionCallback:Z = false

.field private static getLevel:I = 0x1

.field private static valueOf:[C

.field private static values:I


# instance fields
.field private final AFInAppEventParameterName:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final AFInAppEventType:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x12

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper:[I

    const/16 v0, 0x27

    new-array v0, v0, [C

    fill-array-data v0, :array_1

    sput-object v0, Lcom/appsflyer/internal/d$d;->valueOf:[C

    const/4 v0, 0x1

    sput-boolean v0, Lcom/appsflyer/internal/d$d;->AppsFlyer2dXConversionCallback:Z

    sput-boolean v0, Lcom/appsflyer/internal/d$d;->AFLogger$LogLevel:Z

    const/16 v0, 0x11f

    sput v0, Lcom/appsflyer/internal/d$d;->values:I

    return-void

    :array_0
    .array-data 4
        -0x3e162d10
        -0x22a0a09d
        -0x28aa7ac7
        0x75c39606
        0x5f22916e
        0x2019f97
        -0x77ed8470
        0x2ee67574
        -0x28f5ab65
        -0x213cca57
        -0x687c2df3
        -0x23d51aca
        0x67cd08ce
        -0x32d95f05
        0x2361c119
        0x7e43830c
        0x27a67658
        -0x1a525610
    .end array-data

    :array_1
    .array-data 2
        0x181s
        0x191s
        0x180s
        0x18ds
        0x183s
        0x18as
        0x184s
        0x185s
        0x188s
        0x18bs
        0x13fs
        0x186s
        0x193s
        0x198s
        0x196s
        0x187s
        0x197s
        0x182s
        0x18fs
        0x18es
        0x159s
        0x192s
        0x16bs
        0x194s
        0x163s
        0x14cs
        0x14ds
        0x149s
        0x14fs
        0x154s
        0x153s
        0x158s
        0x150s
        0x151s
        0x157s
        0x18cs
        0x155s
        0x145s
        0x190s
    .end array-data
.end method

.method public constructor <init>(Ljava/util/Map;Landroid/content/Context;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .line 354
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 355
    iput-object p1, p0, Lcom/appsflyer/internal/d$d;->AFInAppEventParameterName:Ljava/util/Map;

    .line 356
    iput-object p2, p0, Lcom/appsflyer/internal/d$d;->AFInAppEventType:Landroid/content/Context;

    .line 357
    invoke-direct {p0}, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0}, Lcom/appsflyer/internal/d$d;->valueOf()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private AFKeystoreWrapper()Ljava/lang/String;
    .locals 15

    const/4 v0, 0x4

    const/4 v1, 0x0

    .line 385
    :try_start_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    .line 386
    iget-object v3, p0, Lcom/appsflyer/internal/d$d;->AFInAppEventParameterName:Ljava/util/Map;

    const/4 v4, 0x6

    new-array v4, v4, [I

    const v5, -0x71396d75

    const/4 v6, 0x0

    aput v5, v4, v6

    const v5, -0x4e9dbf57

    const/4 v7, 0x1

    aput v5, v4, v7

    const v5, -0x64d845b7

    const/4 v8, 0x2

    aput v5, v4, v8

    const v5, -0x21482d7e

    const/4 v9, 0x3

    aput v5, v4, v9

    const v5, 0x3d719747

    aput v5, v4, v0

    const/4 v5, 0x5

    const v10, 0x51bdbf77

    aput v10, v4, v5

    const-string v5, ""

    invoke-static {v5}, Landroid/os/Process;->getGidForName(Ljava/lang/String;)I

    move-result v5

    add-int/lit8 v5, v5, 0xd

    invoke-static {v4, v5}, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper([II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 387
    iget-object v4, p0, Lcom/appsflyer/internal/d$d;->AFInAppEventParameterName:Ljava/util/Map;

    const-string/jumbo v5, "\u0085\u0084\u0083\u0082\u0081"

    invoke-static {v6}, Landroid/widget/ExpandableListView;->getPackedPositionForGroup(I)J

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmp-long v14, v10, v12

    rsub-int/lit8 v10, v14, 0x7f

    invoke-static {v1, v1, v5, v10}, Lcom/appsflyer/internal/d$d;->values(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/16 v5, 0x5d

    if-nez v4, :cond_0

    .line 413
    sget v4, Lcom/appsflyer/internal/d$d;->AFVersionDeclaration:I

    add-int/2addr v4, v5

    rem-int/lit16 v10, v4, 0x80

    sput v10, Lcom/appsflyer/internal/d$d;->getLevel:I

    rem-int/2addr v4, v8

    :try_start_1
    new-array v4, v0, [I

    const v10, -0x77e5e775

    aput v10, v4, v6

    const v10, -0x13ca1fbe

    aput v10, v4, v7

    const v10, -0x65a97598

    aput v10, v4, v8

    const v10, 0x485760fd

    aput v10, v4, v9

    .line 390
    invoke-static {}, Landroid/view/ViewConfiguration;->getMinimumFlingVelocity()I

    move-result v10

    shr-int/lit8 v10, v10, 0x10

    add-int/lit8 v10, v10, 0x8

    invoke-static {v4, v10}, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper([II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 413
    sget v10, Lcom/appsflyer/internal/d$d;->getLevel:I

    add-int/lit8 v10, v10, 0x39

    rem-int/lit16 v11, v10, 0x80

    sput v11, Lcom/appsflyer/internal/d$d;->AFVersionDeclaration:I

    rem-int/2addr v10, v8

    .line 393
    :cond_0
    :try_start_2
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 394
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->reverse()Ljava/lang/StringBuilder;

    new-array v3, v9, [Ljava/lang/String;

    aput-object v2, v3, v6

    aput-object v4, v3, v7

    .line 396
    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v3, v8

    invoke-static {v3}, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper([Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 397
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    if-le v3, v0, :cond_1

    .line 413
    sget v4, Lcom/appsflyer/internal/d$d;->AFVersionDeclaration:I

    add-int/lit8 v4, v4, 0x1f

    rem-int/lit16 v5, v4, 0x80

    sput v5, Lcom/appsflyer/internal/d$d;->getLevel:I

    rem-int/2addr v4, v8

    .line 400
    :try_start_3
    invoke-virtual {v2, v0, v3}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 413
    sget v3, Lcom/appsflyer/internal/d$d;->getLevel:I

    add-int/lit8 v3, v3, 0x23

    rem-int/lit16 v4, v3, 0x80

    sput v4, Lcom/appsflyer/internal/d$d;->AFVersionDeclaration:I

    rem-int/2addr v3, v8

    goto :goto_2

    :cond_1
    :goto_0
    const/16 v4, 0x2f

    if-ge v3, v0, :cond_2

    const/16 v7, 0x2f

    goto :goto_1

    :cond_2
    const/16 v7, 0x1a

    :goto_1
    if-eq v7, v4, :cond_3

    :goto_2
    :try_start_4
    const-string/jumbo v3, "\u0088\u0087\u0086"

    .line 409
    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v4

    shr-int/lit8 v4, v4, 0x16

    rsub-int/lit8 v4, v4, 0x7f

    invoke-static {v1, v1, v3, v4}, Lcom/appsflyer/internal/d$d;->values(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v6, v3}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    return-object v0

    .line 413
    :cond_3
    sget v4, Lcom/appsflyer/internal/d$d;->getLevel:I

    add-int/lit8 v4, v4, 0x37

    rem-int/lit16 v7, v4, 0x80

    sput v7, Lcom/appsflyer/internal/d$d;->AFVersionDeclaration:I

    rem-int/2addr v4, v8

    if-eqz v4, :cond_4

    const/16 v4, 0x22

    goto :goto_3

    :cond_4
    const/16 v4, 0x5d

    :goto_3
    if-eq v4, v5, :cond_5

    add-int/lit8 v3, v3, 0x29

    const/16 v4, 0x6e

    .line 406
    :try_start_5
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_5
    add-int/lit8 v3, v3, 0x1

    const/16 v4, 0x31

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    .line 412
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollBarFadeDuration()I

    move-result v4

    shr-int/lit8 v4, v4, 0x10

    add-int/lit8 v4, v4, 0x7f

    const-string/jumbo v5, "\u008b\u0095\u0084\u0094\u0089\u008d\u0093\u0087\u0092\u0091\u0087\u008b\u0090\u008d\u0089\u008f\u008b\u008e\u0087\u0086\u008b\u0088\u0087\u0086\u008b\u008c\u0084\u0089\u008d\u0083\u0082\u0087\u0084\u0087\u008c\u008b\u0085\u0087\u008a\u0089\u0083\u0088"

    invoke-static {v1, v1, v5, v4}, Lcom/appsflyer/internal/d$d;->values(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    new-array v0, v0, [I

    .line 413
    fill-array-data v0, :array_0

    invoke-static {}, Landroid/os/Process;->myTid()I

    move-result v1

    shr-int/lit8 v1, v1, 0x16

    rsub-int/lit8 v1, v1, 0x7

    invoke-static {v0, v1}, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper([II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :array_0
    .array-data 4
        0x6cb5084a
        0x7aa107cc
        0x683089fd
        0xc89afc7
    .end array-data
.end method

.method private static AFKeystoreWrapper([II)Ljava/lang/String;
    .locals 12

    .line 1126
    sget-object v0, Lcom/appsflyer/internal/dm;->valueOf:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x4

    :try_start_0
    new-array v1, v1, [C

    .line 1129
    array-length v2, p0

    const/4 v3, 0x1

    shl-int/2addr v2, v3

    new-array v2, v2, [C

    .line 1130
    sget-object v4, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper:[I

    invoke-virtual {v4}, [I->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [I

    const/4 v5, 0x0

    .line 1132
    sput v5, Lcom/appsflyer/internal/dm;->AFInAppEventParameterName:I

    :goto_0
    sget v6, Lcom/appsflyer/internal/dm;->AFInAppEventParameterName:I

    array-length v7, p0

    if-ge v6, v7, :cond_1

    .line 1134
    sget v6, Lcom/appsflyer/internal/dm;->AFInAppEventParameterName:I

    aget v6, p0, v6

    const/16 v7, 0x10

    shr-int/2addr v6, v7

    int-to-char v6, v6

    aput-char v6, v1, v5

    .line 1135
    sget v6, Lcom/appsflyer/internal/dm;->AFInAppEventParameterName:I

    aget v6, p0, v6

    int-to-char v6, v6

    aput-char v6, v1, v3

    .line 1136
    sget v6, Lcom/appsflyer/internal/dm;->AFInAppEventParameterName:I

    add-int/2addr v6, v3

    aget v6, p0, v6

    shr-int/2addr v6, v7

    int-to-char v6, v6

    const/4 v8, 0x2

    aput-char v6, v1, v8

    .line 1137
    sget v6, Lcom/appsflyer/internal/dm;->AFInAppEventParameterName:I

    add-int/2addr v6, v3

    aget v6, p0, v6

    int-to-char v6, v6

    const/4 v9, 0x3

    aput-char v6, v1, v9

    .line 1141
    aget-char v6, v1, v5

    shl-int/2addr v6, v7

    aget-char v10, v1, v3

    add-int/2addr v6, v10

    sput v6, Lcom/appsflyer/internal/dm;->values:I

    .line 1142
    aget-char v6, v1, v8

    shl-int/2addr v6, v7

    aget-char v10, v1, v9

    add-int/2addr v6, v10

    sput v6, Lcom/appsflyer/internal/dm;->AFKeystoreWrapper:I

    .line 1145
    invoke-static {v4}, Lcom/appsflyer/internal/dm;->values([I)V

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v7, :cond_0

    .line 1150
    sget v10, Lcom/appsflyer/internal/dm;->values:I

    aget v11, v4, v6

    xor-int/2addr v10, v11

    .line 1151
    sput v10, Lcom/appsflyer/internal/dm;->values:I

    invoke-static {v10}, Lcom/appsflyer/internal/dm;->AFInAppEventParameterName(I)I

    move-result v10

    sget v11, Lcom/appsflyer/internal/dm;->AFKeystoreWrapper:I

    xor-int/2addr v10, v11

    sput v10, Lcom/appsflyer/internal/dm;->AFKeystoreWrapper:I

    .line 1153
    sget v10, Lcom/appsflyer/internal/dm;->values:I

    .line 1154
    sget v11, Lcom/appsflyer/internal/dm;->AFKeystoreWrapper:I

    sput v11, Lcom/appsflyer/internal/dm;->values:I

    .line 1155
    sput v10, Lcom/appsflyer/internal/dm;->AFKeystoreWrapper:I

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 1157
    :cond_0
    sget v6, Lcom/appsflyer/internal/dm;->values:I

    .line 1158
    sget v10, Lcom/appsflyer/internal/dm;->AFKeystoreWrapper:I

    sput v10, Lcom/appsflyer/internal/dm;->values:I

    .line 1161
    sput v6, Lcom/appsflyer/internal/dm;->AFKeystoreWrapper:I

    aget v10, v4, v7

    xor-int/2addr v6, v10

    sput v6, Lcom/appsflyer/internal/dm;->AFKeystoreWrapper:I

    .line 1162
    sget v6, Lcom/appsflyer/internal/dm;->values:I

    const/16 v10, 0x11

    aget v10, v4, v10

    xor-int/2addr v6, v10

    sput v6, Lcom/appsflyer/internal/dm;->values:I

    .line 1165
    sget v6, Lcom/appsflyer/internal/dm;->values:I

    sget v6, Lcom/appsflyer/internal/dm;->AFKeystoreWrapper:I

    .line 1167
    sget v6, Lcom/appsflyer/internal/dm;->values:I

    ushr-int/2addr v6, v7

    int-to-char v6, v6

    aput-char v6, v1, v5

    .line 1168
    sget v6, Lcom/appsflyer/internal/dm;->values:I

    int-to-char v6, v6

    aput-char v6, v1, v3

    .line 1169
    sget v6, Lcom/appsflyer/internal/dm;->AFKeystoreWrapper:I

    ushr-int/2addr v6, v7

    int-to-char v6, v6

    aput-char v6, v1, v8

    .line 1170
    sget v6, Lcom/appsflyer/internal/dm;->AFKeystoreWrapper:I

    int-to-char v6, v6

    aput-char v6, v1, v9

    .line 1173
    invoke-static {v4}, Lcom/appsflyer/internal/dm;->values([I)V

    .line 1176
    sget v6, Lcom/appsflyer/internal/dm;->AFInAppEventParameterName:I

    shl-int/2addr v6, v3

    aget-char v7, v1, v5

    aput-char v7, v2, v6

    .line 1177
    sget v6, Lcom/appsflyer/internal/dm;->AFInAppEventParameterName:I

    shl-int/2addr v6, v3

    add-int/2addr v6, v3

    aget-char v7, v1, v3

    aput-char v7, v2, v6

    .line 1178
    sget v6, Lcom/appsflyer/internal/dm;->AFInAppEventParameterName:I

    shl-int/2addr v6, v3

    add-int/2addr v6, v8

    aget-char v7, v1, v8

    aput-char v7, v2, v6

    .line 1179
    sget v6, Lcom/appsflyer/internal/dm;->AFInAppEventParameterName:I

    shl-int/2addr v6, v3

    add-int/2addr v6, v9

    aget-char v7, v1, v9

    aput-char v7, v2, v6

    .line 1132
    sget v6, Lcom/appsflyer/internal/dm;->AFInAppEventParameterName:I

    add-int/2addr v6, v8

    sput v6, Lcom/appsflyer/internal/dm;->AFInAppEventParameterName:I

    goto/16 :goto_0

    .line 1181
    :cond_1
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v2, v5, p1}, Ljava/lang/String;-><init>([CII)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p0

    :catchall_0
    move-exception p0

    .line 1182
    monitor-exit v0

    throw p0
.end method

.method private static varargs AFKeystoreWrapper([Ljava/lang/String;)Ljava/lang/StringBuilder;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 361
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x3

    const/4 v4, 0x1

    if-ge v2, v3, :cond_0

    const/4 v5, 0x1

    goto :goto_1

    :cond_0
    const/4 v5, 0x0

    :goto_1
    if-eqz v5, :cond_1

    .line 379
    sget v3, Lcom/appsflyer/internal/d$d;->AFVersionDeclaration:I

    add-int/lit8 v3, v3, 0x73

    rem-int/lit16 v4, v3, 0x80

    sput v4, Lcom/appsflyer/internal/d$d;->getLevel:I

    rem-int/lit8 v3, v3, 0x2

    .line 362
    aget-object v3, p0, v2

    .line 363
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 366
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 367
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    .line 369
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v5, 0x0

    :goto_2
    if-ge v5, v0, :cond_5

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_3
    if-ge v7, v3, :cond_2

    const/4 v8, 0x0

    goto :goto_4

    :cond_2
    const/4 v8, 0x1

    :goto_4
    if-eq v8, v4, :cond_4

    .line 379
    sget v8, Lcom/appsflyer/internal/d$d;->AFVersionDeclaration:I

    add-int/lit8 v8, v8, 0x9

    rem-int/lit16 v9, v8, 0x80

    sput v9, Lcom/appsflyer/internal/d$d;->getLevel:I

    rem-int/lit8 v8, v8, 0x2

    .line 372
    aget-object v8, p0, v7

    .line 373
    invoke-virtual {v8, v5}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-nez v6, :cond_3

    goto :goto_5

    .line 374
    :cond_3
    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    xor-int/2addr v8, v6

    :goto_5
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 376
    :cond_4
    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v6

    .line 377
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_5
    return-object v2
.end method

.method private valueOf()Ljava/lang/String;
    .locals 20

    move-object/from16 v1, p0

    const-string v2, ""

    const/16 v3, 0xb

    const/4 v4, 0x6

    const/4 v5, 0x5

    const/4 v6, 0x4

    const/16 v7, 0x16

    const/4 v8, 0x3

    const/16 v9, 0x30

    const/16 v12, 0x10

    const/4 v13, 0x1

    const/4 v14, 0x2

    const/4 v15, 0x0

    const/4 v10, 0x0

    .line 421
    :try_start_0
    iget-object v0, v1, Lcom/appsflyer/internal/d$d;->AFInAppEventParameterName:Ljava/util/Map;

    new-array v11, v4, [I

    const v18, -0x71396d75

    aput v18, v11, v15

    const v18, -0x4e9dbf57

    aput v18, v11, v13

    const v18, -0x64d845b7

    aput v18, v11, v14

    const v18, -0x21482d7e

    aput v18, v11, v8

    const v18, 0x3d719747

    aput v18, v11, v6

    const v18, 0x51bdbf77

    aput v18, v11, v5

    invoke-static {v2, v9}, Landroid/text/TextUtils;->lastIndexOf(Ljava/lang/CharSequence;C)I

    move-result v18

    rsub-int/lit8 v4, v18, 0xb

    invoke-static {v11, v4}, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper([II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 422
    iget-object v4, v1, Lcom/appsflyer/internal/d$d;->AFInAppEventParameterName:Ljava/util/Map;

    const-string/jumbo v11, "\u0087\u008d\u0083\u0099\u0090\u0092\u0084\u0098\u0083\u0097\u008d\u0096\u0082\u0089\u0088"

    invoke-static {}, Landroid/view/ViewConfiguration;->getEdgeSlop()I

    move-result v18

    shr-int/lit8 v18, v18, 0x10

    rsub-int/lit8 v3, v18, 0x7f

    invoke-static {v10, v10, v11, v3}, Lcom/appsflyer/internal/d$d;->values(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    new-array v4, v6, [I

    const v11, 0x7f14d278

    aput v11, v4, v15

    const v11, -0x23db7a8c

    aput v11, v4, v13

    const v11, -0x395bf866

    aput v11, v4, v14

    const v11, 0x307f57cc

    aput v11, v4, v8

    .line 423
    invoke-static {}, Landroid/view/ViewConfiguration;->getMinimumFlingVelocity()I

    move-result v11

    shr-int/2addr v11, v12

    add-int/2addr v11, v5

    invoke-static {v4, v11}, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper([II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v11, "\u009c\u009b\u0092\u0082\u009a"

    .line 424
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v18

    shr-int/lit8 v18, v18, 0x16

    add-int/lit8 v5, v18, 0x7f

    invoke-static {v10, v10, v11, v5}, Lcom/appsflyer/internal/d$d;->values(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 426
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/internal/ag;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 427
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v15, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 429
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    new-array v4, v7, [I

    fill-array-data v4, :array_0

    const-wide/16 v16, 0x0

    invoke-static/range {v16 .. v17}, Landroid/widget/ExpandableListView;->getPackedPositionChild(J)I

    move-result v5

    rsub-int/lit8 v5, v5, 0x2b

    invoke-static {v4, v5}, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper([II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    .line 430
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v2, v9, v15}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;CI)I

    move-result v3

    add-int/lit16 v3, v3, 0x80

    const-string/jumbo v4, "\u00a3\u00a1\u009d\u00a2\u0088\u00a1\u00a0\u0085\u009d\u009f\u009e\u009d\u0087\u0083\u0087\u0081\u0083\u0081"

    invoke-static {v10, v10, v4, v3}, Lcom/appsflyer/internal/d$d;->values(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    move-object v3, v0

    .line 434
    :try_start_1
    iget-object v0, v1, Lcom/appsflyer/internal/d$d;->AFInAppEventType:Landroid/content/Context;

    new-instance v4, Landroid/content/IntentFilter;

    const/16 v5, 0x14

    new-array v5, v5, [I

    const v11, 0x7ac65c04

    aput v11, v5, v15

    const v11, 0x52e5386a

    aput v11, v5, v13

    const v11, -0x23b7b9cf

    aput v11, v5, v14

    const v11, 0x778a1c5

    aput v11, v5, v8

    const v11, 0x666876fd

    aput v11, v5, v6

    const v6, -0x1bc150c3

    const/4 v11, 0x5

    aput v6, v5, v11

    const v6, -0x717de332

    const/4 v11, 0x6

    aput v6, v5, v11

    const/4 v6, 0x7

    const v11, -0x30264d17

    aput v11, v5, v6

    const v6, -0x7513018d

    const/16 v11, 0x8

    aput v6, v5, v11

    const/16 v6, 0x9

    const v18, 0x24fb03ed

    aput v18, v5, v6

    const/16 v6, 0xa

    const v18, 0x16c0971b

    aput v18, v5, v6

    const v6, 0x4275c150

    const/16 v18, 0xb

    aput v6, v5, v18

    const/16 v6, 0xc

    const v18, 0x4ceba987    # 1.2355487E8f

    aput v18, v5, v6

    const/16 v6, 0xd

    const v18, -0x5a46efea

    aput v18, v5, v6

    const/16 v6, 0xe

    const v18, -0x2b34bd6d

    aput v18, v5, v6

    const/16 v6, 0xf

    const v18, -0x73aa8231

    aput v18, v5, v6

    const v6, -0x7bd4c503

    aput v6, v5, v12

    const/16 v6, 0x11

    const v18, 0x58ddeae9

    aput v18, v5, v6

    const/16 v6, 0x12

    const v18, 0xcdbefe7

    aput v18, v5, v6

    const v6, -0x797579fc

    const/16 v18, 0x13

    aput v6, v5, v18

    invoke-static {v2, v9, v15}, Landroid/text/TextUtils;->lastIndexOf(Ljava/lang/CharSequence;CI)I

    move-result v6

    rsub-int/lit8 v6, v6, 0x24

    invoke-static {v5, v6}, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper([II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v10, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    const/16 v4, -0xa8c

    if-eqz v0, :cond_0

    const-string/jumbo v5, "\u0087\u0082\u0098\u008d\u0083\u0082\u0087\u0093\u00a4\u0087\u008d"

    .line 437
    invoke-static {}, Landroid/view/ViewConfiguration;->getFadingEdgeLength()I

    move-result v6

    shr-int/2addr v6, v12

    rsub-int/lit8 v6, v6, 0x7f

    invoke-static {v10, v10, v5, v6}, Lcom/appsflyer/internal/d$d;->values(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 454
    :cond_0
    sget v0, Lcom/appsflyer/internal/d$d;->AFVersionDeclaration:I

    add-int/lit8 v0, v0, 0x4b

    rem-int/lit16 v5, v0, 0x80

    sput v5, Lcom/appsflyer/internal/d$d;->getLevel:I

    rem-int/2addr v0, v14

    .line 439
    :goto_1
    :try_start_2
    iget-object v0, v1, Lcom/appsflyer/internal/d$d;->AFInAppEventType:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    const/16 v5, 0x61

    if-eqz v0, :cond_1

    const/16 v6, 0x61

    goto :goto_2

    :cond_1
    const/16 v6, 0x13

    :goto_2
    if-eq v6, v5, :cond_2

    goto :goto_3

    :cond_2
    const-string/jumbo v5, "\u00a5\u00a3\u0091"

    .line 440
    invoke-static {}, Landroid/view/ViewConfiguration;->getZoomControlsTimeout()J

    move-result-wide v18

    const-wide/16 v16, 0x0

    cmp-long v6, v18, v16

    rsub-int v6, v6, 0x80

    invoke-static {v10, v10, v5, v6}, Lcom/appsflyer/internal/d$d;->values(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    goto :goto_4

    :cond_3
    :goto_3
    const/4 v0, 0x0

    .line 441
    :goto_4
    iget-object v5, v1, Lcom/appsflyer/internal/d$d;->AFInAppEventType:Landroid/content/Context;

    const-string/jumbo v6, "\u0082\u0094\u0096\u0084\u0087\u0096"

    invoke-static {}, Landroid/os/Process;->getElapsedCpuTime()J

    move-result-wide v18

    const-wide/16 v16, 0x0

    cmp-long v7, v18, v16

    rsub-int v7, v7, 0x80

    invoke-static {v10, v10, v6, v7}, Lcom/appsflyer/internal/d$d;->values(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/hardware/SensorManager;

    const/4 v6, -0x1

    .line 442
    invoke-virtual {v5, v6}, Landroid/hardware/SensorManager;->getSensorList(I)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    .line 443
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    new-array v7, v14, [I

    const v18, 0x5af85f0f

    aput v18, v7, v15

    const v18, -0x7390aaa6

    aput v18, v7, v13

    const-wide/16 v16, 0x0

    invoke-static/range {v16 .. v17}, Landroid/widget/ExpandableListView;->getPackedPositionChild(J)I

    move-result v8

    neg-int v8, v8

    invoke-static {v7, v8}, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper([II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v4, "\u0091\u00a6"

    invoke-static {}, Landroid/view/ViewConfiguration;->getMaximumFlingVelocity()I

    move-result v7

    shr-int/2addr v7, v12

    add-int/lit8 v7, v7, 0x7f

    invoke-static {v10, v10, v4, v7}, Lcom/appsflyer/internal/d$d;->values(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    new-array v0, v14, [I

    const v4, -0x5746d296

    aput v4, v0, v15

    const v4, -0x5460b196

    aput v4, v0, v13

    invoke-static {}, Landroid/view/ViewConfiguration;->getWindowTouchSlop()I

    move-result v4

    shr-int/2addr v4, v11

    rsub-int/lit8 v4, v4, 0x2

    invoke-static {v0, v4}, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper([II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    new-array v0, v14, [I

    const v4, 0x2e1edeaa

    aput v4, v0, v15

    const v4, 0x75ed9b1

    aput v4, v0, v13

    invoke-static {v2, v9, v15, v15}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;CII)I

    move-result v2

    const/4 v4, 0x3

    add-int/2addr v2, v4

    invoke-static {v0, v2}, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper([II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v1, Lcom/appsflyer/internal/d$d;->AFInAppEventParameterName:Ljava/util/Map;

    .line 447
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 448
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/appsflyer/internal/d$d$a;->AFInAppEventParameterName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 454
    sget v2, Lcom/appsflyer/internal/d$d;->AFVersionDeclaration:I

    add-int/lit8 v2, v2, 0x43

    rem-int/lit16 v3, v2, 0x80

    sput v3, Lcom/appsflyer/internal/d$d;->getLevel:I

    rem-int/2addr v2, v14

    goto :goto_5

    :catch_1
    move-exception v0

    .line 451
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v4, 0x16

    new-array v4, v4, [I

    fill-array-data v4, :array_1

    invoke-static {v15, v15}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    rsub-int/lit8 v5, v5, 0x2c

    invoke-static {v4, v5}, Lcom/appsflyer/internal/d$d;->AFKeystoreWrapper([II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->AFKeystoreWrapper(Ljava/lang/String;)V

    .line 452
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/view/ViewConfiguration;->getMaximumDrawingCacheSize()I

    move-result v2

    shr-int/lit8 v2, v2, 0x18

    rsub-int/lit8 v2, v2, 0x7f

    const-string/jumbo v3, "\u00a4\u0083\u008d\u0090\u0092\u00a2\u00a2\u0093\u00a1\u0093\u00a1\u00a7\u009d\u00a7\u009d\u0088"

    invoke-static {v10, v10, v3, v2}, Lcom/appsflyer/internal/d$d;->values(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_5
    return-object v0

    :array_0
    .array-data 4
        -0x742f6bb2
        -0x229dc20e
        0x7e2133b6
        -0x74a0a501
        0x11990337
        -0x2c859781
        -0x459dd338
        -0x1c1e0ec5
        -0x7677bd5d
        0x4d90df9f    # 3.038218E8f
        -0x4b2e5f99
        0x1c76ad32
        0x1e78ee24
        -0x55358dc5
        -0x5449c996
        -0x56c8600
        -0x2daa4283
        -0x485a17bb
        -0x76f489ca
        -0x28a4214b
        -0x586f505a
        0xebe0b91
    .end array-data

    :array_1
    .array-data 4
        -0x742f6bb2
        -0x229dc20e
        0x7e2133b6
        -0x74a0a501
        0x11990337
        -0x2c859781
        -0x459dd338
        -0x1c1e0ec5
        -0x7677bd5d
        0x4d90df9f    # 3.038218E8f
        -0x4b2e5f99
        0x1c76ad32
        0x1e78ee24
        -0x55358dc5
        -0x5449c996
        -0x56c8600
        -0x2daa4283
        -0x485a17bb
        -0x76f489ca
        -0x28a4214b
        -0x586f505a
        0xebe0b91
    .end array-data
.end method

.method private static values(Ljava/lang/String;[ILjava/lang/String;I)Ljava/lang/String;
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

    .line 2163
    sget-object v0, Lcom/appsflyer/internal/dq;->valueOf:Ljava/lang/Object;

    monitor-enter v0

    .line 2165
    :try_start_0
    sget-object v1, Lcom/appsflyer/internal/d$d;->valueOf:[C

    .line 2166
    sget v2, Lcom/appsflyer/internal/d$d;->values:I

    .line 2168
    sget-boolean v3, Lcom/appsflyer/internal/d$d;->AFLogger$LogLevel:Z

    const/4 v4, 0x0

    if-eqz v3, :cond_3

    .line 2171
    array-length p0, p2

    .line 2172
    sput p0, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    new-array p0, p0, [C

    .line 2174
    sput v4, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    :goto_0
    sget p1, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    sget v3, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    if-ge p1, v3, :cond_2

    .line 2176
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

    .line 2174
    sget p1, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    add-int/lit8 p1, p1, 0x1

    sput p1, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    goto :goto_0

    .line 2179
    :cond_2
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([C)V

    monitor-exit v0

    return-object p1

    .line 2182
    :cond_3
    sget-boolean p2, Lcom/appsflyer/internal/d$d;->AppsFlyer2dXConversionCallback:Z

    if-eqz p2, :cond_5

    .line 2185
    array-length p1, p0

    .line 2186
    sput p1, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    new-array p1, p1, [C

    .line 2188
    sput v4, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    :goto_1
    sget p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    sget v3, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    if-ge p2, v3, :cond_4

    .line 2190
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

    .line 2188
    sget p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    add-int/lit8 p2, p2, 0x1

    sput p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    goto :goto_1

    .line 2193
    :cond_4
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, p1}, Ljava/lang/String;-><init>([C)V

    monitor-exit v0

    return-object p0

    .line 2199
    :cond_5
    array-length p0, p1

    .line 2200
    sput p0, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    new-array p0, p0, [C

    .line 2202
    sput v4, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    :goto_2
    sget p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    sget v3, Lcom/appsflyer/internal/dq;->AFInAppEventType:I

    if-ge p2, v3, :cond_6

    .line 2204
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

    .line 2202
    sget p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    add-int/lit8 p2, p2, 0x1

    sput p2, Lcom/appsflyer/internal/dq;->AFInAppEventParameterName:I

    goto :goto_2

    .line 2207
    :cond_6
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([C)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p1

    :catchall_0
    move-exception p0

    .line 2209
    monitor-exit v0

    throw p0
.end method
