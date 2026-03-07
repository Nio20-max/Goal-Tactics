.class final Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader$2;
.super Ljava/lang/Object;
.source "AvatarImageDownloader.java"

# interfaces
.implements Lcom/helpshift/common/util/DownloadUtil$OnFileDownloadFinishListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader;->downloadAndSaveFallbackImage(Lcom/helpshift/common/platform/Platform;Lcom/helpshift/common/domain/Domain;Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;


# direct methods
.method constructor <init>(Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;)V
    .locals 0

    .line 202
    iput-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader$2;->val$sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFileDownloadFailure(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 210
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader$2;->val$sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    const-string p2, ""

    invoke-virtual {p1, p2, p3}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->storeDownloadedImage(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onFileDownloadSuccess(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 205
    iget-object p1, p0, Lcom/helpshift/conversation/activeconversation/message/AvatarImageDownloader$2;->val$sdkConfigurationDM:Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;

    invoke-virtual {p1, p2, p4}, Lcom/helpshift/configuration/domainmodel/SDKConfigurationDM;->storeDownloadedImage(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
