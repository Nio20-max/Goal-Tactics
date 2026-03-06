package com.microsoft.appcenter.utils.crypto;

import android.content.Context;
import com.microsoft.appcenter.utils.crypto.CryptoUtils;
import java.security.KeyStore;

/* JADX INFO: loaded from: classes2.dex */
interface CryptoHandler {
    byte[] decrypt(CryptoUtils.ICryptoFactory cryptoFactory, int apiLevel, KeyStore.Entry keyStoreEntry, byte[] data) throws Exception;

    byte[] encrypt(CryptoUtils.ICryptoFactory cryptoFactory, int apiLevel, KeyStore.Entry keyStoreEntry, byte[] data) throws Exception;

    void generateKey(CryptoUtils.ICryptoFactory cryptoFactory, String alias, Context context) throws Exception;

    String getAlgorithm();
}
