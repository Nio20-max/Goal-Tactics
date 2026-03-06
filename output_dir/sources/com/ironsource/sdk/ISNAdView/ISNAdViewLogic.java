package com.ironsource.sdk.ISNAdView;

import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.Log;
import android.webkit.WebView;
import com.ironsource.sdk.constants.Constants;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class ISNAdViewLogic {
    private static Handler mUIThreadHandler;
    private String mAdViewId;
    private ISNAdViewDelegate mDelegate;
    private WebView mWebView;
    private JSONObject mAdViewConfiguration = null;
    private String TAG = ISNAdViewLogic.class.getSimpleName();
    private String[] commandsToHandleInAdView = {ISNAdViewConstants.HANDLE_GET_VIEW_VISIBILITY};
    private final String[] supportedCommandsFromController = {ISNAdViewConstants.LOAD_WITH_URL, ISNAdViewConstants.UPDATE_AD, "isExternalAdViewInitiated", ISNAdViewConstants.HANDLE_GET_VIEW_VISIBILITY, ISNAdViewConstants.SEND_MESSAGE};
    private ViewVisibilityParameters mAdViewVisibilityParameters = new ViewVisibilityParameters();

    public void setAdViewId(String str) {
        this.mAdViewId = str;
    }

    public void setControllerDelegate(ISNAdViewDelegate iSNAdViewDelegate) {
        this.mDelegate = iSNAdViewDelegate;
    }

    public String getAdViewId() {
        return this.mAdViewId;
    }

    private Handler getUIThreadHandler() {
        try {
            if (mUIThreadHandler == null) {
                mUIThreadHandler = new Handler(Looper.getMainLooper());
            }
        } catch (Exception e) {
            Log.e(this.TAG, "Error while trying execute method getUIThreadHandler");
            e.printStackTrace();
        }
        return mUIThreadHandler;
    }

    public void setAdViewWebView(WebView webView) {
        this.mWebView = webView;
    }

    public void setAdViewIdentifier(String str) {
        JSONObject jSONObject = new JSONObject();
        this.mAdViewConfiguration = jSONObject;
        try {
            jSONObject.put(ISNAdViewConstants.EXTERNAL_AD_VIEW_ID, str);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public void destroy() {
        this.mAdViewConfiguration = null;
        this.mDelegate = null;
        this.mAdViewVisibilityParameters = null;
        mUIThreadHandler = null;
    }

    JSONObject buildDataForLoadingAd(JSONObject jSONObject, String str) throws Exception {
        try {
            boolean zIsInReload = isInReload();
            if (this.mAdViewConfiguration == null) {
                this.mAdViewConfiguration = new JSONObject(jSONObject.toString());
            }
            this.mAdViewConfiguration.put(ISNAdViewConstants.EXTERNAL_AD_VIEW_ID, str);
            this.mAdViewConfiguration.put(ISNAdViewConstants.IS_IN_RELOAD, zIsInReload);
            return this.mAdViewConfiguration;
        } catch (Exception unused) {
            throw new Exception("ISNAdViewLogic | buildDataForLoadingAd | Could not build load parameters");
        }
    }

    private boolean isInReload() {
        return this.mAdViewConfiguration != null;
    }

    public void sendMessageToController(String str, JSONObject jSONObject) {
        ISNAdViewDelegate iSNAdViewDelegate = this.mDelegate;
        if (iSNAdViewDelegate != null) {
            iSNAdViewDelegate.sendMessageToController(str, jSONObject);
        }
    }

    public void sendErrorMessageToController(String str, String str2) {
        ISNAdViewDelegate iSNAdViewDelegate = this.mDelegate;
        if (iSNAdViewDelegate != null) {
            iSNAdViewDelegate.sendErrorMessageToController(str, str2, this.mAdViewId);
        }
    }

    void handleMessageFromController(final String str, final JSONObject jSONObject, final String str2, final String str3) {
        getUIThreadHandler().post(new Runnable() { // from class: com.ironsource.sdk.ISNAdView.ISNAdViewLogic.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    if (!ISNAdViewLogic.this.canHandleCommandFromController(str)) {
                        String str4 = "ISNAdViewLogic | handleMessageFromController | cannot handle command: " + str;
                        Log.e(ISNAdViewLogic.this.TAG, str4);
                        ISNAdViewLogic.this.mDelegate.sendErrorMessageToController(str3, str4, ISNAdViewLogic.this.mAdViewId);
                        return;
                    }
                    if (str.equalsIgnoreCase("isExternalAdViewInitiated")) {
                        ISNAdViewLogic.this.sendIsExternalAdViewInitiated(str2);
                        return;
                    }
                    if (str.equalsIgnoreCase(ISNAdViewConstants.HANDLE_GET_VIEW_VISIBILITY)) {
                        ISNAdViewLogic.this.sendHandleGetViewVisibilityParams(str2);
                        return;
                    }
                    if (!str.equalsIgnoreCase(ISNAdViewConstants.SEND_MESSAGE) && !str.equalsIgnoreCase(ISNAdViewConstants.UPDATE_AD)) {
                        String str5 = "ISNAdViewLogic | handleMessageFromController | unhandled API request " + str + " " + jSONObject.toString();
                        Log.e(ISNAdViewLogic.this.TAG, str5);
                        ISNAdViewLogic.this.mDelegate.sendErrorMessageToController(str3, str5, ISNAdViewLogic.this.mAdViewId);
                        return;
                    }
                    ISNAdViewLogic.this.sendMessageToAdunit(jSONObject.getString("params"), str2, str3);
                } catch (Exception e) {
                    e.printStackTrace();
                    String str6 = "ISNAdViewLogic | handleMessageFromController | Error while trying handle message: " + str;
                    Log.e(ISNAdViewLogic.this.TAG, str6);
                    ISNAdViewLogic.this.mDelegate.sendErrorMessageToController(str3, str6, ISNAdViewLogic.this.mAdViewId);
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean canHandleCommandFromController(String str) {
        int i = 0;
        boolean z = false;
        while (true) {
            String[] strArr = this.supportedCommandsFromController;
            if (i >= strArr.length || z) {
                break;
            }
            if (strArr[i].equalsIgnoreCase(str)) {
                z = true;
            }
            i++;
        }
        return z;
    }

    public void updateViewVisibilityParameters(String str, int i, boolean z) {
        this.mAdViewVisibilityParameters.updateViewVisibilityParameters(str, i, z);
        if (shouldReportVisibilityToController(str)) {
            reportAdContainerIsVisible();
        }
    }

    private boolean shouldReportVisibilityToController(String str) {
        if (Build.VERSION.SDK_INT <= 22) {
            return str.equalsIgnoreCase(ISNAdViewConstants.IS_WINDOW_VISIBLE_KEY);
        }
        return str.equalsIgnoreCase(ISNAdViewConstants.IS_VISIBLE_KEY);
    }

    private void reportAdContainerIsVisible() {
        if (this.mDelegate == null || this.mAdViewVisibilityParameters == null) {
            return;
        }
        sendMessageToController(ISNAdViewConstants.CONTAINER_IMPRESSION_MESSAGE, buildParamsObjectForAdViewVisibility());
    }

    public void reportAdContainerWasRemoved() {
        if (this.mDelegate == null || this.mAdViewVisibilityParameters == null) {
            return;
        }
        sendMessageToController(ISNAdViewConstants.CONTAINER_DESTRUCTION_MESSAGE, buildParamsObjectForAdViewVisibility());
    }

    private JSONObject buildParamsObjectForAdViewVisibility() {
        return new JSONObject() { // from class: com.ironsource.sdk.ISNAdView.ISNAdViewLogic.2
            {
                try {
                    put(ISNAdViewConstants.CONFIGS, ISNAdViewLogic.this.extendConfigurationWithVisibilityParams(ISNAdViewLogic.this.mAdViewConfiguration, ISNAdViewLogic.this.mAdViewVisibilityParameters.collectVisibilityParameters()));
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public JSONObject extendConfigurationWithVisibilityParams(JSONObject jSONObject, JSONObject jSONObject2) {
        try {
            JSONObject jSONObject3 = new JSONObject(jSONObject.toString());
            jSONObject3.put(ISNAdViewConstants.VISIBILITY_PARAMS_KEY, jSONObject2);
            return jSONObject3;
        } catch (JSONException e) {
            e.printStackTrace();
            return jSONObject;
        }
    }

    public void sendIsExternalAdViewInitiated(String str) {
        try {
            WebView webView = this.mWebView;
            boolean z = (webView == null || webView.getUrl() == null) ? false : true;
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("isExternalAdViewInitiated", z);
            jSONObject.put(Constants.ParametersKeys.AD_VIEW_ID, this.mAdViewId);
            sendMessageToController(str, jSONObject);
        } catch (Exception e) {
            Log.e(this.TAG, "Error while trying execute method sendIsExternalAdViewInitiated");
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendHandleGetViewVisibilityParams(String str) throws JSONException {
        JSONObject jSONObjectCollectVisibilityParameters = this.mAdViewVisibilityParameters.collectVisibilityParameters();
        jSONObjectCollectVisibilityParameters.put(Constants.ParametersKeys.AD_VIEW_ID, this.mAdViewId);
        sendMessageToController(str, jSONObjectCollectVisibilityParameters);
    }

    public void sendMessageToAdunit(String str, String str2, String str3) throws JSONException {
        if (this.mWebView == null) {
            String str4 = "No external adunit attached to ISNAdView while trying to send message: " + str;
            Log.e(this.TAG, str4);
            this.mDelegate.sendErrorMessageToController(str3, str4, this.mAdViewId);
            return;
        }
        try {
            new JSONObject(str);
        } catch (JSONException unused) {
            str = "\"" + str + "\"";
        }
        final String strBuildCommandForWebView = buildCommandForWebView(str);
        getUIThreadHandler().post(new Runnable() { // from class: com.ironsource.sdk.ISNAdView.ISNAdViewLogic.3
            @Override // java.lang.Runnable
            public void run() {
                ISNAdViewLogic.this.injectJavaScriptIntoWebView(strBuildCommandForWebView);
            }
        });
        JSONObject jSONObject = new JSONObject();
        jSONObject.put(Constants.ParametersKeys.AD_VIEW_ID, this.mAdViewId);
        sendMessageToController(str2, jSONObject);
    }

    private String buildCommandForWebView(String str) {
        return String.format(ISNAdViewConstants.ADUNIT_MESSAGE_FORMAT, str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void injectJavaScriptIntoWebView(String str) {
        try {
            String str2 = "javascript:try{" + str + "}catch(e){console.log(\"JS exception: \" + JSON.stringify(e));}";
            if (Build.VERSION.SDK_INT >= 19) {
                this.mWebView.evaluateJavascript(str2, null);
            } else {
                this.mWebView.loadUrl(str2);
            }
        } catch (Throwable th) {
            Log.e(this.TAG, "injectJavaScriptIntoWebView | Error while trying inject JS into external adunit: " + str + "Android API level: " + Build.VERSION.SDK_INT);
            th.printStackTrace();
        }
    }

    public void handleMessageFromWebView(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            String strOptString = jSONObject.optString("method");
            if (!TextUtils.isEmpty(strOptString) && shouldHandleMessageInContainer(strOptString)) {
                if (strOptString.equalsIgnoreCase(ISNAdViewConstants.HANDLE_GET_VIEW_VISIBILITY)) {
                    sendHandleGetViewVisibilityParamsForWebView(jSONObject);
                }
            } else {
                sendMessageToController(ISNAdViewConstants.CONTAINER_SEND_MESSAGE, jSONObject);
            }
        } catch (JSONException e) {
            Log.e(this.TAG, "ISNAdViewLogic | receiveMessageFromExternal | Error while trying handle message: " + str);
            e.printStackTrace();
        }
    }

    private boolean shouldHandleMessageInContainer(String str) {
        int i = 0;
        while (true) {
            String[] strArr = this.commandsToHandleInAdView;
            if (i >= strArr.length) {
                return false;
            }
            if (strArr[i].equalsIgnoreCase(str)) {
                return true;
            }
            i++;
        }
    }

    private void sendHandleGetViewVisibilityParamsForWebView(JSONObject jSONObject) throws JSONException {
        sendMessageToAdunit(buildVisibilityMessageForAdunit(jSONObject).toString(), null, null);
    }

    private JSONObject buildVisibilityMessageForAdunit(JSONObject jSONObject) {
        JSONObject jSONObject2 = new JSONObject();
        try {
            jSONObject2.put("id", jSONObject.getString("id"));
            jSONObject2.put("data", this.mAdViewVisibilityParameters.collectVisibilityParameters());
        } catch (Exception e) {
            Log.e(this.TAG, "Error while trying execute method buildVisibilityMessageForAdunit | params: " + jSONObject);
            e.printStackTrace();
        }
        return jSONObject2;
    }
}
