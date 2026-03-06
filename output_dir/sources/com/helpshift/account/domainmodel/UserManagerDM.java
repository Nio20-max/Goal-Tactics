package com.helpshift.account.domainmodel;

import com.helpshift.HelpshiftUser;
import com.helpshift.account.UserDMObserver;
import com.helpshift.account.dao.ClearedUserDAO;
import com.helpshift.account.dao.ClearedUserSyncState;
import com.helpshift.account.dao.UserDAO;
import com.helpshift.account.dao.UserManagerDAO;
import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.common.AutoRetriableDM;
import com.helpshift.common.AutoRetryFailedEventDM;
import com.helpshift.common.HelpshiftUtils;
import com.helpshift.common.dao.BackupDAO;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.F;
import com.helpshift.common.domain.network.AuthenticationFailureNetwork;
import com.helpshift.common.domain.network.FailedAPICallNetworkDecorator;
import com.helpshift.common.domain.network.GuardOKNetwork;
import com.helpshift.common.domain.network.Network;
import com.helpshift.common.domain.network.NetworkDataRequestUtil;
import com.helpshift.common.domain.network.POSTNetwork;
import com.helpshift.common.domain.network.PUTNetwork;
import com.helpshift.common.domain.network.TSCorrectedNetwork;
import com.helpshift.common.domain.network.UserNotFoundNetwork;
import com.helpshift.common.exception.NetworkException;
import com.helpshift.common.exception.RootAPIException;
import com.helpshift.common.platform.Device;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.platform.network.RequestData;
import com.helpshift.util.HSFormat;
import com.helpshift.util.ListUtils;
import com.helpshift.util.StringUtils;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class UserManagerDM implements AutoRetriableDM {
    private static final String ANONYMOUS_USER_ID_BACKUP_KEY = "anonymous_user_id_backup_key";
    private UserDM activeUserDM;
    private UserSetupDM activeUserSetupDM;
    private BackupDAO backupDAO;
    private ClearedUserDAO clearedUserDAO;
    private Device device;
    private Domain domain;
    private Platform platform;
    private UserDAO userDAO;
    private Set<UserDMObserver> userDMObservers;
    private UserManagerDAO userManagerDAO;

    public UserManagerDM(Platform platform, Domain domain) {
        this.platform = platform;
        this.domain = domain;
    }

    public void init() {
        this.device = this.platform.getDevice();
        this.userDAO = this.platform.getUserDAO();
        this.userManagerDAO = this.platform.getUserManagerDAO();
        this.backupDAO = this.platform.getBackupDAO();
        this.clearedUserDAO = this.platform.getClearedUserDAO();
        this.domain.getAutoRetryFailedEventDM().register(AutoRetryFailedEventDM.EventType.PUSH_TOKEN, this);
        this.domain.getAutoRetryFailedEventDM().register(AutoRetryFailedEventDM.EventType.CLEAR_USER, this);
        updateAnonymousIDInBackupDAO();
    }

    public UserDM getActiveUser() {
        UserDM userDM = this.activeUserDM;
        if (userDM != null) {
            return userDM;
        }
        UserDM activeUser = this.userDAO.getActiveUser();
        this.activeUserDM = activeUser;
        if (activeUser == null) {
            loginWithAnonymousUser();
        } else {
            addUserDMObserver(activeUser);
            this.activeUserSetupDM = null;
        }
        return this.activeUserDM;
    }

    public synchronized void login(HelpshiftUser helpshiftUser) {
        UserDM userDMFetchUser = this.userDAO.fetchUser(helpshiftUser.getIdentifier(), helpshiftUser.getEmail());
        if (userDMFetchUser == null) {
            userDMFetchUser = this.userDAO.createUser(buildUser(helpshiftUser));
        }
        if (userDMFetchUser != null) {
            addUserDMObserver(userDMFetchUser);
            activateUser(userDMFetchUser);
        }
    }

    public synchronized boolean loginWithAnonymousUser() {
        UserDM anonymousUser = getAnonymousUser();
        if (anonymousUser == null) {
            anonymousUser = createAnonymousUser();
        }
        activateUser(anonymousUser);
        return true;
    }

    public synchronized UserDM createAnonymousUser() {
        return this.userDAO.createUser(new UserDM(null, generateAnonymousUserId(), null, null, this.device.getDeviceId(), false, true, false, null, true, UserSyncStatus.NOT_STARTED));
    }

    private synchronized void activateUser(UserDM userDM) {
        if (userDM == null) {
            return;
        }
        UserDM userDM2 = this.activeUserDM;
        if (userDM2 == null || !userDM2.getLocalId().equals(userDM.getLocalId())) {
            if (this.userDAO.activateUser(userDM.getLocalId())) {
                UserDM userDM3 = this.activeUserDM;
                if (userDM3 != null) {
                    notifyUserDMObservers(this.activeUserDM, new UserDM.Builder(userDM3).setIsActiveUser(false).build());
                }
                UserDM userDMBuild = new UserDM.Builder(userDM).setIsActiveUser(true).build();
                this.activeUserDM = userDMBuild;
                this.activeUserSetupDM = null;
                addUserDMObserver(userDMBuild);
            }
        }
    }

    private synchronized UserDM buildUser(HelpshiftUser helpshiftUser) {
        return new UserDM(null, helpshiftUser.getIdentifier(), helpshiftUser.getEmail(), helpshiftUser.getName(), this.device.getDeviceId(), false, false, false, helpshiftUser.getAuthToken(), true, UserSyncStatus.NOT_STARTED);
    }

    private synchronized String generateAnonymousUserId() {
        String str;
        Serializable value = this.backupDAO.getValue(ANONYMOUS_USER_ID_BACKUP_KEY);
        str = value instanceof String ? (String) value : null;
        if (StringUtils.isEmpty(str)) {
            str = "hsft_anon_" + HSFormat.timeStampAnonymousUserFormat.format(new Date(System.currentTimeMillis())) + "-" + StringUtils.generateRandomString(HSFormat.alphaNumericCharacters.toCharArray(), 15);
            this.backupDAO.storeValue(ANONYMOUS_USER_ID_BACKUP_KEY, str);
        }
        return str;
    }

    private void updateAnonymousIDInBackupDAO() {
        UserDM anonymousUser = getAnonymousUser();
        if (anonymousUser != null) {
            this.backupDAO.storeValue(ANONYMOUS_USER_ID_BACKUP_KEY, anonymousUser.getIdentifier());
        }
    }

    public UserDM getAnonymousUser() {
        UserDM userDM = this.activeUserDM;
        if (userDM != null && userDM.isAnonymousUser()) {
            return this.activeUserDM;
        }
        return this.userDAO.getAnonymousUser();
    }

    public boolean deleteUser(UserDM userDM) {
        Long localId;
        if (userDM == null) {
            return false;
        }
        boolean zDeleteUser = this.userDAO.deleteUser(userDM.getLocalId());
        if (zDeleteUser) {
            if (userDM.isAnonymousUser()) {
                this.backupDAO.removeKey(ANONYMOUS_USER_ID_BACKUP_KEY);
            }
            UserDM userDM2 = this.activeUserDM;
            if (userDM2 != null && (localId = userDM2.getLocalId()) != null && localId.equals(userDM.getLocalId())) {
                Set<UserDMObserver> set = this.userDMObservers;
                if (set != null) {
                    set.remove(this.activeUserDM);
                }
                this.activeUserDM = null;
                this.activeUserSetupDM = null;
            }
        }
        return zDeleteUser;
    }

    public void registerUserWithServer(UserDM userDM) {
        HashMap<String, String> userRequestData = NetworkDataRequestUtil.getUserRequestData(userDM);
        userRequestData.put("name", userDM.getName());
        try {
            buildCreateProfileNetwork().makeRequest(new RequestData(userRequestData));
        } catch (RootAPIException e) {
            if (e.exceptionType == NetworkException.INVALID_AUTH_TOKEN || e.exceptionType == NetworkException.AUTH_TOKEN_NOT_PROVIDED) {
                this.domain.getAuthenticationFailureDM().notifyAuthenticationFailure(userDM, e.exceptionType);
            }
            throw e;
        }
    }

    public synchronized void resetPushTokenSyncStatusForUsers() {
        for (UserDM userDM : this.userDAO.fetchUsers()) {
            if (this.activeUserDM != null && userDM.getLocalId().equals(this.activeUserDM.getLocalId())) {
                updateIsPushTokenSynced(this.activeUserDM, false);
            } else {
                updateIsPushTokenSynced(userDM, false);
            }
        }
    }

    public synchronized void sendPushTokenSync() {
        try {
            sendPushTokenInternal();
        } catch (RootAPIException e) {
            this.domain.getAutoRetryFailedEventDM().scheduleRetryTaskForEventType(AutoRetryFailedEventDM.EventType.PUSH_TOKEN, e.getServerStatusCode());
            throw e;
        }
    }

    public synchronized void sendPushToken() {
        if (getActiveUserSetupDM().getState() != UserSetupState.COMPLETED) {
            return;
        }
        this.domain.runParallel(new F() { // from class: com.helpshift.account.domainmodel.UserManagerDM.1
            @Override // com.helpshift.common.domain.F
            public void f() {
                UserManagerDM.this.sendPushTokenSync();
            }
        });
    }

    public String getUserMetaIdentifier() {
        UserDM activeUser = getActiveUser();
        if (activeUser.isAnonymousUser()) {
            return this.userManagerDAO.getUserMetaIdentifier();
        }
        return activeUser.getIdentifier();
    }

    public void setUserMetaIdentifier(String str) {
        this.userManagerDAO.setUserMetaIdentifier(str);
    }

    public List<UserDM> getAllUsers() {
        return this.userDAO.fetchUsers();
    }

    private void sendPushTokenInternal() {
        String pushToken = this.device.getPushToken();
        UserDM activeUser = getActiveUser();
        if (StringUtils.isEmpty(pushToken) || activeUser.isPushTokenSynced() || !activeUser.issueExists() || getActiveUserSetupDM().getState() != UserSetupState.COMPLETED) {
            return;
        }
        HashMap<String, String> userRequestData = NetworkDataRequestUtil.getUserRequestData(activeUser);
        userRequestData.put("token", pushToken);
        try {
            new GuardOKNetwork(new FailedAPICallNetworkDecorator(new UserNotFoundNetwork(new AuthenticationFailureNetwork(new TSCorrectedNetwork(new POSTNetwork("/update-push-token/", this.domain, this.platform), this.platform))))).makeRequest(new RequestData(userRequestData));
            updateIsPushTokenSynced(activeUser, true);
        } catch (RootAPIException e) {
            if (e.exceptionType == NetworkException.USER_NOT_FOUND) {
                return;
            }
            if (e.exceptionType == NetworkException.INVALID_AUTH_TOKEN || e.exceptionType == NetworkException.AUTH_TOKEN_NOT_PROVIDED) {
                this.domain.getAuthenticationFailureDM().notifyAuthenticationFailure(activeUser, e.exceptionType);
                throw e;
            }
            if (e.exceptionType == NetworkException.NON_RETRIABLE) {
                updateIsPushTokenSynced(activeUser, true);
                return;
            }
            throw e;
        }
    }

    private Network buildCreateProfileNetwork() {
        return new GuardOKNetwork(new TSCorrectedNetwork(new AuthenticationFailureNetwork(new POSTNetwork("/profiles/", this.domain, this.platform)), this.platform));
    }

    public synchronized void updateIssueExists(UserDM userDM, boolean z) {
        if (userDM.issueExists() == z) {
            return;
        }
        UserDM userDMBuild = new UserDM.Builder(userDM).setIssueExists(z).build();
        if (this.userDAO.updateUser(userDMBuild)) {
            notifyUserDMObservers(userDM, userDMBuild);
        }
    }

    public synchronized void updateAuthToken(UserDM userDM, String str) {
        UserDM userDMBuild = new UserDM.Builder(userDM).setAuthToken(str).build();
        if (this.userDAO.updateUser(userDMBuild)) {
            notifyUserDMObservers(userDM, userDMBuild);
        }
    }

    public synchronized void updateUserName(UserDM userDM, String str) {
        UserDM userDMBuild = new UserDM.Builder(userDM).setName(str).build();
        if (this.userDAO.updateUser(userDMBuild)) {
            notifyUserDMObservers(userDM, userDMBuild);
        }
    }

    public synchronized void updateSyncState(UserDM userDM, UserSyncStatus userSyncStatus) {
        if (userDM.getSyncState() == userSyncStatus) {
            return;
        }
        UserDM userDMBuild = new UserDM.Builder(userDM).setSyncState(userSyncStatus).build();
        if (this.userDAO.updateUser(userDMBuild)) {
            notifyUserDMObservers(userDM, userDMBuild);
        }
    }

    public synchronized void resetSyncStateForAllUsers() {
        Iterator<UserDM> it = getAllUsers().iterator();
        while (it.hasNext()) {
            resetSyncState(it.next());
        }
        destroyUserSetupDM();
    }

    public synchronized void resetSyncState(UserDM userDM) {
        updateSyncState(userDM, UserSyncStatus.NOT_STARTED);
    }

    private synchronized void updateIsPushTokenSynced(UserDM userDM, boolean z) {
        if (userDM.isPushTokenSynced() == z) {
            return;
        }
        UserDM userDMBuild = new UserDM.Builder(userDM).setIsPushTokenSynced(z).build();
        if (this.userDAO.updateUser(userDMBuild)) {
            notifyUserDMObservers(userDM, userDMBuild);
        }
    }

    private synchronized void addUserDMObserver(UserDMObserver userDMObserver) {
        if (userDMObserver == null) {
            return;
        }
        if (this.userDMObservers == null) {
            this.userDMObservers = new HashSet();
        }
        this.userDMObservers.add(userDMObserver);
    }

    private synchronized void notifyUserDMObservers(UserDM userDM, UserDM userDM2) {
        Set<UserDMObserver> set = this.userDMObservers;
        if (set == null) {
            return;
        }
        Iterator<UserDMObserver> it = set.iterator();
        while (it.hasNext()) {
            it.next().onUserDataChange(userDM, userDM2);
        }
    }

    public boolean isActiveUser(HelpshiftUser helpshiftUser) {
        if (!HelpshiftUtils.isValidHelpshiftUser(helpshiftUser)) {
            return false;
        }
        UserDM activeUser = this.activeUserDM;
        if (activeUser == null) {
            activeUser = this.userDAO.getActiveUser();
        }
        if (activeUser == null) {
            return false;
        }
        if (StringUtils.isEmptyWithoutTrim(helpshiftUser.getIdentifier())) {
            if (StringUtils.isEmptyWithoutTrim(activeUser.getIdentifier())) {
                return helpshiftUser.getEmail().equals(activeUser.getEmail());
            }
            return false;
        }
        if (!StringUtils.isEmptyWithoutTrim(helpshiftUser.getEmail())) {
            return helpshiftUser.getIdentifier().equals(activeUser.getIdentifier()) && helpshiftUser.getEmail().equals(activeUser.getEmail());
        }
        if (StringUtils.isEmptyWithoutTrim(activeUser.getEmail())) {
            return helpshiftUser.getIdentifier().equals(activeUser.getIdentifier());
        }
        return false;
    }

    public List<UserDM> getInactiveLoggedInUsers() {
        List<UserDM> listFetchUsers = this.userDAO.fetchUsers();
        ArrayList arrayList = new ArrayList();
        if (ListUtils.isEmpty(listFetchUsers)) {
            return arrayList;
        }
        for (UserDM userDM : listFetchUsers) {
            if (!userDM.isAnonymousUser() && !userDM.isActiveUser()) {
                arrayList.add(userDM);
            }
        }
        return arrayList;
    }

    /* JADX INFO: renamed from: com.helpshift.account.domainmodel.UserManagerDM$3, reason: invalid class name */
    static /* synthetic */ class AnonymousClass3 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$common$AutoRetryFailedEventDM$EventType;

        static {
            int[] iArr = new int[AutoRetryFailedEventDM.EventType.values().length];
            $SwitchMap$com$helpshift$common$AutoRetryFailedEventDM$EventType = iArr;
            try {
                iArr[AutoRetryFailedEventDM.EventType.PUSH_TOKEN.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$common$AutoRetryFailedEventDM$EventType[AutoRetryFailedEventDM.EventType.CLEAR_USER.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
        }
    }

    @Override // com.helpshift.common.AutoRetriableDM
    public void sendFailedApiCalls(AutoRetryFailedEventDM.EventType eventType) {
        int i = AnonymousClass3.$SwitchMap$com$helpshift$common$AutoRetryFailedEventDM$EventType[eventType.ordinal()];
        if (i == 1) {
            sendPushTokenInternal();
            return;
        }
        if (i != 2) {
            return;
        }
        List<ClearedUserDM> listFetchClearedUsers = this.clearedUserDAO.fetchClearedUsers();
        if (ListUtils.isEmpty(listFetchClearedUsers)) {
            return;
        }
        for (ClearedUserDM clearedUserDM : listFetchClearedUsers) {
            if (clearedUserDM.syncState == ClearedUserSyncState.COMPLETED) {
                this.clearedUserDAO.deleteClearedUser(clearedUserDM.localId);
            } else {
                clearAnonymousUserInternal(clearedUserDM);
            }
        }
    }

    public synchronized UserSetupDM getActiveUserSetupDM() {
        if (this.activeUserSetupDM == null) {
            UserSetupDM userSetupDM = new UserSetupDM(this.platform, this.domain, getActiveUser(), this, this.domain.getConversationInboxManagerDM().getActiveConversationInboxDM());
            userSetupDM.init();
            this.activeUserSetupDM = userSetupDM;
        }
        return this.activeUserSetupDM;
    }

    public synchronized void destroyUserSetupDM() {
        this.activeUserSetupDM = null;
    }

    public void clearAnonymousUser(UserDM userDM) {
        final ClearedUserDM clearedUserDMInsertClearedUser = this.clearedUserDAO.insertClearedUser(new ClearedUserDM(null, userDM.getIdentifier(), userDM.getEmail(), userDM.getAuthToken(), userDM.getDeviceId(), ClearedUserSyncState.NOT_STARTED));
        this.domain.runParallel(new F() { // from class: com.helpshift.account.domainmodel.UserManagerDM.2
            @Override // com.helpshift.common.domain.F
            public void f() {
                try {
                    UserManagerDM.this.clearAnonymousUserInternal(clearedUserDMInsertClearedUser);
                } catch (RootAPIException e) {
                    UserManagerDM.this.domain.getAutoRetryFailedEventDM().scheduleRetryTaskForEventType(AutoRetryFailedEventDM.EventType.CLEAR_USER, e.getServerStatusCode());
                    throw e;
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearAnonymousUserInternal(ClearedUserDM clearedUserDM) {
        if (clearedUserDM == null || clearedUserDM.localId == null || clearedUserDM.syncState == ClearedUserSyncState.COMPLETED || clearedUserDM.syncState == ClearedUserSyncState.IN_PROGRESS) {
            return;
        }
        GuardOKNetwork guardOKNetwork = new GuardOKNetwork(new FailedAPICallNetworkDecorator(new UserNotFoundNetwork(new TSCorrectedNetwork(new PUTNetwork("/clear-profile/", this.domain, this.platform), this.platform))));
        HashMap<String, String> userRequestData = NetworkDataRequestUtil.getUserRequestData(clearedUserDM);
        this.clearedUserDAO.updateSyncState(clearedUserDM.localId, ClearedUserSyncState.IN_PROGRESS);
        try {
            guardOKNetwork.makeRequest(new RequestData(userRequestData));
            this.clearedUserDAO.updateSyncState(clearedUserDM.localId, ClearedUserSyncState.COMPLETED);
            this.clearedUserDAO.deleteClearedUser(clearedUserDM.localId);
        } catch (RootAPIException e) {
            if (e.exceptionType == NetworkException.USER_NOT_FOUND || e.exceptionType == NetworkException.NON_RETRIABLE) {
                this.clearedUserDAO.updateSyncState(clearedUserDM.localId, ClearedUserSyncState.COMPLETED);
                this.clearedUserDAO.deleteClearedUser(clearedUserDM.localId);
            } else {
                this.clearedUserDAO.updateSyncState(clearedUserDM.localId, ClearedUserSyncState.FAILED);
                throw e;
            }
        }
    }

    public void resetNameAndEmail(UserDM userDM) {
        UserDM userDMBuild = new UserDM.Builder(userDM).setEmail(null).setName(null).build();
        if (this.userDAO.updateUser(userDMBuild)) {
            notifyUserDMObservers(userDM, userDMBuild);
        }
    }
}
