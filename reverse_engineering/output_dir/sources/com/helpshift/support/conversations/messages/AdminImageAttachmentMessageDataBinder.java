package com.helpshift.support.conversations.messages;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.helpshift.R;
import com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM;
import com.helpshift.support.views.HSRoundedImageView;
import com.helpshift.util.Styles;

/* JADX INFO: loaded from: classes2.dex */
class AdminImageAttachmentMessageDataBinder extends MessageViewDataBinder<ViewHolder, AdminImageAttachmentMessageDM> {
    AdminImageAttachmentMessageDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(this.context).inflate(R.layout.hs__msg_attachment_image, viewGroup, false));
    }

    /* JADX INFO: renamed from: com.helpshift.support.conversations.messages.AdminImageAttachmentMessageDataBinder$2, reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminImageAttachmentMessageDM$AdminImageAttachmentState;

        static {
            int[] iArr = new int[AdminImageAttachmentMessageDM.AdminImageAttachmentState.values().length];
            $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminImageAttachmentMessageDM$AdminImageAttachmentState = iArr;
            try {
                iArr[AdminImageAttachmentMessageDM.AdminImageAttachmentState.DOWNLOAD_NOT_STARTED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminImageAttachmentMessageDM$AdminImageAttachmentState[AdminImageAttachmentMessageDM.AdminImageAttachmentState.THUMBNAIL_DOWNLOADING.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminImageAttachmentMessageDM$AdminImageAttachmentState[AdminImageAttachmentMessageDM.AdminImageAttachmentState.THUMBNAIL_DOWNLOADED.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminImageAttachmentMessageDM$AdminImageAttachmentState[AdminImageAttachmentMessageDM.AdminImageAttachmentState.IMAGE_DOWNLOADING.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminImageAttachmentMessageDM$AdminImageAttachmentState[AdminImageAttachmentMessageDM.AdminImageAttachmentState.IMAGE_DOWNLOADED.ordinal()] = 5;
            } catch (NoSuchFieldError unused5) {
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00ed  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x010c  */
    /* JADX WARN: Removed duplicated region for block: B:37:? A[RETURN, SYNTHETIC] */
    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void bind(com.helpshift.support.conversations.messages.AdminImageAttachmentMessageDataBinder.ViewHolder r12, final com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM r13) {
        /*
            Method dump skipped, instruction units count: 278
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.conversations.messages.AdminImageAttachmentMessageDataBinder.bind(com.helpshift.support.conversations.messages.AdminImageAttachmentMessageDataBinder$ViewHolder, com.helpshift.conversation.activeconversation.message.AdminImageAttachmentMessageDM):void");
    }

    protected final class ViewHolder extends RecyclerView.ViewHolder {
        final View downloadButtonView;
        final View downloadProgressbarContainer;
        final TextView fileSize;
        final View messageContainer;
        final View messageLayout;
        final ProgressBar progressBarView;
        final HSRoundedImageView roundedImageView;

        ViewHolder(View view) {
            super(view);
            this.messageLayout = view.findViewById(R.id.admin_image_message_layout);
            this.roundedImageView = (HSRoundedImageView) view.findViewById(R.id.admin_attachment_imageview);
            this.downloadButtonView = view.findViewById(R.id.download_button);
            this.downloadProgressbarContainer = view.findViewById(R.id.download_progressbar_container);
            ProgressBar progressBar = (ProgressBar) view.findViewById(R.id.download_attachment_progressbar);
            this.progressBarView = progressBar;
            this.fileSize = (TextView) view.findViewById(R.id.attachment_file_size);
            this.messageContainer = view.findViewById(R.id.admin_image_attachment_message_container);
            Styles.setColorFilter(AdminImageAttachmentMessageDataBinder.this.context, ((ImageView) view.findViewById(R.id.hs_download_foreground_view)).getDrawable(), R.attr.hs__chatBubbleMediaBackgroundColor);
            com.helpshift.support.util.Styles.setAccentColor(AdminImageAttachmentMessageDataBinder.this.context, progressBar.getIndeterminateDrawable());
        }
    }
}
