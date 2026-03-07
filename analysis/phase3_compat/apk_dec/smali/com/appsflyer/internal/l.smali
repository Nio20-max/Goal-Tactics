.class public final Lcom/appsflyer/internal/l;
.super Ljava/lang/Object;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/l$d;
    }
.end annotation


# instance fields
.field final AFKeystoreWrapper:Lcom/appsflyer/internal/be;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/appsflyer/internal/be;)V
    .locals 0

    .line 1035
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1036
    iput-object p1, p0, Lcom/appsflyer/internal/l;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    return-void
.end method

.method private static values(Ljava/io/File;)Lcom/appsflyer/internal/n;
    .locals 4

    const/4 v0, 0x0

    .line 10155
    :try_start_0
    new-instance v1, Ljava/io/FileReader;

    invoke-direct {v1, p0}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10156
    :try_start_1
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v3, v2

    new-array v2, v3, [C

    .line 10157
    invoke-virtual {v1, v2}, Ljava/io/Reader;->read([C)I

    .line 10158
    new-instance v3, Lcom/appsflyer/internal/n;

    invoke-direct {v3, v2}, Lcom/appsflyer/internal/n;-><init>([C)V

    .line 10159
    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    .line 11095
    iput-object p0, v3, Lcom/appsflyer/internal/n;->AFInAppEventParameterName:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10166
    :try_start_2
    invoke-virtual {v1}, Ljava/io/Reader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 10169
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/Throwable;)V

    :goto_0
    return-object v3

    :catchall_0
    move-exception p0

    move-object v0, v1

    goto :goto_1

    :catchall_1
    move-exception p0

    :goto_1
    if-eqz v0, :cond_0

    .line 10166
    :try_start_3
    invoke-virtual {v0}, Ljava/io/Reader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    .line 10169
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/Throwable;)V

    .line 10171
    :cond_0
    :goto_2
    throw p0

    :catch_2
    move-object v1, v0

    :catch_3
    if-eqz v1, :cond_1

    .line 10166
    :try_start_4
    invoke-virtual {v1}, Ljava/io/Reader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_3

    :catch_4
    move-exception p0

    .line 10169
    invoke-static {p0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/Throwable;)V

    :cond_1
    :goto_3
    return-object v0
.end method


# virtual methods
.method public final AFInAppEventParameterName(Lcom/appsflyer/internal/n;)Ljava/lang/String;
    .locals 6

    const-string v0, "AFRequestCache"

    const/4 v1, 0x0

    .line 2044
    :try_start_0
    new-instance v2, Ljava/io/File;

    .line 3040
    iget-object v3, p0, Lcom/appsflyer/internal/l;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    .line 4024
    iget-object v3, v3, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 2044
    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1071
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1073
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    return-object v1

    .line 1076
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 1077
    array-length v2, v2

    const/16 v3, 0x28

    if-le v2, v3, :cond_1

    const-string p1, "CACHE: reached cache limit, not caching request"

    .line 1078
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    return-object v1

    .line 1081
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "CACHE: caching request with URL: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 4087
    iget-object v3, p1, Lcom/appsflyer/internal/n;->valueOf:Ljava/lang/String;

    .line 1081
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 1082
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    .line 1084
    new-instance v3, Ljava/io/File;

    .line 5044
    new-instance v4, Ljava/io/File;

    .line 6040
    iget-object v5, p0, Lcom/appsflyer/internal/l;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    .line 7024
    iget-object v5, v5, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 5044
    invoke-virtual {v5}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1084
    invoke-direct {v3, v4, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1085
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 1086
    new-instance v0, Ljava/io/OutputStreamWriter;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    invoke-direct {v4, v3, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    invoke-direct {v0, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    const-string/jumbo v3, "version="

    .line 1087
    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 7079
    iget-object v3, p1, Lcom/appsflyer/internal/n;->AFInAppEventType:Ljava/lang/String;

    .line 1088
    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const/16 v3, 0xa

    .line 1089
    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(I)V

    const-string/jumbo v4, "url="

    .line 1091
    invoke-virtual {v0, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 7087
    iget-object v4, p1, Lcom/appsflyer/internal/n;->valueOf:Ljava/lang/String;

    .line 1092
    invoke-virtual {v0, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1093
    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(I)V

    const-string v4, "data="

    .line 1095
    invoke-virtual {v0, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1096
    invoke-virtual {p1}, Lcom/appsflyer/internal/n;->AFInAppEventParameterName()[B

    move-result-object v4

    const/4 v5, 0x2

    invoke-static {v4, v5}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1097
    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(I)V

    .line 7100
    iget-object p1, p1, Lcom/appsflyer/internal/n;->AFKeystoreWrapper:Lcom/appsflyer/internal/bt;

    if-eqz p1, :cond_2

    const-string/jumbo v4, "type="

    .line 1101
    invoke-virtual {v0, v4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1102
    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1103
    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(I)V

    .line 1106
    :cond_2
    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    const-string p1, "CACHE: done, cacheKey: "

    .line 1108
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1117
    :try_start_2
    invoke-virtual {v0}, Ljava/io/Writer;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 1120
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/Throwable;)V

    :goto_0
    return-object v2

    :catch_1
    move-exception p1

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_2
    move-exception p1

    move-object v0, v1

    :goto_1
    :try_start_3
    const-string v2, "CACHE: Could not cache request"

    .line 1112
    invoke-static {v2, p1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v0, :cond_3

    .line 1117
    :try_start_4
    invoke-virtual {v0}, Ljava/io/Writer;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_2

    :catch_3
    move-exception p1

    .line 1120
    invoke-static {p1}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    return-object v1

    :catchall_1
    move-exception p1

    move-object v1, v0

    :goto_3
    if-eqz v1, :cond_4

    .line 1117
    :try_start_5
    invoke-virtual {v1}, Ljava/io/Writer;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_4

    :catch_4
    move-exception v0

    .line 1120
    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/Throwable;)V

    .line 1122
    :cond_4
    :goto_4
    throw p1
.end method

.method public final AFInAppEventType()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/appsflyer/internal/n;",
            ">;"
        }
    .end annotation

    .line 7128
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8044
    :try_start_0
    new-instance v1, Ljava/io/File;

    .line 9040
    iget-object v2, p0, Lcom/appsflyer/internal/l;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    .line 10024
    iget-object v2, v2, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 8044
    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "AFRequestCache"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 7132
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 7133
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    .line 7135
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    if-nez v1, :cond_1

    return-object v0

    .line 7140
    :cond_1
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    .line 7141
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "CACHE: Found cached request"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 7142
    invoke-static {v4}, Lcom/appsflyer/internal/l;->values(Ljava/io/File;)Lcom/appsflyer/internal/n;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "CACHE: Could not get cached requests"

    .line 7145
    invoke-static {v2, v1}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    return-object v0
.end method

.method public final valueOf(Ljava/lang/String;)Z
    .locals 4

    .line 12044
    new-instance v0, Ljava/io/File;

    .line 13040
    iget-object v1, p0, Lcom/appsflyer/internal/l;->AFKeystoreWrapper:Lcom/appsflyer/internal/be;

    .line 14024
    iget-object v1, v1, Lcom/appsflyer/internal/be;->values:Landroid/content/Context;

    .line 12044
    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "AFRequestCache"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 11182
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 11183
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "CACHE: Deleting "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " from cache"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/appsflyer/AFLogger;->values(Ljava/lang/String;)V

    .line 11184
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 11186
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception v0

    .line 11188
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "CACHE: Could not delete "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v0}, Lcom/appsflyer/AFLogger;->valueOf(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method
