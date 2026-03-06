package com.helpshift.applifecycle;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public interface HSAppLifeCycleListener {
    void onAppBackground(Context context);

    void onAppForeground(Context context);
}
