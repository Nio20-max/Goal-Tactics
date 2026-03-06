package com.ironsource.mediationsdk.sdk;

/* JADX INFO: loaded from: classes2.dex */
public interface OfferwallApi {
    void getOfferwallCredits();

    void initOfferwall(String str, String str2);

    boolean isOfferwallAvailable();

    void setOfferwallListener(OfferwallListener offerwallListener);

    void showOfferwall();

    void showOfferwall(String str);
}
