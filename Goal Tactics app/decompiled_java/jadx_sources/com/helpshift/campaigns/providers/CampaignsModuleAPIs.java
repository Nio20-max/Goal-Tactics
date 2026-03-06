package com.helpshift.campaigns.providers;

import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.providers.ICampaignsModuleAPIs;

/* JADX INFO: loaded from: classes.dex */
public class CampaignsModuleAPIs implements ICampaignsModuleAPIs {
    @Override // com.helpshift.providers.ICampaignsModuleAPIs
    public String getUserIdentifier() {
        return ControllerFactory.getInstance().userController.getCurrentUser().identifier;
    }

    @Override // com.helpshift.providers.ICampaignsModuleAPIs
    public String getDeviceIdentifier() {
        return ControllerFactory.getInstance().deviceController.deviceModel.getIdentifier();
    }

    @Override // com.helpshift.providers.ICampaignsModuleAPIs
    public void logout() {
        ControllerFactory.getInstance().userController.logout();
    }
}
