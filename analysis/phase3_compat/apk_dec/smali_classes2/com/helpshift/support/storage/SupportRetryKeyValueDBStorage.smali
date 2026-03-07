.class Lcom/helpshift/support/storage/SupportRetryKeyValueDBStorage;
.super Lcom/helpshift/storage/BaseRetryKeyValueStorage;
.source "SupportRetryKeyValueDBStorage.java"


# instance fields
.field private final context:Landroid/content/Context;

.field private sqLiteOpenHelper:Lcom/helpshift/support/db/support_key_value/SupportKeyValueDbStorageHelper;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 17
    invoke-direct {p0}, Lcom/helpshift/storage/BaseRetryKeyValueStorage;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/helpshift/support/storage/SupportRetryKeyValueDBStorage;->context:Landroid/content/Context;

    .line 19
    new-instance v0, Lcom/helpshift/support/db/support_key_value/SupportKeyValueDbStorageHelper;

    new-instance v1, Lcom/helpshift/support/db/support_key_value/SupportKeyValueDatabaseContract;

    invoke-direct {v1}, Lcom/helpshift/support/db/support_key_value/SupportKeyValueDatabaseContract;-><init>()V

    invoke-direct {v0, p1, v1}, Lcom/helpshift/support/db/support_key_value/SupportKeyValueDbStorageHelper;-><init>(Landroid/content/Context;Lcom/helpshift/db/base/DatabaseContract;)V

    iput-object v0, p0, Lcom/helpshift/support/storage/SupportRetryKeyValueDBStorage;->sqLiteOpenHelper:Lcom/helpshift/support/db/support_key_value/SupportKeyValueDbStorageHelper;

    .line 20
    new-instance p1, Lcom/helpshift/storage/KeyValueDbStorage;

    invoke-direct {p1, v0}, Lcom/helpshift/storage/KeyValueDbStorage;-><init>(Landroid/database/sqlite/SQLiteOpenHelper;)V

    iput-object p1, p0, Lcom/helpshift/support/storage/SupportRetryKeyValueDBStorage;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    return-void
.end method


# virtual methods
.method protected reInitiateDbInstance()V
    .locals 3

    .line 27
    :try_start_0
    iget-object v0, p0, Lcom/helpshift/support/storage/SupportRetryKeyValueDBStorage;->sqLiteOpenHelper:Lcom/helpshift/support/db/support_key_value/SupportKeyValueDbStorageHelper;

    if-eqz v0, :cond_0

    .line 28
    invoke-virtual {v0}, Lcom/helpshift/support/db/support_key_value/SupportKeyValueDbStorageHelper;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Helpshift_RetryKeyValue"

    const-string v2, "Error in closing DB"

    .line 32
    invoke-static {v1, v2, v0}, Lcom/helpshift/util/HSLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 35
    :cond_0
    :goto_0
    new-instance v0, Lcom/helpshift/support/db/support_key_value/SupportKeyValueDbStorageHelper;

    iget-object v1, p0, Lcom/helpshift/support/storage/SupportRetryKeyValueDBStorage;->context:Landroid/content/Context;

    new-instance v2, Lcom/helpshift/support/db/support_key_value/SupportKeyValueDatabaseContract;

    invoke-direct {v2}, Lcom/helpshift/support/db/support_key_value/SupportKeyValueDatabaseContract;-><init>()V

    invoke-direct {v0, v1, v2}, Lcom/helpshift/support/db/support_key_value/SupportKeyValueDbStorageHelper;-><init>(Landroid/content/Context;Lcom/helpshift/db/base/DatabaseContract;)V

    iput-object v0, p0, Lcom/helpshift/support/storage/SupportRetryKeyValueDBStorage;->sqLiteOpenHelper:Lcom/helpshift/support/db/support_key_value/SupportKeyValueDbStorageHelper;

    .line 36
    new-instance v1, Lcom/helpshift/storage/KeyValueDbStorage;

    invoke-direct {v1, v0}, Lcom/helpshift/storage/KeyValueDbStorage;-><init>(Landroid/database/sqlite/SQLiteOpenHelper;)V

    iput-object v1, p0, Lcom/helpshift/support/storage/SupportRetryKeyValueDBStorage;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    return-void
.end method
