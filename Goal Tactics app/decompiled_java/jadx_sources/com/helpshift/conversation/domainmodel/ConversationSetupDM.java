package com.helpshift.conversation.domainmodel;

import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.account.domainmodel.UserSetupDM;
import com.helpshift.account.domainmodel.UserSetupState;
import com.helpshift.common.domain.network.NetworkConstants;
import com.helpshift.common.platform.Platform;
import com.helpshift.configuration.domainmodel.ConfigFetchDM;
import com.helpshift.conversation.viewmodel.ConversationSetupVMCallback;
import com.helpshift.util.Callback;
import com.helpshift.util.HSLogger;
import com.helpshift.util.StringUtils;

/* JADX INFO: loaded from: classes2.dex */
public class ConversationSetupDM implements UserSetupDM.UserSetupListener, Callback<Void, Void> {
    private static final String TAG = "Helpshift_ConvStpFrg";
    private ConversationSetupVMCallback callback;
    private ConfigFetchDM configFetchDM;
    private final Platform platform;
    private UserSetupDM userSetupDM;

    public enum ConversationSetupState {
        NOT_STARTED,
        IN_PROGRESS,
        COMPLETED,
        FAILED
    }

    @Override // com.helpshift.util.Callback
    public void onFailure(Void r1) {
    }

    public ConversationSetupDM(Platform platform, ConfigFetchDM configFetchDM, UserSetupDM userSetupDM) {
        this.platform = platform;
        this.configFetchDM = configFetchDM;
        this.userSetupDM = userSetupDM;
    }

    public void init() {
        HSLogger.d(TAG, "Registering for usersetup and config fetch updates: " + this);
        this.userSetupDM.registerUserSetupListener(this);
        this.configFetchDM.setListener(this);
    }

    public void setCallback(ConversationSetupVMCallback conversationSetupVMCallback) {
        this.callback = conversationSetupVMCallback;
    }

    public void startSetup() {
        HSLogger.d(TAG, "Starting conversation setup. Callback: " + this.callback);
        ConversationSetupVMCallback conversationSetupVMCallback = this.callback;
        if (conversationSetupVMCallback != null) {
            conversationSetupVMCallback.onConversationSetupStateUpdate(getState());
        }
        if (this.userSetupDM.getState() == UserSetupState.COMPLETED) {
            handleUserSetupComplete();
        } else {
            this.userSetupDM.startSetup();
        }
    }

    public ConversationSetupState getState() {
        ConversationSetupState conversationSetupState;
        UserSetupState state = this.userSetupDM.getState();
        int i = AnonymousClass1.$SwitchMap$com$helpshift$account$domainmodel$UserSetupState[state.ordinal()];
        if (i == 1) {
            conversationSetupState = ConversationSetupState.IN_PROGRESS;
        } else if (i == 2) {
            conversationSetupState = ConversationSetupState.NOT_STARTED;
        } else {
            conversationSetupState = i != 3 ? null : ConversationSetupState.FAILED;
        }
        if (state != UserSetupState.COMPLETED) {
            return conversationSetupState;
        }
        if (!StringUtils.isEmpty(this.platform.getNetworkRequestDAO().getETag(NetworkConstants.SUPPORT_CONFIG_ROUTE))) {
            return ConversationSetupState.COMPLETED;
        }
        if (this.configFetchDM.isFetchInProgress()) {
            return ConversationSetupState.IN_PROGRESS;
        }
        return ConversationSetupState.IN_PROGRESS;
    }

    /* JADX INFO: renamed from: com.helpshift.conversation.domainmodel.ConversationSetupDM$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$account$domainmodel$UserSetupState;

        static {
            int[] iArr = new int[UserSetupState.values().length];
            $SwitchMap$com$helpshift$account$domainmodel$UserSetupState = iArr;
            try {
                iArr[UserSetupState.IN_PROGRESS.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$account$domainmodel$UserSetupState[UserSetupState.NON_STARTED.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$account$domainmodel$UserSetupState[UserSetupState.FAILED.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    @Override // com.helpshift.account.domainmodel.UserSetupDM.UserSetupListener
    public void userSetupStateChanged(UserDM userDM, UserSetupState userSetupState) {
        HSLogger.d(TAG, "User setup state update: " + userSetupState);
        if (userSetupState == UserSetupState.COMPLETED) {
            handleUserSetupComplete();
        }
    }

    private void handleUserSetupComplete() {
        HSLogger.d(TAG, "Handling user setup complete.");
        if (StringUtils.isEmpty(this.platform.getNetworkRequestDAO().getETag(NetworkConstants.SUPPORT_CONFIG_ROUTE))) {
            this.configFetchDM.fetchServerConfig(true);
        } else {
            handleConversationSetupComplete();
        }
    }

    private void handleConversationSetupComplete() {
        HSLogger.d(TAG, "Conversation setup complete. Callback: " + this.callback);
        ConversationSetupVMCallback conversationSetupVMCallback = this.callback;
        if (conversationSetupVMCallback != null) {
            conversationSetupVMCallback.onConversationSetupStateUpdate(ConversationSetupState.COMPLETED);
        }
    }

    private void handleConfigFetchSuccessCallback() {
        HSLogger.d(TAG, "Handling config fetch complete.");
        if (UserSetupState.COMPLETED == this.userSetupDM.getState()) {
            handleConversationSetupComplete();
        }
    }

    @Override // com.helpshift.util.Callback
    public void onSuccess(Void r1) {
        handleConfigFetchSuccessCallback();
    }
}
