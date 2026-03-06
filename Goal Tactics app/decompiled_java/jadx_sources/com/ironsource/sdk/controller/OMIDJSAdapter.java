package com.ironsource.sdk.controller;

import android.content.Context;
import android.webkit.WebView;
import com.ironsource.sdk.analytics.omid.OMIDManager;
import com.ironsource.sdk.controller.WebController;
import com.ironsource.sdk.data.SSAObj;
import com.ironsource.sdk.utils.Logger;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class OMIDJSAdapter {
    private static final String ACTIVATE_FUNCTION_NAME = "activate";
    private static final String FAIL_JS_CALLBACK_NAME = "fail";
    private static final String FINISH_SESSION_FUNCTION_NAME = "finishSession";
    private static final String GET_OMID_DATA_FUNCTION_NAME = "getOmidData";
    private static final String IMPRESSION_OCCURRED_FUNCTION_NAME = "impressionOccurred";
    private static final String OMID_FUNCTION_PROPERTY_NAME = "omidFunction";
    private static final String OMID_PARAMS_PROPERTY_NAME = "omidParams";
    private static final String START_SESSION_FUNCTION_NAME = "startSession";
    private static final String SUCCESS_JS_CALLBACK_NAME = "success";
    private static final String TAG = "OMIDJSAdapter";
    private static final String UNSUPPORTED_OMID_API_MESSAGE = "%s | unsupported OMID API";
    private Context mContext;

    public OMIDJSAdapter(Context context) {
        this.mContext = context;
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
    void call(String str, WebController.NativeAPI.JSCallbackTask jSCallbackTask, WebView webView) throws Exception {
        FunctionCall functionCallFetchFunctionCall = fetchFunctionCall(str);
        SSAObj sSAObj = new SSAObj();
        try {
            String str2 = functionCallFetchFunctionCall.name;
            byte b = -1;
            switch (str2.hashCode()) {
                case -1655974669:
                    if (str2.equals(ACTIVATE_FUNCTION_NAME)) {
                        b = 0;
                    }
                    break;
                case -984459207:
                    if (str2.equals(GET_OMID_DATA_FUNCTION_NAME)) {
                        b = 4;
                    }
                    break;
                case 70701699:
                    if (str2.equals(FINISH_SESSION_FUNCTION_NAME)) {
                        b = 2;
                    }
                    break;
                case 1208109646:
                    if (str2.equals(IMPRESSION_OCCURRED_FUNCTION_NAME)) {
                        b = 3;
                    }
                    break;
                case 1850541012:
                    if (str2.equals("startSession")) {
                        b = 1;
                    }
                    break;
            }
            if (b == 0) {
                OMIDManager.activate(this.mContext);
                sSAObj = OMIDManager.getOMIDData();
            } else if (b == 1) {
                OMIDManager.startSession(functionCallFetchFunctionCall.params, webView);
            } else if (b == 2) {
                OMIDManager.finishSession();
            } else if (b == 3) {
                OMIDManager.impressionOccurred();
            } else if (b == 4) {
                sSAObj = OMIDManager.getOMIDData();
            } else {
                throw new IllegalArgumentException(String.format(UNSUPPORTED_OMID_API_MESSAGE, functionCallFetchFunctionCall.name));
            }
            jSCallbackTask.sendMessage(true, functionCallFetchFunctionCall.successCallback, sSAObj);
        } catch (Exception e) {
            sSAObj.put("errMsg", e.getMessage());
            Logger.i(TAG, "OMIDJSAdapter " + functionCallFetchFunctionCall.name + " Exception: " + e.getMessage());
            jSCallbackTask.sendMessage(false, functionCallFetchFunctionCall.failCallback, sSAObj);
        }
    }

    private FunctionCall fetchFunctionCall(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject(str);
        FunctionCall functionCall = new FunctionCall();
        functionCall.name = jSONObject.optString(OMID_FUNCTION_PROPERTY_NAME);
        functionCall.params = jSONObject.optJSONObject(OMID_PARAMS_PROPERTY_NAME);
        functionCall.successCallback = jSONObject.optString("success");
        functionCall.failCallback = jSONObject.optString("fail");
        return functionCall;
    }
}
