.class synthetic Lcom/helpshift/support/conversations/ConversationalFragment$18;
.super Ljava/lang/Object;
.source "ConversationalFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/support/conversations/ConversationalFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$helpshift$common$platform$Device$PermissionState:[I

.field static final synthetic $SwitchMap$com$helpshift$support$fragments$AttachmentPreviewFragment$AttachmentAction:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 763
    invoke-static {}, Lcom/helpshift/common/platform/Device$PermissionState;->values()[Lcom/helpshift/common/platform/Device$PermissionState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/helpshift/support/conversations/ConversationalFragment$18;->$SwitchMap$com$helpshift$common$platform$Device$PermissionState:[I

    const/4 v1, 0x1

    :try_start_0
    sget-object v2, Lcom/helpshift/common/platform/Device$PermissionState;->AVAILABLE:Lcom/helpshift/common/platform/Device$PermissionState;

    invoke-virtual {v2}, Lcom/helpshift/common/platform/Device$PermissionState;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :try_start_1
    sget-object v0, Lcom/helpshift/support/conversations/ConversationalFragment$18;->$SwitchMap$com$helpshift$common$platform$Device$PermissionState:[I

    sget-object v2, Lcom/helpshift/common/platform/Device$PermissionState;->UNAVAILABLE:Lcom/helpshift/common/platform/Device$PermissionState;

    invoke-virtual {v2}, Lcom/helpshift/common/platform/Device$PermissionState;->ordinal()I

    move-result v2

    const/4 v3, 0x2

    aput v3, v0, v2
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    :try_start_2
    sget-object v0, Lcom/helpshift/support/conversations/ConversationalFragment$18;->$SwitchMap$com$helpshift$common$platform$Device$PermissionState:[I

    sget-object v2, Lcom/helpshift/common/platform/Device$PermissionState;->REQUESTABLE:Lcom/helpshift/common/platform/Device$PermissionState;

    invoke-virtual {v2}, Lcom/helpshift/common/platform/Device$PermissionState;->ordinal()I

    move-result v2

    const/4 v3, 0x3

    aput v3, v0, v2
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 623
    :catch_2
    invoke-static {}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->values()[Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/helpshift/support/conversations/ConversationalFragment$18;->$SwitchMap$com$helpshift$support$fragments$AttachmentPreviewFragment$AttachmentAction:[I

    :try_start_3
    sget-object v2, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->SEND:Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;

    invoke-virtual {v2}, Lcom/helpshift/support/fragments/AttachmentPreviewFragment$AttachmentAction;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    :catch_3
    return-void
.end method
