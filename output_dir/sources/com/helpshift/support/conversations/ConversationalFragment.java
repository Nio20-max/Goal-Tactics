package com.helpshift.support.conversations;

import android.app.DownloadManager;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.ImageButton;
import androidx.core.content.ContextCompat;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.android.commons.downloader.contracts.NetworkAuthDataFetcher;
import com.helpshift.android.commons.downloader.util.AttachmentNetworkUtil;
import com.helpshift.common.AutoRetryFailedEventDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.network.AuthDataProvider;
import com.helpshift.common.platform.Device;
import com.helpshift.common.platform.network.Method;
import com.helpshift.conversation.activeconversation.SmartIntentRenderer;
import com.helpshift.conversation.activeconversation.message.AdminActionCardMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.AdminCSATMessageWithOptions;
import com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.AttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.FAQListMessageDM;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.conversation.activeconversation.message.OptionInputMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestAppReviewMessageDM;
import com.helpshift.conversation.activeconversation.message.RequestScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.UserAttachmentMessageDM;
import com.helpshift.conversation.activeconversation.message.input.OptionInput;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.conversation.smartintent.LeafIntentUIModel;
import com.helpshift.conversation.smartintent.RootIntentUIModel;
import com.helpshift.conversation.smartintent.SearchIntentUIModel;
import com.helpshift.conversation.smartintent.SmartIntentSavedState;
import com.helpshift.conversation.viewmodel.ConversationalVM;
import com.helpshift.conversation.viewmodel.OptionUIModel;
import com.helpshift.network.connectivity.HSConnectivityManager;
import com.helpshift.network.connectivity.HSNetworkConnectivityCallback;
import com.helpshift.support.conversations.HSRecyclerViewScrollListener;
import com.helpshift.support.conversations.messages.MessagesAdapterClickListener;
import com.helpshift.support.conversations.smartintent.SmartIntentRendererImpl;
import com.helpshift.support.conversations.smartintent.SmartIntentRouter;
import com.helpshift.support.fragments.AttachmentPreviewFragment;
import com.helpshift.support.fragments.SingleQuestionFragment;
import com.helpshift.support.fragments.SupportFragment;
import com.helpshift.support.imageloader.ImageLoader;
import com.helpshift.support.util.AppSessionConstants;
import com.helpshift.support.util.SnackbarUtil;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.StringUtils;
import com.helpshift.util.Styles;
import com.helpshift.widget.BaseViewState;
import com.helpshift.widget.ConversationFooterViewState;
import com.helpshift.widget.HSObserver;
import com.helpshift.widget.HistoryLoadingViewState;
import com.helpshift.widget.ReplyBoxViewState;
import com.helpshift.widget.ReplyFieldViewState;
import com.helpshift.widget.ScrollJumperViewState;
import java.security.GeneralSecurityException;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationalFragment extends BaseConversationFragment implements MessagesAdapterClickListener, ConversationalFragmentRouter, HSRecyclerViewScrollListener.RecyclerViewScrollCallback, HSNetworkConnectivityCallback, SmartIntentRouter {
    public static final String BUNDLE_ARG_CONVERSATION_LOCAL_ID = "issueId";
    public static final String BUNDLE_ARG_SHOW_CONVERSATION_HISTORY = "show_conv_history";
    public static final String FRAGMENT_TAG = "HSConversationFragment";
    private static final String TAG = "Helpshift_ConvalFrag";
    private int attachmentPickerType;
    protected Long conversationId;
    ConversationalVM conversationalVM;
    private HSRecyclerViewScrollListener hsRecyclerViewScrollListener;
    private String imageRefersId;
    private boolean inNoOpMode;
    private int lastSoftInputMode;
    private int lastWindowFlags;
    private RecyclerView messagesRecyclerView;
    private AttachmentMessageDM readableAttachmentMessage;
    protected ConversationalFragmentRenderer renderer;
    protected boolean retainMessageBoxOnUI;
    private AttachmentPickerFile selectedAttachmentFile;
    private String selectedImageRefersId;
    private boolean shouldShowConversationHistory;
    private boolean shouldUpdateAttachment;
    private final String SHOULD_SHOW_UNREAD_MESSAGE_INDICATOR = "should_show_unread_message_indicator";
    private final String SMART_INTENT_INSTANCE_SAVED_STATE = "si_instance_saved_state";
    private boolean isConversationVMInitialized = false;

    @Override // com.helpshift.support.conversations.BaseConversationFragment
    protected int getAttachmentMode() {
        return 3;
    }

    public static ConversationalFragment newInstance(Bundle bundle) {
        ConversationalFragment conversationalFragment = new ConversationalFragment();
        conversationalFragment.setArguments(bundle);
        return conversationalFragment;
    }

    @Override // com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        ConversationalFragmentRenderer conversationalFragmentRenderer;
        try {
            super.onAttach(context);
            if (!isChangingConfigurations() || (conversationalFragmentRenderer = this.renderer) == null) {
                return;
            }
            this.retainMessageBoxOnUI = conversationalFragmentRenderer.isReplyBoxVisible();
        } catch (Exception e) {
            Log.e(TAG, "Caught exception in ConversationalFragment.onAttach()", e);
            this.inNoOpMode = true;
        }
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        this.lastWindowFlags = getActivity().getWindow().getAttributes().flags;
        getActivity().getWindow().addFlags(2048);
        getActivity().getWindow().clearFlags(1024);
        return layoutInflater.inflate(R.layout.hs__conversation_fragment, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        boolean z;
        Bundle arguments = getArguments();
        if (arguments != null) {
            this.conversationId = Long.valueOf(arguments.getLong(BUNDLE_ARG_CONVERSATION_LOCAL_ID));
            this.shouldShowConversationHistory = arguments.getBoolean(BUNDLE_ARG_SHOW_CONVERSATION_HISTORY);
            z = arguments.getBoolean(ConversationalVM.CREATE_NEW_PRE_ISSUE);
        } else {
            z = false;
        }
        initialize(view);
        super.onViewCreated(view, bundle);
        if (bundle != null) {
            this.conversationalVM.updateUnreadMessageCountIndicator(bundle.getBoolean("should_show_unread_message_indicator"));
            if (bundle.containsKey("si_instance_saved_state")) {
                this.conversationalVM.onRestoreSmartIntentInstanceState((SmartIntentSavedState) bundle.getSerializable("si_instance_saved_state"));
            }
        }
        if (z && bundle == null) {
            this.conversationalVM.forceClickOnNewConversationButton();
        }
        HSLogger.d(TAG, "Now showing conversation screen");
    }

    protected void initialize(View view) {
        this.messagesRecyclerView = (RecyclerView) view.findViewById(R.id.hs__messagesList);
        View viewFindViewById = view.findViewById(R.id.hs__confirmation);
        View viewFindViewById2 = view.findViewById(R.id.scroll_indicator);
        View viewFindViewById3 = view.findViewById(R.id.unread_indicator_red_dot);
        View viewFindViewById4 = view.findViewById(R.id.unread_indicator_red_dot_image_view);
        if (Build.VERSION.SDK_INT < 21) {
            Drawable drawable = ContextCompat.getDrawable(getContext(), R.drawable.hs__ring);
            viewFindViewById2.setBackgroundDrawable(drawable);
            viewFindViewById3.setBackgroundDrawable(drawable);
        }
        Styles.setDrawable(getContext(), viewFindViewById4, R.drawable.hs__circle, R.attr.colorAccent);
        initRenderer(this.messagesRecyclerView, viewFindViewById, viewFindViewById2, viewFindViewById3);
        initConversationVM();
        this.renderer.setReplyboxListeners();
        this.retainMessageBoxOnUI = false;
        this.conversationalVM.startLiveUpdates();
        this.isConversationVMInitialized = true;
        if (this.shouldUpdateAttachment) {
            this.conversationalVM.sendAttachment(this.selectedAttachmentFile, this.selectedImageRefersId);
            this.shouldUpdateAttachment = false;
        }
        view.findViewById(R.id.resolution_accepted_button).setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                ConversationalFragment.this.conversationalVM.markConversationResolutionStatus(true);
            }
        });
        view.findViewById(R.id.resolution_rejected_button).setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                ConversationalFragment.this.renderer.requestReplyFieldFocus();
                ConversationalFragment.this.renderer.showKeyboard();
                ConversationalFragment.this.conversationalVM.markConversationResolutionStatus(false);
            }
        });
        ImageButton imageButton = (ImageButton) view.findViewById(R.id.scroll_jump_button);
        Styles.setDrawable(getContext(), imageButton, R.drawable.hs__circle_shape_scroll_jump, R.attr.hs__composeBackgroundColor);
        Styles.setColorFilter(getContext(), imageButton.getDrawable(), R.attr.hs__selectableOptionColor);
        imageButton.setOnClickListener(new View.OnClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragment.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                ConversationalFragment.this.conversationalVM.onScrollJumperViewClicked();
            }
        });
        HSRecyclerViewScrollListener hSRecyclerViewScrollListener = new HSRecyclerViewScrollListener(new Handler(), this);
        this.hsRecyclerViewScrollListener = hSRecyclerViewScrollListener;
        this.messagesRecyclerView.addOnScrollListener(hSRecyclerViewScrollListener);
    }

    private void addViewStateObservers() {
        Domain domain = HelpshiftContext.getCoreApi().getDomain();
        this.conversationalVM.getReplyFieldViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.ConversationalFragment.4
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                ConversationalFragment.this.renderer.setReply(((ReplyFieldViewState) obj).getReplyText());
            }
        });
        this.conversationalVM.getHistoryLoadingViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.ConversationalFragment.5
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                ConversationalFragment.this.renderer.updateHistoryLoadingState(((HistoryLoadingViewState) obj).getState());
            }
        });
        this.conversationalVM.getScrollJumperViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.ConversationalFragment.6
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                ScrollJumperViewState scrollJumperViewState = (ScrollJumperViewState) obj;
                ConversationalFragment.this.renderer.updateScrollJumperView(scrollJumperViewState.isVisible(), scrollJumperViewState.shouldShowUnreadMessagesIndicator());
            }
        });
        this.conversationalVM.getConversationFooterViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.ConversationalFragment.7
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                ConversationalFragment.this.renderer.updateConversationFooterState(((ConversationFooterViewState) obj).getState());
            }
        });
        this.conversationalVM.getReplyBoxViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.ConversationalFragment.8
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                ReplyBoxViewState replyBoxViewState = (ReplyBoxViewState) obj;
                ConversationalFragment.this.renderer.updateSendReplyUI(replyBoxViewState.isVisible(), replyBoxViewState.getInput());
            }
        });
        this.conversationalVM.getReplyButtonViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.ConversationalFragment.9
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                ConversationalFragment.this.renderer.updateSendReplyButton(((BaseViewState) obj).isEnabled());
            }
        });
        this.conversationalVM.getAttachImageButtonViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.ConversationalFragment.10
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                ConversationalFragment.this.renderer.updateImageAttachmentButtonView(((BaseViewState) obj).isVisible());
            }
        });
        this.conversationalVM.getConfirmationBoxViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.ConversationalFragment.11
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                ConversationalFragment.this.renderer.updateConversationResolutionQuestionUI(((BaseViewState) obj).isVisible());
            }
        });
        this.conversationalVM.getSmartIntentReplyButtonViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.ConversationalFragment.12
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                BaseViewState baseViewState = (BaseViewState) obj;
                ConversationalFragment.this.renderer.updateSmartIntentReplyButton(baseViewState.isVisible(), baseViewState.isEnabled());
            }
        });
        this.conversationalVM.getSmartIntentClearSearchButtonViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.ConversationalFragment.13
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                ConversationalFragment.this.renderer.updateSmartIntentClearSearchButton(((BaseViewState) obj).isVisible());
            }
        });
        this.conversationalVM.getSmartIntentReplyFieldViewState().subscribe(domain, new HSObserver() { // from class: com.helpshift.support.conversations.ConversationalFragment.14
            @Override // com.helpshift.widget.HSObserver
            public void onChanged(Object obj) {
                ConversationalFragment.this.renderer.setSmartIntentReply(((ReplyFieldViewState) obj).getReplyText());
            }
        });
    }

    private void removeViewStateObservers() {
        this.conversationalVM.getReplyFieldViewState().unsubscribe();
        this.conversationalVM.getHistoryLoadingViewState().unsubscribe();
        this.conversationalVM.getScrollJumperViewState().unsubscribe();
        this.conversationalVM.getConversationFooterViewState().unsubscribe();
        this.conversationalVM.getAttachImageButtonViewState().unsubscribe();
        this.conversationalVM.getReplyBoxViewState().unsubscribe();
        this.conversationalVM.getReplyButtonViewState().unsubscribe();
        this.conversationalVM.getConfirmationBoxViewState().unsubscribe();
        this.conversationalVM.getSmartIntentReplyButtonViewState().unsubscribe();
        this.conversationalVM.getSmartIntentClearSearchButtonViewState().unsubscribe();
    }

    protected void initConversationVM() {
        this.conversationalVM = HelpshiftContext.getCoreApi().getConversationalViewModel(this.shouldShowConversationHistory, this.conversationId, this.renderer, this.retainMessageBoxOnUI);
    }

    protected void initRenderer(RecyclerView recyclerView, View view, View view2, View view3) {
        this.renderer = new ConversationalFragmentRenderer(getContext(), getParentWindow(), recyclerView, getView(), view, HelpshiftContext.getCoreApi().getSDKConfigurationDM().isHelpshiftBrandingDisabled(), HelpshiftContext.getCoreApi().getSDKConfigurationDM().isAvatarEnabledInChatFeed(), view2, view3, getSupportFragment(), buildSmartIntentRenderer(), this);
    }

    private SmartIntentRenderer buildSmartIntentRenderer() {
        return new SmartIntentRendererImpl(getContext(), this, getSupportFragment().isParentViewBottomSheetDialogFragment());
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x002b, code lost:
    
        return getActivity().getWindow();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private android.view.Window getParentWindow() {
        /*
            r3 = this;
            androidx.fragment.app.Fragment r0 = r3.getParentFragment()
            r1 = 5
        L5:
            int r2 = r1 + (-1)
            if (r1 <= 0) goto L23
            if (r0 == 0) goto L23
            boolean r1 = r0 instanceof androidx.fragment.app.DialogFragment
            if (r1 == 0) goto L1d
            r1 = r0
            androidx.fragment.app.DialogFragment r1 = (androidx.fragment.app.DialogFragment) r1
            android.app.Dialog r1 = r1.getDialog()
            if (r1 == 0) goto L1d
            android.view.Window r0 = r1.getWindow()
            return r0
        L1d:
            androidx.fragment.app.Fragment r0 = r0.getParentFragment()
            r1 = r2
            goto L5
        L23:
            androidx.fragment.app.FragmentActivity r0 = r3.getActivity()
            android.view.Window r0 = r0.getWindow()
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.conversations.ConversationalFragment.getParentWindow():android.view.Window");
    }

    @Override // com.helpshift.support.conversations.BaseConversationFragment, androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        addViewStateObservers();
        if (!isChangingConfigurations()) {
            this.conversationalVM.pushChatScreenOpenAnalyticsEvent();
        }
        this.conversationalVM.onResume();
        this.lastSoftInputMode = getActivity().getWindow().getAttributes().softInputMode;
        getActivity().getWindow().setSoftInputMode(16);
        HSConnectivityManager.getInstance(HelpshiftContext.getApplicationContext()).registerNetworkConnectivityListener(this);
        HelpshiftContext.getCoreApi().getAutoRetryFailedEventDM().resetBackoff();
        HelpshiftContext.getCoreApi().getAutoRetryFailedEventDM().sendEventForcefully(AutoRetryFailedEventDM.EventType.CONVERSATION);
    }

    @Override // com.helpshift.support.conversations.BaseConversationFragment, com.helpshift.support.fragments.MainFragment, androidx.fragment.app.Fragment
    public void onPause() {
        HSConnectivityManager.getInstance(HelpshiftContext.getApplicationContext()).unregisterNetworkConnectivityListener(this);
        getActivity().getWindow().setSoftInputMode(this.lastSoftInputMode);
        this.renderer.hideKeyboard();
        removeViewStateObservers();
        this.conversationalVM.onPause();
        super.onPause();
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void handleOptionSelected(OptionInputMessageDM optionInputMessageDM, OptionInput.Option option, boolean z) {
        this.conversationalVM.handleOptionSelected(optionInputMessageDM, option, z);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onAdminSuggestedQuestionSelected(final FAQListMessageDM fAQListMessageDM, final String str, String str2) {
        getSupportController().onAdminSuggestedQuestionSelected(str, str2, fAQListMessageDM.source, new SingleQuestionFragment.QuestionReadListener() { // from class: com.helpshift.support.conversations.ConversationalFragment.15
            @Override // com.helpshift.support.fragments.SingleQuestionFragment.QuestionReadListener
            public void onQuestionRead(String str3) {
                ConversationalFragment.this.conversationalVM.handleAdminSuggestedQuestionRead(fAQListMessageDM, str3, str);
            }
        });
    }

    @Override // com.helpshift.support.conversations.ConversationalFragmentRouter
    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        this.renderer.hideReplyValidationFailedError();
        this.conversationalVM.toggleReplySendButton((charSequence == null || StringUtils.isEmpty(charSequence.toString())) ? false : true);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onStartNewConversationButtonClick() {
        this.conversationalVM.onNewConversationButtonClicked();
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onCSATSurveyStarted() {
        this.conversationalVM.onCSATSurveyStarted();
    }

    @Override // com.helpshift.support.conversations.ConversationalFragmentRouter
    public void onListPickerSearchQueryChange(String str) {
        this.conversationalVM.onListPickerSearchQueryChange(str);
    }

    @Override // com.helpshift.support.conversations.ConversationalFragmentRouter
    public void handleOptionSelectedForPicker(OptionUIModel optionUIModel, boolean z) {
        this.conversationalVM.handleOptionSelectedForPicker(optionUIModel, z);
    }

    @Override // com.helpshift.support.conversations.ConversationalFragmentRouter
    public void setToolbarImportanceForAccessibility(int i) {
        SupportFragment supportFragment = getSupportFragment();
        if (supportFragment != null) {
            supportFragment.setToolbarImportanceForAccessibility(i);
        }
    }

    @Override // com.helpshift.support.conversations.ConversationalFragmentRouter
    public void resetToolbarImportanceForAccessibility() {
        SupportFragment supportFragment = getSupportFragment();
        if (supportFragment != null) {
            supportFragment.resetToolbarImportanceForAccessibility();
        }
    }

    public boolean onBackPressed() {
        return this.renderer.handleBackPressedForListPicker() || this.conversationalVM.handleBackPressedForSmartIntent();
    }

    public void onFocusChanged(boolean z) {
        ConversationalFragmentRenderer conversationalFragmentRenderer = this.renderer;
        if (conversationalFragmentRenderer != null) {
            conversationalFragmentRenderer.onFocusChanged(z);
        }
    }

    @Override // com.helpshift.network.connectivity.HSNetworkConnectivityCallback
    public void onNetworkAvailable() {
        this.conversationalVM.onNetworkAvailable();
    }

    @Override // com.helpshift.network.connectivity.HSNetworkConnectivityCallback
    public void onNetworkUnavailable() {
        this.conversationalVM.onNetworkUnAvailable();
    }

    @Override // com.helpshift.support.conversations.BaseConversationFragment
    protected AppSessionConstants.Screen getViewName() {
        return AppSessionConstants.Screen.CONVERSATION;
    }

    public boolean handleAttachmentAction(AttachmentPreviewFragment.AttachmentAction attachmentAction, AttachmentPickerFile attachmentPickerFile, String str) {
        ConversationalVM conversationalVM;
        if (AnonymousClass18.$SwitchMap$com$helpshift$support$fragments$AttachmentPreviewFragment$AttachmentAction[attachmentAction.ordinal()] != 1) {
            return false;
        }
        if (this.isConversationVMInitialized && (conversationalVM = this.conversationalVM) != null) {
            conversationalVM.sendAttachment(attachmentPickerFile, str);
        } else {
            this.selectedAttachmentFile = attachmentPickerFile;
            this.selectedImageRefersId = str;
            this.shouldUpdateAttachment = true;
        }
        return true;
    }

    @Override // com.helpshift.support.conversations.BaseConversationFragment
    protected String getToolbarTitle() {
        return getString(R.string.hs__conversation_header);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onAdminMessageLinkClicked(String str, MessageDM messageDM) {
        this.conversationalVM.onAdminMessageLinkClicked(str, messageDM);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onAdminMessageLinkClickFailed() {
        this.conversationalVM.onAdminMessageLinkClickFailed();
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onCreateContextMenu(ContextMenu contextMenu, final String str) {
        if (StringUtils.isEmpty(str)) {
            return;
        }
        contextMenu.add(0, 0, 0, R.string.hs__copy).setOnMenuItemClickListener(new MenuItem.OnMenuItemClickListener() { // from class: com.helpshift.support.conversations.ConversationalFragment.16
            @Override // android.view.MenuItem.OnMenuItemClickListener
            public boolean onMenuItemClick(MenuItem menuItem) {
                ConversationalFragment.this.copyToClipboard(str);
                return true;
            }
        });
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void retryMessage(MessageDM messageDM) {
        this.conversationalVM.retryMessage(messageDM);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void launchImagePicker(RequestScreenshotMessageDM requestScreenshotMessageDM) {
        this.imageRefersId = requestScreenshotMessageDM.serverId;
        this.attachmentPickerType = 1;
        this.conversationalVM.onAttachmentButtonClick();
        Bundle bundle = new Bundle();
        bundle.putInt(AttachmentPreviewFragment.KEY_ATTACHMENT_MODE, getAttachmentMode());
        bundle.putString(AttachmentPreviewFragment.KEY_MESSAGE_REFERS_ID, this.imageRefersId);
        bundle.putInt(AttachmentPreviewFragment.KEY_ATTACHMENT_TYPE, this.attachmentPickerType);
        getSupportFragment().launchAttachmentPicker(bundle);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void handleReplyReviewButtonClick(RequestAppReviewMessageDM requestAppReviewMessageDM) {
        this.conversationalVM.handleAppReviewRequestClick(requestAppReviewMessageDM);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onScreenshotMessageClicked(ScreenshotMessageDM screenshotMessageDM) {
        this.conversationalVM.handleScreenshotMessageClick(screenshotMessageDM);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onUserAttachmentMessageClicked(UserAttachmentMessageDM userAttachmentMessageDM) {
        this.conversationalVM.handleUserAttachmentMessageClick(userAttachmentMessageDM);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void handleGenericAttachmentMessageClick(AdminAttachmentMessageDM adminAttachmentMessageDM) {
        checkWriteStoragePermissionAndDelegateToVM(adminAttachmentMessageDM.isWriteStoragePermissionRequired(), adminAttachmentMessageDM);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void handleAdminImageAttachmentMessageClick(AdminImageAttachmentMessageDM adminImageAttachmentMessageDM) {
        checkWriteStoragePermissionAndDelegateToVM(true, adminImageAttachmentMessageDM);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onCSATSurveySubmitted(int i, String str) {
        this.conversationalVM.onCSATSurveySubmitted(i, str);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onCSATSurveyCancelled() {
        this.conversationalVM.onCSATSurveyCancelled();
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onHistoryLoadingRetryClicked() {
        this.conversationalVM.retryHistoryLoadingMessages();
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onActionCardClicked(AdminActionCardMessageDM adminActionCardMessageDM) {
        this.conversationalVM.onActionCardMessageClicked(adminActionCardMessageDM);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void downloadAvatarImage(MessageDM messageDM) {
        this.conversationalVM.downloadAvatarImage(messageDM);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onStartNewConversationButtonClickFromCSATBot(AdminCSATMessageWithOptions adminCSATMessageWithOptions) {
        this.conversationalVM.onStartNewConversationButtonClickFromCSATBot(adminCSATMessageWithOptions);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onSendFeedbackClick(int i, AdminCSATMessageWithOptions adminCSATMessageWithOptions) {
        this.conversationalVM.onSendFeedBackClick(i, adminCSATMessageWithOptions);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onCSATSurveyStartedFromBot(String str) {
        this.conversationalVM.onCSATSurveyStartedFromBot(str);
    }

    @Override // com.helpshift.support.conversations.messages.MessagesAdapterClickListener
    public void onCSATSurveyRequestedFromBot(String str) {
        this.conversationalVM.onCSATSurveyRequestedFromBot(str);
    }

    private void checkWriteStoragePermissionAndDelegateToVM(boolean z, AttachmentMessageDM attachmentMessageDM) {
        this.readableAttachmentMessage = null;
        if (z) {
            int i = AnonymousClass18.$SwitchMap$com$helpshift$common$platform$Device$PermissionState[HelpshiftContext.getPlatform().getDevice().checkPermission(Device.PermissionType.WRITE_STORAGE).ordinal()];
            if (i == 1) {
                this.conversationalVM.handleAdminAttachmentMessageClick(attachmentMessageDM);
                return;
            }
            if (i == 2) {
                startDownloadWithSystemService(attachmentMessageDM.attachmentUrl, attachmentMessageDM.contentType, attachmentMessageDM.isSecureAttachment);
                return;
            } else {
                if (i != 3) {
                    return;
                }
                this.readableAttachmentMessage = attachmentMessageDM;
                requestWriteExternalStoragePermission(true);
                return;
            }
        }
        this.conversationalVM.handleAdminAttachmentMessageClick(attachmentMessageDM);
    }

    /* JADX INFO: renamed from: com.helpshift.support.conversations.ConversationalFragment$18, reason: invalid class name */
    static /* synthetic */ class AnonymousClass18 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$common$platform$Device$PermissionState;
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$support$fragments$AttachmentPreviewFragment$AttachmentAction;

        static {
            int[] iArr = new int[Device.PermissionState.values().length];
            $SwitchMap$com$helpshift$common$platform$Device$PermissionState = iArr;
            try {
                iArr[Device.PermissionState.AVAILABLE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$common$platform$Device$PermissionState[Device.PermissionState.UNAVAILABLE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$common$platform$Device$PermissionState[Device.PermissionState.REQUESTABLE.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            int[] iArr2 = new int[AttachmentPreviewFragment.AttachmentAction.values().length];
            $SwitchMap$com$helpshift$support$fragments$AttachmentPreviewFragment$AttachmentAction = iArr2;
            try {
                iArr2[AttachmentPreviewFragment.AttachmentAction.SEND.ordinal()] = 1;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }

    @Override // com.helpshift.support.conversations.BaseConversationFragment
    protected void onPermissionGranted(int i) {
        AttachmentMessageDM attachmentMessageDM;
        if (i != 2) {
            if (i == 3 && (attachmentMessageDM = this.readableAttachmentMessage) != null) {
                this.conversationalVM.handleAdminAttachmentMessageClick(attachmentMessageDM);
                this.readableAttachmentMessage = null;
                return;
            }
            return;
        }
        Bundle bundle = new Bundle();
        bundle.putInt(AttachmentPreviewFragment.KEY_ATTACHMENT_MODE, getAttachmentMode());
        bundle.putString(AttachmentPreviewFragment.KEY_MESSAGE_REFERS_ID, this.imageRefersId);
        bundle.putInt(AttachmentPreviewFragment.KEY_ATTACHMENT_TYPE, this.attachmentPickerType);
        getSupportFragment().launchAttachmentPicker(bundle);
    }

    private void startDownloadWithSystemService(String str, String str2, boolean z) {
        DownloadManager downloadManager = (DownloadManager) getContext().getSystemService("download");
        if (downloadManager == null) {
            return;
        }
        if (z) {
            str = generateSecureUrl(str);
        }
        DownloadManager.Request request = new DownloadManager.Request(Uri.parse(str));
        request.setMimeType(str2);
        request.setNotificationVisibility(1);
        downloadManager.enqueue(request);
        if (isDetached()) {
            return;
        }
        SnackbarUtil.showSnackbar(getView(), R.string.hs__starting_download, -1);
    }

    private String generateSecureUrl(String str) {
        try {
            final AuthDataProvider authDataProvider = new AuthDataProvider(HelpshiftContext.getCoreApi().getDomain(), HelpshiftContext.getPlatform(), str);
            return AttachmentNetworkUtil.buildSecureURL(str, new NetworkAuthDataFetcher() { // from class: com.helpshift.support.conversations.ConversationalFragment.17
                @Override // com.helpshift.android.commons.downloader.contracts.NetworkAuthDataFetcher
                public Map<String, String> getAuthData(Map<String, String> map) throws GeneralSecurityException {
                    return authDataProvider.getAuthData(Method.GET, map);
                }
            }).toString();
        } catch (Exception unused) {
            HSLogger.e(TAG, "Error while creating secure url: " + str);
            return str;
        }
    }

    @Override // com.helpshift.support.conversations.ConversationalFragmentRouter
    public void openFreshConversationScreen(Map<String, Boolean> map) {
        getSupportFragment().getSupportController().startConversationFlow(map);
    }

    @Override // androidx.fragment.app.Fragment
    public void onDetach() {
        if (this.inNoOpMode) {
            super.onDetach();
            return;
        }
        if (!isChangingConfigurations()) {
            HelpshiftContext.getCoreApi().getConversationInboxPoller().startAppPoller(true);
        }
        super.onDetach();
    }

    @Override // com.helpshift.support.conversations.BaseConversationFragment, androidx.fragment.app.Fragment
    public void onDestroyView() {
        if (getActivity() != null) {
            getActivity().getWindow().clearFlags(2048);
            Window window = getActivity().getWindow();
            int i = this.lastWindowFlags;
            window.setFlags(i, i);
        }
        this.isConversationVMInitialized = false;
        this.conversationalVM.setConversationViewState(-1);
        this.renderer.unregisterFragmentRenderer();
        this.conversationalVM.unregisterRenderer();
        this.renderer.destroy();
        this.messagesRecyclerView.removeOnScrollListener(this.hsRecyclerViewScrollListener);
        this.messagesRecyclerView = null;
        ImageLoader.getInstance().destroy();
        super.onDestroyView();
    }

    @Override // androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        bundle.putBoolean("should_show_unread_message_indicator", this.conversationalVM.shouldShowUnreadMessagesIndicator());
        SmartIntentSavedState smartIntentInstanceSaveState = this.conversationalVM.getSmartIntentInstanceSaveState();
        if (smartIntentInstanceSaveState != null) {
            bundle.putSerializable("si_instance_saved_state", smartIntentInstanceSaveState);
        }
        super.onSaveInstanceState(bundle);
    }

    public void startLiveUpdates() {
        ConversationalVM conversationalVM = this.conversationalVM;
        if (conversationalVM != null) {
            conversationalVM.startLiveUpdates();
        }
    }

    public void stopLiveUpdates() {
        ConversationalVM conversationalVM = this.conversationalVM;
        if (conversationalVM != null) {
            conversationalVM.stopLiveUpdates();
        }
    }

    @Override // com.helpshift.support.conversations.ConversationalFragmentRouter
    public void onSendButtonClick() {
        this.conversationalVM.sendTextMessage();
    }

    @Override // com.helpshift.support.conversations.ConversationalFragmentRouter
    public void onAddAttachmentButtonClick() {
        this.imageRefersId = null;
        this.conversationalVM.onAttachmentButtonClick();
        this.renderer.showAttachmentPicker(this.conversationalVM.getWhiteListedAttachmentTypes());
    }

    @Override // com.helpshift.support.conversations.ConversationalFragmentRouter
    public void launchAttachmentPicker(int i) {
        this.attachmentPickerType = i;
        Bundle bundle = new Bundle();
        bundle.putInt(AttachmentPreviewFragment.KEY_ATTACHMENT_MODE, getAttachmentMode());
        bundle.putString(AttachmentPreviewFragment.KEY_MESSAGE_REFERS_ID, this.imageRefersId);
        bundle.putInt(AttachmentPreviewFragment.KEY_ATTACHMENT_TYPE, i);
        getSupportFragment().launchAttachmentPicker(bundle);
    }

    @Override // com.helpshift.support.conversations.ConversationalFragmentRouter
    public void onSkipClick() {
        this.conversationalVM.onSkipClick();
    }

    @Override // com.helpshift.support.conversations.ConversationalFragmentRouter
    public void onAuthenticationFailure() {
        getSupportController().onAuthenticationFailure();
    }

    @Override // com.helpshift.support.conversations.HSRecyclerViewScrollListener.RecyclerViewScrollCallback
    public void onScrolledToTop() {
        this.conversationalVM.onScrolledToTop();
    }

    @Override // com.helpshift.support.conversations.HSRecyclerViewScrollListener.RecyclerViewScrollCallback
    public void onScrolledToBottom() {
        this.conversationalVM.onScrolledToBottom();
    }

    @Override // com.helpshift.support.conversations.HSRecyclerViewScrollListener.RecyclerViewScrollCallback
    public void onScrolling() {
        this.conversationalVM.onScrolling();
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
        ConversationalVM conversationalVM = this.conversationalVM;
        if (conversationalVM != null) {
            conversationalVM.onDestroy();
        }
        super.onDestroy();
    }

    @Override // com.helpshift.support.conversations.smartintent.SmartIntentRouter
    public void showSmartIntentViewInBottomSheet(View view, int i) {
        getSupportFragment().showBottomSheetViewContainer(view, i);
    }

    @Override // com.helpshift.support.conversations.smartintent.SmartIntentRouter
    public void removeSmartIntentViewFromBottomSheet() {
        getSupportFragment().hideBottomSheetViewContainer();
    }

    @Override // com.helpshift.support.conversations.smartintent.SmartIntentRouter
    public void onRootIntentSelected(RootIntentUIModel rootIntentUIModel) {
        this.conversationalVM.handleRootIntentSelected(rootIntentUIModel);
    }

    @Override // com.helpshift.support.conversations.smartintent.SmartIntentRouter
    public void onLeafIntentSelected(LeafIntentUIModel leafIntentUIModel) {
        this.conversationalVM.handleLeafIntentSelected(leafIntentUIModel);
    }

    @Override // com.helpshift.support.conversations.smartintent.SmartIntentRouter
    public void onSearchIntentSelected(SearchIntentUIModel searchIntentUIModel) {
        this.conversationalVM.handleSearchIntentSelected(searchIntentUIModel);
    }

    @Override // com.helpshift.support.conversations.smartintent.SmartIntentRouter
    public void onSmartIntentBackButtonPressed() {
        this.conversationalVM.handleBackPressedForSmartIntent();
    }

    @Override // com.helpshift.support.conversations.smartintent.SmartIntentRouter
    public void onSmartIntentBottomSheetCollapsed() {
        this.conversationalVM.onSmartIntentBottomSheetCollapsed();
    }

    @Override // com.helpshift.support.conversations.smartintent.SmartIntentRouter
    public void onSmartIntentBottomSheetExpanded() {
        this.conversationalVM.onSmartIntentBottomSheetExpanded();
    }

    @Override // com.helpshift.support.conversations.smartintent.SmartIntentRouter
    public void onSmartIntentTextChanged(CharSequence charSequence) {
        this.renderer.hideSmartIntentReplyValidationFailedError();
        this.conversationalVM.onSmartIntentTextChanged(charSequence);
    }

    @Override // com.helpshift.support.conversations.smartintent.SmartIntentRouter
    public void onSmartIntentSendButtonClick() {
        this.conversationalVM.onSmartIntentSendButtonClick();
    }
}
