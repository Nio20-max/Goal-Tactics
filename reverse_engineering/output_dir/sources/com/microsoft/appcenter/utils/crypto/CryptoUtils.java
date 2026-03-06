package com.microsoft.appcenter.utils.crypto;

import android.content.Context;
import android.os.Build;
import android.util.Base64;
import com.ironsource.sdk.precache.DownloadManager;
import com.microsoft.appcenter.utils.AppCenterLog;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.KeyStore;
import java.security.cert.CertificateExpiredException;
import java.security.spec.AlgorithmParameterSpec;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;

/* JADX INFO: loaded from: classes2.dex */
public class CryptoUtils {
    static final ICryptoFactory DEFAULT_CRYPTO_FACTORY = new ICryptoFactory() { // from class: com.microsoft.appcenter.utils.crypto.CryptoUtils.1
        @Override // com.microsoft.appcenter.utils.crypto.CryptoUtils.ICryptoFactory
        public IKeyGenerator getKeyGenerator(String algorithm, String provider) throws Exception {
            final KeyGenerator keyGenerator = KeyGenerator.getInstance(algorithm, provider);
            return new IKeyGenerator() { // from class: com.microsoft.appcenter.utils.crypto.CryptoUtils.1.1
                @Override // com.microsoft.appcenter.utils.crypto.CryptoUtils.IKeyGenerator
                public void init(AlgorithmParameterSpec parameters) throws Exception {
                    keyGenerator.init(parameters);
                }

                @Override // com.microsoft.appcenter.utils.crypto.CryptoUtils.IKeyGenerator
                public void generateKey() {
                    keyGenerator.generateKey();
                }
            };
        }

        @Override // com.microsoft.appcenter.utils.crypto.CryptoUtils.ICryptoFactory
        public ICipher getCipher(String transformation, String provider) throws Exception {
            final Cipher cipher;
            if (provider != null) {
                cipher = Cipher.getInstance(transformation, provider);
            } else {
                cipher = Cipher.getInstance(transformation);
            }
            return new ICipher() { // from class: com.microsoft.appcenter.utils.crypto.CryptoUtils.1.2
                @Override // com.microsoft.appcenter.utils.crypto.CryptoUtils.ICipher
                public void init(int opMode, Key key) throws Exception {
                    cipher.init(opMode, key);
                }

                @Override // com.microsoft.appcenter.utils.crypto.CryptoUtils.ICipher
                public void init(int opMode, Key key, AlgorithmParameterSpec params) throws Exception {
                    cipher.init(opMode, key, params);
                }

                @Override // com.microsoft.appcenter.utils.crypto.CryptoUtils.ICipher
                public byte[] doFinal(byte[] input) throws Exception {
                    return cipher.doFinal(input);
                }

                @Override // com.microsoft.appcenter.utils.crypto.CryptoUtils.ICipher
                public byte[] doFinal(byte[] input, int inputOffset, int inputLength) throws Exception {
                    return cipher.doFinal(input, inputOffset, inputLength);
                }

                @Override // com.microsoft.appcenter.utils.crypto.CryptoUtils.ICipher
                public byte[] getIV() {
                    return cipher.getIV();
                }

                @Override // com.microsoft.appcenter.utils.crypto.CryptoUtils.ICipher
                public int getBlockSize() {
                    return cipher.getBlockSize();
                }

                @Override // com.microsoft.appcenter.utils.crypto.CryptoUtils.ICipher
                public String getAlgorithm() {
                    return cipher.getAlgorithm();
                }

                @Override // com.microsoft.appcenter.utils.crypto.CryptoUtils.ICipher
                public String getProvider() {
                    return cipher.getProvider().getName();
                }
            };
        }
    };
    private static final String M_KEY_EXPIRED_EXCEPTION = "android.security.keystore.KeyExpiredException";
    private static CryptoUtils sInstance;
    private final int mApiLevel;
    private final Context mContext;
    private final ICryptoFactory mCryptoFactory;
    private final Map<String, CryptoHandlerEntry> mCryptoHandlers;
    private final KeyStore mKeyStore;

    interface ICipher {
        byte[] doFinal(byte[] input) throws Exception;

        byte[] doFinal(byte[] input, int inputOffset, int inputLength) throws Exception;

        String getAlgorithm();

        int getBlockSize();

        byte[] getIV();

        String getProvider();

        void init(int opMode, Key key) throws Exception;

        void init(int opMode, Key key, AlgorithmParameterSpec params) throws Exception;
    }

    interface ICryptoFactory {
        ICipher getCipher(String algorithm, String provider) throws Exception;

        IKeyGenerator getKeyGenerator(String algorithm, String provider) throws Exception;
    }

    interface IKeyGenerator {
        void generateKey();

        void init(AlgorithmParameterSpec parameters) throws Exception;
    }

    private CryptoUtils(Context context) {
        this(context, DEFAULT_CRYPTO_FACTORY, Build.VERSION.SDK_INT);
    }

    CryptoUtils(Context context, ICryptoFactory cryptoFactory, int apiLevel) {
        KeyStore keyStore;
        this.mCryptoHandlers = new LinkedHashMap();
        this.mContext = context.getApplicationContext();
        this.mCryptoFactory = cryptoFactory;
        this.mApiLevel = apiLevel;
        KeyStore keyStore2 = null;
        try {
            keyStore = KeyStore.getInstance("AndroidKeyStore");
        } catch (Exception unused) {
        }
        try {
            keyStore.load(null);
        } catch (Exception unused2) {
            keyStore2 = keyStore;
            AppCenterLog.error("AppCenter", "Cannot use secure keystore on this device.");
            keyStore = keyStore2;
        }
        this.mKeyStore = keyStore;
        if (keyStore != null && apiLevel >= 23) {
            try {
                registerHandler(new CryptoAesAndEtmHandler());
                registerHandler(new CryptoAesHandler());
            } catch (Exception unused3) {
                AppCenterLog.error("AppCenter", "Cannot use modern encryption on this device.");
            }
        }
        if (keyStore != null) {
            try {
                registerHandler(new CryptoRsaHandler());
            } catch (Exception unused4) {
                AppCenterLog.error("AppCenter", "Cannot use old encryption on this device.");
            }
        }
        CryptoNoOpHandler cryptoNoOpHandler = new CryptoNoOpHandler();
        this.mCryptoHandlers.put(cryptoNoOpHandler.getAlgorithm(), new CryptoHandlerEntry(0, cryptoNoOpHandler));
    }

    public static CryptoUtils getInstance(Context context) {
        if (sInstance == null) {
            sInstance = new CryptoUtils(context);
        }
        return sInstance;
    }

    ICryptoFactory getCryptoFactory() {
        return this.mCryptoFactory;
    }

    private void registerHandler(CryptoHandler handler) throws Exception {
        int i = 0;
        String alias = getAlias(handler, 0);
        String alias2 = getAlias(handler, 1);
        Date creationDate = this.mKeyStore.getCreationDate(alias);
        Date creationDate2 = this.mKeyStore.getCreationDate(alias2);
        if (creationDate2 != null && creationDate2.after(creationDate)) {
            alias = alias2;
            i = 1;
        }
        if (this.mCryptoHandlers.isEmpty() && !this.mKeyStore.containsAlias(alias)) {
            AppCenterLog.debug("AppCenter", "Creating alias: " + alias);
            handler.generateKey(this.mCryptoFactory, alias, this.mContext);
        }
        AppCenterLog.debug("AppCenter", "Using " + alias);
        this.mCryptoHandlers.put(handler.getAlgorithm(), new CryptoHandlerEntry(i, handler));
    }

    private String getAlias(CryptoHandler handler, int index) {
        return "appcenter." + index + "." + handler.getAlgorithm();
    }

    private KeyStore.Entry getKeyStoreEntry(CryptoHandlerEntry handlerEntry) throws Exception {
        return getKeyStoreEntry(handlerEntry.mCryptoHandler, handlerEntry.mAliasIndex);
    }

    private KeyStore.Entry getKeyStoreEntry(CryptoHandler cryptoHandler, int aliasIndex) throws Exception {
        if (this.mKeyStore == null) {
            return null;
        }
        return this.mKeyStore.getEntry(getAlias(cryptoHandler, aliasIndex), null);
    }

    public String encrypt(String data) {
        if (data == null) {
            return null;
        }
        try {
            CryptoHandlerEntry next = this.mCryptoHandlers.values().iterator().next();
            CryptoHandler cryptoHandler = next.mCryptoHandler;
            try {
                return cryptoHandler.getAlgorithm() + ":" + Base64.encodeToString(cryptoHandler.encrypt(this.mCryptoFactory, this.mApiLevel, getKeyStoreEntry(next), data.getBytes(DownloadManager.UTF8_CHARSET)), 0);
            } catch (InvalidKeyException e) {
                if (!(e.getCause() instanceof CertificateExpiredException) && !M_KEY_EXPIRED_EXCEPTION.equals(e.getClass().getName())) {
                    throw e;
                }
                AppCenterLog.debug("AppCenter", "Alias expired: " + next.mAliasIndex);
                next.mAliasIndex = next.mAliasIndex ^ 1;
                String alias = getAlias(cryptoHandler, next.mAliasIndex);
                if (this.mKeyStore.containsAlias(alias)) {
                    AppCenterLog.debug("AppCenter", "Deleting alias: " + alias);
                    this.mKeyStore.deleteEntry(alias);
                }
                AppCenterLog.debug("AppCenter", "Creating alias: " + alias);
                cryptoHandler.generateKey(this.mCryptoFactory, alias, this.mContext);
                return encrypt(data);
            }
        } catch (Exception unused) {
            AppCenterLog.error("AppCenter", "Failed to encrypt data.");
            return data;
        }
    }

    public DecryptedData decrypt(String data) {
        if (data == null) {
            return new DecryptedData(null, null);
        }
        String[] strArrSplit = data.split(":");
        CryptoHandlerEntry cryptoHandlerEntry = strArrSplit.length == 2 ? this.mCryptoHandlers.get(strArrSplit[0]) : null;
        CryptoHandler cryptoHandler = cryptoHandlerEntry == null ? null : cryptoHandlerEntry.mCryptoHandler;
        if (cryptoHandler == null) {
            AppCenterLog.error("AppCenter", "Failed to decrypt data.");
            return new DecryptedData(data, null);
        }
        try {
            try {
                return getDecryptedData(cryptoHandler, cryptoHandlerEntry.mAliasIndex, strArrSplit[1]);
            } catch (Exception unused) {
                return getDecryptedData(cryptoHandler, cryptoHandlerEntry.mAliasIndex ^ 1, strArrSplit[1]);
            }
        } catch (Exception unused2) {
            AppCenterLog.error("AppCenter", "Failed to decrypt data.");
            return new DecryptedData(data, null);
        }
    }

    private DecryptedData getDecryptedData(CryptoHandler cryptoHandler, int aliasIndex, String data) throws Exception {
        String str = new String(cryptoHandler.decrypt(this.mCryptoFactory, this.mApiLevel, getKeyStoreEntry(cryptoHandler, aliasIndex), Base64.decode(data, 0)), DownloadManager.UTF8_CHARSET);
        return new DecryptedData(str, cryptoHandler != this.mCryptoHandlers.values().iterator().next().mCryptoHandler ? encrypt(str) : null);
    }

    static class CryptoHandlerEntry {
        int mAliasIndex;
        final CryptoHandler mCryptoHandler;

        CryptoHandlerEntry(int aliasIndex, CryptoHandler cryptoHandler) {
            this.mAliasIndex = aliasIndex;
            this.mCryptoHandler = cryptoHandler;
        }
    }

    public static class DecryptedData {
        final String mDecryptedData;
        final String mNewEncryptedData;

        public DecryptedData(String decryptedData, String newEncryptedData) {
            this.mDecryptedData = decryptedData;
            this.mNewEncryptedData = newEncryptedData;
        }

        public String getDecryptedData() {
            return this.mDecryptedData;
        }

        public String getNewEncryptedData() {
            return this.mNewEncryptedData;
        }
    }
}
