package com.helpshift.xamarin.campaigns.models;

import android.app.Activity;

/* JADX INFO: loaded from: classes2.dex */
public interface HelpshiftInboxMessage {
    void executeAction(int i, Activity activity);

    String getActionData(int i);

    String getActionTitle(int i);

    String getActionTitleColor(int i);

    int getActionType(int i);

    String getBackgroundColor();

    String getBody();

    String getBodyColor();

    int getCountOfActions();

    String getCoverImage();

    long getCreatedAt();

    long getExpiryTimeStamp();

    String getIconImage();

    String getIdentifier();

    boolean getReadStatus();

    boolean getSeenStatus();

    String getTitle();

    String getTitleColor();

    boolean hasExpiryTimeStamp();

    boolean isActionGoalCompletion(int i);
}
