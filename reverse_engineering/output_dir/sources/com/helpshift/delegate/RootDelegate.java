package com.helpshift.delegate;

import com.helpshift.HelpshiftUser;
import com.helpshift.conversation.activeconversation.model.ActionType;
import java.io.File;

/* JADX INFO: loaded from: classes2.dex */
public interface RootDelegate {
    void authenticationFailed(HelpshiftUser helpshiftUser, AuthenticationFailureReason authenticationFailureReason);

    void conversationEnded();

    void didReceiveNotification(int i);

    void displayAttachmentFile(File file);

    void newConversationStarted(String str);

    void sessionBegan();

    void sessionEnded();

    void userClickOnAction(ActionType actionType, String str);

    void userCompletedCustomerSatisfactionSurvey(int i, String str);

    void userRepliedToConversation(String str);
}
