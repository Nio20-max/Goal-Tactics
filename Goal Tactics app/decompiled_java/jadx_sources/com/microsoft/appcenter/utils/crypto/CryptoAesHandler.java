package com.microsoft.appcenter.utils.crypto;

import android.content.Context;
import android.security.keystore.KeyGenParameterSpec;
import com.microsoft.appcenter.utils.crypto.CryptoUtils;
import java.security.KeyStore;
import java.util.Calendar;
import javax.crypto.spec.IvParameterSpec;

/* JADX INFO: loaded from: classes2.dex */
class CryptoAesHandler implements CryptoHandler {
    @Override // com.microsoft.appcenter.utils.crypto.CryptoHandler
    public String getAlgorithm() {
        return "AES/CBC/PKCS7Padding/256";
    }

    CryptoAesHandler() {
    }

    @Override // com.microsoft.appcenter.utils.crypto.CryptoHandler
    public void generateKey(CryptoUtils.ICryptoFactory cryptoFactory, String alias, Context context) throws Exception {
        Calendar calendar = Calendar.getInstance();
        calendar.add(1, 1);
        CryptoUtils.IKeyGenerator keyGenerator = cryptoFactory.getKeyGenerator("AES", "AndroidKeyStore");
        keyGenerator.init(new KeyGenParameterSpec.Builder(alias, 3).setBlockModes("CBC").setEncryptionPaddings("PKCS7Padding").setKeySize(256).setKeyValidityForOriginationEnd(calendar.getTime()).build());
        keyGenerator.generateKey();
    }

    @Override // com.microsoft.appcenter.utils.crypto.CryptoHandler
    public byte[] encrypt(CryptoUtils.ICryptoFactory cryptoFactory, int apiLevel, KeyStore.Entry keyStoreEntry, byte[] input) throws Exception {
        CryptoUtils.ICipher cipher = cryptoFactory.getCipher("AES/CBC/PKCS7Padding", "AndroidKeyStoreBCWorkaround");
        cipher.init(1, ((KeyStore.SecretKeyEntry) keyStoreEntry).getSecretKey());
        byte[] iv = cipher.getIV();
        byte[] bArrDoFinal = cipher.doFinal(input);
        byte[] bArr = new byte[iv.length + bArrDoFinal.length];
        System.arraycopy(iv, 0, bArr, 0, iv.length);
        System.arraycopy(bArrDoFinal, 0, bArr, iv.length, bArrDoFinal.length);
        return bArr;
    }

    @Override // com.microsoft.appcenter.utils.crypto.CryptoHandler
    public byte[] decrypt(CryptoUtils.ICryptoFactory cryptoFactory, int apiLevel, KeyStore.Entry keyStoreEntry, byte[] data) throws Exception {
        CryptoUtils.ICipher cipher = cryptoFactory.getCipher("AES/CBC/PKCS7Padding", "AndroidKeyStoreBCWorkaround");
        int blockSize = cipher.getBlockSize();
        cipher.init(2, ((KeyStore.SecretKeyEntry) keyStoreEntry).getSecretKey(), new IvParameterSpec(data, 0, blockSize));
        return cipher.doFinal(data, blockSize, data.length - blockSize);
    }
}
