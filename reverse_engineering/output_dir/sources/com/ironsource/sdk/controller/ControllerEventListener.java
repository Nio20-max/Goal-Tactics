package com.ironsource.sdk.controller;

/* JADX INFO: loaded from: classes2.dex */
interface ControllerEventListener {
    void handleControllerStageFailed(String str);

    void handleControllerStageLoaded();

    void handleControllerStageReady();
}
