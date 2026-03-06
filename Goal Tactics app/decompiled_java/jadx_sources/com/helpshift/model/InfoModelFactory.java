package com.helpshift.model;

import com.helpshift.storage.CachedKeyValueStorage;
import com.helpshift.storage.StorageFactory;
import com.helpshift.util.HelpshiftContext;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: loaded from: classes2.dex */
public class InfoModelFactory {
    public final AppInfoModel appInfoModel;
    public final SdkInfoModel sdkInfoModel;

    InfoModelFactory() {
        CachedKeyValueStorage cachedKeyValueStorage = new CachedKeyValueStorage(StorageFactory.getInstance().keyValueStorage, getCacheWhitelistKeys());
        this.appInfoModel = new AppInfoModel(cachedKeyValueStorage);
        this.sdkInfoModel = new SdkInfoModel(cachedKeyValueStorage, HelpshiftContext.getPlatform());
    }

    private Set<String> getCacheWhitelistKeys() {
        return new HashSet(Arrays.asList(SdkInfoModel.SDK_LANGUAGE, SdkInfoModel.SDK_THEME, "disableHelpshiftBranding", AppInfoModel.SCREEN_ORIENTATION_KEY));
    }

    public static InfoModelFactory getInstance() {
        return LazyHolder.INSTANCE;
    }

    private static final class LazyHolder {
        static final InfoModelFactory INSTANCE = new InfoModelFactory();

        private LazyHolder() {
        }
    }
}
