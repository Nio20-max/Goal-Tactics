package com.helpshift.support.imageloader;

import android.graphics.Bitmap;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.network.AuthDataProvider;
import com.helpshift.common.platform.Platform;
import com.helpshift.downloader.AdminFileInfo;
import com.helpshift.downloader.SupportDownloadStateChangeListener;
import com.helpshift.downloader.SupportDownloader;
import com.helpshift.util.Callback;
import com.helpshift.util.HSLogger;
import com.helpshift.util.ImageUtil;

/* JADX INFO: loaded from: classes2.dex */
public class URLBitmapProvider implements BitmapProvider {
    private static final String TAG = "Helpshift_URLBtmpPrvdr";
    private Domain domain;
    private SupportDownloader downloader;
    private String imgUrl;
    private Platform platform;

    public URLBitmapProvider(String str, SupportDownloader supportDownloader, Domain domain, Platform platform) {
        this.imgUrl = str;
        this.downloader = supportDownloader;
        this.domain = domain;
        this.platform = platform;
    }

    @Override // com.helpshift.support.imageloader.BitmapProvider
    public void getBitmap(final int i, boolean z, final Callback<Bitmap, String> callback) {
        String str = this.imgUrl;
        this.downloader.startDownload(new AdminFileInfo(str, str, null, true), SupportDownloader.StorageDirType.EXTERNAL_ONLY, new AuthDataProvider(this.domain, this.platform, this.imgUrl), new SupportDownloadStateChangeListener() { // from class: com.helpshift.support.imageloader.URLBitmapProvider.1
            @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
            public void onProgressChange(String str2, int i2) {
            }

            @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
            public void onFailure(String str2, int i2) {
                callback.onFailure("Unable to load image from: " + str2);
            }

            @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
            public void onSuccess(String str2, String str3, String str4) {
                HSLogger.d(URLBitmapProvider.TAG, "Image downloaded from url: " + str2 + " cached at path: " + str3);
                callback.onSuccess(ImageUtil.decodeFile(str3, i));
            }
        });
    }

    @Override // com.helpshift.support.imageloader.BitmapProvider
    public String getSource() {
        return this.imgUrl;
    }
}
