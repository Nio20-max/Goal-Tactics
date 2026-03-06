package com.helpshift.common.platform;

import com.helpshift.faq.dao.FaqEventDAO;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidFaqEventDAO implements FaqEventDAO {
    private static final String KEY_FAQ_MARK_EVENTS = "key_faq_mark_event";
    private KVStore kvStore;

    public AndroidFaqEventDAO(KVStore kVStore) {
        this.kvStore = kVStore;
    }

    @Override // com.helpshift.faq.dao.FaqEventDAO
    public void insertFaqMarkHelpfulEvent(String str, boolean z) {
        HashMap<String, Boolean> faqMarkEventFromDB = getFaqMarkEventFromDB();
        faqMarkEventFromDB.put(str, Boolean.valueOf(z));
        this.kvStore.setSerializable(KEY_FAQ_MARK_EVENTS, faqMarkEventFromDB);
    }

    @Override // com.helpshift.faq.dao.FaqEventDAO
    public void removeFaqMarkHelpfulEvent(String str) {
        HashMap<String, Boolean> faqMarkEventFromDB = getFaqMarkEventFromDB();
        if (faqMarkEventFromDB.containsKey(str)) {
            faqMarkEventFromDB.remove(str);
            this.kvStore.setSerializable(KEY_FAQ_MARK_EVENTS, faqMarkEventFromDB);
        }
    }

    @Override // com.helpshift.faq.dao.FaqEventDAO
    public Map<String, Boolean> getUnSentFaqMarkHelpfulEvents() {
        return getFaqMarkEventFromDB();
    }

    private synchronized HashMap<String, Boolean> getFaqMarkEventFromDB() {
        HashMap<String, Boolean> map;
        Object serializable = this.kvStore.getSerializable(KEY_FAQ_MARK_EVENTS);
        if (serializable instanceof HashMap) {
            map = (HashMap) serializable;
        } else {
            map = new HashMap<>();
        }
        return map;
    }
}
