package com.helpshift.campaigns.storage;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class CampaignsDBNameRepo {
    private static final String CAMPAIGNS_DB_NAME = "campaigns_db";
    private static final String PROPERTY_DB_NAME = "properties_db";
    private static final String SESSIONS_DB_NAME = "sessions_db";
    public static final Map<String, String> dbNames;

    static {
        HashMap map = new HashMap();
        map.put(CAMPAIGNS_DB_NAME, "__hs__db_campaigns");
        map.put(PROPERTY_DB_NAME, "__hs__db_properties");
        map.put(SESSIONS_DB_NAME, "__hs__db_sessions");
        dbNames = Collections.unmodifiableMap(map);
    }

    public static String getCampaignsDbName() {
        return dbNames.get(CAMPAIGNS_DB_NAME);
    }

    public static String getPropertyDbName() {
        return dbNames.get(PROPERTY_DB_NAME);
    }

    public static String getSessionsDbName() {
        return dbNames.get(SESSIONS_DB_NAME);
    }
}
