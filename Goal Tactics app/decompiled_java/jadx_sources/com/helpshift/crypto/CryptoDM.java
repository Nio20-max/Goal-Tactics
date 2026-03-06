package com.helpshift.crypto;

import com.helpshift.logger.logmodels.ILogExtrasModel;
import com.helpshift.util.HSLogger;
import com.ironsource.sdk.precache.DownloadManager;
import java.security.GeneralSecurityException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import kotlin.UByte;

/* JADX INFO: loaded from: classes2.dex */
public class CryptoDM {
    private static final int MAX_HMAC_RETRY_COUNT = 1;
    private static final String TAG = "Helpshift_CryptoDM";

    public String getSignature(String str, String str2) throws GeneralSecurityException {
        String hMacSHA256 = getHMacSHA256(str, str2, 0);
        if (hMacSHA256 != null) {
            return hMacSHA256;
        }
        throw new GeneralSecurityException();
    }

    private String getHMacSHA256(String str, String str2, int i) {
        if (i > 1) {
            return null;
        }
        try {
            SecretKeySpec secretKeySpec = new SecretKeySpec(str2.getBytes(DownloadManager.UTF8_CHARSET), "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(secretKeySpec);
            return toHex(mac.doFinal(str.getBytes(DownloadManager.UTF8_CHARSET)));
        } catch (Exception e) {
            if (i == 1) {
                HSLogger.f(TAG, "Could not generate mac signature: " + e.getLocalizedMessage() + ", retryCount: " + i, e, new ILogExtrasModel[0]);
            } else {
                HSLogger.e(TAG, "Could not generate mac signature: " + e.getLocalizedMessage() + ", retryCount: " + i, e);
            }
            return getHMacSHA256(str, str2, i + 1);
        }
    }

    private String toHex(byte[] bArr) {
        char[] cArr = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        char[] cArr2 = new char[bArr.length * 2];
        for (int i = 0; i < bArr.length; i++) {
            int i2 = bArr[i] & UByte.MAX_VALUE;
            int i3 = i * 2;
            cArr2[i3] = cArr[i2 >>> 4];
            cArr2[i3 + 1] = cArr[i2 & 15];
        }
        return new String(cArr2);
    }
}
