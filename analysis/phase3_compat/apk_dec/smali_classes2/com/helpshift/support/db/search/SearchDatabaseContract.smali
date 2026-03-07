.class public Lcom/helpshift/support/db/search/SearchDatabaseContract;
.super Ljava/lang/Object;
.source "SearchDatabaseContract.java"

# interfaces
.implements Lcom/helpshift/db/base/DatabaseContract;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_SearchDB"


# instance fields
.field private final CREATE_SEARCH_TABLE:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "CREATE TABLE search_token_table (token TEXT PRIMARY KEY , type INTEGER , score TEXT NOT NULL  )"

    .line 13
    iput-object v0, p0, Lcom/helpshift/support/db/search/SearchDatabaseContract;->CREATE_SEARCH_TABLE:Ljava/lang/String;

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

    const-string v0, "CREATE TABLE search_token_table (token TEXT PRIMARY KEY , type INTEGER , score TEXT NOT NULL  )"

    .line 32
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .line 27
    invoke-static {}, Lcom/helpshift/support/db/SupportDBNameRepo;->getSearchDbName()Ljava/lang/String;

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

    .line 37
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

    const-string v0, "search_token_table"

    .line 42
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    const-string v0, "Helpshift_SearchDB"

    return-object v0
.end method
