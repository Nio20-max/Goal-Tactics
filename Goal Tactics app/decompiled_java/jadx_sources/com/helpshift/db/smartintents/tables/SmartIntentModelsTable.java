package com.helpshift.db.smartintents.tables;

/* JADX INFO: loaded from: classes2.dex */
public interface SmartIntentModelsTable {
    public static final String TABLE_NAME = "si_models_table";

    public interface Columns {
        public static final String CONFIDENCE_THRESHOLD = "confidence_threshold";
        public static final String LEAF_INTENT_BASE_PROBABILITIES = "leaf_intent_base_probabilities";
        public static final String LEAF_INTENT_SERVER_IDS = "leaf_intent_server_ids";
        public static final String LOCAL_ID = "local_id";
        public static final String MAX_COMBINED_CONFIDENCE = "max_combined_confidence";
        public static final String MODEL_VERSION = "version";
        public static final String SI_MODEL_LAST_REFRESHED_AT = "last_refreshed_at";
        public static final String SI_MODEL_TREE_LOCAL_ID = "tree_local_id";
    }
}
