package com.helpshift.db.network.tables;

/* JADX INFO: loaded from: classes2.dex */
public interface UrlMetadataTable {
    public static final String TABLE_NAME = "hs_url_metadata_table";

    public interface Columns {
        public static final String ETAG = "etag";
        public static final String IS_LAST_FETCH_SUCCESS = "is_last_fetch_success";
        public static final String LAST_FETCH_TS = "last_fetch_ts";
        public static final String URL = "url";
    }
}
