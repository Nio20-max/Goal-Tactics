package com.helpshift.campaigns.models;

import android.text.TextUtils;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.util.constants.ModelKeys;
import com.helpshift.db.legacy_profile.tables.ProfileTable;
import com.helpshift.model.InfoModelFactory;
import java.io.EOFException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public class AnalyticsEvent implements Serializable {
    private static final long serialVersionUID = 8930869772164604416L;
    public String campaignId;
    public String eventId;
    public Boolean goalCompletion;
    public Long timeStamp;
    public Integer type;
    public String userId;

    public static class AnalyticsEventType {
        public static final Integer DEFAULT = 0;
        public static final Integer DELIVERY = 1;
        public static final Integer VIEW = 2;
        public static final Integer MARK_AS_READ = 5;
        public static final Integer MARK_AS_DELETE = 6;
        public static final Integer DELETE_EXPIRED_MESSAGE = 8;
        static final Integer[] BUTTON_EVENTS = {201, 202, 203, 204};
    }

    public AnalyticsEvent(Integer num, String str, Boolean bool) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        this.eventId = "__hs_ae_" + str + "_" + jCurrentTimeMillis;
        this.campaignId = str;
        this.timeStamp = Long.valueOf(jCurrentTimeMillis);
        this.userId = ControllerFactory.getInstance().userController.getCurrentUser().identifier;
        this.type = num;
        this.goalCompletion = bool;
    }

    public HashMap toData() {
        HashMap map = new HashMap();
        String changeSetId = InfoModelFactory.getInstance().sdkInfoModel.getChangeSetId(this.campaignId);
        if (TextUtils.isEmpty(changeSetId)) {
            changeSetId = this.campaignId;
        }
        map.put("cid", changeSetId);
        map.put(ProfileTable.Columns.COLUMN_UID, this.userId);
        map.put("ts", this.timeStamp);
        map.put("t", this.type);
        map.put(ModelKeys.KEY_ACTION_MODEL_GOAL_COMPLETION, this.goalCompletion);
        map.put("v", 1);
        return map;
    }

    private void writeObject(ObjectOutputStream objectOutputStream) throws IOException {
        objectOutputStream.defaultWriteObject();
        objectOutputStream.writeUTF(this.eventId);
        objectOutputStream.writeUTF(this.campaignId);
        objectOutputStream.writeLong(this.timeStamp.longValue());
        objectOutputStream.writeUTF(this.userId);
        objectOutputStream.writeInt(this.type.intValue());
        objectOutputStream.writeBoolean(this.goalCompletion.booleanValue());
    }

    private void readObject(ObjectInputStream objectInputStream) throws ClassNotFoundException, IOException {
        objectInputStream.defaultReadObject();
        this.eventId = objectInputStream.readUTF();
        this.campaignId = objectInputStream.readUTF();
        this.timeStamp = Long.valueOf(objectInputStream.readLong());
        this.userId = objectInputStream.readUTF();
        this.type = Integer.valueOf(objectInputStream.readInt());
        try {
            this.goalCompletion = Boolean.valueOf(objectInputStream.readBoolean());
        } catch (EOFException unused) {
            this.goalCompletion = false;
        }
    }
}
