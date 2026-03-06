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
import com.helpshift.conversation.activeconversation.message.AdminAttachmentMessageDM;
import com.helpshift.util.Styles;

/* JADX INFO: loaded from: classes2.dex */
class AdminAttachmentMessageDataBinder extends MessageViewDataBinder<ViewHolder, AdminAttachmentMessageDM> {
    AdminAttachmentMessageDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(this.context).inflate(R.layout.hs__msg_attachment_generic, viewGroup, false));
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:16:? A[RETURN, SYNTHETIC] */
    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void bind(com.helpshift.support.conversations.messages.AdminAttachmentMessageDataBinder.ViewHolder r10, final com.helpshift.conversation.activeconversation.message.AdminAttachmentMessageDM r11) {
        /*
            r9 = this;
            android.content.Context r0 = r9.context
            r1 = 16842806(0x1010036, float:2.369371E-38)
            int r0 = com.helpshift.support.util.Styles.getColor(r0, r1)
            java.lang.String r1 = r11.getFormattedFileSize()
            int[] r2 = com.helpshift.support.conversations.messages.AdminAttachmentMessageDataBinder.AnonymousClass2.$SwitchMap$com$helpshift$conversation$activeconversation$message$AdminAttachmentMessageDM$AdminGenericAttachmentState
            com.helpshift.conversation.activeconversation.message.AdminAttachmentMessageDM$AdminGenericAttachmentState r3 = r11.state
            int r3 = r3.ordinal()
            r2 = r2[r3]
            r3 = 2
            r4 = 0
            r5 = 1
            if (r2 == r5) goto L5e
            r6 = 3
            if (r2 == r3) goto L3e
            if (r2 == r6) goto L26
            java.lang.String r2 = ""
            r3 = 0
        L24:
            r5 = 0
            goto L75
        L26:
            android.content.Context r0 = r9.context
            int r2 = com.helpshift.R.attr.colorAccent
            int r0 = com.helpshift.support.util.Styles.getColor(r0, r2)
            android.content.Context r2 = r9.context
            int r3 = com.helpshift.R.string.hs__attachment_downloaded__voice_over
            java.lang.Object[] r6 = new java.lang.Object[r5]
            java.lang.String r7 = r11.fileName
            r6[r4] = r7
            java.lang.String r2 = r2.getString(r3, r6)
            r3 = 0
            goto L75
        L3e:
            java.lang.String r1 = r11.getDownloadProgressAndFileSize()
            android.content.Context r2 = r9.context
            int r7 = com.helpshift.R.string.hs__attachment_downloading_voice_over
            java.lang.Object[] r6 = new java.lang.Object[r6]
            java.lang.String r8 = r11.fileName
            r6[r4] = r8
            java.lang.String r8 = r11.getDownloadedProgressSize()
            r6[r5] = r8
            java.lang.String r8 = r11.getFormattedFileSize()
            r6[r3] = r8
            java.lang.String r2 = r2.getString(r7, r6)
            r3 = 1
            goto L24
        L5e:
            android.content.Context r2 = r9.context
            int r6 = com.helpshift.R.string.hs__attachment_not_downloaded_voice_over
            java.lang.Object[] r3 = new java.lang.Object[r3]
            java.lang.String r7 = r11.fileName
            r3[r4] = r7
            java.lang.String r7 = r11.getFormattedFileSize()
            r3[r5] = r7
            java.lang.String r2 = r2.getString(r6, r3)
            r3 = 0
            r4 = 1
            goto L24
        L75:
            android.view.View r6 = r10.downloadButton
            r9.setViewVisibility(r6, r4)
            android.widget.ImageView r4 = r10.attachmentIcon
            r9.setViewVisibility(r4, r5)
            android.widget.ProgressBar r4 = r10.progress
            r9.setViewVisibility(r4, r3)
            android.widget.TextView r3 = r10.fileName
            java.lang.String r4 = r11.fileName
            r3.setText(r4)
            android.widget.TextView r3 = r10.fileSize
            r3.setText(r1)
            android.widget.TextView r1 = r10.fileName
            r1.setTextColor(r0)
            android.view.View r0 = r10.messageContainer
            com.helpshift.support.conversations.messages.AdminAttachmentMessageDataBinder$1 r1 = new com.helpshift.support.conversations.messages.AdminAttachmentMessageDataBinder$1
            r1.<init>()
            r0.setOnClickListener(r1)
            android.view.View r0 = r10.messageContainer
            r0.setContentDescription(r2)
            android.view.View r0 = r10.messageLayout
            java.lang.String r1 = r9.getAdminMessageContentDesciption(r11)
            r0.setContentDescription(r1)
            boolean r11 = r11.shouldShowAvatar()
            if (r11 == 0) goto Lbc
            android.view.View r10 = r10.messageContainer
            android.view.ViewGroup$LayoutParams r10 = r10.getLayoutParams()
            r9.setAdminMessageLayoutMarginForAvatar(r10)
        Lbc:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.conversations.messages.AdminAttachmentMessageDataBinder.bind(com.helpshift.support.conversations.messages.AdminAttachmentMessageDataBinder$ViewHolder, com.helpshift.conversation.activeconversation.message.AdminAttachmentMessageDM):void");
    }

    /* JADX INFO: renamed from: com.helpshift.support.conversations.messages.AdminAttachmentMessageDataBinder$2, reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminAttachmentMessageDM$AdminGenericAttachmentState;

        static {
            int[] iArr = new int[AdminAttachmentMessageDM.AdminGenericAttachmentState.values().length];
            $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminAttachmentMessageDM$AdminGenericAttachmentState = iArr;
            try {
                iArr[AdminAttachmentMessageDM.AdminGenericAttachmentState.DOWNLOAD_NOT_STARTED.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminAttachmentMessageDM$AdminGenericAttachmentState[AdminAttachmentMessageDM.AdminGenericAttachmentState.DOWNLOADING.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$AdminAttachmentMessageDM$AdminGenericAttachmentState[AdminAttachmentMessageDM.AdminGenericAttachmentState.DOWNLOADED.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
        }
    }

    protected final class ViewHolder extends RecyclerView.ViewHolder {
        final ImageView attachmentIcon;
        final View downloadButton;
        final TextView fileName;
        final TextView fileSize;
        final View messageContainer;
        final View messageLayout;
        final ProgressBar progress;

        ViewHolder(View view) {
            super(view);
            this.messageLayout = view.findViewById(R.id.admin_attachment_message_layout);
            this.fileName = (TextView) view.findViewById(R.id.attachment_file_name);
            this.fileSize = (TextView) view.findViewById(R.id.attachment_file_size);
            View viewFindViewById = view.findViewById(R.id.admin_message);
            this.messageContainer = viewFindViewById;
            this.downloadButton = view.findViewById(R.id.download_button);
            ProgressBar progressBar = (ProgressBar) view.findViewById(R.id.progress);
            this.progress = progressBar;
            ImageView imageView = (ImageView) view.findViewById(R.id.attachment_icon);
            this.attachmentIcon = imageView;
            Styles.setColorFilter(AdminAttachmentMessageDataBinder.this.context, ((ImageView) view.findViewById(R.id.hs_download_foreground_view)).getDrawable(), R.attr.hs__chatBubbleMediaBackgroundColor);
            Styles.setColorFilter(AdminAttachmentMessageDataBinder.this.context, viewFindViewById.getBackground(), R.attr.hs__chatBubbleMediaBackgroundColor);
            com.helpshift.support.util.Styles.setAccentColor(AdminAttachmentMessageDataBinder.this.context, progressBar.getIndeterminateDrawable());
            com.helpshift.support.util.Styles.setAccentColor(AdminAttachmentMessageDataBinder.this.context, imageView.getDrawable());
        }
    }
}
