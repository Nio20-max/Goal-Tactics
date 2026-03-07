.class public final enum Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;
.super Ljava/lang/Enum;
.source "MessageDM.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/helpshift/conversation/activeconversation/message/MessageDM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AvatarImageDownloadState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

.field public static final enum AVATAR_IMAGE_DOWNLOADED:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

.field public static final enum AVATAR_IMAGE_DOWNLOADING:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

.field public static final enum AVATAR_IMAGE_DOWNLOAD_FAILED:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

.field public static final enum AVATAR_IMAGE_NOT_PRESENT:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 307
    new-instance v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    const-string v1, "AVATAR_IMAGE_DOWNLOAD_FAILED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->AVATAR_IMAGE_DOWNLOAD_FAILED:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    .line 308
    new-instance v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    const-string v3, "AVATAR_IMAGE_NOT_PRESENT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->AVATAR_IMAGE_NOT_PRESENT:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    .line 309
    new-instance v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    const-string v5, "AVATAR_IMAGE_DOWNLOADING"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->AVATAR_IMAGE_DOWNLOADING:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    .line 310
    new-instance v5, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    const-string v7, "AVATAR_IMAGE_DOWNLOADED"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->AVATAR_IMAGE_DOWNLOADED:Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    aput-object v0, v7, v2

    aput-object v1, v7, v4

    aput-object v3, v7, v6

    aput-object v5, v7, v8

    .line 306
    sput-object v7, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->$VALUES:[Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 306
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;
    .locals 1

    .line 306
    const-class v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    return-object p0
.end method

.method public static values()[Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;
    .locals 1

    .line 306
    sget-object v0, Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->$VALUES:[Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    invoke-virtual {v0}, [Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/helpshift/conversation/activeconversation/message/MessageDM$AvatarImageDownloadState;

    return-object v0
.end method
