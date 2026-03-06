package com.helpshift;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import com.helpshift.Core;
import com.helpshift.HelpshiftUser;
import com.helpshift.account.domainmodel.UserDM;
import com.helpshift.campaigns.Campaigns;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.util.CampaignsNotification;
import com.helpshift.executors.ActionExecutor;
import com.helpshift.executors.SupportCampaignsActionExecutor;
import com.helpshift.notifications.NotificationChannelsManager;
import com.helpshift.support.Support;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.StringUtils;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class All implements Core.ApiProvider {
    private Campaigns campaigns = Campaigns.getInstance();
    private Support support = Support.getInstance();

    All() {
    }

    public static All getInstance() {
        return LazyHolder.INSTANCE;
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _preInstall(Application application, String str, String str2, String str3, Map<String, Object> map) {
        this.campaigns._preInstall(application, str, str2, str3, map);
        this.support._preInstall(application, str, str2, str3, map);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _install(Application application, String str, String str2, String str3) {
        _install(application, str, str2, str3, new HashMap());
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _install(Application application, String str, String str2, String str3, Map<String, Object> map) {
        this.campaigns._install(application, str, str2, str3, map);
        this.support._install(application, str, str2, str3, map);
        makeLoginConsistent();
        new NotificationChannelsManager(application).checkAndUpdateDefaultChannelInfo();
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _setNameAndEmail(String str, String str2) {
        this.campaigns._setNameAndEmail(str, str2);
        this.support._setNameAndEmail(str, str2);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _registerDeviceToken(Context context, String str) {
        this.campaigns._registerDeviceToken(context, str);
        this.support._registerDeviceToken(context, str);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _handlePush(Context context, Intent intent) {
        if (CampaignsNotification.getCampaignsId(intent) != null) {
            this.campaigns._handlePush(context, intent);
        } else {
            this.support._handlePush(context, intent);
        }
    }

    @Override // com.helpshift.Core.ApiProvider
    public boolean _login(HelpshiftUser helpshiftUser) {
        boolean z_login = this.support._login(helpshiftUser);
        if (!z_login) {
            return z_login;
        }
        return this.campaigns._login(buildHelpshiftUserForCampaignLogin(helpshiftUser));
    }

    @Override // com.helpshift.Core.ApiProvider
    public boolean _logout() {
        if (this.support._logout()) {
            return this.campaigns._logout();
        }
        return false;
    }

    @Override // com.helpshift.Core.ApiProvider
    public boolean _clearAnonymousUser() {
        if (this.support._clearAnonymousUser()) {
            return this.campaigns._clearAnonymousUser();
        }
        return false;
    }

    @Override // com.helpshift.Core.ApiProvider
    public ActionExecutor _getActionExecutor() {
        return new SupportCampaignsActionExecutor();
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _setSDKLanguage(String str) {
        this.campaigns._setSDKLanguage(str);
        this.support._setSDKLanguage(str);
    }

    @Override // com.helpshift.Core.ApiProvider
    public void _setTheme(int i) {
        this.campaigns._setTheme(i);
        this.support._setTheme(i);
    }

    private void makeLoginConsistent() {
        String str = ControllerFactory.getInstance().userController.getCurrentUser().identifier;
        boolean zEquals = ControllerFactory.getInstance().deviceController.deviceModel.getIdentifier().equals(str);
        UserDM activeUser = HelpshiftContext.getCoreApi().getUserManagerDM().getActiveUser();
        if (activeUser.isAnonymousUser()) {
            if (zEquals) {
                return;
            }
            this.campaigns._logout();
        } else {
            HelpshiftUser helpshiftUserBuildHelpshiftUserForCampaignLogin = buildHelpshiftUserForCampaignLogin(new HelpshiftUser.Builder(activeUser.getIdentifier(), activeUser.getEmail()).setName(activeUser.getName()).build());
            if (zEquals || !str.equals(helpshiftUserBuildHelpshiftUserForCampaignLogin.getIdentifier())) {
                this.campaigns._login(helpshiftUserBuildHelpshiftUserForCampaignLogin);
            }
        }
    }

    private HelpshiftUser buildHelpshiftUserForCampaignLogin(HelpshiftUser helpshiftUser) {
        return StringUtils.isEmpty(helpshiftUser.getIdentifier()) ? new HelpshiftUser.Builder(helpshiftUser.getEmail(), helpshiftUser.getEmail()).setName(helpshiftUser.getName()).setAuthToken(helpshiftUser.getAuthToken()).build() : helpshiftUser;
    }

    private static class LazyHolder {
        static final All INSTANCE = new All();

        private LazyHolder() {
        }
    }
}
