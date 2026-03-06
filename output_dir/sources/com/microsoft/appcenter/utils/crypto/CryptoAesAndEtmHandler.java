package com.microsoft.appcenter.utils.crypto;

import android.content.Context;
import android.security.keystore.KeyGenParameterSpec;
import com.microsoft.appcenter.utils.crypto.CryptoUtils;
import java.nio.ByteBuffer;
import java.security.InvalidKeyException;
import java.security.KeyStore;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: loaded from: classes2.dex */
public class CryptoAesAndEtmHandler implements CryptoHandler {
    private static final int AUTHENTICATION_KEY_LENGTH = 16;
    private static final int ENCRYPTION_KEY_LENGTH = 32;

    @Override // com.microsoft.appcenter.utils.crypto.CryptoHandler
    public String getAlgorithm() {
        return "AES/CBC/PKCS7Padding/256/HmacSHA256";
    }

    @Override // com.microsoft.appcenter.utils.crypto.CryptoHandler
    public void generateKey(CryptoUtils.ICryptoFactory cryptoFactory, String alias, Context context) throws Exception {
        Calendar calendar = Calendar.getInstance();
        calendar.add(1, 1);
        CryptoUtils.IKeyGenerator keyGenerator = cryptoFactory.getKeyGenerator("HmacSHA256", "AndroidKeyStore");
        keyGenerator.init(new KeyGenParameterSpec.Builder(alias, 4).setKeyValidityForOriginationEnd(calendar.getTime()).build());
        keyGenerator.generateKey();
    }

    @Override // com.microsoft.appcenter.utils.crypto.CryptoHandler
    public byte[] encrypt(CryptoUtils.ICryptoFactory cryptoFactory, int apiLevel, KeyStore.Entry keyStoreEntry, byte[] input) throws Exception {
        SecretKey secretKey = ((KeyStore.SecretKeyEntry) keyStoreEntry).getSecretKey();
        byte[] subkey = getSubkey(secretKey, 32);
        byte[] subkey2 = getSubkey(secretKey, 16);
        CryptoUtils.ICipher cipher = cryptoFactory.getCipher("AES/CBC/PKCS7Padding", null);
        cipher.init(1, new SecretKeySpec(subkey, "AES"));
        byte[] iv = cipher.getIV();
        byte[] bArrDoFinal = cipher.doFinal(input);
        byte[] macBytes = getMacBytes(subkey2, iv, bArrDoFinal);
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(iv.length + 1 + 1 + macBytes.length + bArrDoFinal.length);
        byteBufferAllocate.put((byte) iv.length);
        byteBufferAllocate.put(iv);
        byteBufferAllocate.put((byte) macBytes.length);
        byteBufferAllocate.put(macBytes);
        byteBufferAllocate.put(bArrDoFinal);
        return byteBufferAllocate.array();
    }

    @Override // com.microsoft.appcenter.utils.crypto.CryptoHandler
    public byte[] decrypt(CryptoUtils.ICryptoFactory cryptoFactory, int apiLevel, KeyStore.Entry keyStoreEntry, byte[] data) throws Exception {
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(data);
        int i = byteBufferWrap.get();
        if (i != 16) {
            throw new IllegalArgumentException("Invalid IV length.");
        }
        byte[] bArr = new byte[i];
        byteBufferWrap.get(bArr);
        int i2 = byteBufferWrap.get();
        if (i2 != 32) {
            throw new IllegalArgumentException("Invalid MAC length.");
        }
        byte[] bArr2 = new byte[i2];
        byteBufferWrap.get(bArr2);
        byte[] bArr3 = new byte[byteBufferWrap.remaining()];
        byteBufferWrap.get(bArr3);
        SecretKey secretKey = ((KeyStore.SecretKeyEntry) keyStoreEntry).getSecretKey();
        byte[] subkey = getSubkey(secretKey, 32);
        if (!MessageDigest.isEqual(getMacBytes(getSubkey(secretKey, 16), bArr, bArr3), bArr2)) {
            throw new SecurityException("Could not authenticate MAC value.");
        }
        CryptoUtils.ICipher cipher = cryptoFactory.getCipher("AES/CBC/PKCS7Padding", null);
        cipher.init(2, new SecretKeySpec(subkey, "AES"), new IvParameterSpec(bArr));
        return cipher.doFinal(bArr3);
    }

    private byte[] getMacBytes(byte[] authKey, byte[] iv, byte[] cipherText) throws NoSuchAlgorithmException, InvalidKeyException {
        SecretKeySpec secretKeySpec = new SecretKeySpec(authKey, "HmacSHA256");
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(secretKeySpec);
        mac.update(iv);
        mac.update(cipherText);
        return mac.doFinal();
    }

    byte[] getSubkey(SecretKey secretKey, int outputDataLength) throws NoSuchAlgorithmException, InvalidKeyException {
        if (outputDataLength < 1) {
            throw new IllegalArgumentException("Output data length must be greater than zero.");
        }
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(secretKey);
        int iCeil = (int) Math.ceil(((double) outputDataLength) / ((double) mac.getMacLength()));
        if (iCeil > 255) {
            throw new IllegalArgumentException("Output data length must be maximum of 255 * hash-length.");
        }
        byte[] bArrDoFinal = new byte[0];
        ByteBuffer byteBufferAllocate = ByteBuffer.allocate(outputDataLength);
        int i = 0;
        while (i < iCeil) {
            mac.update(bArrDoFinal);
            i++;
            mac.update((byte) i);
            bArrDoFinal = mac.doFinal();
            int iMin = Math.min(outputDataLength, bArrDoFinal.length);
            byteBufferAllocate.put(bArrDoFinal, 0, iMin);
            outputDataLength -= iMin;
        }
        return byteBufferAllocate.array();
    }
}
