package com.helpshift.campaigns.models;

import android.app.Activity;
import android.graphics.Bitmap;
import android.text.TextUtils;
import com.helpshift.R;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.models.AnalyticsEvent;
import com.helpshift.campaigns.models.InboxMessage;
import com.helpshift.campaigns.util.constants.ModelKeys;
import com.helpshift.enums.ACTION_TYPE;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.ImageUtil;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class CampaignDetailModel implements InboxMessage {
    private static final String TAG = "Helpshift_CampDetailMod";
    public List<ActionModel> actions;
    private String backgroundColor;
    private String body;
    private String bodyColor;
    public String coverImageFilePath;
    public String coverImageUrl;
    private long createdAt;
    private long expiryTimeStamp;
    public String iconImageFilePath;
    public String iconImageUrl;
    private String identifier;
    public List<String> messages;
    private boolean readStatus;
    private boolean seenStatus;
    private String title;
    private String titleColor;
    public String userIdentifier;

    public CampaignDetailModel(String str, JSONObject jSONObject, long j, long j2) {
        try {
            this.identifier = str;
            this.createdAt = j;
            this.expiryTimeStamp = j2;
            this.userIdentifier = ControllerFactory.getInstance().userController.getCurrentUser().identifier;
            this.title = jSONObject.getString("t");
            this.body = jSONObject.getString(ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_BODY);
            this.coverImageUrl = jSONObject.optString(ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_COVER_IMAGE_URL, "");
            this.iconImageUrl = jSONObject.optString(ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_ICON_IMAGE_URL, "");
            JSONObject jSONObject2 = jSONObject.getJSONObject(ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_STYLE_SHEET);
            this.backgroundColor = jSONObject2.getString(ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_BG_COLOR);
            this.titleColor = jSONObject2.getString(ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_TITLE_COLOR);
            this.bodyColor = jSONObject2.getString(ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_BODY_COLOR);
            ArrayList arrayList = new ArrayList();
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray(ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_ACTIONS);
            for (int i = 0; i < jSONArrayOptJSONArray.length(); i++) {
                arrayList.add(new ActionModel(jSONArrayOptJSONArray.getJSONObject(i)));
            }
            this.actions = arrayList;
        } catch (JSONException e) {
            HSLogger.d(TAG, "Exception while creating Campaign Detail Object : ", e);
        }
    }

    public CampaignDetailModel(String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, String str10, String str11, boolean z, boolean z2, long j, long j2, List<ActionModel> list, List<String> list2) {
        this.identifier = str;
        this.userIdentifier = str2;
        this.title = str3;
        this.body = str4;
        this.coverImageUrl = str5;
        this.coverImageFilePath = str6;
        this.iconImageUrl = str7;
        this.iconImageFilePath = str8;
        this.backgroundColor = str9;
        this.titleColor = str10;
        this.bodyColor = str11;
        this.readStatus = z;
        this.seenStatus = z2;
        this.actions = list;
        this.messages = list2;
        this.createdAt = j;
        this.expiryTimeStamp = j2;
    }

    public boolean isExpired() {
        return this.expiryTimeStamp != Long.MAX_VALUE && System.currentTimeMillis() / 1000 > this.expiryTimeStamp;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public String getIdentifier() {
        return this.identifier;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public Bitmap getCoverImage() {
        Bitmap bitmap = ImageUtil.getBitmap(this.coverImageFilePath, -1);
        if (bitmap == null && !TextUtils.isEmpty(this.coverImageUrl)) {
            if (this.coverImageFilePath != null) {
                File file = new File(this.coverImageFilePath);
                if (file.exists()) {
                    file.delete();
                }
            }
            ControllerFactory.getInstance().inboxSyncController.startCoverImageDownload(this.coverImageUrl, this.identifier);
        }
        return bitmap;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public Bitmap getIconImage() {
        Bitmap bitmap = ImageUtil.getBitmap(this.iconImageFilePath, -1);
        if (bitmap == null) {
            bitmap = ImageUtil.getBitmap(HelpshiftContext.getApplicationContext().getResources(), R.drawable.hs__cam_inbox_default_icon, -1);
            if (!TextUtils.isEmpty(this.iconImageUrl)) {
                if (this.iconImageFilePath != null) {
                    File file = new File(this.iconImageFilePath);
                    if (file.exists()) {
                        file.delete();
                    }
                }
                ControllerFactory.getInstance().inboxSyncController.startIconImageDownload(this.iconImageUrl, this.identifier);
            }
        }
        return bitmap;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public String getTitle() {
        return this.title;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public String getTitleColor() {
        return this.titleColor;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public String getBody() {
        return this.body;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public String getBodyColor() {
        return this.bodyColor;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public String getBackgroundColor() {
        return this.backgroundColor;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public long getCreatedAt() {
        return this.createdAt;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public long getExpiryTimeStamp() {
        return this.expiryTimeStamp;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public boolean getReadStatus() {
        return this.readStatus;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public boolean getSeenStatus() {
        return this.seenStatus;
    }

    public void setSeenStatus(boolean z) {
        this.seenStatus = z;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public int getCountOfActions() {
        List<ActionModel> list = this.actions;
        if (list != null) {
            return list.size();
        }
        return 0;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public String getActionTitle(int i) {
        List<ActionModel> list = this.actions;
        if (list == null || i < 0 || i >= list.size()) {
            return null;
        }
        return this.actions.get(i).title;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public String getActionTitleColor(int i) {
        List<ActionModel> list = this.actions;
        if (list == null || i < 0 || i >= list.size()) {
            return null;
        }
        return this.actions.get(i).textColor;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public boolean isActionGoalCompletion(int i) {
        List<ActionModel> list = this.actions;
        if (list == null || i < 0 || i >= list.size()) {
            return false;
        }
        return this.actions.get(i).isGoalCompletion;
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public void executeAction(int i, Activity activity) {
        List<ActionModel> list = this.actions;
        if (list == null || i < 0 || i >= list.size()) {
            return;
        }
        ActionModel actionModel = this.actions.get(i);
        actionModel.executeAction(activity);
        ControllerFactory.getInstance().analyticsEventController.recordAnalyticsEvent(AnalyticsEvent.AnalyticsEventType.BUTTON_EVENTS[i], getIdentifier(), Boolean.valueOf(actionModel.isGoalCompletion));
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public InboxMessage.INBOX_MESSAGE_ACTION_TYPE getActionType(int i) {
        List<ActionModel> list = this.actions;
        if (list != null && i >= 0 && i < list.size()) {
            switch (AnonymousClass1.$SwitchMap$com$helpshift$enums$ACTION_TYPE[this.actions.get(i).actionType.ordinal()]) {
                case 1:
                    return InboxMessage.INBOX_MESSAGE_ACTION_TYPE.OPEN_DEEP_LINK;
                case 2:
                    return InboxMessage.INBOX_MESSAGE_ACTION_TYPE.SHOW_FAQS;
                case 3:
                    return InboxMessage.INBOX_MESSAGE_ACTION_TYPE.SHOW_FAQ_SECTION;
                case 4:
                    return InboxMessage.INBOX_MESSAGE_ACTION_TYPE.SHOW_CONVERSATION;
                case 5:
                    return InboxMessage.INBOX_MESSAGE_ACTION_TYPE.SHOW_SINGLE_FAQ;
                case 6:
                    return InboxMessage.INBOX_MESSAGE_ACTION_TYPE.SHOW_ALERT_TO_RATE_APP;
                default:
                    return InboxMessage.INBOX_MESSAGE_ACTION_TYPE.UNKNOWN;
            }
        }
        return InboxMessage.INBOX_MESSAGE_ACTION_TYPE.UNKNOWN;
    }

    /* JADX INFO: renamed from: com.helpshift.campaigns.models.CampaignDetailModel$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$enums$ACTION_TYPE;

        static {
            int[] iArr = new int[ACTION_TYPE.values().length];
            $SwitchMap$com$helpshift$enums$ACTION_TYPE = iArr;
            try {
                iArr[ACTION_TYPE.OPEN_DEEP_LINK.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$enums$ACTION_TYPE[ACTION_TYPE.SHOW_FAQS.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$enums$ACTION_TYPE[ACTION_TYPE.SHOW_FAQ_SECTION.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$enums$ACTION_TYPE[ACTION_TYPE.SHOW_CONVERSATION.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$helpshift$enums$ACTION_TYPE[ACTION_TYPE.SHOW_SINGLE_FAQ.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$helpshift$enums$ACTION_TYPE[ACTION_TYPE.SHOW_ALERT_TO_RATE_APP.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
        }
    }

    @Override // com.helpshift.campaigns.models.InboxMessage
    public String getActionData(int i) {
        List<ActionModel> list = this.actions;
        if (list == null || i < 0 || i >= list.size()) {
            return null;
        }
        return this.actions.get(i).actionData;
    }

    public void setReadStatus(boolean z) {
        this.readStatus = z;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof CampaignDetailModel)) {
            return false;
        }
        CampaignDetailModel campaignDetailModel = (CampaignDetailModel) obj;
        boolean z = this.identifier.equals(campaignDetailModel.identifier) && this.userIdentifier.equals(campaignDetailModel.userIdentifier) && this.title.equals(campaignDetailModel.title) && this.body.equals(campaignDetailModel.body) && this.iconImageUrl.equals(campaignDetailModel.iconImageUrl) && this.backgroundColor.equals(campaignDetailModel.backgroundColor) && this.titleColor.equals(campaignDetailModel.titleColor) && this.bodyColor.equals(campaignDetailModel.bodyColor) && this.readStatus == campaignDetailModel.readStatus && this.seenStatus == campaignDetailModel.seenStatus && this.createdAt == campaignDetailModel.createdAt && this.expiryTimeStamp == campaignDetailModel.expiryTimeStamp;
        String str = this.iconImageFilePath;
        boolean z2 = str == null ? z && campaignDetailModel.iconImageFilePath == null : z && str.equals(campaignDetailModel.iconImageFilePath);
        String str2 = this.coverImageUrl;
        boolean z3 = str2 == null ? z2 && campaignDetailModel.coverImageUrl == null : z2 && str2.equals(campaignDetailModel.coverImageUrl);
        String str3 = this.coverImageFilePath;
        boolean z4 = str3 == null ? z3 && campaignDetailModel.coverImageFilePath == null : z3 && str3.equals(campaignDetailModel.coverImageFilePath);
        List<ActionModel> list = this.actions;
        boolean z5 = list == null ? z4 && campaignDetailModel.actions == null : z4 && list.equals(campaignDetailModel.actions);
        List<String> list2 = this.messages;
        if (list2 != null) {
            if (!z5 || !list2.equals(campaignDetailModel.messages)) {
                return false;
            }
        } else if (!z5 || campaignDetailModel.messages != null) {
            return false;
        }
        return true;
    }
}
