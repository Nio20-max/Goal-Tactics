package com.helpshift.providers;

/* JADX INFO: loaded from: classes2.dex */
public class CrossModuleDataProvider {
    private static ICampaignsModuleAPIs campaignsModuleAPIs;
    private static ISupportDataProvider supportDataProvider;

    public static void setCampaignsDataProvider(ICampaignsModuleAPIs iCampaignsModuleAPIs) {
        campaignsModuleAPIs = iCampaignsModuleAPIs;
    }

    public static ICampaignsModuleAPIs getCampaignModuleAPIs() {
        return campaignsModuleAPIs;
    }

    public static ISupportDataProvider getSupportDataProvider() {
        return supportDataProvider;
    }

    public static void setSupportDataProvider(ISupportDataProvider iSupportDataProvider) {
        supportDataProvider = iSupportDataProvider;
    }
}
