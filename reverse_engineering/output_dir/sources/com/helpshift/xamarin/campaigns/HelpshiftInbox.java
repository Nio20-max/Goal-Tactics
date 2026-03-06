package com.helpshift.xamarin.campaigns;

import android.app.Activity;
import com.helpshift.campaigns.Inbox;
import com.helpshift.campaigns.delegates.InboxMessageDelegate;
import com.helpshift.campaigns.delegates.InboxPushNotificationDelegate;
import com.helpshift.campaigns.models.CampaignDetailModel;
import com.helpshift.campaigns.models.InboxMessage;
import com.helpshift.util.HSLogger;
import com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class HelpshiftInbox {
    private static final String TAG = "Helpshift_XamInbox";

    public static void cleanUp() {
        Inbox.getInstance().deallocate();
    }

    public static List<HelpshiftInboxMessage> getAllInboxMessages() {
        List<InboxMessage> allInboxMessages = Inbox.getInstance().getAllInboxMessages();
        if (allInboxMessages == null || allInboxMessages.size() == 0) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        Iterator<InboxMessage> it = allInboxMessages.iterator();
        while (it.hasNext()) {
            arrayList.add(convertToXamarinInboxMessage(it.next()));
        }
        HSLogger.d(TAG, "getAllInboxMessages : converted InboxMessage(s) to HelpshiftInboxMessage(s)");
        return arrayList;
    }

    public static HelpshiftInboxMessage getInboxMessageForId(String str) {
        HelpshiftInboxMessage helpshiftInboxMessageConvertToXamarinInboxMessage = convertToXamarinInboxMessage(Inbox.getInstance().getInboxMessage(str));
        HSLogger.d(TAG, "getInboxMessageForId : converted InboxMessage to HelpshiftInboxMessage");
        return helpshiftInboxMessageConvertToXamarinInboxMessage;
    }

    public static void markInboxMessageAsRead(String str) {
        Inbox.getInstance().markInboxMessageAsRead(str);
    }

    public static void markInboxMessageAsSeen(String str) {
        Inbox.getInstance().markInboxMessageAsSeen(str);
    }

    public static void deleteInboxMessage(String str) {
        Inbox.getInstance().deleteInboxMessage(str);
    }

    public static void setInboxNotificationDelegate(final HelpshiftInboxNotificationDelegate helpshiftInboxNotificationDelegate) {
        InboxPushNotificationDelegate inboxPushNotificationDelegate = new InboxPushNotificationDelegate() { // from class: com.helpshift.xamarin.campaigns.HelpshiftInbox.1
            @Override // com.helpshift.campaigns.delegates.InboxPushNotificationDelegate
            public void onInboxMessagePushNotificationClicked(String str) {
                helpshiftInboxNotificationDelegate.onInboxMessagePushNotificationClicked(str);
            }
        };
        HSLogger.d(TAG, "setInboxNotificationDelegate : register InboxPushNotificationDelegate " + inboxPushNotificationDelegate + " for delegating calls to HelpshiftInboxNotificationDelegate " + helpshiftInboxNotificationDelegate);
        Inbox.getInstance().setInboxPushNotificationDelegate(inboxPushNotificationDelegate);
    }

    public static void setInboxMessageDelegate(final HelpshiftInboxMessageDelegate helpshiftInboxMessageDelegate) {
        InboxMessageDelegate inboxMessageDelegate = new InboxMessageDelegate() { // from class: com.helpshift.xamarin.campaigns.HelpshiftInbox.2
            @Override // com.helpshift.campaigns.delegates.InboxMessageDelegate
            public void inboxMessageAdded(InboxMessage inboxMessage) {
                helpshiftInboxMessageDelegate.inboxMessageAdded(HelpshiftInbox.convertToXamarinInboxMessage(inboxMessage));
            }

            @Override // com.helpshift.campaigns.delegates.InboxMessageDelegate
            public void iconImageDownloaded(String str) {
                helpshiftInboxMessageDelegate.iconImageDownloaded(str);
            }

            @Override // com.helpshift.campaigns.delegates.InboxMessageDelegate
            public void coverImageDownloaded(String str) {
                helpshiftInboxMessageDelegate.coverImageDownloaded(str);
            }

            @Override // com.helpshift.campaigns.delegates.InboxMessageDelegate
            public void inboxMessageDeleted(String str) {
                helpshiftInboxMessageDelegate.inboxMessageDeleted(str);
            }

            @Override // com.helpshift.campaigns.delegates.InboxMessageDelegate
            public void inboxMessageMarkedAsSeen(String str) {
                helpshiftInboxMessageDelegate.inboxMessageMarkedAsSeen(str);
            }

            @Override // com.helpshift.campaigns.delegates.InboxMessageDelegate
            public void inboxMessageMarkedAsRead(String str) {
                helpshiftInboxMessageDelegate.inboxMessageMarkedAsRead(str);
            }
        };
        HSLogger.d(TAG, "setInboxMessageDelegate : register InboxMessageDelegate " + inboxMessageDelegate + " for delegating calls to HelpshiftInboxMessageDelegate " + helpshiftInboxMessageDelegate);
        Inbox.getInstance().setInboxMessageDelegate(inboxMessageDelegate);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static HelpshiftInboxMessage convertToXamarinInboxMessage(final InboxMessage inboxMessage) {
        return new HelpshiftInboxMessage() { // from class: com.helpshift.xamarin.campaigns.HelpshiftInbox.3
            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public String getIdentifier() {
                return inboxMessage.getIdentifier();
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public String getCoverImage() {
                return ((CampaignDetailModel) inboxMessage).coverImageFilePath;
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public String getIconImage() {
                return ((CampaignDetailModel) inboxMessage).iconImageFilePath;
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public String getTitle() {
                return inboxMessage.getTitle();
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public String getTitleColor() {
                return inboxMessage.getTitleColor();
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public String getBody() {
                return inboxMessage.getBody();
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public String getBodyColor() {
                return inboxMessage.getBodyColor();
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public String getBackgroundColor() {
                return inboxMessage.getBackgroundColor();
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public long getCreatedAt() {
                return inboxMessage.getCreatedAt();
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public long getExpiryTimeStamp() {
                return inboxMessage.getExpiryTimeStamp();
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public boolean hasExpiryTimeStamp() {
                return inboxMessage.getExpiryTimeStamp() != Long.MAX_VALUE;
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public boolean getReadStatus() {
                return inboxMessage.getReadStatus();
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public boolean getSeenStatus() {
                return inboxMessage.getSeenStatus();
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public int getCountOfActions() {
                return inboxMessage.getCountOfActions();
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public String getActionTitle(int i) {
                return inboxMessage.getActionTitle(i);
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public String getActionTitleColor(int i) {
                return inboxMessage.getActionTitleColor(i);
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public boolean isActionGoalCompletion(int i) {
                return inboxMessage.isActionGoalCompletion(i);
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public void executeAction(int i, Activity activity) {
                inboxMessage.executeAction(i, activity);
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public int getActionType(int i) {
                switch (AnonymousClass4.$SwitchMap$com$helpshift$campaigns$models$InboxMessage$INBOX_MESSAGE_ACTION_TYPE[inboxMessage.getActionType(i).ordinal()]) {
                    case 1:
                        return HelpshiftInboxMessageActionType.OPEN_DEEP_LINK.getValue();
                    case 2:
                        return HelpshiftInboxMessageActionType.SHOW_FAQS.getValue();
                    case 3:
                        return HelpshiftInboxMessageActionType.SHOW_FAQ_SECTION.getValue();
                    case 4:
                        return HelpshiftInboxMessageActionType.SHOW_CONVERSATION.getValue();
                    case 5:
                        return HelpshiftInboxMessageActionType.SHOW_SINGLE_FAQ.getValue();
                    case 6:
                        return HelpshiftInboxMessageActionType.SHOW_ALERT_TO_RATE_APP.getValue();
                    default:
                        return HelpshiftInboxMessageActionType.UNKNOWN.getValue();
                }
            }

            @Override // com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage
            public String getActionData(int i) {
                return inboxMessage.getActionData(i);
            }
        };
    }

    /* JADX INFO: renamed from: com.helpshift.xamarin.campaigns.HelpshiftInbox$4, reason: invalid class name */
    static /* synthetic */ class AnonymousClass4 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$campaigns$models$InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

        static {
            int[] iArr = new int[InboxMessage.INBOX_MESSAGE_ACTION_TYPE.values().length];
            $SwitchMap$com$helpshift$campaigns$models$InboxMessage$INBOX_MESSAGE_ACTION_TYPE = iArr;
            try {
                iArr[InboxMessage.INBOX_MESSAGE_ACTION_TYPE.OPEN_DEEP_LINK.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$campaigns$models$InboxMessage$INBOX_MESSAGE_ACTION_TYPE[InboxMessage.INBOX_MESSAGE_ACTION_TYPE.SHOW_FAQS.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$campaigns$models$InboxMessage$INBOX_MESSAGE_ACTION_TYPE[InboxMessage.INBOX_MESSAGE_ACTION_TYPE.SHOW_FAQ_SECTION.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$campaigns$models$InboxMessage$INBOX_MESSAGE_ACTION_TYPE[InboxMessage.INBOX_MESSAGE_ACTION_TYPE.SHOW_CONVERSATION.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$helpshift$campaigns$models$InboxMessage$INBOX_MESSAGE_ACTION_TYPE[InboxMessage.INBOX_MESSAGE_ACTION_TYPE.SHOW_SINGLE_FAQ.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$helpshift$campaigns$models$InboxMessage$INBOX_MESSAGE_ACTION_TYPE[InboxMessage.INBOX_MESSAGE_ACTION_TYPE.SHOW_ALERT_TO_RATE_APP.ordinal()] = 6;
            } catch (NoSuchFieldError unused6) {
            }
        }
    }
}
