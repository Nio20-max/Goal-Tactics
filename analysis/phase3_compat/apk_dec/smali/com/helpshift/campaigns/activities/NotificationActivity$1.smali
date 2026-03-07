.class synthetic Lcom/helpshift/campaigns/activities/NotificationActivity$1;
.super Ljava/lang/Object;
.source "NotificationActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/campaigns/activities/NotificationActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$helpshift$enums$ACTION_TYPE:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 45
    invoke-static {}, Lcom/helpshift/enums/ACTION_TYPE;->values()[Lcom/helpshift/enums/ACTION_TYPE;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/helpshift/campaigns/activities/NotificationActivity$1;->$SwitchMap$com$helpshift$enums$ACTION_TYPE:[I

    :try_start_0
    sget-object v1, Lcom/helpshift/enums/ACTION_TYPE;->SHOW_INBOX:Lcom/helpshift/enums/ACTION_TYPE;

    invoke-virtual {v1}, Lcom/helpshift/enums/ACTION_TYPE;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
