package com.helpshift.support.conversations.messages;

import android.content.Context;
import com.helpshift.R;
import com.helpshift.configuration.domainmodel.SDKConfigurationDM;
import com.helpshift.conversation.activeconversation.message.Author;
import com.helpshift.conversation.activeconversation.message.MessageDM;
import com.helpshift.support.imageloader.ImageLoader;
import com.helpshift.util.HelpshiftContext;
import com.helpshift.util.StringUtils;
import com.helpshift.util.ValuePair;
import com.helpshift.views.CircleImageView;

/* JADX INFO: loaded from: classes2.dex */
public class AvatarImageLoader {
    static void loadAvatarImageAccordingToState(Context context, MessageDM messageDM, CircleImageView circleImageView) {
        SDKConfigurationDM sDKConfigurationDM = HelpshiftContext.getCoreApi().getSDKConfigurationDM();
        MessageDM.AvatarImageDownloadState avatarImageState = messageDM.getAvatarImageState();
        int localFallbackImage = getLocalFallbackImage(messageDM.author.role);
        ValuePair<String, String> authorAvatarActualImage = getAuthorAvatarActualImage(messageDM);
        String str = authorAvatarActualImage.first;
        String str2 = authorAvatarActualImage.second;
        int width = circleImageView.getWidth();
        if (width == 0) {
            width = context.getResources().getDimensionPixelSize(R.dimen.hs__author_avatar_size);
        }
        int i = AnonymousClass1.$SwitchMap$com$helpshift$conversation$activeconversation$message$MessageDM$AvatarImageDownloadState[avatarImageState.ordinal()];
        if (i != 1 && i != 2 && i != 3) {
            if (i != 4) {
                return;
            }
            circleImageView.setTag(sDKConfigurationDM.getAvatarImageUrl(messageDM.author.authorId));
            ImageLoader.getInstance().loadImageWithoutSampling(str, circleImageView, context.getResources().getDrawable(localFallbackImage), width);
            return;
        }
        if (StringUtils.isNotEmpty(str2)) {
            circleImageView.setTag(getFallbackImageURL(messageDM.author.role));
            ImageLoader.getInstance().loadImageWithoutSampling(str2, circleImageView, context.getResources().getDrawable(localFallbackImage), width);
        } else {
            circleImageView.setTag(Integer.valueOf(localFallbackImage));
            circleImageView.setImageResource(localFallbackImage);
        }
    }

    private static ValuePair<String, String> getAuthorAvatarActualImage(MessageDM messageDM) {
        String str;
        String authorAvatarFallbackImage = messageDM.getAuthorAvatarFallbackImage();
        Author.AuthorRole authorRole = messageDM.author.role;
        if (authorRole == Author.AuthorRole.AGENT && messageDM.shouldShowPersonalisedAgentAvatar()) {
            str = messageDM.author.localAvatarImagePath;
        } else if (authorRole == Author.AuthorRole.BOT && messageDM.shouldShowPersonalisedBotAvatar()) {
            str = messageDM.author.localAvatarImagePath;
        } else {
            Author.AuthorRole authorRole2 = Author.AuthorRole.SYSTEM;
            str = authorAvatarFallbackImage;
        }
        return new ValuePair<>(str, authorAvatarFallbackImage);
    }

    /* JADX INFO: renamed from: com.helpshift.support.conversations.messages.AvatarImageLoader$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole;
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageDM$AvatarImageDownloadState;

        static {
            int[] iArr = new int[Author.AuthorRole.values().length];
            $SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole = iArr;
            try {
                iArr[Author.AuthorRole.SYSTEM.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole[Author.AuthorRole.BOT.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole[Author.AuthorRole.AGENT.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            int[] iArr2 = new int[MessageDM.AvatarImageDownloadState.values().length];
            $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageDM$AvatarImageDownloadState = iArr2;
            try {
                iArr2[MessageDM.AvatarImageDownloadState.AVATAR_IMAGE_DOWNLOAD_FAILED.ordinal()] = 1;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageDM$AvatarImageDownloadState[MessageDM.AvatarImageDownloadState.AVATAR_IMAGE_NOT_PRESENT.ordinal()] = 2;
            } catch (NoSuchFieldError unused5) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageDM$AvatarImageDownloadState[MessageDM.AvatarImageDownloadState.AVATAR_IMAGE_DOWNLOADING.ordinal()] = 3;
            } catch (NoSuchFieldError unused6) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$MessageDM$AvatarImageDownloadState[MessageDM.AvatarImageDownloadState.AVATAR_IMAGE_DOWNLOADED.ordinal()] = 4;
            } catch (NoSuchFieldError unused7) {
            }
        }
    }

    private static int getLocalFallbackImage(Author.AuthorRole authorRole) {
        int i = AnonymousClass1.$SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole[authorRole.ordinal()];
        if (i == 1) {
            return R.drawable.hs__default_support_avatar;
        }
        if (i == 2) {
            return R.drawable.hs__default_bot_avatar;
        }
        if (i == 3) {
            return R.drawable.hs__default_agent_avatar;
        }
        return R.drawable.hs__default_support_avatar;
    }

    public static void loadConversationHeaderAvatarImage(Context context, CircleImageView circleImageView, String str) {
        if (StringUtils.isNotEmpty(str)) {
            ImageLoader.getInstance().loadImageWithoutSampling(str, circleImageView, context.getResources().getDrawable(R.drawable.hs__default_support_avatar), circleImageView.getWidth() == 0 ? context.getResources().getDimensionPixelSize(R.dimen.hs__author_avatar_size) : circleImageView.getWidth());
        } else {
            circleImageView.setImageResource(R.drawable.hs__default_support_avatar);
        }
    }

    private static String getFallbackImageURL(Author.AuthorRole authorRole) {
        SDKConfigurationDM sDKConfigurationDM = HelpshiftContext.getCoreApi().getSDKConfigurationDM();
        int i = AnonymousClass1.$SwitchMap$com$helpshift$conversation$activeconversation$message$Author$AuthorRole[authorRole.ordinal()];
        if (i == 2) {
            return sDKConfigurationDM.getBotFallbackImageUrl();
        }
        if (i == 3) {
            return sDKConfigurationDM.getAgentFallbackImageUrl();
        }
        return sDKConfigurationDM.getConversationHeaderImageUrl();
    }
}
