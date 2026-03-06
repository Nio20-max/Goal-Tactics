package com.helpshift.campaigns;

import android.text.TextUtils;
import com.helpshift.campaigns.controllers.ControllerFactory;
import com.helpshift.campaigns.delegates.InboxMessageDelegate;
import com.helpshift.campaigns.delegates.InboxPushNotificationDelegate;
import com.helpshift.campaigns.models.AnalyticsEvent;
import com.helpshift.campaigns.models.CampaignDetailModel;
import com.helpshift.campaigns.models.InboxMessage;
import com.helpshift.campaigns.observers.CampaignStorageObserver;
import com.helpshift.campaigns.storage.CampaignStorage;
import com.helpshift.campaigns.storage.CampaignsStorageFactory;
import com.helpshift.campaigns.util.InAppCampaignsUtil;
import com.helpshift.util.HelpshiftContext;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class Inbox implements CampaignStorageObserver {
    private static Inbox instance;
    private InboxPushNotificationDelegate inboxPushNotificationDelegate;
    private InboxMessageDelegate messageDelegate;
    private CampaignStorage campaignStorage = CampaignsStorageFactory.getInstance().campaignStorage;
    private List<InboxMessage> messages = getAllActiveCampaigns();

    private Inbox() {
        this.campaignStorage.addObserver(this);
        ControllerFactory.getInstance().inboxApi = this;
    }

    public static synchronized Inbox getInstance() {
        if (instance == null) {
            instance = new Inbox();
        }
        return instance;
    }

    private List<InboxMessage> getAllActiveCampaigns() {
        return new ArrayList(InAppCampaignsUtil.cleanAndGetActiveCampaigns(HelpshiftContext.getApplicationContext(), this.campaignStorage, ControllerFactory.getInstance().userController.getCurrentUser().identifier));
    }

    public List<InboxMessage> getAllInboxMessages() {
        List<InboxMessage> allActiveCampaigns = getAllActiveCampaigns();
        this.messages = allActiveCampaigns;
        return allActiveCampaigns;
    }

    public InboxMessage getInboxMessage(String str) {
        List<InboxMessage> list;
        if (TextUtils.isEmpty(str) || (list = this.messages) == null) {
            return null;
        }
        for (InboxMessage inboxMessage : list) {
            CampaignDetailModel campaignDetailModel = (CampaignDetailModel) inboxMessage;
            if (str.equals(campaignDetailModel.getIdentifier()) && !campaignDetailModel.isExpired()) {
                return inboxMessage;
            }
        }
        return null;
    }

    public void markInboxMessageAsRead(String str) {
        List<InboxMessage> list;
        if (TextUtils.isEmpty(str) || (list = this.messages) == null) {
            return;
        }
        Iterator<InboxMessage> it = list.iterator();
        while (it.hasNext()) {
            CampaignDetailModel campaignDetailModel = (CampaignDetailModel) it.next();
            if (str.equals(campaignDetailModel.getIdentifier())) {
                campaignDetailModel.setReadStatus(true);
                this.campaignStorage.markCampaignAsRead(str);
                ControllerFactory.getInstance().analyticsEventController.recordAnalyticsEvent(AnalyticsEvent.AnalyticsEventType.MARK_AS_READ, str, false);
            }
        }
    }

    public void markInboxMessageAsSeen(String str) {
        List<InboxMessage> list;
        if (TextUtils.isEmpty(str) || (list = this.messages) == null) {
            return;
        }
        Iterator<InboxMessage> it = list.iterator();
        while (it.hasNext()) {
            CampaignDetailModel campaignDetailModel = (CampaignDetailModel) it.next();
            if (str.equals(campaignDetailModel.getIdentifier()) && !campaignDetailModel.isExpired()) {
                campaignDetailModel.setSeenStatus(true);
                this.campaignStorage.markCampaignAsSeen(str);
                ControllerFactory.getInstance().analyticsEventController.recordAnalyticsEvent(AnalyticsEvent.AnalyticsEventType.VIEW, str, false);
            }
        }
    }

    public void deleteInboxMessage(String str) {
        List<InboxMessage> list;
        if (TextUtils.isEmpty(str) || (list = this.messages) == null) {
            return;
        }
        InboxMessage inboxMessage = null;
        Iterator<InboxMessage> it = list.iterator();
        while (true) {
            if (!it.hasNext()) {
                break;
            }
            InboxMessage next = it.next();
            if (str.equals(((CampaignDetailModel) next).getIdentifier())) {
                inboxMessage = next;
                break;
            }
        }
        if (inboxMessage != null) {
            this.messages.remove(inboxMessage);
            this.campaignStorage.deleteCampaign(str);
            ControllerFactory.getInstance().analyticsEventController.recordAnalyticsEvent(AnalyticsEvent.AnalyticsEventType.MARK_AS_DELETE, str, false);
        }
    }

    public void setInboxMessageDelegate(InboxMessageDelegate inboxMessageDelegate) {
        if (inboxMessageDelegate != null) {
            this.messageDelegate = inboxMessageDelegate;
        }
    }

    public InboxPushNotificationDelegate getInboxPushNotificationDelegate() {
        return this.inboxPushNotificationDelegate;
    }

    public void setInboxPushNotificationDelegate(InboxPushNotificationDelegate inboxPushNotificationDelegate) {
        if (inboxPushNotificationDelegate != null) {
            this.inboxPushNotificationDelegate = inboxPushNotificationDelegate;
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignDetailModelAdded(CampaignDetailModel campaignDetailModel) {
        this.messages = getAllActiveCampaigns();
        InboxMessageDelegate inboxMessageDelegate = this.messageDelegate;
        if (inboxMessageDelegate != null) {
            inboxMessageDelegate.inboxMessageAdded(campaignDetailModel);
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignIconImageFilePathUpdated(String str) {
        this.messages = getAllActiveCampaigns();
        InboxMessageDelegate inboxMessageDelegate = this.messageDelegate;
        if (inboxMessageDelegate != null) {
            inboxMessageDelegate.iconImageDownloaded(str);
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignCoverImageFilePathUpdated(String str) {
        this.messages = getAllActiveCampaigns();
        InboxMessageDelegate inboxMessageDelegate = this.messageDelegate;
        if (inboxMessageDelegate != null) {
            inboxMessageDelegate.coverImageDownloaded(str);
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignDeleted(String str) {
        this.messages = getAllActiveCampaigns();
        InboxMessageDelegate inboxMessageDelegate = this.messageDelegate;
        if (inboxMessageDelegate != null) {
            inboxMessageDelegate.inboxMessageDeleted(str);
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignRead(String str) {
        this.messages = getAllActiveCampaigns();
        InboxMessageDelegate inboxMessageDelegate = this.messageDelegate;
        if (inboxMessageDelegate != null) {
            inboxMessageDelegate.inboxMessageMarkedAsRead(str);
        }
    }

    @Override // com.helpshift.campaigns.observers.CampaignStorageObserver
    public void campaignSeen(String str) {
        this.messages = getAllActiveCampaigns();
        InboxMessageDelegate inboxMessageDelegate = this.messageDelegate;
        if (inboxMessageDelegate != null) {
            inboxMessageDelegate.inboxMessageMarkedAsSeen(str);
        }
    }

    public void deallocate() {
        this.campaignStorage.removeObserver(this);
        ControllerFactory.getInstance().inboxApi = null;
        destroy();
    }

    private static void destroy() {
        instance = null;
    }
}
