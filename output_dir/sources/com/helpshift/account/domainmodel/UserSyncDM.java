package com.helpshift.account.domainmodel;

import com.helpshift.common.AutoRetryFailedEventDM;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Platform;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
public class UserSyncDM {
    private Domain domain;
    private Platform platform;
    private UserDM userDM;
    private UserManagerDM userManagerDM;
    private IUserSyncExecutor userSyncExecutor;
    private WeakReference<UserSyncListener> userSyncListener;

    public interface UserSyncListener {
        void userSyncStateChanged(UserDM userDM, UserSyncStatus userSyncStatus, UserSyncStatus userSyncStatus2);
    }

    public UserSyncDM(Platform platform, Domain domain, UserDM userDM, UserManagerDM userManagerDM, IUserSyncExecutor iUserSyncExecutor, UserSyncListener userSyncListener) {
        this.platform = platform;
        this.domain = domain;
        this.userDM = userDM;
        this.userManagerDM = userManagerDM;
        this.userSyncExecutor = iUserSyncExecutor;
        this.userSyncListener = new WeakReference<>(userSyncListener);
    }

    public void setAppropriateInitialState() {
        if (getSyncState() == UserSyncStatus.IN_PROGRESS) {
            updateUserSyncState(UserSyncStatus.IN_PROGRESS, UserSyncStatus.NOT_STARTED);
        }
    }

    private void updateUserSyncState(final UserSyncStatus userSyncStatus, final UserSyncStatus userSyncStatus2) {
        WeakReference<UserSyncListener> weakReference = this.userSyncListener;
        final UserSyncListener userSyncListener = weakReference != null ? weakReference.get() : null;
        this.userManagerDM.updateSyncState(this.userDM, userSyncStatus2);
        if (userSyncListener != null) {
            this.domain.runSerial(new F() { // from class: com.helpshift.account.domainmodel.UserSyncDM.1
                @Override // com.helpshift.common.domain.F
                public void f() {
                    userSyncListener.userSyncStateChanged(UserSyncDM.this.userDM, userSyncStatus, userSyncStatus2);
                }
            });
        }
    }

    public UserSyncStatus getSyncState() {
        return this.userDM.getSyncState();
    }

    public void syncUser() {
        UserSyncStatus syncState = getSyncState();
        if (syncState == UserSyncStatus.COMPLETED || syncState == UserSyncStatus.IN_PROGRESS) {
            return;
        }
        this.domain.runParallel(new F() { // from class: com.helpshift.account.domainmodel.UserSyncDM.2
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    UserSyncDM.this.syncUserInternal();
                } catch (RootAPIException e) {
                    UserSyncDM.this.domain.getAutoRetryFailedEventDM().scheduleRetryTaskForEventType(AutoRetryFailedEventDM.EventType.SYNC_USER, e.getServerStatusCode());
                    throw e;
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void syncUserInternal() {
        UserSyncStatus syncState = getSyncState();
        if (syncState == UserSyncStatus.NOT_STARTED || syncState == UserSyncStatus.FAILED) {
            updateUserSyncState(syncState, UserSyncStatus.IN_PROGRESS);
            try {
                this.userSyncExecutor.executeUserSync();
                updateUserSyncState(syncState, UserSyncStatus.COMPLETED);
            } catch (RootAPIException e) {
                if (e.getServerStatusCode() == NetworkErrorCodes.CONTENT_NOT_FOUND.intValue()) {
                    updateUserSyncState(syncState, UserSyncStatus.COMPLETED);
                    this.userManagerDM.updateIssueExists(this.userDM, false);
                    this.platform.getConversationInboxDAO().saveHasOlderMessages(this.userDM.getLocalId().longValue(), false);
                } else if (e.exceptionType == NetworkException.NON_RETRIABLE) {
                    updateUserSyncState(syncState, UserSyncStatus.FAILED);
                } else {
                    updateUserSyncState(syncState, UserSyncStatus.FAILED);
                    throw e;
                }
            }
        }
    }

    public void retry() {
        syncUserInternal();
    }
}
