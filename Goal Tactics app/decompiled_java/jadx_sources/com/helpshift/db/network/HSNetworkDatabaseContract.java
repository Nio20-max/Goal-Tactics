package com.helpshift.db.network;

import com.helpshift.db.base.DatabaseContract;
import com.helpshift.db.base.IMigrator;
import com.helpshift.db.network.tables.UrlMetadataTable;
import com.helpshift.support.db.SupportDBNameRepo;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class HSNetworkDatabaseContract implements DatabaseContract {
    private static final String TAG = "HelpshiftNetworkDB";
    private final String CREATE_URL_METADATA_TABLE = "CREATE TABLE hs_url_metadata_table ( url TEXT PRIMARY KEY NOT NULL, last_fetch_ts INTEGER, etag TEXT, is_last_fetch_success INTEGER  );";

    @Override // com.helpshift.db.base.DatabaseContract
    public int getDatabaseVersion() {
        return 1;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public String getTag() {
        return TAG;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public String getDatabaseName() {
        return SupportDBNameRepo.getNetworkDbName();
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getCreateTableQueries() {
        return Arrays.asList("CREATE TABLE hs_url_metadata_table ( url TEXT PRIMARY KEY NOT NULL, last_fetch_ts INTEGER, etag TEXT, is_last_fetch_success INTEGER  );");
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<IMigrator> getMigratorsForUpgrade(int i) {
        return Collections.emptyList();
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getTableNames() {
        return Arrays.asList(UrlMetadataTable.TABLE_NAME);
    }
}
