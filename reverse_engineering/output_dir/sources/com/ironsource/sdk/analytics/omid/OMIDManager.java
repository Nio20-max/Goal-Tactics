package com.ironsource.sdk.analytics.omid;

import android.content.Context;
import android.text.TextUtils;
import android.webkit.WebView;
import com.iab.omid.library.ironsrc.Omid;
import com.iab.omid.library.ironsrc.adsession.AdEvents;
import com.iab.omid.library.ironsrc.adsession.AdSession;
import com.iab.omid.library.ironsrc.adsession.AdSessionConfiguration;
import com.iab.omid.library.ironsrc.adsession.AdSessionContext;
import com.iab.omid.library.ironsrc.adsession.Owner;
import com.iab.omid.library.ironsrc.adsession.Partner;
import com.ironsource.sdk.data.SSAObj;
import com.ironsource.sdk.utils.SDKUtils;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class OMIDManager {
    private static final String INVALID_OMID_IMPRESSION_OWNER_MESSAGE = "%s | Invalid OMID impressionOwner";
    private static final String INVALID_OMID_VIDEO_EVENTS_TYPE_MESSAGE = "%s | Invalid OMID videoEventsOwner";
    private static final String MISSING_OMID_IMPRESSION_OWNER_MESSAGE = "Missing OMID impressionOwner";
    private static final String MISSING_OMID_VIDEO_EVENTS_OWNER_MESSAGE = "Missing OMID videoEventsOwner";
    private static final String OMID_HAS_NOT_BEEN_ACTIVATED_MESSAGE = "OMID has not been activated";
    public static final String OMID_PARTNER_NAME_PROPERTY_NAME = "omidPartnerName";
    public static final String OMID_PARTNER_VERSION_PROPERTY_NAME = "omidPartnerVersion";
    private static final String OMID_SESSION_HAS_ALREADY_STARTED_MESSAGE = "OMID Session has already started";
    private static final String OMID_SESSION_HAS_NOT_STARTED_MESSAGE = "OMID Session has not started";
    public static final String OMID_VERSION_PROPERTY_NAME = "omidVersion";
    private static AdSession mAdSession;
    public static final String OMID_PARTNER_NAME = "Ironsrc";
    public static final String OMID_PARTNER_VERSION = "6";
    private static final Partner mPartner = Partner.createPartner(OMID_PARTNER_NAME, OMID_PARTNER_VERSION);
    private static boolean mIsActivated = false;

    static class OMIDOptions {
        private static final String CUSTOM_REFERENCE_DATA = "customReferenceData";
        private static final String IMPRESSION_OWNER = "impressionOwner";
        private static final String ISOLATE_VERIFICATION_SCRIPTS = "isolateVerificationScripts";
        private static final String VIDEO_EVENTS_OWNER = "videoEventsOwner";
        public String customReferenceData;
        public Owner impressionOwner;
        public boolean isolateVerificationScripts;
        public Owner videoEventsOwner;

        public static OMIDOptions createFromJSON(JSONObject jSONObject) throws IllegalArgumentException {
            OMIDOptions oMIDOptions = new OMIDOptions();
            oMIDOptions.isolateVerificationScripts = jSONObject.optBoolean(ISOLATE_VERIFICATION_SCRIPTS, false);
            String strOptString = jSONObject.optString(IMPRESSION_OWNER, "");
            if (TextUtils.isEmpty(strOptString)) {
                throw new IllegalArgumentException(String.format(OMIDManager.MISSING_OMID_IMPRESSION_OWNER_MESSAGE, strOptString));
            }
            try {
                oMIDOptions.impressionOwner = Owner.valueOf(strOptString.toUpperCase());
                String strOptString2 = jSONObject.optString(VIDEO_EVENTS_OWNER, "");
                if (TextUtils.isEmpty(strOptString)) {
                    throw new IllegalArgumentException(String.format(OMIDManager.MISSING_OMID_VIDEO_EVENTS_OWNER_MESSAGE, strOptString2));
                }
                try {
                    oMIDOptions.videoEventsOwner = Owner.valueOf(strOptString2.toUpperCase());
                    oMIDOptions.customReferenceData = jSONObject.optString(CUSTOM_REFERENCE_DATA, "");
                    return oMIDOptions;
                } catch (IllegalArgumentException unused) {
                    throw new IllegalArgumentException(String.format(OMIDManager.INVALID_OMID_VIDEO_EVENTS_TYPE_MESSAGE, strOptString2));
                }
            } catch (IllegalArgumentException unused2) {
                throw new IllegalArgumentException(String.format(OMIDManager.INVALID_OMID_IMPRESSION_OWNER_MESSAGE, strOptString));
            }
        }
    }

    public static void activate(Context context) throws IllegalArgumentException {
        if (mIsActivated) {
            return;
        }
        mIsActivated = Omid.activateWithOmidApiVersion(Omid.getVersion(), context);
    }

    public static SSAObj getOMIDData() {
        SSAObj sSAObj = new SSAObj();
        sSAObj.put(SDKUtils.encodeString("omidVersion"), SDKUtils.encodeString(Omid.getVersion()));
        sSAObj.put(SDKUtils.encodeString(OMID_PARTNER_NAME_PROPERTY_NAME), SDKUtils.encodeString(OMID_PARTNER_NAME));
        sSAObj.put(SDKUtils.encodeString("omidPartnerVersion"), SDKUtils.encodeString(OMID_PARTNER_VERSION));
        return sSAObj;
    }

    public static void startSession(JSONObject jSONObject, WebView webView) throws IllegalStateException, IllegalArgumentException {
        startSession(OMIDOptions.createFromJSON(jSONObject), webView);
    }

    public static void startSession(OMIDOptions oMIDOptions, WebView webView) throws IllegalStateException, IllegalArgumentException {
        if (!mIsActivated) {
            throw new IllegalStateException(OMID_HAS_NOT_BEEN_ACTIVATED_MESSAGE);
        }
        if (mAdSession != null) {
            throw new IllegalStateException(OMID_SESSION_HAS_ALREADY_STARTED_MESSAGE);
        }
        AdSession adSessionCreateSession = createSession(oMIDOptions, webView);
        mAdSession = adSessionCreateSession;
        adSessionCreateSession.start();
    }

    private static AdSession createSession(OMIDOptions oMIDOptions, WebView webView) throws IllegalArgumentException {
        AdSession adSessionCreateAdSession = AdSession.createAdSession(AdSessionConfiguration.createAdSessionConfiguration(oMIDOptions.impressionOwner, oMIDOptions.videoEventsOwner, oMIDOptions.isolateVerificationScripts), AdSessionContext.createHtmlAdSessionContext(mPartner, webView, oMIDOptions.customReferenceData));
        adSessionCreateAdSession.registerAdView(webView);
        return adSessionCreateAdSession;
    }

    public static void finishSession() throws IllegalStateException {
        assertAdSession();
        mAdSession.finish();
        mAdSession = null;
    }

    public static void impressionOccurred() throws IllegalStateException, IllegalArgumentException {
        assertAdSession();
        AdEvents.createAdEvents(mAdSession).impressionOccurred();
    }

    private static void assertAdSession() throws IllegalStateException {
        if (!mIsActivated) {
            throw new IllegalStateException(OMID_HAS_NOT_BEEN_ACTIVATED_MESSAGE);
        }
        if (mAdSession == null) {
            throw new IllegalStateException(OMID_SESSION_HAS_NOT_STARTED_MESSAGE);
        }
    }
}
