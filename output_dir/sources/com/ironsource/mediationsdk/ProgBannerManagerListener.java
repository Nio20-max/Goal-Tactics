package com.ironsource.mediationsdk;

import android.view.View;
import android.widget.FrameLayout;
import com.ironsource.mediationsdk.logger.IronSourceError;

/* JADX INFO: loaded from: classes2.dex */
public interface ProgBannerManagerListener {
    void onBannerClicked(ProgBannerSmash progBannerSmash);

    void onBannerLeftApplication(ProgBannerSmash progBannerSmash);

    void onBannerLoadFailed(IronSourceError ironSourceError, ProgBannerSmash progBannerSmash, boolean z);

    void onBannerLoadSuccess(ProgBannerSmash progBannerSmash, View view, FrameLayout.LayoutParams layoutParams);

    void onBannerScreenDismissed(ProgBannerSmash progBannerSmash);

    void onBannerScreenPresented(ProgBannerSmash progBannerSmash);
}
