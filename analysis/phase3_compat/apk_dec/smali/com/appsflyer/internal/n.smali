.class public final Lcom/appsflyer/internal/n;
.super Ljava/lang/Object;
.source ""


# instance fields
.field AFInAppEventParameterName:Ljava/lang/String;

.field AFInAppEventType:Ljava/lang/String;

.field AFKeystoreWrapper:Lcom/appsflyer/internal/bt;

.field valueOf:Ljava/lang/String;

.field private values:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[BLjava/lang/String;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 1040
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/appsflyer/internal/n;-><init>(Ljava/lang/String;[BLjava/lang/String;Lcom/appsflyer/internal/bt;)V

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;[BLjava/lang/String;Lcom/appsflyer/internal/bt;)V
    .locals 0

    .line 1029
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1030
    iput-object p1, p0, Lcom/appsflyer/internal/n;->valueOf:Ljava/lang/String;

    .line 1031
    iput-object p2, p0, Lcom/appsflyer/internal/n;->values:[B

    .line 1032
    iput-object p3, p0, Lcom/appsflyer/internal/n;->AFInAppEventType:Ljava/lang/String;

    .line 1033
    iput-object p4, p0, Lcom/appsflyer/internal/n;->AFKeystoreWrapper:Lcom/appsflyer/internal/bt;

    return-void
.end method

.method public constructor <init>([C)V
    .locals 7

    .line 1043
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1044
    new-instance v0, Ljava/util/Scanner;

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1}, Ljava/lang/String;-><init>([C)V

    invoke-direct {v0, v1}, Ljava/util/Scanner;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    const/4 v1, 0x0

    .line 1047
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/util/Scanner;->hasNextLine()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1048
    invoke-virtual {v0}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "url="

    .line 1049
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x4

    if-eqz v3, :cond_1

    .line 1050
    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/appsflyer/internal/n;->valueOf:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string/jumbo v3, "version="

    .line 1051
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const/4 v5, 0x2

    if-eqz v3, :cond_2

    const/16 v3, 0x8

    .line 1052
    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/appsflyer/internal/n;->AFInAppEventType:Ljava/lang/String;

    const-string v2, "^(0|[1-9]\\d*)\\.(0|[1-9]\\d*)\\.(0|[1-9]\\d*)(?:-((?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\\.(?:0|[1-9]\\d*|\\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\\+([0-9a-zA-Z-]+(?:\\.[0-9a-zA-Z-]+)*))?$"

    .line 1053
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    iget-object v3, p0, Lcom/appsflyer/internal/n;->AFInAppEventType:Ljava/lang/String;

    .line 1056
    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 1057
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 p1, 0x1

    .line 1058
    invoke-virtual {v2, p1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    .line 1059
    invoke-virtual {v2, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    goto :goto_0

    :cond_2
    const-string v3, "data="

    .line 1061
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const/4 v6, 0x5

    if-eqz v3, :cond_4

    .line 1062
    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    if-gt p1, v4, :cond_3

    const/16 v3, 0xb

    if-ge v1, v3, :cond_3

    .line 1065
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    goto :goto_1

    :cond_3
    invoke-static {v2, v5}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    :goto_1
    iput-object v2, p0, Lcom/appsflyer/internal/n;->values:[B

    goto :goto_0

    :cond_4
    const-string/jumbo v3, "type="

    .line 1066
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1067
    invoke-virtual {v2, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 1069
    :try_start_0
    invoke-static {v2}, Lcom/appsflyer/internal/bt;->valueOf(Ljava/lang/String;)Lcom/appsflyer/internal/bt;

    move-result-object v3

    iput-object v3, p0, Lcom/appsflyer/internal/n;->AFKeystoreWrapper:Lcom/appsflyer/internal/bt;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    :catch_0
    move-exception v3

    .line 1071
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "CACHE: Unknown task type: "

    invoke-virtual {v4, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v3}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 1075
    :cond_5
    invoke-virtual {v0}, Ljava/util/Scanner;->close()V

    return-void
.end method

.method static AFInAppEventParameterName(Landroid/content/Context;)Lcom/appsflyer/internal/cj;
    .locals 1

    .line 149
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 150
    sget-object p0, Lcom/appsflyer/internal/cj;->values:Lcom/appsflyer/internal/cj;

    goto :goto_0

    .line 151
    :cond_0
    instance-of p0, p0, Landroid/app/Application;

    if-eqz p0, :cond_1

    .line 152
    sget-object p0, Lcom/appsflyer/internal/cj;->valueOf:Lcom/appsflyer/internal/cj;

    goto :goto_0

    .line 154
    :cond_1
    sget-object p0, Lcom/appsflyer/internal/cj;->AFKeystoreWrapper:Lcom/appsflyer/internal/cj;

    :goto_0
    return-object p0
.end method

.method public static AFInAppEventType(Ljava/util/Map;)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .line 30
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 31
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 32
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/appsflyer/internal/n;->valueOf(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 34
    :try_start_0
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static valueOf(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    if-nez p0, :cond_0

    .line 70
    sget-object p0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    return-object p0

    .line 72
    :cond_0
    instance-of v0, p0, Lorg/json/JSONArray;

    if-nez v0, :cond_a

    instance-of v0, p0, Lorg/json/JSONObject;

    if-eqz v0, :cond_1

    goto/16 :goto_3

    .line 75
    :cond_1
    sget-object v0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    return-object p0

    .line 79
    :cond_2
    :try_start_0
    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_4

    .line 80
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 81
    check-cast p0, Ljava/util/Collection;

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 82
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lcom/appsflyer/internal/n;->valueOf(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_3
    return-object v0

    .line 85
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 86
    invoke-static {p0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    .line 87
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v0, :cond_5

    .line 89
    invoke-static {p0, v2}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lcom/appsflyer/internal/n;->valueOf(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_5
    return-object v1

    .line 93
    :cond_6
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_7

    .line 95
    check-cast p0, Ljava/util/Map;

    invoke-static {p0}, Lcom/appsflyer/internal/n;->AFInAppEventType(Ljava/util/Map;)Lorg/json/JSONObject;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 97
    :cond_7
    instance-of v0, p0, Ljava/lang/Boolean;

    if-nez v0, :cond_9

    instance-of v0, p0, Ljava/lang/Byte;

    if-nez v0, :cond_9

    instance-of v0, p0, Ljava/lang/Character;

    if-nez v0, :cond_9

    instance-of v0, p0, Ljava/lang/Double;

    if-nez v0, :cond_9

    instance-of v0, p0, Ljava/lang/Float;

    if-nez v0, :cond_9

    instance-of v0, p0, Ljava/lang/Integer;

    if-nez v0, :cond_9

    instance-of v0, p0, Ljava/lang/Long;

    if-nez v0, :cond_9

    instance-of v0, p0, Ljava/lang/Short;

    if-nez v0, :cond_9

    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_8

    goto :goto_2

    .line 110
    :cond_8
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :cond_9
    :goto_2
    return-object p0

    .line 114
    :catch_0
    sget-object p0, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    :cond_a
    :goto_3
    return-object p0
.end method

.method public static valueOf(Lorg/json/JSONObject;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 118
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 119
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 120
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 121
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 122
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 123
    instance-of v4, v3, Lorg/json/JSONArray;

    if-eqz v4, :cond_0

    .line 124
    check-cast v3, Lorg/json/JSONArray;

    invoke-static {v3}, Lcom/appsflyer/internal/n;->values(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v3

    goto :goto_1

    .line 125
    :cond_0
    instance-of v4, v3, Lorg/json/JSONObject;

    if-eqz v4, :cond_1

    .line 126
    check-cast v3, Lorg/json/JSONObject;

    invoke-static {v3}, Lcom/appsflyer/internal/n;->valueOf(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v3

    .line 128
    :cond_1
    :goto_1
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private static values(Lorg/json/JSONArray;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 134
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 135
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 136
    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 137
    instance-of v3, v2, Lorg/json/JSONArray;

    if-eqz v3, :cond_0

    .line 138
    check-cast v2, Lorg/json/JSONArray;

    invoke-static {v2}, Lcom/appsflyer/internal/n;->values(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v2

    goto :goto_1

    .line 139
    :cond_0
    instance-of v3, v2, Lorg/json/JSONObject;

    if-eqz v3, :cond_1

    .line 140
    check-cast v2, Lorg/json/JSONObject;

    invoke-static {v2}, Lcom/appsflyer/internal/n;->valueOf(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v2

    .line 142
    :cond_1
    :goto_1
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method


# virtual methods
.method public final AFInAppEventParameterName()[B
    .locals 1

    .line 1083
    iget-object v0, p0, Lcom/appsflyer/internal/n;->values:[B

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_9

    .line 1107
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_3

    .line 1109
    :cond_1
    check-cast p1, Lcom/appsflyer/internal/n;

    .line 1111
    iget-object v2, p0, Lcom/appsflyer/internal/n;->AFInAppEventType:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v3, p1, Lcom/appsflyer/internal/n;->AFInAppEventType:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0

    :cond_2
    iget-object v2, p1, Lcom/appsflyer/internal/n;->AFInAppEventType:Ljava/lang/String;

    if-eqz v2, :cond_3

    :goto_0
    return v1

    .line 1112
    :cond_3
    iget-object v2, p0, Lcom/appsflyer/internal/n;->values:[B

    iget-object v3, p1, Lcom/appsflyer/internal/n;->values:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_4

    return v1

    .line 1113
    :cond_4
    iget-object v2, p0, Lcom/appsflyer/internal/n;->valueOf:Ljava/lang/String;

    if-eqz v2, :cond_5

    iget-object v3, p1, Lcom/appsflyer/internal/n;->valueOf:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    goto :goto_1

    :cond_5
    iget-object v2, p1, Lcom/appsflyer/internal/n;->valueOf:Ljava/lang/String;

    if-eqz v2, :cond_6

    :goto_1
    return v1

    .line 1115
    :cond_6
    iget-object v2, p0, Lcom/appsflyer/internal/n;->AFInAppEventParameterName:Ljava/lang/String;

    if-eqz v2, :cond_7

    iget-object v3, p1, Lcom/appsflyer/internal/n;->AFInAppEventParameterName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    goto :goto_2

    :cond_7
    iget-object v2, p1, Lcom/appsflyer/internal/n;->AFInAppEventParameterName:Ljava/lang/String;

    if-eqz v2, :cond_8

    :goto_2
    return v1

    .line 1117
    :cond_8
    iget-object v2, p0, Lcom/appsflyer/internal/n;->AFKeystoreWrapper:Lcom/appsflyer/internal/bt;

    iget-object p1, p1, Lcom/appsflyer/internal/n;->AFKeystoreWrapper:Lcom/appsflyer/internal/bt;

    if-ne v2, p1, :cond_9

    return v0

    :cond_9
    :goto_3
    return v1
.end method

.method public final hashCode()I
    .locals 3

    .line 1122
    iget-object v0, p0, Lcom/appsflyer/internal/n;->AFInAppEventType:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    .line 1123
    iget-object v2, p0, Lcom/appsflyer/internal/n;->values:[B

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([B)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 1124
    iget-object v2, p0, Lcom/appsflyer/internal/n;->valueOf:Ljava/lang/String;

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 1125
    iget-object v2, p0, Lcom/appsflyer/internal/n;->AFInAppEventParameterName:Ljava/lang/String;

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    goto :goto_2

    :cond_2
    const/4 v2, 0x0

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    .line 1126
    iget-object v2, p0, Lcom/appsflyer/internal/n;->AFKeystoreWrapper:Lcom/appsflyer/internal/bt;

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_3
    add-int/2addr v0, v1

    return v0
.end method
