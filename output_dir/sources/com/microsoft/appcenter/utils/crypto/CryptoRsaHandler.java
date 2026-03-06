package com.microsoft.appcenter.utils.crypto;

import android.content.Context;
import android.security.KeyPairGeneratorSpec;
import com.microsoft.appcenter.utils.crypto.CryptoUtils;
import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.KeyPairGenerator;
import java.security.KeyStore;
import java.security.cert.CertificateExpiredException;
import java.security.cert.X509Certificate;
import java.util.Calendar;
import java.util.Date;
import javax.security.auth.x500.X500Principal;

/* JADX INFO: loaded from: classes2.dex */
class CryptoRsaHandler implements CryptoHandler {
    @Override // com.microsoft.appcenter.utils.crypto.CryptoHandler
    public String getAlgorithm() {
        return "RSA/ECB/PKCS1Padding/2048";
    }

    CryptoRsaHandler() {
    }

    @Override // com.microsoft.appcenter.utils.crypto.CryptoHandler
    public void generateKey(CryptoUtils.ICryptoFactory cryptoFactory, String alias, Context context) throws Exception {
        Calendar calendar = Calendar.getInstance();
        calendar.add(1, 1);
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA", "AndroidKeyStore");
        keyPairGenerator.initialize(new KeyPairGeneratorSpec.Builder(context).setAlias(alias).setSubject(new X500Principal("CN=" + alias)).setStartDate(new Date()).setEndDate(calendar.getTime()).setSerialNumber(BigInteger.TEN).setKeySize(2048).build());
        keyPairGenerator.generateKeyPair();
    }

    private CryptoUtils.ICipher getCipher(CryptoUtils.ICryptoFactory cipherFactory, int apiLevel) throws Exception {
        return cipherFactory.getCipher("RSA/ECB/PKCS1Padding", apiLevel >= 23 ? "AndroidKeyStoreBCWorkaround" : "AndroidOpenSSL");
    }

    @Override // com.microsoft.appcenter.utils.crypto.CryptoHandler
    public byte[] encrypt(CryptoUtils.ICryptoFactory cryptoFactory, int apiLevel, KeyStore.Entry keyStoreEntry, byte[] input) throws Exception {
        CryptoUtils.ICipher cipher = getCipher(cryptoFactory, apiLevel);
        X509Certificate x509Certificate = (X509Certificate) ((KeyStore.PrivateKeyEntry) keyStoreEntry).getCertificate();
        try {
            x509Certificate.checkValidity();
            cipher.init(1, x509Certificate.getPublicKey());
            return cipher.doFinal(input);
        } catch (CertificateExpiredException e) {
            throw new InvalidKeyException(e);
        }
    }

    @Override // com.microsoft.appcenter.utils.crypto.CryptoHandler
    public byte[] decrypt(CryptoUtils.ICryptoFactory cryptoFactory, int apiLevel, KeyStore.Entry keyStoreEntry, byte[] data) throws Exception {
        CryptoUtils.ICipher cipher = getCipher(cryptoFactory, apiLevel);
        cipher.init(2, ((KeyStore.PrivateKeyEntry) keyStoreEntry).getPrivateKey());
        return cipher.doFinal(data);
    }
}
