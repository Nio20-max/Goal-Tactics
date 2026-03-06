package com.helpshift.db.user;

import com.helpshift.db.base.DatabaseContract;
import com.helpshift.db.base.IMigrator;
import com.helpshift.db.user.migration.UserDbMigration_1_to_2;
import com.helpshift.db.user.tables.ClearedUserTable;
import com.helpshift.db.user.tables.LegacyAnalyticsEventIDTable;
import com.helpshift.db.user.tables.LegacyProfileTable;
import com.helpshift.db.user.tables.RedactionInfoTable;
import com.helpshift.db.user.tables.UserTable;
import com.helpshift.support.db.SupportDBNameRepo;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class UserDatabaseContract implements DatabaseContract {
    private static final String TAG = "Helpshift_UserDB";
    private final String CREATE_USER_TABLE = "CREATE TABLE user_table(_id INTEGER PRIMARY KEY AUTOINCREMENT, identifier TEXT, name TEXT, email TEXT, deviceid TEXT, auth_token TEXT, active INTEGER DEFAULT 0, anonymous INTEGER DEFAULT 0, issue_exists INTEGER DEFAULT 1, initial_state_synced INTEGER DEFAULT 0, push_token_synced INTEGER DEFAULT 0 );";
    private final String CREATE_LEGACY_PROFILE_TABLE = "CREATE TABLE legacy_profile_table ( identifier TEXT PRIMARY KEY, name TEXT, email TEXT, serverid TEXT, migration_state INTEGER );";
    private final String CREATE_CLEARED_USER_TABLE = "CREATE TABLE cleared_user_table ( _id INTEGER PRIMARY KEY AUTOINCREMENT, identifier TEXT, name TEXT, email TEXT, deviceid TEXT, auth_token TEXT, sync_state INTEGER );";
    private final String CREATE_LEGACY_ANALYTICS_EVENT_IDS_TABLE = "CREATE TABLE legacy_analytics_event_id_table ( identifier TEXT, analytics_event_id TEXT );";
    public final String CREATE_REDACTION_INFO_TABLE = "CREATE TABLE redaction_info_table ( user_local_id INTEGER PRIMARY KEY, redaction_state INTEGER , redaction_type INTEGER );";

    @Override // com.helpshift.db.base.DatabaseContract
    public int getDatabaseVersion() {
        return 2;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public String getTag() {
        return TAG;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public String getDatabaseName() {
        return SupportDBNameRepo.getUserDbName();
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getCreateTableQueries() {
        return Arrays.asList("CREATE TABLE cleared_user_table ( _id INTEGER PRIMARY KEY AUTOINCREMENT, identifier TEXT, name TEXT, email TEXT, deviceid TEXT, auth_token TEXT, sync_state INTEGER );", "CREATE TABLE user_table(_id INTEGER PRIMARY KEY AUTOINCREMENT, identifier TEXT, name TEXT, email TEXT, deviceid TEXT, auth_token TEXT, active INTEGER DEFAULT 0, anonymous INTEGER DEFAULT 0, issue_exists INTEGER DEFAULT 1, initial_state_synced INTEGER DEFAULT 0, push_token_synced INTEGER DEFAULT 0 );", "CREATE TABLE legacy_analytics_event_id_table ( identifier TEXT, analytics_event_id TEXT );", "CREATE TABLE legacy_profile_table ( identifier TEXT PRIMARY KEY, name TEXT, email TEXT, serverid TEXT, migration_state INTEGER );", "CREATE TABLE redaction_info_table ( user_local_id INTEGER PRIMARY KEY, redaction_state INTEGER , redaction_type INTEGER );");
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<IMigrator> getMigratorsForUpgrade(int i) {
        ArrayList arrayList = new ArrayList();
        if (i == 1) {
            arrayList.add(new UserDbMigration_1_to_2(this));
        }
        return arrayList;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getTableNames() {
        return Arrays.asList(UserTable.TABLE_NAME, RedactionInfoTable.TABLE_NAME, LegacyAnalyticsEventIDTable.TABLE_NAME, LegacyProfileTable.TABLE_NAME, ClearedUserTable.TABLE_NAME);
    }
}
