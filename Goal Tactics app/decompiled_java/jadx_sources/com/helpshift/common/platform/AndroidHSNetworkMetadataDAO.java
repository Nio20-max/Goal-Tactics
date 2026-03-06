package com.helpshift.common.platform;

import android.content.Context;
import com.helpshift.common.domain.network.HSUrlMetadata;
import com.helpshift.common.domain.network.dao.HSNetworkMetadataDAO;
import com.helpshift.db.network.HSNetworkMetadataDB;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidHSNetworkMetadataDAO implements HSNetworkMetadataDAO {
    private final String TAG = "Helpshift_HSNwDao";
    private final HSNetworkMetadataDB hsNetworkDB;

    AndroidHSNetworkMetadataDAO(Context context) {
        this.hsNetworkDB = HSNetworkMetadataDB.getInstance(context);
    }

    @Override // com.helpshift.common.domain.network.dao.HSNetworkMetadataDAO
    public HSUrlMetadata getMetadataOfUrl(String str) {
        return this.hsNetworkDB.readMetadataForUrl(str);
    }

    @Override // com.helpshift.common.domain.network.dao.HSNetworkMetadataDAO
    public boolean insertOrUpdateMetadataForUrl(String str, HSUrlMetadata hSUrlMetadata) {
        if (this.hsNetworkDB.readMetadataForUrl(str) != null) {
            return this.hsNetworkDB.updateMetadataForUrl(str, hSUrlMetadata);
        }
        return this.hsNetworkDB.insertMetadataForUrl(str, hSUrlMetadata);
    }

    @Override // com.helpshift.common.domain.network.dao.HSNetworkMetadataDAO
    public boolean updateLastFetchTimestampAndFetchStateOfUrl(String str, long j, boolean z) {
        return this.hsNetworkDB.updateLastFetchTimestampForUrl(str, j, z);
    }

    @Override // com.helpshift.common.domain.network.dao.HSNetworkMetadataDAO
    public boolean deleteMetadataForUrl(String str) {
        return this.hsNetworkDB.deleteMetadataForUrl(str);
    }

    @Override // com.helpshift.common.domain.network.dao.HSNetworkMetadataDAO
    public boolean deleteAllUrlsMetadata() {
        return this.hsNetworkDB.deleteAllUrlsMetadata();
    }
}
