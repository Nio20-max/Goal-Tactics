package com.helpshift.conversation.activeconversation.message;

import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.conversation.activeconversation.message.Author;
import com.helpshift.util.ValuePair;
import java.util.HashMap;

/* JADX INFO: loaded from: classes2.dex */
public class RequestAppReviewMessageDM extends MessageDM {
    public boolean isAnswered;
    public boolean isReviewButtonClickable;

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public boolean isUISupportedMessage() {
        return true;
    }

    public RequestAppReviewMessageDM(String str, String str2, String str3, long j, Author author, boolean z) {
        super(str2, str3, j, author, true, MessageType.REQUESTED_APP_REVIEW);
        this.serverId = str;
        this.isAnswered = z;
        this.isReviewButtonClickable = true;
    }

    public RequestAppReviewMessageDM(RequestAppReviewMessageDM requestAppReviewMessageDM) {
        super(requestAppReviewMessageDM);
        this.isAnswered = requestAppReviewMessageDM.isAnswered;
        this.isReviewButtonClickable = requestAppReviewMessageDM.isReviewButtonClickable;
    }

    public void setIsReviewButtonClickable(boolean z) {
        this.isReviewButtonClickable = z;
        notifyUpdated();
    }

    public AcceptedAppReviewMessageDM handleRequestReviewClick(Domain domain, Platform platform) {
        if (this.isAnswered) {
            return null;
        }
        setIsReviewButtonClickable(false);
        ValuePair<String, Long> currentAdjustedTimeForStorage = HSDateFormatSpec.getCurrentAdjustedTimeForStorage(platform);
        AcceptedAppReviewMessageDM acceptedAppReviewMessageDM = new AcceptedAppReviewMessageDM("Accepted review request", currentAdjustedTimeForStorage.first, currentAdjustedTimeForStorage.second.longValue(), new Author("mobile", "", Author.AuthorRole.SYSTEM), this.serverId, 1);
        acceptedAppReviewMessageDM.conversationLocalId = this.conversationLocalId;
        acceptedAppReviewMessageDM.setDependencies(domain, platform);
        platform.getConversationDAO().insertOrUpdateMessage(acceptedAppReviewMessageDM);
        HashMap map = new HashMap();
        map.put("type", "conversation");
        domain.getAnalyticsEventDM().pushEvent(AnalyticsEventType.REVIEWED_APP, map);
        domain.getDelegate().userRepliedToConversation("User reviewed the app");
        return acceptedAppReviewMessageDM;
    }

    public void handleAcceptedReviewSuccess(Platform platform) {
        this.isReviewButtonClickable = false;
        this.isAnswered = true;
        notifyUpdated();
        platform.getConversationDAO().insertOrUpdateMessage(this);
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM
    public void merge(MessageDM messageDM) {
        super.merge(messageDM);
        if (messageDM instanceof RequestAppReviewMessageDM) {
            this.isAnswered = ((RequestAppReviewMessageDM) messageDM).isAnswered;
        }
    }

    @Override // com.helpshift.conversation.activeconversation.message.MessageDM, com.helpshift.util.HSCloneable
    public RequestAppReviewMessageDM deepClone() {
        return new RequestAppReviewMessageDM(this);
    }
}
