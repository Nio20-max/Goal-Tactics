package com.helpshift.support.controllers;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import com.helpshift.CoreApi;
import com.helpshift.R;
import com.helpshift.analytics.AnalyticsEventKey;
import com.helpshift.analytics.AnalyticsEventType;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.domainmodel.ConversationSetupDM;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.conversation.dto.ConversationDetailDTO;
import com.helpshift.support.contracts.AttachmentPreviewListener;
import com.helpshift.support.contracts.SearchResultListener;
import com.helpshift.support.contracts.SupportScreenView;
import com.helpshift.support.conversations.AuthenticationFailureFragment;
import com.helpshift.support.conversations.BaseConversationFragment;
import com.helpshift.support.conversations.ConversationalFragment;
import com.helpshift.support.conversations.NewConversationFragment;
import com.helpshift.support.conversations.usersetup.ConversationSetupFragment;
import com.helpshift.support.flows.CustomContactUsFlowListHolder;
import com.helpshift.support.flows.DynamicFormFlowListHolder;
import com.helpshift.support.flows.Flow;
import com.helpshift.support.fragments.AttachmentPreviewFragment;
import com.helpshift.support.fragments.DynamicFormFragment;
import com.helpshift.support.fragments.FaqFlowFragment;
import com.helpshift.support.fragments.SearchResultFragment;
import com.helpshift.support.fragments.SingleQuestionFragment;
import com.helpshift.support.fragments.SupportFragment;
import com.helpshift.support.fragments.SupportFragmentConstants;
import com.helpshift.support.util.FragmentUtil;
import com.helpshift.support.util.Styles;
import com.helpshift.support.util.SupportNotification;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class SupportController implements SearchResultListener, AttachmentPreviewListener {
    private static final String TAG = "Helpshift_SupportContr";
    private final Bundle bundle;
    private final Context context;
    private boolean conversationAddToBackStack;
    private Bundle conversationBundle;
    private FragmentManager fragmentManager;
    private boolean isControllerStarted;
    private String sourceSearchQuery;
    private int supportMode;
    private final SupportScreenView supportScreenView;
    private final String KEY_SUPPORT_CONTROLLER_STARTED_STATE = "key_support_controller_started";
    private final String KEY_CONVERSATION_BUNDLE = "key_conversation_bundle";
    private final String KEY_CONVERSATION_ADD_TO_BACK_STACK = "key_conversation_add_to_back_stack";
    private boolean searchPerformed = false;

    public SupportController(Context context, SupportScreenView supportScreenView, FragmentManager fragmentManager, Bundle bundle) {
        this.context = context;
        this.supportScreenView = supportScreenView;
        this.fragmentManager = fragmentManager;
        this.bundle = bundle;
    }

    public void onFragmentManagerUpdate(FragmentManager fragmentManager) {
        this.fragmentManager = fragmentManager;
    }

    public void setSearchPerformed(boolean z) {
        this.searchPerformed = z;
    }

    public void start() {
        if (!this.isControllerStarted) {
            int i = this.bundle.getInt(SupportFragment.SUPPORT_MODE, 0);
            this.supportMode = i;
            if (i == 1) {
                startConversationFlow(this.bundle, false);
            } else if (i == 4) {
                startDynamicForm(DynamicFormFlowListHolder.getFlowList(), false);
            } else {
                startFaqFlow(this.bundle, false, CustomContactUsFlowListHolder.getFlowList());
            }
        }
        this.isControllerStarted = true;
    }

    private void replaceConversationFlow(Bundle bundle) {
        Long lValueOf = Long.valueOf(bundle.getLong(SupportNotification.BUNGLE_ARG_NOTIFICATION_CONVERSATION_ID));
        Bundle bundle2 = this.conversationBundle;
        boolean zEquals = lValueOf.equals(bundle2 != null ? Long.valueOf(bundle2.getLong(ConversationalFragment.BUNDLE_ARG_CONVERSATION_LOCAL_ID)) : null);
        boolean z = true;
        boolean z2 = !zEquals;
        List<Fragment> fragments = this.fragmentManager.getFragments();
        if (z2) {
            clearConversationStack();
        } else if (fragments.size() > 0) {
            Fragment fragment = fragments.get(fragments.size() - 1);
            if (fragment instanceof AttachmentPreviewFragment) {
                return;
            } else {
                z = true ^ (fragment instanceof BaseConversationFragment);
            }
        }
        if (z) {
            this.conversationBundle = bundle;
            startConversationFlow();
        }
    }

    public void startConversationFlow(Bundle bundle, boolean z) {
        this.conversationAddToBackStack = z;
        this.conversationBundle = bundle;
        startConversationFlow();
    }

    public void startConversationFlow() {
        startConversationFlow(new HashMap());
    }

    public void startConversationFlow(Map<String, Boolean> map) {
        CoreApi coreApi = HelpshiftContext.getCoreApi();
        int i = AnonymousClass1.$SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState[new ConversationSetupDM(HelpshiftContext.getPlatform(), coreApi.getConfigFetchDM(), coreApi.getUserManagerDM().getActiveUserSetupDM()).getState().ordinal()];
        if (i == 1 || i == 2 || i == 3) {
            showConversationSetupFragment();
        } else {
            if (i != 4) {
                return;
            }
            startConversationFlowInternal(map);
        }
    }

    /* JADX INFO: renamed from: com.helpshift.support.controllers.SupportController$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState;

        static {
            int[] iArr = new int[ConversationSetupDM.ConversationSetupState.values().length];
            $SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState = iArr;
            try {
                iArr[ConversationSetupDM.ConversationSetupState.NOT_STARTED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState[ConversationSetupDM.ConversationSetupState.IN_PROGRESS.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState[ConversationSetupDM.ConversationSetupState.FAILED.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState[ConversationSetupDM.ConversationSetupState.COMPLETED.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }

    private void startConversationFlowInternal(Map<String, Boolean> map) {
        String name;
        Conversation activeConversationOrPreIssue;
        if (this.conversationBundle == null) {
            this.conversationBundle = this.bundle;
        }
        boolean z = HelpshiftContext.getCoreApi().getSDKConfigurationDM().getBoolean(SDKConfigurationDM.DISABLE_IN_APP_CONVERSATION);
        Long l = null;
        if (HelpshiftContext.getCoreApi().getSDKConfigurationDM().shouldShowConversationHistory() && !z) {
            showConversationFragment(true, null, map);
            return;
        }
        long j = this.conversationBundle.getLong(SupportNotification.BUNGLE_ARG_NOTIFICATION_CONVERSATION_ID, 0L);
        if (j != 0) {
            this.conversationBundle.remove(SupportNotification.BUNGLE_ARG_NOTIFICATION_CONVERSATION_ID);
            if (HelpshiftContext.getCoreApi().getConversationController().shouldOpenConversationFromNotification(j)) {
                showConversationFragment(false, Long.valueOf(j), map);
                return;
            }
        }
        if (!z && (activeConversationOrPreIssue = HelpshiftContext.getCoreApi().getActiveConversationOrPreIssue()) != null) {
            l = activeConversationOrPreIssue.localId;
        }
        if (l == null) {
            List<Flow> flowList = CustomContactUsFlowListHolder.getFlowList();
            if (flowList == null || flowList.isEmpty()) {
                showNewConversationFragment();
                return;
            }
            FragmentManager.BackStackEntry backStackEntryAt = getFragmentManager().getBackStackEntryAt(this.fragmentManager.getBackStackEntryCount() - 1);
            if (backStackEntryAt != null && (name = backStackEntryAt.getName()) != null && name.equals(ConversationalFragment.class.getName())) {
                FragmentUtil.popBackStackImmediate(this.fragmentManager, name);
            }
            startDynamicForm(flowList, true);
            return;
        }
        showConversationFragment(false, l, map);
    }

    public void onAuthenticationFailure() {
        showAuthenticationFailureFragment();
    }

    private void showAuthenticationFailureFragment() {
        HSLogger.d(TAG, "Starting authentication failure fragment");
        AuthenticationFailureFragment authenticationFailureFragmentNewInstance = AuthenticationFailureFragment.newInstance();
        String name = this.conversationAddToBackStack ? authenticationFailureFragmentNewInstance.getClass().getName() : null;
        clearConversationStack();
        FragmentUtil.startFragment(this.fragmentManager, R.id.flow_fragment_container, authenticationFailureFragmentNewInstance, AuthenticationFailureFragment.FRAGMENT_TAG, name, false, false);
    }

    public void showConversationSetupFragment() {
        String name;
        HSLogger.d(TAG, "Starting conversation setup fragment.");
        ConversationSetupFragment conversationSetupFragmentNewInstance = ConversationSetupFragment.newInstance();
        if (this.conversationAddToBackStack) {
            name = conversationSetupFragmentNewInstance.getClass().getName();
            clearConversationStack();
        } else {
            name = null;
        }
        FragmentUtil.startFragment(this.fragmentManager, R.id.flow_fragment_container, conversationSetupFragmentNewInstance, ConversationSetupFragment.FRAGMENT_TAG, name, false, false);
    }

    public void startFaqFlow(Bundle bundle, boolean z, List<Flow> list) {
        if (isDuplicateFAQScreenAlreadyOpen(bundle)) {
            return;
        }
        FragmentUtil.startFragment(this.fragmentManager, R.id.flow_fragment_container, FaqFlowFragment.newInstance(bundle, list), FaqFlowFragment.FRAGMENT_TAG, z ? FaqFlowFragment.class.getName() : null, false, false);
    }

    private boolean isDuplicateFAQScreenAlreadyOpen(Bundle bundle) {
        FaqFlowController faqFlowController;
        Fragment topMostFragment = FragmentUtil.getTopMostFragment(this.fragmentManager);
        if (!(topMostFragment instanceof FaqFlowFragment) || (faqFlowController = ((FaqFlowFragment) topMostFragment).getFaqFlowController()) == null) {
            return false;
        }
        Fragment topMostFaqFragment = faqFlowController.getTopMostFaqFragment();
        if (!(topMostFaqFragment instanceof SingleQuestionFragment)) {
            return true;
        }
        String string = bundle.getString(SingleQuestionFragment.BUNDLE_ARG_QUESTION_PUBLISH_ID);
        return string != null && string.equals(((SingleQuestionFragment) topMostFaqFragment).getQuestionPublishId());
    }

    private void showNewConversationFragment() {
        String name;
        HSLogger.d(TAG, "Starting new conversation fragment");
        this.conversationBundle.putBoolean(NewConversationFragment.SEARCH_PERFORMED, this.searchPerformed);
        this.conversationBundle.putString(NewConversationFragment.SOURCE_SEARCH_QUERY, this.sourceSearchQuery);
        NewConversationFragment newConversationFragmentNewInstance = NewConversationFragment.newInstance(this.conversationBundle);
        if (this.conversationAddToBackStack) {
            name = newConversationFragmentNewInstance.getClass().getName();
            clearConversationStack();
        } else {
            name = null;
        }
        FragmentUtil.startFragment(this.fragmentManager, R.id.flow_fragment_container, newConversationFragmentNewInstance, NewConversationFragment.FRAGMENT_TAG, name, false, false);
    }

    private void showConversationFragment(boolean z, Long l, Map<String, Boolean> map) {
        HSLogger.d(TAG, "Starting conversation fragment: " + l);
        if (!z) {
            if (l == null) {
                return;
            } else {
                this.conversationBundle.putLong(ConversationalFragment.BUNDLE_ARG_CONVERSATION_LOCAL_ID, l.longValue());
            }
        }
        this.conversationBundle.putBoolean(ConversationalFragment.BUNDLE_ARG_SHOW_CONVERSATION_HISTORY, z);
        for (String str : map.keySet()) {
            this.conversationBundle.putBoolean(str, map.get(str).booleanValue());
        }
        ConversationalFragment conversationalFragmentNewInstance = ConversationalFragment.newInstance(this.conversationBundle);
        String name = null;
        if (this.conversationAddToBackStack) {
            name = conversationalFragmentNewInstance.getClass().getName();
            clearConversationStack();
        }
        FragmentUtil.startFragment(this.fragmentManager, R.id.flow_fragment_container, conversationalFragmentNewInstance, ConversationalFragment.FRAGMENT_TAG, name, false, false);
    }

    public void showConversationSearchResultFragment(Bundle bundle) {
        FragmentUtil.startFragmentWithBackStack(this.fragmentManager, R.id.flow_fragment_container, SearchResultFragment.newInstance(bundle, this), SearchResultFragment.FRAGMENT_TAG, false);
    }

    public void startScreenshotPreviewFragment(AttachmentPickerFile attachmentPickerFile, Bundle bundle, AttachmentPreviewFragment.LaunchSource launchSource) {
        AttachmentPreviewFragment screenshotPreviewFragment = FragmentUtil.getScreenshotPreviewFragment(getFragmentManager());
        if (screenshotPreviewFragment == null) {
            screenshotPreviewFragment = AttachmentPreviewFragment.newInstance(this);
            FragmentUtil.startFragmentWithBackStack(getFragmentManager(), R.id.flow_fragment_container, screenshotPreviewFragment, AttachmentPreviewFragment.FRAGMENT_TAG, false);
        }
        screenshotPreviewFragment.setParams(bundle, attachmentPickerFile, launchSource);
    }

    public void startDynamicForm(List<Flow> list, boolean z) {
        FragmentUtil.startFragment(this.fragmentManager, R.id.flow_fragment_container, DynamicFormFragment.newInstance(this.bundle, list, this), DynamicFormFragment.FRAGMENT_TAG, z ? DynamicFormFragment.class.getName() : null, false, false);
    }

    public void startDynamicForm(String str, List<Flow> list, boolean z) {
        Bundle bundle = this.bundle;
        if (bundle != null) {
            bundle.putString(SupportFragmentConstants.FLOW_TITLE, str);
        }
        startDynamicForm(list, z);
    }

    public void startDynamicForm(int i, List<Flow> list, boolean z) {
        Bundle bundle = this.bundle;
        if (bundle != null && i != 0) {
            bundle.putString(SupportFragmentConstants.FLOW_TITLE, this.context.getResources().getString(i));
        }
        startDynamicForm(list, z);
    }

    public int getSupportMode() {
        return this.supportMode;
    }

    public FragmentManager getFragmentManager() {
        return this.fragmentManager;
    }

    public void onContactUsClicked(String str) {
        if (handleCustomContactUsFlows()) {
            return;
        }
        if (!TextUtils.isEmpty(str)) {
            this.sourceSearchQuery = str;
        }
        startConversationFlow(this.bundle, true);
    }

    private boolean handleCustomContactUsFlows() {
        FaqFlowFragment faqFlowFragment;
        List<Flow> customContactUsFlows;
        if (HelpshiftContext.getCoreApi().getActiveConversation() != null || (faqFlowFragment = FragmentUtil.getFaqFlowFragment(this.fragmentManager)) == null || (customContactUsFlows = faqFlowFragment.getCustomContactUsFlows()) == null || customContactUsFlows.isEmpty()) {
            return false;
        }
        startDynamicForm(customContactUsFlows, true);
        return true;
    }

    public void actionDone() {
        sendTicketAvoidedEvent();
        Long localId = HelpshiftContext.getCoreApi().getUserManagerDM().getActiveUser().getLocalId();
        HelpshiftContext.getPlatform().getConversationInboxDAO().saveDescriptionDetail(localId.longValue(), new ConversationDetailDTO("", System.nanoTime(), 0));
        HelpshiftContext.getPlatform().getConversationInboxDAO().saveImageAttachment(localId.longValue(), null);
        if (getSupportMode() == 1) {
            this.supportScreenView.exitSdkSession();
        } else {
            FragmentUtil.popBackStackImmediate(getFragmentManager(), NewConversationFragment.class.getName());
        }
    }

    private void sendTicketAvoidedEvent() {
        SingleQuestionFragment singleQuestionFragment = FragmentUtil.getSingleQuestionFragment(this.fragmentManager);
        if (singleQuestionFragment != null) {
            String questionId = singleQuestionFragment.getQuestionId();
            if (TextUtils.isEmpty(questionId)) {
                return;
            }
            HashMap map = new HashMap();
            map.put("id", questionId);
            ConversationDetailDTO descriptionDetail = HelpshiftContext.getPlatform().getConversationInboxDAO().getDescriptionDetail(HelpshiftContext.getCoreApi().getUserManagerDM().getActiveUser().getLocalId().longValue());
            if (descriptionDetail != null) {
                map.put(AnalyticsEventKey.STR, descriptionDetail.title);
            }
            HelpshiftContext.getCoreApi().getAnalyticsEventDM().pushEvent(AnalyticsEventType.TICKET_AVOIDED, map);
        }
    }

    @Override // com.helpshift.support.contracts.SearchResultListener
    public void onQuestionSelected(String str, ArrayList<String> arrayList) {
        boolean zIsTablet = Styles.isTablet(this.context);
        this.bundle.putString(SingleQuestionFragment.BUNDLE_ARG_QUESTION_PUBLISH_ID, str);
        if (arrayList != null) {
            this.bundle.putStringArrayList("searchTerms", arrayList);
        }
        FragmentUtil.startFragmentWithBackStack(this.fragmentManager, R.id.flow_fragment_container, SingleQuestionFragment.newInstance(this.bundle, 2, zIsTablet, null), null, false);
    }

    @Override // com.helpshift.support.contracts.SearchResultListener
    public void sendAnyway() {
        HelpshiftContext.getCoreApi().getAnalyticsEventDM().pushEvent(AnalyticsEventType.TICKET_AVOIDANCE_FAILED);
        FragmentUtil.popBackStackImmediate(getFragmentManager(), SearchResultFragment.class.getName());
        NewConversationFragment newConversationFragment = (NewConversationFragment) this.fragmentManager.findFragmentByTag(NewConversationFragment.FRAGMENT_TAG);
        if (newConversationFragment != null) {
            newConversationFragment.startNewConversation();
        }
    }

    public void onAdminSuggestedQuestionSelected(String str, String str2, String str3, SingleQuestionFragment.QuestionReadListener questionReadListener) {
        boolean zIsTablet = Styles.isTablet(this.context);
        this.bundle.putString(SingleQuestionFragment.BUNDLE_ARG_QUESTION_PUBLISH_ID, str);
        this.bundle.putString(SingleQuestionFragment.BUNDLE_ARG_QUESTION_LANGUAGE, str2);
        this.bundle.putString(SingleQuestionFragment.BUNDLE_ARG_QUESTION_SOURCE, str3);
        Bundle bundle = new Bundle(this.bundle);
        bundle.putBoolean(SupportFragmentConstants.DECOMPOSED, true);
        FragmentUtil.startFragmentWithBackStack(this.fragmentManager, R.id.flow_fragment_container, SingleQuestionFragment.newInstance(bundle, 3, zIsTablet, questionReadListener), null, false);
    }

    @Override // com.helpshift.support.contracts.AttachmentPreviewListener
    public void addAttachment(AttachmentPickerFile attachmentPickerFile) {
        FragmentUtil.popBackStack(this.fragmentManager, AttachmentPreviewFragment.class.getName());
        NewConversationFragment newConversationFragment = (NewConversationFragment) this.fragmentManager.findFragmentByTag(NewConversationFragment.FRAGMENT_TAG);
        if (newConversationFragment != null) {
            newConversationFragment.handleScreenshotAction(AttachmentPreviewFragment.AttachmentAction.ADD, attachmentPickerFile);
        }
    }

    @Override // com.helpshift.support.contracts.AttachmentPreviewListener
    public void sendAttachment(AttachmentPickerFile attachmentPickerFile, String str) {
        FragmentUtil.popBackStack(this.fragmentManager, AttachmentPreviewFragment.class.getName());
        ConversationalFragment conversationalFragment = (ConversationalFragment) this.fragmentManager.findFragmentByTag(ConversationalFragment.FRAGMENT_TAG);
        if (conversationalFragment != null) {
            conversationalFragment.handleAttachmentAction(AttachmentPreviewFragment.AttachmentAction.SEND, attachmentPickerFile, str);
        }
    }

    @Override // com.helpshift.support.contracts.AttachmentPreviewListener
    public void removeAttachment() {
        FragmentUtil.popBackStack(this.fragmentManager, AttachmentPreviewFragment.class.getName());
        NewConversationFragment newConversationFragment = (NewConversationFragment) this.fragmentManager.findFragmentByTag(NewConversationFragment.FRAGMENT_TAG);
        if (newConversationFragment != null) {
            newConversationFragment.handleScreenshotAction(AttachmentPreviewFragment.AttachmentAction.REMOVE, null);
        }
    }

    @Override // com.helpshift.support.contracts.AttachmentPreviewListener
    public void changeAttachment(Bundle bundle) {
        this.supportScreenView.launchAttachmentPicker(bundle);
        NewConversationFragment newConversationFragment = (NewConversationFragment) this.fragmentManager.findFragmentByTag(NewConversationFragment.FRAGMENT_TAG);
        if (newConversationFragment != null) {
            newConversationFragment.handleScreenshotAction(AttachmentPreviewFragment.AttachmentAction.REMOVE, null);
        }
    }

    @Override // com.helpshift.support.contracts.AttachmentPreviewListener
    public void removeAttachmentPreviewFragment() {
        FragmentUtil.popBackStack(this.fragmentManager, AttachmentPreviewFragment.class.getName());
    }

    public void onNewIntent(Bundle bundle) {
        int i = bundle.getInt(SupportFragment.SUPPORT_MODE);
        if (i == 1) {
            replaceConversationFlow(bundle);
        } else if (i == 4) {
            startDynamicForm(bundle.getString(SupportFragmentConstants.FLOW_TITLE), DynamicFormFlowListHolder.getFlowList(), true);
        } else {
            startFaqFlow(bundle, true, CustomContactUsFlowListHolder.getFlowList());
        }
    }

    private void clearConversationStack() {
        boolean z;
        List<Fragment> fragments = this.fragmentManager.getFragments();
        for (int size = fragments.size() - 1; size >= 0; size--) {
            Fragment fragment = fragments.get(size);
            if ((fragment instanceof AttachmentPreviewFragment) || (fragment instanceof BaseConversationFragment) || (fragment instanceof ConversationSetupFragment) || (fragment instanceof AuthenticationFailureFragment)) {
                if (size == 0) {
                    FragmentUtil.removeFragment(this.fragmentManager, fragment);
                    List<Fragment> fragments2 = this.fragmentManager.getFragments();
                    if (fragments2 != null && fragments2.size() > 0) {
                        FragmentUtil.popBackStack(this.fragmentManager, fragment.getClass().getName());
                    }
                } else {
                    FragmentUtil.popBackStack(this.fragmentManager, fragment.getClass().getName());
                }
            }
        }
        Fragment fragmentFindFragmentByTag = this.fragmentManager.findFragmentByTag(ConversationalFragment.FRAGMENT_TAG);
        if (fragmentFindFragmentByTag != null) {
            FragmentUtil.popBackStackImmediate(this.fragmentManager, fragmentFindFragmentByTag.getClass().getName());
            z = true;
        } else {
            z = false;
        }
        if (z) {
            return;
        }
        this.conversationAddToBackStack = true;
    }

    public void onSaveInstanceState(Bundle bundle) {
        bundle.putBoolean("key_support_controller_started", this.isControllerStarted);
        bundle.putBundle("key_conversation_bundle", this.conversationBundle);
        bundle.putBoolean("key_conversation_add_to_back_stack", this.conversationAddToBackStack);
    }

    public void onViewStateRestored(Bundle bundle) {
        if (this.isControllerStarted) {
            return;
        }
        if (bundle.containsKey("key_support_controller_started")) {
            this.isControllerStarted = bundle.containsKey("key_support_controller_started");
            this.supportMode = this.bundle.getInt(SupportFragment.SUPPORT_MODE, 0);
            FragmentManager fragmentManager = this.fragmentManager;
            if (fragmentManager != null) {
                AttachmentPreviewFragment attachmentPreviewFragment = (AttachmentPreviewFragment) fragmentManager.findFragmentByTag(AttachmentPreviewFragment.FRAGMENT_TAG);
                if (attachmentPreviewFragment != null) {
                    attachmentPreviewFragment.setAttachmentPreviewListener(this);
                }
                SearchResultFragment searchResultFragment = (SearchResultFragment) this.fragmentManager.findFragmentByTag(SearchResultFragment.FRAGMENT_TAG);
                if (searchResultFragment != null) {
                    searchResultFragment.setSearchResultListener(this);
                }
                DynamicFormFragment dynamicFormFragment = (DynamicFormFragment) this.fragmentManager.findFragmentByTag(DynamicFormFragment.FRAGMENT_TAG);
                if (dynamicFormFragment != null) {
                    dynamicFormFragment.setSupportController(this);
                }
            }
        }
        if (bundle.containsKey("key_conversation_bundle") && bundle.containsKey("key_conversation_add_to_back_stack")) {
            this.conversationBundle = bundle.getBundle("key_conversation_bundle");
            this.conversationAddToBackStack = bundle.getBoolean("key_conversation_add_to_back_stack");
        }
    }

    public void onConversationSetupCompleted() {
        startConversationFlowInternal(new HashMap());
    }
}
