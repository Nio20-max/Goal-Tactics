package com.helpshift.account.domainmodel;

import com.helpshift.account.domainmodel.UserSyncDM;
import com.helpshift.common.AutoRetriableDM;
import com.helpshift.common.AutoRetryFailedEventDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.ConversationInboxPoller;
import com.helpshift.migration.MigrationState;
import com.helpshift.migration.RemoteDataMigrator;
import com.helpshift.redaction.RedactionManager;
import com.helpshift.redaction.RedactionState;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
public class UserSetupDM implements UserSyncDM.UserSyncListener, RemoteDataMigrator.RemoteDataMigratorListener, RedactionManager.RedactionManagerListener, AutoRetriableDM {
    Domain domain;
    private RedactionManager redactionManager;
    private RemoteDataMigrator remoteDataMigrator;
    UserDM userDM;
    private WeakReference<UserSetupListener> userSetupListener;
    private UserSyncDM userSyncDM;

    public interface UserSetupListener {
        void userSetupStateChanged(UserDM userDM, UserSetupState userSetupState);
    }

    public UserSetupDM(Platform platform, Domain domain, UserDM userDM, UserManagerDM userManagerDM, IUserSyncExecutor iUserSyncExecutor) {
        this.domain = domain;
        this.userDM = userDM;
        this.userSyncDM = new UserSyncDM(platform, domain, userDM, userManagerDM, iUserSyncExecutor, this);
        this.remoteDataMigrator = new RemoteDataMigrator(platform, domain, userDM, this);
        this.redactionManager = new RedactionManager(platform, domain, userDM, this);
    }

    public void init() {
        this.redactionManager.setAppropriateInitialState();
        this.remoteDataMigrator.setAppropriateInitialState();
        this.userSyncDM.setAppropriateInitialState();
        this.domain.getAutoRetryFailedEventDM().register(AutoRetryFailedEventDM.EventType.MIGRATION, this);
        this.domain.getAutoRetryFailedEventDM().register(AutoRetryFailedEventDM.EventType.SYNC_USER, this);
    }

    public UserSetupState getState() {
        RedactionState redactionState = this.redactionManager.getRedactionState();
        if (redactionState == RedactionState.PENDING) {
            return UserSetupState.NON_STARTED;
        }
        if (redactionState == RedactionState.IN_PROGRESS) {
            return UserSetupState.IN_PROGRESS;
        }
        MigrationState profileMigrationState = this.remoteDataMigrator.getProfileMigrationState();
        if (profileMigrationState == MigrationState.NOT_STARTED) {
            return UserSetupState.NON_STARTED;
        }
        if (profileMigrationState == MigrationState.FAILED) {
            return UserSetupState.FAILED;
        }
        if (profileMigrationState == MigrationState.IN_PROGRESS) {
            return UserSetupState.IN_PROGRESS;
        }
        UserSyncStatus syncState = this.userSyncDM.getSyncState();
        if (syncState == UserSyncStatus.NOT_STARTED) {
            return UserSetupState.NON_STARTED;
        }
        if (syncState == UserSyncStatus.FAILED) {
            return UserSetupState.FAILED;
        }
        if (syncState == UserSyncStatus.IN_PROGRESS) {
            return UserSetupState.IN_PROGRESS;
        }
        return UserSetupState.COMPLETED;
    }

    public void startSetup() {
        UserSetupState state = getState();
        if (state == UserSetupState.IN_PROGRESS || state == UserSetupState.COMPLETED) {
            return;
        }
        RedactionState redactionState = this.redactionManager.getRedactionState();
        onRedactionStateChange(redactionState);
        if (redactionState == RedactionState.PENDING) {
            this.redactionManager.executeRedaction();
        }
    }

    @Override // com.helpshift.redaction.RedactionManager.RedactionManagerListener
    public void redactionStateChanged(UserDM userDM, RedactionState redactionState, RedactionState redactionState2) {
        onRedactionStateChange(redactionState2);
    }

    @Override // com.helpshift.account.domainmodel.UserSyncDM.UserSyncListener
    public void userSyncStateChanged(UserDM userDM, UserSyncStatus userSyncStatus, UserSyncStatus userSyncStatus2) {
        onUserSyncStateChange(userSyncStatus2);
    }

    @Override // com.helpshift.migration.RemoteDataMigrator.RemoteDataMigratorListener
    public void onMigrationStateChanged(UserDM userDM, MigrationState migrationState, MigrationState migrationState2) {
        onMigrationStateChange(migrationState2);
    }

    private void onRedactionStateChange(RedactionState redactionState) {
        if (redactionState == RedactionState.COMPLETED) {
            MigrationState profileMigrationState = this.remoteDataMigrator.getProfileMigrationState();
            if (profileMigrationState == MigrationState.COMPLETED || profileMigrationState == MigrationState.IN_PROGRESS) {
                onMigrationStateChange(profileMigrationState);
                return;
            } else {
                this.remoteDataMigrator.startProfileMigration();
                return;
            }
        }
        if (redactionState == RedactionState.IN_PROGRESS) {
            updateUserSetupStateChange(UserSetupState.IN_PROGRESS);
        } else if (redactionState == RedactionState.PENDING) {
            updateUserSetupStateChange(UserSetupState.NON_STARTED);
        }
    }

    private void onMigrationStateChange(MigrationState migrationState) {
        if (migrationState == MigrationState.COMPLETED) {
            UserSyncStatus syncState = this.userSyncDM.getSyncState();
            if (syncState == UserSyncStatus.COMPLETED || syncState == UserSyncStatus.IN_PROGRESS) {
                onUserSyncStateChange(syncState);
                return;
            } else {
                this.userSyncDM.syncUser();
                return;
            }
        }
        if (migrationState == MigrationState.IN_PROGRESS) {
            updateUserSetupStateChange(UserSetupState.IN_PROGRESS);
        } else if (migrationState == MigrationState.FAILED) {
            updateUserSetupStateChange(UserSetupState.FAILED);
        } else if (migrationState == MigrationState.NOT_STARTED) {
            updateUserSetupStateChange(UserSetupState.NON_STARTED);
        }
    }

    private void onUserSyncStateChange(UserSyncStatus userSyncStatus) {
        if (userSyncStatus == UserSyncStatus.COMPLETED) {
            updateUserSetupStateChange(UserSetupState.COMPLETED);
            return;
        }
        if (userSyncStatus == UserSyncStatus.IN_PROGRESS) {
            updateUserSetupStateChange(UserSetupState.IN_PROGRESS);
        } else if (userSyncStatus == UserSyncStatus.FAILED) {
            updateUserSetupStateChange(UserSetupState.FAILED);
        } else if (userSyncStatus == UserSyncStatus.NOT_STARTED) {
            updateUserSetupStateChange(UserSetupState.NON_STARTED);
        }
    }

    private void updateUserSetupStateChange(final UserSetupState userSetupState) {
        WeakReference<UserSetupListener> weakReference = this.userSetupListener;
        final UserSetupListener userSetupListener = weakReference == null ? null : weakReference.get();
        if (userSetupListener != null) {
            this.domain.runSerial(new F() { // from class: com.helpshift.account.domainmodel.UserSetupDM.1
                @Override // com.helpshift.common.domain.F
                public void f() {
                    userSetupListener.userSetupStateChanged(UserSetupDM.this.userDM, userSetupState);
                }
            });
        }
        if (userSetupState == UserSetupState.COMPLETED) {
            this.domain.runParallel(new F() { // from class: com.helpshift.account.domainmodel.UserSetupDM.2
                @Override // com.helpshift.common.domain.F
                public void f() {
                    try {
                        UserSetupDM.this.domain.getUserManagerDM().sendPushTokenSync();
                    } finally {
                        ConversationInboxPoller conversationInboxPoller = UserSetupDM.this.domain.getConversationInboxManagerDM().getActiveConversationInboxDM().getConversationInboxPoller();
                        UserSetupDM.this.userDM.addObserver(conversationInboxPoller);
                        conversationInboxPoller.refreshPoller(false);
                    }
                }
            });
        }
    }

    public void registerUserSetupListener(UserSetupListener userSetupListener) {
        if (userSetupListener == null) {
            this.userSetupListener = null;
        } else {
            this.userSetupListener = new WeakReference<>(userSetupListener);
        }
    }

    @Override // com.helpshift.common.AutoRetriableDM
    public void sendFailedApiCalls(AutoRetryFailedEventDM.EventType eventType) {
        if (this.redactionManager.getRedactionState() != RedactionState.COMPLETED) {
            return;
        }
        int i = AnonymousClass3.$SwitchMap$com$helpshift$common$AutoRetryFailedEventDM$EventType[eventType.ordinal()];
        if (i == 1) {
            this.remoteDataMigrator.retry();
            if (this.remoteDataMigrator.getProfileMigrationState() == MigrationState.COMPLETED) {
                this.userSyncDM.syncUser();
                return;
            }
            return;
        }
        if (i == 2 && this.remoteDataMigrator.getProfileMigrationState() == MigrationState.COMPLETED) {
            this.userSyncDM.retry();
        }
    }

    /* JADX INFO: renamed from: com.helpshift.account.domainmodel.UserSetupDM$3, reason: invalid class name */
    static /* synthetic */ class AnonymousClass3 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$common$AutoRetryFailedEventDM$EventType;

        static {
            int[] iArr = new int[AutoRetryFailedEventDM.EventType.values().length];
            $SwitchMap$com$helpshift$common$AutoRetryFailedEventDM$EventType = iArr;
            try {
                iArr[AutoRetryFailedEventDM.EventType.MIGRATION.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$common$AutoRetryFailedEventDM$EventType[AutoRetryFailedEventDM.EventType.SYNC_USER.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }
}
