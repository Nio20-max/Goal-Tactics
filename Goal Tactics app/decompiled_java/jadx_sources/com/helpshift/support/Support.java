package com.helpshift.support;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import com.helpshift.Core;
import com.helpshift.HelpshiftUser;
import com.helpshift.delegate.RootDelegate;
import com.helpshift.executors.ActionExecutor;
import com.helpshift.support.SupportInternal;
import com.helpshift.support.flows.Flow;
import com.helpshift.support.fragments.SupportFragment;
import com.helpshift.support.util.ConfigUtil;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.concurrent.ApiExecutorFactory;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class Support implements Core.ApiProvider {
    public static final String CONVERSATION_FLOW = "conversationFlow";
    public static final String CustomIssueFieldKey = "hs-custom-issue-field";
    public static final String CustomMetadataKey = "hs-custom-metadata";
    public static final String DYNAMIC_FORM_FLOW = "dynamicFormFlow";
    public static final String FAQS_FLOW = "faqsFlow";
    public static final String FAQ_SECTION_FLOW = "faqSectionFlow";
    public static final String SINGLE_FAQ_FLOW = "singleFaqFlow";
    public static final String TAG = "HelpShiftDebug";
    public static final String TagsKey = "hs-tags";
    public static final String UserAcceptedTheSolution = "User accepted the solution";
    public static final String UserRejectedTheSolution = "User rejected the solution";
    public static final String UserReviewedTheApp = "User reviewed the app";
    public static final String UserSentScreenShot = "User sent a screenshot";
    public static final String libraryVersion = "7.11.1";

    public interface Delegate extends RootDelegate {
        void displayAttachmentFile(Uri uri);
    }

    public static class EnableContactUs extends SupportInternal.EnableContactUs {
    }

    public static class RateAlert extends SupportInternal.RateAlert {
    }

    @Override // com.helpshift.Core.ApiProvider
    public ActionExecutor _getActionExecutor() {
        return null;
    }

    private Support() {
    }

    public static Support getInstance() {
        return LazyHolder.INSTANCE;
    }

    public static Integer getNotificationCount() {
        if (!HelpshiftContext.verifyInstall()) {
            return -1;
        }
        ApiExecutorFactory.getHandlerExecutor().awaitForSyncExecution();
        return SupportInternal.getNotificationCount();
    }

    public static void getNotificationCount(final Handler handler, final Handler handler2) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.support.Support.1
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.getNotificationCount(handler, handler2);
                }
            });
        }
    }

    @Deprecated
    public static void setUserIdentifier(final String str) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.support.Support.2
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.setUserIdentifier(str);
                }
            });
        }
    }

    public static void leaveBreadCrumb(final String str) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.support.Support.3
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.leaveBreadCrumb(str);
                }
            });
        }
    }

    public static void clearBreadCrumbs() {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.support.Support.4
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.clearBreadCrumbs();
                }
            });
        }
    }

    public static boolean isConversationActive() {
        if (!HelpshiftContext.verifyInstall()) {
            return false;
        }
        ApiExecutorFactory.getHandlerExecutor().awaitForSyncExecution();
        return SupportInternal.isConversationActive();
    }

    public static void showConversation(Activity activity) {
        showConversation(activity, new HashMap());
    }

    @Deprecated
    public static void showConversation(final Activity activity, final Map<String, Object> map) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runOnUiThread(new Runnable() { // from class: com.helpshift.support.Support.5
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.showConversation(activity, map);
                }
            });
        }
    }

    public static void showConversation(Activity activity, ApiConfig apiConfig) {
        showConversation(activity, ConfigUtil.validateAndConvertToMap(apiConfig));
    }

    public static void showFAQSection(Activity activity, String str) {
        showFAQSection(activity, str, new HashMap());
    }

    @Deprecated
    public static void showFAQSection(final Activity activity, final String str, final Map<String, Object> map) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runOnUiThread(new Runnable() { // from class: com.helpshift.support.Support.6
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.showFAQSection(activity, str, map);
                }
            });
        }
    }

    public static void showFAQSection(Activity activity, String str, ApiConfig apiConfig) {
        if (HelpshiftContext.verifyInstall()) {
            showFAQSection(activity, str, ConfigUtil.validateAndConvertToMap(apiConfig));
        }
    }

    public static void showSingleFAQ(Activity activity, String str) {
        showSingleFAQ(activity, str, new HashMap());
    }

    @Deprecated
    public static void showSingleFAQ(final Activity activity, final String str, final Map<String, Object> map) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runOnUiThread(new Runnable() { // from class: com.helpshift.support.Support.7
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.showSingleFAQ(activity, str, map);
                }
            });
        }
    }

    public static void showSingleFAQ(Activity activity, String str, ApiConfig apiConfig) {
        showSingleFAQ(activity, str, ConfigUtil.validateAndConvertToMap(apiConfig));
    }

    public static void showFAQs(Activity activity) {
        showFAQs(activity, new HashMap());
    }

    @Deprecated
    public static void showFAQs(final Activity activity, final Map<String, Object> map) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runOnUiThread(new Runnable() { // from class: com.helpshift.support.Support.8
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.showFAQs(activity, map);
                }
            });
        }
    }

    public static void showFAQs(Activity activity, ApiConfig apiConfig) {
        showFAQs(activity, ConfigUtil.validateAndConvertToMap(apiConfig));
    }

    @Deprecated
    public static void setMetadataCallback(final Callable callable) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.support.Support.9
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.setMetadataCallback(callable);
                }
            });
        }
    }

    public static void setMetadataCallback(final MetadataCallable metadataCallable) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.support.Support.10
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.setMetadataCallback(metadataCallable);
                }
            });
        }
    }

    public static void showAlertToRateApp(final String str, final AlertToRateAppListener alertToRateAppListener) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runOnUiThread(new Runnable() { // from class: com.helpshift.support.Support.11
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.showAlertToRateApp(str, alertToRateAppListener);
                }
            });
        }
    }

    public static void setDelegate(final Delegate delegate) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.support.Support.12
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.setDelegate(delegate);
                }
            });
        }
    }

    public static void setSDKLanguage(final String str) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.support.Support.13
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.setSDKLanguage(str);
                }
            });
        }
    }

    public static void showDynamicForm(Activity activity, List<Flow> list) {
        showDynamicForm(activity, "", list);
    }

    public static void showDynamicForm(final Activity activity, final String str, final List<Flow> list) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runOnUiThread(new Runnable() { // from class: com.helpshift.support.Support.14
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.showDynamicForm(activity, str, list);
                }
            });
        }
    }

    public static SupportFragment getFAQsFragment(Activity activity) {
        return getFAQsFragment(activity, new HashMap());
    }

    @Deprecated
    public static SupportFragment getFAQsFragment(Activity activity, Map<String, Object> map) {
        if (!HelpshiftContext.verifyInstall()) {
            return null;
        }
        ApiExecutorFactory.getHandlerExecutor().awaitForSyncExecution();
        return SupportInternal.getFAQsFragment(activity, map);
    }

    public static SupportFragment getFAQsFragment(Activity activity, ApiConfig apiConfig) {
        return getFAQsFragment(activity, ConfigUtil.validateAndConvertToMap(apiConfig));
    }

    public static SupportFragment getConversationFragment(Activity activity) {
        return getConversationFragment(activity, new HashMap());
    }

    @Deprecated
    public static SupportFragment getConversationFragment(Activity activity, Map<String, Object> map) {
        if (!HelpshiftContext.verifyInstall()) {
            return null;
        }
        ApiExecutorFactory.getHandlerExecutor().awaitForSyncExecution();
        return SupportInternal.getConversationFragment(activity, map);
    }

    public static SupportFragment getConversationFragment(Activity activity, ApiConfig apiConfig) {
        return getConversationFragment(activity, ConfigUtil.validateAndConvertToMap(apiConfig));
    }

    public static SupportFragment getFAQSectionFragment(Activity activity, String str) {
        return getFAQSectionFragment(activity, str, new HashMap());
    }

    @Deprecated
    public static SupportFragment getFAQSectionFragment(Activity activity, String str, Map<String, Object> map) {
        if (!HelpshiftContext.verifyInstall()) {
            return null;
        }
        ApiExecutorFactory.getHandlerExecutor().awaitForSyncExecution();
        return SupportInternal.getFAQSectionFragment(activity, str, map);
    }

    public static SupportFragment getFAQSectionFragment(Activity activity, String str, ApiConfig apiConfig) {
        return getFAQSectionFragment(activity, str, ConfigUtil.validateAndConvertToMap(apiConfig));
    }

    public static SupportFragment getSingleFAQFragment(Activity activity, String str) {
        return getSingleFAQFragment(activity, str, new HashMap());
    }

    @Deprecated
    public static SupportFragment getSingleFAQFragment(Activity activity, String str, Map<String, Object> map) {
        if (!HelpshiftContext.verifyInstall()) {
            return null;
        }
        ApiExecutorFactory.getHandlerExecutor().awaitForSyncExecution();
        return SupportInternal.getSingleFAQFragment(activity, str, map);
    }

    public static SupportFragment getSingleFAQFragment(Activity activity, String str, ApiConfig apiConfig) {
        return getSingleFAQFragment(activity, str, ConfigUtil.validateAndConvertToMap(apiConfig));
    }

    public static SupportFragment getDynamicFormFragment(Activity activity, List<Flow> list) {
        return getDynamicFormFragment(activity, "", list, new HashMap());
    }

    public static SupportFragment getDynamicFormFragment(Activity activity, String str, List<Flow> list) {
        return getDynamicFormFragment(activity, str, list, new HashMap());
    }

    @Deprecated
    public static SupportFragment getDynamicFormFragment(Activity activity, List<Flow> list, Map<String, Object> map) {
        return getDynamicFormFragment(activity, "", list, map);
    }

    public static SupportFragment getDynamicFormFragment(Activity activity, List<Flow> list, ApiConfig apiConfig) {
        return getDynamicFormFragment(activity, "", list, ConfigUtil.validateAndConvertToMap(apiConfig));
    }

    public static SupportFragment getDynamicFormFragment(Activity activity, String str, List<Flow> list, ApiConfig apiConfig) {
        return getDynamicFormFragment(activity, str, list, ConfigUtil.validateAndConvertToMap(apiConfig));
    }

    private static SupportFragment getDynamicFormFragment(Activity activity, String str, List<Flow> list, Map<String, Object> map) {
        if (!HelpshiftContext.verifyInstall()) {
            return null;
        }
        ApiExecutorFactory.getHandlerExecutor().awaitForSyncExecution();
        return SupportInternal.getDynamicFormFragment(activity, str, list, map);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _preInstall(Application application, String str, String str2, String str3, Map<String, Object> map) {
        SupportInternal.preInstall(application, str, str2, str3, map);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _install(Application application, String str, String str2, String str3) {
        SupportInternal.install(application, str, str2, str3);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _install(Application application, String str, String str2, String str3, Map<String, Object> map) {
        SupportInternal.install(application, str, str2, str3, map);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _setNameAndEmail(String str, String str2) {
        SupportInternal.setNameAndEmail(str, str2);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _registerDeviceToken(Context context, String str) {
        SupportInternal.registerDeviceToken(context, str);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _handlePush(Context context, Intent intent) {
        SupportInternal.handlePush(context, intent);
    }

    @Override // com.helpshift.Core.ApiProvider
    public boolean _login(HelpshiftUser helpshiftUser) {
        return SupportInternal.login(helpshiftUser);
    }

    @Override // com.helpshift.Core.ApiProvider
    public boolean _logout() {
        return SupportInternal.logout();
    }

    @Override // com.helpshift.Core.ApiProvider
    public boolean _clearAnonymousUser() {
        return SupportInternal.clearAnonymousUser();
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _setSDKLanguage(String str) {
        setSDKLanguage(str);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _setTheme(final int i) {
        if (HelpshiftContext.verifyInstall()) {
            ApiExecutorFactory.getHandlerExecutor().runAsync(new Runnable() { // from class: com.helpshift.support.Support.15
                @Override // java.lang.Runnable
                public void run() {
                    SupportInternal.setTheme(i);
                }
            });
        }
    }

    private static class LazyHolder {
        static final Support INSTANCE = new Support();

        private LazyHolder() {
        }
    }
}
