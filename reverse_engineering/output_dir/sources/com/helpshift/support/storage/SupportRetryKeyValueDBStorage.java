package com.helpshift.support.storage;

import android.content.Context;
import com.helpshift.storage.BaseRetryKeyValueStorage;
import com.helpshift.storage.KeyValueDbStorage;
import com.helpshift.support.db.support_key_value.SupportKeyValueDatabaseContract;
import com.helpshift.support.db.support_key_value.SupportKeyValueDbStorageHelper;
import com.helpshift.util.HSLogger;

/* JADX INFO: loaded from: classes2.dex */
class SupportRetryKeyValueDBStorage extends BaseRetryKeyValueStorage {
    private final Context context;
    private SupportKeyValueDbStorageHelper sqLiteOpenHelper;

    SupportRetryKeyValueDBStorage(Context context) {
        this.context = context;
        SupportKeyValueDbStorageHelper supportKeyValueDbStorageHelper = new SupportKeyValueDbStorageHelper(context, new SupportKeyValueDatabaseContract());
        this.sqLiteOpenHelper = supportKeyValueDbStorageHelper;
        this.keyValueStorage = new KeyValueDbStorage(supportKeyValueDbStorageHelper);
    }

    @Override // com.helpshift.storage.BaseRetryKeyValueStorage
    protected void reInitiateDbInstance() {
        try {
            SupportKeyValueDbStorageHelper supportKeyValueDbStorageHelper = this.sqLiteOpenHelper;
            if (supportKeyValueDbStorageHelper != null) {
                supportKeyValueDbStorageHelper.close();
            }
        } catch (Exception e) {
            HSLogger.e("Helpshift_RetryKeyValue", "Error in closing DB", e);
        }
        SupportKeyValueDbStorageHelper supportKeyValueDbStorageHelper2 = new SupportKeyValueDbStorageHelper(this.context, new SupportKeyValueDatabaseContract());
        this.sqLiteOpenHelper = supportKeyValueDbStorageHelper2;
        this.keyValueStorage = new KeyValueDbStorage(supportKeyValueDbStorageHelper2);
    }
}
