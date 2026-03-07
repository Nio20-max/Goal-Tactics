.class public Lcom/helpshift/support/db/support_key_value/SupportKeyValueDatabaseContract;
.super Ljava/lang/Object;
.source "SupportKeyValueDatabaseContract.java"

# interfaces
.implements Lcom/helpshift/db/base/DatabaseContract;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_SupportKeyValueDB"


# instance fields
.field private final CREATE_KEY_VALUE_TABLE:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "CREATE TABLE key_value_store(key text primary key,value blob not null);"

    .line 13
    iput-object v0, p0, Lcom/helpshift/support/db/support_key_value/SupportKeyValueDatabaseContract;->CREATE_KEY_VALUE_TABLE:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getCreateTableQueries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "CREATE TABLE key_value_store(key text primary key,value blob not null);"

    .line 30
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .line 25
    invoke-static {}, Lcom/helpshift/support/db/SupportDBNameRepo;->getSupportKvDbName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseVersion()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getMigratorsForUpgrade(I)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/helpshift/db/base/IMigrator;",
            ">;"
        }
    .end annotation

    .line 35
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getTableNames()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "key_value_store"

    .line 40
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    const-string v0, "Helpshift_SupportKeyValueDB"

    return-object v0
.end method
