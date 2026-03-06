package com.helpshift.android.commons.downloader.contracts;

import java.io.Serializable;

/* JADX INFO: loaded from: classes.dex */
public interface DownloaderKeyValueStorage {
    Object get(String str);

    boolean set(String str, Serializable serializable);
}
