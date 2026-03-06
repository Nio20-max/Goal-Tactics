package com.helpshift.db.smartintents.tables;

/* JADX INFO: loaded from: classes2.dex */
public interface SmartIntentsTable {
    public static final String TABLE_NAME = "si_intents_table";

    public interface Columns {
        public static final String LOCAL_ID = "local_id";
        public static final String SI_INTENT_LABEL = "label";
        public static final String SI_INTENT_PARENT_SERVER_ID = "parent_server_id";
        public static final String SI_INTENT_SERVER_ID = "server_id";
        public static final String TREE_LOCAL_ID = "tree_local_id";
    }
}
