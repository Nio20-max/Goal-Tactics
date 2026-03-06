package com.helpshift.support.db.support_key_value;

import com.helpshift.db.base.DatabaseContract;
import com.helpshift.db.base.IMigrator;
import com.helpshift.db.key_value.tables.KeyValueTable;
import com.helpshift.support.db.SupportDBNameRepo;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SupportKeyValueDatabaseContract implements DatabaseContract {
    private static final String TAG = "Helpshift_SupportKeyValueDB";
    private final String CREATE_KEY_VALUE_TABLE = "CREATE TABLE key_value_store(key text primary key,value blob not null);";

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
        return SupportDBNameRepo.getSupportKvDbName();
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getCreateTableQueries() {
        return Collections.singletonList("CREATE TABLE key_value_store(key text primary key,value blob not null);");
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<IMigrator> getMigratorsForUpgrade(int i) {
        return Collections.emptyList();
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getTableNames() {
        return Collections.singletonList(KeyValueTable.TABLE_NAME);
    }
}
