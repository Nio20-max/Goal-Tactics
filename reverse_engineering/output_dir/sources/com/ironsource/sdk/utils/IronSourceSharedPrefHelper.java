package com.ironsource.sdk.utils;

import android.content.Context;
import android.content.SharedPreferences;
import android.text.TextUtils;
import com.ironsource.eventsmodule.DataBaseEventsStorage;
import com.ironsource.sdk.constants.Constants;
import com.ironsource.sdk.data.SSAEnums;
import com.ironsource.sdk.data.SSAObj;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class IronSourceSharedPrefHelper {
    private static final String BACK_BUTTON_STATE = "back_button_state";
    private static final String SEARCH_KEYS = "search_keys";
    private static final String SUPERSONIC_SHARED_PREF = "supersonic_shared_preferen";
    private static final String VERSION = "version";
    private static IronSourceSharedPrefHelper mInstance;
    private SharedPreferences mSharedPreferences;

    private IronSourceSharedPrefHelper(Context context) {
        this.mSharedPreferences = context.getSharedPreferences(SUPERSONIC_SHARED_PREF, 0);
    }

    public static synchronized IronSourceSharedPrefHelper getSupersonicPrefHelper(Context context) {
        if (mInstance == null) {
            mInstance = new IronSourceSharedPrefHelper(context);
        }
        return mInstance;
    }

    public static synchronized IronSourceSharedPrefHelper getSupersonicPrefHelper() {
        return mInstance;
    }

    public void setBackButtonState(String str) {
        SharedPreferences.Editor editorEdit = this.mSharedPreferences.edit();
        editorEdit.putString(BACK_BUTTON_STATE, str);
        editorEdit.apply();
    }

    public SSAEnums.BackButtonState getBackButtonState() {
        int i = Integer.parseInt(this.mSharedPreferences.getString(BACK_BUTTON_STATE, "2"));
        if (i == 0) {
            return SSAEnums.BackButtonState.None;
        }
        if (i == 1) {
            return SSAEnums.BackButtonState.Device;
        }
        if (i == 2) {
            return SSAEnums.BackButtonState.Controller;
        }
        return SSAEnums.BackButtonState.Controller;
    }

    public void setSearchKeys(String str) {
        SharedPreferences.Editor editorEdit = this.mSharedPreferences.edit();
        editorEdit.putString(SEARCH_KEYS, str);
        editorEdit.apply();
    }

    public List<String> getSearchKeys() {
        String string = this.mSharedPreferences.getString(SEARCH_KEYS, null);
        ArrayList arrayList = new ArrayList();
        if (string != null) {
            SSAObj sSAObj = new SSAObj(string);
            if (sSAObj.containsKey(Constants.ParametersKeys.SEARCH_KEYS)) {
                try {
                    arrayList.addAll(sSAObj.toList((JSONArray) sSAObj.get(Constants.ParametersKeys.SEARCH_KEYS)));
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }
        return arrayList;
    }

    public boolean setUserData(String str, String str2) {
        SharedPreferences.Editor editorEdit = this.mSharedPreferences.edit();
        editorEdit.putString(str, str2);
        return editorEdit.commit();
    }

    public String getUserData(String str) {
        String string = this.mSharedPreferences.getString(str, null);
        return string != null ? string : "{}";
    }

    public String getCurrentSDKVersion() {
        return this.mSharedPreferences.getString("version", "UN_VERSIONED");
    }

    public void setCurrentSDKVersion(String str) {
        SharedPreferences.Editor editorEdit = this.mSharedPreferences.edit();
        editorEdit.putString("version", str);
        editorEdit.apply();
    }

    public String getCampaignLastUpdate(String str) {
        return this.mSharedPreferences.getString(str, null);
    }

    public void setCampaignLastUpdate(String str, String str2) {
        SharedPreferences.Editor editorEdit = this.mSharedPreferences.edit();
        editorEdit.putString(str, str2);
        editorEdit.apply();
    }

    public boolean setLatestCompletionsTime(String str, String str2, String str3) {
        String string = this.mSharedPreferences.getString("ssaUserData", null);
        if (!TextUtils.isEmpty(string)) {
            try {
                JSONObject jSONObject = new JSONObject(string);
                if (!jSONObject.isNull(str2)) {
                    JSONObject jSONObject2 = jSONObject.getJSONObject(str2);
                    if (!jSONObject2.isNull(str3)) {
                        jSONObject2.getJSONObject(str3).put(DataBaseEventsStorage.EventEntry.COLUMN_NAME_TIMESTAMP, str);
                        SharedPreferences.Editor editorEdit = this.mSharedPreferences.edit();
                        editorEdit.putString("ssaUserData", jSONObject.toString());
                        return editorEdit.commit();
                    }
                }
            } catch (JSONException e) {
                new IronSourceAsyncHttpRequestTask().execute(Constants.NATIVE_EXCEPTION_BASE_URL + e.getStackTrace()[0].getMethodName());
            }
        }
        return false;
    }
}
