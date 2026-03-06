package com.ironsource.sdk.Events;

import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.sdk.constants.Events;

/* JADX INFO: loaded from: classes2.dex */
public class SDK5Events {
    public static Event initSDK = new Event(IronSourceConstants.IS_LOAD_CALLED, formatEventName("initsdk"));
    public static Event createControllerWeb = new Event(IronSourceConstants.IS_INSTANCE_LOAD, formatEventName("createcontrollerweb"));
    public static Event createControllerNative = new Event(IronSourceConstants.IS_INSTANCE_LOAD_SUCCESS, formatEventName("createcontrollernative"));
    public static Event controllerStageReady = new Event(IronSourceConstants.IS_CALLBACK_LOAD_SUCCESS, formatEventName("controllerstageready"));
    public static Event loadAd = new Event(IronSourceConstants.IS_INSTANCE_OPENED, formatEventName("loadad"));
    public static Event loadAdFailed = new Event(IronSourceConstants.IS_INSTANCE_CLICKED, formatEventName("loadadfailed"));
    public static Event initProduct = new Event(2007, formatEventName("initproduct"));
    public static Event initProductFailed = new Event(2008, formatEventName("initproductfailed"));
    public static Event loadProduct = new Event(2009, formatEventName("loadproduct"));
    public static Event parseAdmFailed = new Event(2010, formatEventName("parseadmfailed"));
    public static Event loadAdSuccess = new Event(2011, formatEventName("loadadsuccess"));
    public static Event controllerFailed = new Event(2013, formatEventName("controllerfailed"));
    public static Event extractInstalledPackagesFailed = new Event(2014, formatEventName("extractinstalledpackagesfailed"));
    public static Event appendNativeFeaturesDataFailed = new Event(2015, formatEventName("appendnativefeaturesdatafailed"));
    public static Event adunitCouldNotLoadToWebView = new Event(2016, formatEventName("adunitcouldnotloadtowebview"));
    public static Event webViewCleanUpFailed = new Event(2017, formatEventName("webviewcleanupfailed"));
    public static Event removeWebViewFailed = new Event(2018, formatEventName("removewebviewfailed"));
    public static Event adunitCouldNotLoadToWebViewBanners = new Event(2019, formatEventName("adunitcouldnotloadtowebviewbanners"));

    /* JADX INFO: Access modifiers changed from: package-private */
    public static class Event {
        int id;
        String name;

        Event(int i, String str) {
            this.id = i;
            this.name = str;
        }
    }

    static String formatEventName(String str) {
        return Events.EVENT_PREFIX + str;
    }
}
