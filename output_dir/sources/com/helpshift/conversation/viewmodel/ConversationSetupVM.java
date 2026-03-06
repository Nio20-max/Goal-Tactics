package com.helpshift.conversation.viewmodel;

import com.helpshift.account.AuthenticationFailureDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.activeconversation.usersetup.ConversationSetupRenderer;
import com.helpshift.conversation.domainmodel.ConversationSetupDM;
import com.helpshift.util.HSLogger;
import com.helpshift.widget.BaseViewState;
import com.helpshift.widget.MutableBaseViewState;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationSetupVM implements AuthenticationFailureDM.AuthenticationFailureObserver, ConversationSetupVMCallback {
    private static final String TAG = "Helpshift_ConvStpVM";
    private ConversationSetupDM conversationSetupDM;
    private Domain domain;
    private Platform platform;
    private ConversationSetupRenderer renderer;
    private final MutableBaseViewState progressBarViewState = buildProgressBarWidget();
    private final MutableBaseViewState progressDescriptionViewState = new MutableBaseViewState();
    private final MutableBaseViewState errorViewState = new MutableBaseViewState();

    public ConversationSetupVM(Platform platform, Domain domain, ConversationSetupDM conversationSetupDM, ConversationSetupRenderer conversationSetupRenderer) {
        this.platform = platform;
        this.conversationSetupDM = conversationSetupDM;
        this.renderer = conversationSetupRenderer;
        this.domain = domain;
        conversationSetupDM.init();
        conversationSetupDM.setCallback(this);
        this.domain.getAuthenticationFailureDM().registerListener(this);
    }

    private MutableBaseViewState buildProgressBarWidget() {
        MutableBaseViewState mutableBaseViewState = new MutableBaseViewState();
        mutableBaseViewState.setVisible(this.conversationSetupDM.getState() == ConversationSetupDM.ConversationSetupState.IN_PROGRESS);
        return mutableBaseViewState;
    }

    public void onResume() {
        if (this.conversationSetupDM.getState() == ConversationSetupDM.ConversationSetupState.COMPLETED) {
            HSLogger.d(TAG, "Conversation setup already complete.");
            handleConversationSetupComplete();
        } else {
            this.conversationSetupDM.startSetup();
        }
    }

    public void onDestroyView() {
        this.renderer = null;
        this.conversationSetupDM.setCallback(null);
        this.domain.getAuthenticationFailureDM().unregisterListener(this);
    }

    private void handleConversationSetupComplete() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationSetupVM.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ConversationSetupVM.this.renderer != null) {
                    HSLogger.d(ConversationSetupVM.TAG, "Handling setup complete.");
                    ConversationSetupVM.this.renderer.onConversationSetupComplete();
                }
            }
        });
    }

    public void onNetworkAvailable() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationSetupVM.2
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationSetupVM.this.progressBarViewState.setVisible(true);
                ConversationSetupVM.this.errorViewState.setVisible(false);
            }
        });
    }

    public void onNetworkUnavailable() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationSetupVM.3
            @Override // com.helpshift.common.domain.F
            public void f() {
                ConversationSetupVM.this.showOfflineError();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showOfflineError() {
        this.progressBarViewState.setVisible(false);
        this.progressDescriptionViewState.setVisible(false);
        this.errorViewState.setVisible(true);
    }

    public BaseViewState getProgressBarViewState() {
        return this.progressBarViewState;
    }

    public BaseViewState getDescriptionProgressViewState() {
        return this.progressDescriptionViewState;
    }

    public BaseViewState getUserOfflineErrorViewState() {
        return this.errorViewState;
    }

    @Override // com.helpshift.account.AuthenticationFailureDM.AuthenticationFailureObserver
    public void onAuthenticationFailure() {
        this.domain.runOnUI(new F() { // from class: com.helpshift.conversation.viewmodel.ConversationSetupVM.4
            @Override // com.helpshift.common.domain.F
            public void f() {
                if (ConversationSetupVM.this.renderer != null) {
                    ConversationSetupVM.this.renderer.onAuthenticationFailure();
                }
            }
        });
    }

    @Override // com.helpshift.conversation.viewmodel.ConversationSetupVMCallback
    public void onConversationSetupStateUpdate(ConversationSetupDM.ConversationSetupState conversationSetupState) {
        if (!this.platform.isOnline()) {
            onNetworkUnavailable();
            return;
        }
        int i = AnonymousClass5.$SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState[conversationSetupState.ordinal()];
        if (i == 1 || i == 2) {
            this.progressDescriptionViewState.setVisible(true);
            this.progressBarViewState.setVisible(true);
        } else if (i == 3) {
            this.progressBarViewState.setVisible(true);
            this.errorViewState.setVisible(false);
        } else {
            if (i != 4) {
                return;
            }
            handleConversationSetupComplete();
        }
    }

    /* JADX INFO: renamed from: com.helpshift.conversation.viewmodel.ConversationSetupVM$5, reason: invalid class name */
    static /* synthetic */ class AnonymousClass5 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState;

        static {
            int[] iArr = new int[ConversationSetupDM.ConversationSetupState.values().length];
            $SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState = iArr;
            try {
                iArr[ConversationSetupDM.ConversationSetupState.NOT_STARTED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState[ConversationSetupDM.ConversationSetupState.FAILED.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState[ConversationSetupDM.ConversationSetupState.IN_PROGRESS.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$domainmodel$ConversationSetupDM$ConversationSetupState[ConversationSetupDM.ConversationSetupState.COMPLETED.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }
}
