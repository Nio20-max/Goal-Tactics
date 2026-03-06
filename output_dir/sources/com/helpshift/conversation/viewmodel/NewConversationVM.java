package com.helpshift.conversation.viewmodel;

import com.helpshift.account.AuthenticationFailureDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.activeconversation.model.Conversation;
import com.helpshift.conversation.domainmodel.ConversationController;
import com.helpshift.conversation.dto.AttachmentPickerFile;
import com.helpshift.util.HSLogger;
import com.helpshift.util.HSPattern;
import com.helpshift.util.StringUtils;
import com.helpshift.widget.BaseViewState;
import com.helpshift.widget.ImageAttachmentViewState;
import com.helpshift.widget.MutableBaseViewState;
import com.helpshift.widget.MutableImageAttachmentViewState;
import com.helpshift.widget.MutableTextViewState;
import com.helpshift.widget.TextViewState;
import com.helpshift.widget.WidgetGateway;
import java.lang.ref.WeakReference;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes2.dex */
public class NewConversationVM implements ConversationController.StartNewConversationListener, AuthenticationFailureDM.AuthenticationFailureObserver {
    private static final String TAG = "Helpshift_NewConvVM";
    final MutableBaseViewState attachImageButtonViewState;
    final ConversationController conversationController;
    final MutableTextViewState descriptionViewState;
    final Domain domain;
    final MutableTextViewState emailViewState;
    final MutableImageAttachmentViewState imageAttachmentViewState;
    final MutableTextViewState nameViewState;
    final Platform platform;
    final MutableBaseViewState profileFormViewState;
    final MutableBaseViewState progressBarViewState;
    WeakReference<NewConversationRenderer> rendererWeakRef;
    final SDKConfigurationDM sdkConfigurationDM;
    final MutableBaseViewState startConversationButtonViewState;
    boolean wasSearchPerformed = false;
    final WidgetGateway widgetGateway;

    public NewConversationVM(Platform platform, Domain domain, ConversationController conversationController, NewConversationRenderer newConversationRenderer) {
        this.platform = platform;
        this.domain = domain;
        SDKConfigurationDM sDKConfigurationDM = domain.getSDKConfigurationDM();
        this.sdkConfigurationDM = sDKConfigurationDM;
        this.conversationController = conversationController;
        WidgetGateway widgetGateway = new WidgetGateway(sDKConfigurationDM, conversationController);
        this.widgetGateway = widgetGateway;
        this.descriptionViewState = widgetGateway.makeDescriptionViewState();
        MutableTextViewState mutableTextViewStateMakeNameViewState = widgetGateway.makeNameViewState();
        this.nameViewState = mutableTextViewStateMakeNameViewState;
        MutableTextViewState mutableTextViewStateMakeEmailViewState = widgetGateway.makeEmailViewState();
        this.emailViewState = mutableTextViewStateMakeEmailViewState;
        MutableImageAttachmentViewState mutableImageAttachmentViewStateMakeImageAttachmentWidget = widgetGateway.makeImageAttachmentWidget();
        this.imageAttachmentViewState = mutableImageAttachmentViewStateMakeImageAttachmentWidget;
        this.progressBarViewState = widgetGateway.makeProgressBarViewState();
        this.profileFormViewState = widgetGateway.makeProfileFormViewState(mutableTextViewStateMakeNameViewState, mutableTextViewStateMakeEmailViewState);
        this.attachImageButtonViewState = widgetGateway.makeNewConversationAttachImageButtonViewState(mutableImageAttachmentViewStateMakeImageAttachmentWidget);
        this.startConversationButtonViewState = widgetGateway.makeStartConversationButtonViewState();
        conversationController.registerStartNewConversationListener(this);
        domain.getAuthenticationFailureDM().registerListener(this);
        this.rendererWeakRef = new WeakReference<>(newConversationRenderer);
    }

    public void setDescription(final String str) {
        this.domain.runSerial(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (NewConversationVM.this.descriptionViewState.getText().equals(str)) {
                    return;
                }
                NewConversationVM.this.descriptionViewState.setText(str);
                NewConversationVM.this.widgetGateway.save(NewConversationVM.this.descriptionViewState);
            }
        });
    }

    public void setName(final String str) {
        this.domain.runSerial(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.2
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (NewConversationVM.this.nameViewState.getText().equals(str)) {
                    return;
                }
                NewConversationVM.this.nameViewState.setText(str);
            }
        });
    }

    public void setEmail(final String str) {
        this.domain.runSerial(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.3
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (NewConversationVM.this.emailViewState.getText().equals(str)) {
                    return;
                }
                NewConversationVM.this.emailViewState.setText(str);
            }
        });
    }

    public void setWasSearchPerformed(final boolean z) {
        this.domain.runSerial(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.4
            @Override // com.helpshift.common.domain.F
            public void f() {
                NewConversationVM.this.wasSearchPerformed = z;
                if (NewConversationVM.this.shouldShowSearchOnNewConversation()) {
                    NewConversationVM.this.conversationController.triggerFAQSearchIndexing();
                }
            }
        });
    }

    public void showSearchOrStartNewConversation() {
        showSearchOrStartNewConversationInternal(true);
    }

    public void startNewConversation() {
        showSearchOrStartNewConversationInternal(false);
    }

    private void showSearchOrStartNewConversationInternal(final boolean z) {
        this.domain.runSerial(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.5
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (NewConversationVM.this.isFormValid()) {
                    if (z && NewConversationVM.this.shouldShowSearchOnNewConversation()) {
                        ArrayList fAQSearchResults = NewConversationVM.this.conversationController.getFAQSearchResults(NewConversationVM.this.descriptionViewState.getText());
                        if (fAQSearchResults.size() > 0) {
                            if (NewConversationVM.this.rendererWeakRef.get() != null) {
                                NewConversationVM.this.rendererWeakRef.get().showSearchResultFragment(fAQSearchResults);
                                return;
                            }
                            return;
                        }
                    }
                    final Conversation activeConversationFromStorage = NewConversationVM.this.conversationController.getActiveConversationFromStorage();
                    if (activeConversationFromStorage != null) {
                        NewConversationVM.this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.5.1
                            @Override // com.helpshift.common.domain.F
                            public void f() {
                                NewConversationVM.this.progressBarViewState.setVisible(false);
                                NewConversationVM.this.startConversationButtonViewState.setVisible(true);
                                NewConversationVM.this.imageAttachmentViewState.setClickable(true);
                                NewConversationVM.this.attachImageButtonViewState.setVisible(StringUtils.isEmpty(NewConversationVM.this.imageAttachmentViewState.getImagePath()));
                                if (NewConversationVM.this.rendererWeakRef.get() != null) {
                                    NewConversationVM.this.rendererWeakRef.get().gotoConversation(activeConversationFromStorage.localId.longValue());
                                }
                            }
                        });
                        return;
                    }
                    HSLogger.d(NewConversationVM.TAG, "Creating new conversation");
                    NewConversationVM.this.progressBarViewState.setVisible(true);
                    NewConversationVM.this.startConversationButtonViewState.setVisible(false);
                    NewConversationVM.this.attachImageButtonViewState.setVisible(false);
                    NewConversationVM.this.imageAttachmentViewState.setClickable(false);
                    NewConversationVM.this.conversationController.startNewConversation(NewConversationVM.this.descriptionViewState.getText(), NewConversationVM.this.nameViewState.getText(), NewConversationVM.this.emailViewState.getText(), NewConversationVM.this.imageAttachmentViewState.getAttachmentPickerFile());
                }
            }
        });
    }

    boolean shouldShowSearchOnNewConversation() {
        return !this.wasSearchPerformed && this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.SHOW_SEARCH_ON_NEW_CONVERSATION);
    }

    @Override // com.helpshift.conversation.domainmodel.ConversationController.StartNewConversationListener
    public void onCreateConversationSuccess(final long j) {
        this.progressBarViewState.setVisible(false);
        this.startConversationButtonViewState.setVisible(true);
        this.descriptionViewState.setText(null);
        this.imageAttachmentViewState.setAttachmentPickerFile(null);
        this.attachImageButtonViewState.setVisible(StringUtils.isEmpty(this.imageAttachmentViewState.getImagePath()));
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.6
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (NewConversationVM.this.rendererWeakRef.get() != null) {
                    NewConversationRenderer newConversationRenderer = NewConversationVM.this.rendererWeakRef.get();
                    if (NewConversationVM.this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.GOTO_CONVERSATION_AFTER_CONTACT_US) && !NewConversationVM.this.sdkConfigurationDM.getBoolean(SDKConfigurationDM.DISABLE_IN_APP_CONVERSATION)) {
                        newConversationRenderer.gotoConversation(j);
                    } else {
                        newConversationRenderer.showConversationStartedMessage();
                        newConversationRenderer.exit();
                    }
                }
            }
        });
    }

    @Override // com.helpshift.conversation.domainmodel.ConversationController.StartNewConversationListener
    public void onCreateConversationFailure(Exception exc) {
        this.progressBarViewState.setVisible(false);
        this.startConversationButtonViewState.setVisible(true);
        this.imageAttachmentViewState.setClickable(true);
        this.attachImageButtonViewState.setVisible(StringUtils.isEmpty(this.imageAttachmentViewState.getImagePath()));
        handleException(exc);
    }

    public void unregisterRenderer(NewConversationRenderer newConversationRenderer) {
        WeakReference<NewConversationRenderer> weakReference = this.rendererWeakRef;
        if (weakReference != null && weakReference.get() == newConversationRenderer) {
            this.rendererWeakRef = new WeakReference<>(null);
        }
        this.domain.getAuthenticationFailureDM().unregisterListener(this);
        this.conversationController.unregisterStartNewConversationListener(this);
    }

    private void handleException(final Exception exc) {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.7
            @Override // com.helpshift.common.domain.F
            public void f() {
                Exception exc2 = exc;
                if (exc2 instanceof RootAPIException) {
                    RootAPIException rootAPIException = (RootAPIException) exc2;
                    if (NewConversationVM.this.rendererWeakRef.get() != null) {
                        NewConversationVM.this.rendererWeakRef.get().showErrorView(rootAPIException.exceptionType);
                    }
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isFormValid() {
        this.descriptionViewState.setError(validateDescription());
        this.nameViewState.setError(validateName());
        this.emailViewState.setError(validateEmail());
        return this.descriptionViewState.getError() == null && this.nameViewState.getError() == null && this.emailViewState.getError() == null;
    }

    public TextViewState.TextViewStatesError validateDescription() {
        String text = this.descriptionViewState.getText();
        if (text.length() == 0) {
            return TextViewState.TextViewStatesError.EMPTY;
        }
        if (TextViewState.specialCharactersPattern.matcher(text).matches()) {
            return TextViewState.TextViewStatesError.ONLY_SPECIAL_CHARACTERS;
        }
        if (text.length() < this.sdkConfigurationDM.getMinimumConversationDescriptionLength()) {
            return TextViewState.TextViewStatesError.LESS_THAN_MINIMUM_LENGTH;
        }
        return null;
    }

    public TextViewState.TextViewStatesError validateName() {
        String text = this.nameViewState.getText();
        if (text.length() == 0) {
            return TextViewState.TextViewStatesError.EMPTY;
        }
        if (TextViewState.specialCharactersPattern.matcher(text).matches()) {
            return TextViewState.TextViewStatesError.ONLY_SPECIAL_CHARACTERS;
        }
        return null;
    }

    public TextViewState.TextViewStatesError validateEmail() {
        String text = this.emailViewState.getText();
        if (text.length() == 0) {
            if (this.emailViewState.isRequired()) {
                return TextViewState.TextViewStatesError.EMPTY;
            }
            return null;
        }
        if (HSPattern.isValidEmail(text)) {
            return null;
        }
        return TextViewState.TextViewStatesError.INVALID_EMAIL;
    }

    public void setSearchQuery(final String str) {
        this.domain.runSerial(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.8
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (!StringUtils.isEmpty(NewConversationVM.this.descriptionViewState.getText()) || StringUtils.isEmpty(str)) {
                    return;
                }
                NewConversationVM.this.descriptionViewState.setText(str.substring(0, 1).toUpperCase() + str.substring(1));
            }
        });
    }

    public void handleImageAttachmentClearButtonClick() {
        if (this.progressBarViewState.isVisible()) {
            return;
        }
        this.domain.runSerial(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.9
            @Override // com.helpshift.common.domain.F
            public void f() {
                AttachmentPickerFile attachmentPickerFile = NewConversationVM.this.imageAttachmentViewState.getAttachmentPickerFile();
                if (attachmentPickerFile == null || attachmentPickerFile.filePath == null) {
                    return;
                }
                NewConversationVM.this.domain.getAttachmentFileManagerDM().deleteAttachmentLocalCopy(attachmentPickerFile);
            }
        });
        setImageAttachment(null);
    }

    public void setImageAttachment(final AttachmentPickerFile attachmentPickerFile) {
        this.domain.runSerial(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.10
            @Override // com.helpshift.common.domain.F
            public void f() {
                NewConversationVM.this.imageAttachmentViewState.setAttachmentPickerFile(attachmentPickerFile);
                NewConversationVM.this.widgetGateway.save(NewConversationVM.this.imageAttachmentViewState);
                if (NewConversationVM.this.progressBarViewState.isVisible()) {
                    NewConversationVM.this.attachImageButtonViewState.setVisible(false);
                } else {
                    NewConversationVM.this.attachImageButtonViewState.setVisible(StringUtils.isEmpty(NewConversationVM.this.imageAttachmentViewState.getImagePath()));
                }
            }
        });
    }

    public void handleImageAttachmentClick() {
        if (this.progressBarViewState.isVisible()) {
            return;
        }
        this.domain.runSerial(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.11
            @Override // com.helpshift.common.domain.F
            public void f() {
                final AttachmentPickerFile attachmentPickerFile = NewConversationVM.this.imageAttachmentViewState.getAttachmentPickerFile();
                if (attachmentPickerFile == null || StringUtils.isEmpty(attachmentPickerFile.filePath)) {
                    return;
                }
                NewConversationVM.this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.11.1
                    @Override // com.helpshift.common.domain.F
                    public void f() {
                        if (NewConversationVM.this.rendererWeakRef.get() != null) {
                            NewConversationVM.this.rendererWeakRef.get().showAttachmentPreviewScreenFromDraft(attachmentPickerFile);
                        }
                    }
                });
            }
        });
    }

    public void setShouldDropCustomMetadata(final boolean z) {
        this.domain.runSerial(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.12
            @Override // com.helpshift.common.domain.F
            public void f() {
                NewConversationVM.this.conversationController.setShouldDropCustomMetadata(z);
            }
        });
    }

    public void setConversationViewState(final int i) {
        this.domain.runSerial(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.13
            @Override // com.helpshift.common.domain.F
            public void f() {
                NewConversationVM.this.conversationController.setConversationViewState(i);
            }
        });
    }

    @Override // com.helpshift.account.AuthenticationFailureDM.AuthenticationFailureObserver
    public void onAuthenticationFailure() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.NewConversationVM.14
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (NewConversationVM.this.rendererWeakRef.get() != null) {
                    NewConversationVM.this.rendererWeakRef.get().onAuthenticationFailure();
                }
            }
        });
    }

    public TextViewState getDescriptionViewState() {
        return this.descriptionViewState;
    }

    public BaseViewState getProgressBarViewState() {
        return this.progressBarViewState;
    }

    public BaseViewState getStartConversationButtonState() {
        return this.startConversationButtonViewState;
    }

    public BaseViewState getAttachImageButtonViewState() {
        return this.attachImageButtonViewState;
    }

    public ImageAttachmentViewState getImageAttachmentViewState() {
        return this.imageAttachmentViewState;
    }

    public TextViewState getNameViewState() {
        return this.nameViewState;
    }

    public TextViewState getEmailViewState() {
        return this.emailViewState;
    }

    public BaseViewState getProfileFormViewState() {
        return this.profileFormViewState;
    }
}
