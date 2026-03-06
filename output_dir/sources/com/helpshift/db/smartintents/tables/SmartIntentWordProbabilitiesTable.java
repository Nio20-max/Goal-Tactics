package com.helpshift.db.smartintents.tables;

/* JADX INFO: loaded from: classes2.dex */
public interface SmartIntentWordProbabilitiesTable {
    public static final String TABLE_NAME = "si_word_probabilities_table";

    public interface Columns {
        public static final String LOCAL_ID = "local_id";
        public static final String SI_WORD_PROBABILITIES_MODEL_LOCAL_ID = "model_local_id";
        public static final String SI_WORD_PROBABILITIES_PROBABILITIES = "probabilities";
        public static final String SI_WORD_PROBABILITIES_WORD = "word";
    }
}
