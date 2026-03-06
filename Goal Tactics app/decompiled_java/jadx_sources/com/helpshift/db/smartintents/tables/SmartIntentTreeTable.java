package com.helpshift.db.smartintents.tables;

/* JADX INFO: loaded from: classes2.dex */
public interface SmartIntentTreeTable {
    public static final String TABLE_NAME = "si_tree_table";

    public interface Columns {
        public static final String LOCAL_ID = "local_id";
        public static final String SI_TREE_EMPTY_SEARCH_DESCRIPTION = "empty_search_description";
        public static final String SI_TREE_EMPTY_SEARCH_TITLE = "empty_search_title";
        public static final String SI_TREE_ENFORCE_INTENT_SELECTION = "enforce_intent_selection";
        public static final String SI_TREE_LAST_REFRESHED_AT = "last_refreshed_at";
        public static final String SI_TREE_PROMPT_TITLE = "prompt_title";
        public static final String SI_TREE_SEARCH_TITLE = "search_title";
        public static final String SI_TREE_SERVER_ID = "server_id";
        public static final String SI_TREE_TEXT_INPUT_HINT = "text_input_hint";
        public static final String SI_TREE_TOKEN_DELIMITER = "token_delimiter";
        public static final String SI_TREE_USER_LOCAL_ID = "user_local_id";
        public static final String TREE_VERSION = "tree_version";
    }
}
