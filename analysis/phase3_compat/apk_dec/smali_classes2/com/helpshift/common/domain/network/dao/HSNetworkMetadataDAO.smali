.class public interface abstract Lcom/helpshift/common/domain/network/dao/HSNetworkMetadataDAO;
.super Ljava/lang/Object;
.source "HSNetworkMetadataDAO.java"


# virtual methods
.method public abstract deleteAllUrlsMetadata()Z
.end method

.method public abstract deleteMetadataForUrl(Ljava/lang/String;)Z
.end method

.method public abstract getMetadataOfUrl(Ljava/lang/String;)Lcom/helpshift/common/domain/network/HSUrlMetadata;
.end method

.method public abstract insertOrUpdateMetadataForUrl(Ljava/lang/String;Lcom/helpshift/common/domain/network/HSUrlMetadata;)Z
.end method

.method public abstract updateLastFetchTimestampAndFetchStateOfUrl(Ljava/lang/String;JZ)Z
.end method
