package com.helpshift.xamarin.support;

import android.app.Activity;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import com.helpshift.HelpshiftUser;
import com.helpshift.conversation.activeconversation.model.ActionType;
import com.helpshift.delegate.AuthenticationFailureReason;
import com.helpshift.support.AlertToRateAppListener;
import com.helpshift.support.Callable;
import com.helpshift.support.Metadata;
import com.helpshift.support.MetadataCallable;
import com.helpshift.support.Support;
import com.helpshift.util.HSJSONUtils;
import com.helpshift.util.HSLogger;
import com.helpshift.util.StringUtils;
import com.helpshift.xamarin.WrappedHelpshiftUser;
import com.helpshift.xamarin.flows.Flow;
import com.helpshift.xamarin.listeners.HelpshiftAlertToRateAppListener;
import com.helpshift.xamarin.util.ConfigParserUtil;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes2.dex */
public class HelpshiftSupport {
    private static final String TAG = "Helpshift_XamSupport";
    private static Delegate xamarinDelegate;

    public interface Delegate {
        void authenticationFailed(WrappedHelpshiftUser wrappedHelpshiftUser, int i);

        void conversationEnded();

        void didCheckIfConversationActive(boolean z);

        void didReceiveNotification(int i);

        void didReceiveUnreadMessagesCount(int i);

        void handleTapOnAttachmentFile(String str);

        void newConversationStarted(String str);

        void sessionBegan();

        void sessionEnded();

        void userClickOnAction(String str, String str2);

        void userCompletedCustomerSatisfactionSurvey(int i, String str);

        void userRepliedToConversation(String str);
    }

    public static Integer getNotificationCount(boolean z) {
        int iIntValue;
        HSLogger.d(TAG, "getNotificationCount : isAsync " + z);
        if (z) {
            Handler requestUnreadMessagesCountHandler = getRequestUnreadMessagesCountHandler();
            Support.getNotificationCount(requestUnreadMessagesCountHandler, requestUnreadMessagesCountHandler);
            iIntValue = 0;
        } else {
            iIntValue = Support.getNotificationCount().intValue();
        }
        return Integer.valueOf(iIntValue);
    }

    public static void getNotificationCount(Handler handler, Handler handler2) {
        Support.getNotificationCount(handler, handler2);
    }

    public static void setUserIdentifier(String str) {
        Support.setUserIdentifier(str);
    }

    public static void leaveBreadCrumb(String str) {
        Support.leaveBreadCrumb(str);
    }

    public static void clearBreadCrumbs() {
        Support.clearBreadCrumbs();
    }

    public static void showConversation(Activity activity) {
        Support.showConversation(activity);
    }

    public static void showConversation(Activity activity, String str) throws JSONException {
        HSLogger.d(TAG, "showConversation : jsonConfig - " + str);
        Support.showConversation(activity, (Map<String, Object>) ConfigParserUtil.parseConfigDictionary(activity.getApplicationContext(), str));
    }

    public static void showConversation(Activity activity, HelpshiftAPIConfig helpshiftAPIConfig) {
        Support.showConversation(activity, ConfigParserUtil.buildApiConfig(helpshiftAPIConfig));
    }

    public static void showFAQSection(Activity activity, String str) {
        Support.showFAQSection(activity, str);
    }

    public static void showFAQSection(Activity activity, String str, String str2) throws JSONException {
        HSLogger.d(TAG, "showFAQSection : sectionPublishId - " + str + "\njsonConfig - " + str2);
        Support.showFAQSection(activity, str, (Map<String, Object>) ConfigParserUtil.parseConfigDictionary(activity.getApplicationContext(), str2));
    }

    public static void showFAQSection(Activity activity, String str, HelpshiftAPIConfig helpshiftAPIConfig) {
        Support.showFAQSection(activity, str, ConfigParserUtil.buildApiConfig(helpshiftAPIConfig));
    }

    public static void showSingleFAQ(Activity activity, String str) {
        Support.showSingleFAQ(activity, str);
    }

    public static void showSingleFAQ(Activity activity, String str, String str2) throws JSONException {
        HSLogger.d(TAG, "showSingleFAQ : questionPublishId - " + str + "\njsonConfig - " + str2);
        Support.showSingleFAQ(activity, str, (Map<String, Object>) ConfigParserUtil.parseConfigDictionary(activity.getApplicationContext(), str2));
    }

    public static void showSingleFAQ(Activity activity, String str, HelpshiftAPIConfig helpshiftAPIConfig) {
        Support.showSingleFAQ(activity, str, ConfigParserUtil.buildApiConfig(helpshiftAPIConfig));
    }

    public static void showFAQs(Activity activity) {
        Support.showFAQs(activity);
    }

    public static void showFAQs(Activity activity, String str) throws JSONException {
        HSLogger.d(TAG, "showFAQs : jsonConfig - " + str);
        Support.showFAQs(activity, (Map<String, Object>) ConfigParserUtil.parseConfigDictionary(activity.getApplicationContext(), str));
    }

    public static void showFAQs(Activity activity, HelpshiftAPIConfig helpshiftAPIConfig) {
        Support.showFAQs(activity, ConfigParserUtil.buildApiConfig(helpshiftAPIConfig));
    }

    public static void showDynamicForm(Activity activity, String str, String str2) throws JSONException {
        HSLogger.d(TAG, "showDynamicForm : jsonFlowsString - " + str2);
        try {
            JSONArray jSONArray = new JSONArray(str2);
            ArrayList arrayList = new ArrayList();
            for (int i = 0; i < jSONArray.length(); i++) {
                arrayList.add(HSJSONUtils.toMap(jSONArray.getJSONObject(i)));
            }
            Support.showDynamicForm(activity, str, ConfigParserUtil.parseFlowList(activity.getApplicationContext(), arrayList));
        } catch (JSONException e) {
            HSLogger.d(TAG, "showDynamicForm : JSON Exception in parsing dynamic form data :", e);
        }
    }

    public static void showDynamicForm(Activity activity, String str, List<Flow> list) {
        Support.showDynamicForm(activity, str, ConfigParserUtil.buildFlows(list));
    }

    public static void setMetadataCallback(final HelpshiftCallable helpshiftCallable) {
        Callable callable = new Callable() { // from class: com.helpshift.xamarin.support.HelpshiftSupport.1
            @Override // com.helpshift.meta.RootMetaDataCallable
            public HashMap call() {
                return helpshiftCallable.call();
            }
        };
        HSLogger.d(TAG, "setMetadataCallback : register Callable " + callable + " for delegating calls to HelpshiftCallable " + helpshiftCallable);
        Support.setMetadataCallback(callable);
    }

    public static void showAlertToRateApp(String str, final HelpshiftAlertToRateAppListener helpshiftAlertToRateAppListener) {
        AlertToRateAppListener alertToRateAppListener = new AlertToRateAppListener() { // from class: com.helpshift.xamarin.support.HelpshiftSupport.2
            @Override // com.helpshift.support.AlertToRateAppListener
            public void onAction(int i) {
                helpshiftAlertToRateAppListener.onAction(i);
            }
        };
        HSLogger.d(TAG, "showAlertToRateApp : register AlertToRateAppListener " + alertToRateAppListener + " for delegating calls to HelpshiftAlertToRateAppListener " + helpshiftAlertToRateAppListener);
        Support.showAlertToRateApp(str, alertToRateAppListener);
    }

    public static Delegate getDelegate() {
        return xamarinDelegate;
    }

    public static void setDelegate(final Delegate delegate) {
        Support.Delegate delegate2 = new Support.Delegate() { // from class: com.helpshift.xamarin.support.HelpshiftSupport.3
            @Override // com.helpshift.delegate.RootDelegate
            public void sessionBegan() {
                delegate.sessionBegan();
            }

            @Override // com.helpshift.delegate.RootDelegate
            public void sessionEnded() {
                delegate.sessionEnded();
            }

            @Override // com.helpshift.delegate.RootDelegate
            public void newConversationStarted(String str) {
                delegate.newConversationStarted(str);
            }

            @Override // com.helpshift.delegate.RootDelegate
            public void conversationEnded() {
                delegate.conversationEnded();
            }

            @Override // com.helpshift.delegate.RootDelegate
            public void userRepliedToConversation(String str) {
                delegate.userRepliedToConversation(str);
            }

            @Override // com.helpshift.delegate.RootDelegate
            public void userCompletedCustomerSatisfactionSurvey(int i, String str) {
                delegate.userCompletedCustomerSatisfactionSurvey(i, str);
            }

            @Override // com.helpshift.delegate.RootDelegate
            public void displayAttachmentFile(File file) {
                try {
                    String canonicalPath = file.getCanonicalPath();
                    if (StringUtils.isEmpty(canonicalPath)) {
                        return;
                    }
                    delegate.handleTapOnAttachmentFile(canonicalPath);
                } catch (IOException unused) {
                    HSLogger.e(HelpshiftSupport.TAG, "Unable to retrieve filePath from File object");
                }
            }

            @Override // com.helpshift.support.Support.Delegate
            public void displayAttachmentFile(Uri uri) {
                if (uri != null) {
                    String string = uri.toString();
                    if (StringUtils.isEmpty(string)) {
                        return;
                    }
                    delegate.handleTapOnAttachmentFile(string);
                }
            }

            @Override // com.helpshift.delegate.RootDelegate
            public void didReceiveNotification(int i) {
                delegate.didReceiveNotification(i);
            }

            @Override // com.helpshift.delegate.RootDelegate
            public void authenticationFailed(HelpshiftUser helpshiftUser, AuthenticationFailureReason authenticationFailureReason) {
                delegate.authenticationFailed(new WrappedHelpshiftUser(helpshiftUser.getIdentifier(), helpshiftUser.getEmail(), helpshiftUser.getName(), helpshiftUser.getAuthToken()), authenticationFailureReason.getValue());
            }

            @Override // com.helpshift.delegate.RootDelegate
            public void userClickOnAction(ActionType actionType, String str) {
                delegate.userClickOnAction(actionType.getValue(), str);
            }
        };
        xamarinDelegate = delegate;
        HSLogger.d(TAG, "setDelegate : register Support.Delegate " + delegate2 + " for delegating calls to Delegate " + delegate);
        Support.setDelegate(delegate2);
    }

    public static void setSDKLanguage(String str) {
        Support.setSDKLanguage(str);
    }

    public static void setMetadata(HelpshiftSupportMetadata helpshiftSupportMetadata) {
        final Metadata metadataBuildMetadata = ConfigParserUtil.buildMetadata(helpshiftSupportMetadata);
        Support.setMetadataCallback(new MetadataCallable() { // from class: com.helpshift.xamarin.support.HelpshiftSupport.4
            @Override // com.helpshift.support.MetadataCallable
            public Metadata call() {
                return metadataBuildMetadata;
            }
        });
    }

    public static void setMetaData(String str) {
        HSLogger.d(TAG, "setMetaData : jsonMetaData - " + str);
        if (str == null || str.length() == 0) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            JSONArray jSONArray = jSONObject.getJSONArray(Support.TagsKey);
            jSONObject.remove(Support.TagsKey);
            JSONArray jSONArray2 = new JSONArray();
            for (int i = 0; i < jSONArray.length(); i++) {
                String string = jSONArray.getString(i);
                if (string != null && !string.equals("null")) {
                    jSONArray2.put(string);
                }
            }
            HashMap<String, Object> map = HSJSONUtils.toMap(jSONObject);
            List list = HSJSONUtils.toList(jSONArray2);
            Support.setMetadataCallback(new XamarinMetaDataCallable(map, list != null ? (String[]) list.toArray(new String[0]) : null));
        } catch (JSONException e) {
            HSLogger.d(TAG, "setMetaData: Exception in processing tags " + e);
        } catch (Exception e2) {
            HSLogger.d(TAG, "setMetaData : Error setting meta data : " + e2.getMessage());
        }
    }

    public static boolean isConversationActive() {
        return Support.isConversationActive();
    }

    public static void checkIfConversationActive() {
        Delegate delegate = xamarinDelegate;
        if (delegate != null) {
            delegate.didCheckIfConversationActive(Support.isConversationActive());
        }
    }

    public static void requestUnreadMessagesCount(boolean z) {
        Delegate delegate = xamarinDelegate;
        if (delegate == null) {
            return;
        }
        if (!z) {
            delegate.didReceiveUnreadMessagesCount(Support.getNotificationCount().intValue());
        } else {
            Handler requestUnreadMessagesCountHandler = getRequestUnreadMessagesCountHandler();
            Support.getNotificationCount(requestUnreadMessagesCountHandler, requestUnreadMessagesCountHandler);
        }
    }

    private static Handler getRequestUnreadMessagesCountHandler() {
        return new Handler() { // from class: com.helpshift.xamarin.support.HelpshiftSupport.5
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                Bundle bundle;
                super.handleMessage(message);
                if (message == null || (bundle = (Bundle) message.obj) == null) {
                    return;
                }
                int i = bundle.getInt("value");
                if (HelpshiftSupport.xamarinDelegate != null) {
                    HelpshiftSupport.xamarinDelegate.didReceiveUnreadMessagesCount(i);
                }
            }
        };
    }
}
