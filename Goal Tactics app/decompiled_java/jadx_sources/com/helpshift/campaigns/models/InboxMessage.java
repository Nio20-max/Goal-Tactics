package com.helpshift.campaigns.models;

import android.app.Activity;
import android.graphics.Bitmap;

/* JADX INFO: loaded from: classes.dex */
public interface InboxMessage {
    public static final long NO_EXPIRY_TIME_STAMP = Long.MAX_VALUE;

    public enum INBOX_MESSAGE_ACTION_TYPE {
        UNKNOWN,
        OPEN_DEEP_LINK,
        SHOW_FAQS,
        SHOW_FAQ_SECTION,
        SHOW_CONVERSATION,
        SHOW_SINGLE_FAQ,
        SHOW_ALERT_TO_RATE_APP
    }

    void executeAction(int i, Activity activity);

    String getActionData(int i);

    String getActionTitle(int i);

    String getActionTitleColor(int i);

    INBOX_MESSAGE_ACTION_TYPE getActionType(int i);

    String getBackgroundColor();

    String getBody();

    String getBodyColor();

    int getCountOfActions();

    Bitmap getCoverImage();

    long getCreatedAt();

    long getExpiryTimeStamp();

    Bitmap getIconImage();

    String getIdentifier();

    boolean getReadStatus();

    boolean getSeenStatus();

    String getTitle();

    String getTitleColor();

    boolean isActionGoalCompletion(int i);
}
