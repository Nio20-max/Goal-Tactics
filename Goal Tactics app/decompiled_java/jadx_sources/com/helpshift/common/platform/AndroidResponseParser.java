package com.helpshift.common.platform;

import androidx.core.app.NotificationCompat;
import com.facebook.internal.ServerProtocol;
import com.facebook.login.LoginLogger;
import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.auth.dto.WebSocketAuthData;
import com.helpshift.campaigns.util.constants.DeviceProperties;
import com.helpshift.campaigns.util.constants.ModelKeys;
import com.helpshift.common.exception.ParseException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.network.ResponseParser;
import com.helpshift.common.util.HSDateFormatSpec;
import com.helpshift.configuration.response.AvatarConfig;
import com.helpshift.configuration.response.PeriodicReview;
import com.helpshift.configuration.response.RootServerConfig;
import com.helpshift.conversation.IssueType;
import com.helpshift.conversation.activeconversation.message.AcceptedAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminBotControlMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminCSATMessageWithOptions;
import com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminMessageWithOptionInputDM;
import com.helpshift.conversation.activeconversation.message.AdminMessageWithTextInputDM;
import com.helpshift.conversation.activeconversation.message.AdminResolutionMessageWithOptions;
import com.helpshift.conversation.activeconversation.message.Author;
import com.helpshift.conversation.activeconversation.message.ConfirmationAcceptedMessageDM;
import com.helpshift.conversation.activeconversation.message.ConfirmationRejectedMessageDM;
import com.helpshift.conversation.activeconversation.message.FAQListMessageDM;
import com.helpshift.conversation.activeconversation.message.FAQListMessageWithOptionInputDM;
import com.helpshift.conversation.activeconversation.message.FollowupAcceptedMessageDM;
import com.helpshift.conversation.activeconversation.message.FollowupRejectedMessageDM;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.MessageType;
import com.helpshift.conversation.activeconversation.message.RequestAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestForReopenMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.UnsupportedAdminMessageWithInputDM;
import com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.UserBotControlMessageDM;
import com.helpshift.conversation.activeconversation.message.UserMessageDM;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForCSATInput;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForOptionInput;
import com.helpshift.conversation.activeconversation.message.UserResponseMessageForTextInputDM;
import com.helpshift.conversation.activeconversation.message.UserSmartIntentMessageDM;
import com.helpshift.conversation.activeconversation.message.input.CSATRatingsInput;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import com.helpshift.conversation.activeconversation.model.Action;
import com.helpshift.conversation.activeconversation.model.ActionCard;
import com.helpshift.conversation.activeconversation.model.ActionType;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.dto.ConversationHistory;
import com.helpshift.conversation.dto.ConversationInbox;
import com.helpshift.conversation.dto.IssueState;
import com.helpshift.conversation.dto.WSPingMessage;
import com.helpshift.conversation.dto.WSTypingActionMessage;
import com.helpshift.conversation.dto.WebSocketMessage;
import com.helpshift.conversation.smartintent.dto.SISearchModelDTO;
import com.helpshift.conversation.smartintent.dto.SITreeDTO;
import com.helpshift.conversation.smartintent.dto.SmartIntentDTO;
import com.helpshift.conversation.states.ConversationCSATState;
import com.helpshift.db.conversation.tables.ActionCardTable;
import com.helpshift.db.conversation.tables.ConversationTable;
import com.helpshift.db.conversation.tables.MessagesTable;
import com.helpshift.db.smartintents.tables.SmartIntentModelsTable;
import com.helpshift.db.smartintents.tables.SmartIntentTreeTable;
import com.helpshift.db.user.tables.UserTable;
import com.helpshift.faq.FaqCore;
import com.helpshift.logger.constants.LogLevel;
import com.helpshift.util.HSJSONUtils;
import com.helpshift.util.HSLogger;
import com.ironsource.sdk.constants.Events;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
class AndroidResponseParser implements ResponseParser {
    private static final int AVATAR_IMAGE_CACHE_DEFAULT_INTERVAL = 14400000;
    private static final int OPTIONS_MAX_LIMIT = 500;
    private static final long SMART_INTENT_CLIENT_CACHE_DEFAULT_INTERVAL = 259200000;
    private static final long SMART_INTENT_REFRESH_DEFAULT_INTERVAL = 600000;
    private static final String TAG = "Helpshift_AResponseParser";

    AndroidResponseParser() {
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public UserMessageDM parseReadableUserMessage(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString("created_at");
            UserMessageDM userMessageDM = new UserMessageDM(jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), true));
            userMessageDM.serverId = jSONObject.getString("id");
            userMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            userMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
            parseAndSetDataForUserSentMessages(userMessageDM, jSONObject);
            parseIsFeedbackMessage(userMessageDM, jSONObject);
            return userMessageDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading user text message");
        }
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    @Override // com.helpshift.common.platform.network.ResponseParser
    public UserResponseMessageForTextInputDM parseResponseMessageForTextInput(String str) {
        boolean z;
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString("type");
            byte b = -1;
            int i = 3;
            switch (string.hashCode()) {
                case -831290677:
                    if (string.equals("rsp_txt_msg_with_email_input")) {
                        b = 2;
                    }
                    break;
                case -94670724:
                    if (string.equals("rsp_txt_msg_with_numeric_input")) {
                        b = 3;
                    }
                    break;
                case 493654943:
                    if (string.equals("rsp_txt_msg_with_txt_input")) {
                        b = 1;
                    }
                    break;
                case 919037346:
                    if (string.equals("rsp_empty_msg_with_txt_input")) {
                        b = 0;
                    }
                    break;
                case 2071762039:
                    if (string.equals("rsp_txt_msg_with_dt_input")) {
                        b = 4;
                    }
                    break;
            }
            if (b != 0) {
                if (b == 1) {
                    i = 1;
                } else if (b == 2) {
                    i = 2;
                } else if (b != 3) {
                    if (b != 4) {
                        return null;
                    }
                    i = 4;
                }
                z = false;
            } else {
                i = 1;
                z = true;
            }
            boolean z2 = !z && jSONObject.getBoolean(LoginLogger.EVENT_PARAM_METHOD_RESULT_SKIPPED);
            JSONObject jSONObject2 = jSONObject.getJSONObject("meta");
            String string2 = jSONObject.getString("created_at");
            UserResponseMessageForTextInputDM userResponseMessageForTextInputDM = new UserResponseMessageForTextInputDM(jSONObject.getString("body"), string2, HSDateFormatSpec.convertToEpochTime(string2), parseMessageAuthor(jSONObject.getJSONObject("author"), true), i, jSONObject.getJSONObject("chatbot_info").toString(), z2, jSONObject2.getString("refers"), z);
            if (i == 4 && !z2) {
                userResponseMessageForTextInputDM.dateInMillis = jSONObject2.getLong("dt");
                userResponseMessageForTextInputDM.timeZoneId = jSONObject2.optString("timezone");
            }
            userResponseMessageForTextInputDM.serverId = jSONObject.getString("id");
            userResponseMessageForTextInputDM.isRedacted = jSONObject.optBoolean("redacted", false);
            parseAndSetDataForUserSentMessages(userResponseMessageForTextInputDM, jSONObject);
            parseIsFeedbackMessage(userResponseMessageForTextInputDM, jSONObject);
            return userResponseMessageForTextInputDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading user response for text input");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public ScreenshotMessageDM parseScreenshotMessageDM(String str) {
        try {
            return parseScreenshotMessageDM(new JSONObject(str));
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading user screenshot message");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public UserAttachmentMessageDM parseUserAttachmentMessageDM(String str) {
        try {
            return parseUserAttachmentMessageDM(new JSONObject(str));
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading user attachment message");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public AcceptedAppReviewMessageDM parseAcceptedAppReviewMessageDM(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString("created_at");
            AcceptedAppReviewMessageDM acceptedAppReviewMessageDM = new AcceptedAppReviewMessageDM(jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), true), jSONObject.getJSONObject("meta").getString("refers"), 2);
            acceptedAppReviewMessageDM.serverId = jSONObject.getString("id");
            acceptedAppReviewMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            acceptedAppReviewMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
            parseAndSetDataForUserSentMessages(acceptedAppReviewMessageDM, jSONObject);
            return acceptedAppReviewMessageDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading accepted review message");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public ConfirmationAcceptedMessageDM parseConfirmationAcceptedMessageDM(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString("created_at");
            ConfirmationAcceptedMessageDM confirmationAcceptedMessageDM = new ConfirmationAcceptedMessageDM(jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), true), 2);
            confirmationAcceptedMessageDM.serverId = jSONObject.getString("id");
            confirmationAcceptedMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            confirmationAcceptedMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
            parseAndSetDataForUserSentMessages(confirmationAcceptedMessageDM, jSONObject);
            return confirmationAcceptedMessageDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading confirmation accepted message");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public ConfirmationRejectedMessageDM parseConfirmationRejectedMessageDM(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString("created_at");
            ConfirmationRejectedMessageDM confirmationRejectedMessageDM = new ConfirmationRejectedMessageDM(jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false), 2);
            confirmationRejectedMessageDM.serverId = jSONObject.getString("id");
            confirmationRejectedMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            confirmationRejectedMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
            parseAndSetDataForUserSentMessages(confirmationRejectedMessageDM, jSONObject);
            return confirmationRejectedMessageDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading confirmation rejected message");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public ConversationInbox parseConversationInbox(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            ArrayList arrayList = new ArrayList();
            JSONArray jSONArray = jSONObject.getJSONArray(ConversationTable.TABLE_NAME);
            for (int i = 0; i < jSONArray.length(); i++) {
                arrayList.add(parseReadableConversation(jSONArray.getJSONObject(i).toString()));
            }
            return new ConversationInbox(jSONObject.getString("cursor"), arrayList, jSONObject.getBoolean(UserTable.Columns.ISSUE_EXISTS), jSONObject.has("has_older_messages") ? Boolean.valueOf(jSONObject.getBoolean("has_older_messages")) : null);
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading conversation inbox");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public ConversationHistory parseConversationHistory(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            ArrayList arrayList = new ArrayList();
            JSONArray jSONArray = jSONObject.getJSONArray(ConversationTable.TABLE_NAME);
            for (int i = 0; i < jSONArray.length(); i++) {
                arrayList.add(parseReadableConversation(jSONArray.getJSONObject(i).toString()));
            }
            return new ConversationHistory(arrayList, jSONObject.getBoolean("has_older_messages"));
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading conversation history");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public FollowupRejectedMessageDM parseFollowupRejectedMessage(String str) {
        try {
            return parseFollowupRejectedMessageDM(new JSONObject(str));
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading follow-up rejected message");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public FollowupAcceptedMessageDM parseFollowupAcceptedMessage(String str) {
        try {
            return parseFollowupAcceptedMessageDM(new JSONObject(str));
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading follow-up accepted message");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public WebSocketAuthData parseAuthToken(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            return new WebSocketAuthData(jSONObject.getString("token"), jSONObject.getString(Events.END_POINT));
        } catch (JSONException e) {
            HSLogger.e(TAG, "Exception in parsing auth token", e);
            return null;
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public WebSocketMessage parseWebSocketMessage(String str) {
        WSTypingActionMessage wSTypingActionMessage;
        WSTypingActionMessage wSTypingActionMessage2 = null;
        try {
            JSONArray jSONArray = new JSONArray(str);
            int i = jSONArray.getInt(0);
            if (i != 100) {
                if (i != 107) {
                    return null;
                }
                return new WSPingMessage(TimeUnit.SECONDS.toMillis(jSONArray.getLong(1)));
            }
            JSONArray jSONArray2 = jSONArray.getJSONArray(2);
            for (int i2 = 0; i2 < jSONArray2.length(); i2++) {
                JSONObject jSONObject = new JSONObject(jSONArray2.getJSONObject(i2).getString(ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_BODY));
                if ("agent_type_activity".equals(jSONObject.getString("stream"))) {
                    String string = jSONObject.getString("action");
                    if ("start".equals(string)) {
                        wSTypingActionMessage = new WSTypingActionMessage(true, TimeUnit.SECONDS.toMillis(jSONObject.getLong("ttl")));
                    } else if ("stop".equals(string)) {
                        wSTypingActionMessage = new WSTypingActionMessage(false, 0L);
                    }
                    wSTypingActionMessage2 = wSTypingActionMessage;
                }
            }
            return wSTypingActionMessage2;
        } catch (JSONException e) {
            HSLogger.e(TAG, "Exception in parsing web-socket message", e);
            return null;
        }
    }

    private boolean parseDisableHelpshiftBrandingValue(JSONObject jSONObject) {
        if (jSONObject != null) {
            return !jSONObject.optBoolean("hl", true);
        }
        return false;
    }

    private List<MessageDM> parseMessageDMs(JSONArray jSONArray) {
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        for (int i = 0; i < length; i++) {
            try {
                JSONObject jSONObject = jSONArray.getJSONObject(i);
                String string = jSONObject.getString("type");
                String string2 = jSONObject.getString("origin");
                if ("admin".equals(string2)) {
                    parseAdminMessage(string, jSONObject, arrayList);
                } else if ("mobile".equals(string2)) {
                    parseMobileMessage(string, jSONObject, arrayList);
                } else {
                    HSLogger.e(TAG, "Unknown message type received.");
                }
            } catch (RootAPIException | JSONException e) {
                HSLogger.e(TAG, "Exception while parsing messages: ", e);
            }
        }
        return arrayList;
    }

    private void parseAdminMessage(String str, JSONObject jSONObject, List<MessageDM> list) {
        ArrayList arrayList = new ArrayList();
        try {
            switch (str) {
                case "txt":
                    arrayList.addAll(parseAdminMessageDM(jSONObject));
                    break;
                case "txt_msg_with_txt_input":
                    arrayList.addAll(parseAdminMessageWithTextInputDM(jSONObject, 1));
                    break;
                case "txt_msg_with_email_input":
                    arrayList.addAll(parseAdminMessageWithTextInputDM(jSONObject, 2));
                    break;
                case "txt_msg_with_numeric_input":
                    arrayList.addAll(parseAdminMessageWithTextInputDM(jSONObject, 3));
                    break;
                case "txt_msg_with_dt_input":
                    arrayList.addAll(parseAdminMessageWithTextInputDM(jSONObject, 4));
                    break;
                case "empty_msg_with_txt_input":
                    arrayList.add(parseAdminEmptyMessageWithTextInputDM(jSONObject));
                    break;
                case "txt_msg_with_option_input":
                    arrayList.addAll(parseAdminMessageWithOptionInputDM(jSONObject));
                    break;
                case "rar":
                    arrayList.add(parseRequestAppReviewMessageDM(jSONObject));
                    break;
                case "rsc":
                    arrayList.addAll(parseRequestScreenshotMessageDM(jSONObject));
                    break;
                case "rfr":
                    arrayList.add(parseRequestForReopenMessageDM(jSONObject));
                    break;
                case "faq_list":
                    arrayList.add(parseFAQListMessageDM(jSONObject));
                    break;
                case "faq_list_msg_with_option_input":
                    arrayList.add(parseFAQListMessageWitOptionInputDM(jSONObject));
                    break;
                case "txt_msg_with_actions":
                    arrayList.addAll(parseAdminMessageWithActionCardMessageDM(jSONObject));
                    break;
                case "txt_resolution_msg_with_option_input":
                    arrayList.addAll(parseAdminResolutionMessageWithOptionInputDM(jSONObject));
                    break;
                case "txt_csat_msg_with_option_input":
                    arrayList.add(parseAdminCSATMessageWithRatingInputDM(jSONObject));
                    break;
                case "bot_started":
                case "bot_ended":
                    arrayList.add(parseBotControlMessage(jSONObject.toString(), true));
                    break;
                default:
                    if (jSONObject.has("input")) {
                        arrayList.add(parseUnsupportedAdminMessageWithInput(jSONObject.toString()));
                        break;
                    }
                    break;
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                ((MessageDM) it.next()).isFeedbackMessage = jSONObject.optBoolean("feedback_message", false);
            }
            list.addAll(arrayList);
        } catch (RootAPIException e) {
            HSLogger.e(TAG, "Exception while parsing messages: ", e);
        }
    }

    private void parseMobileMessage(String str, JSONObject jSONObject, List<MessageDM> list) {
        ArrayList arrayList = new ArrayList();
        try {
            switch (str) {
                case "txt":
                    arrayList.add(parseReadableUserMessage(jSONObject.toString()));
                    break;
                case "ar":
                    arrayList.add(parseAcceptedAppReviewMessageDM(jSONObject.toString()));
                    break;
                case "ncr":
                    arrayList.add(parseConfirmationRejectedMessageDM(jSONObject.toString()));
                    break;
                case "ca":
                    arrayList.add(parseConfirmationAcceptedMessageDM(jSONObject.toString()));
                    break;
                case "sc":
                    arrayList.add(parseScreenshotMessageDM(jSONObject));
                    break;
                case "at":
                    arrayList.add(parseUserAttachmentMessageDM(jSONObject));
                    break;
                case "ra":
                    arrayList.add(parseFollowupAcceptedMessageDM(jSONObject));
                    break;
                case "rj":
                    arrayList.add(parseFollowupRejectedMessageDM(jSONObject));
                    break;
                case "si":
                    arrayList.add(parseUserSmartIntentMessage(jSONObject.toString()));
                    break;
                case "rsp_empty_msg_with_txt_input":
                case "rsp_txt_msg_with_txt_input":
                case "rsp_txt_msg_with_email_input":
                case "rsp_txt_msg_with_numeric_input":
                case "rsp_txt_msg_with_dt_input":
                    arrayList.add(parseResponseMessageForTextInput(jSONObject.toString()));
                    break;
                case "rsp_txt_msg_with_option_input":
                case "rsp_faq_list_msg_with_option_input":
                case "rsp_txt_resolution_msg_with_option_input":
                    arrayList.add(parseResponseMessageForOptionInput(jSONObject.toString()));
                    break;
                case "rsp_txt_csat_msg_with_option_input":
                    arrayList.add(parseResponseMessageForCSATInput(jSONObject.toString()));
                    break;
                case "bot_cancelled":
                    arrayList.add(parseBotControlMessage(jSONObject.toString(), false));
                    break;
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                parseIsFeedbackMessage((MessageDM) it.next(), jSONObject);
            }
            list.addAll(arrayList);
        } catch (RootAPIException e) {
            HSLogger.e(TAG, "Exception while parsing messages: ", e);
        }
    }

    private void parseIsFeedbackMessage(MessageDM messageDM, JSONObject jSONObject) {
        messageDM.isFeedbackMessage = jSONObject.optBoolean("feedback_message", false);
    }

    public MessageDM parseUserSmartIntentMessage(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString("created_at");
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("intent_labels");
            UserSmartIntentMessageDM userSmartIntentMessageDM = new UserSmartIntentMessageDM(jSONArrayOptJSONArray != null ? HSJSONUtils.convertJSONArrayToStringList(jSONArrayOptJSONArray) : new ArrayList(), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), true));
            userSmartIntentMessageDM.serverId = jSONObject.getString("id");
            userSmartIntentMessageDM.body = jSONObject.getString("body");
            userSmartIntentMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            userSmartIntentMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
            parseAndSetDataForUserSentMessages(userSmartIntentMessageDM, jSONObject);
            return userSmartIntentMessageDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading user smart intent message");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public MessageDM parseBotControlMessage(String str, boolean z) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString("type");
            String string2 = jSONObject.getString("id");
            String string3 = jSONObject.getJSONObject("chatbot_info").toString();
            boolean zOptBoolean = jSONObject.optBoolean("redacted", false);
            String string4 = jSONObject.getString("created_at");
            long jConvertToEpochTime = HSDateFormatSpec.convertToEpochTime(string4);
            if (z) {
                AdminBotControlMessageDM adminBotControlMessageDM = new AdminBotControlMessageDM(string2, jSONObject.getString("body"), string4, jConvertToEpochTime, parseMessageAuthor(jSONObject.getJSONObject("author"), false), string, string3);
                adminBotControlMessageDM.hasNextBot = jSONObject.optBoolean("has_next_bot", false);
                adminBotControlMessageDM.isRedacted = zOptBoolean;
                return adminBotControlMessageDM;
            }
            JSONObject jSONObject2 = jSONObject.getJSONObject("meta");
            UserBotControlMessageDM userBotControlMessageDM = new UserBotControlMessageDM(jSONObject.getString("body"), string4, jConvertToEpochTime, parseMessageAuthor(jSONObject.getJSONObject("author"), true), string, jSONObject2.getString("chatbot_cancelled_reason"), string3, jSONObject2.getString("refers"), 2);
            userBotControlMessageDM.serverId = string2;
            userBotControlMessageDM.isRedacted = zOptBoolean;
            parseAndSetDataForUserSentMessages(userBotControlMessageDM, jSONObject);
            return userBotControlMessageDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading bot control messages.");
        }
    }

    private List<FAQListMessageDM.FAQ> parseFAQList(JSONArray jSONArray) throws JSONException {
        ArrayList arrayList = new ArrayList();
        for (int i = 0; i < jSONArray.length(); i++) {
            JSONObject jSONObject = jSONArray.getJSONObject(i);
            JSONObject jSONObject2 = jSONObject.getJSONObject("data");
            arrayList.add(new FAQListMessageDM.FAQ(jSONObject.getString("title"), jSONObject2.getString("publish_id"), jSONObject2.getString("language")));
        }
        return arrayList;
    }

    private MessageDM parseFAQListMessageWitOptionInputDM(JSONObject jSONObject) {
        try {
            JSONObject jSONObject2 = jSONObject.getJSONObject("input");
            String string = jSONObject.getString("created_at");
            FAQListMessageWithOptionInputDM fAQListMessageWithOptionInputDM = new FAQListMessageWithOptionInputDM(jSONObject.getString("id"), jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false), parseFAQList(jSONObject.getJSONArray("faqs")), jSONObject.optString("faq_source"), jSONObject.getJSONObject("chatbot_info").toString(), jSONObject2.getBoolean("required"), jSONObject2.getString("label"), jSONObject2.optString("skip_label"), parseOptions(jSONObject2));
            fAQListMessageWithOptionInputDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            fAQListMessageWithOptionInputDM.isRedacted = jSONObject.optBoolean("redacted", false);
            return fAQListMessageWithOptionInputDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading list message with option input");
        }
    }

    private FAQListMessageDM parseFAQListMessageDM(JSONObject jSONObject) {
        try {
            String string = jSONObject.getString("created_at");
            FAQListMessageDM fAQListMessageDM = new FAQListMessageDM(jSONObject.getString("id"), jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false), parseFAQList(jSONObject.getJSONArray("faqs")), jSONObject.optString("faq_source"));
            fAQListMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            fAQListMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
            return fAQListMessageDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading faq list message");
        }
    }

    private FollowupRejectedMessageDM parseFollowupRejectedMessageDM(JSONObject jSONObject) {
        try {
            String string = jSONObject.getString("created_at");
            FollowupRejectedMessageDM followupRejectedMessageDM = new FollowupRejectedMessageDM(jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), true), jSONObject.getJSONObject("meta").getString("refers"), 2);
            followupRejectedMessageDM.serverId = jSONObject.getString("id");
            followupRejectedMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            followupRejectedMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
            parseAndSetDataForUserSentMessages(followupRejectedMessageDM, jSONObject);
            return followupRejectedMessageDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading follow-up rejected message");
        }
    }

    private FollowupAcceptedMessageDM parseFollowupAcceptedMessageDM(JSONObject jSONObject) {
        try {
            String string = jSONObject.getString("created_at");
            FollowupAcceptedMessageDM followupAcceptedMessageDM = new FollowupAcceptedMessageDM(jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), true), jSONObject.getJSONObject("meta").getString("refers"), 2);
            followupAcceptedMessageDM.serverId = jSONObject.getString("id");
            followupAcceptedMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            followupAcceptedMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
            parseAndSetDataForUserSentMessages(followupAcceptedMessageDM, jSONObject);
            return followupAcceptedMessageDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading follow-up accepted message");
        }
    }

    private RequestForReopenMessageDM parseRequestForReopenMessageDM(JSONObject jSONObject) {
        try {
            String string = jSONObject.getString("created_at");
            RequestForReopenMessageDM requestForReopenMessageDM = new RequestForReopenMessageDM(jSONObject.getString("id"), jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false));
            requestForReopenMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            requestForReopenMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
            return requestForReopenMessageDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading reopen message");
        }
    }

    private List<OptionInput.Option> parseOptions(JSONObject jSONObject) throws JSONException {
        ArrayList arrayList = new ArrayList();
        JSONArray jSONArray = jSONObject.getJSONArray("options");
        int iMin = Math.min(jSONArray.length(), 500);
        for (int i = 0; i < iMin; i++) {
            JSONObject jSONObject2 = jSONArray.getJSONObject(i);
            arrayList.add(new OptionInput.Option(jSONObject2.getString("title"), jSONObject2.getJSONObject("data").toString()));
        }
        return arrayList;
    }

    private List<CSATRatingsInput.Rating> parseRatingsInput(JSONObject jSONObject) throws JSONException {
        ArrayList arrayList = new ArrayList();
        JSONArray jSONArray = jSONObject.getJSONArray("ratings");
        int iMin = Math.min(jSONArray.length(), 500);
        for (int i = 0; i < iMin; i++) {
            JSONObject jSONObject2 = jSONArray.getJSONObject(i);
            JSONObject jSONObject3 = jSONObject2.getJSONObject("data");
            arrayList.add(new CSATRatingsInput.Rating(jSONObject2.getString("title"), jSONObject3.optInt("value", 1), jSONObject3.toString()));
        }
        return arrayList;
    }

    private OptionInput.Type parseOptionType(JSONObject jSONObject) throws JSONException {
        return OptionInput.Type.getType(jSONObject.optString("type"), jSONObject.getJSONArray("options").length());
    }

    private List<MessageDM> parseAdminMessageWithOptionInputDM(JSONObject jSONObject) {
        try {
            ArrayList arrayList = new ArrayList();
            JSONObject jSONObject2 = jSONObject.getJSONObject("input");
            String string = jSONObject.getString("created_at");
            AdminMessageWithOptionInputDM adminMessageWithOptionInputDM = new AdminMessageWithOptionInputDM(jSONObject.getString("id"), jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false), jSONObject.getJSONObject("chatbot_info").toString(), jSONObject2.getBoolean("required"), jSONObject2.getString("label"), jSONObject2.optString("skip_label"), parseOptions(jSONObject2), parseOptionType(jSONObject2));
            adminMessageWithOptionInputDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            adminMessageWithOptionInputDM.isRedacted = jSONObject.optBoolean("redacted", false);
            List<MessageDM> adminAttachmentEntities = parseAdminAttachmentEntities(jSONObject);
            adminMessageWithOptionInputDM.attachmentCount = adminAttachmentEntities.size();
            arrayList.add(adminMessageWithOptionInputDM);
            arrayList.addAll(adminAttachmentEntities);
            return arrayList;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading admin text message with option input");
        }
    }

    private List<MessageDM> parseAdminResolutionMessageWithOptionInputDM(JSONObject jSONObject) {
        ArrayList arrayList = new ArrayList();
        try {
            JSONObject jSONObject2 = jSONObject.getJSONObject("input");
            String string = jSONObject.getString("created_at");
            AdminResolutionMessageWithOptions adminResolutionMessageWithOptions = new AdminResolutionMessageWithOptions(jSONObject.getString("id"), jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false), jSONObject.getJSONObject("chatbot_info").toString(), jSONObject2.getBoolean("required"), jSONObject2.getString("label"), jSONObject2.optString("skip_label"), parseOptions(jSONObject2), parseOptionType(jSONObject2));
            adminResolutionMessageWithOptions.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            adminResolutionMessageWithOptions.isRedacted = jSONObject.optBoolean("redacted", false);
            List<MessageDM> adminAttachmentEntities = parseAdminAttachmentEntities(jSONObject);
            adminResolutionMessageWithOptions.attachmentCount = adminAttachmentEntities.size();
            arrayList.add(adminResolutionMessageWithOptions);
            arrayList.addAll(adminAttachmentEntities);
            return arrayList;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading admin resolution message with option input");
        }
    }

    private MessageDM parseAdminCSATMessageWithRatingInputDM(JSONObject jSONObject) {
        try {
            JSONObject jSONObject2 = jSONObject.getJSONObject("input");
            String string = jSONObject.getString("created_at");
            AdminCSATMessageWithOptions adminCSATMessageWithOptions = new AdminCSATMessageWithOptions(jSONObject.getString("id"), jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false), jSONObject.getJSONObject("chatbot_info").toString(), jSONObject2.getBoolean("required"), jSONObject2.getString("label"), jSONObject2.optString("skip_label"), jSONObject2.optString("submit_feedback_button_text"), jSONObject2.optBoolean("show_new_conversation_button", true), jSONObject2.optString("show_new_conversation_button_text"), parseRatingsInput(jSONObject2), CSATRatingsInput.Type.STAR_5);
            adminCSATMessageWithOptions.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            adminCSATMessageWithOptions.isRedacted = jSONObject.optBoolean("redacted", false);
            return adminCSATMessageWithOptions;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading admin resolution message with option input");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public UserResponseMessageForOptionInput parseResponseMessageForOptionInput(String str) {
        MessageType messageType;
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString("type");
            byte b = -1;
            int iHashCode = string.hashCode();
            if (iHashCode != -904450649) {
                if (iHashCode != -657647885) {
                    if (iHashCode == 1826087580 && string.equals("rsp_txt_msg_with_option_input")) {
                        b = 0;
                    }
                } else if (string.equals("rsp_faq_list_msg_with_option_input")) {
                    b = 1;
                }
            } else if (string.equals("rsp_txt_resolution_msg_with_option_input")) {
                b = 2;
            }
            if (b == 0) {
                messageType = MessageType.ADMIN_TEXT_WITH_OPTION_INPUT;
            } else if (b == 1) {
                messageType = MessageType.FAQ_LIST_WITH_OPTION_INPUT;
            } else {
                if (b != 2) {
                    return null;
                }
                messageType = MessageType.ADMIN_RESOLUTION_QUESTION_MESSAGE;
            }
            MessageType messageType2 = messageType;
            boolean z = jSONObject.getBoolean(LoginLogger.EVENT_PARAM_METHOD_RESULT_SKIPPED);
            String string2 = z ? "{}" : jSONObject.getJSONObject("option_data").toString();
            String string3 = jSONObject.getString("created_at");
            UserResponseMessageForOptionInput userResponseMessageForOptionInput = new UserResponseMessageForOptionInput(jSONObject.getString("body"), string3, HSDateFormatSpec.convertToEpochTime(string3), parseMessageAuthor(jSONObject.getJSONObject("author"), true), jSONObject.getJSONObject("chatbot_info").toString(), z, string2, jSONObject.getJSONObject("meta").getString("refers"), messageType2);
            userResponseMessageForOptionInput.serverId = jSONObject.getString("id");
            userResponseMessageForOptionInput.isRedacted = jSONObject.optBoolean("redacted", false);
            parseAndSetDataForUserSentMessages(userResponseMessageForOptionInput, jSONObject);
            parseIsFeedbackMessage(userResponseMessageForOptionInput, jSONObject);
            return userResponseMessageForOptionInput;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading user response for option input");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public UserResponseMessageForCSATInput parseResponseMessageForCSATInput(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            boolean zOptBoolean = jSONObject.optBoolean("new_conv_started", false);
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("rating_data");
            String string = jSONObjectOptJSONObject == null ? "{}" : jSONObjectOptJSONObject.toString();
            int iOptInt = jSONObjectOptJSONObject == null ? 0 : jSONObjectOptJSONObject.optInt("value");
            String string2 = jSONObject.getString("created_at");
            UserResponseMessageForCSATInput userResponseMessageForCSATInput = new UserResponseMessageForCSATInput(jSONObject.getString("body"), string2, HSDateFormatSpec.convertToEpochTime(string2), parseMessageAuthor(jSONObject.getJSONObject("author"), true), iOptInt, zOptBoolean, jSONObject.getJSONObject("chatbot_info").toString(), string, jSONObject.getJSONObject("meta").getString("refers"), 2);
            userResponseMessageForCSATInput.serverId = jSONObject.getString("id");
            userResponseMessageForCSATInput.isRedacted = jSONObject.optBoolean("redacted", false);
            parseAndSetDataForUserSentMessages(userResponseMessageForCSATInput, jSONObject);
            parseIsFeedbackMessage(userResponseMessageForCSATInput, jSONObject);
            return userResponseMessageForCSATInput;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading user response for csat input");
        }
    }

    private AdminMessageWithTextInputDM parseAdminEmptyMessageWithTextInputDM(JSONObject jSONObject) {
        try {
            JSONObject jSONObject2 = jSONObject.getJSONObject("input");
            String string = jSONObject.getString("created_at");
            AdminMessageWithTextInputDM adminMessageWithTextInputDM = new AdminMessageWithTextInputDM(jSONObject.getString("id"), "", string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false), jSONObject.getJSONObject("chatbot_info").toString(), jSONObject2.getString("placeholder"), jSONObject2.getBoolean("required"), jSONObject2.getString("label"), jSONObject2.optString("skip_label"), 1, true);
            adminMessageWithTextInputDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            adminMessageWithTextInputDM.isRedacted = jSONObject.optBoolean("redacted", false);
            return adminMessageWithTextInputDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading admin empty message with text input");
        }
    }

    private List<MessageDM> parseAdminMessageWithTextInputDM(JSONObject jSONObject, int i) {
        try {
            ArrayList arrayList = new ArrayList();
            JSONObject jSONObject2 = jSONObject.getJSONObject("input");
            String string = jSONObject.getString("created_at");
            AdminMessageWithTextInputDM adminMessageWithTextInputDM = new AdminMessageWithTextInputDM(jSONObject.getString("id"), jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false), jSONObject.getJSONObject("chatbot_info").toString(), jSONObject2.getString("placeholder"), jSONObject2.getBoolean("required"), jSONObject2.getString("label"), jSONObject2.optString("skip_label"), i, false);
            adminMessageWithTextInputDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            adminMessageWithTextInputDM.isRedacted = jSONObject.optBoolean("redacted", false);
            arrayList.add(adminMessageWithTextInputDM);
            arrayList.addAll(parseAdminAttachmentEntities(jSONObject));
            return arrayList;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading admin message with text input");
        }
    }

    private List<MessageDM> parseAdminMessageDM(JSONObject jSONObject) {
        try {
            ArrayList arrayList = new ArrayList();
            String string = jSONObject.getString("created_at");
            AdminMessageDM adminMessageDM = new AdminMessageDM(jSONObject.getString("id"), jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false));
            adminMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            adminMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
            arrayList.add(adminMessageDM);
            arrayList.addAll(parseAdminAttachmentEntities(jSONObject));
            return arrayList;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading admin text message");
        }
    }

    private List<MessageDM> parseAdminMessageWithActionCardMessageDM(JSONObject jSONObject) {
        ArrayList arrayList = new ArrayList();
        try {
            String string = jSONObject.getString("created_at");
            AdminMessageDM adminMessageDM = new AdminMessageDM(jSONObject.getString("id"), jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false));
            adminMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            adminMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
            arrayList.add(adminMessageDM);
            arrayList.add(parseAdminActionCardMessageDM(jSONObject));
            return arrayList;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading admin action card message");
        }
    }

    private AdminActionCardMessageDM parseAdminActionCardMessageDM(JSONObject jSONObject) throws JSONException {
        String str = jSONObject.getString("id") + "_0";
        String strAddMilliSeconds = HSDateFormatSpec.addMilliSeconds(HSDateFormatSpec.STORAGE_TIME_FORMAT, jSONObject.getString("created_at"), 1);
        long jConvertToEpochTime = HSDateFormatSpec.convertToEpochTime(strAddMilliSeconds);
        JSONObject jSONObject2 = jSONObject.getJSONArray(ActionCardTable.TABLE_NAME).getJSONObject(0);
        JSONObject jSONObject3 = jSONObject2.getJSONArray("actions").getJSONObject(0);
        AdminActionCardMessageDM adminActionCardMessageDM = new AdminActionCardMessageDM(str, jSONObject.getString("body"), strAddMilliSeconds, jConvertToEpochTime, parseMessageAuthor(jSONObject.getJSONObject("author"), false), jSONObject.getString("id"), new ActionCard(jSONObject2.optString("title"), jSONObject2.optString(ActionCardTable.Columns.IMAGE_URL), jSONObject2.optBoolean(ActionCardTable.Columns.IS_IMAGE_SECURE), new Action(jSONObject3.getString("display_text"), jSONObject3.getString("id"), ActionType.fromValue(jSONObject3.getString("type")), HSJSONUtils.toStringMap(jSONObject3.getJSONObject("data")))));
        adminActionCardMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
        adminActionCardMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
        return adminActionCardMessageDM;
    }

    private UnsupportedAdminMessageWithInputDM parseUnsupportedAdminMessageWithInput(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString("created_at");
            return new UnsupportedAdminMessageWithInputDM(jSONObject.getString("id"), jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false), jSONObject.getString("type"), jSONObject.getJSONObject("chatbot_info").toString(), jSONObject.getJSONObject("input").toString());
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading unsupported admin message with input");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public RootServerConfig parseConfigResponse(String str) {
        Long l;
        Long l2;
        Long lValueOf;
        boolean z;
        String str2;
        String strOptString;
        boolean z2;
        try {
            JSONObject jSONObject = new JSONObject(str);
            Long lValueOf2 = jSONObject.has("last_redaction_at") ? Long.valueOf(jSONObject.getLong("last_redaction_at")) : null;
            Long lValueOf3 = jSONObject.has("profile_created_at") ? Long.valueOf(jSONObject.getLong("profile_created_at")) : null;
            long jOptLong = jSONObject.optLong("pfi", 0L) / 1000;
            long jOptLong2 = jSONObject.optLong("pri", 0L) / 1000;
            boolean zOptBoolean = jSONObject.optBoolean("afp", false);
            if (jSONObject.has("si")) {
                JSONObject jSONObject2 = jSONObject.getJSONObject("si");
                boolean z3 = jSONObject2.getBoolean("enabled");
                Long lValueOf4 = Long.valueOf(jSONObject2.optLong("tree_sla", 600000L));
                Long lValueOf5 = Long.valueOf(jSONObject2.optLong("model_sla", 600000L));
                lValueOf = Long.valueOf(jSONObject2.optLong("cache_sla", SMART_INTENT_CLIENT_CACHE_DEFAULT_INTERVAL));
                z = z3;
                l2 = lValueOf4;
                l = lValueOf5;
            } else {
                l = null;
                l2 = null;
                lValueOf = null;
                z = false;
            }
            ArrayList<ArrayList<String>> arrayListNestedJsonArrayToNestedArrayList = HSJSONUtils.nestedJsonArrayToNestedArrayList(jSONObject.optString("wa", "[[\"*/*\"]]"));
            int iOptInt = jSONObject.optInt(DeviceProperties.DeviceKeys.LAST_LOCATION, LogLevel.FATAL.getValue());
            if (jSONObject.has("hdr")) {
                JSONObject jSONObject3 = jSONObject.getJSONObject("hdr");
                boolean zOptBoolean2 = jSONObject3.optBoolean("sh", false);
                String strOptString2 = jSONObject3.optString("htxt", "");
                strOptString = jSONObject3.optString("hurl", "");
                z2 = zOptBoolean2;
                str2 = strOptString2;
            } else {
                str2 = "";
                strOptString = str2;
                z2 = false;
            }
            return new RootServerConfig(jSONObject.optBoolean("rne", false), jSONObject.optBoolean("pfe", true), jSONObject.optBoolean("csat", false), jSONObject.optBoolean("dia", false), parseDisableHelpshiftBrandingValue(jSONObject.optJSONObject("t")), jSONObject.optBoolean(UserTable.Columns.ISSUE_EXISTS, true), jSONObject.optInt("dbgl", 100), jSONObject.optInt("bcl", 100), jSONObject.optString("rurl", ""), parsePeriodicReview(jSONObject.getJSONObject("pr")), jSONObject.optBoolean(ModelKeys.KEY_CAMPAIGN_DETAIL_MODEL_ICON_IMAGE_URL, false), jSONObject.optString("gm", ""), jSONObject.optBoolean("tyi", true), jSONObject.optBoolean("rq", false), jSONObject.optBoolean("conversation_history_enabled", false), lValueOf2, lValueOf3, jSONObject.optBoolean("allow_user_attachments", true), jOptLong, jOptLong2, zOptBoolean, z, l, l2, lValueOf, arrayListNestedJsonArrayToNestedArrayList, iOptInt, z2, str2, strOptString, jSONObject.has("avtr") ? parseAvatarKeys(jSONObject.getJSONObject("avtr")) : null, jSONObject.optBoolean("asae", true), jSONObject.optLong("pasi", 0L));
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while fetching config");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public Conversation parseReadableConversation(String str) {
        ArrayList<String> arrayListJsonArrayToStringArrayList;
        String createdAt;
        try {
            JSONObject jSONObject = new JSONObject(str);
            try {
                List<MessageDM> messageDMs = parseMessageDMs(jSONObject.getJSONArray("messages"));
                int size = messageDMs.size() - 1;
                while (true) {
                    arrayListJsonArrayToStringArrayList = null;
                    if (size < 0) {
                        createdAt = null;
                        break;
                    }
                    MessageDM messageDM = messageDMs.get(size);
                    if (!(messageDM instanceof AdminAttachmentMessageDM) && !(messageDM instanceof AdminImageAttachmentMessageDM)) {
                        createdAt = messageDM.getCreatedAt();
                        break;
                    }
                    size--;
                }
                IssueState issueStateFromInt = IssueState.fromInt(jSONObject.getInt("state"));
                String string = jSONObject.getString("created_at");
                long jConvertToEpochTime = HSDateFormatSpec.convertToEpochTime(string);
                String string2 = jSONObject.getString("type");
                Conversation conversation = new Conversation(jSONObject.optString("title", ""), issueStateFromInt, string, jConvertToEpochTime, jSONObject.getString(ConversationTable.Columns.UPDATED_AT), jSONObject.getString("publish_id"), createdAt, string2, jSONObject.isNull("acid") ? null : jSONObject.getString("acid"));
                conversation.isRedacted = jSONObject.optBoolean("redacted", false);
                conversation.serverId = jSONObject.isNull(AnalyticsEventKey.ISSUE_ID) ? null : jSONObject.getString(AnalyticsEventKey.ISSUE_ID);
                conversation.preConversationServerId = jSONObject.isNull(AnalyticsEventKey.PREISSUE_ID) ? null : jSONObject.getString(AnalyticsEventKey.PREISSUE_ID);
                conversation.issueType = string2;
                conversation.createdRequestId = jSONObject.optString("request_id");
                if (!jSONObject.isNull("intent")) {
                    arrayListJsonArrayToStringArrayList = HSJSONUtils.jsonArrayToStringArrayList(jSONObject.getString("intent"));
                }
                conversation.smartIntentIds = arrayListJsonArrayToStringArrayList;
                if (IssueType.ISSUE.equals(string2)) {
                    conversation.csatState = jSONObject.optBoolean("csat_received") ? ConversationCSATState.SUBMITTED_SYNCED : ConversationCSATState.NONE;
                }
                if (jSONObject.has("resolution_question_expiry_at")) {
                    conversation.resolutionExpiryAt = Long.valueOf(jSONObject.getLong("resolution_question_expiry_at"));
                }
                if (jSONObject.has(ConversationTable.Columns.CSAT_EXPIRY_AT)) {
                    conversation.csatExpiryAt = Long.valueOf(jSONObject.getLong(ConversationTable.Columns.CSAT_EXPIRY_AT));
                }
                conversation.isFeedbackBotEnabled = jSONObject.optBoolean(ConversationTable.Columns.FEEDBACK_BOT_ENABLED, false);
                conversation.shouldAllowNewConversationCreation = jSONObject.optBoolean("show_new_conversation_button", false);
                conversation.setMessageDMs(messageDMs);
                return conversation;
            } catch (JSONException e) {
                e = e;
                throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception in reading conversation");
            }
        } catch (JSONException e2) {
            e = e2;
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public FaqCore parseSingleFAQ(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            return new FaqCore(jSONObject.getString("id"), jSONObject.getString("publish_id"), jSONObject.getString("language"), jSONObject.getString("section_id"), jSONObject.getString("title"), jSONObject.getString("body"), 0, Boolean.valueOf(jSONObject.getString("is_rtl").equals(ServerProtocol.DIALOG_RETURN_SCOPES_TRUE)), jSONObject.has("stags") ? HSJSONUtils.jsonArrayToStringArrayList(jSONObject.getString("stags")) : new ArrayList<>(), jSONObject.has("issue_tags") ? HSJSONUtils.jsonArrayToStringArrayList(jSONObject.getString("issue_tags")) : new ArrayList<>());
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading single faq");
        }
    }

    private List<SmartIntentDTO> parseSmartIntents(String str, JSONArray jSONArray) throws JSONException {
        ArrayList arrayList = new ArrayList();
        int length = jSONArray.length();
        if (length == 0) {
            return arrayList;
        }
        for (int i = 0; i < length; i++) {
            JSONObject jSONObject = jSONArray.getJSONObject(i);
            String string = jSONObject.getString("id");
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("children");
            List<SmartIntentDTO> smartIntents = null;
            if (jSONArrayOptJSONArray != null) {
                smartIntents = parseSmartIntents(string, jSONArrayOptJSONArray);
            }
            arrayList.add(new SmartIntentDTO(jSONObject.getString("label"), string, str, smartIntents));
        }
        return arrayList;
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public SITreeDTO parseSmartIntentTree(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            List<SmartIntentDTO> smartIntents = parseSmartIntents(null, jSONObject.getJSONArray("tree"));
            int i = jSONObject.getInt("version");
            JSONObject jSONObject2 = jSONObject.getJSONObject("translations");
            return new SITreeDTO(jSONObject.getString("id"), i, jSONObject2.getString(SmartIntentTreeTable.Columns.SI_TREE_PROMPT_TITLE), jSONObject2.getString("typing_hint"), jSONObject2.getString(SmartIntentTreeTable.Columns.SI_TREE_SEARCH_TITLE), jSONObject2.getString(SmartIntentTreeTable.Columns.SI_TREE_EMPTY_SEARCH_TITLE), jSONObject2.getString("empty_search_desc"), jSONObject.getBoolean(AnalyticsEventKey.SMART_INTENT_ENFORCE_INTENT_SELECTION), HSJSONUtils.convertJSONArrayToStringList(jSONObject.getJSONArray("token_delimiters")), smartIntents);
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading smart intent tree");
        }
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public SISearchModelDTO parseSmartIntentSearchModel(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            JSONObject jSONObject2 = jSONObject.getJSONObject("weights");
            JSONArray jSONArray = jSONObject.getJSONArray("intent_ids");
            int i = jSONObject.getInt("version");
            List<String> listConvertJSONArrayToStringList = HSJSONUtils.convertJSONArrayToStringList(jSONArray);
            List<Double> doubleListFromJSONArray = HSJSONUtils.getDoubleListFromJSONArray(jSONObject2.getJSONArray("label_base_probabilities"));
            if (listConvertJSONArrayToStringList.size() != doubleListFromJSONArray.size()) {
                throw new JSONException("Mismatch in LeafIntentIds and baseProbabilities list");
            }
            JSONArray jSONArray2 = jSONObject.getJSONArray("vocabulary");
            JSONArray jSONArray3 = jSONObject2.getJSONArray("word_label_probabilities");
            if (jSONArray2.length() != jSONArray3.length()) {
                throw new JSONException("Mismatch in vocabulary and wordLabelProbability array");
            }
            HashMap map = new HashMap();
            for (int i2 = 0; i2 < jSONArray2.length(); i2++) {
                map.put(jSONArray2.getString(i2), HSJSONUtils.getDoubleListFromJSONArray(jSONArray3.getJSONArray(i2)));
            }
            JSONObject jSONObject3 = jSONObject.getJSONObject("parameters");
            return new SISearchModelDTO(Integer.valueOf(i), Double.valueOf(jSONObject3.getDouble(SmartIntentModelsTable.Columns.CONFIDENCE_THRESHOLD)), Double.valueOf(jSONObject3.getDouble(SmartIntentModelsTable.Columns.MAX_COMBINED_CONFIDENCE)), listConvertJSONArrayToStringList, doubleListFromJSONArray, map);
        } catch (Exception e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading smart intent model");
        }
    }

    private List<MessageDM> parseAdminAttachmentEntities(JSONObject jSONObject) {
        String str;
        boolean z;
        int i;
        MessageDM adminAttachmentMessageDM;
        String str2 = "redacted";
        try {
            ArrayList arrayList = new ArrayList();
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("meta");
            JSONArray jSONArrayOptJSONArray = jSONObjectOptJSONObject != null ? jSONObjectOptJSONObject.optJSONArray("attachments") : null;
            if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() != 0) {
                String string = jSONObject.getString("id");
                String string2 = jSONObject.getString("created_at");
                String string3 = jSONObject.getString("body");
                boolean z2 = false;
                Author messageAuthor = parseMessageAuthor(jSONObject.getJSONObject("author"), false);
                boolean zOptBoolean = jSONObject.optBoolean("redacted", false);
                int iConvertDeliveryStateToInt = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
                int i2 = 0;
                while (i2 < jSONArrayOptJSONArray.length()) {
                    JSONObject jSONObject2 = jSONArrayOptJSONArray.getJSONObject(i2);
                    string = string + "_" + i2;
                    int i3 = i2 + 1;
                    String strAddMilliSeconds = HSDateFormatSpec.addMilliSeconds(HSDateFormatSpec.STORAGE_TIME_FORMAT, string2, i3);
                    long jConvertToEpochTime = HSDateFormatSpec.convertToEpochTime(strAddMilliSeconds);
                    String string4 = jSONObject2.has("body") ? jSONObject2.getString("body") : string3;
                    String string5 = jSONObject2.getString("url");
                    String string6 = jSONObject2.getString("content-type");
                    int i4 = jSONObject2.getInt("size");
                    String string7 = jSONObject2.getString("file-name");
                    boolean zOptBoolean2 = jSONObject2.optBoolean("secure?", z2);
                    boolean z3 = zOptBoolean || jSONObject2.optBoolean(str2, z2);
                    if (jSONObject2.optBoolean("image")) {
                        str = str2;
                        z = z3;
                        i = i3;
                        adminAttachmentMessageDM = new AdminImageAttachmentMessageDM(string, string4, strAddMilliSeconds, jConvertToEpochTime, messageAuthor, string5, string7, jSONObject2.getString("thumbnail"), string6, zOptBoolean2, i4);
                    } else {
                        str = str2;
                        z = z3;
                        i = i3;
                        adminAttachmentMessageDM = new AdminAttachmentMessageDM(string, string4, strAddMilliSeconds, jConvertToEpochTime, messageAuthor, i4, string6, string5, string7, zOptBoolean2);
                    }
                    adminAttachmentMessageDM.deliveryState = iConvertDeliveryStateToInt;
                    adminAttachmentMessageDM.isRedacted = z;
                    arrayList.add(adminAttachmentMessageDM);
                    str2 = str;
                    i2 = i;
                    z2 = false;
                }
            }
            return arrayList;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading admin attachment message");
        }
    }

    private RequestAppReviewMessageDM parseRequestAppReviewMessageDM(JSONObject jSONObject) {
        try {
            JSONObject jSONObjectOptJSONObject = jSONObject.getJSONObject("meta").optJSONObject("response");
            boolean z = jSONObject.optBoolean("invisible") || (jSONObjectOptJSONObject != null ? jSONObjectOptJSONObject.optBoolean("state") : false);
            String string = jSONObject.getString("created_at");
            RequestAppReviewMessageDM requestAppReviewMessageDM = new RequestAppReviewMessageDM(jSONObject.getString("id"), jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false), z);
            requestAppReviewMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            requestAppReviewMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
            return requestAppReviewMessageDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading request review message");
        }
    }

    private List<MessageDM> parseRequestScreenshotMessageDM(JSONObject jSONObject) {
        try {
            ArrayList arrayList = new ArrayList();
            JSONObject jSONObjectOptJSONObject = jSONObject.getJSONObject("meta").optJSONObject("response");
            boolean z = jSONObjectOptJSONObject != null ? jSONObjectOptJSONObject.getBoolean("state") : false;
            String string = jSONObject.getString("created_at");
            RequestScreenshotMessageDM requestScreenshotMessageDM = new RequestScreenshotMessageDM(jSONObject.getString("id"), jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), false), z);
            requestScreenshotMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            requestScreenshotMessageDM.isRedacted = jSONObject.optBoolean("redacted", false);
            arrayList.add(requestScreenshotMessageDM);
            arrayList.addAll(parseAdminAttachmentEntities(jSONObject));
            return arrayList;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading request screenshot message");
        }
    }

    private ScreenshotMessageDM parseScreenshotMessageDM(JSONObject jSONObject) {
        try {
            JSONObject jSONObject2 = jSONObject.getJSONObject("meta").getJSONArray("attachments").getJSONObject(0);
            String string = jSONObject.getString("created_at");
            ScreenshotMessageDM screenshotMessageDM = new ScreenshotMessageDM(jSONObject2.has("body") ? jSONObject2.getString("body") : jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), true), jSONObject2.getString("content-type"), jSONObject2.optString("thumbnail", ""), jSONObject2.getString("file-name"), jSONObject2.getString("url"), jSONObject2.getInt("size"), jSONObject2.optBoolean("secure?", false));
            screenshotMessageDM.serverId = jSONObject.getString("id");
            screenshotMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            screenshotMessageDM.isRedacted = jSONObject.optBoolean("redacted", false) || jSONObject2.optBoolean("redacted", false);
            screenshotMessageDM.isZipped = jSONObject2.optBoolean("zipped", false);
            parseAndSetDataForUserSentMessages(screenshotMessageDM, jSONObject);
            parseIsFeedbackMessage(screenshotMessageDM, jSONObject);
            return screenshotMessageDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading screenshot message");
        }
    }

    private UserAttachmentMessageDM parseUserAttachmentMessageDM(JSONObject jSONObject) {
        try {
            JSONObject jSONObject2 = jSONObject.getJSONObject("meta").getJSONArray("attachments").getJSONObject(0);
            String string = jSONObject.getString("created_at");
            UserAttachmentMessageDM userAttachmentMessageDM = new UserAttachmentMessageDM(jSONObject2.has("body") ? jSONObject2.getString("body") : jSONObject.getString("body"), string, HSDateFormatSpec.convertToEpochTime(string), parseMessageAuthor(jSONObject.getJSONObject("author"), true), jSONObject2.getInt("size"), jSONObject2.getString("content-type"), jSONObject2.getString("url"), jSONObject2.getString("file-name"), jSONObject2.optBoolean("secure?", false));
            userAttachmentMessageDM.serverId = jSONObject.getString("id");
            userAttachmentMessageDM.deliveryState = convertDeliveryStateToInt(jSONObject.optString(MessagesTable.Columns.DELIVERY_STATE, ""));
            userAttachmentMessageDM.isRedacted = jSONObject.optBoolean("redacted", false) || jSONObject2.optBoolean("redacted", false);
            userAttachmentMessageDM.isZipped = jSONObject2.optBoolean("zipped", false);
            parseAndSetDataForUserSentMessages(userAttachmentMessageDM, jSONObject);
            parseIsFeedbackMessage(userAttachmentMessageDM, jSONObject);
            return userAttachmentMessageDM;
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading user attachment message");
        }
    }

    private PeriodicReview parsePeriodicReview(JSONObject jSONObject) throws JSONException {
        return new PeriodicReview(jSONObject.optBoolean("s"), jSONObject.optInt("i"), jSONObject.optString("t", ""));
    }

    private AvatarConfig parseAvatarKeys(JSONObject jSONObject) throws JSONException {
        return new AvatarConfig(jSONObject.optBoolean("savtr", false), jSONObject.optBoolean("pagnt", false), jSONObject.optString("af", ""), jSONObject.optBoolean("pbot", false), jSONObject.optString("bf", ""), jSONObject.optString("snn", ""), jSONObject.optString("turl", ""), jSONObject.optInt("ce", AVATAR_IMAGE_CACHE_DEFAULT_INTERVAL));
    }

    private Author parseMessageAuthor(JSONObject jSONObject, boolean z) {
        Author.AuthorRole authorRole;
        try {
            if (z) {
                authorRole = Author.AuthorRole.LOCAL_USER;
            } else {
                authorRole = Author.AuthorRole.SYSTEM;
            }
            if (jSONObject.has("role")) {
                authorRole = Author.AuthorRole.getEnum(jSONObject.getString("role"));
            }
            return new Author(jSONObject.getString("name"), jSONObject.getString("id"), authorRole);
        } catch (JSONException e) {
            throw RootAPIException.wrap(e, ParseException.GENERIC, "Parsing exception while reading author of message");
        }
    }

    private int convertDeliveryStateToInt(String str) {
        str.hashCode();
        if (str.equals("read")) {
            return 1;
        }
        return !str.equals("sent") ? 0 : 2;
    }

    private void parseAndSetDataForUserSentMessages(MessageDM messageDM, JSONObject jSONObject) throws JSONException {
        messageDM.author = parseMessageAuthor(jSONObject.getJSONObject("author"), !(messageDM instanceof ConfirmationRejectedMessageDM));
        messageDM.createdRequestId = jSONObject.optString("request_id");
    }

    @Override // com.helpshift.common.platform.network.ResponseParser
    public String parseErrorMessage(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            return jSONObject.has(NotificationCompat.CATEGORY_MESSAGE) ? jSONObject.getString(NotificationCompat.CATEGORY_MESSAGE) : "";
        } catch (Exception unused) {
            return "";
        }
    }
}
