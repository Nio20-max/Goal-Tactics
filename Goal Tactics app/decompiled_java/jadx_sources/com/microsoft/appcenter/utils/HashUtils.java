package com.microsoft.appcenter.utils;

import com.ironsource.sdk.precache.DownloadManager;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import kotlin.UByte;

/* JADX INFO: loaded from: classes2.dex */
public class HashUtils {
    private static final char[] HEXADECIMAL_OUTPUT = "0123456789abcdef".toCharArray();

    HashUtils() {
    }

    public static String sha256(String data) {
        return sha256(data, DownloadManager.UTF8_CHARSET);
    }

    static String sha256(String data, String charsetName) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.update(data.getBytes(charsetName));
            return encodeHex(messageDigest.digest());
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    private static String encodeHex(byte[] bytes) {
        char[] cArr = new char[bytes.length * 2];
        for (int i = 0; i < bytes.length; i++) {
            int i2 = bytes[i] & UByte.MAX_VALUE;
            int i3 = i * 2;
            char[] cArr2 = HEXADECIMAL_OUTPUT;
            cArr[i3] = cArr2[i2 >>> 4];
            cArr[i3 + 1] = cArr2[i2 & 15];
        }
        return new String(cArr);
    }
}
