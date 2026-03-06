package com.ironsource.sdk.controller;

import android.app.Activity;
import android.text.TextUtils;
import com.ironsource.sdk.ISNAdView.ISNAdViewDelegate;
import com.ironsource.sdk.WPAD.AdViewsManager;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.controller.WebController;
import com.ironsource.sdk.data.SSAObj;
import com.ironsource.sdk.utils.WPADUtils;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class AdViewsJSAdapter implements ISNAdViewDelegate {
    private static final String AD_VIEWS_FUNCTION_PROPERTY_NAME = "functionName";
    private static final String AD_VIEWS_PARAMS_PROPERTY_NAME = "functionParams";
    public static final String ERR_MSG = "errMsg";
    private static final String FAIL_JS_CALLBACK_NAME = "fail";
    public static final String IS_EXTERNAL_AD_VIEW_INITIATED = "isExternalAdViewInitiated";
    private static final String LOAD_WITH_URL = "loadWithUrl";
    public static final String REMOVE_AD_VIEW = "removeAdView";
    private static final String SEND_MESSAGE = "sendMessage";
    private static final String SUCCESS_JS_CALLBACK_NAME = "success";
    private static final String UNSUPPORTED_AD_VIEWS_API_MESSAGE = "%s | unsupported AdViews API";
    private Activity mActivity;
    private AdViewsManager mAdViewManager = AdViewsManager.getInstance();
    private WebViewMessagingMediator mControllerMessageMediator;

    public AdViewsJSAdapter(Activity activity) {
        this.mActivity = activity;
    }

    public void setCommunicationWithController(WebViewMessagingMediator webViewMessagingMediator) {
        this.mControllerMessageMediator = webViewMessagingMediator;
    }

    @Override // com.ironsource.sdk.ISNAdView.ISNAdViewDelegate
    public void sendMessageToController(String str, JSONObject jSONObject) {
        if (this.mControllerMessageMediator == null || TextUtils.isEmpty(str)) {
            return;
        }
        this.mControllerMessageMediator.sendMessageToController(str, jSONObject);
    }

    @Override // com.ironsource.sdk.ISNAdView.ISNAdViewDelegate
    public void sendErrorMessageToController(String str, String str2, String str3) {
        sendMessageToController(str, WPADUtils.buildErrorObject(str2, str3));
    }

    private static class FunctionCall {
        String failCallback;
        String name;
        JSONObject params;
        String successCallback;

        private FunctionCall() {
        }
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    void call(String str, WebController.NativeAPI.JSCallbackTask jSCallbackTask) throws Exception {
        FunctionCall functionCallFetchFunctionCall = fetchFunctionCall(str);
        SSAObj sSAObj = new SSAObj();
        try {
            String str2 = functionCallFetchFunctionCall.name;
            byte b = -1;
            switch (str2.hashCode()) {
                case -1384357108:
                    if (str2.equals(REMOVE_AD_VIEW)) {
                        b = 3;
                    }
                    break;
                case 691453791:
                    if (str2.equals("sendMessage")) {
                        b = 1;
                    }
                    break;
                case 842351363:
                    if (str2.equals("loadWithUrl")) {
                        b = 0;
                    }
                    break;
                case 1633780878:
                    if (str2.equals("isExternalAdViewInitiated")) {
                        b = 2;
                    }
                    break;
            }
            if (b == 0) {
                this.mAdViewManager.loadWithUrl(this, functionCallFetchFunctionCall.params, this.mActivity, functionCallFetchFunctionCall.successCallback, functionCallFetchFunctionCall.failCallback);
                return;
            }
            if (b == 1) {
                this.mAdViewManager.sendMessageToAd(functionCallFetchFunctionCall.params, functionCallFetchFunctionCall.successCallback, functionCallFetchFunctionCall.failCallback);
            } else if (b == 2) {
                this.mAdViewManager.sendIsExternalAdViewInitiated(functionCallFetchFunctionCall.params, functionCallFetchFunctionCall.successCallback);
            } else {
                if (b == 3) {
                    this.mAdViewManager.removeAdView(functionCallFetchFunctionCall.params, functionCallFetchFunctionCall.successCallback, functionCallFetchFunctionCall.failCallback);
                    return;
                }
                throw new IllegalArgumentException(String.format(UNSUPPORTED_AD_VIEWS_API_MESSAGE, functionCallFetchFunctionCall.name));
            }
        } catch (Exception e) {
            sSAObj.put("errMsg", e.getMessage());
            String adViewId = this.mAdViewManager.getAdViewId(functionCallFetchFunctionCall.params);
            if (!TextUtils.isEmpty(adViewId)) {
                sSAObj.put(Constants.ParametersKeys.AD_VIEW_ID, adViewId);
            }
            jSCallbackTask.sendMessage(false, functionCallFetchFunctionCall.failCallback, sSAObj);
        }
    }

    private FunctionCall fetchFunctionCall(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject(str);
        FunctionCall functionCall = new FunctionCall();
        functionCall.name = jSONObject.optString("functionName");
        functionCall.params = jSONObject.optJSONObject("functionParams");
        functionCall.successCallback = jSONObject.optString("success");
        functionCall.failCallback = jSONObject.optString("fail");
        return functionCall;
    }
}
