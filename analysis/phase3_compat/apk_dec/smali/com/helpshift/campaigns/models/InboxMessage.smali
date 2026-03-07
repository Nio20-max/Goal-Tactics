.class public interface abstract Lcom/helpshift/campaigns/models/InboxMessage;
.super Ljava/lang/Object;
.source "InboxMessage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;
    }
.end annotation


# static fields
.field public static final NO_EXPIRY_TIME_STAMP:J = 0x7fffffffffffffffL


# virtual methods
.method public abstract executeAction(ILandroid/app/Activity;)V
.end method

.method public abstract getActionData(I)Ljava/lang/String;
.end method

.method public abstract getActionTitle(I)Ljava/lang/String;
.end method

.method public abstract getActionTitleColor(I)Ljava/lang/String;
.end method

.method public abstract getActionType(I)Lcom/helpshift/campaigns/models/InboxMessage$INBOX_MESSAGE_ACTION_TYPE;
.end method

.method public abstract getBackgroundColor()Ljava/lang/String;
.end method

.method public abstract getBody()Ljava/lang/String;
.end method

.method public abstract getBodyColor()Ljava/lang/String;
.end method

.method public abstract getCountOfActions()I
.end method

.method public abstract getCoverImage()Landroid/graphics/Bitmap;
.end method

.method public abstract getCreatedAt()J
.end method

.method public abstract getExpiryTimeStamp()J
.end method

.method public abstract getIconImage()Landroid/graphics/Bitmap;
.end method

.method public abstract getIdentifier()Ljava/lang/String;
.end method

.method public abstract getReadStatus()Z
.end method

.method public abstract getSeenStatus()Z
.end method

.method public abstract getTitle()Ljava/lang/String;
.end method

.method public abstract getTitleColor()Ljava/lang/String;
.end method

.method public abstract isActionGoalCompletion(I)Z
.end method
