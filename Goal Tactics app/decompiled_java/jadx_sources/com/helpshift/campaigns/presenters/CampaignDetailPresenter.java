package com.helpshift.campaigns.presenters;

import android.app.Activity;
import android.graphics.Bitmap;
import android.text.TextUtils;
import com.helpshift.R;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.interactors.CampaignDetailInteractor;
import com.helpshift.campaigns.models.ActionModel;
import com.helpshift.campaigns.models.CampaignDetailModel;
import com.helpshift.campaigns.observers.CampaignDetailObserver;
import com.helpshift.campaigns.observers.CampaignDetailPresenterObserver;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.ImageUtil;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class CampaignDetailPresenter implements CampaignDetailObserver {
    private CampaignDetailInteractor detailInteractor;
    private List<CampaignDetailPresenterObserver> observers = new ArrayList();

    @Override // com.helpshift.campaigns.observers.CampaignDetailObserver
    public void campaignIconImageDownloaded() {
    }

    public CampaignDetailPresenter(CampaignDetailInteractor campaignDetailInteractor) {
        this.detailInteractor = campaignDetailInteractor;
    }

    public HashMap<String, Object> getCoverImage() {
        Bitmap bitmap;
        String str;
        HashMap<String, Object> map = new HashMap<>();
        CampaignDetailModel campaignDetailModel = this.detailInteractor.getCampaignDetailModel();
        if (campaignDetailModel != null) {
            bitmap = ImageUtil.getBitmap(campaignDetailModel.coverImageFilePath, -1);
            str = campaignDetailModel.coverImageUrl;
        } else {
            bitmap = null;
            str = "";
        }
        if (bitmap == null && campaignDetailModel != null && !TextUtils.isEmpty(str)) {
            bitmap = ImageUtil.getBitmap(HelpshiftContext.getApplicationContext().getResources(), R.drawable.hs__cam_inbox_default_cover, -1);
            map.put("default", true);
            String str2 = campaignDetailModel.coverImageFilePath;
            if (!TextUtils.isEmpty(str2)) {
                File file = new File(str2);
                if (file.exists()) {
                    file.delete();
                }
            }
            ControllerFactory.getInstance().inboxSyncController.startCoverImageDownload(str, campaignDetailModel.getIdentifier());
        } else {
            ControllerFactory.getInstance().inboxSyncController.resetCorruptImageDownloadRetryCount(str);
        }
        map.put("bitmap", bitmap);
        return map;
    }

    public String getTitle() {
        return this.detailInteractor.getCampaignDetailModel() != null ? this.detailInteractor.getCampaignDetailModel().getTitle() : "";
    }

    public String getTitleColor() {
        return this.detailInteractor.getCampaignDetailModel() != null ? this.detailInteractor.getCampaignDetailModel().getTitleColor() : "";
    }

    public String getBody() {
        return this.detailInteractor.getCampaignDetailModel() != null ? this.detailInteractor.getCampaignDetailModel().getBody() : "";
    }

    public String getTextColor() {
        return this.detailInteractor.getCampaignDetailModel() != null ? this.detailInteractor.getCampaignDetailModel().getBodyColor() : "";
    }

    public String getBackgroundColor() {
        return this.detailInteractor.getCampaignDetailModel() != null ? this.detailInteractor.getCampaignDetailModel().getBackgroundColor() : "";
    }

    public boolean isExpired() {
        CampaignDetailModel campaignDetailModel = this.detailInteractor.getCampaignDetailModel();
        return campaignDetailModel != null && campaignDetailModel.isExpired();
    }

    public int getCountOfActions() {
        List<ActionModel> list = this.detailInteractor.getCampaignDetailModel() != null ? this.detailInteractor.getCampaignDetailModel().actions : null;
        if (list != null) {
            return list.size();
        }
        return 0;
    }

    public String getActionTitle(int i) {
        return (this.detailInteractor.getCampaignDetailModel() == null || i < 0 || i >= this.detailInteractor.getCampaignDetailModel().actions.size()) ? "" : this.detailInteractor.getCampaignDetailModel().actions.get(i).title;
    }

    public String getActionTitleColor(int i) {
        return (this.detailInteractor.getCampaignDetailModel() == null || i < 0 || i >= this.detailInteractor.getCampaignDetailModel().actions.size()) ? "" : this.detailInteractor.getCampaignDetailModel().actions.get(i).textColor;
    }

    public void markCampaignAsSeen() {
        if (isExpired()) {
            return;
        }
        this.detailInteractor.markCampaignAsSeen();
    }

    public void buttonClicked(int i, Activity activity) {
        this.detailInteractor.executeAction(i, activity);
    }

    @Override // com.helpshift.campaigns.observers.CampaignDetailObserver
    public void campaignDetailAdded() {
        Iterator<CampaignDetailPresenterObserver> it = this.observers.iterator();
        while (it.hasNext()) {
            it.next().dataChanged();
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignDetailObserver
    public void campaignCoverImageDownloaded() {
        Iterator<CampaignDetailPresenterObserver> it = this.observers.iterator();
        while (it.hasNext()) {
            it.next().dataChanged();
        }
    }

    public void addObserver(CampaignDetailPresenterObserver campaignDetailPresenterObserver) {
        this.observers.add(campaignDetailPresenterObserver);
    }

    public void removeObserver(CampaignDetailPresenterObserver campaignDetailPresenterObserver) {
        this.observers.remove(campaignDetailPresenterObserver);
    }

    public void setUp() {
        this.detailInteractor.setUp();
        this.detailInteractor.addObserver(this);
    }

    public void cleanUp() {
        this.detailInteractor.cleanUp();
        this.detailInteractor.removeObserver(this);
    }
}
