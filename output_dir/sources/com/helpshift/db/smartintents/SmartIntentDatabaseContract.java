package com.helpshift.db.smartintents;

import com.helpshift.db.base.DatabaseContract;
import com.helpshift.db.base.IMigrator;
import com.helpshift.db.smartintents.tables.SmartIntentModelsTable;
import com.helpshift.db.smartintents.tables.SmartIntentTreeTable;
import com.helpshift.db.smartintents.tables.SmartIntentWordProbabilitiesTable;
import com.helpshift.db.smartintents.tables.SmartIntentsTable;
import com.helpshift.support.db.SupportDBNameRepo;
import java.util.Arrays;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class SmartIntentDatabaseContract implements DatabaseContract {
    private static final String TAG = "Helpshift_SmrtIntentDB";
    public final String CREATE_SMART_INTENT_TREE_TABLE = "CREATE TABLE si_tree_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, user_local_id INTEGER NOT NULL, server_id TEXT NOT NULL, tree_version INTEGER NOT NULL, enforce_intent_selection INTEGER NOT NULL, last_refreshed_at INTEGER, prompt_title TEXT, text_input_hint TEXT, search_title TEXT, empty_search_title TEXT, empty_search_description TEXT, token_delimiter TEXT ); ";
    public final String CREATE_SMART_INTENT_TABLE = "CREATE TABLE si_intents_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_local_id INTEGER NOT NULL, label TEXT NOT NULL, server_id TEXT NOT NULL, parent_server_id TEXT );";
    public final String CREATE_SMART_INTENT_MODELS_TABLE = "CREATE TABLE  si_models_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_local_id INTEGER NOT NULL, version INTEGER NOT NULL, last_refreshed_at INTEGER, confidence_threshold TEXT NOT NULL, max_combined_confidence TEXT NOT NULL, leaf_intent_server_ids TEXT NOT NULL, leaf_intent_base_probabilities TEXT NOT NULL  );";
    public final String CREATE_SMART_INTENT_WORD_PROBABILITIES_TABLE = "CREATE TABLE si_word_probabilities_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, model_local_id INTEGER NOT NULL, word TEXT NOT NULL, probabilities TEXT NOT NULL );";

    @Override // com.helpshift.db.base.DatabaseContract
    public int getDatabaseVersion() {
        return 1;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<IMigrator> getMigratorsForUpgrade(int i) {
        return null;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public String getTag() {
        return TAG;
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public String getDatabaseName() {
        return SupportDBNameRepo.getSmartIntentDbName();
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getCreateTableQueries() {
        return Arrays.asList("CREATE TABLE si_tree_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, user_local_id INTEGER NOT NULL, server_id TEXT NOT NULL, tree_version INTEGER NOT NULL, enforce_intent_selection INTEGER NOT NULL, last_refreshed_at INTEGER, prompt_title TEXT, text_input_hint TEXT, search_title TEXT, empty_search_title TEXT, empty_search_description TEXT, token_delimiter TEXT ); ", "CREATE TABLE si_intents_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_local_id INTEGER NOT NULL, label TEXT NOT NULL, server_id TEXT NOT NULL, parent_server_id TEXT );", "CREATE TABLE  si_models_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_local_id INTEGER NOT NULL, version INTEGER NOT NULL, last_refreshed_at INTEGER, confidence_threshold TEXT NOT NULL, max_combined_confidence TEXT NOT NULL, leaf_intent_server_ids TEXT NOT NULL, leaf_intent_base_probabilities TEXT NOT NULL  );", "CREATE TABLE si_word_probabilities_table( local_id INTEGER PRIMARY KEY AUTOINCREMENT, model_local_id INTEGER NOT NULL, word TEXT NOT NULL, probabilities TEXT NOT NULL );");
    }

    @Override // com.helpshift.db.base.DatabaseContract
    public List<String> getTableNames() {
        return Arrays.asList(SmartIntentTreeTable.TABLE_NAME, SmartIntentsTable.TABLE_NAME, SmartIntentModelsTable.TABLE_NAME, SmartIntentWordProbabilitiesTable.TABLE_NAME);
    }
}
