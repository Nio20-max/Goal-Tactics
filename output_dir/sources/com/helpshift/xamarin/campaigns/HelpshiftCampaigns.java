package com.helpshift.xamarin.campaigns;

import android.app.Activity;
import com.helpshift.campaigns.Campaigns;
import com.helpshift.campaigns.delegates.InboxMessageDelegate;
import com.helpshift.campaigns.models.CampaignDetailModel;
import com.helpshift.campaigns.models.InboxMessage;
import com.helpshift.util.HSLogger;
import com.helpshift.xamarin.campaigns.models.HelpshiftInboxMessage;
import java.util.Date;
import java.util.Map;

/* JADX INFO: loaded from: classes2.dex */
public class HelpshiftCampaigns {
    private static final String TAG = "Helpshift_XamCampaigns";
    private static HelpshiftCampaignsDelegate campaignsDelegate;

    private HelpshiftCampaigns() {
    }

    public static boolean addProperty(String str, String str2) {
        return Campaigns.addProperty(str, str2);
    }

    public static boolean addProperty(String str, Integer num) {
        return Campaigns.addProperty(str, num);
    }

    public static boolean addProperty(String str, Boolean bool) {
        return Campaigns.addProperty(str, bool);
    }

    public static boolean addProperty(String str, Date date) {
        return Campaigns.addProperty(str, date);
    }

    public static boolean addProperty(String str, Long l) {
        return Campaigns.addProperty(str, l);
    }

    public static String[] addProperties(Map<String, Object> map) {
        return Campaigns.addProperties(map);
    }

    public static void showInbox(Activity activity) {
        Campaigns.showInbox(activity);
    }

    public static void showMessage(String str, Activity activity) {
        Campaigns.showMessage(str, activity);
    }

    public static int getCountOfUnreadMessages() {
        return Campaigns.getCountOfUnreadMessages();
    }

    public static void setInboxMessageDelegate(final HelpshiftInboxMessageDelegate helpshiftInboxMessageDelegate) {
        InboxMessageDelegate inboxMessageDelegate = new InboxMessageDelegate() { // from class: com.helpshift.xamarin.campaigns.HelpshiftCampaigns.1
            @Override // com.helpshift.campaigns.delegates.InboxMessageDelegate
            public void inboxMessageAdded(final InboxMessage inboxMessage) {
                HelpshiftInboxMessage helpshiftInboxMessage = new HelpshiftInboxMessage() { // from class: com.helpshift.xamarin.campaigns.HelpshiftCampaigns.1.1
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
                        switch (AnonymousClass3.$SwitchMap$com$helpshift$campaigns$models$InboxMessage$INBOX_MESSAGE_ACTION_TYPE[inboxMessage.getActionType(i).ordinal()]) {
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
                HSLogger.d(HelpshiftCampaigns.TAG, "Converting InboxMessage : " + inboxMessage + " to HelpshiftInboxMessage : " + helpshiftInboxMessage);
                helpshiftInboxMessageDelegate.inboxMessageAdded(helpshiftInboxMessage);
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
        Campaigns.setInboxMessageDelegate(inboxMessageDelegate);
    }

    /* JADX INFO: renamed from: com.helpshift.xamarin.campaigns.HelpshiftCampaigns$3, reason: invalid class name */
    static /* synthetic */ class AnonymousClass3 {
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

    public static void setCampaignsDelegate(HelpshiftCampaignsDelegate helpshiftCampaignsDelegate) {
        campaignsDelegate = helpshiftCampaignsDelegate;
        Campaigns.setDelegate(new Campaigns.Delegate() { // from class: com.helpshift.xamarin.campaigns.HelpshiftCampaigns.2
            @Override // com.helpshift.campaigns.Campaigns.Delegate
            public void sessionBegan() {
                HelpshiftCampaigns.campaignsDelegate.sessionBegan();
            }

            @Override // com.helpshift.campaigns.Campaigns.Delegate
            public void sessionEnded() {
                HelpshiftCampaigns.campaignsDelegate.sessionEnded();
            }
        });
    }

    public static void requestUnreadMessagesCount() {
        HelpshiftCampaignsDelegate helpshiftCampaignsDelegate = campaignsDelegate;
        if (helpshiftCampaignsDelegate != null) {
            helpshiftCampaignsDelegate.didReceiveUnreadMessagesCount(getCountOfUnreadMessages());
        }
    }

    public static void configure(Map map) {
        Campaigns.configure(map);
    }
}
