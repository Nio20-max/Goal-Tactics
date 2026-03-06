package com.helpshift.account.domainmodel;

import com.helpshift.CoreApi;
import com.helpshift.HelpshiftUser;
import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.network.NetworkConstants;
import com.helpshift.common.platform.Platform;
import com.helpshift.conversation.domainmodel.ConversationController;
import com.helpshift.providers.ICampaignsModuleAPIs;
import com.helpshift.util.HSLogger;
import com.helpshift.util.StringUtils;
import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
public class UserLoginManager {
    private static final String TAG = "Helpshift_ULoginM";
    private CoreApi coreApi;
    private Domain domain;
    private Platform platform;

    public UserLoginManager(CoreApi coreApi, Domain domain, Platform platform) {
        this.coreApi = coreApi;
        this.domain = domain;
        this.platform = platform;
    }

    public boolean login(HelpshiftUser helpshiftUser) {
        boolean zIsNotEqual;
        UserManagerDM userManagerDM = this.coreApi.getUserManagerDM();
        boolean z = false;
        if (userManagerDM.isActiveUser(helpshiftUser)) {
            zIsNotEqual = StringUtils.isNotEqual(userManagerDM.getActiveUser().getAuthToken(), helpshiftUser.getAuthToken());
        } else {
            if (this.coreApi.isSDKSessionActive()) {
                HSLogger.d(TAG, "Login should be called before starting a Helpshift session");
                return false;
            }
            cleanUpActiveUser();
            userManagerDM.login(helpshiftUser);
            Iterator<UserDM> it = userManagerDM.getInactiveLoggedInUsers().iterator();
            while (it.hasNext()) {
                deleteUser(it.next());
            }
            setUpActiveUser();
            zIsNotEqual = true;
            z = true;
        }
        updateUserNameAndAuthToken(helpshiftUser, userManagerDM);
        if (z) {
            clearConfigRouteETag();
        }
        if (zIsNotEqual) {
            this.domain.getAutoRetryFailedEventDM().onUserAuthenticationUpdated();
        }
        return true;
    }

    private void updateUserNameAndAuthToken(HelpshiftUser helpshiftUser, UserManagerDM userManagerDM) {
        UserDM activeUser = userManagerDM.getActiveUser();
        String authToken = activeUser.getAuthToken();
        if (StringUtils.isNotEqual(activeUser.getName(), helpshiftUser.getName())) {
            userManagerDM.updateUserName(activeUser, helpshiftUser.getName());
        }
        if (StringUtils.isNotEqual(authToken, helpshiftUser.getAuthToken())) {
            userManagerDM.updateAuthToken(activeUser, helpshiftUser.getAuthToken());
        }
    }

    private boolean cleanUpActiveUser() {
        ConversationController activeConversationInboxDM = this.domain.getConversationInboxManagerDM().getActiveConversationInboxDM();
        if (activeConversationInboxDM == null) {
            return false;
        }
        activeConversationInboxDM.clearPushNotifications();
        activeConversationInboxDM.getConversationInboxPoller().stop();
        return true;
    }

    private void setUpActiveUser() {
        ConversationController activeConversationInboxDM = this.domain.getConversationInboxManagerDM().getActiveConversationInboxDM();
        activeConversationInboxDM.showPushNotifications();
        UserSetupDM activeUserSetupDM = this.coreApi.getUserManagerDM().getActiveUserSetupDM();
        if (UserSetupState.COMPLETED == activeUserSetupDM.getState()) {
            activeConversationInboxDM.getConversationInboxPoller().startAppPoller(false);
        } else {
            activeUserSetupDM.startSetup();
        }
    }

    private boolean deleteUser(UserDM userDM) {
        boolean zDeleteUser = this.coreApi.getUserManagerDM().deleteUser(userDM);
        if (zDeleteUser) {
            this.platform.getRedactionDAO().deleteRedactionDetail(userDM.getLocalId().longValue());
            this.domain.getConversationInboxManagerDM().deleteConversations(userDM);
            this.domain.getSmartIntentDM().clearUserData(userDM);
        }
        return zDeleteUser;
    }

    public boolean clearAnonymousUser() {
        UserManagerDM userManagerDM = this.coreApi.getUserManagerDM();
        UserDM anonymousUser = this.coreApi.getUserManagerDM().getAnonymousUser();
        if (anonymousUser == null) {
            return true;
        }
        if (anonymousUser.isActiveUser()) {
            HSLogger.d(TAG, "clearAnonymousUser should be called when a logged-in user is active");
            return false;
        }
        if (!deleteUser(anonymousUser)) {
            return true;
        }
        userManagerDM.clearAnonymousUser(anonymousUser);
        return true;
    }

    public boolean logout() {
        if (this.coreApi.isSDKSessionActive()) {
            HSLogger.d(TAG, "Logout should be called before starting a Helpshift session");
            return false;
        }
        UserManagerDM userManagerDM = this.coreApi.getUserManagerDM();
        UserDM activeUser = userManagerDM.getActiveUser();
        if (activeUser != null && activeUser.isAnonymousUser()) {
            return true;
        }
        if (!cleanUpActiveUser()) {
            return false;
        }
        boolean zLoginWithAnonymousUser = userManagerDM.loginWithAnonymousUser();
        setUpActiveUser();
        if (zLoginWithAnonymousUser) {
            clearConfigRouteETag();
            this.domain.getAutoRetryFailedEventDM().onUserAuthenticationUpdated();
        }
        return zLoginWithAnonymousUser;
    }

    public void clearPersonallyIdentifiableInformation() {
        if (this.coreApi.isSDKSessionActive()) {
            HSLogger.d(TAG, "clear PII should not be called after starting a Helpshift session");
            return;
        }
        UserManagerDM userManagerDM = this.coreApi.getUserManagerDM();
        UserDM activeUser = userManagerDM.getActiveUser();
        if (StringUtils.isEmpty(activeUser.getIdentifier())) {
            if (logout()) {
                deleteUser(activeUser);
                ICampaignsModuleAPIs campaignModuleAPIs = this.platform.getCampaignModuleAPIs();
                if (campaignModuleAPIs != null) {
                    campaignModuleAPIs.logout();
                    return;
                }
                return;
            }
            return;
        }
        userManagerDM.resetNameAndEmail(activeUser);
        this.coreApi.getConversationController().saveName(null);
        this.coreApi.getConversationController().saveEmail(null);
    }

    private void clearConfigRouteETag() {
        this.platform.getNetworkRequestDAO().removeETag(NetworkConstants.SUPPORT_CONFIG_ROUTE);
    }
}
