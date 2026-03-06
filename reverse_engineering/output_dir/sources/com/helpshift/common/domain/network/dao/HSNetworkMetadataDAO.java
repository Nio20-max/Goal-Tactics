package com.helpshift.common.domain.network.dao;

import com.helpshift.common.domain.network.HSUrlMetadata;

/* JADX INFO: loaded from: classes2.dex */
public interface HSNetworkMetadataDAO {
    boolean deleteAllUrlsMetadata();

    boolean deleteMetadataForUrl(String str);

    HSUrlMetadata getMetadataOfUrl(String str);

    boolean insertOrUpdateMetadataForUrl(String str, HSUrlMetadata hSUrlMetadata);

    boolean updateLastFetchTimestampAndFetchStateOfUrl(String str, long j, boolean z);
}
