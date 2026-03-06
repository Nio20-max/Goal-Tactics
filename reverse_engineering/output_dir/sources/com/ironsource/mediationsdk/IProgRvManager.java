package com.ironsource.mediationsdk;

import android.content.Context;
import com.ironsource.mediationsdk.model.Placement;

/* JADX INFO: loaded from: classes2.dex */
public interface IProgRvManager extends IProgManager {
    boolean isRewardedVideoAvailable();

    void shouldTrackNetworkState(Context context, boolean z);

    void showRewardedVideo(Placement placement);
}
