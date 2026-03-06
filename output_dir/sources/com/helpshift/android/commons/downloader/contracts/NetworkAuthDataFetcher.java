package com.helpshift.android.commons.downloader.contracts;

import java.security.GeneralSecurityException;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public interface NetworkAuthDataFetcher {
    Map<String, String> getAuthData(Map<String, String> map) throws GeneralSecurityException;
}
