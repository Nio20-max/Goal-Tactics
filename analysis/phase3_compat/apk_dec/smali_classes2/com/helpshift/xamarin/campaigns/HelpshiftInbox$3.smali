.class final Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;
.super Ljava/lang/Object;
.source "HelpshiftInbox.java"

# interfaces
.implements Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/xamarin/campaigns/HelpshiftInbox;->convertToXamarinInboxMessage(Lcom/helpshift/campaigns/models/InboxMessage;)Lcom/helpshift/xamarin/campaigns/models/HelpshiftInboxMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;


# direct methods
.method constructor <init>(Lcom/helpshift/campaigns/models/InboxMessage;)V
    .locals 0

    .line 115
    iput-object p1, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public executeAction(ILandroid/app/Activity;)V
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0, p1, p2}, Lcom/helpshift/campaigns/models/InboxMessage;->executeAction(ILandroid/app/Activity;)V

    return-void
.end method

.method public getActionData(I)Ljava/lang/String;
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/models/InboxMessage;->getActionData(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getActionTitle(I)Ljava/lang/String;
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/models/InboxMessage;->getActionTitle(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getActionTitleColor(I)Ljava/lang/String;
    .locals 1

    .line 193
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/models/InboxMessage;->getActionTitleColor(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getActionType(I)I
    .locals 1

    .line 208
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/models/InboxMessage;->getActionType(I)Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;

    move-result-object p1

    .line 210
    sget-object v0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$4;->$SwitchMap$com$helpshift$campaigns$models$InboxMessage$INBOX_MESSAGE_ACTION_TYPE:[I

    invoke-virtual {p1}, Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    .line 224
    sget-object p1, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->UNKNOWN:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    invoke-virtual {p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->getValue()I

    move-result p1

    return p1

    .line 222
    :pswitch_0
    sget-object p1, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->SHOW_ALERT_TO_RATE_APP:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    invoke-virtual {p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->getValue()I

    move-result p1

    return p1

    .line 220
    :pswitch_1
    sget-object p1, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->SHOW_SINGLE_FAQ:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    invoke-virtual {p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->getValue()I

    move-result p1

    return p1

    .line 218
    :pswitch_2
    sget-object p1, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->SHOW_CONVERSATION:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    invoke-virtual {p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->getValue()I

    move-result p1

    return p1

    .line 216
    :pswitch_3
    sget-object p1, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->SHOW_FAQ_SECTION:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    invoke-virtual {p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->getValue()I

    move-result p1

    return p1

    .line 214
    :pswitch_4
    sget-object p1, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->SHOW_FAQS:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    invoke-virtual {p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->getValue()I

    move-result p1

    return p1

    .line 212
    :pswitch_5
    sget-object p1, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->OPEN_DEEP_LINK:Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;

    invoke-virtual {p1}, Lcom/helpshift/xamarin/campaigns/HelpshiftInboxMessageActionType;->getValue()I

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getBackgroundColor()Ljava/lang/String;
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0}, Lcom/helpshift/campaigns/models/InboxMessage;->getBackgroundColor()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0}, Lcom/helpshift/campaigns/models/InboxMessage;->getBody()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBodyColor()Ljava/lang/String;
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0}, Lcom/helpshift/campaigns/models/InboxMessage;->getBodyColor()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCountOfActions()I
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0}, Lcom/helpshift/campaigns/models/InboxMessage;->getCountOfActions()I

    move-result v0

    return v0
.end method

.method public getCoverImage()Ljava/lang/String;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    check-cast v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    iget-object v0, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->coverImageFilePath:Ljava/lang/String;

    return-object v0
.end method

.method public getCreatedAt()J
    .locals 2

    .line 158
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0}, Lcom/helpshift/campaigns/models/InboxMessage;->getCreatedAt()J

    move-result-wide v0

    return-wide v0
.end method

.method public getExpiryTimeStamp()J
    .locals 2

    .line 163
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0}, Lcom/helpshift/campaigns/models/InboxMessage;->getExpiryTimeStamp()J

    move-result-wide v0

    return-wide v0
.end method

.method public getIconImage()Ljava/lang/String;
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    check-cast v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;

    iget-object v0, v0, Lcom/helpshift/campaigns/models/CampaignDetailModel;->iconImageFilePath:Ljava/lang/String;

    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0}, Lcom/helpshift/campaigns/models/InboxMessage;->getIdentifier()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getReadStatus()Z
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0}, Lcom/helpshift/campaigns/models/InboxMessage;->getReadStatus()Z

    move-result v0

    return v0
.end method

.method public getSeenStatus()Z
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0}, Lcom/helpshift/campaigns/models/InboxMessage;->getSeenStatus()Z

    move-result v0

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0}, Lcom/helpshift/campaigns/models/InboxMessage;->getTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTitleColor()Ljava/lang/String;
    .locals 1

    .line 138
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0}, Lcom/helpshift/campaigns/models/InboxMessage;->getTitleColor()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasExpiryTimeStamp()Z
    .locals 5

    .line 168
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0}, Lcom/helpshift/campaigns/models/InboxMessage;->getExpiryTimeStamp()J

    move-result-wide v0

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isActionGoalCompletion(I)Z
    .locals 1

    .line 198
    iget-object v0, p0, Lcom/helpshift/xamarin/campaigns/HelpshiftInbox$3;->val$inboxMessage:Lcom/helpshift/campaigns/models/InboxMessage;

    invoke-interface {v0, p1}, Lcom/helpshift/campaigns/models/InboxMessage;->isActionGoalCompletion(I)Z

    move-result p1

    return p1
.end method
