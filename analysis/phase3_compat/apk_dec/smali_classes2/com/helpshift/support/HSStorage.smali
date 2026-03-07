.class public final Lcom/helpshift/support/HSStorage;
.super Ljava/lang/Object;
.source "HSStorage.java"


# static fields
.field static final TAG:Ljava/lang/String; = "HelpShiftDebug"

.field private static cachedSearchIndex:Lcom/helpshift/support/model/FaqSearchIndex;


# instance fields
.field private context:Landroid/content/Context;

.field private final dbFile:Ljava/lang/String;

.field private migrationBackupData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private storage:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "fullIndex.db"

    .line 31
    iput-object v0, p0, Lcom/helpshift/support/HSStorage;->dbFile:Ljava/lang/String;

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/helpshift/support/HSStorage;->migrationBackupData:Ljava/util/Map;

    .line 42
    iput-object p1, p0, Lcom/helpshift/support/HSStorage;->context:Landroid/content/Context;

    const-string v0, "HSJsonData"

    const/4 v1, 0x0

    .line 43
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    return-void
.end method

.method private storageGet(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 55
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    const-string v1, ""

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private storageGetArr(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 51
    new-instance v0, Lorg/json/JSONArray;

    iget-object v1, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    const-string v2, "[]"

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private storageGetInt(Ljava/lang/String;)Ljava/lang/Integer;
    .locals 1

    const/4 v0, 0x0

    .line 59
    invoke-direct {p0, p1, v0}, Lcom/helpshift/support/HSStorage;->storageGetInt(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method private storageGetInt(Ljava/lang/String;I)Ljava/lang/Integer;
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method private storageGetLong(Ljava/lang/String;)Ljava/lang/Long;
    .locals 3

    .line 79
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    const-wide/16 v1, 0x0

    invoke-interface {v0, p1, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method private storageGetObj(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 47
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    const-string v2, "{}"

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private storageSet(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 108
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 109
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private storageSet(Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 102
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 103
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private storageSet(Ljava/lang/String;Ljava/lang/Long;)V
    .locals 3

    .line 113
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 114
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0, p1, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 115
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private storageSet(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 96
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 97
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private storageSet(Ljava/lang/String;Lorg/json/JSONArray;)V
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 84
    invoke-virtual {p2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 85
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private storageSet(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 90
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 91
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method


# virtual methods
.method public backupForMigration()V
    .locals 3

    .line 119
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->migrationBackupData:Ljava/util/Map;

    const-string v1, "installCredsHash"

    .line 120
    invoke-virtual {p0, v1}, Lcom/helpshift/support/HSStorage;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 119
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected clearDatabase()V
    .locals 1

    .line 134
    invoke-static {}, Lcom/helpshift/support/storage/FaqsDataSource;->getInstance()Lcom/helpshift/support/storage/FaqsDataSource;

    move-result-object v0

    .line 135
    invoke-virtual {v0}, Lcom/helpshift/support/storage/FaqsDataSource;->clearDB()V

    .line 136
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 137
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 138
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method protected clearLegacySearchIndexFile()V
    .locals 2

    .line 143
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->context:Landroid/content/Context;

    const-string v1, "tfidf.db"

    invoke-virtual {v0, v1}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    return-void
.end method

.method public contains(Ljava/lang/String;)Z
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    invoke-interface {v0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method protected deleteIndex()V
    .locals 2

    const/4 v0, 0x0

    .line 245
    sput-object v0, Lcom/helpshift/support/HSStorage;->cachedSearchIndex:Lcom/helpshift/support/model/FaqSearchIndex;

    .line 246
    invoke-static {}, Lcom/helpshift/support/search/storage/SearchTokenDaoImpl;->getInstance()Lcom/helpshift/support/search/SearchTokenDao;

    move-result-object v0

    .line 247
    invoke-interface {v0}, Lcom/helpshift/support/search/SearchTokenDao;->clear()V

    .line 248
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->context:Landroid/content/Context;

    const-string v1, "fullIndex.db"

    invoke-virtual {v0, v1}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    .line 249
    invoke-virtual {p0}, Lcom/helpshift/support/HSStorage;->unsetDBFlag()V

    return-void
.end method

.method protected getApplicationVersion()Ljava/lang/String;
    .locals 1

    const-string v0, "applicationVersion"

    .line 155
    invoke-direct {p0, v0}, Lcom/helpshift/support/HSStorage;->storageGet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getDBFlag()Ljava/lang/Boolean;
    .locals 1

    const-string v0, "dbFlag"

    .line 233
    invoke-virtual {p0, v0}, Lcom/helpshift/support/HSStorage;->storageGetBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method protected getFailedApiCalls()Lorg/json/JSONObject;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "failedApiCalls"

    .line 253
    invoke-direct {p0, v0}, Lcom/helpshift/support/HSStorage;->storageGetObj(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method getLastErrorReportedTime()J
    .locals 2

    const-string v0, "lastErrorReportedTime"

    .line 264
    invoke-direct {p0, v0}, Lcom/helpshift/support/HSStorage;->storageGetLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method protected getLaunchReviewCounter()I
    .locals 1

    const-string v0, "launchReviewCounter"

    .line 171
    invoke-direct {p0, v0}, Lcom/helpshift/support/HSStorage;->storageGetInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method protected getLibraryVersion()Ljava/lang/String;
    .locals 1

    const-string v0, "libraryVersion"

    .line 147
    invoke-direct {p0, v0}, Lcom/helpshift/support/HSStorage;->storageGet(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getReviewCounter()I
    .locals 1

    const-string v0, "reviewCounter"

    .line 163
    invoke-direct {p0, v0}, Lcom/helpshift/support/HSStorage;->storageGetInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method protected getStoredFiles()Lorg/json/JSONArray;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "cachedImages"

    .line 179
    invoke-direct {p0, v0}, Lcom/helpshift/support/HSStorage;->storageGetArr(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 276
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    const-string v1, ""

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method isCacheSearchIndexNull()Z
    .locals 1

    .line 272
    sget-object v0, Lcom/helpshift/support/HSStorage;->cachedSearchIndex:Lcom/helpshift/support/model/FaqSearchIndex;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected loadIndex()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassCastException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 209
    sget-object v0, Lcom/helpshift/support/HSStorage;->cachedSearchIndex:Lcom/helpshift/support/model/FaqSearchIndex;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 217
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/support/HSStorage;->context:Landroid/content/Context;

    const-string v2, "fullIndex.db"

    invoke-virtual {v1, v2}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 218
    :try_start_1
    new-instance v2, Ljava/io/ObjectInputStream;

    invoke-direct {v2, v1}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 219
    :try_start_2
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/helpshift/support/model/FaqSearchIndex;

    sput-object v0, Lcom/helpshift/support/HSStorage;->cachedSearchIndex:Lcom/helpshift/support/model/FaqSearchIndex;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 222
    invoke-static {v1}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 223
    invoke-static {v2}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v2

    move-object v3, v2

    move-object v2, v0

    move-object v0, v3

    goto :goto_0

    :catchall_2
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    move-object v1, v2

    .line 222
    :goto_0
    invoke-static {v1}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 223
    invoke-static {v2}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 224
    throw v0
.end method

.method protected readIndex()Lcom/helpshift/support/model/FaqSearchIndex;
    .locals 1

    .line 229
    sget-object v0, Lcom/helpshift/support/HSStorage;->cachedSearchIndex:Lcom/helpshift/support/model/FaqSearchIndex;

    return-object v0
.end method

.method public restoreMigrationData()V
    .locals 3

    .line 124
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->migrationBackupData:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 125
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 126
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v2, v1}, Lcom/helpshift/support/HSStorage;->storageSet(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 130
    :cond_1
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->migrationBackupData:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method protected setApplicationVersion(Ljava/lang/String;)V
    .locals 1

    const-string v0, "applicationVersion"

    .line 159
    invoke-direct {p0, v0, p1}, Lcom/helpshift/support/HSStorage;->storageSet(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected setDBFlag()V
    .locals 2

    const/4 v0, 0x1

    .line 237
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "dbFlag"

    invoke-direct {p0, v1, v0}, Lcom/helpshift/support/HSStorage;->storageSet(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method setLastErrorReportedTime(J)V
    .locals 0

    .line 268
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const-string p2, "lastErrorReportedTime"

    invoke-direct {p0, p2, p1}, Lcom/helpshift/support/HSStorage;->storageSet(Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method protected setLaunchReviewCounter(I)V
    .locals 1

    .line 175
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v0, "launchReviewCounter"

    invoke-direct {p0, v0, p1}, Lcom/helpshift/support/HSStorage;->storageSet(Ljava/lang/String;Ljava/lang/Integer;)V

    return-void
.end method

.method protected setLibraryVersion(Ljava/lang/String;)V
    .locals 1

    const-string v0, "libraryVersion"

    .line 151
    invoke-direct {p0, v0, p1}, Lcom/helpshift/support/HSStorage;->storageSet(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected setReviewCounter(I)V
    .locals 1

    .line 167
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string v0, "reviewCounter"

    invoke-direct {p0, v0, p1}, Lcom/helpshift/support/HSStorage;->storageSet(Ljava/lang/String;Ljava/lang/Integer;)V

    return-void
.end method

.method protected setStoredFiles(Lorg/json/JSONArray;)V
    .locals 1

    const-string v0, "cachedImages"

    .line 183
    invoke-direct {p0, v0, p1}, Lcom/helpshift/support/HSStorage;->storageSet(Ljava/lang/String;Lorg/json/JSONArray;)V

    return-void
.end method

.method public storageGetBoolean(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 2

    .line 75
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public storageGetFloat(Ljava/lang/String;)Ljava/lang/Float;
    .locals 2

    .line 67
    iget-object v0, p0, Lcom/helpshift/support/HSStorage;->storage:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    return-object p1
.end method

.method protected storeFailedApiCall(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 258
    invoke-virtual {p0}, Lcom/helpshift/support/HSStorage;->getFailedApiCalls()Lorg/json/JSONObject;

    move-result-object v0

    .line 259
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "failedApiCalls"

    .line 260
    invoke-direct {p0, p1, v0}, Lcom/helpshift/support/HSStorage;->storageSet(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method protected storeIndex(Lcom/helpshift/support/model/FaqSearchIndex;)V
    .locals 4

    .line 187
    sput-object p1, Lcom/helpshift/support/HSStorage;->cachedSearchIndex:Lcom/helpshift/support/model/FaqSearchIndex;

    const/4 v0, 0x0

    .line 191
    :try_start_0
    iget-object v1, p0, Lcom/helpshift/support/HSStorage;->context:Landroid/content/Context;

    const-string v2, "fullIndex.db"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 192
    :try_start_1
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 194
    :try_start_2
    invoke-virtual {v2, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 195
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->flush()V

    .line 196
    invoke-virtual {p0}, Lcom/helpshift/support/HSStorage;->setDBFlag()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 202
    invoke-static {v1}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    goto :goto_3

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_1

    :catchall_1
    move-exception p1

    move-object v2, v0

    :goto_0
    move-object v0, v1

    goto :goto_4

    :catch_1
    move-exception p1

    move-object v2, v0

    :goto_1
    move-object v0, v1

    goto :goto_2

    :catchall_2
    move-exception p1

    move-object v2, v0

    goto :goto_4

    :catch_2
    move-exception p1

    move-object v2, v0

    :goto_2
    :try_start_3
    const-string v1, "HelpShiftDebug"

    const-string v3, "store index"

    .line 199
    invoke-static {v1, v3, p1}, Lcom/helpshift/util/HSLogger;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 202
    invoke-static {v0}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 203
    :goto_3
    invoke-static {v2}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    return-void

    :catchall_3
    move-exception p1

    .line 202
    :goto_4
    invoke-static {v0}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 203
    invoke-static {v2}, Lcom/helpshift/util/IOUtils;->closeQuitely(Ljava/io/Closeable;)V

    .line 204
    throw p1
.end method

.method protected unsetDBFlag()V
    .locals 2

    const/4 v0, 0x0

    .line 241
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    const-string v1, "dbFlag"

    invoke-direct {p0, v1, v0}, Lcom/helpshift/support/HSStorage;->storageSet(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method
