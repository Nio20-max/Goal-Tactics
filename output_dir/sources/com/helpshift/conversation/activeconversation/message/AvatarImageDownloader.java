package com.helpshift.conversation.activeconversation.message;

import com.helpshift.common.domain.Domain;
import com.helpshift.common.domain.network.HSUrlMetadata;
import com.helpshift.common.domain.network.NetworkErrorCodes;
import com.helpshift.common.platform.Platform;
import com.helpshift.common.util.DownloadUtil;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.util.FileUtil;
import com.helpshift.util.StringUtils;

/* JADX INFO: loaded from: classes2.dex */
public class AvatarImageDownloader {
    public static void downloadAvatarImage(Platform platform, Domain domain, MessageDM messageDM) {
        String avatarImageUrl = domain.getSDKConfigurationDM().getAvatarImageUrl(messageDM.author.authorId);
        if (StringUtils.isNotEmpty(avatarImageUrl)) {
            HSUrlMetadata urlMetadata = getUrlMetadata(platform, avatarImageUrl);
            long j = urlMetadata != null ? urlMetadata.lastFetchTimestamp : 0L;
            boolean z = urlMetadata != null && urlMetadata.isLastFetchSuccessful;
            if (System.currentTimeMillis() - j > domain.getSDKConfigurationDM().getAvatarCacheExpiry()) {
                downloadAvatarImageInternal(platform, domain, avatarImageUrl, urlMetadata, true, messageDM);
                return;
            } else if (z) {
                downloadAvatarImageInternal(platform, domain, avatarImageUrl, urlMetadata, false, messageDM);
                return;
            } else {
                messageDM.setAvatarImageState(MessageDM.AvatarImageDownloadState.AVATAR_IMAGE_DOWNLOAD_FAILED);
                return;
            }
        }
        updateMessageDm(platform, messageDM.getAuthorAvatarFallbackImage(), messageDM);
        messageDM.setAvatarImageState(MessageDM.AvatarImageDownloadState.AVATAR_IMAGE_DOWNLOADED);
    }

    private static void downloadAvatarImageInternal(final Platform platform, Domain domain, final String str, HSUrlMetadata hSUrlMetadata, final boolean z, final MessageDM messageDM) {
        messageDM.setAvatarImageState(MessageDM.AvatarImageDownloadState.AVATAR_IMAGE_DOWNLOADING);
        DownloadUtil.downloadFile(platform, domain, z, str, str, hSUrlMetadata != null ? hSUrlMetadata.etag : "", new DownloadUtil.OnFileDownloadFinishListener() { // from class: com.helpshift.conversation.activeconversation.message.AvatarImageDownloader.1
            @Override // com.helpshift.common.util.DownloadUtil.OnFileDownloadFinishListener
            public void onFileDownloadSuccess(String str2, String str3, String str4, String str5) {
                if (z) {
                    AvatarImageDownloader.insertOrUpdateUrlMetadata(platform, str, str4, true);
                    FileUtil.deleteFile(messageDM.author.localAvatarImagePath);
                }
                AvatarImageDownloader.updateMessageDm(platform, str3, messageDM);
                messageDM.setAvatarImageState(MessageDM.AvatarImageDownloadState.AVATAR_IMAGE_DOWNLOADED);
            }

            @Override // com.helpshift.common.util.DownloadUtil.OnFileDownloadFinishListener
            public void onFileDownloadFailure(String str2, int i, String str3) {
                if (i == NetworkErrorCodes.CONTENT_UNCHANGED.intValue()) {
                    if (z) {
                        AvatarImageDownloader.updateLastFetchTimestampAndStatus(platform, str2);
                    }
                    messageDM.setAvatarImageState(MessageDM.AvatarImageDownloadState.AVATAR_IMAGE_DOWNLOADED);
                } else {
                    if (z) {
                        AvatarImageDownloader.insertOrUpdateUrlMetadata(platform, str2, "", false);
                        FileUtil.deleteFile(messageDM.author.localAvatarImagePath);
                    }
                    AvatarImageDownloader.updateMessageDm(platform, "", messageDM);
                    messageDM.setAvatarImageState(MessageDM.AvatarImageDownloadState.AVATAR_IMAGE_DOWNLOAD_FAILED);
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void updateMessageDm(Platform platform, String str, MessageDM messageDM) {
        messageDM.author.localAvatarImagePath = str;
        platform.getConversationDAO().insertOrUpdateMessage(messageDM);
    }

    private static HSUrlMetadata getUrlMetadata(Platform platform, String str) {
        return platform.getHSNetworkMetadataDAO().getMetadataOfUrl(str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void insertOrUpdateUrlMetadata(Platform platform, String str, String str2, boolean z) {
        platform.getHSNetworkMetadataDAO().insertOrUpdateMetadataForUrl(str, new HSUrlMetadata(str, str2, System.currentTimeMillis(), z));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void updateLastFetchTimestampAndStatus(Platform platform, String str) {
        platform.getHSNetworkMetadataDAO().updateLastFetchTimestampAndFetchStateOfUrl(str, System.currentTimeMillis(), true);
    }

    public static void downloadAgentFallbackImage(Platform platform, Domain domain) {
        SDKConfigurationDM sDKConfigurationDM = domain.getSDKConfigurationDM();
        downloadAndSaveFallbackImage(platform, domain, sDKConfigurationDM, sDKConfigurationDM.getAgentFallbackImageUrl(), SDKConfigurationDM.AGENT_FALLBACK_IMAGE_URL);
    }

    public static void downloadBotFallbackImage(Platform platform, Domain domain) {
        SDKConfigurationDM sDKConfigurationDM = domain.getSDKConfigurationDM();
        downloadAndSaveFallbackImage(platform, domain, sDKConfigurationDM, sDKConfigurationDM.getBotFallbackImageUrl(), SDKConfigurationDM.BOT_FALLBACK_IMAGE_URL);
    }

    public static void downloadConversationHeaderImage(Platform platform, Domain domain) {
        SDKConfigurationDM sDKConfigurationDM = domain.getSDKConfigurationDM();
        downloadAndSaveFallbackImage(platform, domain, sDKConfigurationDM, sDKConfigurationDM.getConversationHeaderImageUrl(), SDKConfigurationDM.HEADER_IMAGE_URL);
    }

    public static void retryFallbackImagesDownload(Platform platform, Domain domain) {
        SDKConfigurationDM sDKConfigurationDM = domain.getSDKConfigurationDM();
        if (sDKConfigurationDM.isAvatarEnabledInChatFeed()) {
            if (StringUtils.isEmpty(sDKConfigurationDM.getAgentFallbackImageLocalPath())) {
                downloadAgentFallbackImage(platform, domain);
            }
            if (StringUtils.isEmpty(sDKConfigurationDM.getBotFallbackImageLocalPath())) {
                downloadBotFallbackImage(platform, domain);
            }
            if (StringUtils.isEmpty(sDKConfigurationDM.getConversationHeaderImageLocalPath())) {
                downloadConversationHeaderImage(platform, domain);
            }
        }
    }

    private static void downloadAndSaveFallbackImage(Platform platform, Domain domain, final SDKConfigurationDM sDKConfigurationDM, String str, String str2) {
        DownloadUtil.downloadFile(platform, domain, str, str2, new DownloadUtil.OnFileDownloadFinishListener() { // from class: com.helpshift.conversation.activeconversation.message.AvatarImageDownloader.2
            @Override // com.helpshift.common.util.DownloadUtil.OnFileDownloadFinishListener
            public void onFileDownloadSuccess(String str3, String str4, String str5, String str6) {
                sDKConfigurationDM.storeDownloadedImage(str4, str6);
            }

            @Override // com.helpshift.common.util.DownloadUtil.OnFileDownloadFinishListener
            public void onFileDownloadFailure(String str3, int i, String str4) {
                sDKConfigurationDM.storeDownloadedImage("", str4);
            }
        });
    }
}
