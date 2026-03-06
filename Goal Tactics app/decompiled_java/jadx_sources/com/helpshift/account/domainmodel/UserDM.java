package com.helpshift.account.domainmodel;

import com.helpshift.account.UserDMObserver;
import java.util.Observable;

/* JADX INFO: loaded from: classes.dex */
public class UserDM extends Observable implements UserDMObserver {
    private String authToken;
    private String deviceId;
    private String email;
    private String identifier;
    private boolean isActiveUser;
    private boolean isAnonymousUser;
    private boolean isPushTokenSynced;
    private boolean issueExists;
    private Long localId;
    private String name;
    private UserSyncStatus syncState;

    public UserDM(Long l, String str, String str2, String str3, String str4, boolean z, boolean z2, boolean z3, String str5, boolean z4, UserSyncStatus userSyncStatus) {
        this.localId = l;
        this.identifier = str;
        this.email = str2;
        this.name = str3;
        this.deviceId = str4;
        this.isActiveUser = z;
        this.isAnonymousUser = z2;
        this.isPushTokenSynced = z3;
        this.authToken = str5;
        this.issueExists = z4;
        this.syncState = userSyncStatus;
    }

    public Long getLocalId() {
        return this.localId;
    }

    public String getIdentifier() {
        return this.identifier;
    }

    public String getEmail() {
        return this.email;
    }

    public String getName() {
        return this.name;
    }

    public String getDeviceId() {
        return this.deviceId;
    }

    public boolean isActiveUser() {
        return this.isActiveUser;
    }

    public boolean isAnonymousUser() {
        return this.isAnonymousUser;
    }

    public boolean isPushTokenSynced() {
        return this.isPushTokenSynced;
    }

    public String getAuthToken() {
        return this.authToken;
    }

    public boolean issueExists() {
        return this.issueExists;
    }

    public UserSyncStatus getSyncState() {
        return this.syncState;
    }

    @Override // com.helpshift.account.UserDMObserver
    public void onUserDataChange(UserDM userDM, UserDM userDM2) {
        if (equals(userDM)) {
            this.issueExists = userDM2.issueExists();
            this.authToken = userDM2.getAuthToken();
            this.name = userDM2.getName();
            this.email = userDM2.getEmail();
            this.syncState = userDM2.getSyncState();
            this.isActiveUser = userDM2.isActiveUser();
            this.isPushTokenSynced = userDM2.isPushTokenSynced;
            setChanged();
            notifyObservers();
        }
    }

    public static final class Builder {
        private String authToken;
        private String deviceId;
        private String email;
        private String identifier;
        private boolean isActiveUser;
        private boolean isAnonymousUser;
        private boolean isPushTokenSynced;
        private boolean issueExists;
        private Long localId;
        private String name;
        private UserSyncStatus syncState;

        public Builder(UserDM userDM) {
            this.localId = userDM.localId;
            this.identifier = userDM.identifier;
            this.email = userDM.email;
            this.name = userDM.name;
            this.deviceId = userDM.deviceId;
            this.isActiveUser = userDM.isActiveUser;
            this.isAnonymousUser = userDM.isAnonymousUser;
            this.isPushTokenSynced = userDM.isPushTokenSynced;
            this.authToken = userDM.authToken;
            this.issueExists = userDM.issueExists;
            this.syncState = userDM.syncState;
        }

        public Builder setName(String str) {
            this.name = str;
            return this;
        }

        public Builder setEmail(String str) {
            this.email = str;
            return this;
        }

        public Builder setIssueExists(boolean z) {
            this.issueExists = z;
            return this;
        }

        public Builder setIsActiveUser(boolean z) {
            this.isActiveUser = z;
            return this;
        }

        public Builder setAuthToken(String str) {
            this.authToken = str;
            return this;
        }

        public Builder setIsPushTokenSynced(boolean z) {
            this.isPushTokenSynced = z;
            return this;
        }

        public Builder setSyncState(UserSyncStatus userSyncStatus) {
            this.syncState = userSyncStatus;
            return this;
        }

        public UserDM build() {
            return new UserDM(this.localId, this.identifier, this.email, this.name, this.deviceId, this.isActiveUser, this.isAnonymousUser, this.isPushTokenSynced, this.authToken, this.issueExists, this.syncState);
        }
    }
}
