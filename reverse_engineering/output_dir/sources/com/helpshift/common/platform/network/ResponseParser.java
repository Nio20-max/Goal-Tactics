package com.helpshift.common.platform.network;

import com.helpshift.auth.dto.WebSocketAuthData;
import com.helpshift.configuration.response.RootServerConfig;
import com.helpshift.conversation.activeconversation.message.AcceptedAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.ConfirmationAcceptedMessageDM;
import com.helpshift.conversation.activeconversation.message.ConfirmationRejectedMessageDM;
import com.helpshift.conversation.activeconversation.message.FollowupAcceptedMessageDM;
import com.helpshift.conversation.activeconversation.message.FollowupRejectedMessageDM;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.UserMessageDM;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForCSATInput;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForOptionInput;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForTextInputDM;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dto.ConversationHistory;
import com.helpshift.conversation.dto.ConversationInbox;
import com.helpshift.conversation.dto.WebSocketMessage;
import com.helpshift.conversation.smartintent.dto.SISearchModelDTO;
import com.helpshift.conversation.smartintent.dto.SITreeDTO;
import com.helpshift.faq.FaqCore;

/* JADX INFO: loaded from: classes2.dex */
public interface ResponseParser {
    AcceptedAppReviewMessageDM parseAcceptedAppReviewMessageDM(String str);

    WebSocketAuthData parseAuthToken(String str);

    MessageDM parseBotControlMessage(String str, boolean z);

    RootServerConfig parseConfigResponse(String str);

    ConfirmationAcceptedMessageDM parseConfirmationAcceptedMessageDM(String str);

    ConfirmationRejectedMessageDM parseConfirmationRejectedMessageDM(String str);

    ConversationHistory parseConversationHistory(String str);

    ConversationInbox parseConversationInbox(String str);

    String parseErrorMessage(String str);

    FollowupAcceptedMessageDM parseFollowupAcceptedMessage(String str);

    FollowupRejectedMessageDM parseFollowupRejectedMessage(String str);

    Conversation parseReadableConversation(String str);

    UserMessageDM parseReadableUserMessage(String str);

    UserResponseMessageForCSATInput parseResponseMessageForCSATInput(String str);

    UserResponseMessageForOptionInput parseResponseMessageForOptionInput(String str);

    UserResponseMessageForTextInputDM parseResponseMessageForTextInput(String str);

    ScreenshotMessageDM parseScreenshotMessageDM(String str);

    FaqCore parseSingleFAQ(String str);

    SISearchModelDTO parseSmartIntentSearchModel(String str);

    SITreeDTO parseSmartIntentTree(String str);

    UserAttachmentMessageDM parseUserAttachmentMessageDM(String str);

    WebSocketMessage parseWebSocketMessage(String str);
}
