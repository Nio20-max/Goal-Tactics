.class public Lcom/helpshift/storage/RetryKeyValueDbStorage;
.super Lcom/helpshift/storage/BaseRetryKeyValueStorage;
.source "RetryKeyValueDbStorage.java"


# static fields
.field private static final backupFileName:Ljava/lang/String; = "__hs__kv_backup"


# instance fields
.field private final context:Landroid/content/Context;

.field private sqLiteOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 19
    invoke-direct {p0}, Lcom/helpshift/storage/BaseRetryKeyValueStorage;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/helpshift/storage/RetryKeyValueDbStorage;->context:Landroid/content/Context;

    .line 21
    new-instance v0, Lcom/helpshift/db/key_value/KeyValueDbStorageHelper;

    new-instance v1, Lcom/helpshift/db/key_value/KeyValueDatabaseContract;

    invoke-direct {v1}, Lcom/helpshift/db/key_value/KeyValueDatabaseContract;-><init>()V

    invoke-direct {v0, p1, v1}, Lcom/helpshift/db/key_value/KeyValueDbStorageHelper;-><init>(Landroid/content/Context;Lcom/helpshift/db/base/DatabaseContract;)V

    iput-object v0, p0, Lcom/helpshift/storage/RetryKeyValueDbStorage;->sqLiteOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    .line 22
    new-instance p1, Lcom/helpshift/storage/KeyValueDbStorage;

    invoke-direct {p1, v0}, Lcom/helpshift/storage/KeyValueDbStorage;-><init>(Landroid/database/sqlite/SQLiteOpenHelper;)V

    iput-object p1, p0, Lcom/helpshift/storage/RetryKeyValueDbStorage;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    return-void
.end method


# virtual methods
.method protected reInitiateDbInstance()V
    .locals 3

    .line 28
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/storage/RetryKeyValueDbStorage;->sqLiteOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    if-eqz v0, :cond_0

    .line 29
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Helpshift_RetryKeyValue"

    const-string v2, "Error in closing DB"

    .line 33
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    :cond_0
    :goto_0
    new-instance v0, Lcom/helpshift/db/key_value/KeyValueDbStorageHelper;

    iget-object v1, p0, Lcom/helpshift/storage/RetryKeyValueDbStorage;->context:Landroid/content/Context;

    new-instance v2, Lcom/helpshift/db/key_value/KeyValueDatabaseContract;

    invoke-direct {v2}, Lcom/helpshift/db/key_value/KeyValueDatabaseContract;-><init>()V

    invoke-direct {v0, v1, v2}, Lcom/helpshift/db/key_value/KeyValueDbStorageHelper;-><init>(Landroid/content/Context;Lcom/helpshift/db/base/DatabaseContract;)V

    iput-object v0, p0, Lcom/helpshift/storage/RetryKeyValueDbStorage;->sqLiteOpenHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    .line 39
    new-instance v1, Lcom/helpshift/storage/KeyValueDbStorage;

    invoke-direct {v1, v0}, Lcom/helpshift/storage/KeyValueDbStorage;-><init>(Landroid/database/sqlite/SQLiteOpenHelper;)V

    iput-object v1, p0, Lcom/helpshift/storage/RetryKeyValueDbStorage;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    return-void
.end method
