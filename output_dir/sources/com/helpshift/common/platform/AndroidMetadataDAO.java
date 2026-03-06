package com.helpshift.common.platform;

import com.helpshift.meta.dao.MetaDataDAO;
import com.helpshift.meta.dto.BreadCrumbDTO;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public class AndroidMetadataDAO implements MetaDataDAO {
    private static final String BREAD_CRUMB_KEY = "key_bread_crumb_storage";
    private static final String CUSTOM_META_KEY = "key_custom_meta_storage";
    private KVStore kvStore;

    public AndroidMetadataDAO(KVStore kVStore) {
        this.kvStore = kVStore;
    }

    @Override // com.helpshift.meta.dao.MetaDataDAO
    public ArrayList<BreadCrumbDTO> getBreadCrumbs() {
        Object serializable = this.kvStore.getSerializable(BREAD_CRUMB_KEY);
        if (serializable != null) {
            return (ArrayList) serializable;
        }
        return null;
    }

    @Override // com.helpshift.meta.dao.MetaDataDAO
    public void setBreadCrumbs(ArrayList<BreadCrumbDTO> arrayList) {
        this.kvStore.setSerializable(BREAD_CRUMB_KEY, arrayList);
    }

    @Override // com.helpshift.meta.dao.MetaDataDAO
    public void saveCustomMetaData(HashMap<String, Serializable> map) {
        this.kvStore.setSerializable(CUSTOM_META_KEY, map);
    }

    @Override // com.helpshift.meta.dao.MetaDataDAO
    public HashMap<String, Serializable> getCustomMetaData() {
        Object serializable = this.kvStore.getSerializable(CUSTOM_META_KEY);
        if (serializable != null) {
            return (HashMap) serializable;
        }
        return null;
    }
}
