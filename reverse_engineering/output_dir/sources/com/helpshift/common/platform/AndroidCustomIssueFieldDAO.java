package com.helpshift.common.platform;

import com.helpshift.cif.dao.CustomIssueFieldDAO;
import com.helpshift.cif.dto.CustomIssueFieldDTO;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidCustomIssueFieldDAO implements CustomIssueFieldDAO {
    private static final String CUSTOM_ISSUE_FIELD_KEY = "key_custom_issue_field_storage";
    private KVStore kvStore;

    public AndroidCustomIssueFieldDAO(KVStore kVStore) {
        this.kvStore = kVStore;
    }

    @Override // com.helpshift.cif.dao.CustomIssueFieldDAO
    public ArrayList<CustomIssueFieldDTO> getCustomIssueFields() {
        Object serializable = this.kvStore.getSerializable(CUSTOM_ISSUE_FIELD_KEY);
        if (serializable instanceof ArrayList) {
            return (ArrayList) serializable;
        }
        return null;
    }

    @Override // com.helpshift.cif.dao.CustomIssueFieldDAO
    public void setCustomIssueFields(ArrayList<CustomIssueFieldDTO> arrayList) {
        if (arrayList == null || arrayList.size() <= 0) {
            arrayList = null;
        }
        this.kvStore.setSerializable(CUSTOM_ISSUE_FIELD_KEY, arrayList);
    }
}
