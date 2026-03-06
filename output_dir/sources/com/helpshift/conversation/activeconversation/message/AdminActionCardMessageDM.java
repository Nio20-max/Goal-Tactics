package com.helpshift.conversation.activeconversation.message;

import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.common.domain.network.AuthDataProvider;
import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.activeconversation.ConversationServerInfo;
import com.helpshift.conversation.activeconversation.model.Action;
import com.helpshift.conversation.activeconversation.model.ActionCard;
import com.helpshift.conversation.activeconversation.model.ActionType;
import com.helpshift.downloader.AdminFileInfo;
import com.helpshift.downloader.SupportDownloadStateChangeListener;
import com.helpshift.downloader.SupportDownloader;
import com.helpshift.util.FileUtil;
import com.helpshift.util.StringUtils;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public class AdminActionCardMessageDM extends AdminMessageDM {
    private static final int MAX_RETRY_ATTEMPT = 3;
    public ActionCard actionCard;
    public final String originalMessageServerId;
    private int retryAttempts;
    public ActionCardImageState state;

    public enum ActionCardImageState {
        DOWNLOAD_NOT_STARTED,
        IMAGE_DOWNLOADING,
        IMAGE_DOWNLOADED,
        IMAGE_NOT_PRESENT
    }

    public AdminActionCardMessageDM(String str, String str2, String str3, long j, Author author, String str4, ActionCard actionCard) {
        super(str, str2, str3, j, author, MessageType.ADMIN_ACTION_CARD);
        this.actionCard = actionCard;
        this.originalMessageServerId = str4;
        this.retryAttempts = 0;
        updateState();
    }

    public AdminActionCardMessageDM(AdminActionCardMessageDM adminActionCardMessageDM) {
        super(adminActionCardMessageDM);
        this.actionCard = adminActionCardMessageDM.actionCard.deepClone();
        this.state = adminActionCardMessageDM.state;
        this.retryAttempts = adminActionCardMessageDM.retryAttempts;
        this.originalMessageServerId = adminActionCardMessageDM.originalMessageServerId;
    }

    public void setState(ActionCardImageState actionCardImageState) {
        this.state = actionCardImageState;
        notifyUpdated();
    }

    public boolean isActionCardTitleVisible() {
        return StringUtils.isNotEmpty(this.actionCard.title);
    }

    private void updateState() {
        if (StringUtils.isEmpty(this.actionCard.imageUrl)) {
            this.state = ActionCardImageState.IMAGE_NOT_PRESENT;
        } else if (FileUtil.doesFilePathExistAndCanRead(this.actionCard.filePath)) {
            this.state = ActionCardImageState.IMAGE_DOWNLOADED;
        } else {
            this.state = ActionCardImageState.DOWNLOAD_NOT_STARTED;
        }
    }

    public void downloadImage(Platform platform) {
        if (this.retryAttempts != 3 && this.state == ActionCardImageState.DOWNLOAD_NOT_STARTED) {
            this.retryAttempts++;
            downloadImageInternal(platform);
        }
    }

    private void downloadImageInternal(final Platform platform) {
        setState(ActionCardImageState.IMAGE_DOWNLOADING);
        platform.getDownloader().startDownload(new AdminFileInfo(this.actionCard.imageUrl, null, null, this.actionCard.isSecure), SupportDownloader.StorageDirType.INTERNAL_ONLY, new AuthDataProvider(this.domain, platform, this.actionCard.imageUrl), new SupportDownloadStateChangeListener() { // from class: com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM.1
            @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
            public void onProgressChange(String str, int i) {
            }

            @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
            public void onFailure(String str, int i) {
                AdminActionCardMessageDM.this.setState(ActionCardImageState.DOWNLOAD_NOT_STARTED);
                if (NetworkErrorCodes.NOT_RETRIABLE_STATUS_CODES.contains(Integer.valueOf(i))) {
                    return;
                }
                AdminActionCardMessageDM.this.downloadImage(platform);
            }

            @Override // com.helpshift.downloader.SupportDownloadStateChangeListener
            public void onSuccess(String str, String str2, String str3) {
                AdminActionCardMessageDM.this.setState(ActionCardImageState.IMAGE_DOWNLOADED);
                AdminActionCardMessageDM.this.actionCard.filePath = str2;
                platform.getConversationDAO().insertOrUpdateMessage(AdminActionCardMessageDM.this);
            }
        });
    }

    public void handleClick(ConversationServerInfo conversationServerInfo) {
        String str;
        Action action = this.actionCard.action;
        if (action.actionType == ActionType.CALL) {
            str = action.actionData.get("phone_number");
        } else {
            str = action.actionType == ActionType.LINK ? action.actionData.get("url") : "";
        }
        this.domain.getDelegate().userClickOnAction(action.actionType, str);
        HashMap map = new HashMap();
        map.put(AnalyticsEventKey.ISSUE_ID, conversationServerInfo.getIssueId());
        map.put(AnalyticsEventKey.MESSAGE_ID, this.originalMessageServerId);
        map.put("a", action.actionSHA);
        map.put("type", action.actionType.getValue());
        this.domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.ACTION_CARD_CLICKED, map);
    }

    public String getUriAsStringForAction() {
        Action action = this.actionCard.action;
        if (action.actionType != ActionType.CALL) {
            return action.actionType == ActionType.LINK ? action.actionData.get("url") : "";
        }
        return "tel:" + action.actionData.get("phone_number");
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof AdminActionCardMessageDM) {
            this.actionCard = ((AdminActionCardMessageDM) messageDM).actionCard;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.AdminMessageDM, com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public AdminActionCardMessageDM deepClone() {
        return new AdminActionCardMessageDM(this);
    }
}
