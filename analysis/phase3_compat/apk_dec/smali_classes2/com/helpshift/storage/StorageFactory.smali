.class public Lcom/helpshift/storage/StorageFactory;
.super Ljava/lang/Object;
.source "StorageFactory.java"


# static fields
.field private static storageFactoryInstance:Lcom/helpshift/storage/StorageFactory;


# instance fields
.field public final keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;


# direct methods
.method constructor <init>()V
    .locals 2

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Lcom/helpshift/storage/RetryKeyValueDbStorage;

    invoke-static {}, Lcom/helpshift/util/HelpshiftContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/helpshift/storage/RetryKeyValueDbStorage;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/helpshift/storage/StorageFactory;->keyValueStorage:Lcom/helpshift/storage/KeyValueStorage;

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/helpshift/storage/StorageFactory;
    .locals 2

    const-class v0, Lcom/helpshift/storage/StorageFactory;

    monitor-enter v0

    .line 14
    :try_start_0
    sget-object v1, Lcom/helpshift/storage/StorageFactory;->storageFactoryInstance:Lcom/helpshift/storage/StorageFactory;

    if-nez v1, :cond_0

    .line 15
    new-instance v1, Lcom/helpshift/storage/StorageFactory;

    invoke-direct {v1}, Lcom/helpshift/storage/StorageFactory;-><init>()V

    sput-object v1, Lcom/helpshift/storage/StorageFactory;->storageFactoryInstance:Lcom/helpshift/storage/StorageFactory;

    .line 17
    :cond_0
    sget-object v1, Lcom/helpshift/storage/StorageFactory;->storageFactoryInstance:Lcom/helpshift/storage/StorageFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
