package com.helpshift.storage;

import com.helpshift.logger.logmodels.ILogExtrasModel;
import com.helpshift.util.HSLogger;
import java.io.Serializable;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public abstract class BaseRetryKeyValueStorage implements KeyValueStorage {
    private static final int MAX_RETRY_COUNT = 1;
    protected static final String TAG = "Helpshift_RetryKeyValue";
    protected KeyValueStorage keyValueStorage;

    protected abstract void reInitiateDbInstance();

    @Override // com.helpshift.storage.KeyValueStorage
    public synchronized boolean set(String str, Serializable serializable) {
        int i = 0;
        do {
            try {
            } catch (Exception e) {
                if (i == 0) {
                    HSLogger.e(TAG, "Exception in setting value for key : " + str + ", retry count : " + i, e);
                } else {
                    HSLogger.f(TAG, "Exception in setting value for key : " + str + ", retry count : " + i, e, new ILogExtrasModel[0]);
                }
                reInitiateDbInstance();
                i++;
            }
        } while (i <= 1);
        return false;
        return this.keyValueStorage.set(str, serializable);
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public synchronized boolean setKeyValues(Map<String, Serializable> map) {
        int i = 0;
        do {
            try {
            } catch (Exception e) {
                if (i == 0) {
                    HSLogger.e(TAG, "Exception in bulk insert, retry count : " + i, e);
                } else {
                    HSLogger.f(TAG, "Exception in bulk insert, retry count : " + i, e, new ILogExtrasModel[0]);
                }
                reInitiateDbInstance();
                i++;
            }
        } while (i <= 1);
        return false;
        return this.keyValueStorage.setKeyValues(map);
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public synchronized Object get(String str) {
        int i = 0;
        do {
            try {
            } catch (Exception e) {
                if (i == 0) {
                    HSLogger.e(TAG, "Exception getting value for : " + str + ", retry count : " + i, e);
                } else {
                    HSLogger.f(TAG, "Exception getting value for : " + str + ", retry count : " + i, e, new ILogExtrasModel[0]);
                }
                reInitiateDbInstance();
                i++;
            }
        } while (i <= 1);
        return null;
        return this.keyValueStorage.get(str);
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public synchronized void removeKey(String str) {
        int i = 0;
        do {
            try {
                this.keyValueStorage.removeKey(str);
            } catch (Exception e) {
                if (i == 0) {
                    HSLogger.e(TAG, "Exception removing key : " + str + ", retry count : " + i, e);
                } else {
                    HSLogger.f(TAG, "Exception removing key : " + str + ", retry count : " + i, e, new ILogExtrasModel[0]);
                }
                reInitiateDbInstance();
                i++;
            }
        } while (i <= 1);
    }

    @Override // com.helpshift.storage.KeyValueStorage
    public synchronized void removeAllKeys() {
        int i = 0;
        do {
            try {
                this.keyValueStorage.removeAllKeys();
            } catch (Exception e) {
                if (i == 0) {
                    HSLogger.e(TAG, "Exception removing all keys, retry count : " + i, e);
                } else {
                    HSLogger.f(TAG, "Exception removing all keys, retry count : " + i, e, new ILogExtrasModel[0]);
                }
                reInitiateDbInstance();
                i++;
            }
        } while (i <= 1);
    }
}
