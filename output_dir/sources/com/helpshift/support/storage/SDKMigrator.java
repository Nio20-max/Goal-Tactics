package com.helpshift.support.storage;

import com.helpshift.util.VersionName;

/* JADX INFO: loaded from: classes2.dex */
public interface SDKMigrator {
    void backup(VersionName versionName);

    void restore();
}
