package com.helpshift.support.constants;

import android.provider.BaseColumns;

/* JADX INFO: loaded from: classes2.dex */
public interface FaqsTable {
    public static final String TABLE_NAME = "faq_suggestions";

    public interface Columns extends BaseColumns {
        public static final String BODY = "body";
        public static final String CATEGORY_TAGS = "c_tags";
        public static final String HELPFUL = "helpful";
        public static final String ID = "_id";
        public static final String LANGUAGE = "language";
        public static final String PUBLISH_ID = "publish_id";
        public static final String QUESTION_ID = "question_id";
        public static final String RTL = "rtl";
        public static final String SECTION_ID = "section_id";
        public static final String TAGS = "tags";
        public static final String TITLE = "title";
    }
}
