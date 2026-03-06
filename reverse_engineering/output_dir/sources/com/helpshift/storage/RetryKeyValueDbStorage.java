package com.helpshift.storage;

import android.content.Context;
import android.database.sqlite.SQLiteOpenHelper;
import com.helpshift.db.key_value.KeyValueDatabaseContract;
import com.helpshift.db.key_value.KeyValueDbStorageHelper;
import com.helpshift.util.HSLogger;

/* JADX INFO: loaded from: classes2.dex */
public class RetryKeyValueDbStorage extends BaseRetryKeyValueStorage {
    private static final String backupFileName = "__hs__kv_backup";
    private final Context context;
    private SQLiteOpenHelper sqLiteOpenHelper;

    RetryKeyValueDbStorage(Context context) {
        this.context = context;
        KeyValueDbStorageHelper keyValueDbStorageHelper = new KeyValueDbStorageHelper(context, new KeyValueDatabaseContract());
        this.sqLiteOpenHelper = keyValueDbStorageHelper;
        this.keyValueStorage = new KeyValueDbStorage(keyValueDbStorageHelper);
    }

    @Override // com.helpshift.storage.BaseRetryKeyValueStorage
    protected void reInitiateDbInstance() {
        try {
            SQLiteOpenHelper sQLiteOpenHelper = this.sqLiteOpenHelper;
            if (sQLiteOpenHelper != null) {
                sQLiteOpenHelper.close();
            }
        } catch (Exception e) {
            HSLogger.e("Helpshift_RetryKeyValue", "Error in closing DB", e);
        }
        KeyValueDbStorageHelper keyValueDbStorageHelper = new KeyValueDbStorageHelper(this.context, new KeyValueDatabaseContract());
        this.sqLiteOpenHelper = keyValueDbStorageHelper;
        this.keyValueStorage = new KeyValueDbStorage(keyValueDbStorageHelper);
    }
}
