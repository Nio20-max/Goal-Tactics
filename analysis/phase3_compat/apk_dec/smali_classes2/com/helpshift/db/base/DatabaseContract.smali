.class public interface abstract Lcom/helpshift/db/base/DatabaseContract;
.super Ljava/lang/Object;
.source "DatabaseContract.java"


# virtual methods
.method public abstract getCreateTableQueries()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getDatabaseName()Ljava/lang/String;
.end method

.method public abstract getDatabaseVersion()I
.end method

.method public abstract getMigratorsForUpgrade(I)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/helpshift/db/base/IMigrator;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getTableNames()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getTag()Ljava/lang/String;
.end method
