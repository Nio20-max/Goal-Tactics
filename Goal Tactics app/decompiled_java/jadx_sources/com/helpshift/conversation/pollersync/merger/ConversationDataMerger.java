package com.helpshift.conversation.pollersync.merger;

import com.helpshift.common.platform.Platform;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.ConversationUtil;
import com.helpshift.conversation.IssueType;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.states.ConversationCSATState;
import com.helpshift.util.HSLogger;
import com.helpshift.util.StringUtils;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationDataMerger {
    private static final String TAG = "HS_PollConvDataMerger";
    private Platform platform;
    private SDKConfigurationDM sdkConfigurationDM;

    public ConversationDataMerger(Platform platform, SDKConfigurationDM sDKConfigurationDM) {
        this.platform = platform;
        this.sdkConfigurationDM = sDKConfigurationDM;
    }

    public void mergeProperties(Conversation conversation, Conversation conversation2) {
        if (canMergeConversationProperties(conversation.issueType, conversation2.issueType)) {
            mergeCommonConversationProperties(conversation, conversation2);
            if (conversation2.isInPreIssueMode()) {
                return;
            }
            mergeIssueUniqueProperties(conversation, conversation2);
        }
    }

    private boolean canMergeConversationProperties(String str, String str2) {
        if (!IssueType.ISSUE.equals(str) || !IssueType.PRE_ISSUE.equals(str2)) {
            return true;
        }
        HSLogger.d(TAG, "Not merging conversation data since remote type is preissue and local type is issue");
        return false;
    }

    private void mergeCommonConversationProperties(Conversation conversation, Conversation conversation2) {
        HSLogger.d(TAG, "Merging conversation properties");
        conversation.preConversationServerId = conversation2.preConversationServerId;
        conversation.serverId = conversation2.serverId;
        conversation.issueType = conversation2.issueType;
        conversation.title = conversation2.title;
        conversation.publishId = conversation2.publishId;
        conversation.createdAt = conversation2.createdAt;
        conversation.epochCreatedAtTime = conversation2.getEpochCreatedAtTime();
        conversation.updatedAt = conversation2.updatedAt;
        conversation.shouldIncrementMessageCount = conversation2.shouldIncrementMessageCount;
        conversation.shouldAllowNewConversationCreation = conversation2.shouldAllowNewConversationCreation;
        conversation.isFeedbackBotEnabled = conversation2.isFeedbackBotEnabled;
        if (conversation2.messageCursor != null) {
            conversation.messageCursor = conversation2.messageCursor;
        }
        if (!StringUtils.isEmpty(conversation2.createdRequestId)) {
            conversation.createdRequestId = conversation2.createdRequestId;
        }
        conversation.state = getIssueStateToUpdate(conversation, conversation2);
    }

    private void mergeIssueUniqueProperties(Conversation conversation, Conversation conversation2) {
        conversation.isRedacted = conversation2.isRedacted;
        conversation.resolutionExpiryAt = conversation2.resolutionExpiryAt;
        conversation.csatExpiryAt = conversation2.csatExpiryAt;
        if (conversation2.csatState == ConversationCSATState.SUBMITTED_SYNCED) {
            conversation.csatState = conversation2.csatState;
        } else if (ConversationUtil.isCSATTimerExpired(this.platform, conversation)) {
            conversation.csatState = ConversationCSATState.EXPIRED;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:33:0x0051  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.helpshift.conversation.dto.IssueState getIssueStateToUpdate(com.helpshift.conversation.activeconversation.model.Conversation r5, com.helpshift.conversation.activeconversation.model.Conversation r6) {
        /*
            r4 = this;
            com.helpshift.conversation.dto.IssueState r5 = r5.state
            com.helpshift.conversation.dto.IssueState r0 = r6.state
            java.lang.String r1 = r6.issueType
            boolean r2 = r6.shouldAllowNewConversationCreation
            if (r2 == 0) goto Ld
            com.helpshift.conversation.dto.IssueState r5 = com.helpshift.conversation.dto.IssueState.CLOSED
            return r5
        Ld:
            boolean r2 = r6.isFeedbackBotEnabled
            java.lang.String r3 = "preissue"
            if (r2 == 0) goto L20
            com.helpshift.conversation.dto.IssueState r5 = com.helpshift.conversation.dto.IssueState.RESOLUTION_REQUESTED
            if (r0 != r5) goto L1f
            boolean r5 = r3.equals(r1)
            if (r5 == 0) goto L1f
            com.helpshift.conversation.dto.IssueState r0 = com.helpshift.conversation.dto.IssueState.RESOLUTION_ACCEPTED
        L1f:
            return r0
        L20:
            com.helpshift.conversation.dto.IssueState r2 = com.helpshift.conversation.dto.IssueState.RESOLUTION_REQUESTED
            if (r0 != r2) goto L52
            boolean r1 = r3.equals(r1)
            if (r1 == 0) goto L2d
            com.helpshift.conversation.dto.IssueState r0 = com.helpshift.conversation.dto.IssueState.RESOLUTION_ACCEPTED
            goto L52
        L2d:
            com.helpshift.conversation.dto.IssueState r1 = com.helpshift.conversation.dto.IssueState.RESOLUTION_ACCEPTED
            if (r5 == r1) goto L51
            com.helpshift.conversation.dto.IssueState r1 = com.helpshift.conversation.dto.IssueState.RESOLUTION_EXPIRED
            if (r5 != r1) goto L36
            goto L51
        L36:
            com.helpshift.common.platform.Platform r1 = r4.platform
            boolean r6 = com.helpshift.conversation.ConversationUtil.isResolutionQuestionExpired(r1, r6)
            if (r6 == 0) goto L41
            com.helpshift.conversation.dto.IssueState r0 = com.helpshift.conversation.dto.IssueState.RESOLUTION_EXPIRED
            goto L52
        L41:
            com.helpshift.conversation.dto.IssueState r6 = com.helpshift.conversation.dto.IssueState.RESOLUTION_REJECTED
            if (r5 != r6) goto L46
            goto L51
        L46:
            com.helpshift.configuration.domainmodel.SDKConfigurationDM r6 = r4.sdkConfigurationDM
            boolean r6 = r6.shouldShowConversationResolutionQuestion()
            if (r6 != 0) goto L52
            com.helpshift.conversation.dto.IssueState r0 = com.helpshift.conversation.dto.IssueState.RESOLUTION_ACCEPTED
            goto L52
        L51:
            r0 = r5
        L52:
            java.lang.StringBuilder r6 = new java.lang.StringBuilder
            r6.<init>()
            java.lang.String r1 = "Updating conversation state from "
            r6.append(r1)
            r6.append(r5)
            java.lang.String r5 = " to: "
            r6.append(r5)
            r6.append(r0)
            java.lang.String r5 = r6.toString()
            java.lang.String r6 = "HS_PollConvDataMerger"
            com.helpshift.util.HSLogger.d(r6, r5)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.conversation.pollersync.merger.ConversationDataMerger.getIssueStateToUpdate(com.helpshift.conversation.activeconversation.model.Conversation, com.helpshift.conversation.activeconversation.model.Conversation):com.helpshift.conversation.dto.IssueState");
    }
}
