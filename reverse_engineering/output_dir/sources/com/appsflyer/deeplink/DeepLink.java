package com.appsflyer.deeplink;

import com.appsflyer.AFInAppEventParameterName;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.helpshift.campaigns.util.constants.ModelKeys;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class DeepLink {
    public final JSONObject valueOf;

    private DeepLink(JSONObject jSONObject) {
        this.valueOf = jSONObject;
    }

    public static DeepLink AFInAppEventParameterName(JSONObject jSONObject) throws JSONException {
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("custom_params");
        if (jSONObjectOptJSONObject != null) {
            jSONObject.remove("custom_params");
            Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                jSONObject.put(next, jSONObjectOptJSONObject.opt(next));
            }
        }
        return new DeepLink(jSONObject);
    }

    public static DeepLink valueOf(Map<String, String> map) throws JSONException {
        Set<String> setKeySet = map.keySet();
        setKeySet.removeAll(Arrays.asList("install_time", "path", "scheme", "host", "pid", ModelKeys.KEY_ACTION_MODEL_ACTION_TEXT_COLOR, "af_prt", "af_mp", "clickid", "af_siteid", "af_sub_siteid", "af_c_id", "af_adset", "af_adset_id", "af_ad", "af_ad_id", "af_ad_type", "af_click_lookback", "af_viewthrough_lookback", AFInAppEventParameterName.AF_CHANNEL, "af_keywords", "af_cost_model", "af_cost_currency", "af_cost_value", "af_r", "af_web_dp", "af_dp", "af_force_deeplink", "af_ref", "is_incentivized", "af_param_forwarding", "is_retargeting", "af_reengagement_window", "is_branded_link", "is_universal_link", "esp_name", "af_generated_clk", FirebaseAnalytics.Param.TRANSACTION_ID, "af_fp_lookback_window", "af_vt_fp_lookback_window", "af_fp_priority", "af_generate_clk", "af_inactivity_window", "af_ol_red", "af_attr", "af_ol_lp", "af_blank_red", "af_source", "af_lp_src", "af_src_browser", "af_tranid", "af_wrt_clk", "af_ua", "af_ip", "af_lang", "advertising_id", "sha1_advertising_id", "md5_advertising_id", "android_id", "sha1_android_id", "md5_android_id", "imei", "sha1_imei", "md5_imei", "oaid", "sha1_oaid", "md5_oaid", "af_android_url", "sha1_el", "fire_advertising_id", "sha1_fire_advertising_id", "idfa", "md5_idfa", "af_ios_url", "af_ios_fallback", "sha1_idfa", "mac", "sha1_mac", "af_banner", "af_slk_web_endpoint", "af_chrome_lp", "af_android_custom_url", "af_ios_custom_url", "af_enc_data", "engmnt_source", "redirect_response_data", "shortlink", "advertiserId", "sha1_advertiserId", "advertiser_id", "sha1_advertiser_id", "muid", "idfv", "md5_idfv", "sha1_idfv", "af_installpostback", "http_referrer", "af_model", "af_os", "md5_advertiserId", "af_video_total_length", "af_video_played_length", "af_playable_played_length", "af_ad_time_viewed", "af_ad_displayed_percent", "af_audio_total_length", "af_audio_played_length", "link", "af_status", "af_web_id", "af_deeplink"));
        HashMap map2 = new HashMap();
        for (String str : setKeySet) {
            map2.put(str, map.get(str));
        }
        return AFInAppEventParameterName(new JSONObject(map2));
    }

    public JSONObject getClickEvent() {
        return this.valueOf;
    }

    public String toString() {
        return this.valueOf.toString();
    }

    public String getStringValue(String str) {
        Object objOpt = this.valueOf.opt(str);
        if (objOpt == JSONObject.NULL) {
            objOpt = null;
        }
        if (objOpt == null) {
            return null;
        }
        return String.valueOf(objOpt);
    }

    public String getDeepLinkValue() {
        Object objOpt = this.valueOf.opt("deep_link_value");
        if (objOpt == JSONObject.NULL) {
            objOpt = null;
        }
        return (String) objOpt;
    }

    public String getMatchType() {
        Object objOpt = this.valueOf.opt("match_type");
        if (objOpt == JSONObject.NULL) {
            objOpt = null;
        }
        return (String) objOpt;
    }

    public String getClickHttpReferrer() {
        Object objOpt = this.valueOf.opt("click_http_referrer");
        if (objOpt == JSONObject.NULL) {
            objOpt = null;
        }
        return (String) objOpt;
    }

    public String getMediaSource() {
        Object objOpt = this.valueOf.opt("media_source");
        if (objOpt == JSONObject.NULL) {
            objOpt = null;
        }
        return (String) objOpt;
    }

    public String getCampaign() {
        Object objOpt = this.valueOf.opt("campaign");
        if (objOpt == JSONObject.NULL) {
            objOpt = null;
        }
        return (String) objOpt;
    }

    public String getCampaignId() {
        Object objOpt = this.valueOf.opt("campaign_id");
        if (objOpt == JSONObject.NULL) {
            objOpt = null;
        }
        return (String) objOpt;
    }

    public String getAfSub1() {
        Object objOpt = this.valueOf.opt("af_sub1");
        if (objOpt == JSONObject.NULL) {
            objOpt = null;
        }
        return (String) objOpt;
    }

    public String getAfSub2() {
        Object objOpt = this.valueOf.opt("af_sub2");
        if (objOpt == JSONObject.NULL) {
            objOpt = null;
        }
        return (String) objOpt;
    }

    public String getAfSub3() {
        Object objOpt = this.valueOf.opt("af_sub3");
        if (objOpt == JSONObject.NULL) {
            objOpt = null;
        }
        return (String) objOpt;
    }

    public String getAfSub4() {
        Object objOpt = this.valueOf.opt("af_sub4");
        if (objOpt == JSONObject.NULL) {
            objOpt = null;
        }
        return (String) objOpt;
    }

    public String getAfSub5() {
        Object objOpt = this.valueOf.opt("af_sub5");
        if (objOpt == JSONObject.NULL) {
            objOpt = null;
        }
        return (String) objOpt;
    }

    public Boolean isDeferred() {
        Object objOpt = this.valueOf.opt("is_deferred");
        if (objOpt == JSONObject.NULL) {
            objOpt = null;
        }
        return (Boolean) objOpt;
    }
}
