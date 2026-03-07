.class public Lcom/helpshift/db/network/HSNetworkDatabaseContract;
.super Ljava/lang/Object;
.source "HSNetworkDatabaseContract.java"

# interfaces
.implements Lcom/helpshift/db/base/DatabaseContract;


# static fields
.field private static final TAG:Ljava/lang/String; = "HelpshiftNetworkDB"


# instance fields
.field private final CREATE_URL_METADATA_TABLE:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "CREATE TABLE hs_url_metadata_table ( url TEXT PRIMARY KEY NOT NULL, last_fetch_ts INTEGER, etag TEXT, is_last_fetch_success INTEGER  );"

    .line 15
    iput-object v0, p0, Lcom/helpshift/db/network/HSNetworkDatabaseContract;->CREATE_URL_METADATA_TABLE:Ljava/lang/String;

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

    const-string v0, "CREATE TABLE hs_url_metadata_table ( url TEXT PRIMARY KEY NOT NULL, last_fetch_ts INTEGER, etag TEXT, is_last_fetch_success INTEGER  );"

    .line 37
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .line 32
    invoke-static {}, Lcom/helpshift/support/db/SupportDBNameRepo;->getNetworkDbName()Ljava/lang/String;

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

    .line 42
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

    const-string v0, "hs_url_metadata_table"

    .line 47
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    const-string v0, "HelpshiftNetworkDB"

    return-object v0
.end method
