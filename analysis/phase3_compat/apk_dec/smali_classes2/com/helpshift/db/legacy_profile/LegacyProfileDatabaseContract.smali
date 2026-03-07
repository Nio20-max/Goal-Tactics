.class public Lcom/helpshift/db/legacy_profile/LegacyProfileDatabaseContract;
.super Ljava/lang/Object;
.source "LegacyProfileDatabaseContract.java"

# interfaces
.implements Lcom/helpshift/db/base/DatabaseContract;


# static fields
.field private static final TAG:Ljava/lang/String; = "Helpshift_LProfileDB"


# instance fields
.field private final CREATE_PROFILE_TABLE:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "CREATE TABLE profiles(_id INTEGER PRIMARY KEY AUTOINCREMENT, IDENTIFIER TEXT NOT NULL UNIQUE, profile_id TEXT UNIQUE, name TEXT, email TEXT, salt TEXT, uid TEXT, did TEXT, push_token_sync INTEGER );"

    .line 18
    iput-object v0, p0, Lcom/helpshift/db/legacy_profile/LegacyProfileDatabaseContract;->CREATE_PROFILE_TABLE:Ljava/lang/String;

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

    const-string v0, "CREATE TABLE profiles(_id INTEGER PRIMARY KEY AUTOINCREMENT, IDENTIFIER TEXT NOT NULL UNIQUE, profile_id TEXT UNIQUE, name TEXT, email TEXT, salt TEXT, uid TEXT, did TEXT, push_token_sync INTEGER );"

    .line 47
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .line 42
    invoke-static {}, Lcom/helpshift/support/db/SupportDBNameRepo;->getLegacyProfileDbName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDatabaseVersion()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method public getMigratorsForUpgrade(I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/helpshift/db/base/IMigrator;",
            ">;"
        }
    .end annotation

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x2

    if-ge p1, v1, :cond_0

    .line 54
    new-instance v1, Lcom/helpshift/db/legacy_profile/migration/LegacyProfileDbMigration_1_to_2;

    invoke-direct {v1}, Lcom/helpshift/db/legacy_profile/migration/LegacyProfileDbMigration_1_to_2;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    const/4 v1, 0x3

    if-ge p1, v1, :cond_1

    .line 57
    new-instance p1, Lcom/helpshift/db/legacy_profile/migration/LegacyProfileDbMigration_2_to_3;

    invoke-direct {p1}, Lcom/helpshift/db/legacy_profile/migration/LegacyProfileDbMigration_2_to_3;-><init>()V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    return-object v0
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

    const-string v0, "legacy_profile_table"

    .line 64
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    const-string v0, "Helpshift_LProfileDB"

    return-object v0
.end method
