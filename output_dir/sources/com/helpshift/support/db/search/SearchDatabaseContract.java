package com.helpshift.support.db.search;

import com.helpshift.db.base.DatabaseContract;
import com.helpshift.db.base.IMigrator;
import com.helpshift.support.db.SupportDBNameRepo;
import com.helpshift.support.db.search.tables.SearchTable;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SearchDatabaseContract implements DatabaseContract {
    private static final String TAG = "Helpshift_SearchDB";
    private final String CREATE_SEARCH_TABLE = "CREATE TABLE search_token_table (token TEXT PRIMARY KEY , type INTEGER , score TEXT NOT NULL  )";

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
        return SupportDBNameRepo.getSearchDbName();
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getCreateTableQueries() {
        return Collections.singletonList("CREATE TABLE search_token_table (token TEXT PRIMARY KEY , type INTEGER , score TEXT NOT NULL  )");
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<IMigrator> getMigratorsForUpgrade(int i) {
        return Collections.emptyList();
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getTableNames() {
        return Collections.singletonList(SearchTable.TABLE_NAME);
    }
}
