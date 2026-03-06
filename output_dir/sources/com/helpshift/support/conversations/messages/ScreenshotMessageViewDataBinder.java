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
import com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM;
import com.helpshift.conversation.activeconversation.message.UserMessageState;
import com.helpshift.support.util.Styles;
import com.helpshift.support.views.HSRoundedImageView;

/* JADX INFO: loaded from: classes2.dex */
public class ScreenshotMessageViewDataBinder extends MessageViewDataBinder<ViewHolder, ScreenshotMessageDM> {
    public ScreenshotMessageViewDataBinder(Context context) {
        super(context);
    }

    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    public ViewHolder createViewHolder(ViewGroup viewGroup) {
        return new ViewHolder(LayoutInflater.from(this.context).inflate(R.layout.hs__msg_screenshot_status, viewGroup, false));
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x010a  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0132  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0145  */
    @Override // com.helpshift.support.conversations.messages.MessageViewDataBinder
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void bind(com.helpshift.support.conversations.messages.ScreenshotMessageViewDataBinder.ViewHolder r20, final com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM r21) {
        /*
            Method dump skipped, instruction units count: 345
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.helpshift.support.conversations.messages.ScreenshotMessageViewDataBinder.bind(com.helpshift.support.conversations.messages.ScreenshotMessageViewDataBinder$ViewHolder, com.helpshift.conversation.activeconversation.message.ScreenshotMessageDM):void");
    }

    /* JADX INFO: renamed from: com.helpshift.support.conversations.messages.ScreenshotMessageViewDataBinder$2, reason: invalid class name */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$helpshift$conversation$activeconversation$message$UserMessageState;

        static {
            int[] iArr = new int[UserMessageState.values().length];
            $SwitchMap$com$helpshift$conversation$activeconversation$message$UserMessageState = iArr;
            try {
                iArr[UserMessageState.UNSENT_RETRYABLE.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$UserMessageState[UserMessageState.UNSENT_NOT_RETRYABLE.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$UserMessageState[UserMessageState.SENDING.ordinal()] = 3;
            } catch (NoSuchFieldError unused3) {
            }
            try {
                $SwitchMap$com$helpshift$conversation$activeconversation$message$UserMessageState[UserMessageState.SENT.ordinal()] = 4;
            } catch (NoSuchFieldError unused4) {
            }
        }
    }

    protected final class ViewHolder extends RecyclerView.ViewHolder implements View.OnClickListener {
        final View messageLayout;
        private final ProgressBar progress;
        final ImageView retryButton;
        final HSRoundedImageView roundedImageView;
        final TextView subText;

        ViewHolder(View view) {
            super(view);
            this.messageLayout = view.findViewById(R.id.user_image_message_layout);
            ProgressBar progressBar = (ProgressBar) view.findViewById(R.id.upload_attachment_progressbar);
            this.progress = progressBar;
            this.roundedImageView = (HSRoundedImageView) view.findViewById(R.id.user_attachment_imageview);
            this.subText = (TextView) view.findViewById(R.id.date);
            this.retryButton = (ImageView) view.findViewById(R.id.user_message_retry_button);
            Styles.setAccentColor(ScreenshotMessageViewDataBinder.this.context, progressBar.getIndeterminateDrawable());
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            if (ScreenshotMessageViewDataBinder.this.messageClickListener != null) {
                ScreenshotMessageViewDataBinder.this.messageClickListener.retryMessage(getAdapterPosition());
            }
        }
    }
}
