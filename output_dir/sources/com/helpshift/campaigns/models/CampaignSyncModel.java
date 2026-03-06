package com.helpshift.campaigns.models;

import com.helpshift.campaigns.util.constants.ModelKeys;
import com.helpshift.util.HSLogger;
import java.io.EOFException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class CampaignSyncModel implements Serializable {
    private static final String TAG = "Helpshift_CampSyncMod";
    private static final long serialVersionUID = 2;
    public String campaignId;
    public String creativeUrl;
    public long expiryTimeStamp;
    private boolean isSyncing;
    public long timeStamp;

    public CampaignSyncModel(String str, String str2, long j, long j2, boolean z) {
        this.expiryTimeStamp = Long.MAX_VALUE;
        this.campaignId = str;
        this.creativeUrl = str2;
        this.timeStamp = j;
        this.expiryTimeStamp = j2;
        this.isSyncing = z;
    }

    public CampaignSyncModel(JSONObject jSONObject) {
        this.expiryTimeStamp = Long.MAX_VALUE;
        try {
            this.campaignId = jSONObject.getString("cid");
            this.creativeUrl = jSONObject.getString("creative-url");
            this.timeStamp = jSONObject.getLong("ts");
            this.expiryTimeStamp = jSONObject.optLong(ModelKeys.KEY_CAMPAIGN_SYNC_MODEL_EXPIRY_TIME, Long.MAX_VALUE);
            this.isSyncing = false;
        } catch (JSONException e) {
            HSLogger.d(TAG, "Exception in initializing model with json object : ", e);
        }
    }

    public boolean isSyncing() {
        return this.isSyncing;
    }

    public void setIsSyncing(boolean z) {
        this.isSyncing = z;
    }

    private void writeObject(ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.defaultWriteObject();
        objectOutputStream.writeUTF(this.campaignId);
        objectOutputStream.writeUTF(this.creativeUrl);
        objectOutputStream.writeLong(this.timeStamp);
        objectOutputStream.writeBoolean(this.isSyncing);
        objectOutputStream.writeLong(this.expiryTimeStamp);
    }

    private void readObject(ObjectInputStream objectInputStream) throws ClassNotFoundException, IOException {
        objectInputStream.defaultReadObject();
        this.campaignId = objectInputStream.readUTF();
        this.creativeUrl = objectInputStream.readUTF();
        this.timeStamp = objectInputStream.readLong();
        this.isSyncing = objectInputStream.readBoolean();
        try {
            this.expiryTimeStamp = objectInputStream.readLong();
        } catch (EOFException unused) {
            this.expiryTimeStamp = Long.MAX_VALUE;
        }
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof CampaignSyncModel)) {
            return false;
        }
        CampaignSyncModel campaignSyncModel = (CampaignSyncModel) obj;
        return this.isSyncing == campaignSyncModel.isSyncing && this.campaignId.equals(campaignSyncModel.campaignId) && this.creativeUrl.equals(campaignSyncModel.creativeUrl) && this.timeStamp == campaignSyncModel.timeStamp && this.expiryTimeStamp == campaignSyncModel.expiryTimeStamp;
    }
}
