package com.ironsource.mediationsdk.impressionData;

import com.facebook.appevents.UserDataStore;
import com.ironsource.mediationsdk.logger.IronLog;
import com.ironsource.mediationsdk.utils.IronSourceConstants;
import com.ironsource.sdk.constants.Constants;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class ImpressionData {
    private String ab;
    private String adNetwork;
    private String adUnit;
    private JSONObject allData;
    private String auctionId;
    private String country;
    private String encryptedCPM;
    private String instanceId;
    private String instanceName;
    private Double lifetimeRevenue;
    private String placement;
    private String precision;
    private Double revenue;
    private String segmentName;
    private final String IMPRESSION_DATA_KEY_AUCTION_ID = "auctionId";
    private final String IMPRESSION_DATA_KEY_AD_UNIT = "adUnit";
    private final String IMPRESSION_DATA_KEY_COUNTRY = UserDataStore.COUNTRY;
    private final String IMPRESSION_DATA_KEY_ABTEST = "ab";
    private final String IMPRESSION_DATA_KEY_SEGMENT_NAME = "segmentName";
    private final String IMPRESSION_DATA_KEY_PLACEMENT = IronSourceConstants.EVENTS_PLACEMENT_NAME;
    private final String IMPRESSION_DATA_KEY_AD_NETWORK = "adNetwork";
    private final String IMPRESSION_DATA_KEY_INSTANCE_NAME = Constants.CONVERT_INSTANCE_NAME;
    private final String IMPRESSION_DATA_KEY_INSTANCE_ID = Constants.CONVERT_INSTANCE_ID;
    private final String IMPRESSION_DATA_KEY_REVENUE = "revenue";
    private final String IMPRESSION_DATA_KEY_PRECISION = "precision";
    private final String IMPRESSION_DATA_KEY_LIFETIME_REVENUE = "lifetimeRevenue";
    private final String IMPRESSION_DATA_KEY_ENCRYPTED_CPM = "encryptedCPM";

    public ImpressionData(JSONObject jSONObject) {
        Double dValueOf = null;
        this.auctionId = null;
        this.adUnit = null;
        this.country = null;
        this.ab = null;
        this.segmentName = null;
        this.placement = null;
        this.adNetwork = null;
        this.instanceName = null;
        this.instanceId = null;
        this.revenue = null;
        this.precision = null;
        this.lifetimeRevenue = null;
        this.encryptedCPM = null;
        if (jSONObject != null) {
            try {
                this.allData = jSONObject;
                this.auctionId = jSONObject.optString("auctionId", null);
                this.adUnit = jSONObject.optString("adUnit", null);
                this.country = jSONObject.optString(UserDataStore.COUNTRY, null);
                this.ab = jSONObject.optString("ab", null);
                this.segmentName = jSONObject.optString("segmentName", null);
                this.placement = jSONObject.optString(IronSourceConstants.EVENTS_PLACEMENT_NAME, null);
                this.adNetwork = jSONObject.optString("adNetwork", null);
                this.instanceName = jSONObject.optString(Constants.CONVERT_INSTANCE_NAME, null);
                this.instanceId = jSONObject.optString(Constants.CONVERT_INSTANCE_ID, null);
                this.precision = jSONObject.optString("precision", null);
                this.encryptedCPM = jSONObject.optString("encryptedCPM", null);
                double dOptDouble = jSONObject.optDouble("lifetimeRevenue");
                this.lifetimeRevenue = Double.isNaN(dOptDouble) ? null : Double.valueOf(dOptDouble);
                double dOptDouble2 = jSONObject.optDouble("revenue");
                if (!Double.isNaN(dOptDouble2)) {
                    dValueOf = Double.valueOf(dOptDouble2);
                }
                this.revenue = dValueOf;
            } catch (Exception e) {
                IronLog.INTERNAL.error("error parsing impression " + e.getMessage());
            }
        }
    }

    public void replaceMacroForPlacementWithValue(String str, String str2) {
        String str3 = this.placement;
        if (str3 != null) {
            String strReplace = str3.replace(str, str2);
            this.placement = strReplace;
            JSONObject jSONObject = this.allData;
            if (jSONObject != null) {
                try {
                    jSONObject.put(IronSourceConstants.EVENTS_PLACEMENT_NAME, strReplace);
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public String toString() {
        return "ImpressionData{auctionId='" + this.auctionId + "', adUnit='" + this.adUnit + "', country='" + this.country + "', ab='" + this.ab + "', segmentName='" + this.segmentName + "', placement='" + this.placement + "', adNetwork='" + this.adNetwork + "', instanceName='" + this.instanceName + "', instanceId='" + this.instanceId + "', revenue=" + this.revenue + ", precision='" + this.precision + "', lifetimeRevenue=" + this.lifetimeRevenue + ", encryptedCPM='" + this.encryptedCPM + "'}";
    }

    public String getAuctionId() {
        return this.auctionId;
    }

    public String getAdUnit() {
        return this.adUnit;
    }

    public String getCountry() {
        return this.country;
    }

    public String getAb() {
        return this.ab;
    }

    public String getSegmentName() {
        return this.segmentName;
    }

    public String getPlacement() {
        return this.placement;
    }

    public String getAdNetwork() {
        return this.adNetwork;
    }

    public String getInstanceName() {
        return this.instanceName;
    }

    public String getInstanceId() {
        return this.instanceId;
    }

    public Double getRevenue() {
        return this.revenue;
    }

    public String getPrecision() {
        return this.precision;
    }

    public Double getLifetimeRevenue() {
        return this.lifetimeRevenue;
    }

    public String getEncryptedCPM() {
        return this.encryptedCPM;
    }

    public JSONObject getAllData() {
        return this.allData;
    }
}
