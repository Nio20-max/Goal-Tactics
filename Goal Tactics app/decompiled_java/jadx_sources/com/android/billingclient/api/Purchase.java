package com.android.billingclient.api;

import android.text.TextUtils;
import com.google.firebase.analytics.FirebaseAnalytics;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
/* JADX INFO: loaded from: classes.dex */
public class Purchase {
    private final String zza;
    private final String zzb;
    private final JSONObject zzc;

    /* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
    @Retention(RetentionPolicy.SOURCE)
    public @interface PurchaseState {
        public static final int PENDING = 2;
        public static final int PURCHASED = 1;
        public static final int UNSPECIFIED_STATE = 0;
    }

    /* JADX INFO: compiled from: com.android.billingclient:billing@@4.0.0 */
    public static class PurchasesResult {
        private final List<Purchase> zza;
        private final BillingResult zzb;

        public PurchasesResult(BillingResult billingResult, List<Purchase> list) {
            this.zza = list;
            this.zzb = billingResult;
        }

        public BillingResult getBillingResult() {
            return this.zzb;
        }

        public List<Purchase> getPurchasesList() {
            return this.zza;
        }

        public int getResponseCode() {
            return getBillingResult().getResponseCode();
        }
    }

    public Purchase(String str, String str2) throws JSONException {
        this.zza = str;
        this.zzb = str2;
        this.zzc = new JSONObject(str);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Purchase)) {
            return false;
        }
        Purchase purchase = (Purchase) obj;
        return TextUtils.equals(this.zza, purchase.getOriginalJson()) && TextUtils.equals(this.zzb, purchase.getSignature());
    }

    public AccountIdentifiers getAccountIdentifiers() {
        String strOptString = this.zzc.optString("obfuscatedAccountId");
        String strOptString2 = this.zzc.optString("obfuscatedProfileId");
        if (strOptString == null && strOptString2 == null) {
            return null;
        }
        return new AccountIdentifiers(strOptString, strOptString2);
    }

    public String getDeveloperPayload() {
        return this.zzc.optString("developerPayload");
    }

    public String getOrderId() {
        return this.zzc.optString("orderId");
    }

    public String getOriginalJson() {
        return this.zza;
    }

    public String getPackageName() {
        return this.zzc.optString("packageName");
    }

    public int getPurchaseState() {
        return this.zzc.optInt("purchaseState", 1) != 4 ? 1 : 2;
    }

    public long getPurchaseTime() {
        return this.zzc.optLong("purchaseTime");
    }

    public String getPurchaseToken() {
        JSONObject jSONObject = this.zzc;
        return jSONObject.optString("token", jSONObject.optString("purchaseToken"));
    }

    public int getQuantity() {
        return this.zzc.optInt(FirebaseAnalytics.Param.QUANTITY, 1);
    }

    public String getSignature() {
        return this.zzb;
    }

    public ArrayList<String> getSkus() {
        ArrayList<String> arrayList = new ArrayList<>();
        if (this.zzc.has("productIds")) {
            JSONArray jSONArrayOptJSONArray = this.zzc.optJSONArray("productIds");
            if (jSONArrayOptJSONArray != null) {
                for (int i = 0; i < jSONArrayOptJSONArray.length(); i++) {
                    arrayList.add(jSONArrayOptJSONArray.optString(i));
                }
            }
        } else if (this.zzc.has("productId")) {
            arrayList.add(this.zzc.optString("productId"));
        }
        return arrayList;
    }

    public int hashCode() {
        return this.zza.hashCode();
    }

    public boolean isAcknowledged() {
        return this.zzc.optBoolean("acknowledged", true);
    }

    public boolean isAutoRenewing() {
        return this.zzc.optBoolean("autoRenewing");
    }

    public String toString() {
        String strValueOf = String.valueOf(this.zza);
        return strValueOf.length() != 0 ? "Purchase. Json: ".concat(strValueOf) : new String("Purchase. Json: ");
    }
}
